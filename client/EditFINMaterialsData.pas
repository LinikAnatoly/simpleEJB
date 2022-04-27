unit EditFINMaterialsData;

interface

uses Windows, Messages, SysUtils, Variants, Graphics, Forms, Dialogs, ChildFormUnit,
     Controls, Classes, StdCtrls, ToolWin, ExtCtrls, XSBuiltIns, GridHeadersUnit,
     ActnList, Grids, BaseGrid, ComCtrls, Buttons, InvokeRegistry, ImgList, Rio, SOAPHTTPClient,
     DialogFormUnit, TB2Item, TB2Dock, TB2Toolbar, AdvGrid,
     DMReportsUnit, ENConsts, EnergyproController, EnergyproController2, FINMaterialsController,
     TKMaterialsController, ENEstimateItemController, ENWorkOrderController, ENPlanWorkController,
     FINMolDataController, AdvObj;

type
  TfrmFINMaterialsDataEdit = class(TDialogForm)
  lblFrc_name : TLabel;

  HTTPRIOFINMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    lblFINDate: TLabel;
    edtFINDate: TDateTimePicker;
    edtTKMaterial: TEdit;
    lblTKMaterial: TLabel;
    edtTKCount: TEdit;
    lblTKCount: TLabel;
    lblFactCount: TLabel;
    edtFactCount: TEdit;
    GroupBox1: TGroupBox;
    sgENPlanWorkItem: TAdvStringGrid;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    gbENFINMaterials: TGroupBox;
    sgENFINMaterials: TAdvStringGrid;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    lblMeasurementUnit: TLabel;
    lblPlanWorkItem: TLabel;
    gbFINMaterials: TGroupBox;
    sgFINMaterials: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    edtNomenclature: TEdit;
    edtMaterialName: TEdit;
    btnFind: TButton;
    lblENEstimateItemComment: TLabel;
    sgENEstimateItem: TAdvStringGrid;
    lblPlanWork: TLabel;
    edtPlanWork: TEdit;
    spbPlanWork: TSpeedButton;
    cbEstimateItemKind: TComboBox;
    HTTPRIOFINMolData: THTTPRIO;
    lblFINMol: TLabel;
    edtFINMol: TEdit;
    spbFINMol: TSpeedButton;
    chbIsIgnoreParty: TCheckBox;
    lblCFO: TLabel;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbFINMolClick(Sender: TObject);
    procedure spbFINMaterialClick(Sender: TObject);

    procedure updateFINMaterialsGrid();
    procedure updateENPlanWorkItemGrid();
    procedure updateENFINMaterialsGrid();

    procedure sgFINMaterialsDblClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edtNomenclatureKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actUpdateExecute(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbPlanWorkClick(Sender: TObject);
    procedure cbEstimateItemKindChange(Sender: TObject);
    procedure sgFINMaterialsClick(Sender: TObject);



  private
    { Private declarations }
    boundedFinmaterialsCount : Double;
  public
    { Public declarations }
    planCode : Integer;
    estimateCode : Integer;
    trEstimateCodes : string; // ���� �������� �� ���������� ������ .. �� ���� ������� � ���������� �� �����
    estimateItemKind: Integer;
    planCodes, partyCondition, nnCondition : String;

    parentEstimateCode : Integer;
    elementTypeCode: Integer;

    //writePartyCondition , writeNnCondition: String;
    //isWriteOffProtection : Boolean;

    procedure UpdateEstimateItems(planCode: Integer; estimateItemKind: Integer);
  end;

var
  frmFINMaterialsDataEdit: TfrmFINMaterialsDataEdit;
  FINMaterialsObj: FINMaterials;

  finDoc : Integer;
  molCode : String;
  //actObj_ : ENAct;
  workOrder : ENWorkOrder;
  planWork : ENPlanWork;
  molData : FINMolData;
  materialObj : TKMaterials;
  estimateObj : ENEstimateItem;
  materialCondition : String;
  balansNumberCondition : String;

  FINMaterialsHeaders: array [1..26] of String =
        ( '���'
          ,'�������������� �'
          ,'�����'
          ,'������� �����'
          ,'ʳ������ ��������'
          ,'����������� �������' {*** ����������� ***}
          ,'������������'
          ,'���� ����������'
          ,'���� ����������'
          ,'��� ...'
          //,'����������� �������'
          ,'��� ...'
          ,'��� ...'
          ,'��� ���'
          ,'���'
          ,'ֳ�� ������������'
          ,'ϲ� ����'
          ,'ֳ�� ��������'
          ,'������� ��������'
          ,'���������� �������'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
          ,'���� ����� � �����.'
          ,'��� ��� ������.AX'
        );


  ENFINMaterialsHeaders: array [1..24] of String =
        ( '���'
          ,'�������������� �'
          ,'�����'
          ,'������� �����'
          ,'ʳ������ ��������'

          ,'ϲ� ����'

          ,'����������� �������' {*** ����������� ***}
          ,'������������'
          ,'���� ����������'
          ,'���� ����������'
          ,'��� ...'
          //,'����������� �������'
          ,'��� ...'
          ,'��� ...'
          ,'��� ...'
          ,'...'
          ,'ֳ�� ������������'

          ,'ֳ�� ��������'
          ,'������� ��������'
          ,'���������� �������'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
        );


  ENPlanWorkItemHeaders: array [1..9] of String =
        ( '���'
          ,'��� ������'
          ,'������'
          ,'�������'
          ,'����� ���� �� ��.'
          ,'��������'
          ,'��. �����'
          ,'����������, �� ��� ����'
          ,'���� �������� ����'
        );

  ENEstimateItemHeaders: array [1..10] of String =
        ( '���'
          ,'�������'
          ,'ʳ������ ����������'
          ,'ʳ������ �����������'           // !!! ������������� ��� �������� � ������ !!!
          ,'��. �����'
          ,'��� ������'
          ,'������'
          ,'��� ������ ���������'
          ,'����������, �� ��� ����'
          ,'���� �������� ����'
        );        


implementation

uses //FINMolController
//,ShowFINMol
//,ENDepartment2EPRenController ,

ENPlanWorkItemController
,FINMaterialsStatusController
,EditFINMaterialCount
,ENEstimateItemKindController
,ShowENPlanWork
//,FINDoc2MolDataController
,FINMolTypeController
,ShowFINMolData
,ENElementController
,TKAccountingTypeController
;


{uses
    EnergyproController, EnergyproController2, FINMaterialsController  ;
}
{$R *.dfm}


procedure TfrmFINMaterialsDataEdit.updateENPlanWorkItemGrid();
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  ENPlanWorkItemList: ENPlanWorkItemShortList;
  planItemFilter : ENPlanWorkItemFilter;
begin

   if estimateObj.planItemRef <> nil then
     if estimateObj.planItemRef.code > LOW_INT then
     begin
       TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
       planItemFilter.code :=  estimateObj.planItemRef.code;

       /////
       planItemFilter.planRef := ENPlanWorkRef.Create;
       planItemFilter.planRef.code := estimateObj.planRef.code;
       /////

       ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

       lblPlanWorkItem.Caption := ENPlanWorkItemList.list[0].kartaNum + ' ' + ENPlanWorkItemList.list[0].kartaRefName + ' ' + ENPlanWorkItemList.list[0].countGen.DecimalString;
     end;


{ //-----------------------------------------------------------------
   for i:=1 to sgENPlanWorkItem.RowCount-1 do
     for j:=0 to sgENPlanWorkItem.ColCount-1 do
       sgENPlanWorkItem.Cells[j,i]:='';

    SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    //if planItemFilter = nil then
    begin
       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
    end;

    //if planItemFilter.planItemRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
   // planItemFilter.planRef.code := actObj. ;
   planItemFilter.conditionSQL := 'code in (select enestimateitem.planitemrefcode from enestimateitem';
   planItemFilter.conditionSQL := planItemFilter.conditionSQL +' where enestimateitem.planrefcode = '+ IntToStr(planCode);
   planItemFilter.conditionSQL := planItemFilter.conditionSQL +' and enestimateitem.materialrefcode = (select enestimateitem.materialrefcode from enestimateitem where enestimateitem.code =' + IntToStr(estimateCode) + '))';


    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,-1);

    //iLastCount:=High(ENPlanWorkItemList.list);

    if High(ENPlanWorkItemList.list) > -1 then
       sgENPlanWorkItem.RowCount:=High(ENPlanWorkItemList.list)+2
    else
       sgENPlanWorkItem.RowCount:=2;

     with sgENPlanWorkItem do       
     for i:=0 to High(ENPlanWorkItemList.list) do
        begin
          Application.ProcessMessages;
          if ENPlanWorkItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
          Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;


          if ENPlanWorkItemList.list[i].countGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;

          if ENPlanWorkItemList.list[i].normOfTime = nil then
             Cells[4, i+1] := ''
          else
             Cells[4, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;

          Cells[5, i+1] := ENPlanWorkItemList.list[i].meter;
          Cells[6, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

          Cells[7,i+1] := ENPlanWorkItemList.list[i].userGen;
          if ENPlanWorkItemList.list[i].dateEdit = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);
          //iLastRow:=i+1;
          sgENPlanWorkItem.RowCount:=i+2;
        end;
     //iColCount:=iColCount+1;
     sgENPlanWorkItem.Row:=1;

}
end;


procedure TfrmFINMaterialsDataEdit.updateFINMaterialsGrid();
var
  i, j : Integer;
  TempFINMaterials: FINMaterialsControllerSoapPort;
  FINMaterialsList: FINMaterialsList_;
  finFilter : FINMaterialsFilter;
  dateRemains : TXSDate;
  condition : String;
  estimateCode : Integer;
  usesMDAXData: Boolean;
begin

  usesMDAXData := DMReports.UsesMDAXData(ENConsts.CONFIG_USES_MDAX_INVENTORYONHAND);

   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;


   //SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

   // ���������� !!!!!!!!!!! �� ������ ....

      balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      //molCode := actObj.finMolCode ;

      // �� ���������� ������� �� ��� - ��� ����� ���-�� � ��������� .. ��� �� ...
      materialCondition := ' and h.op_kind_id not in (''5'',''10'',''310'',''300'',''320'',''321'',''20'',''15'', ''322'')';
      
      //materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")



{
      if (edtMaterialName.Text <> '') then
      begin
         materialCondition := ' and upper(rst.mat_name) like ' + chr(39) + '%'+ AnsiUpperCase(edtMaterialName.Text) + '%' + chr(39) ;
      end;

      If (edtNomenclature.Text <> '') then
      begin
        materialCondition := materialCondition + ' and upper(rst.nn) like ' + chr(39) + '%'+ AnsiUpperCase(edtNomenclature.Text) + '%' + chr(39) ;
      end;
}

      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);
      // ����� � ��������� ...
      if (edtMaterialName.Text <> '') then
      finFilter.mat_name := '*' + edtMaterialName.Text + '*';
      If (edtNomenclature.Text <> '') then
      finFilter.nn := '*' + edtNomenclature.Text + '*';

      condition := '';

      // ���� ���������� - ��������� �� ���� ... ���� ��� - ���������� ��������� ��� ��
      //finFilter.conditionSQL := ' isCN '
      if planWork.typeRef.code = ENPLANWORKTYPE_CN then
      begin

        if planWork.priConnectionNumber <> '' then
          //finFilter.conditionSQL := ' isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''''
          condition := ' ( isCN is not null and trim(rest_purpose_name) like ''%' + planWork.priConnectionNumber + ''')'
        else
          //finFilter.conditionSQL := ' isCN is not null';
          begin
          condition := ' (isCN is not null)'
          end;

          if  partyCondition <> '' then
          begin
              condition := '(' + condition + ' or ( dat.party_id in ('+ partyCondition +')) )';
          end;


      end
      else
        //finFilter.conditionSQL := ' isCN is null';
        condition := ' isCN is null';

      ///// 28.12.10
      // ��� ���� ������ ����� ������ �������� "���� �����", �� ������� ���� ����
      ///// *** 21.04.11 ������� ��� ����������� !!!
      // 26.04.11 ���-���� ����... � �� ��� �� ����� ����. �����... ����� ������ ������� �������
      if (planWork.typeRef.code = ENPLANWORKTYPE_CN) and (chbIsIgnoreParty.Checked) then
        condition := '';
      /////

      // 22.04.11 �� ����� ������ �� ��������� ��� �������� ��� ��� ����
      if (planWork.typeRef.code = ENPLANWORKTYPE_CN) and
         (estimateItemKind = ENESTIMATEITEMKIND_GSM) and
         (chbIsIgnoreParty.Checked) then
        condition := '';

      if (estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      begin
        //condition := ' isCN is null';
        AddCondition(condition, ' (dat.bal_sch = ''0221'')  ');
      end
      else
      // ��� ������ �������� - ������ ���. ����� ...
      //if DMReports.getElementTypeByPlan(planWork.code) = EN_WRITING_NO_OBJECT then
      if (elementTypeCode = EN_WRITING_NO_OBJECT) then
      begin
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_TMC then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'') ) ')
          else
          if planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS] then
          begin
               ///// 01.12.11
               if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then
                 AddCondition(condition, ' ( dat.bal_sch like ''07%'' ) ') // �������� ���������� ���
               else
                 AddCondition(condition, ' ( substr(dat.bal_sch,1,2) < ''10'' ) '); // �������� ���������� ���
               /////
          end
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA then
               AddCondition(condition, ' ( dat.bal_sch like ''11%'' ) ') // ���� �������� ���������  ����
          else
          if planWork.stateRef.code = ENPLANWORKSTATE_WRITINGS_OS then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''11'') )') // ���� �������� ���. ������� � 11 �����
          else
          if (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION) or
             (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) then
               AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''28'') ) ')
          else
          begin
            ShowMessage('Error ...');
            Exit;
          end;

      end



      else begin
        if planWork.stateRef.code = ENPLANWORKSTATE_RECEPT_TRANSMISSION then
          // 17.07.12 NET-2508
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') or dat.bal_sch = ''0316'' ) ')
        else
          AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''20'', ''22'') ) ');
      end;

      // ������� ������� � ������������ �� ��������/�������� ...
   try
     //estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
     estimateCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
   except
     on EConvertError do Exit;
   end;

   // ��� ���� �� ������������ �����������???
   if not chbIsIgnoreParty.Checked then
   begin
      if (estimateItemKind <> ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      begin
        if  partyCondition <> '' then
        begin
            AddCondition(condition, ' dat.party_id in ('+ partyCondition +')');
        end
        else
        if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then // ���� ��� ��� �������� ������� ������
          //*** 28.09.12 NET-3102
          // AddCondition( condition  , ' dat.rest_purpose_id = ' + IntToStr(REST_PURPOSE_ID_TRANZIT))
          AddCondition( condition  , ' dat.rest_purpose_type_id in( ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT) + ', ' +
                                                                        IntToStr(REST_PURPOSE_TYPE_ID_NET_OPERATIVE) + ', ' +
                                                                        IntToStr(REST_PURPOSE_TYPE_ID_OPERATIVE) + ')')
          //***
        else
          if not (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) then // 09.12.11 ���� ��� ����� ���� � � ��������, �� ����� ���������
            //*** 28.09.12 NET-3102
            // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
            AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
            //***
      end;
   end
   else
   begin
      //if (estimateItemKind <> ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
      //begin
        ///// 28.12.10
        // ��� ���� ������ ����� ������ �������� "���� �����", �� ������� ���� ����
        ///// *** 21.04.11 ������� ��� ����������� !!!
        // if (planWork.typeRef.code <> ENPLANWORKTYPE_CN) and ( estimateItemKind <> ENESTIMATEITEMKIND_GSM) then
        if estimateItemKind <> ENESTIMATEITEMKIND_GSM then
        /////
          ///// 15.02.11
          // ��� ���������� (���������) ���� ������ ����� ������ �������� "���� �����", �� ������� ���� ����
          if (elementTypeCode <> EN_METROLOGY_COUNTER) then
          /////
            if planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION then // ���� ��� ��� �������� ������� ������
              //*** 28.09.12 NET-3102
              // AddCondition( condition  , ' dat.rest_purpose_id = ' + IntToStr(REST_PURPOSE_ID_TRANZIT))
              AddCondition( condition  , ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT))
              //***
            else
              if not (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) then // 09.12.11 ���� ��� ����� ���� � � ��������, �� ����� ���������
                //*** 28.09.12 NET-3102
                // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_TRANZIT));
                AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
                //***
      //end;
   end;

   // ���������� ��� ��� Net. ����������� ����� (true - ����������)
   // showNetOperative := false;

    {
    if ((estimateItemKind <> ENESTIMATEITEMKIND_GSM) and (planWork.budgetRef.code <> ENBUDGET_ENERGOSBYT) and
           (elementTypeCode <> EN_WRITING_NO_OBJECT)
           and (planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION) ) or
    ((planWork.budgetRef.code = ENBUDGET_VPTU) and (elementTypeCode <> EN_SERVICES_OBJECT))
      then

      //*** 28.09.12 NET-3102
      // AddCondition( condition  , ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_NET_OPERATIVE));
      AddCondition( condition  , ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_NET_OPERATIVE));
      //***
    }

{********************************************************************************
/// 06.02.12 ���������� ���.����������� ����� ����� (���� ��� ���� �����) ;-)

   if (estimateItemKind = ENESTIMATEITEMKIND_GSM) or
      (planWork.budgetRef.code = ENBUDGET_ENERGOSBYT) or
      (elementTypeCode = EN_WRITING_NO_OBJECT) then
     showNetOperative := true;

   if (planWork.budgetRef.code = ENBUDGET_VPTU) and (elementTypeCode = EN_SERVICES_OBJECT) then
     showNetOperative := true;

   if (elementTypeCode = EN_SIT)  or (planWork.budgetRef.code = ENBUDGET_SIT) then
      showNetOperative := true;

   if (planWork.typeRef.code = ENPLANWORKTYPE_WRITEOFF_PROTECTION) then
     showNetOperative := false;

   if not showNetOperative then
     //*** 28.09.12 NET-3102
     // AddCondition(condition, ' dat.rest_purpose_id <> ' + IntToStr(REST_PURPOSE_ID_NET_OPERATIVE));
     AddCondition(condition, ' dat.rest_purpose_type_id <> ' + IntToStr(REST_PURPOSE_TYPE_ID_NET_OPERATIVE));
     //***
********************************************************************************}

////////////////////////////////////////////////////////////////////////////////
{ 26.12.12 ��� ����� � ������� ���������, �� ������ ����� �� ������������,
           ��� ��� ����� ���� ���� ����� ������

      // !!! ��� �������� ������� ������  ��������� �� ������������ � ������ ��� ���������� ������� ��������� � finmaterials � ������� � ������������
      if planWork.typeRef.code =  ENPLANWORKTYPE_WRITEOFF_PROTECTION then // ���� ��� ��� �������� ������� ������
      begin

        FINMaterialsList2 := TempFINMaterials.getFilteredPartyListWriteOff(estimateCode,molCode);

         rowNNFilterForWrite := '';
         for i2:=0 to High(FINMaterialsList2.list) do
         begin
           if rowNNFilterForWrite <> '' then
           rowNNFilterForWrite := rowNNFilterForWrite + ' , ' + '''' + FINMaterialsList2.list[i2].nn+''''
           else
           rowNNFilterForWrite := ''''+FINMaterialsList2.list[i2].nn+'''';

           if rowPartyFilterForWrite <> '' then
           rowPartyFilterForWrite := rowPartyFilterForWrite + ' , ' +  IntToStr(FINMaterialsList2.list[i2].party_id)
           else
           rowPartyFilterForWrite := IntToStr(FINMaterialsList2.list[i2].party_id);
         end;

         if rowNNFilterForWrite <> '' then
        // y AddCondition( condition  , ' dat.nn in (' + rowNNFilterForWrite + ')' ) ;

         if rowPartyFilterForWrite <> '' then
        // y AddCondition( condition  , ' dat.party_id in (' + rowPartyFilterForWrite + ')' ) ;


      end;

      // ���������� ���� ����� � ������������ ���� ��� �������� ������� ������
   if isWriteOffProtection then
   begin
     TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

      rqfqFilter := RQFKOrderFilter.Create;
    SetNullIntProps(rqfqFilter);
    SetNullXSProps(rqfqFilter);
    rqfqFilter.conditionSQL := ' RQFKORDER.code in ( Select r.code    ' +
                               ' From rqfkorderitem2enstmttm rei , rqfkorderitem ri ,  rqfkorder r   ' +
                               ' Where rei.estimateitemcode = ( select i2i.estimateiteminrefcode from enestimateitem2nstmttm i2i ' +
                               '                                    where i2i.estimateitemoutrefcode = ' + IntToStr(estimateCode) +
                               '                                                                         and  i2i.typerefcode = 6 ' +
                               '                                                                         limit 1 ) ' +
                               '  and rei.fkorderitemrefcode = ri.code ' +
                               '  and ri.fkorderrefcode = r.code ' +
                               '  and r.kindcode in (8,9) ' +
                               '  and r.statuscode = 3   limit 1  ) ';

    rqfqList := TempRQFKOrder.getScrollableFilteredList(rqfqFilter, 0, -1);
     if rqfqList.totalCount > 0 then
      // AddCondition( condition  , ' dat.wear_date = ' + 'to_date(' + ''''+  DateToStr ( EncodeDate(rqfqList.list[0].dateGen.Year,rqfqList.list[0].dateGen.Month,rqfqList.list[0].dateGen.Day) ) +'''' + ',' + '''' + 'dd.mm.yyyy' + ''''+')' )
     else
     // ����� ��������� ������ �� ����� �������� � ������ ������ � ������������ �
      // AddCondition( condition  , ' dat.wear_date is null ' ) ;

   end;
}
////////////////////////////////////////////////////////////////////////////////

   /////////////////////////////////////////////////////////////////////////////
   // 16.11.12 NET-3079
   if (estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS) then
   begin
     if (partyCondition = '-1') and (nnCondition <> '') then
     begin
       AddCondition(condition, ' dat.nn in ('+ nnCondition +')');
       AddCondition(condition, ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_TRANZIT));
     end;
   end;
   /////////////////////////////////////////////////////////////////////////////

   /////////////////////////////////////////////////////////////////////////////
   // 05.11.14 NET-4414 ��� ����������� ������ � ���� !!!
   // 15.11.14 ������� ��� ������� ���������
   if (estimateItemKind = ENESTIMATEITEMKIND_GSM) then
     AddCondition(condition, ' dat.rest_purpose_type_id = ' + IntToStr(REST_PURPOSE_TYPE_ID_FUELTANK));

   /////////////////////////////////////////////////////////////////////////////

      finFilter.conditionSQL := condition;

      finFilter.orderBySQL := ' dat.mat_name';




      dateRemains := TXSDate.Create;
      dateRemains.XSToNative(GetXSDate( StrToDate('31.01.3000') ));

      //finDocCode := actObj.finDocCode ;//low(Integer);
      //dateDoc := TXSDate.Create;
      //frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));
      //frmFINMaterialsDataShow.dateDoc := actObj.dateGen;


////// 01.02.13 NET-4061, �. 3 /////////////////////////////////////////////////
{
   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, // ��� ����� ���� ������� .. � ����������� �� ���� ��������� ...
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  workOrder.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );
}
   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  planCode,
                  finFilter,
                  balansNumberCondition,
                  // actObj.finMolCode,
                  molCode, // ��� ����� ���� ������� .. � ����������� �� ���� ��������� ...
                  materialCondition,
                  //actObj.dateGen,
                  //dateRemains,
                  workOrder.dateGen,
                  //* actObj.finDocCode
                  finDoc
                  );
////////////////////////////////////////////////////////////////////////////////

  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:=High(FINMaterialsList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list) do
      begin
        // Application.ProcessMessages;

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

        if (usesMDAXData) then
        begin
          Cells[9,i+1] := FINMaterialsList.list[i].ax_rest_purpose_id;
          Cells[10,i+1] := FINMaterialsList.list[i].ax_rest_purpose_typeid; // InventDimFinancial_UA.Dimanion[9]
          Cells[12,i+1] := FINMaterialsList.list[i].ax_frc_code;
          Cells[20,i+1] := FINMaterialsList.list[i].ax_party_id;
        end
        else
        begin
           if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
            Cells[9,i+1] := ''
            else
            Cells[9,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);

          if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
            Cells[10,i+1] := ''
            else
            Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);

          if FINMaterialsList.list[i].frc_code = Low(Integer) then
            Cells[12,i+1] := ''
          else
            Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);

          if FINMaterialsList.list[i].party_id = Low(Integer) then
            Cells[20,i+1] := ''
          else
            Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);

        end;

        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);

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

//        if FINMaterialsList.list[i].party_id = Low(Integer) then
//          Cells[20,i+1] := ''
//        else
//          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);

         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;

        if FINMaterialsList.list[i].wear_date = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := XSDate2String(FINMaterialsList.list[i].wear_date);

          Cells[25,i+1] := FINMaterialsList.list[i].axInventDimFinId;

        sgFINMaterials.RowCount:= i + 2;
      end;

   sgFINMaterials.Row:=1;
      end;
   //ColCount:=ColCount+1;
   //sgFINMaterials.Row:=1;


//end;




procedure TfrmFINMaterialsDataEdit.updateENFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  i, j{, estimateItemCode}: Integer;
  l: FINMaterialsShortList;
  f : FINMaterialsFilter;
  //balansNumberCondition, materialCondition : String;

begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

   for i:=1 to sgENFINMaterials.RowCount-1 do
     for j:=0 to sgENFINMaterials.ColCount-1 do
       sgENFINMaterials.Cells[j,i]:='';
   sgENFINMaterials.RowCount := 2;

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

   f.statusRef := FINMaterialsStatusRef.Create;
   f.statusRef.code := FINMATERIALSSTATUS_GOOD;

   l := TempFINMaterials.getScrollableFilteredList(f,0,-1);

  if High(l.list) > -1 then
     sgENFINMaterials.RowCount:=High(l.list)+2
  else
     sgENFINMaterials.RowCount:=2;

  boundedFinmaterialsCount := 0;

   with sgENFINMaterials do
    for i:=0 to High(l.list) do
      begin
        //Application.ProcessMessages;

        if l.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(l.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := l.list[i].nn;
        Cells[2,i+1] := l.list[i].mat_name;
        Cells[3,i+1] := l.list[i].mu_name;

        if l.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          begin
            Cells[4,i+1] := l.list[i].quantity.DecimalString;
            //boundedFinmaterialsCount :=  boundedFinmaterialsCount + StrToFloat(l.list[i].quantity.DecimalString);
            boundedFinmaterialsCount :=  boundedFinmaterialsCount + DMReports.getFINMaterialConvertedQuantity(l.list[i]);
          end;




        Cells[5,i+1] := l.list[i].div_name;
        Cells[6,i+1] := l.list[i].rest_purpose_name;

        Cells[7,i+1] := l.list[i].partner_name;
        if l.list[i].doc_date = nil then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := XSDate2String(l.list[i].doc_date);
        Cells[9,i+1] := l.list[i].party_discription;
        if l.list[i].party_id <> LOW_INT then
          Cells[10,i+1] := IntToStr(l.list[i].party_id)
        else
          Cells[10,i+1] := '';

        //Cells[15,i+1] := l.list[i].div_name;

 {       Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;
        Cells[4,i+1] := FINMaterialsList.list[i].div_name;
        Cells[5,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
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
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
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
          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);

         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;
 }
        sgENFINMaterials.RowCount:= i + 2;
      end;

   sgENFINMaterials.Row:=1;
end;



procedure TfrmFINMaterialsDataEdit.FormShow(Sender: TObject);
var
  //TempFINMaterials: FINMaterialsControllerSoapPort;
  //_FINMaterialsList: FINMaterialsShortList;
  //finMaterialFilter : FINMaterialsFilter;
  //_finMat : FINMaterials;
  //actObj : ENAct;

  //frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  //f : FINMaterialsFilter;
  //m , finObj: FINMaterials ;

//  TempFINMaterials_: FINMaterialsControllerSoapPort;

 //TempSpr_matherial: TKMaterialsControllerSoapPort;
 //Spr_matherialFilterObj : TKMaterialsFilter;
 //Spr_matherialList : TKMaterialsShortList;

 element: ENElement;

 s_ : string;
 //TempENEstimateItem: ENEstimateItemControllerSoapPort;
 //TempTKMaterials: TKMaterialsControllerSoapPort;
begin
  lblCFO.Caption := '';

  DisableControls([edtFINMol, edtFINDate, {spbFINMol,} edtPlanWork]);

  DisableControls([spbPlanWork, cbEstimateItemKind], (planCodes = ''));
  HideControls([lblPlanWork, edtPlanWork, spbPlanWork, cbEstimateItemKind], (planCodes = ''));
  if planCodes = '' then
  begin
    // ��� �������
    if lblFINDate.Left > 50 then
    begin
        //lblFINMol.Left := lblFINMol.Left - 340;
        //edtFINMol.Left := edtFINMol.Left - 340;
        //spbFINMol.Left := spbFINMol.Left - 340;
        lblFINDate.Left := lblFINDate.Left - 600;
        edtFINDate.Left := edtFINDate.Left - 600;
    end;
  end;


  if planCodes = '' then
  begin
    // ���� ���� ����� � � ���� ���� ... ������ ������ .....
    if planCode = LOW_INT then
    begin
      ShowMessage('���� �� ������ ..');
      Close;
      Exit;
    end;

    planWork := DMReports.getPlanByCode(planCode);
    if planWork = nil then
    begin
      ShowMessage('���� �� ������ .. ���=' + IntToStr(planCode));
      Close;
      Exit;
    end;
  end;

  ///// 28.12.10
  ///// *** 21.04.11 ������� ��� ����������� !!!
  // if planWork.typeRef.code = ENPLANWORKTYPE_CN then
  //  chbIsIgnoreParty.Caption := '���� ����� (������� � ���������� ��� ����� ��''���� !!!)';
  /////

  ///// 15.02.11
  element := DMReports.getElementByCode(planWork.elementRef.code);
  elementTypeCode := element.typeRef.code;
  if elementTypeCode = EN_METROLOGY_COUNTER then
    chbIsIgnoreParty.Caption := '���� ����� (������� � ���������� ��� ����� ��''���� !!!)';
  /////


{ **
actObj := DMReports.getActByPlan(planCode);
if actObj.code = LOW_INT then
begin
  Application.MessageBox(PChar('�������� ���! ������ �� ����������� !!!'), PChar('��������!'), MB_ICONWARNING);
  ModalResult := mrCancel;
  //self.Close;
  //btnCancel.Click;

  Exit;

 //Abort;
end;
}

{
workOrder := DMReports.getWorkOrderByPlanCode(planCode);
if workOrder.code = LOW_INT then
begin
  Application.MessageBox(PChar('������� ����� ! ������ �� ���������� !!!'), PChar('��������!'), MB_ICONWARNING);
  ModalResult := mrCancel;
  //self.Close;
  //btnCancel.Click;

  Close;

  Exit;

 //Abort;
end;
}

// �������� �������� !!
// + ��������� ���� ���� �������� -��� ...
{*****
 TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
 estimateObj := TempENEstimateItem.getObject( estimateCode );

if estimateObj = nil then
begin
  ShowMessage('nefig ... estimateObj �� ������ ..');
  Close;
  exit;
end;
*****}

  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);

  if workOrder = nil then
  begin
    Application.MessageBox(PChar('�������� ���� ��� �������� ����������!'), PChar('��������!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('�������� ���� ��� �������� ����������!'), PChar('��������!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if molData = nil then
  begin
    Application.MessageBox(PChar('�������� ����� ��� �������� ����������!'), PChar('��������!'), MB_ICONWARNING);
    //edtPlanWork.SetFocus;
    Exit;
  end;

  //estimateItemKind := ENESTIMATEITEMKIND_MATERIALS;

  // �� ���� ����� �������� ... ���  ����� ��������� ���������� !!!
  if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;

    ///// 05.12.11
    { *****
    if  isWriteOffProtection then
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_332).finDocCode // ������� � 33�
    else
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // ������� � 30�
    ***** }
    if (planWork.stateRef.code in [ENPLANWORKSTATE_MATERIALS_MBP, ENPLANWORKSTATE_MATERIALS_MBP_INSTRUMENTS]) or
       (planWork.stateRef.code = ENPLANWORKSTATE_MATERIALS_MNMA) then
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_332).finDocCode // ������� � 33�
    else
    if (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_REALIZATION) or
       (planWork.stateRef.code = ENPLANWORKSTATE_BUFET_NONEREALIZATION) then
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_292).finDocCode // ������� � 33� 
    else
      finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // ������� � 30�
    /////
  end
  else
  if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // ������� � 30�
  end
  else
  if estimateItemKind = ENESTIMATEITEMKIND_GSM then
  begin
    edtFINMol.Text := molData.finMolName; //workOrder.finMolName;
    molCode := molData.finMolCode; //workOrder.finMolCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode2(molData, FINDOCTYPE_302).finDocCode; // ������� � 30�

  { ����� �� ��� � ������ ...

    edtFINMol.Text := workOrder.finMechanicName;
    molCode := workOrder.finMechanicCode;
    finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
    }
  end
  else
  begin
      ShowMessage('����������� ��������!');
      edtFINMol.Text := '���������� ...';
      molCode := '-100001';
  end;


  if finDoc = LOW_INT then
  begin
    s_ := '����������� ���� ' + molData.finMolName + ' � ����� ... ';
    Application.MessageBox(PChar(s_), PChar('�����!'), MB_ICONWARNING);
    Exit;
  end;
{*****
if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS then
begin
  edtFINMol.Text := workOrder.finMolName;
  molCode := workOrder.finMolCode;
  finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMOLCode; // ������� � 30�
end
else
if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_GSM then
begin
  edtFINMol.Text := workOrder.finMechanicName;
  molCode := workOrder.finMechanicCode;
  finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
end
else
begin
    ShowMessage('neponytniy material :)');
    edtFINMol.Text := 'Neponytno ...';
    molCode := '-100001';
end;

lblENEstimateItemComment.Caption := estimateObj.commentGen ;
*****}

if workOrder.dateGen <> nil then
begin
  edtFINDate.DateTime := EncodeDate(workOrder.dateGen.Year,workOrder.dateGen.Month,workOrder.dateGen.Day);
  edtFINDate.Checked := true;
end
else
begin
  edtFINDate.DateTime := SysUtils.Date;
  edtFINDate.Checked := false;
end;


{*****
TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

if materialObj = nil then
begin
  ShowMessage('... materialObj �� ������ ..');
  Close;
  exit;
end;

edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
//edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
lblMeasurementUnit.Caption := materialObj.measurement.name;
*****}

//SetGridHeaders(FINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
SetGridHeaders(ENFINMaterialsHeaders, sgENFINMaterials.ColumnHeaders);
SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);

UpdateEstimateItems(planCode, estimateItemKind);

updateENFINMaterialsGrid;
//updateENPlanWorkItemGrid;

updateFINMaterialsGrid;



EXIT ; ///!!!!





end;



procedure TfrmFINMaterialsDataEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempFINMaterials: FINMaterialsControllerSoapPort;
begin
  if Assigned(workOrder) then
    workOrder.Free;
  workOrder := nil;
end;


procedure TfrmFINMaterialsDataEdit.spbFINMolClick(Sender: TObject);
var
{
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  plan : ENPlanWork;
  molSel : boolean;
}
  i : Integer;
  f : FINMOLDataFilter;
  TempFINMolData: FINMolDataControllerSoapPort;
  //FINMolDataList: FINMolDataShortList;
  frm : TfrmFINMolDataShow;
begin

   f := FINMOLDataFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.molTypeRef := FINMolTypeRef.Create;
   f.molTypeRef.code := molData.molTypeRef.code;
   f.workOrder := ENWorkOrder.Create;
   f.workOrder.code := workOrder.code;
   //f.conditionSQL := 'finmoldata.code in (select FINDOC2MOLDATA.MOLDATACODE from FINDOC2MOLDATA where FINDOC2MOLDATA.WORKORDERCODE = '+ IntToStr(workOrder.code)+')';

   frm :=  TfrmFINMolDataShow.Create(Application, fmNormal, f);

   try
      frm.DisableActions([frm.actInsert, frm.actDelete, frm.actEdit, frm.actFilter, frm.actNoFilter]);
      if frm.ShowModal = mrOK then
      begin

            try
              i := StrToInt(frm.GetReturnValue(frm.sgFINMolData, 0));
            except
               on EConvertError do Exit;
            end;
            //TTPRIOFINDoc2MolData as FINDoc2MolDataControllerSoapPort;
            TempFINMolData := HTTPRIOFINMolData as FINMolDataControllerSoapPort;
            molData := TempFINMolData.getObject(i);
            //edtFINMol.Text:= molData.finMolName; //ENDepartmentShort(tvDep.Selected.Data).shortName;
            //molCode := molData.finMolCode;
            FormShow(Sender);
      end;
   finally
      frm.Free;
   end;

//showMessage('������� ������������� ... 11-73');
{
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // ���� ������ ���������� ...

      // ���� � ����
      plan := DMReports.getPlanByCode(planCode);
      TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
      renFilter := ENDepartment2EPRenFilter.Create;
      SetNullXSProps(renFilter);
      SetNullIntProps(renFilter);
      renFilter.renRef := EPRenRef.Create;
      renFilter.renRef.code := plan.renRef.code;
      renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
      if renList.totalCount > 0 then
        f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);
   try
      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtFINMol.Text:= GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               molCode := GetReturnValue(sgFINMol,0);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
 {

 if not Assigned(frmFINMolShow) then
    frmFINMolShow := TfrmFINMolShow.Create(Application,fmChild,f);
 frmFINMolShow.Show;
 }

end;

procedure TfrmFINMaterialsDataEdit.spbFINMaterialClick(Sender: TObject);
//var
  //frmFINMaterialsDataShow : TfrmFINMaterialsDataShow;
  //f : FINMaterialsFilter;
  //m : FINMaterials ;
  //TempFINMaterials: FINMaterialsControllerSoapPort;
begin

{

   frmFINMaterialsDataShow:= TfrmFINMaterialsDataShow.Create(Application,fmNormal);
   try
      //FINMaterialsO
      frmFINMaterialsDataShow.balansNumberCondition := ''; //and rpsc.bal_sch in ("+ balansNumberCondition +")
      frmFINMaterialsDataShow.molCode := molCode;
      frmFINMaterialsDataShow.materialCondition := '';  // and rst.mat_id in ("+ materialCondition +")
      frmFINMaterialsDataShow.finDocCode := low(Integer);
      frmFINMaterialsDataShow.dateDoc := TXSDate.Create;
      frmFINMaterialsDataShow.dateDoc.XSToNative(GetXSDate(Date));


      with frmFINMaterialsDataShow do
        if ShowModal = mrOk then
        begin
            try
               //if ENWorkerObj.manningTable = nil then ENWorkerObj.manningTable := ENManningTable.Create();
               //ENWorkerObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               //edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
               {
               m := FINMaterials.Create;
               SetNullIntProps(m);
               SetNullXSProps(m);
               m.estimateItemRef := ENEstimateItemRef.Create;
               m.estimateItemRef.code := ENEstimateItemObj.code;

               m.mat_id :=  StrToInt(GetReturnValue(sgFINMaterials,0));
               m.nn := GetReturnValue(sgFINMaterials,3);

               TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
               TempFINMaterials.add(m);
               }
{            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINMaterialsDataShow.Free;
   end;
}
end;

procedure TfrmFINMaterialsDataEdit.sgFINMaterialsDblClick(Sender: TObject);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  m : FINMaterials;
  counnt, temp2 : real;
  rezervedCountForEst : Double;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempTKMaterials: TKMaterialsControllerSoapPort;
  fm : FINMaterialsFilter;
  fl: FINMaterialsShortList;
  im : Integer;
  estimateObj:ENEstimateItem;
  planObj:ENPlanWork;
  TempENPlanWork : ENPlanWorkControllerSoapPort;
  extraCargo:TXSDecimal;
begin
  if workOrder = nil then
  begin
    Application.MessageBox(PChar('�������� ���� ��� �������� ����������!'), PChar('��������!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  if workOrder.code = LOW_INT then
  begin
    Application.MessageBox(PChar('�������� ���� ��� �������� ����������!'), PChar('��������!'), MB_ICONWARNING);
    edtPlanWork.SetFocus;
    Exit;
  end;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  temp2 := 0;
  try
    temp2 := StrToFloat(sgENEstimateItem.Cells[3, sgENEstimateItem.Row]);
  except
    on EConvertError do Exit;
  end;

  if temp2 < 0.00000001 then
  begin
    Application.MessageBox(PChar('���-�� ���������� = 0... ��������������� ���-�� ���������� � ������!'), PChar('��������!'), MB_ICONWARNING);
    Exit;
  end;

  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  estimateObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));

  TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
  planObj := TempENPlanWork.getObject(estimateObj.planRef.code);

  frmFINMaterialCountEdit.kindCode:=planObj.stateRef.code;

  if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION)
  then begin
   extraCargo:=TXSDecimal.Create;
   extraCargo:= TempFINMaterials.getExtraCargo(sgFINMaterials.Cells[1,sgFINMaterials.Row]);

   if  extraCargo<>nil  then    frmFINMaterialCountEdit.edtExtraCargo.Text:=extraCargo.decimalString;

   HideControls([frmFINMaterialCountEdit.lblPrice, frmFINMaterialCountEdit.edtExtraCargo],false);
  end
  else
  HideControls([frmFINMaterialCountEdit.lblPrice, frmFINMaterialCountEdit.edtExtraCargo],true);

  try

    try
      frmFINMaterialCountEdit.tkMaterialName := sgENEstimateItem.Cells[1,sgENEstimateItem.Row];
      frmFINMaterialCountEdit.materialName := sgFINMaterials.Cells[2,sgFINMaterials.Row];
      frmFINMaterialCountEdit.measurementName := sgFINMaterials.Cells[3,sgFINMaterials.Row];
      frmFINMaterialCountEdit.tkMeasurementName := sgENEstimateItem.Cells[4, sgENEstimateItem.Row];
      frmFINMaterialCountEdit.nn := sgFINMaterials.Cells[1,sgFINMaterials.Row];
      frmFINMaterialCountEdit.availableCount := StrToFloat(sgFINMaterials.Cells[4,sgFINMaterials.Row]);
      frmFINMaterialCountEdit.currentCount := StrToFloat(sgENEstimateItem.Cells[3,sgENEstimateItem.Row]);
      frmFINMaterialCountEdit.boundedCount := boundedFinmaterialsCount;

      frmFINMaterialCountEdit.planItemName := '';////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                           //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];
    except
      on EConvertError do Exit;
    end;

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin
     // !!! ��� �������� ������� ������  ���� ���-�� �������������� ���-�� �� ��������� � ����������� ������������ �� ���������
      if planWork.typeRef.code =  ENPLANWORKTYPE_WRITEOFF_PROTECTION then // ���� ��� ��� �������� ������� ������
      begin
          //TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
        // ������� ���������� ������������ ���������
         fm := FINMaterialsFilter.Create;
           SetNullXSProps(fm);
           SetNullIntProps(fm);

           fm.estimateItemRef := ENEstimateItemRef.Create;
           fm.estimateItemRef.code := estimateCode; //estimateItemCode; //estimateObj.code;

           fm.statusRef := FINMaterialsStatusRef.Create;
           fm.statusRef.code := FINMATERIALSSTATUS_GOOD;

           fl := TempFINMaterials.getScrollableFilteredList(fm,0,-1);
           rezervedCountForEst := 0;
            for im:=0 to High(fl.list) do
            begin
              //rezervedCountForEst:= rezervedCountForEst  + strTofloat( fl.list[im].quantity.DecimalString);
              rezervedCountForEst:= rezervedCountForEst + DMReports.getFINMaterialConvertedQuantity(fl.list[im]);
            end;

          if temp2 < frmFINMaterialCountEdit.enteredCount + rezervedCountForEst then
          begin
            Application.MessageBox(PChar('��������� ����������� ���-�� ���������� �� ������ ��� �� �����!'), PChar('��������!'), MB_ICONWARNING);
            Exit;
          end;

      end;



  // ���������� ���� ;)
  // ����� ���-�� � ��

  // �������� ������ � ���-�� � �������� ...

        ////////////////////////////////////////////////////////////////////////////////
        // �������� �������� !!
        // + ��������� ���� ���� �������� -��� ...
         TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
         estimateObj := TempENEstimateItem.getObject( estimateCode );

        if estimateObj = nil then
        begin
          ShowMessage('estimateObj �� ������ ..');
          Close;
          exit;
        end;

        {
        if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_MATERIALS then
        begin
          edtFINMol.Text := workOrder.finMolName;
          molCode := workOrder.finMolCode;
          finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMOLCode; // ������� � 30�
        end
        else
        if  estimateObj.kindRef.code = ENESTIMATEITEMKIND_GSM then
        begin
          edtFINMol.Text := workOrder.finMechanicName;
          molCode := workOrder.finMechanicCode;
          finDoc := DMReports.getFINDocCodeByWorkOrderCode(workOrder.code, 1).finDocMechanicCode;
        end
        else
        begin
            ShowMessage('neponytniy material :)');
            edtFINMol.Text := 'Neponytno ...';
            molCode := '-100001';
        end;
        }

        lblENEstimateItemComment.Caption := estimateObj.commentGen ;

        TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
        materialObj := TempTKMaterials.getObject( estimateObj.materialRef.code );

        if materialObj = nil then
        begin
          ShowMessage('... materialObj �� ������ ..');
          Close;
          exit;
        end;

        edtTKMaterial.Text := materialObj.name ; //+ ' ('+ materialObj.measurement.name+')';
        //edtTKCount.Text := estimateObj.countFact.DecimalString + ' estimateObj.countFact'; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
        edtTKCount.Text := estimateObj.countFact.DecimalString ; // estimateObj.countGEN?? ������ ��� ���� ... � ����� ��� ...
        lblMeasurementUnit.Caption := materialObj.measurement.name;
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

               if(DMReports.getMDAXDataValue(ENConsts.CONFIG_USES_MDAX_INVENTORYONHAND) = '1' ) then
                begin
                 m.rest_purpose_id := LOW_INT ;
                 m.ax_rest_purpose_id := sgFINMaterials.Cells[9, sgFINMaterials.Row] ;
                 m.ax_rest_purpose_typeid := sgFINMaterials.Cells[10, sgFINMaterials.Row];
                 m.rest_purpose_type_id := LOW_INT;
                 m.budget_core_id := LOW_INT; // �������� ������ �����
                 m.ax_frc_code := sgFINMaterials.Cells[12, sgFINMaterials.Row];
                 m.mat_id := LOW_INT; // c AX ���� mat_id
                 m.ax_party_id := sgFINMaterials.Cells[20, sgFINMaterials.Row];
                end
               else
                begin
                 m.ax_rest_purpose_id := '' ;
                 m.rest_purpose_id := StrToInt( sgFINMaterials.Cells[9, sgFINMaterials.Row] );
                 m.ax_rest_purpose_typeid := '';
                 m.rest_purpose_type_id := StrToInt(sgFINMaterials.Cells[10, sgFINMaterials.Row]);
                 m.budget_core_id := StrToInt(sgFINMaterials.Cells[11, sgFINMaterials.Row]);
                 m.frc_code := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
                 m.mat_id := StrToInt(sgFINMaterials.Cells[19, sgFINMaterials.Row]);
                 m.party_id := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);
                end;

               //madax m.rest_purpose_id := StrToInt( sgFINMaterials.Cells[9, sgFINMaterials.Row] );
               //m.rest_purpose_name := sgFINMaterials.Cells[9, sgFINMaterials.Row];
               //madax m.rest_purpose_type_id := StrToInt(sgFINMaterials.Cells[10, sgFINMaterials.Row]);
               //madax m.budget_core_id := StrToInt(sgFINMaterials.Cells[11, sgFINMaterials.Row]);
               //madax m.frc_code := StrToInt(sgFINMaterials.Cells[12, sgFINMaterials.Row]);
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
               //madax m.mat_id := StrToInt(sgFINMaterials.Cells[19, sgFINMaterials.Row]);
               //madax m.party_id := StrToInt(sgFINMaterials.Cells[20, sgFINMaterials.Row]);

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

               if  sgFINMaterials.Cells[24, sgFINMaterials.Row] <> '' then
               begin
                 m.wear_date := TXSDate.Create;
                 m.wear_date.XSToNative(GetXSDate( StrToDate(sgFINMaterials.Cells[24, sgFINMaterials.Row])));
               end
               else
                 m.wear_date := nil;

               // �������� � ����� ...
               m.molDataRef := FINMolDataRef.Create;
               m.molDataRef.code := molData.code;

              m.axInventDimFinId := sgFINMaterials.Cells[25, sgFINMaterials.Row];  // ��� ��� ��������� AX


       if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION)  then
       begin
          m.extra_cargo:=TXSDecimal.Create;
          m.cost_ext:=TXSDecimal.Create;
          m.extra_cargo.DecimalString:=frmFINMaterialCountEdit.edtExtraCargo.Text;
          m.cost_ext.DecimalString:=FloatToStr(StrToFloat(frmFINMaterialCountEdit.edtExtraCargo.Text)*frmFINMaterialCountEdit.enteredCount);
       end;
{


        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

        }

        TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

         //�������� ���� ���������� - �����

       if  (planObj.stateRef.code=ENPLANWORKSTATE_BUFET_REALIZATION) then
       begin
         extraCargo.DecimalString:= frmFINMaterialCountEdit.edtExtraCargo.Text;
         TempFINMaterials.setExtraCargo(sgFINMaterials.Cells[1,sgFINMaterials.Row],extraCargo);
       end;

        if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
           TempFINMaterials.addMaterials(m)
        else
        if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
           TempFINMaterials.addMaterials(m)
        else
        if  estimateItemKind = ENESTIMATEITEMKIND_GSM then
           TempFINMaterials.addGsm(m)
        else
        begin
            ShowMessage('Error in estimate Kind');
            exit;
        end;
    end;

    UpdateEstimateItems(planCode, estimateItemKind);
    // ����� ���� ��������� ����� ������ ������ ....
    updateFINMaterialsGrid;
    updateENFINMaterialsGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmFINMaterialsDataEdit.actDeleteExecute(Sender: TObject);
Var TempFINMaterials: FINMaterialsControllerSoapPort;
  ObjCode: Integer;
begin
 TempFINMaterials := HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFINMaterials.Cells[0,sgENFINMaterials.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('�� ������������� ������ �������� ����"���� � ���������� (�������� � ���.���.) ?'),
                    PChar('�������� !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      //TempFINMaterials.remove(ObjCode);
        if estimateItemKind = ENESTIMATEITEMKIND_MATERIALS then
           TempFINMaterials.removeMaterials(ObjCode)
        else
        if estimateItemKind = ENESTIMATEITEMKIND_CUSTOMER_MATERIALS then
           TempFINMaterials.removeMaterials(ObjCode)
        else
        if  estimateItemKind = ENESTIMATEITEMKIND_GSM then
           TempFINMaterials.removeGSM(ObjCode)
        else
        begin
            ShowMessage('Error in estimate Kind');
            exit;
        end;

      //UpdateGrid(Sender);
      updateFINMaterialsGrid;
      updateENFINMaterialsGrid;
  end;
end;

procedure TfrmFINMaterialsDataEdit.actEditExecute(Sender: TObject);
var
  ObjCode : Integer;
  TempFINMaterials: FINMaterialsControllerSoapPort;
  m : FINMaterials;
begin
  EXIT; // �������������� �������!!!

   try
     ObjCode := StrToInt(sgENFINMaterials.Cells[0,sgENFINMaterials.Row]);
   except
   on EConvertError do Exit;
   end;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
  m := TempFINMaterials.getObject(ObjCode);



  frmFINMaterialCountEdit := TfrmFINMaterialCountEdit.Create(Application, dsEdit);

  try

    frmFINMaterialCountEdit.materialName := m.mat_name ; //sgFINMaterials.Cells[2,sgFINMaterials.Row];
    frmFINMaterialCountEdit.measurementName := m.mu_name; //sgFINMaterials.Cells[3,sgFINMaterials.Row];
    frmFINMaterialCountEdit.availableCount := StrToFloat(m.quantity.DecimalString); //StrToFLoat(sgFINMaterials.Cells[15,sgFINMaterials.Row]);

    frmFINMaterialCountEdit.planItemName := ''; ////sgENPlanWorkItem.Cells[1, sgENPlanWorkItem.Row] + '  ' +
                                         //sgENPlanWorkItem.Cells[2, sgENPlanWorkItem.Row];

    if frmFINMaterialCountEdit.ShowModal = mrOK then
    begin

        //TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
        m.quantity.DecimalString := FloatToStr(frmFINMaterialCountEdit.enteredCount); // �������� ���-�� ..
        //TempFINMaterials.add(m);
        TempFINMaterials.save(m);
    end;
    // ����� ���� ��������� ����� ������ ������ ....
    updateFINMaterialsGrid;
    updateENFINMaterialsGrid;

  finally
    frmFINMaterialCountEdit.Free;
  end;

end;

procedure TfrmFINMaterialsDataEdit.btnFindClick(Sender: TObject);
begin
  inherited;
  updateFINMaterialsGrid;
  sgFINMaterialsClick(Sender);
end;

procedure TfrmFINMaterialsDataEdit.edtNomenclatureKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    btnFindClick(Sender);
end;

procedure TfrmFINMaterialsDataEdit.actUpdateExecute(Sender: TObject);
begin

  updateENFINMaterialsGrid;
  updateFINMaterialsGrid;

end;

procedure TfrmFINMaterialsDataEdit.UpdateEstimateItems(planCode,
  estimateItemKind: Integer);
var
  i, eiColCount, eiLastCount, eiLastRow, rowToSelect: Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;
  estimateItemFilter: ENEstimateItemFilter;
  sql : string;
begin
  //estimateItemKind := ENESTIMATEITEMKIND_MATERIALS; //*** TEMP !!!

  /////
  {
  for i := 1 to sgENEstimateItem.RowCount - 1 do
    for j := 0 to sgENEstimateItem.ColCount - 1 do
      sgENEstimateItem.Cells[j, i] := '';

    sgENEstimateItem.RowCount := 2;
  }

  ClearGrid(sgENEstimateItem);

  sql := '';

  /////

  //SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  eiColCount := -1;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  //if estimateItemFilter = nil then
  //begin
     estimateItemFilter := ENEstimateItemFilter.Create;
     SetNullIntProps(estimateItemFilter);
     SetNullXSProps(estimateItemFilter);
  //end;

  if trEstimateCodes = '' then
  begin
    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := planCode;
  end
  else
  begin
    // ���� �������� ����� �� ������. ����� ...
    AddCondition(sql, ' code in (' + trEstimateCodes + ') ');
  end;


  //estimateItemFilter.conditionSQL := 'enestimateitem.kindrefcode in (1,2)';
  if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
  estimateItemFilter.kindRef.code := estimateItemKind;

  // ���� �� ������ �� � �������� ... ��� ������� �� ������ ���� ...
  if estimateItemFilter.accountingTypeRef = nil then estimateItemFilter.accountingTypeRef := TKAccountingTypeRef.Create();
  estimateItemFilter.accountingTypeRef.code := TK_ACCOUNTINGTYPE_TMC;

  // ���������� ����� ���� ��� �� ������� ..
  //if not cbShowAll.Checked then
  //begin
  AddCondition(sql, ' ENESTIMATEITEM.COUNTFACT <> 0 ');
  //end;


  estimateItemFilter.conditionSQL := sql;
  ////
  estimateItemFilter.orderBySQL := 'KR.TECHKARTNUMBER, SM.NAME, ENESTIMATEITEMTYPE.CODE';
  ////

  ///
  //pnlLegend.Visible := (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]);
  ///

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

  eiLastCount := High(ENEstimateItemList.list);

  if eiLastCount > -1 then
    sgENEstimateItem.RowCount := eiLastCount + 2
  else
    sgENEstimateItem.RowCount := 2;

  eiLastRow := 1;
  rowToSelect := 1;

   with sgENEstimateItem do
     for i := 0 to eiLastCount do
     begin
       //Application.ProcessMessages;  // ���-�� ��� ��������������... 

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       if ENEstimateItemList.list[i].code = estimateCode then
         rowToSelect := i + 1;

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       if ENEstimateItemList.list[i].countGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

       if ENEstimateItemList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

       Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

       Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
       Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

       Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

       Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

       if ENEstimateItemList.list[i].dateEdit = nil then
         Cells[9,i+1] := ''
       else
         Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);

       {
       if (ENPlanWorkObj.kind.code in [ENPLANWORKKIND_NPZ, ENPLANWORKKIND_FACT]) then
       begin
         // ���� � ������������ ��������� ��������� ��������� �� ��, �������� ������ ������
         if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
         begin
           RowColor[i+1] := Shape1.Brush.Color; //$0080FF80; //$EBFFF5
           Objects[1,i+1] := TObject(1); // ������� (�����������)
         end
         else begin
           RowColor[i+1] := clWindow;
           Objects[1,i+1] := TObject(0);
         end;
         //else
         //  RowColor[i+1] := clYellow;
       end
       else begin
         RowColor[i+1] := clWindow;

         // �������� ������ ������ ����
         if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
           RowColor[i+1] := clMoneyGreen; //$EBFFF5

         // �������� ������ ������, ����������� �� ���� �����
         if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
           RowColor[i+1] := clYellow;
       end;
       }

       /////
       if ENEstimateItemList.list[i].countFINMaterials > 0 then
       //if checkMaterialsBinding(ENEstimateItemList.list[i].code) then
       begin
         RowColor[i+1] := $0080FF80; //$EBFFF5
         Objects[1,i+1] := TObject(1); // ������� (�����������)
       end
       else begin
         RowColor[i+1] := clWindow;
         Objects[1,i+1] := TObject(0);
       end;
       /////

       Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

       eiLastRow := i + 1;
       sgENEstimateItem.RowCount := eiLastRow + 1;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   eiColCount := eiColCount + 1;

   if sgENEstimateItem.Row = rowToSelect then
     sgENEstimateItemClick(sgENEstimateItem) // ���� ������� ������ ������, ��������� ���� � ������������ �-����
   else
     // ����� �� ��������� ��� (������� OnClick, ���� �� �����, ����������� ��� ��������� ������� ������ �����)
     sgENEstimateItem.Row := rowToSelect; //1;

{
   // ������� ������ ��� ���������� .... ���� ��� ���� ����� ...
   // � ������ ��� ��� � �����
   if ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_NPZ) or ( ENPlanWorkObj.kind.code = ENPLANWORKKIND_FACT) then
   begin

      try
        j := StrToInt( sgENEstimateItem.Cells[0, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));
      except
        on EConvertError do Exit;
      end;
      gbFINMaterials.Visible := true;
      //sgENEstimateItem.Align := alClient;
      updateFINMaterialsGrid(j, sgFINMaterials);
  end
  else
  begin
     gbFINMaterials.Visible := false;
     Panel1.Align := alClient;
  end;
}  
end;

procedure TfrmFINMaterialsDataEdit.sgENEstimateItemClick(Sender: TObject);
var
  i, eObjCode  : Integer;
  finFilter2 : FINMaterialsFilter;
  fmList : FINMaterialsShortList;
  TempFINMaterials : FINMaterialsControllerSoapPort;
  oldParty : String;
begin
  updateENFINMaterialsGrid;

   try
     eObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
   except
   on EConvertError do Exit;
   end;

   parentEstimateCode := DMReports.getParentEstimateFromCurrentPlan(eObjCode).code;

   oldParty := partyCondition;

   partyCondition := '';

   nnCondition := '';

   //currentEstimate := DMReports.getParentEstimateFromCurrentPlan(estimateCode);
   if ( parentEstimateCode > LOW_INT) then
   begin
      TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;   
      finFilter2 := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter2);
      SetNullXSProps(finFilter2);
      finFilter2.statusRef := FINMaterialsStatusRef.Create;
      finFilter2.statusRef.code := FINMATERIALSSTATUS_GOOD;
      finFilter2.estimateItemRef := ENEstimateItemRef.Create;
      finFilter2.estimateItemRef.code :=  parentEstimateCode;
      fmList := TempFINMaterials.getScrollableFilteredList(finFilter2, 0, -1);
      for i:=0 to fmList.totalCount - 1 do
      begin
         AddListPos(partyCondition, IntToStr( fmList.list[i].party_id) );
         AddListPos(nnCondition, '''' + fmList.list[i].nn + '''');
      end;


   if (partyCondition <> '') or ( oldParty <> '' ) then
   begin
      btnFindClick(Sender);
   end;
{
   else
   begin
     for i:=1 to sgFINMaterials.RowCount-1 do
       for j:=0 to sgFINMaterials.ColCount-1 do
         sgFINMaterials.Cells[j,i]:='';
     sgFINMaterials.RowCount := 2;
   end;
}
  end;

  updateFINMaterialsGrid;

end;

procedure TfrmFINMaterialsDataEdit.FormCreate(Sender: TObject);
begin
  boundedFinmaterialsCount := 0;
  planCodes := '';
  planCode := LOW_INT;
  estimateItemKind := LOW_INT;

  parentEstimateCode := LOW_INT;
  partyCondition := '';

  /////
  // 16.11.12 NET-3079 ��� ����� �� ������� � �������������� �-��� ���������
  // ����� ������������ ����� �������� ������ ���� ��������������, �-���
  // ���� ��������� � ���������� ��������� �� �������� �����
  nnCondition := '';
  /////
  
  trEstimateCodes := '';
  elementTypeCode := LOW_INT;
end;

procedure TfrmFINMaterialsDataEdit.spbPlanWorkClick(Sender: TObject);
var planFilter: ENPlanWorkFilter;
    frmENPlanWorkShow: TfrmENPlanWorkShow;
    oldPlanCode: Integer;
    oldPlanName: String;
begin
  if planCodes = '' then Exit;

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);

  planFilter.conditionSQL := 'enplanwork.statuscode = ' + IntToStr(ENPLANWORKSTATUS_GOOD) +
                             ' and enplanwork.code in (' + planCodes + ')';

  frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);
  try
    with frmENPlanWorkShow do
    begin
      DisableActions([frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actDelete,
                      frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actAddPlanItems,
                      frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter]);
      isFiltered := true;
      if ShowModal = mrOk then
      begin
        oldPlanCode := planCode;
        oldPlanName := edtPlanWork.Text;
        try
          planCode := StrToInt(GetReturnValue(sgENPlanWork, 0));
          planWork := DMReports.getPlanByCode(planCode);
          if planCode = oldPlanCode then Exit; // ���� ������� ��� �� ����� ����
        except
          on EConvertError do
          begin
            planCode := oldPlanCode;
            Exit;
          end;
        end;
        edtPlanWork.Text := GetReturnValue(sgENPlanWork, 1);

        ////////////////////////////////////////////////////////////////////////////////
        workOrder := DMReports.getWorkOrderByPlanCode(planCode);

        if workOrder.code = LOW_INT then
        begin
          Application.MessageBox(PChar('�� ��������� ����� �� ������ �����! ������� �������� �����!'), PChar('��������!'), MB_ICONWARNING);
          planCode := oldPlanCode;
          edtPlanWork.Text := oldPlanName;
          Exit;
        end;

        estimateItemKind := cbEstimateItemKind.ItemIndex + 1;

        Self.FormShow(Sender);
        ////////////////////////////////////////////////////////////////////////////////


        //UpdateEstimateItems(planCode, estimateItemKind);
      end;
    end;
  finally
    frmENPlanWorkShow.Free;
  end;
end;

procedure TfrmFINMaterialsDataEdit.cbEstimateItemKindChange(
  Sender: TObject);
begin
  if planCode = LOW_INT then Exit;

  estimateItemKind := cbEstimateItemKind.ItemIndex + 1;

  //molData := DMReports.getMOLData(workOrder.code, molTypeCode);

  //FormShow(Sender);
  UpdateEstimateItems(planCode, estimateItemKind);
end;

procedure TfrmFINMaterialsDataEdit.sgFINMaterialsClick(Sender: TObject);
begin
  if sgFINMaterials.Cells[12, sgFINMaterials.Row] <> '' then
    lblCFO.Caption := '���:  ' + sgFINMaterials.Cells[12, sgFINMaterials.Row] + ' ' +
                                 sgFINMaterials.Cells[13, sgFINMaterials.Row]; 
end;

end.
