
unit EditENAntsapf;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAntsapfController ;

type
  TfrmENAntsapfEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENAntsapf: THTTPRIO;

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
  frmENAntsapfEdit: TfrmENAntsapfEdit;
  ENAntsapfObj: ENAntsapf;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAntsapfController  ;
}
{$R *.dfm}



procedure TfrmENAntsapfEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENAntsapfObj.code);
    edtName.Text := ENAntsapfObj.name; 


  end;
end;



procedure TfrmENAntsapfEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAntsapf: ENAntsapfControllerSoapPort;
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
    TempENAntsapf := HTTPRIOENAntsapf as ENAntsapfControllerSoapPort;


     ENAntsapfObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENAntsapfObj.code:=low(Integer);
      TempENAntsapf.add(ENAntsapfObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAntsapf.save(ENAntsapfObj);
    end;
  end;
end;


end.