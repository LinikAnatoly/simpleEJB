
unit EditENReconstrModernOZ2ENact;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENReconstrModernOZ2ENactController ;

type
  TfrmENReconstrModernOZ2ENactEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENReconstrModernOZ2ENact: THTTPRIO;

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
  frmENReconstrModernOZ2ENactEdit: TfrmENReconstrModernOZ2ENactEdit;
  ENReconstrModernOZ2ENactObj: ENReconstrModernOZ2ENact;

implementation


{uses  
    EnergyproController, EnergyproController2, ENReconstrModernOZ2ENactController  ;
}
{$R *.dfm}



procedure TfrmENReconstrModernOZ2ENactEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENReconstrModernOZ2ENactObj.code);


  end;
end;



procedure TfrmENReconstrModernOZ2ENactEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
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
    TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENReconstrModernOZ2ENactObj.code:=low(Integer);
      TempENReconstrModernOZ2ENact.add(ENReconstrModernOZ2ENactObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENReconstrModernOZ2ENact.save(ENReconstrModernOZ2ENactObj);
    end;
  end;
end;


end.