
unit EditENConnectionLocationType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionLocationTypeController ;

type
  TfrmENConnectionLocationTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConnectionLocationType: THTTPRIO;

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
  frmENConnectionLocationTypeEdit: TfrmENConnectionLocationTypeEdit;
  ENConnectionLocationTypeObj: ENConnectionLocationType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionLocationTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionLocationTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENConnectionLocationTypeObj.code);
    edtName.Text := ENConnectionLocationTypeObj.name; 


  end;
end;



procedure TfrmENConnectionLocationTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionLocationType: ENConnectionLocationTypeControllerSoapPort;
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
    TempENConnectionLocationType := HTTPRIOENConnectionLocationType as ENConnectionLocationTypeControllerSoapPort;


     ENConnectionLocationTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionLocationTypeObj.code:=low(Integer);
      TempENConnectionLocationType.add(ENConnectionLocationTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionLocationType.save(ENConnectionLocationTypeObj);
    end;
  end;
end;


end.