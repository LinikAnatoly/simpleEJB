
unit EditENMolType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolTypeController ;

type
  TfrmENMolTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMolType: THTTPRIO;

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
  frmENMolTypeEdit: TfrmENMolTypeEdit;
  ENMolTypeObj: ENMolType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMolTypeController  ;
}
{$R *.dfm}



procedure TfrmENMolTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENMolTypeObj.code);
    edtName.Text := ENMolTypeObj.name; 


  end;
end;



procedure TfrmENMolTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMolType: ENMolTypeControllerSoapPort;
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
    TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;


     ENMolTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMolTypeObj.code:=low(Integer);
      TempENMolType.add(ENMolTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMolType.save(ENMolTypeObj);
    end;
  end;
end;


end.