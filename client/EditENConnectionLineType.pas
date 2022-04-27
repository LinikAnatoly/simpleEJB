
unit EditENConnectionLineType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionLineTypeController ;

type
  TfrmENConnectionLineTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConnectionLineType: THTTPRIO;

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
  frmENConnectionLineTypeEdit: TfrmENConnectionLineTypeEdit;
  ENConnectionLineTypeObj: ENConnectionLineType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionLineTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionLineTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENConnectionLineTypeObj.code);
    edtName.Text := ENConnectionLineTypeObj.name; 


  end;
end;



procedure TfrmENConnectionLineTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
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
    TempENConnectionLineType := HTTPRIOENConnectionLineType as ENConnectionLineTypeControllerSoapPort;


     ENConnectionLineTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConnectionLineTypeObj.code:=low(Integer);
      TempENConnectionLineType.add(ENConnectionLineTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionLineType.save(ENConnectionLineTypeObj);
    end;
  end;
end;


end.