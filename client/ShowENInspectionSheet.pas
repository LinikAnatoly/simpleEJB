
unit ShowENInspectionSheet;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs,
    ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
    DialogFormUnit, DlgUnit, GridHeadersUnit, ENInspectionSheetController, AdvObj;


type
    TfrmENInspectionSheetShow = class(TChildForm)  
    HTTPRIOENInspectionSheet: THTTPRIO;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENInspectionSheet: TAdvStringGrid;
    pmInspectionSheet: TPopupMenu;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    miSendToSigning: TMenuItem;
    miUnSigning: TMenuItem;
    miSigned: TMenuItem;
    miUnSigned: TMenuItem;
    alInspectionSheet: TActionList;
    actViewInspectionSheet: TAction;
    actInsertENInspectionSheet: TAction;
    actDeleteENInspectionSheet: TAction;
    actEditENInspectionSheet: TAction;
    actUpdateENInspectionSheet: TAction;
    actSendToSigning: TAction;
    actUnSigning: TAction;
    actSigned: TAction;
    actUnSigned: TAction;
    ToolButton4: TToolButton;
    actMakePlan: TAction;
    actExpExcel: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    actCopySheet: TAction;
    btnPrintRegisterDefects: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENInspectionSheetTopLeftChanged(Sender: TObject);
    procedure sgENInspectionSheetDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSendToSigningExecute(Sender: TObject);
    procedure actUnSigningExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure pmInspectionSheetPopup(Sender: TObject);
    procedure sgENInspectionSheetClick(Sender: TObject);
    procedure actMakePlanExecute(Sender: TObject);
    procedure actExpExcelExecute(Sender: TObject);
    procedure actCopySheetExecute(Sender: TObject);
    procedure btnPrintRegisterDefectsClick(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
   usedFilter: Boolean;
   equipmentKindCode: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENInspectionSheetShow : TfrmENInspectionSheetShow;
 // ENInspectionSheetObj: ENInspectionSheet;
 // ENInspectionSheetFilterObj: ENInspectionSheetFilter;
  
  
implementation

uses
  Main, EditENInspectionSheet, EditENInspectionSheetFilter, ENConsts,
  ENElementController, ShowENDepartment, ENDepartmentController, DMReportsUnit,
  AddPlanFromInspectionSheet, ENPlanWorkController, ENPlanWorkTypeController,
  PrintRegisterDefects;


{$R *.dfm}

var
  //frmENInspectionSheetShow : TfrmENInspectionSheetShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInspectionSheetHeaders: array [1..11] of String =
        ( 'Код'
          ,'Тип об''єкту'
          ,'Інвентарний номер'
          ,'Найменування'
          ,'Підрозділ'
          ,'Назва'
          ,'Вид огляду'
          ,'Статус'
          ,'Дата складання'
          ,'користувач який змінив запис'
          ,'Дата ост. зміни'
        );
   

procedure TfrmENInspectionSheetShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENInspectionSheetShow:=nil;
  inherited;
end;


procedure TfrmENInspectionSheetShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
  usedFilter := False;
  equipmentKindCode := Low(Integer);
end;


procedure TfrmENInspectionSheetShow.FormShow(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  i: Integer;
  ENInspectionSheetList: ENInspectionSheetShortList;
begin
  DisableActions([actSendToSigning, actUnSigning, actSigned, actUnSigned, actMakePlan]);

  SetGridHeaders(ENInspectionSheetHeaders, sgENInspectionSheet.ColumnHeaders);

  if FormMode=fmFiltered then DisableActions([actFilter, actNoFilter]);

  if ColCount <> -1 then ColCount:=100;

  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENInspectionSheetFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
  end;

  ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(ENInspectionSheetFilter(FilterObject),0,ColCount);
  LastCount:=High(ENInspectionSheetList.list);

  if LastCount > -1 then
     sgENInspectionSheet.RowCount:=LastCount+2
  else
     sgENInspectionSheet.RowCount:=2;

   with sgENInspectionSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInspectionSheetList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInspectionSheetList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENInspectionSheetList.list[i].elementType;
        Cells[2,i+1] := ENInspectionSheetList.list[i].objectInvNumber;
        Cells[3,i+1] := ENInspectionSheetList.list[i].objectName;
        Cells[4,i+1] := ENInspectionSheetList.list[i].renName;
        Cells[5,i+1] := ENInspectionSheetList.list[i].name;
        Cells[6,i+1] := ENInspectionSheetList.list[i].inspectionKindName;
        Cells[7,i+1] := ENInspectionSheetList.list[i].statusRefName;

        if ENInspectionSheetList.list[i].dateGen = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateGen);

        Cells[9,i+1] := ENInspectionSheetList.list[i].userGen;

        if ENInspectionSheetList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(ENInspectionSheetList.list[i].dateEdit);

        LastRow:=i+1;
        sgENInspectionSheet.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENInspectionSheet.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENInspectionSheet.RowCount > selectedRow then
      sgENInspectionSheet.Row := selectedRow
    else
      sgENInspectionSheet.Row := sgENInspectionSheet.RowCount - 1;
    end
    else
      sgENInspectionSheet.Row:=1;

  sgENInspectionSheetClick(Sender);
end;


procedure TfrmENInspectionSheetShow.pmInspectionSheetPopup(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actSendToSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actUnSigning.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE);
  actUnSigned.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED);

  actEdit.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actDelete.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
end;


procedure TfrmENInspectionSheetShow.sgENInspectionSheetTopLeftChanged(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  i,CurrentRow: Integer;
  ENInspectionSheetList: ENInspectionSheetShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENInspectionSheet.TopRow + sgENInspectionSheet.VisibleRowCount) = ColCount
  then
  begin
    TempENInspectionSheet :=  HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    CurrentRow:=sgENInspectionSheet.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENInspectionSheetFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENInspectionSheetList := TempENInspectionSheet.getScrollableFilteredList(ENInspectionSheetFilter(FilterObject),ColCount-1, 100);

    sgENInspectionSheet.RowCount:=sgENInspectionSheet.RowCount+100;
    LastCount:=High(ENInspectionSheetList.list);
    with sgENInspectionSheet do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENInspectionSheetList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENInspectionSheetList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENInspectionSheetList.list[i].elementType;
        Cells[2,i+CurrentRow] := ENInspectionSheetList.list[i].objectInvNumber;
        Cells[3,i+CurrentRow] := ENInspectionSheetList.list[i].objectName;
        Cells[4,i+CurrentRow] := ENInspectionSheetList.list[i].renName;
        Cells[5,i+CurrentRow] := ENInspectionSheetList.list[i].name;
        Cells[6,i+CurrentRow] := ENInspectionSheetList.list[i].inspectionKindName;
        Cells[7,i+CurrentRow] := ENInspectionSheetList.list[i].statusRefName;

        if ENInspectionSheetList.list[i].dateGen = nil then
          Cells[8,i+CurrentRow] := ''
        else
          Cells[8,i+CurrentRow] := XSDate2String(ENInspectionSheetList.list[i].dateGen);

        Cells[9,i+CurrentRow] := ENInspectionSheetList.list[i].userGen;

        if ENInspectionSheetList.list[i].dateEdit = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(ENInspectionSheetList.list[i].dateEdit);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENInspectionSheet.Row:=CurrentRow-5;
   sgENInspectionSheet.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENInspectionSheetShow.sgENInspectionSheetClick(Sender: TObject);
var
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if inspectionSheet = nil then Exit;
  if inspectionSheet.code = Low(Integer) then Exit;

  actEdit.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  //  actEdit.Enabled := ((inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT) or (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE));
  actDelete.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT);
  actMakePlan.Enabled := (inspectionSheet.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED) and (inspectionSheet.planRef.code = Low(Integer));
end;


procedure TfrmENInspectionSheetShow.sgENInspectionSheetDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENInspectionSheet,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENInspectionSheet.RowCount-1 do
   for j:=0 to sgENInspectionSheet.ColCount-1 do
     sgENInspectionSheet.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENInspectionSheetShow.actViewExecute(Sender: TObject);
var 
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  selectedRow := sgENInspectionSheet.Row;
  frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsView);

  try
    frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  if frmENInspectionSheetEdit.ENInspectionSheetObj = nil then Exit;
  
  try
    frmENInspectionSheetEdit.ShowModal;
  finally
    frmENInspectionSheetEdit.Free;
    frmENInspectionSheetEdit:=nil;
  end;

  if sgENInspectionSheet.RowCount > selectedRow then
    sgENInspectionSheet.Row := selectedRow
  else
    sgENInspectionSheet.Row := sgENInspectionSheet.RowCount - 1;
  
end;


procedure TfrmENInspectionSheetShow.btnPrintRegisterDefectsClick(Sender: TObject);
begin
  inherited;
  frmPrintRegisterDefects := TfrmPrintRegisterDefects.Create(Application, dsInsert);
  try
    frmPrintRegisterDefects.ShowModal;
  finally
    frmPrintRegisterDefects.Free;
    frmPrintRegisterDefects := nil;
  end;
end;


procedure TfrmENInspectionSheetShow.actEditExecute(Sender: TObject);
var 
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  selectedRow := sgENInspectionSheet.Row;
  frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsEdit);

  try
    frmENInspectionSheetEdit.ENInspectionSheetObj := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  try
    if frmENInspectionSheetEdit.ShowModal= mrOk then
      begin
        //TempENInspectionSheet.save(ENInspectionSheetObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENInspectionSheetEdit.Free;
    frmENInspectionSheetEdit:=nil;
  end;

  if sgENInspectionSheet.RowCount > selectedRow then
    sgENInspectionSheet.Row := selectedRow
  else
    sgENInspectionSheet.Row := sgENInspectionSheet.RowCount - 1;
  
end;


procedure TfrmENInspectionSheetShow.actExpExcelExecute(Sender: TObject);
begin
  inherited;
  begin
    Application.ProcessMessages;
    if usedFilter then ColCount := -1;
    UpdateGrid(Sender);
  end;

  DMReports.exportGrid(sgENInspectionSheet, 'Список_листів_огляду_');
end;


procedure TfrmENInspectionSheetShow.actCopySheetExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  newSheetCode, objCode: Integer;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    objCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;

  if objCode = Low(Integer) then Exit;
  

  if Application.MessageBox(PChar('Ви дійсно бажаєте копіювати (Лист огляду об`єкта енергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    newSheetCode := TempENInspectionSheet.copySheet(objCode);

    Application.MessageBox(PChar('Лист огляду скопійовано! Код = ' + IntToStr(newSheetCode)), PChar('Повідомлення'), MB_ICONINFORMATION);

    ENInspectionSheetFilter(FilterObject).conditionSQL :=
      ' eninspectionsheet.code in (' + IntToStr(objCode) + ',' + IntToStr(newSheetCode) + ')';

    UpdateGrid(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.actDeleteExecute(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  ObjCode: Integer;
begin
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    ObjCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Лист огляду об`єкта енергетики) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.remove(ObjCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.actInsertExecute(Sender: TObject);
// Var TempENInspectionSheet: ENInspectionSheetControllerSoapPort; 
begin
  try
    frmENInspectionSheetEdit := TfrmENInspectionSheetEdit.Create(Application, dsInsert);

    frmENInspectionSheetEdit.ENInspectionSheetObj := ENInspectionSheet.Create;
    SetNullIntProps(frmENInspectionSheetEdit.ENInspectionSheetObj);
    SetNullXSProps(frmENInspectionSheetEdit.ENInspectionSheetObj);

    try
      if frmENInspectionSheetEdit.ShowModal = mrOk then
      begin
        if frmENInspectionSheetEdit.ENInspectionSheetObj<>nil then
            //TempENInspectionSheet.add(ENInspectionSheetObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENInspectionSheetEdit.Free;
      frmENInspectionSheetEdit:=nil;
    end;
  finally
    // ENInspectionSheetObj.Free;
  end;
end;


procedure TfrmENInspectionSheetShow.actMakePlanExecute(Sender: TObject);
var
  el: ENElement;
  depShort: ENDepartmentShort;
  inspectionSheet: ENInspectionSheet;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

  try
    inspectionSheet := TempENInspectionSheet.getObject(StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]));
  except
    on EConvertError do Exit;
  end;

  el := DMReports.getElementByCode(inspectionSheet.elementRef.code);
  depShort := DMReports.getDepartmentByRenCode(el.renRef.code, ENMANAGEMENT_TYPE_TECHNICAL);

  try
    frmAddPlanFromInspectionSheet := TfrmAddPlanFromInspectionSheet.Create(Application, dsInsert);
    try
      frmAddPlanFromInspectionSheet.inspectionSheetCode := inspectionSheet.code;

      frmAddPlanFromInspectionSheet.ENPlanWorkObj := ENPlanWork.Create;
      SetNullIntProps(frmAddPlanFromInspectionSheet.ENPlanWorkObj);
      SetNullXSProps(frmAddPlanFromInspectionSheet.ENPlanWorkObj);

      frmAddPlanFromInspectionSheet.ENPlanWorkObj.elementRef := ENElementRef.Create;
      frmAddPlanFromInspectionSheet.ENPlanWorkObj.elementRef.code := inspectionSheet.elementRef.code;

      frmAddPlanFromInspectionSheet.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
      frmAddPlanFromInspectionSheet.ENPlanWorkObj.departmentRef.code := depShort.code;

      if inspectionSheet.inspectionKind = ENINSPECTIONSHEET_KIND_PLANED then
      begin
        frmAddPlanFromInspectionSheet.cbENPlanWorkFormName.ItemIndex := 0;
        frmAddPlanFromInspectionSheet.cbPlanWorkKind.ItemIndex := 0;

      end else
      begin
        frmAddPlanFromInspectionSheet.cbENPlanWorkFormName.ItemIndex := 1;
        frmAddPlanFromInspectionSheet.cbPlanWorkKind.ItemIndex := 1;

        if frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef = nil then
          frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
        frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef.code := ENPLANWORKTYPE_AVR;
        frmAddPlanFromInspectionSheet.edtTypeName.Text := 'Аварійно-відновлювальні роботи';

        DialogForm.DisableControls([frmAddPlanFromInspectionSheet.spbType]);
      end;

      DialogForm.DisableControls([frmAddPlanFromInspectionSheet.cbENPlanWorkFormName, frmAddPlanFromInspectionSheet.cbPlanWorkKind]);


      if frmAddPlanFromInspectionSheet.ShowModal = mrOk then
      begin
        // if frmAddPlanFromInspectionSheet.ENInspectionSheetObj<>nil then
        //    UpdateGrid(Sender);
      end;
    finally
      frmAddPlanFromInspectionSheet.Free;
      frmAddPlanFromInspectionSheet:=nil;
    end;
  finally
    inspectionSheet.Free;
  end;

  UpdateGrid(Sender);
end;


procedure TfrmENInspectionSheetShow.actUnSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet : ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання листа огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigned(sheetCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.actUnSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду в статус "чорновий"?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.unSigning(sheetCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENInspectionSheetShow.actFilterExecute(Sender: TObject);
begin
  frmENInspectionSheetFilterEdit := TfrmENInspectionSheetFilterEdit.Create(Application, dsInsert);
  try

    if FilterObject <> nil then
      if ENInspectionSheetFilter(FilterObject).equipmentKind <> Low(Integer) then
        equipmentKindCode := ENInspectionSheetFilter(FilterObject).equipmentKind;

    ENInspectionSheetFilterObj := ENInspectionSheetFilter.Create;
    SetNullIntProps(ENInspectionSheetFilterObj);
    SetNullXSProps(ENInspectionSheetFilterObj);

    if equipmentKindCode <> Low(Integer) then
    begin
      ENInspectionSheetFilterObj.equipmentKind := equipmentKindCode;
    end;


    if frmENInspectionSheetFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      usedFilter := True;

      FilterObject := ENInspectionSheetFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENInspectionSheetFilterEdit.Free;
    frmENInspectionSheetFilterEdit:=nil;
  end;
end;


procedure TfrmENInspectionSheetShow.actNoFilterExecute(Sender: TObject);
begin

  if FilterObject <> nil then
    if ENInspectionSheetFilter(FilterObject).equipmentKind <> Low(Integer) then
      equipmentKindCode := ENInspectionSheetFilter(FilterObject).equipmentKind;

  FilterObject.Free;
  FilterObject := nil;

  if equipmentKindCode <> Low(Integer) then
  begin
    FilterObject := ENInspectionSheetFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
    ENInspectionSheetFilter(FilterObject).equipmentKind := equipmentKindCode;
  end;

  selectedRow := 1;
  usedFilter:= False;
  UpdateGrid(Sender);
end;


procedure TfrmENInspectionSheetShow.actSendToSigningExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести лист огляду на підпис?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.sendToSigning(sheetCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmENInspectionSheetShow.actSignedExecute(Sender: TObject);
var
  sheetCode: Integer;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  inherited;
  TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
  try
    sheetCode := StrToInt(sgENInspectionSheet.Cells[0,sgENInspectionSheet.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати лист огляду?'),
                  PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENInspectionSheet.signed(sheetCode);
    UpdateGrid(Sender);
  end;
end;


end.