
unit EditENServicesContractStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesContractStatusController ;

type
  TfrmENServicesContractStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENServicesContractStatus: THTTPRIO;

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
  frmENServicesContractStatusEdit: TfrmENServicesContractStatusEdit;
  ENServicesContractStatusObj: ENServicesContractStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENServicesContractStatusController  ;
}
{$R *.dfm}



procedure TfrmENServicesContractStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENServicesContractStatusObj.code);
    edtName.Text := ENServicesContractStatusObj.name; 


  end;
end;



procedure TfrmENServicesContractStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesContractStatus: ENServicesContractStatusControllerSoapPort;
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
    TempENServicesContractStatus := HTTPRIOENServicesContractStatus as ENServicesContractStatusControllerSoapPort;


     ENServicesContractStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENServicesContractStatusObj.code:=low(Integer);
      TempENServicesContractStatus.add(ENServicesContractStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENServicesContractStatus.save(ENServicesContractStatusObj);
    end;
  end;
end;


end.