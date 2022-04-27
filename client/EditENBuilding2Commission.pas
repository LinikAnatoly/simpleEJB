
unit EditENBuilding2Commission;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuilding2CommissionController ;

type
  TfrmENBuilding2CommissionEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblTabNumber : TLabel;
    edtTabNumber: TEdit;
    lblFIO : TLabel;
    edtFIO: TEdit;
    lblShortFIO : TLabel;
    edtShortFIO: TEdit;
    lblPositionName : TLabel;


  HTTPRIOENBuilding2Commission: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbENWorkerWorkerFact: TSpeedButton;
    edtPositionName: TEdit;
    ENBuildingCommissionTypeName: TEdit;
    lblName: TLabel;
    SpeedButton1: TSpeedButton;
    HTTPRIOENBuildingCommissionType: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENBuilding2CommissionEdit: TfrmENBuilding2CommissionEdit;
  ENBuilding2CommissionObj: ENBuilding2Commission;

implementation

uses FINWorkerController, ShowFINWorker, DMReportsUnit,
  ENBuildingCommissionTypeController, ShowENBuildingCommissionType, ShowFINMol;



{$R *.dfm}



procedure TfrmENBuilding2CommissionEdit.FormShow(Sender: TObject);
    var
    TempENBuildingCommissionTypefill : ENBuildingCommissionTypeFilter;
    TempENBuildingCommissionTypeObj : ENBuildingCommissionType;
    TempENBuildingCommissionType: ENBuildingCommissionTypeControllerSoapPort;
begin

  DisableControls([ENBuildingCommissionTypeName,edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([  edtPositionName
      ,ENBuildingCommissionTypeName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

     TempENBuildingCommissionTypefill := ENBuildingCommissionTypeFilter.Create;
     SetNullIntProps(TempENBuildingCommissionTypefill);
     SetNullXSProps(TempENBuildingCommissionTypefill);

     TempENBuildingCommissionTypefill.code := ENBuilding2CommissionObj.ENBuildingCommissionTypeRef.code;

     TempENBuildingCommissionType :=  HTTPRIOENBuildingCommissionType as ENBuildingCommissionTypeControllerSoapPort;

     TempENBuildingCommissionTypeObj := TempENBuildingCommissionType.getObject(ENBuilding2CommissionObj.ENBuildingCommissionTypeRef.code);
     ENBuildingCommissionTypeName.Text:= TempENBuildingCommissionTypeObj.name;

    edtCode.Text := IntToStr(ENBuilding2CommissionObj.code);
    edtTabNumber.Text := ENBuilding2CommissionObj.tabNumber; 
    edtFIO.Text := ENBuilding2CommissionObj.FIO; 
    edtShortFIO.Text := ENBuilding2CommissionObj.shortFIO; 
    edtPositionName.Text:= ENBuilding2CommissionObj.positionName;


  end;
end;



procedure TfrmENBuilding2CommissionEdit.spbENWorkerWorkerFactClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   //plan : ENPlanWork;
   w : FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
   departmentNameString: string;
   departmentCode : string;
   isODS: boolean;
   myDate : TDateTime;
   myYear, myMonth, myDay : Word;
   i : integer;
   fiofull : TStringList;
   fiofullwithQuoteChar  , fioshort : String;

begin

  myDate := date;
  DecodeDate(myDate, myYear, myMonth, myDay);

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);


   //f.departmentCode :=  IntToStr(ENBuilding2CommissionObj.de );

//   if plan.finExecutor <> nil then
//   begin
//     if plan.finExecutor.code > LOW_INT then
//     begin
//       // MDAX-441
//       if DMReports.UsesMDAXData then
//         f.departmentCode := plan.finExecutor.axOrgId
//       else
//         f.departmentCode := intToStr( plan.finExecutor.finCode );
//     end
//     else
//       Application.MessageBox(PChar('Не выбрана бригада! Выберите бригаду на плане или воспользуйтесь фильтром!'), PChar('Внимание!'), MB_ICONINFORMATION);
//   end;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   try

     frmFINWorkerShow.dateGet := TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate( myYear , myMonth,myDay ) ));

     //frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            /// 15.02.11
            NVZType := GetReturnValue(sgFINWorker,8);
            IsNVZ := false;

            // NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
            departmentNameString := GetReturnValue(sgFINWorker,5);
            departmentCode := GetReturnValue(sgFINWorker,6);

            if (DMReports.UsesMDAXData) then isODS := (departmentCode = '001')
             else isODS := (departmentCode = '93');



            ENBuilding2CommissionObj.FIO := GetReturnValue(sgFINWorker,1);

            edtFIO.Text:= GetReturnValue(sgFINWorker,1);

            ENBuilding2CommissionObj.tabNumber:=GetReturnValue(sgFINWorker,2);
            edtTabNumber.Text:=GetReturnValue(sgFINWorker,2);
            ENBuilding2CommissionObj.positionName := GetReturnValue(sgFINWorker,3);
            edtPositionName.Text:= GetReturnValue(sgFINWorker,3);

            fiofullwithQuoteChar:= '|'+  StringReplace(edtFIO.Text, ' ', '|',[rfReplaceAll, rfIgnoreCase]) +'|';

            fiofull := TStringList.Create;
            fiofull.Delimiter := ' ';        // Каждый элемент списка будет разделён пробелом
            fiofull.QuoteChar := '|';        // И каждый элемент взят в '|'
            fiofull.DelimitedText := ENBuilding2CommissionObj.FIO ;

            for i := 0 to fiofull.Count-1 do
              begin
                 //ShowMessage(fiofull[i]);
                 if i=0 then
                  fioshort:= fiofull[i]
                 else
                  fioshort:=fioshort+ ' '+Copy(fiofull[i],1,1)+'.';
              end;

              ENBuilding2CommissionObj.shortFIO := fioshort;
              edtShortFIO.Text:= fioshort;



        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENBuilding2CommissionEdit.SpeedButton1Click(Sender: TObject);
var
 f : ENBuildingCommissionTypeFilter;
 frmCommissionTypeShow : TfrmENBuildingCommissionTypeShow;
begin
 f := ENBuildingCommissionTypeFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);


   frmCommissionTypeShow:=TfrmENBuildingCommissionTypeShow.Create(Application,fmNormal, f);

   try


      with frmCommissionTypeShow do
      begin

        if ShowModal = mrOk then
        begin
            try

              if ENBuilding2CommissionObj.ENBuildingCommissionTypeRef = nil then
                 ENBuilding2CommissionObj.ENBuildingCommissionTypeRef := ENBuildingCommissionTypeRef.Create;
                 ENBuilding2CommissionObj.ENBuildingCommissionTypeRef.code := StrToInt(GetReturnValue(sgENBuildingCommissionType,0));
                 ENBuildingCommissionTypeName.Text := GetReturnValue(sgENBuildingCommissionType,1);


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmCommissionTypeShow.Free;
   end;
end;

procedure TfrmENBuilding2CommissionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2Commission: ENBuilding2CommissionControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([ edtPositionName
      ,ENBuildingCommissionTypeName
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilding2Commission := HTTPRIOENBuilding2Commission as ENBuilding2CommissionControllerSoapPort;

     ENBuilding2CommissionObj.tabNumber := edtTabNumber.Text;
     ENBuilding2CommissionObj.FIO := edtFIO.Text; 
     ENBuilding2CommissionObj.shortFIO := edtShortFIO.Text; 
     ENBuilding2CommissionObj.positionName := edtPositionName.Text; 

    if DialogState = dsInsert then
    begin
      ENBuilding2CommissionObj.code:=low(Integer);
      TempENBuilding2Commission.add(ENBuilding2CommissionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilding2Commission.save(ENBuilding2CommissionObj);
    end;
  end;
end;


end.