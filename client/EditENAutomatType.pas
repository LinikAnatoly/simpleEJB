
unit EditENAutomatType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutomatTypeController ;

type
  TfrmENAutomatTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENAutomatType: THTTPRIO;

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
  frmENAutomatTypeEdit: TfrmENAutomatTypeEdit;
  ENAutomatTypeObj: ENAutomatType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAutomatTypeController  ;
}
{$R *.dfm}



procedure TfrmENAutomatTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENAutomatTypeObj.code);
    edtName.Text := ENAutomatTypeObj.name; 


  end;
end;



procedure TfrmENAutomatTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutomatType: ENAutomatTypeControllerSoapPort;
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
    TempENAutomatType := HTTPRIOENAutomatType as ENAutomatTypeControllerSoapPort;


     ENAutomatTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENAutomatTypeObj.code:=low(Integer);
      TempENAutomatType.add(ENAutomatTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAutomatType.save(ENAutomatTypeObj);
    end;
  end;
end;


end.