
unit EditENVoltageClass;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENVoltageClassController ;

type
  TfrmENVoltageClassEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblValue : TLabel;
    edtValue: TEdit;
    lblDescription : TLabel;
    edtDescription: TEdit;


  HTTPRIOENVoltageClass: THTTPRIO;

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
  frmENVoltageClassEdit: TfrmENVoltageClassEdit;
  ENVoltageClassObj: ENVoltageClass;

implementation


{uses  
    EnergyproController, EnergyproController2, ENVoltageClassController  ;
}
{$R *.dfm}



procedure TfrmENVoltageClassEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENVoltageClassObj.code);
    if ( ENVoltageClassObj.value <> nil ) then
       edtValue.Text := ENVoltageClassObj.value.decimalString
    else
       edtValue.Text := ''; 
    edtDescription.Text := ENVoltageClassObj.description; 


  end;
end;



procedure TfrmENVoltageClassEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENVoltageClass: ENVoltageClassControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENVoltageClass := HTTPRIOENVoltageClass as ENVoltageClassControllerSoapPort;


     if (ENVoltageClassObj.value = nil ) then
       ENVoltageClassObj.value := TXSDecimal.Create;
     if edtValue.Text <> '' then
       ENVoltageClassObj.value.decimalString := edtValue.Text 
     else
       ENVoltageClassObj.value := nil;

     ENVoltageClassObj.description := edtDescription.Text; 

    if DialogState = dsInsert then
    begin
      ENVoltageClassObj.code:=low(Integer);
      TempENVoltageClass.add(ENVoltageClassObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENVoltageClass.save(ENVoltageClassObj);
    end;
  end;
end;


end.