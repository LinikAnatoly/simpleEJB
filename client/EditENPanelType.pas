
unit EditENPanelType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPanelTypeController ;

type
  TfrmENPanelTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPanelType: THTTPRIO;

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
  frmENPanelTypeEdit: TfrmENPanelTypeEdit;
  ENPanelTypeObj: ENPanelType;

implementation


uses ShowOSTable;
{$R *.dfm}



procedure TfrmENPanelTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENPanelTypeObj.code);
    edtName.Text := ENPanelTypeObj.name; 


  end;
end;



procedure TfrmENPanelTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPanelType: ENPanelTypeControllerSoapPort;
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
    TempENPanelType := HTTPRIOENPanelType as ENPanelTypeControllerSoapPort;


     ENPanelTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENPanelTypeObj.code:=low(Integer);
      TempENPanelType.add(ENPanelTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPanelType.save(ENPanelTypeObj);
    end;
  end;
end;


end.
