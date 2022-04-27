
unit EditENCalcAdditionalItemType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcAdditionalItemTypeController ;

type
  TfrmENCalcAdditionalItemTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENCalcAdditionalItemType: THTTPRIO;

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
  frmENCalcAdditionalItemTypeEdit: TfrmENCalcAdditionalItemTypeEdit;
  ENCalcAdditionalItemTypeObj: ENCalcAdditionalItemType;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCalcAdditionalItemTypeController  ;
}
{$R *.dfm}



procedure TfrmENCalcAdditionalItemTypeEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCalcAdditionalItemTypeObj.code);
    edtName.Text := ENCalcAdditionalItemTypeObj.name; 


  end;
end;



procedure TfrmENCalcAdditionalItemTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCalcAdditionalItemType: ENCalcAdditionalItemTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCalcAdditionalItemType := HTTPRIOENCalcAdditionalItemType as ENCalcAdditionalItemTypeControllerSoapPort;


     ENCalcAdditionalItemTypeObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENCalcAdditionalItemTypeObj.code:=low(Integer);
      TempENCalcAdditionalItemType.add(ENCalcAdditionalItemTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCalcAdditionalItemType.save(ENCalcAdditionalItemTypeObj);
    end;
  end;
end;


end.