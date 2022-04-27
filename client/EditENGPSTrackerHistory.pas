unit EditENGPSTrackerHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENGPSTrackerHistoryController ;

type
  TfrmENGPSTrackerHistoryEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;
    lblReg_id : TLabel;
    edtReg_id: TEdit;
    lblPhoneNumber : TLabel;
    edtPhoneNumber: TEdit;
    lblCardNumber : TLabel;
    edtCardNumber: TEdit;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


    HTTPRIOENGPSTrackerHistory: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENGPSTrackerHistoryEdit: TfrmENGPSTrackerHistoryEdit;
  ENGPSTrackerHistoryObj: ENGPSTrackerHistory;

implementation



{$R *.dfm}

procedure TfrmENGPSTrackerHistoryEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
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
      ,edtPhoneNumber
      ,edtCardNumber
      ,edtUserGen
      ,edtDateEdit
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENGPSTrackerHistoryObj.code);
    SetDateFieldForDateTimePicker(edtDateStart, ENGPSTrackerHistoryObj.dateStart);
    SetDateFieldForDateTimePicker(edtDateFinal, ENGPSTrackerHistoryObj.dateFinal);
    edtReg_id.Text := ENGPSTrackerHistoryObj.reg_id; 
    edtPhoneNumber.Text := ENGPSTrackerHistoryObj.phoneNumber; 
    edtCardNumber.Text := ENGPSTrackerHistoryObj.cardNumber; 
    edtUserGen.Text := ENGPSTrackerHistoryObj.userGen; 
    SetDateFieldForDateTimePicker(edtDateEdit, ENGPSTrackerHistoryObj.dateEdit);

  end;
end;



procedure TfrmENGPSTrackerHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGPSTrackerHistory: ENGPSTrackerHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtReg_id
      ,edtPhoneNumber
      ,edtCardNumber
      ,edtUserGen
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENGPSTrackerHistory := HTTPRIOENGPSTrackerHistory as ENGPSTrackerHistoryControllerSoapPort;

    ENGPSTrackerHistoryObj.dateStart := GetTXSDateFromTDateTimePicker(edtDateStart);
    ENGPSTrackerHistoryObj.dateFinal := GetTXSDateFromTDateTimePicker(edtDateFinal);
    ENGPSTrackerHistoryObj.reg_id := edtReg_id.Text; 
    ENGPSTrackerHistoryObj.phoneNumber := edtPhoneNumber.Text; 
    ENGPSTrackerHistoryObj.cardNumber := edtCardNumber.Text; 
    ENGPSTrackerHistoryObj.userGen := edtUserGen.Text; 
    ENGPSTrackerHistoryObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtDateEdit);	   

    if DialogState = dsInsert then
    begin
      ENGPSTrackerHistoryObj.code := Low(Integer);
      TempENGPSTrackerHistory.add(ENGPSTrackerHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENGPSTrackerHistory.save(ENGPSTrackerHistoryObj);
    end;
  end;
end;


end.