
unit EditENEstimateItemType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemTypeController ;

type
  TfrmENEstimateItemTypeEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemType: THTTPRIO;

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
  frmENEstimateItemTypeEdit: TfrmENEstimateItemTypeEdit;
  ENEstimateItemTypeObj: ENEstimateItemType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemTypeController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemTypeEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENEstimateItemTypeObj.name; 


  end;
end;



procedure TfrmENEstimateItemTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemType: ENEstimateItemTypeControllerSoapPort;
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
    TempENEstimateItemType := HTTPRIOENEstimateItemType as ENEstimateItemTypeControllerSoapPort;


     ENEstimateItemTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENEstimateItemTypeObj.code:=low(Integer);
      TempENEstimateItemType.add(ENEstimateItemTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEstimateItemType.save(ENEstimateItemTypeObj);
    end;
  end;
end;


end.