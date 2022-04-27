
unit EditENConnectionPowerPoint;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionPowerPointController ;

type
  TfrmENConnectionPowerPointEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblCoef : TLabel;
    edtCoef: TEdit;


  HTTPRIOENConnectionPowerPoint: THTTPRIO;

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
  frmENConnectionPowerPointEdit: TfrmENConnectionPowerPointEdit;
  ENConnectionPowerPointObj: ENConnectionPowerPoint;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionPowerPointController  ;
}
{$R *.dfm}



procedure TfrmENConnectionPowerPointEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENConnectionPowerPointObj.code);
    edtName.Text := ENConnectionPowerPointObj.name; 
    if ( ENConnectionPowerPointObj.coef <> nil ) then
       edtCoef.Text := ENConnectionPowerPointObj.coef.decimalString
    else
       edtCoef.Text := '';


  end;
end;



procedure TfrmENConnectionPowerPointEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
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
    TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint as ENConnectionPowerPointControllerSoapPort;


     ENConnectionPowerPointObj.name := edtName.Text; 

     if (ENConnectionPowerPointObj.coef = nil ) then
       ENConnectionPowerPointObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       ENConnectionPowerPointObj.coef.decimalString := edtCoef.Text 
     else
       ENConnectionPowerPointObj.coef := nil;

    if DialogState = dsInsert then
    begin
      ENConnectionPowerPointObj.code:=low(Integer);
      TempENConnectionPowerPoint.add(ENConnectionPowerPointObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionPowerPoint.save(ENConnectionPowerPointObj);
    end;
  end;
end;


end.