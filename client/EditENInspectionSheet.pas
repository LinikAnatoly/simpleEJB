
unit EditENInspectionSheet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENInspectionSheetController,
    TB2Item, TB2Dock, TB2Toolbar, AdvObj, EnergyproController, DMReportsUnit;

type
    TfrmENInspectionSheetEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;
    edtName: TEdit;

    HTTPRIOENInspectionSheet: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    gbInspectionSheetItem: TGroupBox;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem47: TTBItem;
    TBItem46: TTBItem;
    HTTPRIOENInspectionSheetItem: THTTPRIO;
    btnPrint: TButton;
    sgENInspectionSheetItem: TAdvStringGrid;
    btnMakePlan: TButton;
    lblInspectionKind: TLabel;
    cbInspectionKind: TComboBox;
    lblExecutor: TLabel;
    edtExecutor: TEdit;
    lblAccepted: TLabel;
    edtAccepted: TEdit;
    spbExecutor: TSpeedButton;
    spbAccepted: TSpeedButton;
    HTTPRIOENPlanWork: THTTPRIO;
    edtElementInvNumber: TEdit;
    edtElementName: TEdit;
    chkTakeIntoCalculation: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadItems();
    procedure actEditExecute(Sender: TObject);
    procedure sgENInspectionSheetItemDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure sgENInspectionSheetItemClick(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnMakePlanClick(Sender: TObject);
    procedure spbExecutorClick(Sender: TObject);
    procedure spbAcceptedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  
  private
    { Private declarations }
    planCode: Integer;
    chkTakeIntoCalculationShowState : Boolean;
  public
    { Public declarations }
    ENInspectionSheetObj: ENInspectionSheet;

end;

var
  frmENInspectionSheetEdit: TfrmENInspectionSheetEdit;
  // ENInspectionSheetObj: ENInspectionSheet;


implementation


uses
  ENInspectionSheetItemController, EditENInspectionSheetItem, ENConsts,
  AddPlanFromInspectionSheet, ENPlanWorkController, ENElementController,
  ENPlanWorkTypeController, ENDepartmentController, FINWorkerController,
  ShowFINWorker, EditENPlanWork;

{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENInspectionSheetItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Шифр дефекту'
          ,'Найменування (характеристика) дефекту'
          ,'Результат'
          ,'Кількість робіт (для плану)'
          ,'Коментар'
          ,'Кількість дефектів'
          ,'Кількість унік. дефектів / Дефектна довжина лінії, км'
          ,'Коєфіцієнт імовірності відмовлення об''єкта Ki'
          ,'Бали дефекту Pi'
          ,'Вага дефекту Xi'
        );



procedure TfrmENInspectionSheetEdit.FormShow(Sender: TObject);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  DisableControls([edtCode, edtElementInvNumber, edtElementName]);
  DisableActions([actEdit], DialogState = dsView);
  btnMakePlan.Visible := False;
  btnPrint.Visible := (DialogState <> dsInsert);

  if (DialogState = dsView) then
  begin
    DisableControls([cbInspectionKind, spbExecutor, spbAccepted]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtExecutor, edtAccepted]);
    DenyBlankValues([edtDateGen, cbInspectionKind]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

    edtCode.Text := IntToStr(ENInspectionSheetObj.code);
    edtName.Text := ENInspectionSheetObj.name;
    SetDateFieldForDateTimePicker(edtDateGen, ENInspectionSheetObj.dateGen);
    cbInspectionKind.ItemIndex := ENInspectionSheetObj.inspectionKind - 1;

    chkTakeIntoCalculation.Checked := (ENInspectionSheetObj.takeIntoCalculation = YES);

    edtExecutor.Text := ENInspectionSheetObj.executor;
    edtAccepted.Text := ENInspectionSheetObj.accepted;

    edtElementInvNumber.Text := ENInspectionSheetObj.objectInvNumber;
    edtElementName.Text := ENInspectionSheetObj.objectName;

    btnMakePlan.Visible := (ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED) and (ENInspectionSheetObj.planRef.code = Low(Integer));

    if (ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_SIGNED)
      and (ENInspectionSheetObj.planRef.code <> Low(Integer)) then
    begin
      planCode := ENInspectionSheetObj.planRef.code;
      btnMakePlan.Caption := 'Перегляд плану';
      btnMakePlan.Visible := True;
    end;

    DisableControls([ chkTakeIntoCalculation ] , not ((ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE) or
               (ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_DRAFT)) );
    chkTakeIntoCalculationShowState :=  chkTakeIntoCalculation.Checked;
    LoadItems;


  end;
end;


procedure TfrmENInspectionSheetEdit.actEditExecute(Sender: TObject);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  inherited;
  TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
  try
    ENInspectionSheetItemObj := TempENInspectionSheetItem.getObject(StrToInt(sgENInspectionSheetItem.Cells[0,sgENInspectionSheetItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENInspectionSheetItemEdit := TfrmENInspectionSheetItemEdit.Create(Application, dsEdit);
  try
    if frmENInspectionSheetItemEdit.ShowModal= mrOk then
    begin
      LoadItems;
    end;
  finally
    frmENInspectionSheetItemEdit.Free;
    frmENInspectionSheetItemEdit:=nil;
  end;
end;


procedure TfrmENInspectionSheetEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  LoadItems;
end;


procedure TfrmENInspectionSheetEdit.actViewExecute(Sender: TObject);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  inherited;
  TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
  try
    ENInspectionSheetItemObj := TempENInspectionSheetItem.getObject(StrToInt(sgENInspectionSheetItem.Cells[0,sgENInspectionSheetItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENInspectionSheetItemEdit := TfrmENInspectionSheetItemEdit.Create(Application, dsView);
  try
    if frmENInspectionSheetItemEdit.ShowModal= mrOk then
    begin
      // LoadItems;
    end;
  finally
    frmENInspectionSheetItemEdit.Free;
    frmENInspectionSheetItemEdit:=nil;
  end;
end;


procedure TfrmENInspectionSheetEdit.spbAcceptedClick(Sender: TObject);
var
  frmFINWorkerShow : TfrmFINWorkerShow;
  f : FINWorkerFilter;
  //w : FINWorker;
  //TempFINWorker : FINWorkerControllerSoapPort;
begin
  inherited;
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.departmentCode := '-1';

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try
    frmFINWorkerShow.dateGet := TXSDate.Create;
    frmFINWorkerShow.isShowCEO := False;
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtAccepted.Text := GetReturnValue(sgFINWorker,3) + ' - ' + GetReturnValue(sgFINWorker,1);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENInspectionSheetEdit.btnMakePlanClick(Sender: TObject);
var
  sheetCode: Integer;
  el: ENElement;
  depShort: ENDepartmentShort;
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
  TempENPlanWork: ENPlanWorkControllerSoapPort;
begin
  inherited;
  if (ENInspectionSheetObj = nil) then Exit;

  if planCode <> Low(Integer) then
  begin
    try
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      frmENPlanWorkEdit := TfrmENPlanWorkEdit.Create(Application, dsView);
      try
        frmENPlanWorkEdit.ENPlanWorkObj := TempENPlanWork.getObject(planCode);
      except
        on EConvertError do Exit;
      end;

      frmENPlanWorkEdit.ShowModal;

    finally
      frmENPlanWorkEdit.Free;
      frmENPlanWorkEdit := nil;
    end;
  end else
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;
    sheetCode := ENInspectionSheetObj.code;

    el := DMReports.getElementByCode(ENInspectionSheetObj.elementRef.code);
    depShort := DMReports.getDepartmentByRenCode(el.renRef.code, ENMANAGEMENT_TYPE_TECHNICAL);

    try
      frmAddPlanFromInspectionSheet := TfrmAddPlanFromInspectionSheet.Create(Application, dsInsert);
      try
        frmAddPlanFromInspectionSheet.inspectionSheetCode := ENInspectionSheetObj.code;

        frmAddPlanFromInspectionSheet.ENPlanWorkObj := ENPlanWork.Create;
        SetNullIntProps(frmAddPlanFromInspectionSheet.ENPlanWorkObj);
        SetNullXSProps(frmAddPlanFromInspectionSheet.ENPlanWorkObj);

        frmAddPlanFromInspectionSheet.ENPlanWorkObj.elementRef := ENElementRef.Create;
        frmAddPlanFromInspectionSheet.ENPlanWorkObj.elementRef.code := ENInspectionSheetObj.elementRef.code;

        frmAddPlanFromInspectionSheet.ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
        frmAddPlanFromInspectionSheet.ENPlanWorkObj.departmentRef.code := depShort.code;

        if ENInspectionSheetObj.inspectionKind = ENINSPECTIONSHEET_KIND_PLANED then
        begin
          frmAddPlanFromInspectionSheet.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_PLANNED - 1;
          frmAddPlanFromInspectionSheet.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_YEAR - 1;

        end else
        begin
          if ENInspectionSheetObj.inspectionKind = ENINSPECTIONSHEET_KIND_POST_ACCIDENT then
          begin
            frmAddPlanFromInspectionSheet.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;
            frmAddPlanFromInspectionSheet.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT - 1;

            if frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef = nil then
              frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
            frmAddPlanFromInspectionSheet.ENPlanWorkObj.typeRef.code := ENPLANWORKTYPE_AVR;
            frmAddPlanFromInspectionSheet.edtTypeName.Text := 'Аварійно-відновлювальні роботи';

            DisableControls([frmAddPlanFromInspectionSheet.spbType]);
            HideControls([frmAddPlanFromInspectionSheet.chkCauseDisconnection]);
          end else
          begin
            frmAddPlanFromInspectionSheet.cbENPlanWorkFormName.ItemIndex := ENPLANWORKFORM_NOPLANNED - 1;
            frmAddPlanFromInspectionSheet.cbPlanWorkKind.ItemIndex := ENPLANWORKKIND_CURRENT - 1;
          end;
        end;

        DisableControls([frmAddPlanFromInspectionSheet.cbENPlanWorkFormName, frmAddPlanFromInspectionSheet.cbPlanWorkKind]);

        if frmAddPlanFromInspectionSheet.ShowModal = mrOk then
        begin
          ENInspectionSheetObj := TempENInspectionSheet.getObject(sheetCode);
          FormShow(Sender);
        end;
      finally
        frmAddPlanFromInspectionSheet.Free;
        frmAddPlanFromInspectionSheet:=nil;
      end;
    finally
      // ENInspectionSheetObj.Free;
    end;
  end;
end;


procedure TfrmENInspectionSheetEdit.btnPrintClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENInspectionSheetObj = nil then Exit;
  if ENInspectionSheetObj.code = Low(Integer) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  reportName := 'InspectionSheet/InspectionSheet';
  argnames[0] := 'inspectionSheetCode';
  args[0] := IntToStr(ENInspectionSheetObj.code);
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENInspectionSheetEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  if ((ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert) )
  or (( chkTakeIntoCalculation.Checked <> chkTakeIntoCalculationShowState ) and (ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE)) ) then
  if not NoBlankValues([edtName]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

    ENInspectionSheetObj.name := edtName.Text;
    ENInspectionSheetObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);
    ENInspectionSheetObj.inspectionKind := cbInspectionKind.ItemIndex + 1;

    if chkTakeIntoCalculation.Checked then
      ENInspectionSheetObj.takeIntoCalculation := YES
    else
      ENInspectionSheetObj.takeIntoCalculation := NO;

    ENInspectionSheetObj.executor := edtExecutor.Text;
    ENInspectionSheetObj.accepted := edtAccepted.Text;

    if DialogState = dsInsert then
    begin
      ENInspectionSheetObj.code:=low(Integer);
      TempENInspectionSheet.add(ENInspectionSheetObj);
    end
    else
    if (( DialogState = dsEdit ) or
        (( chkTakeIntoCalculation.Checked <> chkTakeIntoCalculationShowState ) and (ENInspectionSheetObj.statusRef.code = ENINSPECTIONSHEETSTATUS_ON_SIGNATURE))
        )     then
    begin
      TempENInspectionSheet.save(ENInspectionSheetObj);
    end;
  end;
end;


procedure TfrmENInspectionSheetEdit.FormCreate(Sender: TObject);
begin
  inherited;
  planCode := Low(Integer);
end;


procedure TfrmENInspectionSheetEdit.LoadItems;
var
  i: Integer;
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
  ENInspectionSheetItemList: ENInspectionSheetItemShortList;
  inspectionSheetItemFilter: ENInspectionSheetItemFilter;
begin
  if ENInspectionSheetObj = nil then Exit;
  SetGridHeaders(ENInspectionSheetItemHeaders, sgENInspectionSheetItem.ColumnHeaders);
  ClearGrid(sgENInspectionSheetItem);
  sgENInspectionSheetItem.Options := sgENInspectionSheetItem.Options - [goColMoving];

  TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;

  inspectionSheetItemFilter := ENInspectionSheetItemFilter.Create;
  SetNullIntProps(inspectionSheetItemFilter);
  SetNullXSProps(inspectionSheetItemFilter);

  inspectionSheetItemFilter.sheetRef := ENInspectionSheetRef.Create;
  inspectionSheetItemFilter.sheetRef.code := ENInspectionSheetObj.code;

  ENInspectionSheetItemList := TempENInspectionSheetItem.getScrollableFilteredList(inspectionSheetItemFilter, 0, -1);
  LastCount := High(ENInspectionSheetItemList.list);

  if LastCount > -1 then
    sgENInspectionSheetItem.RowCount:=LastCount+2
  else
    sgENInspectionSheetItem.RowCount:=2;

   with sgENInspectionSheetItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENInspectionSheetItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENInspectionSheetItemList.list[i].code)
        else
          Cells[0,i+1] := '';


        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode = Low(Integer) then
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clYellow;
          CellProperties[2, i+1].FontStyle := CellProperties[0, i+1].FontStyle + [fsBold];
        end else
        begin
          sgENInspectionSheetItem.RowColor[i + 1] := clWindow;
          CellProperties[2, i+1].FontStyle := CellProperties[0, i+1].FontStyle - [fsBold];
        end;


        Cells[1,i+1] := ENInspectionSheetItemList.list[i].defectCode;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
         CellProperties[1, i+1].FontStyle := CellProperties[1, i+1].FontStyle - [fsBold];

        Cells[2,i+1] := ENInspectionSheetItemList.list[i].defectName;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[2, i+1].FontStyle := CellProperties[2, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          if ENInspectionSheetItemList.list[i].isDetecting = YES then
            Cells[3,i+1] := 'виявлено'
          else
            Cells[3,i+1] := 'не виявлено';

        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[3, i+1].FontStyle := CellProperties[3, i+1].FontStyle - [fsBold];


        if ENInspectionSheetItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENInspectionSheetItemList.list[i].countGen.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[4, i+1].FontStyle := CellProperties[4, i+1].FontStyle - [fsBold];


        Cells[5,i+1] := ENInspectionSheetItemList.list[i].commentGen;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[5, i+1].FontStyle := CellProperties[5, i+1].FontStyle - [fsBold];


        if ENInspectionSheetItemList.list[i].countDefects = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENInspectionSheetItemList.list[i].countDefects.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[6, i+1].FontStyle := CellProperties[6, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].defectLength = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENInspectionSheetItemList.list[i].defectLength.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[7, i+1].FontStyle := CellProperties[7, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].coefficientKi = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := ENInspectionSheetItemList.list[i].coefficientKi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[8, i+1].FontStyle := CellProperties[8, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].pointsPi = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := ENInspectionSheetItemList.list[i].pointsPi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[9, i+1].FontStyle := CellProperties[9, i+1].FontStyle - [fsBold];

        if ENInspectionSheetItemList.list[i].weightXi = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := ENInspectionSheetItemList.list[i].weightXi.DecimalString;
        if ENInspectionSheetItemList.list[i].classificationTypeParentRefCode <> Low(Integer) then
          CellProperties[10, i+1].FontStyle := CellProperties[10, i+1].FontStyle - [fsBold];


        LastRow:=i+1;
        sgENInspectionSheetItem.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENInspectionSheetItem.Row:=1;

    sgENInspectionSheetItemClick(sgENInspectionSheetItem);
end;


procedure TfrmENInspectionSheetEdit.sgENInspectionSheetItemClick(Sender: TObject);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
  inspectionSheetItem: ENInspectionSheetItemShort;
begin
  inherited;
  if (DialogState = dsEdit) then
  begin
    TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;
    try
      inspectionSheetItem := TempENInspectionSheetItem.getShortObject(StrToInt(sgENInspectionSheetItem.Cells[0,sgENInspectionSheetItem.Row]));
    except
      on EConvertError do Exit;
    end;

    DisableActions([actEdit], (inspectionSheetItem.classificationTypeParentRefCode = Low(Integer)));
  end;
end;


procedure TfrmENInspectionSheetEdit.sgENInspectionSheetItemDblClick(Sender: TObject);
begin
  inherited;
  actViewExecute(Sender);
end;


procedure TfrmENInspectionSheetEdit.spbExecutorClick(Sender: TObject);
var
  frmFINWorkerShow : TfrmFINWorkerShow;
  f : FINWorkerFilter;
  //w : FINWorker;
  //TempFINWorker : FINWorkerControllerSoapPort;
begin
  inherited;
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.departmentCode := '-1';

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try
    frmFINWorkerShow.dateGet := TXSDate.Create;
    frmFINWorkerShow.isShowCEO := False;
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtExecutor.Text := GetReturnValue(sgFINWorker,3) + ' - ' + GetReturnValue(sgFINWorker,1);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


end.