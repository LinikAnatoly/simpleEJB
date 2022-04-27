
unit EditENPostType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPostTypeController ;

type
  TfrmENPostTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPostType: THTTPRIO;

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
  frmENPostTypeEdit: TfrmENPostTypeEdit;
  ENPostTypeObj: ENPostType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPostTypeController  ;
}
{$R *.dfm}



procedure TfrmENPostTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENPostTypeObj.code);
    edtName.Text := ENPostTypeObj.name; 


  end;
end;



procedure TfrmENPostTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPostType: ENPostTypeControllerSoapPort;
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
    TempENPostType := HTTPRIOENPostType as ENPostTypeControllerSoapPort;


     ENPostTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPostTypeObj.code:=low(Integer);
      TempENPostType.add(ENPostTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPostType.save(ENPostTypeObj);
    end;
  end;
end;


end.