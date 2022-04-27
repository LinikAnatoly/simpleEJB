unit EditMaterialsRQFKOrderOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController
  , RQOrderItemController
  , RQFKOrderController, TB2Item, TB2Dock, TB2Toolbar, ImgList
  ;

type
  TfrmMaterialsRQFKOrderOutEdit = class(TDialogForm)
    Panel1: TPanel;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    edtENElementName: TEdit;
    edtENBudgetName: TEdit;
    chkkindrefcodemat: TCheckBox;
    btnSelect: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    gbPlanMOL: TGroupBox;
    lblMolName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtMolName: TEdit;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    btnAddMaterials: TBitBtn;
    HTTPRIORQOrderItem: THTTPRIO;
    Panel2: TPanel;
    sgTKMaterials: TAdvStringGrid;
    Splitter1: TSplitter;
    PanelFINMaterials: TPanel;
    Splitter2: TSplitter;
    gbFINMaterials: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblFINMol: TLabel;
    spbFINMol: TSpeedButton;
    sgFINMaterials: TAdvStringGrid;
    edtNomenclature: TEdit;
    edtMaterialName: TEdit;
    btnFind: TButton;
    edtFINMol: TEdit;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOFINDoc2FKOrder: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    Panel4: TPanel;
    Panel3: TPanel;
    sgENEstimateItem: TAdvStringGrid;
    Splitter3: TSplitter;
    gbENFINMaterials: TGroupBox;
    sgENFINMaterials: TAdvStringGrid;
    HTTPRIORQFKOrderItem: THTTPRIO;
    actRemove310: TAction;
    edtCFO: TEdit;
    Label3: TLabel;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    chbIsMaster: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    HTTPRIORQFKOrderData2FKParty: THTTPRIO;
    lblPriConnectionNumber: TLabel;
    edtPriConnectionNumber: TEdit;
    pnlLegend: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Label8: TLabel;
    Label9: TLabel;
    rgSearch: TRadioGroup;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    Panel6: TPanel;
    chkAutoSearch: TCheckBox;
    lblStorageZoneName: TLabel;
    edtStorageZoneName: TEdit;
    spbStorageZoneName: TSpeedButton;
    HTTPRIORQStorageZone: THTTPRIO;
    SpeedButton2: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    cbLinkingMaterials: TCheckBox;
    chkMolsAreIdentical: TCheckBox;
    procedure spbENElementClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnSelectClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure sgTKMaterialsClick(Sender: TObject);

    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddMaterialsClick(Sender: TObject);

    procedure ShowHideIsCN();


   function makeEstimateCondition(): String;
    procedure sgTKMaterialsDblClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure sgENEstimateItemDblClick(Sender: TObject);
    procedure actRemove310Execute(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure chbIsTranzitClick(Sender: TObject);
    procedure sgFINMaterialsDblClick(Sender: TObject);
    procedure rgSearchClick(Sender: TObject);
    procedure sgENEstimateItemKeyPress(Sender: TObject; var Key: Char);
    procedure sgENEstimateItemCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure sgENEstimateItemRowChanging(Sender: TObject; OldRow,
      NewRow: Integer; var Allow: Boolean);
    procedure spbStorageZoneNameClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure cbLinkingMaterialsClick(Sender: TObject);
    procedure chkMolsAreIdenticalClick(Sender: TObject);

  private
    { Private declarations }
	function readMolsAreIdenticalFromRegistry : Boolean;
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    rqFKOrderCode : Integer;
    rqFKOrderObj : RQFKOrder;
    finDoc : Integer;

    isFuel : Integer;

    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    MOLCode : String;
    masterMOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;
    partnerCode : String;
    zoneCode : Integer;
    epRenCode : Integer; // ��� ����

    lastPrice : real; // ��������� ��������� ���� ������� ��� ����������
    
    //procedure UpdateMaterials(planCodes: String); overload;
    procedure UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
    procedure updateEstimateItemGrid_();
    procedure updateFINMaterialsGrid();
    procedure updateENFINMaterialsGrid();
    //procedure clearGrids();
  end;

var
  frmMaterialsRQFKOrderOutEdit: TfrmMaterialsRQFKOrderOutEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQOrderItem, RQOrderController,
  TKMeasurementController, ENPlanWorkFormController,
  FINMaterialsController, FINDoc2FKOrderController, FINDocTypeController,
  FINMaterialsStatusController, EditFINMaterialCount, FINMolDataController,
  RQFKOrderItemController, RQFKOrderItem2ENEstimateItemController,
  RQFKOrderData2FKPartyController, Math, RQStorageZoneController, ShowRQStorageZone, Registry,
  ENSettingsConsts, BaseUtilsUnit;

var


  
{
  TKMaterialsHeaders: array [1..5] of String =
        ( '���'
          ,'������������ '
          ,'��. ���.'
          ,'����'
          ,'���� ��������'
        );
}
  TKMaterialsHeaders: array [1..7] of String =
        ( '���'
          ,'�����'
          ,'��. ���.'
          ,'ʳ�-��'
          ,'ֳ�� ��� ��� (�����������)'
          ,'������� ��� ���'
          ,'����� ����������'
        );
{
  ENPlanWorkHeaders: array [1..17] of String =
        ( '���'
          ,'��''��� ����������'
          ,'���. �'
          ,'��� �� ��'
          ,'г� �����'
          ,'̳���� �����'
          ,'���� ������� ����'
          ,'��� ����'
          ,'��� ����'
          ,'��� �����'
          ,'������'
          ,'ϳ������'
          ,'�������������'
          ,'����� �������������'
          //,'���� ��������� �����'
          ,'����� ������'
          ,'����������, �� ��� ����'
          ,'���� �������� ����'
        );

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( '���'
          ,'��� ������'
          ,'������'
          ,'ʳ���. �-��'
          ,'������� ���������'
          ,'ʳ���. ����'
          ,'����� ���� �� ��.'
          ,'������ ����'
          ,'��������'
          ,'��. �����'
          ,'����������, �� ��� ����'
          //,'���� �������� ����'
        );
}


  FINMaterialsHeaders: array [1..30] of String =
        ( '���'
          ,'�������������� �'
          ,'�����'
          ,'������� �����'
          ,'ʳ������ ��������'
          ,'����������� �������'{*** ����������� ***}
          ,'������������'
          ,'���� ����������'
          ,'���� ����������'
          ,'��� �����. �������'
          //,'����������� �������'
          ,'��� ���� �����. �������'
          ,'��� ����.'
          ,'��� ���'
          ,'���'
          ,'ֳ�� ������������'
          ,'ϲ� ����'
          ,'ֳ�� ��������'
          ,'������� ��������'
          ,'���������� �������'
          //-----------------
          ,'��� ���.'
          ,'��� ����'
          ,'��� ��������'
          , '��� ��. ���.'
          , '� ���.'
          ,'���� ����� � �����.'
          ,'��� ���� AX'
          ,'��� �����. ������� AX'
          ,'��� ���� �����. ������� AX'
          ,'��� ��� AX'
          ,'��� ���.��������� AX'
        );

  ENEstimateItemHeaders: array [1..12] of String =
        ( '���'
          ,'�������'
          //,'ʳ������ ����������'
          ,'ʳ������ �����������'           // !!! ������������� ��� �������� � ������ !!!
          ,'��. �����'
          ,'���� ���.����'
          ,'ϳ������'
          ,'���. �'
          ,'����� ��''����'
          ,'��� ������'
          ,'������'
          ,'��� �����'
          ,'��� �����'

          //,'����������, �� ��� ����'
          //,'���� �������� ����'
        );

  ENFINMaterialsHeaders: array [1..25] of String =
        ( '���'
          ,'�������������� �'
          ,'�����'
          ,'������� �����'
          ,'ʳ������ ��������'
          ,'���,����� ���'
          ,'ϲ� ����'

          ,'����������� �������' {*** ����������� ***}
          ,'������������'
          ,'���� ����������'
          ,'���� ����������'
          ,'��� �����. �������'
          //,'����������� �������'
          ,'��� ���� �����. �������'
          ,'��� ����.'
          ,'��� ���'
          ,'���'
          ,'ֳ�� ������������'

          ,'ֳ�� ��������'
          ,'������� ��������'
          ,'���������� �������'
          //-----------------
          ,'��� ���.'
          ,'��� ����'
          ,'��� ��������'
          , '��� ��. ���.'
          , '� ���.'
        );

procedure TfrmMaterialsRQFKOrderOutEdit.ShowHideIsCN();
begin
   if budgetCode = 75000011 then // ��� ������
    begin
      // if not chbIsTranzit.Checked then
      //HideControls([chbIsCNOperative], chbIsTranzit.Checked);
      HideControls([lblPriConnectionNumber, edtPriConnectionNumber], false);
    end
    else begin
      HideControls([lblPriConnectionNumber, edtPriConnectionNumber]);
      edtPriConnectionNumber.Text := '';
    end;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.updateENFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}, list1Count: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;
  estimateCode : Integer;
  orderAdditionalCondition : string;
begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';
   sgENFINMaterials.RowCount := 2;
   sgENFINMaterials.RowColor[1] := clWindow;

   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
   except
     on EConvertError do Exit;
   end;

   f := FINMaterialsFilter.Create;
   SetNullXSProps(f);
   SetNullIntProps(f);

   f.estimateItemRef := ENEstimateItemRef.Create;
   f.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

   //SUPP-9821, SUPP-9875 f.statusRef := FINMaterialsStatusRef.Create;
   //f.statusRef.code := FINMATERIALSSTATUS_GOOD;

   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE and RQFKORDERITEM.FKORDERREFCODE = '+ IntToStr(rqFKOrderCode) +')';

   {SUPP-9821, SUPP-9875}f.conditionSQL := f.conditionSQL + ' AND FINMATERIALS.STATUSREFCODE IN (' + IntToStr(FINMATERIALSSTATUS_GOOD) + ', ' + IntToStr(FINMATERIALSSTATUS_MOVED_TO_OPERATIVE) + ')';
   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);

   list1Count := High(l.list) + 1;

  if High(l.list) > -1 then
     sgENFINMaterials.RowCount:=High(l.list)+2
  else
     sgENFINMaterials.RowCount:=2;

   with sgENFINMaterials do
    for i:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        Objects[0, i+1] := TObject(1);
        RowColor[i+1] := $0080FF80;

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;

        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := l.list[i].quantity.DecimalString;

        Cells[5, i+1] := IntToStr(l.list[i].frc_code) + ' ' + l.list[i].frc_name;

        Cells[6,i+1] := l.list[i].div_name;
        Cells[7,i+1] := l.list[i].rest_purpose_name;

        Cells[8,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[10,i+1] := l.list[i].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        sgENFINMaterials.RowCount:= i + 2;
      end;
	  
	  orderAdditionalCondition := '';
	  /// SUPP-69561 ���� ���� ������ �� ���������, �� ������������ �������
	  /// ���������� ������ �������� ���� ������, ��� �� ��������� ���� �����������
	  /// � ����������
	  /// 28.03.2019 ���� �����, ��� � ����� ����, �������, ����� ��������� � ������� � ������������
	  /// ���, ������������. ������� �������� ������ ������� ������������ ��� ���������� - ���������� ���
	  /// ��� ����� ��������� (��-��������� - �� ����������, �� ���� ��������)
	  if (not chkMolsAreIdentical.Checked) and (rqFKOrderObj.molInCode <> rqFKOrderObj.molOutCode) then begin
	      orderAdditionalCondition := ' and o.molincode <> o.moloutcode';
	  end;

   /////////////////
   f.conditionSQL := 'finmaterials.code in '
                    +'( select RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE from RQFKORDERITEM2ENSTMTTM, RQFKORDERITEM, RQFKORDER o where '
                    +' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE = RQFKORDERITEM.CODE '
                    +' and RQFKORDERITEM.fkorderrefcode = o.code '
                    +' and finmaterials.code = RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE '
                    // +' and substring(o.molincode, 1, 2) = ''' + copy(rqFKOrderObj.molInCode, 1, 2) + ''''
                    +' and RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null ' + orderAdditionalCondition
                    +' and RQFKORDERITEM.FKORDERREFCODE <> '+ IntToStr(rqFKOrderCode) +')';

   {SUPP-9821, SUPP-9875}f.conditionSQL := f.conditionSQL + ' AND FINMATERIALS.STATUSREFCODE IN (' + IntToStr(FINMATERIALSSTATUS_GOOD) + ', ' + IntToStr(FINMATERIALSSTATUS_MOVED_TO_OPERATIVE) + ')';

   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);


    if High(l.list) > -1 then
    begin
       if list1Count > 0 then
         sgENFINMaterials.RowCount:= sgENFINMaterials.RowCount + High(l.list) + 1
       else
         sgENFINMaterials.RowCount:= High(l.list) + 2;
    end;
//  else
//     sgENFINMaterials.RowCount:=2;

  with sgENFINMaterials do
    for j:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[j].code <> Low(Integer) then
        Cells[0, j + list1Count + 1] := IntToStr(l.list[j].code)
        else
        Cells[0, j + list1Count + 1] := '';

        Objects[0, j + list1Count + 1] := TObject(2);
        RowColor[j + list1Count + 1] := clYellow;

        Cells[1, j + list1Count + 1] := l.list[j].nn;

        Cells[2,j + list1Count + 1] := l.list[j].mat_name;
        Cells[3,j + list1Count + 1] := l.list[j].mu_name;

        if l.list[j].quantity = nil then
          Cells[4,j + list1Count + 1] := ''
        else
          Cells[4,j + list1Count + 1] := l.list[j].quantity.DecimalString;

        Cells[5, j + list1Count + 1] := IntToStr(l.list[j].frc_code) + ' ' + l.list[j].frc_name;

        Cells[6,j + list1Count + 1] := l.list[j].div_name;
        Cells[7,j + list1Count + 1] := l.list[j].rest_purpose_name;

        Cells[8,j + list1Count + 1] := l.list[j].partner_name;
        if l.list[j].doc_date = nil then
          Cells[9,j + list1Count + 1] := ''
        else
          Cells[9,j + list1Count + 1] := XSDate2String(l.list[j].doc_date);
        Cells[10,j + list1Count + 1] := l.list[j].party_discription;

        //Cells[15,i+1] := l.list[i].div_name;


        //sgENFINMaterials.RowCount:= i + 2;
      end;

   /////////////////


   sgENFINMaterials.Row:=1;
end;

function buildBalSchCondition(list : TStringList) : String;
var condition, item : String;
two, four : TStringList;
begin
  condition := '';
  if Assigned(list) and (list.Count > 0) then begin
    two := TStringList.Create; four := TStringList.Create;
    for item in list do begin
      if Length(item) = 2 then two.Add(item);
      if Length(item) = 4 then four.Add(item);
      if (Length(item) <> 2) and (Length(item) <> 4) then
        raise Exception.Create(Format('������� ������� ����������� ������� %s (������� ������� %d, ������� ���������� 2 ��� 4)'
          , [item, Length(item)]));
    end;
  end;
  if Assigned(two) and (two.Count > 0) then begin
    condition := Format('substr(dat.bal_sch, 1, 2) IN (%s)'
      , [BaseUtils.array2String(BaseUtils.transformStringListMakeSingleQuotes(two), ',')]);
  end;
  if Assigned(four) and (four.Count > 0) then begin
    if Length(condition) > 0 then condition := condition + ' or ';
    condition := condition + Format('dat.bal_sch IN (%s)'
      , [BaseUtils.array2String(BaseUtils.transformStringListMakeSingleQuotes(four), ',')]);
  end;
  if Length(condition) > 0 then condition := '(' + condition + ')';
  Result := condition;
end;
procedure TfrmMaterialsRQFKOrderOutEdit.updateFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  i, j : Integer;
  cfoCode : string;
  FINMaterialsList : FINMaterialsList_;
  fmList : FINMaterialsShortList;
  fmFilter : FINMaterialsFilter;

  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  f2 : RQFKOrderItem2ENEstimateItemFilter;

  TempRQFKOrderData2FKParty: RQFKOrderData2FKPartyControllerSoapPort;
  RQFKOrderData2FKPartyList: RQFKOrderData2FKPartyShortList;
  f : RQFKOrderData2FKPartyFilter;


  fCondition, partyCondition, condition : String;
  estimateCode : Integer;
  //estimateObj : ENEstimateItem;

  balansNumberCondition, materialCondition : String;
  finFilter : FINMaterialsFilter;
  dateRemains : TXSDate;
  plan : ENPlanWork;

  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  orderItemFilter :  RQFKOrderItemFilter;
  orderItemList : RQFKOrderItemShortList;
  restPurposesCondition : String;
  operationKindsNotSelected, accountsForRQFKOrder : TStringList;

begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

   //SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

   // ���������� !!!!!!!!!!! �� ������ ....

      balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      //molCode := actObj.finMolCode ;

      // ����������� ��������� � ���������������� ��������� ...
      //materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")
      operationKindsNotSelected := TStringList.Create;
      accountsForRQFKOrder := TStringList.Create;
      operationKindsNotSelected.CommaText := DMReports.getSettingValueByKey(ENSettingsConsts.FKMATERIALS_OPERATION_KINDS_NOT_FOR_REST_SELECTION
      , rqFKOrderObj.dateGen);
      materialCondition := ' and h.op_kind_id not in ('
        + BaseUtils.array2String(BaseUtils.transformStringListMakeSingleQuotes(operationKindsNotSelected), ',') + ')';
///////////////////// 16.07.2012 NET-2490
// ����� ������ �� �������� ������ Access Violation'�
        try
          estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
          plan := DMReports.getPlanByEstimateCode(estimateCode);
        except
          //  on EConvertError do Exit;
          on EConvertError do ;
        end;

        //plan := DMReports.getPlanByEstimateCode(estimateCode);
/////////////////////


      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);

      condition := '';
      if ((rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) or
          (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)) then
        rgSearch.ItemIndex := 2;



// ������� - ������ �� ������������� + ������
if (rgSearch.ItemIndex = 0) then
begin
           try
             //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
             estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
            f := RQFKOrderData2FKPartyFilter.Create;
            SetNullIntProps(f);
            SetNullXSProps(f);
            f.estimateItemRef := ENEstimateItemRef.Create;
            f.estimateItemRef.code := estimateCode;
            //f.conditionSQL := 'finmaterialsrefcode is null';
            TempRQFKOrderData2FKParty :=  HTTPRIORQFKOrderData2FKParty as RQFKOrderData2FKPartyControllerSoapPort;
            RQFKOrderData2FKPartyList := TempRQFKOrderData2FKParty.getScrollableFilteredList(f, 0, -1);
            fCondition := '';
            partyCondition := '';
            for i:=0 to RQFKOrderData2FKPartyList.totalCount - 1 do
            begin
                AddListPos(fCondition, IntToStr(RQFKOrderData2FKPartyList.list[i].fkOrderItemRefNomenclatureCode));
                AddListPos(partyCondition, IntToStr(RQFKOrderData2FKPartyList.list[i].partyCode));
            end;
           except
               on EConvertError do Exit;
           end;
           begin

               fmFilter := FINMaterialsFilter.Create;
               SetNullXSProps(fmFilter);
               SetNullIntProps(fmFilter);

               fmFilter.estimateItemRef := ENEstimateItemRef.Create;
               fmFilter.estimateItemRef.code := estimateCode;
               // ��� ����� � ������������ ��������� �� ���� �������� (FINMATERIALSSTATUS_GOOD � FINMATERIALSSTATUS_VIRTUAL ) � �� �� �� ����� �� ������� ���������� �������� �� ��������.
               if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MBP, RQFKORDER_KIND_LOADEXPL_MNMA ]) then
               fmFilter.conditionSQL := 'finmaterials.statusrefcode in ('+ IntToStr(FINMATERIALSSTATUS_GOOD)+','+ IntToStr(FINMATERIALSSTATUS_VIRTUAL) +')'
               else
               fmFilter.conditionSQL := '(finmaterials.statusrefcode in ('+ IntToStr(FINMATERIALSSTATUS_VIRTUAL) +') or ' +
                ' /*NET-4250 ���������� � ��������� ������� ���������� �� ���������� ���������, ���. ������ �� �������� ��� ������������� ��������*/ ' +
                ' EXISTS (select es.code from enestimateitem as es ' +
                ' inner join rqfkorderitem2enstmttm as fies on es.code = fies.estimateitemcode ' +
                ' inner join rqfkorderitem as fi on fies.fkorderitemrefcode = fi.code ' +
                ' inner join rqfkorder as fo on fi.fkorderrefcode = fo.code ' +
                ' inner join rqallocationlist2fkrdr as alfo on alfo.fkorderrefcode = fo.code ' +
                ' inner join finmaterials as ma on fies.finmaterialsrefcode = ma.code ' +
                ' where ' +
                ' ma.statusrefcode = ' + IntToStr(FINMATERIALSSTATUS_GOOD) +
                ' and ma.estimateitemrefcode = FINMATERIALS.ESTIMATEITEMREFCODE)) ';
               fmList := TempFINMaterials.getScrollableFilteredList(fmFilter, 0, -1);

                //partyCondition := '';
                for i:=0 to fmList.totalCount - 1 do
                begin
                    AddListPos(partyCondition, IntToStr(fmList.list[i].party_id));
                    AddListPos(fCondition, IntToStr(fmList.list[i].mat_id));
                end;

                     if (length(fCondition) > 0 ) then
                begin
                     AddCondition( condition , ' DAT.MAT_ID in ( ' + fCondition + ')');
                 end ;

                 if (length(partyCondition) > 0 ) then
                 begin
                   AddCondition( condition , ' DAT.party_id in ( ' + partyCondition + ')');
                 end
                 else
                 begin
                    // ������ ����� ���� �� ������� :( ...

                   // 21.12.2011 <
                   // ���� �������� - ����� ���������� ��������� �� ������ �� ������� ������ ������� (����� ������� �����) �.� ������ �� ������� �� ���������� � ��������� ���� ������� (
                   // ���� ������� �� ������� �� ������������ ������ ��� ��� �� ������ ������ �� ��������� � �������� (������ �������� � ������� ���������� �������)
                   // >
                   AddCondition(condition , ' 1 = 2 ');
                 end;
           end;


           //AddCondition(condition, 'DAT.RE');

           //*** 28.09.12 NET-3102
           // finFilter.rest_purpose_id := REST_PURPOSE_ID_TRANZIT;
           finFilter.rest_purpose_type_id := REST_PURPOSE_TYPE_ID_TRANZIT;
end;


// ���������� �����
if (rgSearch.ItemIndex = 2) then
begin
         //*** 28.09.12 NET-3102
         // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
         AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
         //***
end;

if (rgSearch.ItemIndex = 1 ) then // �������� �� �������� ...
begin

end;


      //finFilter.conditionSQL := ' isCN is null';

      // ����� � ��������� ...
      if (edtMaterialName.Text <> '') then
        finFilter.mat_name := '*' + edtMaterialName.Text + '*';
      If (edtNomenclature.Text <> '') then
        finFilter.nn := '*' + edtNomenclature.Text + '*';

      if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MBP]) then // ���� ���� � �����. ���������� ���
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''22'') ) ')
      else if ((rqFKOrderObj.kind.code in [RQFKORDER_KIND_LOADEXPL_MNMA])) then // ���� ���� � �����. ���������� ����
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''15'') ) ')
      else if ((rqFKOrderObj.kind.code in [RQFKORDER_KIND_MBP, RQFKORDER_KIND_MNMA])) then // ���� ���� � �����. ��� ��� ���� (�� ����������)
        AddCondition(condition, ' ( dat.bal_sch = ' + rqFKOrderObj.account + ' ) ')
      else if ( (rqFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_MNMA]) or ( (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) and (rqFKOrderObj.account <> '') ))  then
        AddCondition(condition, ' ( dat.bal_sch = ' + rqFKOrderObj.account + ' ) ')
      ////
      else if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2OUT]) then // ��������� ������ ��� ��
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'', ''11'') or dat.bal_sch in (''0316'',''0230'',''0221'', ''0317'', ''0318''))') {NET-3750, NET-3206, SUPP-5078}
      else if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE]) then //SUPP-10431   /// ������ ������� �� ������
       //  AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'', ''28'', ''11'', ''15'') or dat.bal_sch in (''0230'') ) ')
       AddCondition(condition, ' ( dat.bal_sch not in (''0000'') ) ')
      else if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM, RQFKORDER_KIND_RASHOD_REM2MOL]) then begin
        accountsForRQFKOrder.CommaText := DMReports.getSettingValueByKey(ENSettingsConsts.ACCOUNTS_FOR_MATERIALS_MOVEMENT
          , rqFKOrderObj.dateGen);
        AddCondition(condition, buildBalSchCondition(accountsForRQFKOrder));
        //AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') or dat.bal_sch in (''0316'',''0318'', ''0319'', ''0221'', ''0730'', ''0230'', ''0260'', ''0320'', ''2820'') ) ')
      end else if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_ZONE_CHANGING]) then
        // ��� ��������� ����� �������� ���� ���� ���������� �� �����
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) not in (''-1'')) ')
      else if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_SALE_PRODUCTS]) then // SUPP-71988, SUPP-71989
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'', ''11'', ''28'') or dat.bal_sch in (''0316'',''0318'', ''0319'', ''0315'', ''0320'') ) ')
      else // �����
        ///// 05.01.12 ���� ��������� ����� 15-� ������ (����)
        //AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''15'', ''20'', ''22'') ) ');
        {SUPP-68471}
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'', ''11'') or dat.bal_sch in (''0316'',''0318'', ''0319'', ''0315'', ''0320'') ) ');
        /////

      if ((rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) or {or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE)}
          (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)) then
      begin
        //AddCondition(condition, ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
        //*** 28.09.12 NET-3102
        // condition := ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT);
        condition := ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT);
        //***
        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''15'', ''20'', ''22'', ''28'') ) ');

        {
        if not chbIsCNOperative.Checked then
        begin
            plan := DMReports.getPlanByEstimateCode(estimateCode);
            if plan.typeRef.code = ENPLANWORKTYPE_CN then
            begin
                if plan.priConnectionNumber <> '' then
                   AddCondition(condition, ' isCN is not null and trim(rest_purpose_name) like ''%' + plan.priConnectionNumber + '''')
                else
                   AddCondition(condition,' isCN is not null');
             end
             else
               AddCondition(condition, ' isCN is null');
         end;
         }
         if plan <> nil then
            if plan.typeRef.code <> ENPLANWORKTYPE_CN then
              AddCondition(condition, ' isCN is null');

      end;

      // NET-3773 ������� �� ����������� ������� ���� ������� ������
      if zoneCode <> LOW_INT then
      begin
                 restPurposesCondition := TempRQStorageZone.getStrRestPurposesByZone(zoneCode);
                 AddCondition( condition , ' DAT.REST_PURPOSE_ID in ( ' + restPurposesCondition + ')');
      end;

      finFilter.conditionSQL := condition;
      finFilter.orderBySQL := ' dat.mat_name';


      dateRemains := TXSDate.Create;
      dateRemains.XSToNative(GetXSDate( StrToDate('31.01.3000') ));

      //finDocCode := actObj.finDocCode ;//low(Integer);
      //dateDoc := TXSDate.Create;
      //frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));
      //frmFINMaterialsDataShow.dateDoc := actObj.dateGen;

{
���� ������ ...

      if  budgetCode > 0 then begin
        cfoCode := DMReports.getCFOByBudgetCode(budgetCode);
        if cfoCode > LOW_INT then
        begin
        // !!!
          AddCondition(materialCondition, ' and rst.budget_core_id = ' + IntToStr(cfoCode));
        end;
      end;
}

      if  edtCFO.Text <> '' then begin
        cfoCode := edtCFO.Text;//DMReports.getCFOByBudgetCode(budgetCode);
        if StrToInt(cfoCode) >LOW_INT then
        begin
        // !!!
          AddCondition(materialCondition, ' rst.budget_core_id = (' +
                                          ' SELECT c.id FROM sprav.budget_core c, sprav.frc_list f ' +
                                          ' WHERE c.frc_list_id = f.id ' +
                                          ' AND f.code = ' + chr(39) + cfoCode + chr(39) + ')');
        end;
      end;

   if (partnerCode <> '') then  finFilter.partner := partnerCode;

   if(not (rqFKOrderObj.kind.code in [RQFKORDER_KIND_ZONE_CHANGING])) then
   begin
    if  (rqFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL)  then          /// todooo    nn in condition
    begin
          AddCondition(materialCondition, ' ( (rst.mat_name) = (''������ �-80'') or  ' +
                                          ' (rst.mat_name)  =  (''������ �-76'') or ' +
                                          ' (rst.mat_name)  =  (''������ �-92'') or ' +
                                          ' (rst.mat_name)  =  (''������ �-95'') or ' +
                                          ' (rst.mat_name)  =  (''���������'')  )');
    end
    else
    if (rqFKOrderObj.kind.code <> RQFKORDER_KIND_RASHOD_OE2OUT) then
    begin
                   AddCondition(materialCondition, ' ( (rst.mat_name) <> (''������ �-80'') and  ' +
                                          ' (rst.mat_name)  <>  (''������ �-76'') and ' +
                                          ' (rst.mat_name)  <>  (''������ �-92'') and ' +
                                          ' (rst.mat_name)  <>  (''������ �-95'') and ' +
                                          ' (rst.mat_name)  <>  (''���������'')  )');
    end;
   end;

   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, //
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  rqFKOrderObj.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );


  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:=High(FINMaterialsList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list) do
      begin
        //Application.ProcessMessages;

        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;

        if FINMaterialsList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := FINMaterialsList.list[i].quantity.DecimalString;

        Cells[5,i+1] := FINMaterialsList.list[i].rest_purpose_name;


        Cells[6,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[8,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        //Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);

        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;

        if FINMaterialsList.list[i].calc_price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;

        Cells[15,i+1] := FINMaterialsList.list[i].div_name;

        if FINMaterialsList.list[i].price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

// ---------------------------------------

        if FINMaterialsList.list[i].mat_id = Low(Integer) then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := IntToStr(FINMaterialsList.list[i].mat_id);

        if FINMaterialsList.list[i].party_id = Low(Integer) then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);  // �� ������� !!! ... ����� ������!!!

        Cells[21, i+1] := FINMaterialsList.list[i].partner;

        if FINMaterialsList.list[i].mu_id = Low(Integer) then
          Cells[22,i+1] := ''
        else
          Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id);

        Cells[23, i+1] := FINMaterialsList.list[i].doc_num;

        if FINMaterialsList.list[i].wear_date = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := XSDate2String(FINMaterialsList.list[i].wear_date);

        Cells[25,i+1] := FINMaterialsList.list[i].ax_party_id;
        Cells[26,i+1] := FINMaterialsList.list[i].ax_rest_purpose_id;
        Cells[27,i+1] := FINMaterialsList.list[i].ax_rest_purpose_typeid;
        Cells[28,i+1] := FINMaterialsList.list[i].ax_frc_code;
        Cells[29,i+1] := FINMaterialsList.list[i].axInventDimFinId;

        sgFINMaterials.RowCount:= i + 2;
      end;

   sgFINMaterials.Row:=1;
end;




procedure TfrmMaterialsRQFKOrderOutEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';
{
  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // � ��� ��� (renCode = 0) �������� ��� �������
}

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;
          ///
          //if elementCode > 0 then chbByObjects.Checked := false;
          //HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;


procedure TfrmMaterialsRQFKOrderOutEdit.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  edtEPRenName.Text := '';
  epRenCode := LOW_INT;
end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbEPRenClick(Sender: TObject);
var
  frmEPRenShow : TfrmENEPRenShow;
begin
  inherited;
  frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
  try
    with frmEPRenShow do
    if ShowModal = mrOk then
    begin
      try
        epRenCode := StrToInt(GetReturnValue(sgEPRen,0));
        edtEPRenName.Text := GetReturnValue(sgEPRen,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmEPRenShow.Free;
  end;
end;


procedure TfrmMaterialsRQFKOrderOutEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
   cfoCode : String;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              //HideControls([], (budgetCode <> 75000011) an ) // ��� ������
              {
              if budgetCode = 75000011 then // ��� ������
              begin
                // if not chbIsTranzit.Checked then
                HideControls([chbIsCNOperative], chbIsTranzit.Checked)
              end
              else
                HideControls([chbIsCNOperative]);
              }
              ShowHideIsCN;

              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;

              cfoCode := DMReports.getCFOByBudgetCode(budgetCode);
              if StrToInt(cfoCode) > LOW_INT then
                 edtCFO.Text := cfoCode;
              //clearGrids();
              ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials, sgENFINMaterials]);
              ///
              //if budgetCode > 0 then chbByBudgets.Checked := false;
              //HideControls([chbByBudgets], (budgetCode > 0));
              ///
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmMaterialsRQFKOrderOutEdit.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList: FINDoc2FKOrderShortList;
  FINDoc2FKOrderFilterObj: FINDoc2FKOrderFilter;

begin

  lastPrice := 0;

  DisableControls([edtDepartment, edtENElementName, edtENBudgetName, edtFINMol, edtStorageZoneName, edtEPRenName]);
{
  DisableControls([spbENElement, spbENElementClear
                   ,spbENBudget, spbENBudgetClear
                   ,spbDepartment, spbDepartmentClear
                   ]);
}
  SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);
  SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
  ///
  edtDepartment.Text:= departmentName;
  edtENBudgetName.Text := budgetName;

  if (materialsINCode <> LOW_INT) then
  begin
      //btnSelectClick(Sender);
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  rqFKOrderObj := TempRQFKOrder.getObject(rqFKOrderCode);

  HideControls([chkMolsAreIdentical], (rqFKOrderObj.molInCode = RQFKOrderObj.molOutCode));
  if chkMolsAreIdentical.Visible then chkMolsAreIdentical.Checked := readMolsAreIdenticalFromRegistry;

  FINDoc2FKOrderFilterObj := FINDoc2FKOrderFilter.Create;
  SetNullIntProps(FINDoc2FKOrderFilterObj);
  SetNullXSProps(FINDoc2FKOrderFilterObj);

  FINDoc2FKOrderFilterObj.fkOrderRef := RQFKOrderRef.Create;
  FINDoc2FKOrderFilterObj.fkOrderRef.code := rqFKOrderObj.code;
  FINDoc2FKOrderFilterObj.finDocTypeRef := FINDocTypeRef.Create;
  // ��� 312 ;) FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_310;

  if (rqFKOrderObj.kind.code in [ RQFKORDER_KIND_LOADEXPL_MBP, RQFKORDER_KIND_LOADEXPL_MNMA ] ) then begin
     FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_322;
     // 27.12.2013 +++ VS +++ ��������� ���� � ������������ � ����.������.....
     // ���� ���� � ������������ �/� �� ������ � ��������
     // DisableControls([rgSearch]);
    end
  else
  ///// 01.12.11
  if (rqFKOrderObj.kind.code in [RQFKORDER_KIND_MBP, RQFKORDER_KIND_MNMA]) then begin
    FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_322;
  end
  /////
  else
  ///// 09.02.12
  if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) then
  begin
    FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_342;
  end
  /////
  else
  
  // 10.04.2012 +++ ���� �������� ������
  if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
  begin
    FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_352;
    rgSearch.ItemIndex := 1;
    rgSearchClick(Sender);
    DisableControls([rgSearch]);
  end else

  // 16.07.2012 +++ ���������� �������
  if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
  begin
    FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_362;
  end

  else
     FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_312;

  TempFINDoc2FKOrder :=  HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList := TempFINDoc2FKOrder.getScrollableFilteredList(FINDoc2FKOrderFilterObj,0,-1);
  if   FINDoc2FKOrderList.totalCount > 0 then
  begin
     finDoc := FINDoc2FKOrderList.list[0].finDocCode;
  end
  else
  begin
      ShowMessage('�������� ������ ��� ������ � ������������� ... ������� ����� !!!');
      exit;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  //clearGrids();
  ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials, sgENFINMaterials]);
  ShowHideIsCN;
end;

function TfrmMaterialsRQFKOrderOutEdit.makeEstimateCondition(): String;
var
  str, conditionSQL, planCondition : String;

begin
    planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';

    if departmentCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
    end;

{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;
}
    if budgetCode > 0 then
    begin
      AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
    end;

    //planFilter.kind := ENPlanWorkKind.Create;
    AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));


    try
      //planFilter.yearGen := StrToInt(edtYearGen.Text);
       AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('�������� ���!'), PChar('��������!'), MB_ICONWARNING);
        Exit;
      end;
    end;


      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));

    //condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
{
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    planFilter.conditionSQL := condition;


    AddCondition(conditionSQL, planFilter.conditionSQL);
}

    AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // ����� ������� �� �������� !!!
    planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    AddCondition(conditionSQL, planCondition);

    Result := conditionSQL;
end;


procedure TfrmMaterialsRQFKOrderOutEdit.btnSelectClick(Sender: TObject);
var i, j, n, LastCount: Integer;
    TempTKMaterials: TKMaterialsControllerSoapPort;
    TKMaterialsList: TKMaterialsShortList;
    materialsFilter: TKMaterialsFilter;

    ///
    //TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkList: ENPlanWorkShortList;
    
    //planFilter: ENPlanWorkFilter;
    //planCodes: String;
    condition , mCondition: String;
    ENMaterialsList: ENMaterialsShortList;

    TempENDepartment: ENDepartmentControllerSoapPort;
    depCodes : String;

    code : Integer;
begin
{
    for i := 1 to sgTKMaterials.RowCount - 1 do
      for j := 0 to sgTKMaterials.ColCount - 1 do
        sgTKMaterials.Cells[j, i] := '';

    sgTKMaterials.RowCount := 2;
}


    ////////////////////////////////////////////////////////////////////////////
    planFilter := ENPlanWorkFilter.Create;
    SetNullIntProps(planFilter);
    SetNullXSProps(planFilter);

    planCodes := '';




    planFilter.kind := ENPlanWorkKind.Create;

    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
       planFilter.kind.code := ENPLANWORKKIND_SALE_SPECIFICATION
    else
       planFilter.kind.code := ENPLANWORKKIND_CURRENT;

    AddCondition(condition, ' (statuscode not in (' + IntToStr(ENPLANWORKSTATUS_OLDER) +
                            ', ' + IntToStr(ENPLANWORKSTATUS_WORKS_FINISHED) +
                            ', ' + IntToStr(ENPLANWORKSTATUS_UNUSED) +  '))');

    if ( rgSearch.ItemIndex = 1) then
    begin

          try
            code :=  StrToInt( sgFINMaterials.Cells[20 , sgFINMaterials.Row ]);
          except on EConvertError do Exit;
          end;


         mCondition := 'and ei.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code)
         +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code)
         +' and finmaterials.statusrefcode not in ('+ IntToStr(FINMATERIALSSTATUS_CANCELED) +','+ IntToStr(FINMATERIALSSTATUS_MOVED) +'))';

         condition := 'enplanwork.code in (select planrefcode from enestimateitem where enestimateitem.code in ('
         +'  select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code)
         +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code)
         +' and finmaterials.statusrefcode not in ('+ IntToStr(FINMATERIALSSTATUS_CANCELED) +','+ IntToStr(FINMATERIALSSTATUS_MOVED) +'))'
         +')';

         if ((isFuel = 1) and (rqFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL)) then
         mCondition := mCondition + ' and ei.materialrefcode in (75000844, 500000120, 500002447, 75000843)';


         planFilter.conditionSQL := condition;
         //planFilter.code := -1; // ��� ���� �� ����� ...
         UpdateMaterials_(planFilter, mCondition); 

         Exit;
    end;


   if (budgetCode <= 0) and (rqFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS) then
   begin
       ShowMessage('������� �������������� ...');
       exit;
   end;

   if departmentCode <= 0 then
   begin
      if Application.MessageBox(PChar('�� ������� ϳ������ ... ������ �������� �������� �� ������ !!!  ���������� ??'),
                        PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
   end;


    if departmentCode > 0 then
    begin
      //planFilter.departmentRef := ENDepartmentRef.Create;
      //planFilter.departmentRef.code := departmentCode;

      TempENDepartment :=  HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
      depCodes := TempENDepartment.getDepartmentCodesDown(departmentCode);
      AddCondition(condition, 'departmentrefcode in (' + depCodes + ')');
    end;


    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;

    if budgetCode > 0 then
    begin
      planFilter.budgetRef := ENDepartmentRef.Create;
      planFilter.budgetRef.code := budgetCode;
    end;


    if (epRenCode > 0) then
    begin
      planFilter.renRef := EPRenRef.Create;
      planFilter.renRef.code := epRenCode;
    end;

    //planFilter.formRef :=  ENPlanWorkFormRef.Create;
    //planFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;

    try
      planFilter.yearGen := StrToInt(edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('�������� ���!'), PChar('��������!'), MB_ICONWARNING);
        Exit;
      end;
    end;

    if edtMonthGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('�������� �����!'), PChar('��������!'), MB_ICONWARNING);
      Exit;
    end;

    planFilter.monthGen := edtMonthGen.ItemIndex + 1;

    AddCondition(condition, ' (statuscode not in (' + IntToStr(ENPLANWORKSTATUS_OLDER) +
                            ', ' + IntToStr(ENPLANWORKSTATUS_WORKS_FINISHED) +
                            ', ' + IntToStr(ENPLANWORKSTATUS_UNUSED) +  '))');

    if chbIsMaster.Checked then
    begin
      AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ masterMOLCode+''')');
    end;

    { ��� �� ��� ��� !!!!
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;
    }


    /////
    {
    if chbOnlyOtherPurchases.Checked then
    begin
       AddCondition(condition,
                    'enplanwork.elementrefcode in ' +
                    '(select enelement.code from enelement where enelement.typerefcode in (' +
                    IntToStr(EN_PURCHASES_OBJECT) + ', ' + IntToStr(EN_PURCHASES_NO_OBJECT) + '))');
    end;
    }
    /////


    //mCondition := ' and ei.kindrefcode <> ' + IntToStr(ENESTIMATEITEMKIND_DISMOUNT);

    if chkkindrefcodemat.Checked then
        mCondition := ' and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_GSM)
    else
        mCondition := ' and ei.kindrefcode = ' + IntToStr(ENESTIMATEITEMKIND_MATERIALS);

    ///////
    if budgetCode = 75000011 then
      if edtPriConnectionNumber.Text <> '' then
        planFilter.priConnectionNumber := edtPriConnectionNumber.Text;
    ///////



    //if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER3_KIND_RASHOD_REM2MOL) then


    if ( (rgSearch.ItemIndex = 0) and ((not (rqFKOrderObj.kind.code  in [RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT])) and (budgetCode = 75000011))) then
    begin
       if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
         mCondition := mCondition + '  and ei.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_KSOE)
       else
         mCondition := mCondition + '  and ei.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_PRESENT);
    end;

    if ( rgSearch.ItemIndex = 2) then
    begin
        /// 20.10.11
        if not (rqFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E,
                                           RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE, RQFKORDER_KIND_RASHOD_BUFET]) then
        ///
          mCondition := mCondition + ' and ei.code not in (select RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE from RQFKORDERITEM2ENSTMTTM where RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null and RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE is not null)';
    end;


    //else
    //    ShowMessage('���������� ������ ���������� ... ��� RQFKORDER_KIND_RASHOD_OE2REM');

    planFilter.conditionSQL := condition;

    UpdateMaterials_(planFilter, mCondition);

end;

procedure TfrmMaterialsRQFKOrderOutEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;


procedure TfrmMaterialsRQFKOrderOutEdit.UpdateMaterials_(planFilter: ENPlanWorkFilter; mCondition : String);
var i, j, LastCount: Integer;
    //TempTKMaterials: TKMaterialsControllerSoapPort;
    //TKMaterialsList: TKMaterialsShortList;
    //materialsFilter: TKMaterialsFilter;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENMaterialsList: ENMaterialsShortList;
begin
  if planFilter = nil then Exit;

  for i := 1 to sgTKMaterials.RowCount - 1 do
    for j := 0 to sgTKMaterials.ColCount - 1 do
      sgTKMaterials.Cells[j, i] := '';

  sgTKMaterials.RowCount := 2;

  //SetGridHeaders(TKMaterialsHeaders, sgTKMaterials.ColumnHeaders);

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

  ENMaterialsList := TempENPlanWork.getMaterialsFromPlans(planFilter, mCondition, materialsINCode);
  if ENMaterialsList = nil then Exit;

  LastCount := High(ENMaterialsList.list);

  if LastCount > -1 then
    sgTKMaterials.RowCount := LastCount + 2
  else
    sgTKMaterials.RowCount := 2;


   with sgTKMaterials do
     for i := 0 to LastCount do
     begin
       Application.ProcessMessages;

       if ENMaterialsList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENMaterialsList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENMaterialsList.list[i].name;

       //AddCheckBox(1, i+1, false, false);

       Cells[2,i+1] := ENMaterialsList.list[i].measurementName;

       if ENMaterialsList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENMaterialsList.list[i].countFact.DecimalString;

       if ENMaterialsList.list[i].cost = nil then
         Cells[4,i+1] := ''
       else
         Cells[4,i+1] := ENMaterialsList.list[i].cost.DecimalString;

       if ENMaterialsList.list[i].sumCost = nil then
         Cells[5,i+1] := ''
       else
         Cells[5,i+1] := ENMaterialsList.list[i].sumCost.DecimalString;

       if ENMaterialsList.list[i].deliveryDate = Low(Integer) then
         Cells[6,i+1] := ''
       else
         Cells[6,i+1] := IntToStr(ENMaterialsList.list[i].deliveryDate);

       sgTKMaterials.RowCount := i + 2;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   sgTKMaterials.Row := 1;

   sgTKMaterialsClick(sgTKMaterials);

   if rgSearch.Enabled = true then
      if rgSearch.ItemIndex = 1 then
      begin
         sgTKMaterialsDblClick(sgTKMaterials);
      end;

   //sgENPlanWorkClick(sgENPlanWork);
end;



procedure TfrmMaterialsRQFKOrderOutEdit.updateEstimateItemGrid_();
var
  i, j , code : Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  eFilter : ENEstimateItemFilter;
  //pFilter : ENPlanWorkFilter;
  materialCode : Integer;
  conditionSQL, planCondition , eCondition : String;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   //sgENEstimateItem.RemoveCheckBox(1,1);


  eCondition := '';

  try
    materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    eFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(eFilter);
    SetNullXSProps(eFilter);

    //pFilter := ENPlanWorkFilter.Create;
    //SetNullIntProps(pFilter);
    //SetNullXSProps(pFilter);

    eFilter.materialRef := TKMaterialsRef.Create;
    eFilter.materialRef.code := materialCode;

    eFilter.kindRef := ENEstimateItemKindRef.Create;
    //eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

    /////
    if chkkindrefcodemat.Checked then
        eFilter.kindRef.code := ENESTIMATEITEMKIND_GSM
    else
        eFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;
    /////

    //planCondition := ' (enplanwork.statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
    {
    if departmentCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.departmentrefcode = ' + IntToStr(departmentCode));
      pFilter.departmentRef := ENDepartmentRef.Create;
      pFilter.departmentRef.code := departmentCode;
    end;
    }


{
    if elementCode > 0 then
    begin
      planFilter.elementRef := ENElementRef.Create;
      planFilter.elementRef.code := elementCode;
    end;
}
{
    if budgetCode > 0 then
    begin
      //AddCondition(planCondition, 'enplanwork.budgetrefcode = ' + IntToStr(budgetCode));
      pFilter.budgetRef := ENDepartmentRef.Create;
      pFilter.budgetRef.code := budgetCode;
    end;
}
    //planFilter.kind := ENPlanWorkKind.Create;
    // � ����� �������  AddCondition(planCondition, 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT));

{

    try
      //planFilter.yearGen := StrToInt(edtYearGen.Text);
      // AddCondition(planCondition, 'enplanwork.yeargen = ' + edtYearGen.Text);
      pFilter.yearGen := StrToInt(edtYearGen.Text);
    except
      on EConvertError do
      begin
        Application.MessageBox(PChar('�������� ���!'), PChar('��������!'), MB_ICONWARNING);
        Exit;
      end;
    end;
}
      //planFilter.monthGen := edtMonthGen.ItemIndex + 1;
      //AddCondition(planCondition, 'enplanwork.monthgen = ' + IntToStr(edtMonthGen.ItemIndex + 1));
      //pFilter.monthGen := edtMonthGen.ItemIndex + 1 ;

      // �������� ������ �� �������� !!!!
      //pFilter.formRef := ENPlanWorkFormRef.Create;
      //pFilter.formRef.code := ENPLANWORKFORM_NOPLANNED;


    //condition := ' (statuscode <> ' + IntToStr(ENPLANWORKSTATUS_OLDER) + ')';
{
    if length(MOLCode) > 0 then
    begin
       AddCondition(condition, 'enplanwork.code in (select planrefcode from enmol2planwork where molcode='''+ MOLCode +''')');
    end;

    planFilter.conditionSQL := condition;


    AddCondition(conditionSQL, planFilter.conditionSQL);
}

    //AddCondition(conditionSQL, 'enestimateitem.countfact <> 0');

    // ����� ������� �� �������� !!!
    //planCondition := 'enestimateitem.planrefcode in (select enplanwork.code from enplanwork where ' + planCondition + ')';

    //AddCondition(conditionSQL, planCondition);
//    ENESTIMATEITEMSTATUS_TMP = 0;
//ENESTIMATEITEMSTATUS_PLANED = 1;
    //AddCondition(conditionSQL, 'enestimateitem.statusrefcode in ('+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +', ' + IntToStr(ENESTIMATEITEMSTATUS_PLANED) +') ');
    //eFilter.conditionSQL := conditionSQL;

    //if rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then


{ AS !!!
    if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL) then
    begin
      //eFilter.conditionSQL := 'enestimateitem.statusrefcode in ('+ IntToStr(ENESTIMATEITEMSTATUS_TMP) +', ' + IntToStr(ENESTIMATEITEMSTATUS_PLANNED) +') ';
      eFilter.conditionSQL := 'enestimateitem.statusrefcode = '+ IntToStr(ENESTIMATEITEMSTATUS_PRESENT) ;
    end
    else
      ShowMessage('Unknown fkorder kind ... not RQFKORDER_KIND_RASHOD_OE2REM');
}


    if ( rgSearch.ItemIndex = 0) then
      AddCondition(eCondition, ' enestimateitem.statusrefcode = ' + IntToStr(ENESTIMATEITEMSTATUS_PRESENT));

    if ( rgSearch.ItemIndex = 2) then
    begin
      if not (rqFKOrderObj.kind.code in [
          RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT, RQFKORDER_KIND_RASHOD_E2E,
          RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE, RQFKORDER_KIND_RASHOD_BUFET])
      then AddCondition(eCondition, ' enestimateitem.code not in ( ' +
        'select RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE ' +
        '  from RQFKORDERITEM2ENSTMTTM ' +
        ' where RQFKORDERITEM2ENSTMTTM.ESTIMATEITEMCODE = enestimateitem.code ' +
        '   and RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is null)');
    end;


if ( rgSearch.ItemIndex = 1) then
begin

          try
            code :=  StrToInt( sgFINMaterials.Cells[20 , sgFINMaterials.Row ]);
          except on EConvertError do Exit;
          end;

         //eFilter.conditionSQL := 'enestimateitem.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         //+' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code) +')';

         AddCondition( eCondition , 'enestimateitem.code in (select rqfkorderdata2fkparty.estimateitemrefcode from rqfkorderdata2fkparty where '
         +' rqfkorderdata2fkparty.partycode = '+ IntToStr(code) +' union select finmaterials.estimateitemrefcode from finmaterials where finmaterials.party_id = '+ IntToStr(code) +')');



         //planFilter.conditionSQL := condition;

         //UpdateMaterials_(planFilter, mCondition);

         //Exit;
end;

    if  ( Length(eCondition) > 0 ) then eFilter.conditionSQL := eCondition;

    eFilter.orderBySQL := ' ENPLANWORK.DATESTART, KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';

    Application.ProcessMessages;
    // � ���� ������ ��������������� �� ��� ���� ������� ����� !!!!
    ENEstimateItemList := TempENEstimateItem.getDetailedEstimateList(eFilter, planFilter);



    //ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(eFilter, 0, -1);

    //eiLastCount := High(ENEstimateItemList.list);

    if High(ENEstimateItemList.list) > -1 then
      sgENEstimateItem.RowCount := High(ENEstimateItemList.list) + 2
    else
      sgENEstimateItem.RowCount := 2;

     with sgENEstimateItem do
       for i := 0 to High(ENEstimateItemList.list) do
       begin
         Application.ProcessMessages;

         if ENEstimateItemList.list[i].code <> Low(Integer) then
           Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
         else
           Cells[0,i+1] := '';

         //AddCheckBox(1, i+1, false, false);

         Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;
         {
         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;
         }

         // ���� �� ������� ... !!! ������������ ������ �� ������� !!!!
         if ENEstimateItemList.list[i].countFact = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;
         // ���� �� ������� ... !!! ������������ ������ �� ������� !!!!
         
         Cells[3,i+1] := ENEstimateItemList.list[i].measureType;

        if ENEstimateItemList.list[i].planRefDateStart = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENEstimateItemList.list[i].planRefDateStart);

         Cells[5, i+1] := ENEstimateItemList.list[i].planRefDepartmentName;

         Cells[6,i+1] := ENEstimateItemList.list[i].invNumber ;
         Cells[7,i+1] := ENEstimateItemList.list[i].elementName ;

         Cells[8,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[9,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[10,i+1] := ENEstimateItemList.list[i].planType;
         Cells[11,i+1] := ENEstimateItemList.list[i].planState;

         if ENEstimateItemList.list[i].planRefStatusCode = ENConsts.ENPLANWORKSTATUS_WORKS_FINISHED then
         RowColor[i+1] := clYellow;

         //Cells[9,i+1] := ENEstimateItemList.list[i].typeRefName;



        // Cells[8,i+1] := ENEstimateItemList.list[i].userGen;



        { if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);
         }
         sgENEstimateItem.RowCount := i + 2;
       end;

     sgENEstimateItem.Row := 1;

     sgENEstimateItemClick(nil);

end;


procedure TfrmMaterialsRQFKOrderOutEdit.sgTKMaterialsClick(Sender: TObject);
var
  i, j : integer;
begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
   sgENEstimateItem.RowCount := 2;
   sgENEstimateItem.RemoveCheckBox(1,1);


if (rgSearch.ItemIndex = 0) then
begin

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

   btnFindClick(Sender);

end;

   sgENEstimateItemClick(Sender);

end;


procedure TfrmMaterialsRQFKOrderOutEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
  //ENMOL2PlanWorkFilterObj : ENMOL2PlanWorkFilter;
  //ENMOL2PlanWorkList: ENMOL2PlanWorkShortList;

  molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // ���� ������ ���������� ...


     if departmentCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := departmentCode;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


// ���� ������������� - ��� ��� ... ���� ������������� !!!

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               edtMolName.Text := GetReturnValue(sgFINMol,0) + ' ' +GetReturnValue(sgFINMol,1); //ENMOL2PlanWorkObj.molName;
               MOLCode := GetReturnValue(sgFINMol,0);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;


end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);


   f.code := 1;
{
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > LOW_INT then
         if ENPlanWorkObj.renRef <> nil then
            /// ���� ��� ���� > 0 (�.�. ��� �� ���), �� ��������� ������������� �� ����,
            /// ����� ������� ���
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            // ����� ���������� �� ��������� ...
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;
}




   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               //if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               //ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
               departmentName := ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmMaterialsRQFKOrderOutEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  masterMOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  finDoc := LOW_INT;
  zoneCode := LOW_INT;
  partnerCode := '';
  epRenCode := LOW_INT;

  // ��� �������� ����� ����� ������ �� ����������� ����
 SetComboBoxCurrentYear(edtYearGen, 3, 1);
 edtYearGen.Items.Add('2066');
 SetComboBoxCurrentMonth(edtMonthGen);
end;

procedure TfrmMaterialsRQFKOrderOutEdit.btnAddMaterialsClick(
  Sender: TObject);
var
   TempRQOrderItem: RQOrderItemControllerSoapPort;
   obj : RQOrderItem;
   i, n, materialCode : Integer;
   eList : ENEstimateItemShortList;
   eArr :  ArrayOfENEstimateItemShort;
   eObj :  ENEstimateItemShort;
   state : boolean;
begin
{++++
   try
     materialCode := StrToInt(sgTKMaterials.Cells[0, sgTKMaterials.Row]);
   except
     on EConvertError do Exit;
   end;

   TempRQOrderItem := HTTPRIORQOrderItem as RQOrderItemControllerSoapPort;
   obj := RQOrderItem.Create;
   SetNullIntProps(obj);
   SetNullXSProps(obj);

   obj.orderRef := RQOrderRef.Create;
   obj.orderRef.code := orderCode;

   obj.material := TKMaterials.Create;
   if materialsINCode = LOW_INT then
      //obj.material.code := strToInt( sgTKMaterials.Cells[0, sgTKMaterials.Row] )
      obj.material.code := materialCode
   else
      obj.material.code := materialsINCode;

  n := 0;
  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  eList :=  ENEstimateItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, n);
  n := 0;
  state := false;
  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);
    if state then
    begin
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code :=  StrToInt( sgENEstimateItem.Cells[0, i] );
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[2, i];
       //eList.list[n] := ;
       eArr[n] := eObj;
       n := n + 1;
    end;
  end;
  eList.list := eArr;
  if (High(eArr) >= 0) then
    TempRQOrderItem.addWithEstimateList(obj, eArr)
  else begin
    Application.MessageBox(PChar('�� ������� ������� ��������!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;
  
  //materialsINCode := obj.material.code;
  materialsINCode := LOW_INT;
  
  btnSelectClick(Sender);
  
  //FormShow(Sender);
  //Close;
+++++}

{
  n := 0;
  for i := 1 to sgTKMaterials.RowCount - 1 do
  begin
    sgTKMaterials.GetCheckBoxState(1, i, state);
    if state then
    begin
       n := n + 1;
    end;
  end;

  eList :=  ENEstimateItemShortList.Create;
  eList.totalCount := 0;
  SetLength(eArr, n);
  n := 0;
  for i := 1 to sgTKMaterials.RowCount - 1 do
  begin
    sgTKMaterials.GetCheckBoxState(1, i, state);
    //if state then
    begin
       //n := n + 1;
       eObj := ENEstimateItemShort.Create;
       SetNullIntProps(eObj);
       SetNullXSProps(eObj);
       eObj.code :=  sgENEstimateItem.Cells[0, sgENEstimateItem.row];
       eObj.countFact := TXSDecimal.Create;
       eObj.countFact.DecimalString := sgENEstimateItem.Cells[3, sgENEstimateItem.row]
       //eList.list[n] := ;
       eArr[i] := eObj;
       //n := n + 1;
    end;
  end;
  eList.list := eArr;
  TempRQOrderItem.addWithEstimateList( ,eList);
}
end;


procedure TfrmMaterialsRQFKOrderOutEdit.sgTKMaterialsDblClick(
  Sender: TObject);
var materialCode: Integer;
    oldPlanCondition, planCondition, materialCondition: String;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    ENPlanWorkList: ENPlanWorkShortList;
    i, j, n, LastCount: Integer;
    state : boolean;
begin

  if materialsINCode = LOW_INT then
  begin
    try
      materialCode := StrToInt(sgTKMaterials.Cells[0,sgTKMaterials.Row]);
    except
      on EConvertError do
      begin
        for i := 1 to sgENEstimateItem.RowCount - 1 do
          for j := 0 to sgENEstimateItem.ColCount - 1 do
            sgENEstimateItem.Cells[j, i] := '';
        sgENEstimateItem.RowCount := 2;
        sgENEstimateItem.RemoveCheckBox(1, 1);
        Exit;
      end;
    end;
  end;


  updateEstimateItemGrid_();

if  ((rgSearch.ItemIndex = 2) or (rgSearch.ItemIndex = 0)) then
   edtMaterialName.Text := sgTKMaterials.cells[1, sgTKMaterials.row];

if  (rgSearch.ItemIndex = 0)  then
   btnFindClick(Sender);

if  ((rgSearch.ItemIndex = 2) and (chkAutoSearch.Checked)) then
   btnFindClick(Sender);

end;

procedure TfrmMaterialsRQFKOrderOutEdit.btnFindClick(Sender: TObject);
begin
  inherited;

if rgSearch.ItemIndex = 0 then
begin
   if (budgetCode <= 0) and (rqFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS) then
   begin
       ShowMessage('������� �������������� ...');
       exit;
   end;
end;

  updateFINMaterialsGrid;
end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgENEstimateItemClick(
  Sender: TObject);
begin
  inherited;
  if cbLinkingMaterials.Checked =  True then
     updateENFINMaterialsGrid();
{
   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;
}
  //updateFINMaterialsGrid();
end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgENEstimateItemDblClick(
  Sender: TObject);
var
  //TempFINMaterials: FINMaterialsControllerSoapPort;
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  m : FINMaterials;
  counnt, temp2  : real;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempTKMaterials: TKMaterialsControllerSoapPort;

  materialObj : TKMaterials;
  estimateObj : ENEstimateItem;
  estimateCode : Integer;

  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  oi2eFilter : RQFKOrderItem2ENEstimateItemFilter;
  oi2eList : RQFKOrderItem2ENEstimateItemShortList;
  oi2eFilterChk : RQFKOrderItem2ENEstimateItemFilter;
  oi2eListChk : RQFKOrderItem2ENEstimateItemShortList;
  order  , orderChk: RQFKOrder;
  orderItem , orderItemChk : RQFKOrderItem;
  i  , iChk ,iData : Integer;
  oi2eData , tmp , oi2eDataChk  , tmpData : String;
  countChk  , rezult : Double;

begin

  if sgFINMaterials.Cells[4,sgFINMaterials.Row] = '' then
  begin
      ShowMessage('������ �������� � ������ ���������� ...');
      Exit;
  end;

  temp2 := 0;
  try
    temp2 := StrToFloat(sgENEstimateItem.Cells[2, sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;


  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  if temp2 < 0.00000001 then
  begin
    Application.MessageBox(PChar('���-�� ���������� = 0... ��������������� ���-�� ���������� � ������!'), PChar('��������!'), MB_ICONWARNING);
    Exit;
  end;

  estimateCode := LOW_INT;
  try
    estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;

 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
 estimateObj := TempENEstimateItem.getObject( estimateCode );

  if estimateObj = nil then
  begin
    ShowMessage('estimateObj �� ������ ..');
    Close;
    exit;
  end;

  // �������� ������� ��� ����������� �� ���� �������� ..
  // ������ ����� ������� �� �� ��������
  //if not chbIsTranzit.Checked then
  //begin

 //2014.06.03 �������� ������� �� ������� ����������� ����������
 //��������� ��� ���������� �����������,�.�. ���������� ������ �� �������� ��� ����� ��� ������� ������ (� ��������� ��� �� ������)
  if rqFKOrderObj.kind.code  in [RQFKORDER_KIND_SALE_PRODUCTS, RQFKORDER_KIND_RASHOD_OE2OUT] = false then
  begin

    TempRQFKOrderItem2ENEstimateItem := HTTPRIORQFKOrderItem2ENEstimateItem as RQFKOrderItem2ENEstimateItemControllerSoapPort;
    oi2eFilter :=  RQFKOrderItem2ENEstimateItemFilter.Create;
    SetNullIntProps(oi2eFilter);
    SetNullXSProps(oi2eFilter);
    oi2eFilter.estimateItem := ENEstimateItem.Create;
    oi2eFilter.estimateItem.code :=  estimateObj.code;

    oi2eFilter.conditionSQL := ' RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null and ' +
                               ' RQFKORDERITEM2ENSTMTTM.FKORDERITEMREFCODE in (select i.code from RQFKORDER o, RQFKORDERITEM i where '+
                               ' o.code = i.fkorderrefcode and substring(o.molincode, 1, 2) = ''' + copy(rqFKOrderObj.molInCode, 1, 2) + ''' )' ;

    oi2eList := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(oi2eFilter, 0, 30);
    oi2eData := '';
    for i:=0 to High(oi2eList.list) do  //oi2eList.totalCount-1 do
    begin
      tmp := oi2eList.list[i].fkOrderItemRefNomenclatureName + ', ' + oi2eList.list[i].finMaterialsRefQuantity.DecimalString + ' ' + oi2eList.list[i].fkOrderItemRefNomenclatureUnitName;

      orderItem := TempRQFKOrderItem.getObject(oi2eList.list[i].fkOrderItemRefCode);


      TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

      order := TempRQFKOrder.getObject( orderItem.fkOrderRef.code );
      if order <> nil then
        tmp := '�' + order.numberDoc + ', ' + tmp
      else
        tmp := '����������� , ' + tmp; 

      oi2eData := oi2eData + #13#10 + tmp;
    end;

    if not (rqFKOrderObj.kind.code  in [RQFKORDER_KIND_LOADEXPL_MBP , RQFKORDER_KIND_LOADEXPL_MNMA ]) then
    if (Length(oi2eData) > 0) and (estimateObj.materialRef.code <> ENConsts.TKMATERIALS_SYSTEM_MATERIAL) then
    begin
      if Application.MessageBox(PChar('��� ������� ��� �������� � ���������� ������� : ' +
                                oi2eData + #13#10 + #13#10 + '���������� ??'),
                        PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;
    end;
  end;

  //end;  // ������� �� �������� ..
  //////////////////////////////////////////

  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  try

    try
      frmFINMaterialCountEdit.tkMaterialName := sgENEstimateItem.Cells[1,sgENEstimateItem.Row] + ', ' + sgENEstimateItem.Cells[3,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.tkMeasurementName := sgENEstimateItem.Cells[3,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.nn := sgFINMaterials.Cells[1,sgFINMaterials.Row];
      frmFINMaterialCountEdit.materialName := sgFINMaterials.Cells[2,sgFINMaterials.Row];
      frmFINMaterialCountEdit.measurementName := sgFINMaterials.Cells[3,sgFINMaterials.Row];
      frmFINMaterialCountEdit.availableCount := StrToFloat(sgFINMaterials.Cells[4,sgFINMaterials.Row]);


      if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
      begin
        frmFINMaterialCountEdit.kindCode := RQFKORDER_KIND_SALE_PRODUCTS;
        if lastPrice = 0 then
           frmFINMaterialCountEdit.edtExtraCargo.Text := FloatToStr(StrToFloat(sgFINMaterials.Cells[14, sgFINMaterials.Row]) * 1.1)
        else
           frmFINMaterialCountEdit.edtExtraCargo.Text := FloatToStr(lastPrice);
      end;


      // ��������� ����������� ���-� � ������������ ... � ������������� ...
      if (AnsiUpperCase(sgENEstimateItem.Cells[1, sgENEstimateItem.Row]) <> AnsiUpperCase(sgFINMaterials.Cells[2, sgFINMaterials.Row])) then
      begin
        if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) and (estimateObj.materialRef.code <> ENConsts.TKMATERIALS_SYSTEM_MATERIAL)  then
          if Application.MessageBox(PChar('�� ���������� ����� �������� !!!'
                                  + #13#10 + '"' + AnsiUpperCase(sgENEstimateItem.Cells[1, sgENEstimateItem.Row]) + '" �� "' + AnsiUpperCase(sgFINMaterials.Cells[2, sgFINMaterials.Row])+'"'
                                  + #13#10 + '���������� ??'),
                                  PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
          begin
            Exit;
          end;
      end;


      // ��������� ����������� ���-� � ������������ ... � ������������� ...
      if (AnsiUpperCase(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]) = AnsiUpperCase(sgFINMaterials.Cells[3,sgFINMaterials.Row])) then
      begin
      {���� ���������� ����� ���� ��������� ������ ���������, �� ������� �� ���������}
        if RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
        begin
             Application.MessageBox(PChar('���������� ������� ����� !!!'
                                  + #13#10 + '"' + AnsiUpperCase(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]) + '" �� "' + AnsiUpperCase(sgFINMaterials.Cells[3,sgFINMaterials.Row])+'"'
                                  + #13#10 + '������������� ��������� ���������� �������!!!'),
                                  PChar('����� !'),MB_ICONERROR+MB_OK);
             Exit;
        end;
        //frmFINMaterialCountEdit.edtCount.Text := sgENEstimateItem.Cells[2,sgENEstimateItem.Row];
        frmFINMaterialCountEdit.currentCount := StrToFloat(sgENEstimateItem.Cells[2,sgENEstimateItem.Row])
      end
      else
      begin
        {��� ������ �� ��� ������ ���� ��������� ������ ���������}
        if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) and (estimateObj.materialRef.code <> ENConsts.TKMATERIALS_SYSTEM_MATERIAL) then
          if Application.MessageBox(PChar('�� ���������� ������� ����� !!!'
                                  + #13#10 + '"' + AnsiUpperCase(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]) + '" �� "' + AnsiUpperCase(sgFINMaterials.Cells[3,sgFINMaterials.Row])+'"'
                                  + #13#10 + '���������� ??'),
                                  PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
          begin
            Exit;
          end;
      end;

      frmFINMaterialCountEdit.planItemName := '';////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                           //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];
    except
      on EConvertError do Exit;
    end;

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin
            // ���������� ���� ;)
            // ����� ���-�� � ��

            // �������� ������ � ���-�� � �������� ...

          ////////////////////////////////////////////////////////////////////////////////
          // �������� �������� !!
          // + ��������� ���� ���� �������� -��� ...

          // 21.12.2011 �������� ��� �� ���������� �� ����� ��������� ������ ��� �� ����� . ����������� � ���������
          {
            countChk:= 0 ;
            oi2eFilterChk :=  RQFKOrderItem2ENEstimateItemFilter.Create;
            SetNullIntProps(oi2eFilterChk);
            SetNullXSProps(oi2eFilterChk);
            oi2eFilterChk.estimateItem := ENEstimateItem.Create;
            oi2eFilterChk.estimateItem.code :=  estimateObj.code;
            oi2eFilterChk.conditionSQL := ' RQFKORDERITEM2ENSTMTTM.FINMATERIALSREFCODE is not null '
                                          + '  and RQFKORDERITEM2ENSTMTTM.code in ( '
                                          + ' select ri2e.code  from rqfkorderitem2enstmttm ri2e  , rqfkorderitem ri , rqfkorder r '
                                          + ' where ri2e.estimateitemcode = ' + IntToStr(estimateObj.code)
                                          + '  and ri2e.fkorderitemrefcode = ri.code '
                                          + '  and ri.fkorderrefcode = r.code '
                                          + '  and r.kindcode in ( 2 , 3 , 4 , 5 , 6 ) '
                                          + '  and trim(r.moloutcode) = ''' + rqFKOrderObj.molOutCode + '''  ) ' ;

            oi2eListChk := TempRQFKOrderItem2ENEstimateItem.getScrollableFilteredList(oi2eFilterChk, 0, -1);
            for iChk:=0 to High(oi2eListChk.list) do
             begin
               countChk := countChk +  StrToFloat(oi2eListChk.list[iChk].countGen.DecimalString) ;
             end;

             for iData:=0 to High(oi2eListChk.list) do  //oi2eList.totalCount-1 do
              begin
                tmpData := oi2eListChk.list[iData].fkOrderItemRefNomenclatureName + ', ' +
                           oi2eListChk.list[iData].finMaterialsRefQuantity.DecimalString + ' ' +
                           oi2eListChk.list[iData].fkOrderItemRefNomenclatureUnitName;

                orderItemChk := TempRQFKOrderItem.getObject(oi2eListChk.list[iData].fkOrderItemRefCode);


                TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

                orderChk := TempRQFKOrder.getObject( orderItemChk.fkOrderRef.code );
                if orderChk <> nil then
                  tmpData := '�' + orderChk.numberDoc + ', ' + tmpData
                else
                  tmpData := '����������� , ' + tmpData;

                oi2eDataChk := oi2eDataChk + #13#10 + tmpData;
              end;
             rezult := 0;
             rezult := ((frmFINMaterialCountEdit.enteredCount +  countChk)  -  StrToFloat(estimateObj.countFact.DecimalString) );
          // Y 22.12.2011 ���� �������� �������� . ����� ��������� ��� �� ���������� ����������
             if ( rezult > 0.00000001 ) then
              begin
                 Application.MessageBox(PChar('��������� ����`������� ������� ����� �� �� ����!!! : ' +
                                '����`���� �������� � ������� :' +  oi2eDataChk + #13#10 + #13#10 ), PChar('�����!'), MB_ICONWARNING);

                  Exit;
              end; }

          TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
          materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

          if materialObj = nil then
          begin
            ShowMessage('... materialObj �� ������ ..');
            Close;
            exit;
          end;

          //QQQ edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
          //edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
          //QQQ edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
          //QQQ lblMeasurementUnit.Caption := materialObj.measurement.name;
          ////////////////////////////////////////////////////////////////////////////////

               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := estimateCode; // !!!!!!!!!!!!!!!!!!!!!! � ���� ��������� !!!
               m.div_code := molCode; //* actObj.finMolCode;
               m.finDocItemCode := -1; //* actObj.finDocCode; // ���� ���� ��� ... �� ������� ��� �������� - ��� ��� ����� � ��

               m.quantity := TXSDecimal.Create;
               m.quantity.DecimalString :=  FloatToStr(frmFINMaterialCountEdit.enteredCount); //edtGettingCount.Text ; //!!!!!!!!! kol-vo ....//'1';// sgFINMaterials.Cells[15, sgFINMaterials.Row];

               if frmFINMaterialCountEdit.axFactor > 0 then
               begin
                 m.axFactor := TXSDecimal.Create;
                 m.axFactor.DecimalString := FloatToStr(frmFINMaterialCountEdit.axFactor);
               end;

               m.nn := sgFINMaterials.Cells[1, sgFINMaterials.Row];
               m.mat_name := sgFINMaterials.Cells[2, sgFINMaterials.Row];
               m.mu_name := sgFINMaterials.Cells[3, sgFINMaterials.Row];

               // ���� �� ����4-�??? ���� 15 !!!! m.div_name := sgFINMaterials.Cells[4, sgFINMaterials.Row];
               m.div_name := sgFINMaterials.Cells[15, sgFINMaterials.Row];

               m.rest_purpose_name := sgFINMaterials.Cells[5, sgFINMaterials.Row];

               m.partner_name := sgFINMaterials.Cells[6, sgFINMaterials.Row];
               m.doc_date  := TXSDate.Create;
               m.doc_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[7, sgFINMaterials.Row])));
               m.party_discription :=  sgFINMaterials.Cells[8, sgFINMaterials.Row];

               try
                 m.rest_purpose_id := StrToInt( sgFINMaterials.Cells[9, sgFINMaterials.Row] );
               except
                 on EConvertError do m.rest_purpose_id := LOW_INT;
               end;
               //m.rest_purpose_name := sgFINMaterials.Cells[9, sgFINMaterials.Row];

               try
                 m.rest_purpose_type_id := StrToInt(sgFINMaterials.Cells[10, sgFINMaterials.Row]);
               except
                 on EConvertError do m.rest_purpose_type_id := LOW_INT;
               end;

               try
                 m.budget_core_id := StrToInt(sgFINMaterials.Cells[11, sgFINMaterials.Row]);
               except
                 on EConvertError do m.budget_core_id := LOW_INT;
               end;

               try
                 m.frc_code := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
               except
                 on EConvertError do m.frc_code := LOW_INT;
               end;
               m.frc_name := sgFINMaterials.Cells[13, sgFINMaterials.Row];

               m.calc_price := TXSDecimal.Create;
               if sgFINMaterials.Cells[16, sgFINMaterials.Row] <> '' then
                 m.calc_price.DecimalString := sgFINMaterials.Cells[16, sgFINMaterials.Row]
               else
                 m.calc_price := nil;

               m.price := TXSDecimal.Create;
               if sgFINMaterials.Cells[14, sgFINMaterials.Row] <> '' then
                 m.price.DecimalString := sgFINMaterials.Cells[14, sgFINMaterials.Row]
               else
                 m.price := nil;

               m.cost := TXSDecimal.Create;
               if sgFINMaterials.Cells[17, sgFINMaterials.Row] <> '' then
                 m.cost.DecimalString := sgFINMaterials.Cells[17, sgFINMaterials.Row] //  ��� �� � ! m.fullCost
               else
                 m.cost := nil;

               m.bal_sch := sgFINMaterials.Cells[18, sgFINMaterials.Row];

//-----------------
               try
                 m.mat_id := StrToInt(sgFINMaterials.Cells[19, sgFINMaterials.Row]);
               except
                 on EConvertError do m.mat_id := LOW_INT;
               end;

               try
                 m.party_id := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
               except
                 on EConvertError do m.party_id := LOW_INT;
               end;

               m.partner := (sgFINMaterials.Cells[21, sgFINMaterials.Row]);

               try
                 m.mu_id := StrToInt(sgFINMaterials.Cells[22, sgFINMaterials.Row]);
               except
                 on EConvertError do m.mu_id := LOW_INT;
               end;

               m.doc_num := sgFINMaterials.Cells[23, sgFINMaterials.Row];

               ///////////////
               /////// ������ ���-�� � ��������� ��� ����������� ���������� ...
               //////////////
               m.fullQuantity := TXSDecimal.Create;
               m.fullCost := TXSDecimal.Create;

               if sgFINMaterials.Cells[4, sgFINMaterials.Row] <> '' then
                 m.fullQuantity.DecimalString := sgFINMaterials.Cells[4, sgFINMaterials.Row]
               else
                 m.fullQuantity := nil;

               if sgFINMaterials.Cells[17, sgFINMaterials.Row] <> '' then
                 m.fullCost.DecimalString := sgFINMaterials.Cells[17, sgFINMaterials.Row] // �� ���� ��� ���� ��� � � ! m.cost
               else
                 m.fullCost := nil;
               ////////////////////

               // �������� � ����� ...
               m.molDataRef := FINMolDataRef.Create;
               m.molDataRef.code := LOW_INT;

               // ���� ����� � ������������ MBP ��� ���� ������������ ���� ������ �� ����� � ������������
               {NET-3613 ��������� �� ������
               if ((rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) or
                   (rqFKOrderObj.kind.code = RQFKORDER_KIND_MBP) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_MNMA)) then
               begin
                 m.wear_date := TXSDate.Create;
                 m.wear_date := RQFKOrderObj.dateGen;
               end else
               begin }
                 if (sgFINMaterials.Cells[24, sgFINMaterials.Row] <> '') then
                 begin
                   m.wear_date := TXSDate.Create;
                   m.wear_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[24, sgFINMaterials.Row])));
                 end
                 else
                   m.wear_date := nil;


                // 07.12.2012 +++ ��� ���������� ����� ��������� ����...
                //// NET - 3888
                if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
                begin
                   m.extra_cargo := TXSDecimal.Create;
                   m.extra_cargo.DecimalString := frmFINMaterialCountEdit.edtExtraCargo.Text;
                end;

                // 25.08.2016 ���� �� AX
                m.ax_party_id := sgFINMaterials.Cells[25, sgFINMaterials.Row];
                m.ax_rest_purpose_id := sgFINMaterials.Cells[26, sgFINMaterials.Row];
                m.ax_rest_purpose_typeid := sgFINMaterials.Cells[27, sgFINMaterials.Row];
                m.ax_frc_code := sgFINMaterials.Cells[28, sgFINMaterials.Row];
                m.axInventDimFinId := sgFINMaterials.Cells[29, sgFINMaterials.Row];


        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT) then
            TempRQFKOrderItem.addOE2REM(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL)  then
            TempRQFKOrderItem.addREM2MOL(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT)  then
            TempRQFKOrderItem.addOperative2Tranzit(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE)  then
            TempRQFKOrderItem.addMeasurementChange(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) then
            TempRQFKOrderItem.addLoadMBP(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) then
            TempRQFKOrderItem.addLoadMNMA(m, rqFKOrderCode)
        else
        /////
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_MBP) then
            TempRQFKOrderItem.addMBP(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_MNMA) then
            TempRQFKOrderItem.addMNMA(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
            TempRQFKOrderItem.addOutMNMA(m, rqFKOrderCode)
        /////
        else
        // ��� ������ ����� �� �����, ��� � ��� ������� ��������� ������� - ����� ���������� ������ � �������
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET)
              or (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
            TempRQFKOrderItem.addOE2REM(m, rqFKOrderCode)
        else

        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_SALE_PRODUCTS) then
          TempRQFKOrderItem.addOE2REM(m, rqFKOrderCode)  // DEBUG !!!
        else

        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT) then
          TempRQFKOrderItem.addGift(m, rqFKOrderCode)

        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) then
          TempRQFKOrderItem.addToStorage(m, rqFKOrderCode)

        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) then
          TempRQFKOrderItem.addOutFuel(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
          TempRQFKOrderItem.addZoneChanging(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
          TempRQFKOrderItem.addAvarOut(m, rqFKOrderCode)
        else
        if (rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
          TempRQFKOrderItem.addAvarIn(m, rqFKOrderCode)
        else
            ShowMessage('Error on Kind');

      updateFINMaterialsGrid;

      // 07.07.2017 ���� ���� ���� ����� ���������, ������ ��� ����� �������� �������� ����� �����������,
      // � �� ������ ��� ������� - ��� ������, ����� ��� ���� �������� ���������� ������� �������� �� ������ ������!!!
      // updateEstimateItemGrid_();

      if cbLinkingMaterials.Checked =  True then
         updateENFINMaterialsGrid;
    end;

    //UpdateEstimateItems(planCode, estimateItemKind);
    // ����� ���� ��������� ����� ������ ������ ....
    //updateFINMaterialsGrid;
    //updateENFINMaterialsGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.actRemove310Execute(
  Sender: TObject);
var
  objCode, objSign : Integer;

  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
begin
  inherited;

  objCode := LOW_INT;
  try
    objCode := StrToInt(sgENFINMaterials.Cells[0, sgENFINMaterials.Row]);
  except
    on EConvertError do Exit;
  end;

  objSign := Integer(sgENFINMaterials.Objects[0, sgENFINMaterials.Row]);

  if (objSign = 1) then
  begin

    if Application.MessageBox(PChar('�� ����� ������ �������� ����''����?'),
                              PChar('�����!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
        TempRQFKOrderItem.removeOE2REM(objCode, rqFKOrderObj.code)
      else
      if rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_REM2MOL then
        TempRQFKOrderItem.removeREM2MOL(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP then
        TempRQFKOrderItem.removeLoadMBP(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
        TempRQFKOrderItem.removeLoadMNMA(objCode, rqFKOrderObj.code)
      else
      /////
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_MBP then
        TempRQFKOrderItem.removeMBP(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_MNMA then
        TempRQFKOrderItem.removeMNMA(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA then
        TempRQFKOrderItem.removeOutMNMA(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
        TempRQFKOrderItem.removeGift(objCode, rqFKOrderObj.code)
      else
      if  rqFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE then
        TempRQFKOrderItem.removeToStorage(objCode, rqFKOrderObj.code)
      /////
      else
      if rqFKOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING then
        TempRQFKOrderItem.removeZoneChanging(objCode, rqFKOrderObj.code)
      else
      if rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT then
        TempRQFKOrderItem.removeAvarOut(objCode, rqFKOrderObj.code)
      else
      if rqFKOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN then
        TempRQFKOrderItem.removeAvarIn(objCode, rqFKOrderObj.code)
      else
        ShowMessage('�� ����� ������ ��������� ��� ������ ....');
      if cbLinkingMaterials.Checked =  True then
         updateENFINMaterialsGrid;
    end;
  end
  else begin
    Application.MessageBox(PChar('�� ������ ���������� � ������ ����������� ������! ' + #13#10 +
                                 '�������� ����� ����� ������ ����� ������!'), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
      if Application.MessageBox(PChar('ϳ��� ������� ϳ������� ������ ���������� ����� ��� ϳ������� �� !!!  ���������� ??'),
                        PChar('����� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)<> IDOK then
      begin
          Exit;
      end;

               departmentCode := LOW_INT; //ENDepartmentShort(tvDep.Selected.Data).code;
               departmentName := ''; //ENDepartmentShort(tvDep.Selected.Data).shortName;
               edtDepartment.Text:= ''; //ENDepartmentShort(tvDep.Selected.Data).shortName;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.cbLinkingMaterialsClick(
  Sender: TObject);
  var i, j : integer;
begin
  inherited;
  if cbLinkingMaterials.Checked = false then
  begin
     for i:=1 to sgENFINMaterials.RowCount-1 do
       for j:=0 to sgENFINMaterials.ColCount-1 do
         sgENFINMaterials.Cells[j,i]:='';
     sgENFINMaterials.RowCount := 2;
     sgENFINMaterials.RowColor[1] := clWindow;
  end;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.chbIsTranzitClick(Sender: TObject);
begin
  inherited;

  ShowHideIsCN;

end;

function TfrmMaterialsRQFKOrderOutEdit.readMolsAreIdenticalFromRegistry : Boolean;
var
	reg : TRegistry;
	res : Boolean;
begin
	reg := TRegistry.Create;
	res := reg.OpenKey('Software\KSOE\EnergyNet\UserProperties\', False);
	if res Then begin
		res := reg.ReadBool('ShowFINMaterialsIfMolsAreIdentical');
	end;
	Result := res;
	reg.CloseKey();
	reg.Free;
end;

procedure TfrmMaterialsRQFKOrderOutEdit.chkMolsAreIdenticalClick(
  Sender: TObject);
var
  reg : TRegistry;
begin
  inherited;
  updateENFINMaterialsGrid;
  
  // ������ � ������ ���������� ��������.
  reg := TRegistry.Create;
  if reg.OpenKey('Software\KSOE\EnergyNet\UserProperties\',True) Then begin
    reg.WriteBool('ShowFINMaterialsIfMolsAreIdentical', chkMolsAreIdentical.Checked);
  end;
  reg.CloseKey();
  reg.Free;
end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgFINMaterialsDblClick(
  Sender: TObject);
begin
  inherited;

  if rgSearch.ItemIndex = 1 then
    btnSelectClick(Sender);

end;

procedure TfrmMaterialsRQFKOrderOutEdit.rgSearchClick(Sender: TObject);
var i, j: Integer;
begin
  HideControls([panel1, chkAutoSearch], rgSearch.ItemIndex = 1);
  if rgSearch.ItemIndex = 0 then
     btnFind.Click;
  if rgSearch.ItemIndex = 2 then
     If chkAutoSearch.Checked = True then
        btnFind.Click;
  if rgSearch.ItemIndex = 1 then
    ClearGrids([sgTKMaterials, sgENEstimateItem, sgFINMaterials, sgENFINMaterials]);
end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgENEstimateItemKeyPress(
  Sender: TObject; var Key: Char);
 var
  keyy : Char;
  begin

      if key = #13 then
         sgENEstimateItemDblClick(Sender);
      
end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgENEstimateItemCellChanging(
  Sender: TObject; OldRow, OldCol, NewRow, NewCol: Integer;
  var Allow: Boolean);
  var
    i , j  : Integer;
begin
  ///// 24.02.12 ��-�� ����� ������ �������!!!
  
  //inherited;
  //updateENFINMaterialsGrid();


end;

procedure TfrmMaterialsRQFKOrderOutEdit.sgENEstimateItemRowChanging(
  Sender: TObject; OldRow, NewRow: Integer; var Allow: Boolean);
  var
  i , j  : Integer;
begin
{  if (rgSearch.ItemIndex = 0) then
  begin

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

  end;
}
   if rgSearch.ItemIndex = 0 then
      btnFind.Click;

end;

procedure TfrmMaterialsRQFKOrderOutEdit.spbStorageZoneNameClick(
  Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.conditionSQL :=
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + MOLCode + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtStorageZoneName.Text := GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;


procedure TfrmMaterialsRQFKOrderOutEdit.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
  edtStorageZoneName.Text := '';
end;
end.
