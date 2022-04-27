
unit EditENNormativeVolumeAVZ;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENNormativeVolumeAVZController,
    ExtCtrls, ShowENDepartment, ENDepartmentController,
    ENDepartmentTypeController, ENConsts, AdvObj, ENNormVolumeAVZItemController,
    EditENNormVolumeAVZItem, EditENNormVolumeAVZItemFilter ;

type
    TfrmENNormativeVolumeAVZEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;

    HTTPRIOENNormativeVolumeAVZ: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    pnENNormativeVolumeAVZ: TPanel;
    HTTPRIOENDepartment: THTTPRIO;
    gbGeneral: TGroupBox;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    spbENBudget: TSpeedButton;
    edtENBudgetName: TEdit;
    lblDepartment: TLabel;
    lblENBudgetName: TLabel;
    gbMaterials: TGroupBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    HTTPRIOENNormVolumeAVZItem: THTTPRIO;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    sgENNormVolumeAVZItem: TAdvStringGrid;
    lblRest_purpose_type: TLabel;
    cmbRest_purpose_type: TComboBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  
  private
    function getRest_purpose_type_id : Integer;
    procedure setCmbRest_purpose_type;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNormativeVolumeAVZEdit: TfrmENNormativeVolumeAVZEdit;
  ENNormativeVolumeAVZObj: ENNormativeVolumeAVZ;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENNormVolumeAVZItemHeaders: array [1..6] of String =
        ( 'Код'
          ,'Номенклатура'
          ,'Матеріал'
          ,'Од.виміру'
          ,'Нормативна кількість'
          ,'Мінімальна необхідна кількість'
        );


implementation

uses Generics.Collections;

{uses
    EnergyproController, EnergyproController2, ENNormativeVolumeAVZController  ;
}
{$R *.dfm}

var rest_purpose_types : TList<Integer>;

procedure TfrmENNormativeVolumeAVZEdit.setCmbRest_purpose_type;
var idx : Integer;
begin
  if (not Assigned(ENNormativeVolumeAVZObj))
    or (ENNormativeVolumeAVZObj.rest_purpose_type_id = Low(Integer))
    or (DialogState = dsInsert) then Exit;

  idx := rest_purpose_types.IndexOf(ENNormativeVolumeAVZObj.rest_purpose_type_id);
  if (not (rest_purpose_types.Contains(ENNormativeVolumeAVZObj.rest_purpose_type_id)))
    or (idx < 0) or (idx >= cmbRest_purpose_type.Items.Count)  then begin
      raise Exception.Create('Помилка при визначенні типу залишка');
    end;

  cmbRest_purpose_type.ItemIndex := rest_purpose_types.IndexOf(ENNormativeVolumeAVZObj.rest_purpose_type_id);
end;

function TfrmENNormativeVolumeAVZEdit.getRest_purpose_type_id : Integer;
var rest_purpose_type_id : Integer;
begin

  rest_purpose_type_id := rest_purpose_types[cmbRest_purpose_type.ItemIndex];
  if rest_purpose_type_id < 0 then raise Exception.Create('Помилка при визначенні типу залишка');
  Result := rest_purpose_type_id;
end;

procedure TfrmENNormativeVolumeAVZEdit.FormShow(Sender: TObject);
var
  i : Integer;
  TempENDepartment : ENDepartmentControllerSoapPort;
  TempENNormVolumeAVZItem : ENNormVolumeAVZItemControllerSoapPort;
  ENNormVolumeAVZItemList : ENNormVolumeAVZItemShortList;
  normVolumeAVZItemFilter : ENNormVolumeAVZItemFilter;
begin
  gbMaterials.Visible := (DialogState <> dsInsert);
  SetGridHeaders(ENNormVolumeAVZItemHeaders, sgENNormVolumeAVZItem.ColumnHeaders);
  ColCount:=100;
  TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;

  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbENBudget, spbDepartment]);
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENBudgetName, edtDepartment]);
    DenyBlankValues([edtENBudgetName, edtDepartment]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    normVolumeAVZItemFilter := ENNormVolumeAVZItemFilter.Create;
    SetNullIntProps(normVolumeAVZItemFilter);
    SetNullXSProps(normVolumeAVZItemFilter);

    normVolumeAVZItemFilter.normativeVolumeRef := ENNormativeVolumeAVZRef.Create;
    normVolumeAVZItemFilter.normativeVolumeRef.code := ENNormativeVolumeAVZObj.code;

    ENNormVolumeAVZItemList := TempENNormVolumeAVZItem.getScrollableFilteredList(normVolumeAVZItemFilter,0,-1);

    LastCount:=High(ENNormVolumeAVZItemList.list);

    if LastCount > -1 then
      sgENNormVolumeAVZItem.RowCount:=LastCount+2
    else
      sgENNormVolumeAVZItem.RowCount:=2;

    with sgENNormVolumeAVZItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENNormVolumeAVZItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENNormVolumeAVZItemList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENNormVolumeAVZItemList.list[i].nomenclaturNumber;
        Cells[2,i+1] := ENNormVolumeAVZItemList.list[i].materialRefName;
        Cells[3,i+1] := ENNormVolumeAVZItemList.list[i].measurementName;

        if ENNormVolumeAVZItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENNormVolumeAVZItemList.list[i].countGen.DecimalString;

        if ENNormVolumeAVZItemList.list[i].countRequired = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENNormVolumeAVZItemList.list[i].countRequired.DecimalString;

        sgENNormVolumeAVZItem.RowCount := i + 2;
      end;

      sgENNormVolumeAVZItem.Row:=1;


    if (DialogState = dsEdit) then
    begin
      DisableControls([edtENBudgetName, edtDepartment, spbENBudget, spbDepartment,
        cmbRest_purpose_type]);
      DenyBlankValues([edtENBudgetName, edtDepartment, cmbRest_purpose_type]);
    end;

    if ENNormativeVolumeAVZObj.budgetRef <> nil then
      if ENNormativeVolumeAVZObj.budgetRef.code <> low(Integer) then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

        edtENBudgetName.Text := TempENDepartment.getObject(ENNormativeVolumeAVZObj.budgetRef.code).shortName;
      end;

    if ENNormativeVolumeAVZObj.departmentRef <> nil then
      if ENNormativeVolumeAVZObj.departmentRef.code <> low(Integer) then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

        edtDepartment.Text := TempENDepartment.getObject(ENNormativeVolumeAVZObj.departmentRef.code).shortName;
      end;

    edtCode.Text := IntToStr(ENNormativeVolumeAVZObj.code);
  end;
  setCmbRest_purpose_type;
end;


procedure TfrmENNormativeVolumeAVZEdit.spbDepartmentClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          if ENNormativeVolumeAVZObj.departmentRef = nil then ENNormativeVolumeAVZObj.departmentRef := ENDepartmentRef.Create();
          ENNormativeVolumeAVZObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.spbENBudgetClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          if ENNormativeVolumeAVZObj.budgetRef = nil then ENNormativeVolumeAVZObj.budgetRef := ENDepartmentRef.Create();
          ENNormativeVolumeAVZObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName ;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENNormVolumeAVZItem.RowCount-1 do
   for j:=0 to sgENNormVolumeAVZItem.ColCount-1 do
     sgENNormVolumeAVZItem.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENNormativeVolumeAVZEdit.actDeleteExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempENNormVolumeAVZItem : ENNormVolumeAVZItemControllerSoapPort;
begin
  inherited;
  TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
  try
    ObjCode := StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строка довідника нормативних обсягів АВЗ) ?'),
                  PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENNormVolumeAVZItem.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.actEditExecute(Sender: TObject);
var
  TempENNormVolumeAVZItem : ENNormVolumeAVZItemControllerSoapPort;
begin
  inherited;
  TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
  try
    ENNormVolumeAVZItemObj := TempENNormVolumeAVZItem.getObject(StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsEdit);
  try
  if frmENNormVolumeAVZItemEdit.ShowModal= mrOk then
    begin
      UpdateGrid(Sender);
    end;
  finally
    frmENNormVolumeAVZItemEdit.Free;
    frmENNormVolumeAVZItemEdit:=nil;
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.actInsertExecute(Sender: TObject);
begin
  inherited;
  ENNormVolumeAVZItemObj := ENNormVolumeAVZItem.Create;
  ENNormVolumeAVZItemObj.normativeVolumeRef := ENNormativeVolumeAVZRef.Create;
  ENNormVolumeAVZItemObj.normativeVolumeRef.code := ENNormativeVolumeAVZObj.code;
  try
    frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsInsert);
    try
      if frmENNormVolumeAVZItemEdit.ShowModal = mrOk then
      begin
        if ENNormVolumeAVZItemObj <> nil then
          UpdateGrid(Sender);
      end;
    finally
      frmENNormVolumeAVZItemEdit.Free;
      frmENNormVolumeAVZItemEdit:=nil;
    end;
  finally
    ENNormVolumeAVZItemObj.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid(Sender);
end;


procedure TfrmENNormativeVolumeAVZEdit.actViewExecute(Sender: TObject);
var
  TempENNormVolumeAVZItem: ENNormVolumeAVZItemControllerSoapPort;
begin
  inherited;
  TempENNormVolumeAVZItem := HTTPRIOENNormVolumeAVZItem as ENNormVolumeAVZItemControllerSoapPort;
  try
    ENNormVolumeAVZItemObj := TempENNormVolumeAVZItem.getObject(StrToInt(sgENNormVolumeAVZItem.Cells[0,sgENNormVolumeAVZItem.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENNormVolumeAVZItemEdit:=TfrmENNormVolumeAVZItemEdit.Create(Application, dsView);
  try
    frmENNormVolumeAVZItemEdit.ShowModal;
  finally
    frmENNormVolumeAVZItemEdit.Free;
    frmENNormVolumeAVZItemEdit:=nil;
  end;
end;


procedure TfrmENNormativeVolumeAVZEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtENBudgetName, edtDepartment, cmbRest_purpose_type]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENNormativeVolumeAVZ := HTTPRIOENNormativeVolumeAVZ as ENNormativeVolumeAVZControllerSoapPort;

    ENNormativeVolumeAVZObj.rest_purpose_type_name := cmbRest_purpose_type.Text;
    ENNormativeVolumeAVZObj.rest_purpose_type_id := getRest_purpose_type_id;

    if DialogState = dsInsert then
    begin
      ENNormativeVolumeAVZObj.code:=low(Integer);
      TempENNormativeVolumeAVZ.add(ENNormativeVolumeAVZObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENNormativeVolumeAVZ.save(ENNormativeVolumeAVZObj);
    end;
  end;
end;

initialization

rest_purpose_types := TList<Integer>.Create;
rest_purpose_types.AddRange([REST_PURPOSE_TYPE_ID_AVAR
  , REST_PURPOSE_TYPE_ID_PVZ, REST_PURPOSE_TYPE_ID_AVR16]);


end.