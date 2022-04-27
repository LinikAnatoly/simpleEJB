
unit EditENEstimateItemKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemKindController ;

type
  TfrmENEstimateItemKindEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENEstimateItemKind: THTTPRIO;

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
  frmENEstimateItemKindEdit: TfrmENEstimateItemKindEdit;
  ENEstimateItemKindObj: ENEstimateItemKind;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemKindController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemKindEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtName.Text := ENEstimateItemKindObj.name; 


  end;
end;



procedure TfrmENEstimateItemKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemKind: ENEstimateItemKindControllerSoapPort;
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
    TempENEstimateItemKind := HTTPRIOENEstimateItemKind as ENEstimateItemKindControllerSoapPort;


     ENEstimateItemKindObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENEstimateItemKindObj.code:=low(Integer);
      TempENEstimateItemKind.add(ENEstimateItemKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEstimateItemKind.save(ENEstimateItemKindObj);
    end;
  end;
end;


end.