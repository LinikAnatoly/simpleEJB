unit EditENFuelCardHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENFuelCardHistoryController ;

type
  TfrmENFuelCardHistoryEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblReg_id : TLabel;
    edtReg_id: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;

  lblFINWorkerFinWorkerName : TLabel;
  edtFINWorkerFinWorkerName : TEdit;
  spbFINWorkerFinWorker : TSpeedButton;
  
  lblENFuelCardFuelCardName : TLabel;
  edtENFuelCardFuelCardName : TEdit;
  spbENFuelCardFuelCard : TSpeedButton;
  

    HTTPRIOENFuelCardHistory: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbFINWorkerFinWorkerClick(Sender : TObject);
  procedure spbENFuelCardFuelCardClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENFuelCardHistoryEdit: TfrmENFuelCardHistoryEdit;
  ENFuelCardHistoryObj: ENFuelCardHistory;

implementation

uses
  ShowFINWorker
  ,FINWorkerController
  ,ShowENFuelCard
  ,ENFuelCardController
;


{$R *.dfm}

procedure TfrmENFuelCardHistoryEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtFINWorkerFinWorkerName
      ,spbFINWorkerFinWorker
      ,edtENFuelCardFuelCardName
      ,spbENFuelCardFuelCard
       ]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtDateStart
      ,edtReg_id
      ,edtUserGen
      ,edtDateEdit
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENFuelCardHistoryObj.code);
    SetDateFieldForDateTimePicker(edtDateStart, ENFuelCardHistoryObj.dateStart);
    SetDateFieldForDateTimePicker(edtDateFinal, ENFuelCardHistoryObj.dateFinal);
    edtReg_id.Text := ENFuelCardHistoryObj.reg_id; 
    edtUserGen.Text := ENFuelCardHistoryObj.userGen; 
    SetDateFieldForDateTimePicker(edtDateEdit, ENFuelCardHistoryObj.dateEdit);

    edtFINWorkerFinWorkerName.Text := ENFuelCardHistoryObj.finWorker.name;
    edtENFuelCardFuelCardName.Text := ENFuelCardHistoryObj.fuelCard.name;
  end;
end;



procedure TfrmENFuelCardHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelCardHistory: ENFuelCardHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtReg_id
      ,edtUserGen
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else
  begin
    TempENFuelCardHistory := HTTPRIOENFuelCardHistory as ENFuelCardHistoryControllerSoapPort;

    ENFuelCardHistoryObj.dateStart := GetTXSDateFromTDateTimePicker(edtDateStart);
    ENFuelCardHistoryObj.dateFinal := GetTXSDateFromTDateTimePicker(edtDateFinal);
    ENFuelCardHistoryObj.reg_id := edtReg_id.Text; 
    ENFuelCardHistoryObj.userGen := edtUserGen.Text; 
    ENFuelCardHistoryObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtDateEdit);	   

    if DialogState = dsInsert then
    begin
      ENFuelCardHistoryObj.code := Low(Integer);
      TempENFuelCardHistory.add(ENFuelCardHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelCardHistory.save(ENFuelCardHistoryObj);
    end;
  end;
end;


procedure TfrmENFuelCardHistoryEdit.spbFINWorkerFinWorkerClick(Sender : TObject);
var 
   frmFINWorkerShow: TfrmFINWorkerShow;
begin
   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal);
   try
      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardHistoryObj.finWorker = nil then ENFuelCardHistoryObj.finWorker := FINWorker.Create();
               ENFuelCardHistoryObj.finWorker.code := StrToInt(GetReturnValue(sgFINWorker,0));
               edtFINWorkerFinWorkerName.Text:=GetReturnValue(sgFINWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENFuelCardHistoryEdit.spbENFuelCardFuelCardClick(Sender : TObject);
var 
   frmENFuelCardShow: TfrmENFuelCardShow;
begin
   frmENFuelCardShow:=TfrmENFuelCardShow.Create(Application,fmNormal);
   try
      with frmENFuelCardShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuelCardHistoryObj.fuelCard = nil then ENFuelCardHistoryObj.fuelCard := ENFuelCard.Create();
               ENFuelCardHistoryObj.fuelCard.code := StrToInt(GetReturnValue(sgENFuelCard,0));
               edtENFuelCardFuelCardName.Text:=GetReturnValue(sgENFuelCard,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENFuelCardShow.Free;
   end;
end;


end.