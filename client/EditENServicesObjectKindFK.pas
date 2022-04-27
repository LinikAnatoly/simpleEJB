
unit EditENServicesObjectKindFK;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesObjectKindFKController ;

type
  TfrmENServicesObjectKindFKEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENServicesObjectKindFK: THTTPRIO;

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
  frmENServicesObjectKindFKEdit: TfrmENServicesObjectKindFKEdit;
  ENServicesObjectKindFKObj: ENServicesObjectKindFK;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesObjectKindFKController  ;
}
{$R *.dfm}



procedure TfrmENServicesObjectKindFKEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENServicesObjectKindFKObj.code);
    edtName.Text := ENServicesObjectKindFKObj.name; 


  end;
end;



procedure TfrmENServicesObjectKindFKEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesObjectKindFK: ENServicesObjectKindFKControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesObjectKindFK := HTTPRIOENServicesObjectKindFK as ENServicesObjectKindFKControllerSoapPort;


     ENServicesObjectKindFKObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENServicesObjectKindFKObj.code:=low(Integer);
      TempENServicesObjectKindFK.add(ENServicesObjectKindFKObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesObjectKindFK.save(ENServicesObjectKindFKObj);
    end;
  end;
end;


end.