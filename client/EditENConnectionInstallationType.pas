
unit EditENConnectionInstallationType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionInstallationTypeController ;

type
  TfrmENConnectionInstallationTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCoef : TLabel;
    edtCoef: TEdit;


  HTTPRIOENConnectionInstallationType: THTTPRIO;

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
  frmENConnectionInstallationTypeEdit: TfrmENConnectionInstallationTypeEdit;
  ENConnectionInstallationTypeObj: ENConnectionInstallationType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionInstallationTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionInstallationTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtCoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENConnectionInstallationTypeObj.code);
    edtName.Text := ENConnectionInstallationTypeObj.name; 
    if ( ENConnectionInstallationTypeObj.coef <> nil ) then
       edtCoef.Text := ENConnectionInstallationTypeObj.coef.decimalString
    else
       edtCoef.Text := '';


  end;
end;



procedure TfrmENConnectionInstallationTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionInstallationType: ENConnectionInstallationTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtCoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENConnectionInstallationType := HTTPRIOENConnectionInstallationType as ENConnectionInstallationTypeControllerSoapPort;


     ENConnectionInstallationTypeObj.name := edtName.Text; 

     if (ENConnectionInstallationTypeObj.coef = nil ) then
       ENConnectionInstallationTypeObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENConnectionInstallationTypeObj.coef.decimalString := edtCoef.Text 
     else
       ENConnectionInstallationTypeObj.coef := nil;

    if DialogState = dsInsert then
    begin
      ENConnectionInstallationTypeObj.code:=low(Integer);
      TempENConnectionInstallationType.add(ENConnectionInstallationTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionInstallationType.save(ENConnectionInstallationTypeObj);
    end;
  end;
end;


end.