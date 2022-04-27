
unit EditENIPPurposeProgram;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENIPPurposeProgramController ;

type
  TfrmENIPPurposeProgramEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENIPPurposeProgram: THTTPRIO;

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
  frmENIPPurposeProgramEdit: TfrmENIPPurposeProgramEdit;
  ENIPPurposeProgramObj: ENIPPurposeProgram;

implementation


{uses  
    EnergyproController, EnergyproController2, ENIPPurposeProgramController  ;
}
{$R *.dfm}



procedure TfrmENIPPurposeProgramEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);

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
      edtCode.Text := IntToStr(ENIPPurposeProgramObj.code);
    edtName.Text := ENIPPurposeProgramObj.name; 


  end;
end;



procedure TfrmENIPPurposeProgramEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENIPPurposeProgram: ENIPPurposeProgramControllerSoapPort;
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
    TempENIPPurposeProgram := HTTPRIOENIPPurposeProgram as ENIPPurposeProgramControllerSoapPort;


     ENIPPurposeProgramObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENIPPurposeProgramObj.code:=low(Integer);
      TempENIPPurposeProgram.add(ENIPPurposeProgramObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENIPPurposeProgram.save(ENIPPurposeProgramObj);
    end;
  end;
end;


end.