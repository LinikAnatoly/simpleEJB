
unit EditENAntsapfPosition;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAntsapfPositionController ;

type
  TfrmENAntsapfPositionEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENAntsapfPosition: THTTPRIO;

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
  frmENAntsapfPositionEdit: TfrmENAntsapfPositionEdit;
  ENAntsapfPositionObj: ENAntsapfPosition;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAntsapfPositionController  ;
}
{$R *.dfm}



procedure TfrmENAntsapfPositionEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENAntsapfPositionObj.code);
    edtName.Text := ENAntsapfPositionObj.name; 


  end;
end;



procedure TfrmENAntsapfPositionEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAntsapfPosition: ENAntsapfPositionControllerSoapPort;
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
    TempENAntsapfPosition := HTTPRIOENAntsapfPosition as ENAntsapfPositionControllerSoapPort;


     ENAntsapfPositionObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENAntsapfPositionObj.code:=low(Integer);
      TempENAntsapfPosition.add(ENAntsapfPositionObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAntsapfPosition.save(ENAntsapfPositionObj);
    end;
  end;
end;


end.