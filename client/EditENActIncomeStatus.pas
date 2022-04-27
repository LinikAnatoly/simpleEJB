
unit EditENActIncomeStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActIncomeStatusController ;

type
  TfrmENActIncomeStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENActIncomeStatus: THTTPRIO;

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
  frmENActIncomeStatusEdit: TfrmENActIncomeStatusEdit;
  ENActIncomeStatusObj: ENActIncomeStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActIncomeStatusController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENActIncomeStatusObj.code);
    edtName.Text := ENActIncomeStatusObj.name; 


  end;
end;



procedure TfrmENActIncomeStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActIncomeStatus: ENActIncomeStatusControllerSoapPort;
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
    TempENActIncomeStatus := HTTPRIOENActIncomeStatus as ENActIncomeStatusControllerSoapPort;


     ENActIncomeStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENActIncomeStatusObj.code:=low(Integer);
      TempENActIncomeStatus.add(ENActIncomeStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActIncomeStatus.save(ENActIncomeStatusObj);
    end;
  end;
end;


end.