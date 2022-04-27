
unit EditENSOValuesTypeCategory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSOValuesTypeCategoryController ;

type
  TfrmENSOValuesTypeCategoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSOValuesTypeCategory: THTTPRIO;

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
  frmENSOValuesTypeCategoryEdit: TfrmENSOValuesTypeCategoryEdit;
  ENSOValuesTypeCategoryObj: ENSOValuesTypeCategory;

implementation



{$R *.dfm}



procedure TfrmENSOValuesTypeCategoryEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENSOValuesTypeCategoryObj.code);
    edtName.Text := ENSOValuesTypeCategoryObj.name; 


  end;
end;



procedure TfrmENSOValuesTypeCategoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValuesTypeCategory: ENSOValuesTypeCategoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;

     ENSOValuesTypeCategoryObj.name := edtName.Text; 

    if DialogState = dsInsert then
    begin
      ENSOValuesTypeCategoryObj.code:=low(Integer);
      TempENSOValuesTypeCategory.add(ENSOValuesTypeCategoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOValuesTypeCategory.save(ENSOValuesTypeCategoryObj);
    end;
  end;
end;


end.