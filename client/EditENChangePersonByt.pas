
unit EditENChangePersonByt;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENChangePersonBytController ;

type
  TfrmENChangePersonBytEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFio : TLabel;
    edtFio: TEdit;
    lblAccountNumber : TLabel;
    edtAccountNumber: TEdit;
    lblPackCode : TLabel;
    edtPackCode: TEdit;
    lblRegistrationNumber : TLabel;
    edtRegistrationNumber: TEdit;
    lblRegistrationDate : TLabel;
    edtRegistrationDate: TDateTimePicker;


  HTTPRIOENChangePersonByt: THTTPRIO;

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
  frmENChangePersonBytEdit: TfrmENChangePersonBytEdit;
  ENChangePersonBytObj: ENChangePersonByt;

implementation


{uses  
    EnergyproController, EnergyproController2, ENChangePersonBytController  ;
}
{$R *.dfm}



procedure TfrmENChangePersonBytEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFio
      ,edtAccountNumber
      ,edtPackCode
      ,edtRegistrationNumber
      ,edtRegistrationDate
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENChangePersonBytObj.code);
    edtFio.Text := ENChangePersonBytObj.fio; 
    edtAccountNumber.Text := ENChangePersonBytObj.accountNumber; 
    if ( ENChangePersonBytObj.packCode <> Low(Integer) ) then
       edtPackCode.Text := IntToStr(ENChangePersonBytObj.packCode)
    else
       edtPackCode.Text := '';
    edtRegistrationNumber.Text := ENChangePersonBytObj.registrationNumber; 
      SetDateFieldForDateTimePicker(edtRegistrationDate, ENChangePersonBytObj.doc.registrationDate);


  end;
end;



procedure TfrmENChangePersonBytEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENChangePersonByt: ENChangePersonBytControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFio
      ,edtAccountNumber
      ,edtPackCode
      ,edtRegistrationNumber
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENChangePersonByt := HTTPRIOENChangePersonByt as ENChangePersonBytControllerSoapPort;


     ENChangePersonBytObj.fio := edtFio.Text; 

     ENChangePersonBytObj.accountNumber := edtAccountNumber.Text; 

     if ( edtPackCode.Text <> '' ) then
       ENChangePersonBytObj.packCode := StrToInt(edtPackCode.Text)
     else
       ENChangePersonBytObj.packCode := Low(Integer) ;

     ENChangePersonBytObj.registrationNumber := edtRegistrationNumber.Text; 

     ENChangePersonBytObj.registrationDate := GetTXSDateFromTDateTimePicker(edtregistrationDate);

    if DialogState = dsInsert then
    begin
      ENChangePersonBytObj.code:=low(Integer);
      TempENChangePersonByt.add(ENChangePersonBytObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENChangePersonByt.save(ENChangePersonBytObj);
    end;
  end;
end;


end.