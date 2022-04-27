
unit EditENInspectionSheetFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENInspectionSheetController;

type
    TfrmENInspectionSheetFilterEdit = class(TDialogForm)
    lblDateGen : TLabel;
    edtDateGenStart: TDateTimePicker;
    lblDateEdit : TLabel;
    edtDateGenEnd: TDateTimePicker;
    HTTPRIOENInspectionSheet: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Label4: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    Label3: TLabel;
    cbInspectionKind: TComboBox;
    cbStatus: TComboBox;
    edtElementType: TEdit;
    spbENElementType: TSpeedButton;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    spbENElementTypeClear: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementTypeClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbENElementTypeClearClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    elementTypeCode: Integer;
    renCondition : string;

end;

var
  frmENInspectionSheetFilterEdit: TfrmENInspectionSheetFilterEdit;
  ENInspectionSheetFilterObj: ENInspectionSheetFilter;

implementation


uses ShowENEPRen, ShowENElementType, ENElementTypeController,
  ENInspectionSheetStatusController, ShowENElement, ENElementController;

{$R *.dfm}



procedure TfrmENInspectionSheetFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  elementTypeCode := Low(Integer);
  renCondition := '';
end;


procedure TfrmENInspectionSheetFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtElementType, edtDepartment, edtENElementName]);
  DenyBlankValues([edtDateGenStart, edtDateGenEnd, edtElementType, edtENElementName, edtDepartment, cbInspectionKind, cbStatus]);
end;


procedure TfrmENInspectionSheetFilterEdit.spbDepartmentClearClick(Sender: TObject);
begin
  inherited;
  edtDepartment.Text := '';
  renCondition := '';
end;


procedure TfrmENInspectionSheetFilterEdit.spbDepartmentClick(Sender: TObject);
var
  frmENEPRenShow: TfrmENEPRenShow;
begin
  inherited;
  frmENEPRenShow := TfrmENEPRenShow.Create(Application, fmNormal);
  try
    with frmENEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          edtDepartment.Text := GetReturnValue(sgEPRen, 1);
          renCondition := ' enelement.renrefcode = ' + GetReturnValue(sgEPRen, 0);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENEPRenShow.Free;
  end;
end;


procedure TfrmENInspectionSheetFilterEdit.spbENElementClearClick(Sender: TObject);
begin
  inherited;
  edtENElementName.Text := '';
  ENInspectionSheetFilterObj.elementRef := nil;
end;


procedure TfrmENInspectionSheetFilterEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
  //invNum, depName: String;
  //depCode : Integer;
begin
  inherited;

  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);
  try
    with frmENElementShow do
    if ShowModal = mrOk then
    begin
      try
        if ENInspectionSheetFilterObj.elementRef = nil then ENInspectionSheetFilterObj.elementRef := ENElementRef.Create();
        ENInspectionSheetFilterObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
        edtENElementName.Text := GetReturnValue(sgENElement,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementShow.Free;
  end;
end;


procedure TfrmENInspectionSheetFilterEdit.spbENElementTypeClearClick(Sender: TObject);
begin
  inherited;
  edtElementType.Text := '';
  elementTypeCode := Low(Integer);
end;


procedure TfrmENInspectionSheetFilterEdit.spbENElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  f: ENElementTypeFilter;
begin
  inherited;
  f := ENElementTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  frmENElementTypeShow := TfrmENElementTypeShow.Create(Application,fmNormal, f);
  DisableActions([frmENElementTypeShow.actInsert, frmENElementTypeShow.actEdit,
    frmENElementTypeShow.actFilter, frmENElementTypeShow.actNoFilter, frmENElementTypeShow.actDelete]);
  try
    with frmENElementTypeShow do
    if ShowModal = mrOk then
    begin
      try
        elementTypeCode := StrToInt(GetReturnValue(sgENElementType,0));
        edtElementType.Text := GetReturnValue(sgENElementType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementTypeShow.Free;
  end;
end;


procedure TfrmENInspectionSheetFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  condition : string;
begin
  if (ModalResult = mrOk)  then
  begin
    condition := '';

    if (cbInspectionKind.ItemIndex > 0) then
      ENInspectionSheetFilterObj.inspectionKind := cbInspectionKind.ItemIndex
    else
      ENInspectionSheetFilterObj.inspectionKind := Low(Integer);

    if (cbStatus.ItemIndex > 0) then
    begin
      if ENInspectionSheetFilterObj.statusRef = nil then ENInspectionSheetFilterObj.statusRef := ENInspectionSheetStatusRef.Create;
      ENInspectionSheetFilterObj.statusRef.code := cbStatus.ItemIndex - 1;
    end;

    if (elementTypeCode <> Low(Integer)) then
      AddCondition(condition, ' enelement.typerefcode = ' + IntToStr(elementTypeCode));

    if (renCondition <> '') then
      AddCondition(condition, renCondition);

    if (edtDateGenStart.Checked) then
    begin
      AddCondition(condition, ' eninspectionsheet.dategen >= to_date(''' + DateToStr(edtDateGenStart.Date) + ''', ''dd.MM.yyyy'')');
    end;

    if (edtDateGenEnd.Checked) then
    begin
      AddCondition(condition, ' eninspectionsheet.dategen <= to_date(''' + DateToStr(edtDateGenEnd.Date) + ''', ''dd.MM.yyyy'')');
    end;

    if (ENInspectionSheetFilterObj.conditionSQL <> '') then
      ENInspectionSheetFilterObj.conditionSQL := ENInspectionSheetFilterObj.conditionSQL + ' and ' + condition
    else
      ENInspectionSheetFilterObj.conditionSQL := condition;

  end;
end;


end.