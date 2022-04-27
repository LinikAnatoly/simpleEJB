
unit EditRQAllocationList;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
  DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, RQAllocationListController, AdvObj,
  editlist, JvExComCtrls, JvUpDown, CheckLst, RQFKOrderController,
  tmsAdvGridExcel, ShellAPI;

type
  TfrmRQAllocationListEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;

  HTTPRIORQAllocationList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  pcRQAllocationList: TPageControl;
  tsGeneral: TTabSheet;
    lblListPeriod: TLabel;
    edtListPeriod: TDateTimePicker;
  edtDateGen: TDateTimePicker;
  lblDateGen: TLabel;
  edtNumberGen: TEdit;
  lblNumberGen: TLabel;
  lblRQAllocationListTypeName: TLabel;
  edtRQAllocationListTypeName: TEdit;
  spbRQAllocationListTypeName: TSpeedButton;
  lblRQAllocationListFormName: TLabel;
  edtRQAllocationListFormName: TEdit;
  spbRQAllocationListFormName: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIORQAllocationListType: THTTPRIO;
    HTTPRIORQAllocationListForm: THTTPRIO;
    tsRQAllocationListItem: TTabSheet;
    HTTPRIORQAllocationListItem: THTTPRIO;
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
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgRQAllocationListItem: TAdvStringGrid;
    btnCreateItems: TButton;
    HTTPRIOENMol: THTTPRIO;
    tsRQFKOrder: TTabSheet;
    ToolBar9: TToolBar;
    ToolButton57: TToolButton;
    ToolButton58: TToolButton;
    sgRQFKOrder: TAdvStringGrid;
    lblBudgetName: TLabel;
    HTTPRIORQFKOrder: THTTPRIO;
    chklstListBudget: TCheckListBox;
    HTTPRIOTENDepartment: THTTPRIO;
    btnUp: TBitBtn;
    btnDown: TBitBtn;
    cbSelectAll: TCheckBox;
    ToolButton4: TToolButton;
    N2: TMenuItem;
    actDeleteSelected: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    btnPrint: TButton;
    lblDepartmentForReport: TLabel;
    spbENDepartmnetForReportClear: TSpeedButton;
    spbENDepartmentForReport: TSpeedButton;
    edtENDepartmentForReport: TEdit;
    gbPrintParameters: TGroupBox;
    btnPrintPackingList: TButton;
    gbPackingListParameters: TGroupBox;
    lblENDepartmentInPackingSlip: TLabel;
    spbENDepartmentInPackingSlip: TSpeedButton;
    edtENDepartmentInPackingSlip: TEdit;
    edtENDepartmentOutPackingSlip: TEdit;
    spbENDepartmentOutPackingSlip: TSpeedButton;
    lblENDepartmentOutPackingSlip: TLabel;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    actRQFKOrderUncreatedPrihod: TAction;
    actRQFKOrderCreatedPrihod: TAction;
    actRQFKOrderMoveToFK: TAction;
    actRQFKOrderUnMoveToFK: TAction;
    tbtnEditRQFKOrder: TToolButton;
    actRQFKOrderEdit: TAction;
    actRQFKOrderDelete: TAction;
    tbtnRemove: TToolButton;
    rbIsTakenMaterials: TRadioButton;
    rbIsGivenMaterials: TRadioButton;
    PopupMenu2: TPopupMenu;
    mniViewRQFKOrder: TMenuItem;
    mniEditRQFKOrder: TMenuItem;
    mniRemoveRQFKOrder: TMenuItem;
    mniUpdateRQFKOrder: TMenuItem;
    mniFilterRQFKOrder: TMenuItem;
    mniNoFilterRQFKOrder: TMenuItem;
    mniCreatedPrihodRQFKOrder: TMenuItem;
    mniUnCreatedPrihodRQFKOrder: TMenuItem;
    mniMoveToFKRQFKOrder: TMenuItem;
    mniUndoMoveToFKRQFKOrder: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    edtDateDoc: TDateTimePicker;
    lblDateDoc: TLabel;
    gpbRestMolSelectionParameters: TGroupBox;
    chbMolOnlyNativeRem: TCheckBox;
    chbMolNeighborRems: TCheckBox;
    chbMolCentralWarehouse: TCheckBox;
    chbMolManagement: TCheckBox;
    chbMolOtherRems: TCheckBox;
    actMoveAndUnMoveToWorkOnWarehouse: TAction;
    actMoveAndUnMoveToWorkOnWarehouse1: TMenuItem;
    ToolButton10: TToolButton;
    actExportXls: TAction;
    aeExcel: TAdvGridExcelIO;
    spbENDepartmentClear: TSpeedButton;
    spbENDepartment: TSpeedButton;
    edtENDepartment: TEdit;
    lblENDepartment: TLabel;
    btnEditRQAllocationAdditionalParameters: TButton;
    edtDateStart: TDateTimePicker;
    lblDateFinal: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbRQAllocationListTypeNameClick(Sender: TObject);
  procedure spbRQAllocationListFormNameClick(Sender: TObject);
  procedure actViewExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnCreateItemsClick(Sender: TObject);
    procedure pcRQAllocationListChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pcRQAllocationListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure chklstListBudgetDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure chklstListBudgetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure chklstListBudgetDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure cbSelectAllClick(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure actDeleteSelectedExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure spbENDepartmentForReportClick(Sender: TObject);
    procedure spbENDepartmnetForReportClearClick(Sender: TObject);
    procedure spbENDepartmentInPackingSlipClick(Sender: TObject);
    procedure spbENDepartmentOutPackingSlipClick(Sender: TObject);
    procedure btnPrintPackingListClick(Sender: TObject);
    procedure actRQFKOrderUncreatedPrihodExecute(Sender: TObject);
    procedure actRQFKOrderCreatedPrihodExecute(Sender: TObject);
    procedure actRQFKOrderMoveToFKExecute(Sender: TObject);
    procedure actRQFKOrderUnMoveToFKExecute(Sender: TObject);
    procedure actRQFKOrderEditExecute(Sender: TObject);
    procedure actRQFKOrderDeleteExecute(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure actMoveAndUnMoveToWorkOnWarehouseExecute(Sender: TObject);
    procedure actExportXlsExecute(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
	procedure toggleENDepartmentVisible;
    procedure btnEditRQAllocationAdditionalParametersClick(Sender: TObject);
	procedure toggleAllocationDates;
	procedure setCheckBoxesFromAdditionalParameters;

  
  private
    additionalParameters : RQAllocationAdditionalParameters;
    fkOrderFilterObj : RQFKOrderFilter;
    procedure readFields();
    { Private declarations }
  public
    { Public declarations }
  budgetCode : Integer;
  materialName : String;
  independentCFO : Boolean;
  departmentCodeForReport : Variant;
  departmentCodeInForPackingSlip : Variant;
  departmentCodeOutForPackingSlip : Variant;

  procedure UpdateGrid(Sender: TObject);
end;

var
  frmRQAllocationListEdit: TfrmRQAllocationListEdit;
  RQAllocationListObj: RQAllocationList;

  ColCount, LastCount, maxCheckListIndex : Integer;
  LastRow: Integer = 1;

  RQAllocationListItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Бюджетотримач'
          ,'Матеріал (ПЛАН)'
          ,'Од. вим.'
          ,'Необхідна кількість'
          ,'Прив''язано'
          ,'Матеріал (ФК)'
          ,'Номенкл. №'
          ,'код строки ВО'
        );

  RQFKOrderHeaders: array [1..18] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
        );

  StartingPoint : TPoint;

implementation


uses
  ShowRQAllocationListType, RQAllocationListTypeController,
  ShowRQAllocationListForm, RQAllocationListFormController, ENDepartmentTypeController,
  ShowENDepartment, ENDepartmentController, ENConsts, EditRQAllocationListItem,
  RQAllocationListItemController, ENMolController, ShowFINMol, ENMolTypeController,
  FINMolController, EditRQFKOrder, EditRQAllocationListItemFilter, EditRQAllocationAdditionalParameters,
  DMReportsUnit, ShowRQFKOrder, TKMaterialsController, Globals;

{$R *.dfm}

procedure TfrmRQAllocationListEdit.toggleAllocationDates;
begin
    if (not Assigned(RQAllocationListObj)) or (not Assigned(RQAllocationListObj.formRef)) then begin
        Exit;
	end;
    if RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED then begin
	    HideControls([edtDateStart, lblDateFinal], false);
        lblListPeriod.Caption := 'Період планів з';		
    end else begin
		HideControls([edtDateStart, lblDateFinal]);
        lblListPeriod.Caption := 'Період для формування відомості (період планової заявки)';
    end;
end;

procedure TfrmRQAllocationListEdit.setCheckBoxesFromAdditionalParameters;
begin
    if(RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED) then begin
        chbMolOnlyNativeRem.Checked := additionalParameters.molOnlyNativeRem;
        chbMolNeighborRems.Checked := additionalParameters.molNeighborRems;
        chbMolCentralWarehouse.Checked := additionalParameters.molCentralWarehouse;
        chbMolManagement.Checked := additionalParameters.molManagement;
        chbMolOtherRems.Checked := additionalParameters.molOtherRems;
    end;
end;
	
procedure TfrmRQAllocationListEdit.toggleENDepartmentVisible;
begin
	if (not Assigned(RQAllocationListObj))
		or (not Assigned(RQAllocationListObj.formRef)) then
	begin
		HideControls([edtENDepartment, lblENDepartment, spbENDepartment, spbENDepartmentClear]);
		Exit;
	end;
	HideControls([edtENDepartment, lblENDepartment, spbENDepartment, spbENDepartmentClear], RQAllocationListObj.formRef.code <> ENConsts.RQALLOCATIONLISTFORM_NOPLANNED);
	
end;
	
procedure TfrmRQAllocationListEdit.readFields();
begin
    RQAllocationListObj.numberGen := edtNumberGen.Text;

    if edtdateGen.checked then
    begin
     if RQAllocationListObj.dateGen = nil then
        RQAllocationListObj.dateGen := TXSDate.Create;
     RQAllocationListObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
    end
    else
     RQAllocationListObj.dateGen := nil;

    if edtListPeriod.checked then
    begin
     if RQAllocationListObj.listPeriod = nil then
        RQAllocationListObj.listPeriod := TXSDate.Create;
     RQAllocationListObj.listPeriod.XSToNative(GetXSDate(edtListPeriod.DateTime));
    end
    else
     RQAllocationListObj.listPeriod := nil;
	 
     if (Assigned(RQAllocationListObj)) and (Assigned(RQAllocationListObj.formRef))
        and (RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED) then begin
        if edtListPeriod.checked then begin
           if RQAllocationListObj.dateFinal = nil then RQAllocationListObj.dateFinal := TXSDate.Create;
           RQAllocationListObj.dateFinal.XSToNative(GetXSDate(edtListPeriod.DateTime));
        end else
		   RQAllocationListObj.dateFinal := nil;
		
		if edtDateStart.checked then begin
           if RQAllocationListObj.dateStart = nil then RQAllocationListObj.dateStart := TXSDate.Create;
           RQAllocationListObj.dateStart.XSToNative(GetXSDate(edtDateStart.DateTime));
        end else
		   RQAllocationListObj.dateStart := nil;
    end;

    if edtDateDoc.checked then begin
     if RQAllocationListObj.dateDoc = nil then
        RQAllocationListObj.dateDoc := TXSDate.Create;
     RQAllocationListObj.dateDoc.XSToNative(GetXSDate(edtDateDoc.DateTime));
    end else RQAllocationListObj.dateDoc := nil;
end;

procedure TfrmRQAllocationListEdit.FormShow(Sender: TObject);
var
  TempENDepartment : ENDepartmentControllerSoapPort;
  dep : ENDepartment;
  TempRQAllocationListType : RQAllocationListTypeControllerSoapPort;
  aType : RQAllocationListType;
  TempRQAllocationListForm : RQAllocationListFormControllerSoapPort;
  aForm : RQAllocationListForm;
  mol : ENMol;
begin

  SetGridHeaders(RQAllocationListItemHeaders, sgRQAllocationListItem.ColumnHeaders);
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);

  departmentCodeForReport := Null;
  departmentCodeInForPackingSlip := Null;
  departmentCodeOutForPackingSlip := Null;

  pcRQAllocationList.ActivePage := tsGeneral;
  DisableControls([edtCode, edtNumberGen,
      edtRQAllocationListTypeName, edtRQAllocationListFormName
      , edtENDepartmentForReport, edtENDepartmentInPackingSlip
      , edtENDepartmentOutPackingSlip, edtENDepartment]);

  HideControls([btnCreateItems, lblBudgetName, chklstListBudget, btnUp, btnDown,
      cbSelectAll]);
  HideControls([gpbRestMolSelectionParameters, btnEditRQAllocationAdditionalParameters]);

  HideControls([btnPrint, gbPrintParameters, btnPrintPackingList, gbPackingListParameters], ((DialogState = dsInsert) or
    (not (RQAllocationListObj.statusRef.code in [RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED, RQALLOCATIONLISTSTATUS_CONFIRMED]))));

  if DialogState = dsView then
  begin
    DisableActions([actDelete, actEdit, actDeleteSelected
    , actRQFKOrderUncreatedPrihod, actRQFKOrderCreatedPrihod, actRQFKOrderMoveToFK,
    actRQFKOrderUnMoveToFK, actRQFKOrderDelete, actRQFKOrderEdit, actMoveAndUnMoveToWorkOnWarehouse]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumberGen, edtDateGen, edtListPeriod, edtDateDoc,
      edtRQAllocationListTypeName, edtRQAllocationListFormName]);

  end;


  if (DialogState = dsInsert) then
  begin
    edtNumberGen.Text := 'Auto';
    tsRQAllocationListItem.TabVisible := False;
    tsRQFKOrder.TabVisible := False;
    btnCreateItems.Visible := False;

  end;


  if (DialogState = dsEdit) then
  begin
    if (RQAllocationListObj.statusRef.code > RQALLOCATIONLISTSTATUS_NEW) then
      DisableControls([edtNumberGen, edtDateGen, edtDateStart, edtListPeriod, edtDateDoc, btnEditRQAllocationAdditionalParameters]) else
    begin
      DisableControls([edtNumberGen, edtDateGen, edtDateStart, edtListPeriod, edtDateDoc, btnEditRQAllocationAdditionalParameters], False);
      DenyBlankValues([edtNumberGen, edtDateGen,
        edtRQAllocationListTypeName, edtRQAllocationListFormName, edtListPeriod, edtDateDoc]);
    end;

    HideControls([btnCreateItems], RQAllocationListObj.statusRef.code in [RQALLOCATIONLISTSTATUS_CONFIRMED]);
    HideControls([lblBudgetName, chklstListBudget, btnUp, btnDown,
      cbSelectAll], RQAllocationListObj.statusRef.code in [RQALLOCATIONLISTSTATUS_CONFIRMED, RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED]);

    if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_NEW) then begin
      btnCreateItems.Caption := 'СФОРМУВАТИ строки';
	  	  
      if(RQAllocationListObj.formRef.code = ENConsts.RQALLOCATIONLISTFORM_NOPLANNED) then begin
          HideControls([gpbRestMolSelectionParameters, btnEditRQAllocationAdditionalParameters], false);
          {SUPP-67581 По умолчанию эти два флажка будут установлены}
          chbMolOnlyNativeRem.Checked := true;
          chbMolCentralWarehouse.Checked := true;	  
      end;
	end
    else
    if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED) then
      btnCreateItems.Caption := 'ВИДАЛИТИ строки'
    else
      HideControls([btnCreateItems]);

    if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_NEW) then
      HideControls([btnCreateItems, lblBudgetName, chklstListBudget, btnUp, btnDown,
         cbSelectAll], False);
  end;


  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    DisableControls([spbRQAllocationListTypeName, spbRQAllocationListFormName,
      edtRQAllocationListTypeName, edtRQAllocationListFormName]);
	  
	// SUPP-68477 Если ведомость не черновая - тогда блокируется ввод подразделения
	DisableControls([spbENDepartment, spbENDepartmentClear], ((RQAllocationListObj.statusRef.code <> RQALLOCATIONLISTSTATUS_NEW) 
	    or (DialogState = dsView)));

    edtCode.Text := IntToStr(RQAllocationListObj.code);
    edtNumberGen.Text := RQAllocationListObj.numberGen;
	
	SetDateFieldForDateTimePicker(edtDateGen, RQAllocationListObj.dateGen);
    SetDateFieldForDateTimePicker(edtDateDoc, RQAllocationListObj.dateDoc);
	
	if RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED then begin
		  SetDateFieldForDateTimePicker(edtDateStart, RQAllocationListObj.dateStart);
		  SetDateFieldForDateTimePicker(edtListPeriod, RQAllocationListObj.dateFinal);
	end else begin
		  SetDateFieldForDateTimePicker(edtListPeriod, RQAllocationListObj.listPeriod);
	end;

    if (RQAllocationListObj.typeRef = nil) then
       RQAllocationListObj.typeRef := RQAllocationListTypeRef.Create
    else
    if (RQAllocationListObj.typeRef.code > Low(Integer)) then begin
      TempRQAllocationListType := HTTPRIORQAllocationListType as RQAllocationListTypeControllerSoapPort;
      aType := TempRQAllocationListType.getObject(RQAllocationListObj.typeRef.code);
      if (aType <> nil) then
      begin
        edtRQAllocationListTypeName.Text := aType.name;
      end;
    end;

    if (RQAllocationListObj.formRef = nil) then
       RQAllocationListObj.formRef := RQAllocationListFormRef.Create
    else
    if (RQAllocationListObj.formRef.code > Low(Integer)) then begin
      TempRQAllocationListForm := HTTPRIORQAllocationListForm as RQAllocationListFormControllerSoapPort;
      aForm := TempRQAllocationListForm.getObject(RQAllocationListObj.formRef.code);
      if (aForm <> nil) then
      begin
        edtRQAllocationListFormName.Text := aForm.name;
      end;
    end;
	
	if (RQAllocationListObj.departmentRef = nil) then
       RQAllocationListObj.departmentRef := ENDepartmentRef.Create
    else
    if (RQAllocationListObj.departmentRef.code > Low(Integer)) then begin
      TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      dep := TempENDepartment.getObject(RQAllocationListObj.departmentRef.code);
      if (dep <> nil) then
      begin
        edtENDepartment.Text := dep.shortName;
      end;
    end;
  end;
  toggleENDepartmentVisible;
  toggleAllocationDates;
end;


procedure TfrmRQAllocationListEdit.pcRQAllocationListChange(Sender: TObject);
begin
  inherited;
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListEdit.pcRQAllocationListChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  UpdateGrid(Sender);
end;

procedure TfrmRQAllocationListEdit.PopupMenu2Popup(Sender: TObject);
var
  fkOrder : RQFKOrder;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;
   TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
   except
     on EConvertError do Exit;
   end;
   fkOrder := TempRQFKOrder.getObjectNoSegr(ObjCode);
  if  fkOrder = nil  then Exit;

  mniCreatedPrihodRQFKOrder.Visible := fkOrder.status.code = RQFKORDER_STATUS_GOOD;
  mniUnCreatedPrihodRQFKOrder.Visible := fkOrder.status.code = RQFKORDER_STATUS_CREATED;
  mniMoveToFKRQFKOrder.Visible := fkOrder.status.code in [RQFKORDER_STATUS_CREATED
    , RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE];
  mniUndoMoveToFKRQFKOrder.Visible := fkOrder.status.code = RQFKORDER_STATUS_IN_FK;

  // SUPP-68524
  if DialogState <> dsView then  begin
   DisableActions([actMoveAndUnMoveToWorkOnWarehouse], false);
  end;
  HideActions([actMoveAndUnMoveToWorkOnWarehouse], false);
  case fkOrder.status.code of
    RQFKORDER_STATUS_CREATED: begin
      actMoveAndUnMoveToWorkOnWarehouse.Caption := 'Взяти у роботу на складі';
    end;
    RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE: begin
      actMoveAndUnMoveToWorkOnWarehouse.Caption := 'Перевести у статус "Складений"';
    end;
    Else begin
      if DialogState <> dsView then  begin
        DisableActions([actMoveAndUnMoveToWorkOnWarehouse]);
      end;
      HideActions([actMoveAndUnMoveToWorkOnWarehouse]);
    end;
  end;

end;

procedure TfrmRQAllocationListEdit.spbENDepartmentClearClick(Sender: TObject);
begin
  inherited;

  if (not Assigned(RQAllocationListObj)) 
    or (not Assigned(RQAllocationListObj.departmentRef)) then begin
    Exit;
  end;
  
  RQAllocationListObj.departmentRef.code := Low(Integer);
  edtENDepartment.Text := '';
end;

procedure TfrmRQAllocationListEdit.spbENDepartmentClick(Sender: TObject);
var department : ENDepartmentShort;
begin
  inherited;
  department := TfrmENDepartmentShow.chooseFromList(true, nil);
  if Assigned(department) then begin
           if not Assigned(RQAllocationListObj) then begin
		           RQAllocationListObj := RQAllocationList.Create;
		       end;

		       if not Assigned(RQAllocationListObj.departmentRef) then begin
		           RQAllocationListObj.departmentRef := ENDepartmentRef.Create;
		       end;
           RQAllocationListObj.departmentRef.code := department.code;
           edtENDepartment.Text := department.shortName;
  end;
end;

procedure TfrmRQAllocationListEdit.spbENDepartmentForReportClick(
  Sender: TObject);
begin
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           departmentCodeForReport := selectedObj.code;
           edtENDepartmentForReport.Text := selectedObj.shortName;
  end);
end;

procedure TfrmRQAllocationListEdit.spbENDepartmentInPackingSlipClick(
  Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           departmentCodeInForPackingSlip := selectedObj.code;
           edtENDepartmentInPackingSlip.Text := selectedObj.shortName;
  end);
end;

procedure TfrmRQAllocationListEdit.spbENDepartmnetForReportClearClick(
  Sender: TObject);
begin
  inherited;
  edtENDepartmentForReport.Text := '';
  departmentCodeForReport := Null;
end;

procedure TfrmRQAllocationListEdit.spbRQAllocationListFormNameClick(Sender: TObject);
var
  frmRQAllocationListFormShow : TfrmRQAllocationListFormShow;
begin
  inherited;
  frmRQAllocationListFormShow := TfrmRQAllocationListFormShow.Create(Application,fmNormal);
  try
    with frmRQAllocationListFormShow do
    if ShowModal = mrOk then
    begin
      try
         if RQAllocationListObj.formRef = nil then RQAllocationListObj.formRef := RQAllocationListFormRef.Create;
         RQAllocationListObj.formRef.code := StrToInt(GetReturnValue(sgRQAllocationListForm,0));
         edtRQAllocationListFormName.Text := GetReturnValue(sgRQAllocationListForm,1);
         toggleENDepartmentVisible;
         toggleAllocationDates;
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmRQAllocationListFormShow.Free;
  end;
end;



procedure TfrmRQAllocationListEdit.spbRQAllocationListTypeNameClick(Sender: TObject);
var
  frmRQAllocationListTypeShow : TfrmRQAllocationListTypeShow;
begin
  inherited;
  frmRQAllocationListTypeShow := TfrmRQAllocationListTypeShow.Create(Application,fmNormal);
  try
    with frmRQAllocationListTypeShow do
    if ShowModal = mrOk then
    begin
      try
         if RQAllocationListObj.typeRef = nil then RQAllocationListObj.typeRef := RQAllocationListTypeRef.Create;
         RQAllocationListObj.typeRef.code := StrToInt(GetReturnValue(sgRQAllocationListType,0));
         edtRQAllocationListTypeName.Text := GetReturnValue(sgRQAllocationListType,1);
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmRQAllocationListTypeShow.Free;
  end;
end;


procedure TfrmRQAllocationListEdit.spbENDepartmentOutPackingSlipClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
           departmentCodeOutForPackingSlip := selectedObj.code;
           edtENDepartmentOutPackingSlip.Text := selectedObj.shortName;
  end);
end;

procedure TfrmRQAllocationListEdit.actDeleteExecute(Sender: TObject);
var
  listItemCode, fkOrderItemCode : Integer;
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
begin
  inherited;
  TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
  try
    listItemCode := StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]);
    fkOrderItemCode := StrToInt(sgRQAllocationListItem.Cells[8,sgRQAllocationListItem.Row]);
  except
    on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Строку ведомости распределения остатков)?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQAllocationListItem.removeItem(listItemCode, fkOrderItemCode);
    UpdateGrid(Sender);
  end;
end;


procedure TfrmRQAllocationListEdit.actDeleteSelectedExecute(Sender: TObject);
var
  i, listItemCode, fkOrderItemCode : Integer;
  selected : Boolean;
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
begin
  inherited;
  TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;

  if Application.MessageBox(PChar('Вы действительно хотите удалить выбранные строки ведомости?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    selected := false;

    for i := 1 to sgRQAllocationListItem.RowCount - 1 do
    begin
      sgRQAllocationListItem.GetCheckBoxState(1, i, selected);
      if selected then
      begin
        try
          listItemCode := StrToInt(sgRQAllocationListItem.Cells[0, i]);
          fkOrderItemCode := StrToInt(sgRQAllocationListItem.Cells[8, i]);
        except
          on EConvertError do Exit;
        end;

        TempRQAllocationListItem.removeItem(listItemCode, fkOrderItemCode);
      end;
    end;

  end;

  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListEdit.actEditExecute(Sender: TObject);
var
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
begin
  inherited;
  TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
  try
    RQAllocationListItemObj := TempRQAllocationListItem.getObject(StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmRQAllocationListItemEdit := TfrmRQAllocationListItemEdit.Create(Application, dsEdit);
  try
    if frmRQAllocationListItemEdit.ShowModal= mrOk then
      begin
        UpdateGrid(Sender);
      end;
  finally
    frmRQAllocationListItemEdit.Free;
    frmRQAllocationListItemEdit:=nil;
  end;

  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListEdit.actExportXlsExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmRQAllocationListEdit.actFilterExecute(Sender: TObject);
var
  frmRQFKOrderShow : TfrmRQFKOrderShow;
begin
  inherited;
    if (pcRQAllocationList.ActivePage = tsRQAllocationListItem) then begin
        frmRQAllocationListItemFilterEdit := TfrmRQAllocationListItemFilterEdit.Create(Application, dsInsert);
        try
          if frmRQAllocationListItemFilterEdit.ShowModal = mrOk then
          begin
            materialName := frmRQAllocationListItemFilterEdit.edtMaterialName.Text;
            budgetCode := frmRQAllocationListItemFilterEdit.budgetRefCode;
            actUpdateExecute(Sender);
          end;
        finally
          frmRQAllocationListItemFilterEdit.Free;
          frmRQAllocationListItemFilterEdit:=nil;
        end;
    end else if (pcRQAllocationList.ActivePage = tsRQFKOrder) then begin
    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal);
    frmRQFKOrderShow.filter(procedure(filterObj : RQFKOrderFilter) begin
      fkOrderFilterObj := filterObj;
      actUpdateExecute(Sender);
    end);
    end else begin
     raise Exception.Create('Невідомо що робити на цій вкладці');
    end;
end;


procedure TfrmRQAllocationListEdit.actInsertExecute(Sender: TObject);
begin
  inherited;
  RQAllocationListItemObj := RQAllocationListItem.Create;
  try
    frmRQAllocationListItemEdit := TfrmRQAllocationListItemEdit.Create(Application, dsInsert);
    try
      if frmRQAllocationListItemEdit.ShowModal = mrOk then
      begin
        if RQAllocationListItemObj <> nil then
            UpdateGrid(Sender);
      end;
    finally
      frmRQAllocationListItemEdit.Free;
      frmRQAllocationListItemEdit:=nil;
    end;
  finally
    RQAllocationListItemObj.Free;
  end;
end;


procedure TfrmRQAllocationListEdit.actMoveAndUnMoveToWorkOnWarehouseExecute(
  Sender: TObject);
  var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
    isMove : Boolean;
    actionName, confirmationMessage, orderString : String;
begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);
  if (obj = nil) then Exit;

  orderString := Format('№ %s від %s', [obj.numberDoc, XSDate2String(obj.dateGen)]);

  case obj.status.code of
    RQFKORDER_STATUS_CREATED: begin
      actionName := Format('перевести ордер %s в роботу на складі', [orderString]);
      confirmationMessage := Format('Ордер %s переведено в роботу на складі', [orderString]);
      isMove := true;
    end;
    RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE: begin
      actionName := Format('перевести ордер %s у статус "Складений"', [orderString]);
      confirmationMessage := Format('Ордер %s переведено в статус "Складений"', [orderString]);
      isMove := false;
    end;
    Else begin
      raise Exception.Create('Невідомий статус для ордеру!');
    end;
  end;
end;

procedure TfrmRQAllocationListEdit.actNoFilterExecute(Sender: TObject);
begin
  inherited;
   if (pcRQAllocationList.ActivePage = tsRQAllocationListItem) then begin
      materialName := '';
      budgetCode := LOW_INT;
      actUpdateExecute(Sender);
    end else if (pcRQAllocationList.ActivePage = tsRQFKOrder) then begin
      fkOrderFilterObj := nil;
      actUpdateExecute(Sender);
    end else begin
     raise Exception.Create('Невідомо що робити на цій вкладці');
    end;
end;

procedure TfrmRQAllocationListEdit.actRQFKOrderCreatedPrihodExecute(
  Sender: TObject);
  var ObjCode : Integer;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  try
    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal);
    frmRQFKOrderShow.createPrihod(ObjCode, procedure() begin
      actUpdateExecute(Sender);
    end, true);
  finally
    if frmRQFKOrderShow <> nil then begin
      frmRQFKOrderShow.Free;
      frmRQFKOrderShow := nil;
    end;
  end;

end;

procedure TfrmRQAllocationListEdit.actRQFKOrderDeleteExecute(Sender: TObject);
  var ObjCode : Integer;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  try
    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal);
    frmRQFKOrderShow.remove(ObjCode, procedure() begin
      actUpdateExecute(Sender);
    end, true);
  finally
    if frmRQFKOrderShow <> nil then begin
      frmRQFKOrderShow.Free;
      frmRQFKOrderShow := nil;
    end;
  end;
end;

procedure TfrmRQAllocationListEdit.actRQFKOrderEditExecute(Sender: TObject);
  var ObjCode : Integer;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  try
    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal);
    frmRQFKOrderShow.edit(ObjCode, procedure() begin
      actUpdateExecute(Sender);
    end, true);
  finally
    if frmRQFKOrderShow <> nil then begin
      frmRQFKOrderShow.Free;
      frmRQFKOrderShow := nil;
    end;
  end;
end;

procedure TfrmRQAllocationListEdit.actRQFKOrderMoveToFKExecute(Sender: TObject);
  var ObjCode : Integer;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TfrmRQFKOrderShow.moveToFK(ObjCode, HTTPRIORQFKOrder, procedure() begin
    actUpdateExecute(Sender);
  end);

end;

procedure TfrmRQAllocationListEdit.actRQFKOrderUncreatedPrihodExecute(
  Sender: TObject);
  var ObjCode : Integer;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  try
    frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal);
    frmRQFKOrderShow.unCreatePrihod(ObjCode, procedure() begin
      actUpdateExecute(Sender);
    end, true);
  finally
    if frmRQFKOrderShow <> nil then begin
      frmRQFKOrderShow.Free;
      frmRQFKOrderShow := nil;
    end;
  end;

end;

procedure TfrmRQAllocationListEdit.actRQFKOrderUnMoveToFKExecute(
  Sender: TObject);
  var ObjCode : Integer;
  begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TfrmRQFKOrderShow.unMoveToFK(ObjCode, HTTPRIORQFKOrder, procedure() begin
    actUpdateExecute(Sender);
  end);

end;

procedure TfrmRQAllocationListEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid(Sender);
end;


procedure TfrmRQAllocationListEdit.UpdateGrid(Sender: TObject);
var
  i, tmpListItemCode : Integer;
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
  RQAllocationListItemList : RQAllocationListItemShortList;
  itemFilter : RQAllocationListItemFilter;

  TempRQFKOrder: RQFKOrderControllerSoapPort;
  RQFKOrderList: RQFKOrderShortList;
  requiredQuantity, filledQuantity : Double;
begin
  if (pcRQAllocationList.ActivePage = tsRQAllocationListItem) then
  begin
    if (RQAllocationListObj = nil) or (RQAllocationListObj.code = LOW_INT) then Exit;

    ClearGrid(sgRQAllocationListItem);
    TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;

    itemFilter := RQAllocationListItemFilter.Create;
    SetNullIntProps(itemFilter);
    SetNullXSProps(itemFilter);
    itemFilter.listRef := RQAllocationListRef.Create;
    itemFilter.listRef.code := RQAllocationListObj.code;

    if (materialName <> '') then
      itemFilter.materialName := materialName;

    if (budgetCode <> LOW_INT) then
    begin
      itemFilter.budgetRef := ENDepartmentRef.Create;
      itemFilter.budgetRef.code := budgetCode;
    end;

    RQAllocationListItemList := TempRQAllocationListItem.getShortListForFKOrderItem(itemFilter,0,-1);

    LastCount := High(RQAllocationListItemList.list);

    if LastCount > -1 then
      sgRQAllocationListItem.RowCount:=LastCount+2
    else
      sgRQAllocationListItem.RowCount:=2;

    tmpListItemCode := LOW_INT;

    with sgRQAllocationListItem do
    for i:=0 to LastCount do
      begin
        if RQAllocationListItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQAllocationListItemList.list[i].code)
        else
          Cells[0,i+1] := '';

        AddCheckBox(1, i+1, false, false);

        if RQAllocationListItemList.list[i].code <> tmpListItemCode then
        begin
          tmpListItemCode := RQAllocationListItemList.list[i].code;

          Cells[1,i+1] := RQAllocationListItemList.list[i].budgetRefShortName;
          Cells[2,i+1] := RQAllocationListItemList.list[i].materialName;
          Cells[3,i+1] := RQAllocationListItemList.list[i].measurementName;

          if RQAllocationListItemList.list[i].countGen = nil then
            Cells[4,i+1] := ''
          else
            Cells[4,i+1] := RQAllocationListItemList.list[i].countGen.DecimalString;

        end
        else begin
          Cells[1,i+1] := '';
          Cells[2,i+1] := '';
          Cells[3,i+1] := '';
          Cells[4,i+1] := '';
        end;

        // подвязанное кол-во на строке ордера
        if RQAllocationListItemList.list[i].fkOrderItemCountFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := RQAllocationListItemList.list[i].fkOrderItemCountFact.DecimalString;

        // номенклатура
        Cells[6,i+1] := RQAllocationListItemList.list[i].nomenclatureName;
        // номенклатурный номер
        Cells[7,i+1] := RQAllocationListItemList.list[i].nomenclatureNum;
        // код строки ордера на перемещение в Транзит
        if RQAllocationListItemList.list[i].fkOrderItemCode <> Low(Integer) then
          Cells[8,i+1] := IntToStr(RQAllocationListItemList.list[i].fkOrderItemCode)
        else
          Cells[8,i+1] := '';

        requiredQuantity := 0;
        try
          if RQAllocationListItemList.list[i].countGen <> nil then
            if RQAllocationListItemList.list[i].countGen.DecimalString <> '' then
              requiredQuantity := StrToFloat(RQAllocationListItemList.list[i].countGen.DecimalString);
        except
          on EConvertError do requiredQuantity := 0;
        end;

        filledQuantity := 0;
        try
          if RQAllocationListItemList.list[i].countFact <> nil then
            if RQAllocationListItemList.list[i].countFact.DecimalString <> '' then
              filledQuantity := StrToFloat(RQAllocationListItemList.list[i].countFact.DecimalString);
        except
          on EConvertError do filledQuantity := 0;
        end;

        if filledQuantity >= requiredQuantity then
        begin
          RowColor[i + 1] := $0080FF80;
        end
        else
          RowColor[i + 1] := clWindow;

        CellProperties[4, i + 1].FontStyle := CellProperties[4, i + 1].FontStyle + [fsBold];
        CellProperties[5, i + 1].FontStyle := CellProperties[5, i + 1].FontStyle + [fsBold];

      end;

    ColCount:=ColCount+1;
    sgRQAllocationListItem.Row:=1;
  end;

  if (pcRQAllocationList.ActivePage = tsRQFKOrder) then
  begin
    ClearGrid(sgRQFKOrder);

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    if fkOrderFilterObj = nil then begin
      fkOrderFilterObj := RQFKOrderFilter.Create;
      SetNullIntProps(fkOrderFilterObj);
      SetNullXSProps(fkOrderFilterObj);
    end;

    if Length(fkOrderFilterObj.conditionSQL) > 0 then begin
      fkOrderFilterObj.conditionSQL := fkOrderFilterObj.conditionSQL + ' and ';
    end else begin
      fkOrderFilterObj.conditionSQL := '';
    end;

    fkOrderFilterObj.conditionSQL := fkOrderFilterObj.conditionSQL + ' code in (' +
      'select l2o.fkorderrefcode from rqallocationlist2fkrdr l2o ' +
      'where l2o.listrefcode = ' + IntToStr(RQAllocationListObj.code) + ')';

    fkOrderFilterObj.orderBySQL := 'molincode desc, moloutcode desc,statuscode desc';

    RQFKOrderList := TempRQFKOrder.getScrollableFilteredListNoSegr(fkOrderFilterObj, 0, -1);

    if High(RQFKOrderList.list) > -1 then
       sgRQFKOrder.RowCount := High(RQFKOrderList.list) + 2
    else
       sgRQFKOrder.RowCount := 2;
       sgRQFKOrder.FilterActive := True;
     with sgRQFKOrder do
      for i := 0 to High(RQFKOrderList.list) do
        begin
          if RQFKOrderList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
          else
          Cells[0,i+1] := '';
          Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
          if RQFKOrderList.list[i].dateGen = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);

          Cells[3,i+1] := RQFKOrderList.list[i].molInCode;

          Cells[4,i+1] := RQFKOrderList.list[i].molInName;

          Cells[5,i+1] := RQFKOrderList.list[i].molOutCode;
          Cells[6,i+1] := RQFKOrderList.list[i].molOutName;
          Cells[7, i+1] := RQFKOrderList.list[i].statusName;
          Cells[8,i+1] := RQFKOrderList.list[i].expeditorCode;
          Cells[9,i+1] := RQFKOrderList.list[i].expeditorName;
          Cells[10,i+1] := RQFKOrderList.list[i].warrantNumber;
          if RQFKOrderList.list[i].warrantDate = nil then
            Cells[11,i+1] := ''
          else
            Cells[11,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
          Cells[12,i+1] := RQFKOrderList.list[i].warrantFIO;

          Cells[13,i+1] := RQFKOrderList.list[i].userAdd;
          if RQFKOrderList.list[i].dateAdd = nil then
            Cells[14,i+1] := ''
          else
            Cells[14,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

          Cells[15,i+1] := RQFKOrderList.list[i].userGen;
          if RQFKOrderList.list[i].dateEdit = nil then
            Cells[16,i+1] := ''
          else
            Cells[16,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

          sgRQFKOrder.RowCount := i + 2;
        end;

     sgRQFKOrder.Row := 1;
  end;
end;


procedure TfrmRQAllocationListEdit.actViewExecute(Sender: TObject);
var
  TempRQAllocationListItem : RQAllocationListItemControllerSoapPort;
  TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  if (pcRQAllocationList.ActivePage = tsRQAllocationListItem) then
  begin
    TempRQAllocationListItem := HTTPRIORQAllocationListItem as RQAllocationListItemControllerSoapPort;
    try
      RQAllocationListItemObj := TempRQAllocationListItem.getObject(StrToInt(sgRQAllocationListItem.Cells[0,sgRQAllocationListItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmRQAllocationListItemEdit := TfrmRQAllocationListItemEdit.Create(Application, dsView);
    try
      frmRQAllocationListItemEdit.ShowModal;
    finally
      frmRQAllocationListItemEdit.Free;
      frmRQAllocationListItemEdit:=nil;
    end;
  end;

  if (pcRQAllocationList.ActivePage = tsRQFKOrder) then
  begin
    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);

    try
      try
        frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObjectNoSegr(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
      except
        on EConvertError do Exit;
      end;

      frmRQFKOrderEdit.ShowModal;
    finally
      frmRQFKOrderEdit.Free;
      frmRQFKOrderEdit := nil;
    end;
  end;
end;


procedure TfrmRQAllocationListEdit.btnCreateItemsClick(Sender: TObject);
var
  i, n : Integer;
  TempRQAllocationList : RQAllocationListControllerSoapPort;
  departmentList : ENDepartmentShortList;
  depArr :  ArrayOfENDepartmentShort;
  department :  ENDepartmentShort;
begin
  inherited;
  TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;
  readFields;
  TempRQAllocationList.save(RQAllocationListObj);
  RQAllocationListObj := TempRQAllocationList.getObject(RQAllocationListObj.code);

  if not Assigned(additionalParameters) then begin
	     additionalParameters := RQAllocationAdditionalParameters.Create;
	     SetNullIntProps(additionalParameters);
		 SetNullXSProps(additionalParameters);
  end;

  	  /// SUPP-67 Установка параметров из флажков
	  if(RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED) then begin
	      additionalParameters.molOnlyNativeRem := chbMolOnlyNativeRem.Checked;
		  additionalParameters.molNeighborRems := chbMolNeighborRems.Checked;
	      additionalParameters.molCentralWarehouse := chbMolCentralWarehouse.Checked;
	      additionalParameters.molManagement := chbMolManagement.Checked;
	      additionalParameters.molOtherRems := chbMolOtherRems.Checked;
	  end else begin
	      additionalParameters.molOnlyNativeRem := true;
		  additionalParameters.molNeighborRems := true;
	      additionalParameters.molCentralWarehouse := true;
	      additionalParameters.molManagement := true;
	      additionalParameters.molOtherRems := true;
	  end;


  FormShow(sender);
  setCheckBoxesFromAdditionalParameters;
  if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_NEW) then
  begin
    if Application.MessageBox( PChar('Ви дійсно бажаєте сформувати строки? Це може зайняти деякий час...'),
                              PChar('Увага!'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin

      n := 0;
      for i := 0 to chklstListBudget.Count - 1  do
      begin
        if chklstListBudget.Checked[i] then
        begin
          n := n + 1;
        end;
      end;

      if (n = 0) then
      begin
        Application.MessageBox(PChar('Оберіть бюджетотримача!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
        Exit;
      end;

      departmentList := ENDepartmentShortList.Create;
      departmentList.totalCount := 0;
      SetLength(depArr, n);
      n := 0;

      for i := 0 to chklstListBudget.Count - 1 do
      begin
        if chklstListBudget.Checked[i] then
        begin
          department := ENDepartmentShort.Create;
          SetNullIntProps(department);
          SetNullXSProps(department);
          department.code := Integer(chklstListBudget.Items.Objects[i]);

          depArr[n] := department;
          n := n + 1;
        end;
      end;


	  additionalParameters.budgets := depArr;


      TempRQAllocationList.createAutoItems(RQAllocationListObj.code, additionalParameters);

      ShowMessage('Строки сформовані...');
      RQAllocationListObj := TempRQAllocationList.getObject(RQAllocationListObj.code);
      self.FormShow(Sender);
      Exit;
    end;
  end;

  if (RQAllocationListObj.statusRef.code = RQALLOCATIONLISTSTATUS_MATERIALS_RESERVED) then
  begin
    if Application.MessageBox( PChar('Ви дійсно бажаєте видалити строки? Усі змінені дані в строках будуть видалені...'),
                              PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQAllocationList.removeAutoItems(RQAllocationListObj.code);

      ShowMessage('Строки видалені...');
      RQAllocationListObj := TempRQAllocationList.getObject(RQAllocationListObj.code);
      self.FormShow(Sender);
      Exit;
    end;
  end;

end;


procedure TfrmRQAllocationListEdit.btnUpClick(Sender: TObject);
var
  currIndex : Integer;
begin
  inherited;
  if (chklstListBudget.ItemIndex > 0) then
  begin
    currIndex := chklstListBudget.ItemIndex;
    chklstListBudget.Items.Move(chklstListBudget.ItemIndex, (currIndex - 1));
    chklstListBudget.ItemIndex := currIndex - 1;
  end;
end;


procedure TfrmRQAllocationListEdit.btnDownClick(Sender: TObject);
var
  currIndex : Integer;
begin
  inherited;
  if (chklstListBudget.ItemIndex >= 0) and (chklstListBudget.ItemIndex <> maxCheckListIndex) then
  begin
    currIndex := chklstListBudget.ItemIndex;
    chklstListBudget.Items.Move(chklstListBudget.ItemIndex, (currIndex + 1));
    chklstListBudget.ItemIndex := currIndex + 1;
  end;
end;

procedure TfrmRQAllocationListEdit.btnEditRQAllocationAdditionalParametersClick(
  Sender: TObject);
var
    frmEditRQAllocationAdditionalParametersEdit : TfrmRQAllocationAdditionalParametersEdit;
    matArr : ArrayOfTKMaterialsRef;
begin
  inherited;
  if not Assigned(additionalParameters) then begin
	additionalParameters := RQAllocationAdditionalParameters.Create;	  
	SetNullIntProps(additionalParameters);
    SetNullXSProps(additionalParameters);
  end;
  frmEditRQAllocationAdditionalParametersEdit := TfrmRQAllocationAdditionalParametersEdit.Create(Application, dsInsert);
  frmEditRQAllocationAdditionalParametersEdit.RQAllocationAdditionalParametersObj := additionalParameters;
  matArr := additionalParameters.materialsGroups;
  if frmEditRQAllocationAdditionalParametersEdit.ShowModal <> mrOk then begin
      additionalParameters.materialsGroups := matArr;
  end;
  frmEditRQAllocationAdditionalParametersEdit.Free;
  frmEditRQAllocationAdditionalParametersEdit := nil;
  ///if(frmEditRQAllocationAdditionalParametersEdit.ShowModal = mrOk) then begin
  ///end;
  
end;

procedure TfrmRQAllocationListEdit.btnPrintClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  isTakenFrom : TXSBoolean;
begin
  inherited;
    inherited;

    if departmentCodeForReport <> Null then begin
        SetLength(argNames, 3);
        SetLength(args, 3);

        argNames[2] := 'departmentCode';
        args[2] := IntToStr(departmentCodeForReport);

    end else begin
      SetLength(argNames, 2);
      SetLength(args, 2);
    end;

    argNames[0] := 'code';
    args[0] := IntToStr(RQAllocationListObj.code);

    isTakenFrom := TXSBoolean.Create;
    isTakenFrom.AsBoolean := rbIsTakenMaterials.Checked;

    argNames[1] := 'isTakenFrom';
    if rbIsTakenMaterials.Checked then begin
      args[1] := 'true';
    end else begin
      args[1] := 'false';
    end;
    isTakenFrom.Free;

    reportName := 'warehouseMaterialsMovement/allocationList/allocationList';

    makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmRQAllocationListEdit.btnPrintPackingListClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  fkOrderFilter : RQFKOrderFilter;
  fkOrderList : RQFKOrderShortList;
  fkOrderShort : RQFKOrderShort;
  cfo : String;

begin
  inherited;
    inherited;

    if departmentCodeInForPackingSlip = Null then begin
      Application.MessageBox(PChar('Оберіть підрозділ-відправника'), PChar('Увага'), MB_ICONINFORMATION);
      Exit;
    end;
    if departmentCodeOutForPackingSlip = Null then begin
      Application.MessageBox(PChar('Оберіть підрозділ-одержувач'), PChar('Увага'), MB_ICONINFORMATION);
      Exit;
    end;


    SetLength(argNames, 3);
    SetLength(args, 3);

    argNames[0] := 'allocationListCode';
    args[0] := IntToStr(RQAllocationListObj.code);

    argNames[1] := 'departmentInCode';
    args[1] := IntToStr(departmentCodeInForPackingSlip);

    argNames[2] := 'departmentOutCode';
    args[2] := IntToStr(departmentCodeOutForPackingSlip);

    reportName := 'warehouseMaterialsMovement/allocationList/packingSlipForAllocationListByCode';

    makeReport(reportName, argNames, args, 'xls');

    TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

    cfo := DMReports.getFinRenByDepartmentCode(departmentCodeInForPackingSlip);

    if Length(cfo) = 1 then cfo := '0' + cfo;

    fkOrderFilter := RQFKOrderFilter.Create;
	SetNullXSProps(fkOrderFilter);
	SetNullIntProps(fkOrderFilter);
	
	fkOrderFilter.conditionSQL := '';

    if departmentCodeInForPackingSlip = ENConsts.ENDEPARTMENT_CO then begin
      fkOrderFilter.conditionSQL :=  ' not exists (select 1 from endepartment2epren as deep1 ' +
							' inner join endepartment as de1 on deep1.departmentrefcode = de1.code where deep1.finrencode = substr(RQFKORDER.MOLINCODE,1,2)::double precision and de1.parentrefcode = ' + IntToStr(ENConsts.ENDEPARTMENT_REM) + ' and de1.datefinal is null) ';

    end else begin
      fkOrderFilter.molInCode := cfo + '*';
    end;

    fkOrderFilter.department := ENDepartment.Create;
    fkOrderFilter.department.code := departmentCodeOutForPackingSlip;

	if Length(fkOrderFilter.conditionSQL) > 0 then fkOrderFilter.conditionSQL := fkOrderFilter.conditionSQL + ' and '; 
    fkOrderFilter.conditionSQL := fkOrderFilter.conditionSQL + ' EXISTS (select code From rqallocationlist2fkrdr as pcfo where pcfo.listrefcode = ' + IntToStr(RQAllocationListObj.code) + ' and pcfo.fkorderrefcode = RQFKORDER.CODE)' ;

    fkOrderList := TempRQFKOrder.getScrollableFilteredListNoSegr(fkOrderFilter, 0, -1);

	try
		frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);
		for fkOrderShort in fkOrderList.list do begin
			frmRQFKOrderEdit.printOrder(fkOrderShort.code);
		end;
	finally
		if frmRQFKOrderEdit <> nil then begin
			frmRQFKOrderEdit.Free;
			frmRQFKOrderEdit := nil;
		end;
	end;
end;

procedure TfrmRQAllocationListEdit.cbSelectAllClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  if (cbSelectAll.Checked) then
  begin
    for i := 0 to chklstListBudget.Count -1 do
    begin
      if chklstListBudget.Checked[i] = False then
         chklstListBudget.Checked[i] := True;
    end;   
  end else
  begin
    for i := 0 to chklstListBudget.Count -1 do
    begin
      if chklstListBudget.Checked[i] = True then
         chklstListBudget.Checked[i] := False;
    end;     
  end;
end;


procedure TfrmRQAllocationListEdit.chklstListBudgetDragDrop(Sender,
  Source: TObject; X, Y: Integer);
var
  DropPosition, StartPosition: Integer;
  DropPoint: TPoint;
begin
inherited;
  DropPoint.X := X;
  DropPoint.Y := Y;
  with Source as TCheckListBox do
  begin
    StartPosition := ItemAtPos(StartingPoint,True) ;
    DropPosition := ItemAtPos(DropPoint,True) ;
    Items.Move(StartPosition, DropPosition) ;
  end;
end;


procedure TfrmRQAllocationListEdit.chklstListBudgetDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := Source = chklstListBudget;
end;


procedure TfrmRQAllocationListEdit.chklstListBudgetMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
    StartingPoint.X := X;
    StartingPoint.Y := Y;
end;


procedure TfrmRQAllocationListEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempRQAllocationList : RQAllocationListControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtNumberGen, edtListPeriod, edtDateDoc,
           edtRQAllocationListTypeName, edtRQAllocationListFormName]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    // SUPP-68847 Проверка даты начала периода для внеплановых распределений
    if RQAllocationListObj.formRef.code = RQALLOCATIONLISTFORM_NOPLANNED then begin
      if not NoBlankValues([edtDateStart]) then begin
        Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
      end;
	  end;
    TempRQAllocationList := HTTPRIORQAllocationList as RQAllocationListControllerSoapPort;

    readFields;

    if DialogState = dsInsert then
    begin
      RQAllocationListObj.code:=low(Integer);
      TempRQAllocationList.add(RQAllocationListObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQAllocationList.save(RQAllocationListObj);
    end;
  end;
end;


procedure TfrmRQAllocationListEdit.FormCreate(Sender: TObject);
var
  i : Integer;
  TempBudget : ENDepartmentControllerSoapPort;
  ENDepartmentList : ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin
  fkOrderFilterObj := nil;
  independentCFO := False;
  materialName := '';
  budgetCode := LOW_INT;

  chklstListBudget.DragMode := dmAutomatic;

  departmentfilter := ENDepartmentFilter.Create;
  SetNullIntProps(departmentfilter);
  SetNullXSProps(departmentfilter);

  departmentfilter.typeRef := ENDepartmentTypeRef.Create;
  departmentfilter.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  departmentfilter.conditionSQL := ' parentrefcode is not null';

  TempBudget := HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
  ENDepartmentList := TempBudget.getScrollableFilteredList(departmentfilter,0,-1);
  chklstListBudget.Items.Clear;

  for i := 0 to High(ENDepartmentList.list) do
  begin
    chklstListBudget.Items.AddObject(ENDepartmentList.list[i].shortName, TObject(ENDepartmentList.list[i].code));
  end;

  maxCheckListIndex := High(ENDepartmentList.list);
end;


end.