
unit EditENWiresItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENWiresItemController ;

type
  TfrmENWiresItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENWiresItem: THTTPRIO;

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
  frmENWiresItemEdit: TfrmENWiresItemEdit;
  ENWiresItemObj: ENWiresItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENWiresItemController  ;
}
{$R *.dfm}



procedure TfrmENWiresItemEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENWiresItemObj.code);


  end;
end;



procedure TfrmENWiresItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENWiresItem: ENWiresItemControllerSoapPort;
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
    TempENWiresItem := HTTPRIOENWiresItem as ENWiresItemControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENWiresItemObj.code:=low(Integer);
      TempENWiresItem.add(ENWiresItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWiresItem.save(ENWiresItemObj);
    end;
  end;
end;


end.