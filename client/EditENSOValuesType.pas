
unit EditENSOValuesType;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOValuesTypeController, ENSOValuesTypeCategoryController;

type
  TfrmENSOValuesTypeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblSortField : TLabel;
    edtSortField: TEdit;


  HTTPRIOENSOValuesType: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCategory: TLabel;
    edtCategory: TEdit;
    btnENSOValuesTypeCategory: TSpeedButton;
    HTTPRIOENSOValuesTypeCategory: THTTPRIO;
    btnENSOValuesTypeCategoryClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENSOValuesTypeCategoryClick(Sender: TObject);
    procedure btnENSOValuesTypeCategoryClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSOValuesTypeEdit: TfrmENSOValuesTypeEdit;
  ENSOValuesTypeObj: ENSOValuesType;

implementation


uses ShowENSOValuesTypeCategory;

{$R *.dfm}



procedure TfrmENSOValuesTypeEdit.FormShow(Sender: TObject);
var TempENSOValuesTypeCategory : ENSOValuesTypeCategoryControllerSoapPort;
category : ENSOValuesTypeCategory;
begin
  DisableControls([edtCode, edtCategory]);

  TempENSOValuesTypeCategory := HTTPRIOENSOValuesTypeCategory as ENSOValuesTypeCategoryControllerSoapPort;

  if DialogState = dsView then
  begin
    DisableControls([btnENSOValuesTypeCategory]);

  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtSortField
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENSOValuesTypeObj.code);
    edtName.Text := ENSOValuesTypeObj.name;
    if ( ENSOValuesTypeObj.sortField <> Low(Integer) ) then
       edtSortField.Text := IntToStr(ENSOValuesTypeObj.sortField)
    else
       edtSortField.Text := '';

    if (Assigned(ENSOValuesTypeObj.categoryRef))
      and (ENSOValuesTypeObj.categoryRef.code <> Low(Integer))  then begin
      category := TempENSOValuesTypeCategory.getObject(ENSOValuesTypeObj.categoryRef.code);
      edtCategory.Text := category.Name;
    end;

  end;
end;



procedure TfrmENSOValuesTypeEdit.btnENSOValuesTypeCategoryClearClick(
  Sender: TObject);
begin
  inherited;
  if Assigned(ENSOValuesTypeObj.categoryRef) then begin
    ENSOValuesTypeObj.categoryRef.code := Low(Integer);
    edtCategory.Text := '';
  end;

end;

procedure TfrmENSOValuesTypeEdit.btnENSOValuesTypeCategoryClick(
  Sender: TObject);
var category : ENSOValuesTypeCategoryShort;
  begin
  inherited;
  category := TfrmENSOValuesTypeCategoryShow.chooseFromList;
  if Assigned(category) then begin
    if not Assigned(ENSOValuesTypeObj.categoryRef) then
      ENSOValuesTypeObj.categoryRef := ENSOValuesTypeCategoryRef.Create;
    ENSOValuesTypeObj.categoryRef.code := category.code;
    edtCategory.Text := category.name;
  end;

end;

procedure TfrmENSOValuesTypeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      ,edtSortField
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENSOValuesType := HTTPRIOENSOValuesType as ENSOValuesTypeControllerSoapPort;


     ENSOValuesTypeObj.name := edtName.Text; 

     if ( edtSortField.Text <> '' ) then
       ENSOValuesTypeObj.sortField := StrToInt(edtSortField.Text)
     else
       ENSOValuesTypeObj.sortField := Low(Integer) ;


    if DialogState = dsInsert then
    begin
      ENSOValuesTypeObj.code:=low(Integer);
      TempENSOValuesType.add(ENSOValuesTypeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSOValuesType.save(ENSOValuesTypeObj);
    end;
  end;
end;


end.