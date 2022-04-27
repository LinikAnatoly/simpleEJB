
unit EditENContractType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContractTypeController ;

type
  TfrmENContractTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENContractType: THTTPRIO;

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
  frmENContractTypeEdit: TfrmENContractTypeEdit;
  ENContractTypeObj: ENContractType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENContractTypeController  ;
}
{$R *.dfm}



procedure TfrmENContractTypeEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENContractTypeObj.code);
    edtName.Text := ENContractTypeObj.name; 


  end;
end;



procedure TfrmENContractTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContractType: ENContractTypeControllerSoapPort;
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
    TempENContractType := HTTPRIOENContractType as ENContractTypeControllerSoapPort;


     ENContractTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENContractTypeObj.code:=low(Integer);
      TempENContractType.add(ENContractTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContractType.save(ENContractTypeObj);
    end;
  end;
end;


end.