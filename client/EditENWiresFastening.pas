
unit EditENWiresFastening;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresFasteningController ;

type
  TfrmENWiresFasteningEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENWiresFastening: THTTPRIO;

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
  frmENWiresFasteningEdit: TfrmENWiresFasteningEdit;
  ENWiresFasteningObj: ENWiresFastening;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresFasteningController  ;
}
{$R *.dfm}



procedure TfrmENWiresFasteningEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENWiresFasteningObj.code);
    edtName.Text := ENWiresFasteningObj.name; 


  end;
end;



procedure TfrmENWiresFasteningEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresFastening: ENWiresFasteningControllerSoapPort;
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
    TempENWiresFastening := HTTPRIOENWiresFastening as ENWiresFasteningControllerSoapPort;


     ENWiresFasteningObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENWiresFasteningObj.code:=low(Integer);
      TempENWiresFastening.add(ENWiresFasteningObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWiresFastening.save(ENWiresFasteningObj);
    end;
  end;
end;


end.