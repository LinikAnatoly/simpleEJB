unit EditENFuelCard;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENFuelCardController, ExtCtrls, AdvObj ;

type
  TfrmENFuelCardEdit = class(TDialogForm)
  

    HTTPRIOENFuelCard: THTTPRIO;
    Panel1: TPanel;
    lblReg_id: TLabel;
    edtReg_id: TEdit;
    edtTKFuelTypeFuelTypeName: TEdit;
    lblTKFuelTypeFuelTypeName: TLabel;
    spbTKFuelTypeFuelType: TSpeedButton;
    lblFINWorkerFinWorkerName: TLabel;
    edtFINWorkerFinWorkerName: TEdit;
    spbFINWorkerFinWorker: TSpeedButton;
    pnlENFuelCard: TPanel;
    Panel2: TPanel;
    lblCode: TLabel;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOTKFuelType: THTTPRIO;
    edtDateApply: TDateTimePicker;
    lblDateApply: TLabel;
    GroupBox1: TGroupBox;
    sgENFuelCardHistory: TAdvStringGrid;
    HTTPRIOENFuelCardHistory: THTTPRIO;
    spbFINWorkerClear: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
    procedure spbTKFuelTypeFuelTypeClick(Sender: TObject);
    procedure updateHistory;
    procedure spbFINWorkerClearClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENFuelCardEdit: TfrmENFuelCardEdit;
  ENFuelCardObj: ENFuelCard;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
, TKFuelTypeController, ShowTKFuelType, ENConsts, DMReportsUnit,
  FINWorkerKindController, ENFuelCardHistoryController;

      var
      ENFuelCardHistoryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата початку періоду'
          ,'Дата закінчення періоду'
          ,'Водій'
          ,'Рестраційний номер карти'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );
{$R *.dfm}

procedure TfrmENFuelCardEdit.FormShow(Sender: TObject);
var
 TempTKFuelType: TKFuelTypeControllerSoapPort;
 fuelTypeObj: TKFuelType;

 fw : FINWorker;
 Tempfw: FINWorkerControllerSoapPort;
begin
  DisableControls([edtCode , edtTKFuelTypeFuelTypeName  , edtFINWorkerFinWorkerName ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtFINWorkerFinWorkerName
      ,spbFINWorkerFinWorker
       ]);
    HideControls([lblDateApply , edtDateApply ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode , pnlENFuelCard]);

    // при инсерте занесем только номер и тип топлива
    HideControls([spbFINWorkerClear , lblDateApply , edtDateApply , lblFINWorkerFinWorkerName , edtFINWorkerFinWorkerName , spbFINWorkerFinWorker  ]);
  end;

//  if (DialogState = dsEdit) then
//  begin
//
//  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtReg_id
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([edtReg_id]);
    edtCode.Text := IntToStr(ENFuelCardObj.code);
    edtReg_id.Text := ENFuelCardObj.reg_id;

    edtFINWorkerFinWorkerName.Text := ENFuelCardObj.finWorker.name;
    SetDateFieldForDateTimePicker(edtDateApply, ENFuelCardObj.dateApply);

    if ENFuelCardObj.fuelType <> nil then
    begin
      TempTKFuelType := HTTPRIOTKFuelType as TKFuelTypeControllerSoapPort;
      fuelTypeObj := TempTKFuelType.getObject(ENFuelCardObj.fuelType.code);
      if fuelTypeObj <> nil then
        edtTKFuelTypeFuelTypeName.Text := fuelTypeObj.name;
    end;

    updateHistory;
  end;

  if (DialogState = dsEdit  ) then
    begin
      HideControls([spbTKFuelTypeFuelType]);
    end;
end;



procedure TfrmENFuelCardEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelCard: ENFuelCardControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtReg_id

     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    TempENFuelCard := HTTPRIOENFuelCard as ENFuelCardControllerSoapPort;

    ENFuelCardObj.reg_id := edtReg_id.Text;

    ENFuelCardObj.dateApply := GetTXSDateFromTDateTimePicker(edtDateApply);


    if DialogState = dsInsert then
    begin
      ENFuelCardObj.code := Low(Integer);
      TempENFuelCard.add(ENFuelCardObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelCard.save(ENFuelCardObj);
    end;
  end;
end;


procedure TfrmENFuelCardEdit.spbFINWorkerClearClick(Sender: TObject);
begin
 if ENFuelCardObj.finWorker <> nil then
  begin
     ENFuelCardObj.finWorker.code := LOW_INT;
     ENFuelCardObj.finWorker.tabNumber := '';
     edtFINWorkerFinWorkerName.Text := '';

  end;

end;

procedure TfrmENFuelCardEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
{var
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardObj.finWorker = nil then ENFuelCardObj.finWorker := FINWorker.Create();
               ENFuelCardObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end; }
 var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   condition : string;
begin

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

  // + типа только водители ???
  // MDAX-441
  if DMReports.UsesMDAXData then
  begin
    condition := DMReports.getDriversConditionForAX();
  end
  else
   begin
    condition := 'ps.post_id in ' + FKVODILA_POST_ID;
   end;

   f.conditionSQL := condition;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal, f);
   try
      with frmFINWorkerShow do
      begin
        isShowCEO := true;
        DisableActions([actInsert, actEdit, actDelete]);
        if ShowModal = mrOk then
        begin

            try
              if ENFuelCardObj.finWorker = nil then
              begin
               ENFuelCardObj.finWorker := FINWorker.Create;
               ENFuelCardObj.finWorker.code := low(Integer);
              end;

              ENFuelCardObj.finWorker.name := GetReturnValue(sgFINWorker,1);
              ENFuelCardObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
              ENFuelCardObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENFuelCardObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENFuelCardObj.finWorker.positionCode := LOW_INT;

              ENFuelCardObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
              ENFuelCardObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENFuelCardObj.finWorker.priceGen = nil then ENFuelCardObj.finWorker.priceGen := TXSDecimal.Create;
              ENFuelCardObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]);

              ENFuelCardObj.finWorker.kindRef := FINWorkerKindRef.Create;

              ENFuelCardObj.finWorker.categor := LOW_INT;

              ENFuelCardObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENFuelCardObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENFuelCardObj.finWorker.finCode := LOW_INT;

              ENFuelCardObj.finWorker.positionId := GetReturnValue(sgFINWorker,15);

              edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);


            except
               on EConvertError do Exit;
            end;


        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENFuelCardEdit.spbTKFuelTypeFuelTypeClick(Sender: TObject);
var
   frmTKFuelTypeShow: TfrmTKFuelTypeShow;
begin
   frmTKFuelTypeShow:=TfrmTKFuelTypeShow.Create(Application,fmNormal);
   try
      with frmTKFuelTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardObj.fuelType = nil then ENFuelCardObj.fuelType := TKFuelTypeRef.Create();
               ENFuelCardObj.fuelType.code := StrToInt(GetReturnValue(sgTKFuelType,0));
               edtTKFuelTypeFuelTypeName.Text:=GetReturnValue(sgTKFuelType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKFuelTypeShow.Free;
   end;
end;

procedure TfrmENFuelCardEdit.updateHistory;
var
  TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
  i , LastCount , LastRow : Integer;
  ENFuelCardHistoryList: ENFuelCardHistoryShortList;
  fcHistFilter : ENFuelCardHistoryFilter;
begin
  SetGridHeaders(ENFuelCardHistoryHeaders, sgENFuelCardHistory.ColumnHeaders);

  TempENFuelCardHistory :=  HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;


   fcHistFilter := ENFuelCardHistoryFilter.Create;
   SetNullIntProps(fcHistFilter);
   SetNullXSProps(fcHistFilter);

   fcHistFilter.fuelCard := ENFuelCard.Create;
   fcHistFilter.fuelCard.code  := ENFuelCardObj.code;
   fcHistFilter.orderBySQL := ' datestart desc ';


  ENFuelCardHistoryList := TempENFuelCardHistory.getScrollableFilteredList(fcHistFilter,0,-1);
  LastCount:=High(ENFuelCardHistoryList.list);

  if LastCount > -1 then
     sgENFuelCardHistory.RowCount:=LastCount+2
  else
     sgENFuelCardHistory.RowCount:=2;

   with sgENFuelCardHistory do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFuelCardHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFuelCardHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENFuelCardHistoryList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENFuelCardHistoryList.list[i].dateStart);
        if ENFuelCardHistoryList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENFuelCardHistoryList.list[i].dateFinal);
        Cells[3,i+1] := ENFuelCardHistoryList.list[i].finWorkerName;
        Cells[4,i+1] := ENFuelCardHistoryList.list[i].reg_id;
        Cells[5,i+1] := ENFuelCardHistoryList.list[i].userGen;
        if ENFuelCardHistoryList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDateTimeWithDate2String(ENFuelCardHistoryList.list[i].dateEdit);
		    Objects[0, i+1] := ENFuelCardHistoryList.list[i];

        LastRow:=i+1;
        sgENFuelCardHistory.RowCount:=LastRow+1;
      end;


    sgENFuelCardHistory.Row:=1;

    sgENFuelCardHistory.Row := sgENFuelCardHistory.RowCount - 1;

end;

end.