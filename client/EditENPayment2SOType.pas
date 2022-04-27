
unit EditENPayment2SOType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPayment2SOTypeController ;

type
  TfrmENPayment2SOTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPayment2SOType: THTTPRIO;

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
  frmENPayment2SOTypeEdit: TfrmENPayment2SOTypeEdit;
  ENPayment2SOTypeObj: ENPayment2SOType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPayment2SOTypeController  ;
}
{$R *.dfm}



procedure TfrmENPayment2SOTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENPayment2SOTypeObj.code);
    edtName.Text := ENPayment2SOTypeObj.name; 


  end;
end;



procedure TfrmENPayment2SOTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPayment2SOType: ENPayment2SOTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENPayment2SOType := HTTPRIOENPayment2SOType as ENPayment2SOTypeControllerSoapPort;


     ENPayment2SOTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPayment2SOTypeObj.code:=low(Integer);
      TempENPayment2SOType.add(ENPayment2SOTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPayment2SOType.save(ENPayment2SOTypeObj);
    end;
  end;
end;


end.