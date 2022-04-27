
unit EditENArresterType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENArresterTypeController ;

type
  TfrmENArresterTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENArresterType: THTTPRIO;

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
  frmENArresterTypeEdit: TfrmENArresterTypeEdit;
  ENArresterTypeObj: ENArresterType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENArresterTypeController  ;
}
{$R *.dfm}



procedure TfrmENArresterTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENArresterTypeObj.code);
    edtName.Text := ENArresterTypeObj.name; 


  end;
end;



procedure TfrmENArresterTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENArresterType: ENArresterTypeControllerSoapPort;
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
    TempENArresterType := HTTPRIOENArresterType as ENArresterTypeControllerSoapPort;


     ENArresterTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENArresterTypeObj.code:=low(Integer);
      TempENArresterType.add(ENArresterTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENArresterType.save(ENArresterTypeObj);
    end;
  end;
end;


end.