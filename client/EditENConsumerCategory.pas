
unit EditENConsumerCategory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConsumerCategoryController ;

type
  TfrmENConsumerCategoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENConsumerCategory: THTTPRIO;

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
  frmENConsumerCategoryEdit: TfrmENConsumerCategoryEdit;
  ENConsumerCategoryObj: ENConsumerCategory;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConsumerCategoryController  ;
}
{$R *.dfm}



procedure TfrmENConsumerCategoryEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENConsumerCategoryObj.code);
    edtName.Text := ENConsumerCategoryObj.name; 


  end;
end;



procedure TfrmENConsumerCategoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConsumerCategory: ENConsumerCategoryControllerSoapPort;
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
    TempENConsumerCategory := HTTPRIOENConsumerCategory as ENConsumerCategoryControllerSoapPort;


     ENConsumerCategoryObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENConsumerCategoryObj.code:=low(Integer);
      TempENConsumerCategory.add(ENConsumerCategoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConsumerCategory.save(ENConsumerCategoryObj);
    end;
  end;
end;


end.