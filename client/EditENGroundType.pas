
unit EditENGroundType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENGroundTypeController ;

type
  TfrmENGroundTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENGroundType: THTTPRIO;

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
  frmENGroundTypeEdit: TfrmENGroundTypeEdit;
  ENGroundTypeObj: ENGroundType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENGroundTypeController  ;
}
{$R *.dfm}



procedure TfrmENGroundTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENGroundTypeObj.code);
    edtName.Text := ENGroundTypeObj.name; 


  end;
end;



procedure TfrmENGroundTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGroundType: ENGroundTypeControllerSoapPort;
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
    TempENGroundType := HTTPRIOENGroundType as ENGroundTypeControllerSoapPort;


     ENGroundTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENGroundTypeObj.code:=low(Integer);
      TempENGroundType.add(ENGroundTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENGroundType.save(ENGroundTypeObj);
    end;
  end;
end;


end.