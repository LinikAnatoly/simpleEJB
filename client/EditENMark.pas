
unit EditENMark;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMarkController ;

type
  TfrmENMarkEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENMark: THTTPRIO;

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
  frmENMarkEdit: TfrmENMarkEdit;
  ENMarkObj: ENMark;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMarkController  ;
}
{$R *.dfm}



procedure TfrmENMarkEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENMarkObj.code);
    edtName.Text := ENMarkObj.name; 


  end;
end;



procedure TfrmENMarkEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMark: ENMarkControllerSoapPort;
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
    TempENMark := HTTPRIOENMark as ENMarkControllerSoapPort;


     ENMarkObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENMarkObj.code:=low(Integer);
      TempENMark.add(ENMarkObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMark.save(ENMarkObj);
    end;
  end;
end;


end.