
unit EditENFuelInventarizationStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInventarizationStatusController ;

type
  TfrmENFuelInventarizationStatusEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENFuelInventarizationStatus: THTTPRIO;

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
  frmENFuelInventarizationStatusEdit: TfrmENFuelInventarizationStatusEdit;
  ENFuelInventarizationStatusObj: ENFuelInventarizationStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInventarizationStatusController  ;
}
{$R *.dfm}



procedure TfrmENFuelInventarizationStatusEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENFuelInventarizationStatusObj.code);
    edtName.Text := ENFuelInventarizationStatusObj.name; 


  end;
end;



procedure TfrmENFuelInventarizationStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInventarizationStatus: ENFuelInventarizationStatusControllerSoapPort;
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
    TempENFuelInventarizationStatus := HTTPRIOENFuelInventarizationStatus as ENFuelInventarizationStatusControllerSoapPort;


     ENFuelInventarizationStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENFuelInventarizationStatusObj.code:=low(Integer);
      TempENFuelInventarizationStatus.add(ENFuelInventarizationStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENFuelInventarizationStatus.save(ENFuelInventarizationStatusObj);
    end;
  end;
end;


end.