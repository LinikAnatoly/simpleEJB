
unit EditENEstimateItemStatus;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemStatusController ;

type
  TfrmENEstimateItemStatusEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemStatus: THTTPRIO;

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
  frmENEstimateItemStatusEdit: TfrmENEstimateItemStatusEdit;
  ENEstimateItemStatusObj: ENEstimateItemStatus;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemStatusController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemStatusEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENEstimateItemStatusObj.name; 


  end;
end;



procedure TfrmENEstimateItemStatusEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemStatus: ENEstimateItemStatusControllerSoapPort;
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
    TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;


     ENEstimateItemStatusObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENEstimateItemStatusObj.code:=low(Integer);
      TempENEstimateItemStatus.add(ENEstimateItemStatusObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEstimateItemStatus.save(ENEstimateItemStatusObj);
    end;
  end;
end;


end.