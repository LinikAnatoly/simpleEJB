
unit EditENFuseType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuseTypeController ;

type
  TfrmENFuseTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENFuseType: THTTPRIO;

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
  frmENFuseTypeEdit: TfrmENFuseTypeEdit;
  ENFuseTypeObj: ENFuseType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuseTypeController  ;
}
{$R *.dfm}



procedure TfrmENFuseTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENFuseTypeObj.code);
    edtName.Text := ENFuseTypeObj.name; 


  end;
end;



procedure TfrmENFuseTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuseType: ENFuseTypeControllerSoapPort;
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
    TempENFuseType := HTTPRIOENFuseType as ENFuseTypeControllerSoapPort;


     ENFuseTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENFuseTypeObj.code:=low(Integer);
      TempENFuseType.add(ENFuseTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuseType.save(ENFuseTypeObj);
    end;
  end;
end;


end.