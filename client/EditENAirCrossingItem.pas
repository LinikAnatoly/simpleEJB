
unit EditENAirCrossingItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAirCrossingItemController ;

type
  TfrmENAirCrossingItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENAirCrossingItem: THTTPRIO;

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
  frmENAirCrossingItemEdit: TfrmENAirCrossingItemEdit;
  ENAirCrossingItemObj: ENAirCrossingItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAirCrossingItemController  ;
}
{$R *.dfm}



procedure TfrmENAirCrossingItemEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENAirCrossingItemObj.code);


  end;
end;



procedure TfrmENAirCrossingItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAirCrossingItem: ENAirCrossingItemControllerSoapPort;
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
    TempENAirCrossingItem := HTTPRIOENAirCrossingItem as ENAirCrossingItemControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENAirCrossingItemObj.code:=low(Integer);
      TempENAirCrossingItem.add(ENAirCrossingItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAirCrossingItem.save(ENAirCrossingItemObj);
    end;
  end;
end;


end.