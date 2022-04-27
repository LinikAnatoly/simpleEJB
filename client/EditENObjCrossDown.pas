
unit EditENObjCrossDown;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENObjCrossDownController ;

type
  TfrmENObjCrossDownEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENObjCrossDown: THTTPRIO;

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
  frmENObjCrossDownEdit: TfrmENObjCrossDownEdit;
  ENObjCrossDownObj: ENObjCrossDown;

implementation


{uses  
    EnergyproController, EnergyproController2, ENObjCrossDownController  ;
}
{$R *.dfm}



procedure TfrmENObjCrossDownEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENObjCrossDownObj.code);
    edtName.Text := ENObjCrossDownObj.name; 


  end;
end;



procedure TfrmENObjCrossDownEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENObjCrossDown: ENObjCrossDownControllerSoapPort;
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
    TempENObjCrossDown := HTTPRIOENObjCrossDown as ENObjCrossDownControllerSoapPort;


     ENObjCrossDownObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENObjCrossDownObj.code:=low(Integer);
      TempENObjCrossDown.add(ENObjCrossDownObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENObjCrossDown.save(ENObjCrossDownObj);
    end;
  end;
end;


end.