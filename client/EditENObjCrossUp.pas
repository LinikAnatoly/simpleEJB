
unit EditENObjCrossUp;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENObjCrossUpController ;

type
  TfrmENObjCrossUpEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENObjCrossUp: THTTPRIO;

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
  frmENObjCrossUpEdit: TfrmENObjCrossUpEdit;
  ENObjCrossUpObj: ENObjCrossUp;

implementation


{uses  
    EnergyproController, EnergyproController2, ENObjCrossUpController  ;
}
{$R *.dfm}



procedure TfrmENObjCrossUpEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENObjCrossUpObj.code);
    edtName.Text := ENObjCrossUpObj.name; 


  end;
end;



procedure TfrmENObjCrossUpEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
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
    TempENObjCrossUp := HTTPRIOENObjCrossUp as ENObjCrossUpControllerSoapPort;


     ENObjCrossUpObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENObjCrossUpObj.code:=low(Integer);
      TempENObjCrossUp.add(ENObjCrossUpObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENObjCrossUp.save(ENObjCrossUpObj);
    end;
  end;
end;


end.