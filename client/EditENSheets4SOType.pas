
unit EditENSheets4SOType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSheets4SOTypeController ;

type
  TfrmENSheets4SOTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;


  HTTPRIOENSheets4SOType: THTTPRIO;

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
  frmENSheets4SOTypeEdit: TfrmENSheets4SOTypeEdit;
  ENSheets4SOTypeObj: ENSheets4SOType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSheets4SOTypeController  ;
}
{$R *.dfm}



procedure TfrmENSheets4SOTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSheets4SOTypeObj.code);
    MakeMultiline(edtName.Lines, ENSheets4SOTypeObj.name);


  end;
end;



procedure TfrmENSheets4SOTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
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
    TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;


     ENSheets4SOTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSheets4SOTypeObj.code:=low(Integer);
      TempENSheets4SOType.add(ENSheets4SOTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSheets4SOType.save(ENSheets4SOTypeObj);
    end;
  end;
end;


end.