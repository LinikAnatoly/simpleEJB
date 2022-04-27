unit ReportOborotMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst ,  RQOrgController , RQOrderItemController;

type
  TfrmReportOborotMaterials = class(TDialogForm)
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    RadioGroup1: TRadioGroup;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    lblContract: TLabel;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    edtContract: TEdit;
    lblOrder: TLabel;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;
    edtOrder: TEdit;
    GroupBox2: TGroupBox;
    cbOrderFormPlan: TCheckBox;
    cbOrderFormNeplan: TCheckBox;
    GroupBox3: TGroupBox;
    cbOrderTypeBudg: TCheckBox;
    cbOrderTypeInvest: TCheckBox;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    spbPlan: TSpeedButton;
    spbPlanClear: TSpeedButton;
    Label2: TLabel;
    edtPlan: TMemo;
    chkMotion: TCheckBox;
    gbIsIncompleteDeliveranceOrder: TGroupBox;
    cbLackDeliveranceOrder: TCheckBox;
    cbExcessDeliveranceOrder: TCheckBox;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    Label3: TLabel;
    spbMaterial: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    CheckListBox1: TCheckListBox;
    edtMaterial: TEdit;
    HTTPRIOTKMaterials: THTTPRIO;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
    Label6: TLabel;
    spbENElementClear: TSpeedButton;
    spbENElement: TSpeedButton;
    edtENElementName: TEdit;
    lblENElementName: TLabel;
    cbAccountFilter: TComboBox;
    gbIsIncompleteDeliveranceBill: TGroupBox;
    cbLackDeliveranceBill: TCheckBox;
    cbExcessDeliveranceBill: TCheckBox;
    lblRQDDSCodesDdsCodesName: TLabel;
    edtRQDDSCodesDdsCodesName: TEdit;
    spbRQDDSCodesDdsCodes: TSpeedButton;
    SpeedButton1: TSpeedButton;
    chkNeopata: TCheckBox;
    chkorderitemstatus: TCheckBox;
    chkrepBudg: TCheckBox;
    chkOrderStatus: TCheckBox;
    Label7: TLabel;
    chkStatusFkOrder: TCheckBox;
    grpPeriodOrder: TGroupBox;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label1: TLabel;
    dtpEndDate: TDateTimePicker;
    lblResponsib: TLabel;
    edtResponsibles: TEdit;
    btnResponsibles: TSpeedButton;
    btnResponsiblesClear: TSpeedButton;
    chkExpandObject: TCheckBox;
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure spbOrderClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbInvoiceClick(Sender: TObject);
    procedure spbOrderClick(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbPlanClick(Sender: TObject);
    procedure spbPlanClearClick(Sender: TObject);
    procedure cbLackDeliveranceOrderClick(Sender: TObject);
    procedure cbExcessDeliveranceOrderClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure cbExcessDeliveranceBillClick(Sender: TObject);
    procedure cbLackDeliveranceBillClick(Sender: TObject);
    procedure spbRQDDSCodesDdsCodesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnResponsiblesClick(Sender: TObject);
    procedure btnResponsiblesClearClick(Sender: TObject);


  private
    { Private declarations }
   public
    { Public declarations }
    renCode: Integer;
    renName: String;
    budgCode: Integer;
    budgName: String;
    materialCode: Integer;
    materialName: String;
    billCode: Integer;
    billName: String;
    invoiceCode: Integer;
    invoiceName: String;
    contractCode: Integer;
    contractNumber: Integer;
    contractName: String;
    materialGroupCode: Integer;
    materialGroupName: String;
	  zayakind : String;
    orderform : String;
    ordertype : String;
    orderCode : Integer;
    orderName : String;
    elementCode : Integer;
    elementName : String;
    orderperiod : String;
    dategen : String;
    planName : String;
    planCode : Integer;
    IsIncompleteDelivery: Integer; // Max: = 0 - Все, 1 - только недопоставка, 2 - только
                            // перепоставка, 3 - и то и другое но без нормальных
    porgcode :Integer;
    paccount :Integer;

    ddsCodes : Integer;

    ENResponsiblesCode : Integer;


    byPurchaseDate : boolean;


  end;

var

  frmReportOborotMaterials: TfrmReportOborotMaterials;
  RQOrderItemObj: RQOrderItem;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts , ChildFormUnit,
     EnergyproController, DMReportsUnit, ShowRQBill, RQBillController, ShowRQInvoice, RQInvoiceController,
     FINMolController, ShowFINMol, ENDepartment2EPRenController, ShowFINServicesObject, ENServicesObjectController,
     ShowTKMaterials, TKMaterialsController,
     ShowRQOrder, RQOrderController, RQOrderKindController, RQOrderStatusController,
     ShowENElement, ENElementController, ShowENPlanWork, ENPlanWorkController, ENPlanWorkKindController,
     ENElementTypeController , ShowRQOrg , ShowRQDDSCodes , RQDDSCodesController , 
  ENResponsiblesController, ShowENResponsibles;


procedure TfrmReportOborotMaterials.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
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
              budgCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportOborotMaterials.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmReportOborotMaterials.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmReportOborotMaterials.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  edtENBudgetName.Text := '';
end;

procedure TfrmReportOborotMaterials.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  edtMaterial.Text := '';
  DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);
end;

procedure TfrmReportOborotMaterials.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';
end;

procedure TfrmReportOborotMaterials.spbOrderClearClick(Sender: TObject);
begin
  orderCode := 0;
  orderName := '';
  edtOrder.Text := '';

  GroupBox2.Enabled := true;
  GroupBox3.Enabled := true;
  dtpStartDate.Enabled := true;
  dtpEndDate.Enabled := true;
end;

procedure TfrmReportOborotMaterials.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderObj: RQOrder;
  i: Integer;
  strGroupmaterials : String;
begin

 TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;

  if orderCode > 0 then
   RQOrderObj := TempRQOrder.getObject(orderCode);

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  if (not NoBlankValues([dtpStartDate, dtpEndDate]) and (orderCode <= 0) and (planCode <= 0) and (elementCode = 0 ) )  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати період заявки !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
    SetLength(argNames, 26);
    SetLength(args, 26);

    argNames[0] := 'startDate';
    if not dtpStartDate.Checked then
    args[0] := '01.01.2000'
    else
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
    if not dtpEndDate.Checked then
    args[1] := '01.01.2060'
    else
    args[1] := DateToStr(dtpEndDate.DateTime);

    argNames[2] := 'materialGroupCode';
    if materialGroupCode > 0 then
      args[2] := IntToStr(materialGroupCode)
    else
      args[2] := IntToStr(0);

    argNames[3] := 'contractNumber';
    if contractNumber > 0 then
      args[3] := IntToStr(contractNumber)
    else
      args[3] := IntToStr(0);

    argnames[4] := 'budgCode';
    if budgCode > 0 then
      args[4] := IntToStr(budgCode)
    else
      args[4] := IntToStr(0);


    argnames[5] := 'zayakind';
    args[5] := '0';


    argnames[6] := 'orderform';  // вид заявки   (параметр orderform используем временно как kind )
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true)) then
    args[6] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[6] := '4'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[6] := '5'; // внеплановые


    argnames[7]:= 'ordertype';
    if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = true))
       //если ничего не выбрано
       or ((cbOrderTypeBudg.Checked = false) and (cbOrderTypeInvest.Checked = false)) then
    args[7] := '0'

    Else if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = False)) then
    args[7] := '1'  // бюджет
    Else if ((cbOrderTypeInvest.Checked = True) and (cbOrderTypeBudg.Checked = False)) then
    args[7] := '2'; // инввест


    if orderCode > 0 then
     begin
       args[6] := '0';
       args[7] := '0';
     end;


    argnames[8]:= 'renCode';
    if renCode > 0 then
     args[8] := IntTostr(renCode)
    else
     args[8] := '0';


    argnames[9]:= 'orderCode';
    if orderCode > 0 then
     args[9] := IntTostr(orderCode)
    else
     args[9] := '0';


    argnames[10]:= 'elementCode';
    if elementCode > 0 then
     args[10] := IntTostr(elementCode)
    else
     args[10] := '0';

    argnames[11]:= 'elementName';
    //if elementCode > 0 then
    if planCode > 0 then
     args[11] := elementName;

    argnames[12]:= 'renName';
    if renCode > 0 then
     args[12] := renName;

    argnames[13]:= 'planCode';
    if planCode > 0 then
     args[13] := IntTostr(planCode)
    else
     args[13] := '0';

    if orderCode > 0 then
     begin
       args[0] := XSDate2String(RQOrderObj.orderPeriod);
       args[1] := XSDate2String(RQOrderObj.orderPeriod);
     end;

    if planCode > 0 then
     begin
       args[0] := '01.08.2010';
       args[1] := DateToStr(SysUtils.Date);
     end;

    argnames[14]:= 'viewmotion';
    // if chkMotion.Checked = True then
    // args[14] := '1'
    // else    убрали так как решило руководство  не отображать движение .
     args[14] := '0';

     argnames[15] := 'IsComplete';
     if IsIncompleteDelivery > 0 then args[15] := IntToStr(IsIncompleteDelivery)
     else
     args[15] := '0'; //Max: Выбирает что выводить - поставку, недопоставку

      strGroupmaterials:= '';
   /// собираем строку групп материалов
   For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] then
        if strGroupmaterials <>  '' then
           strGroupmaterials := strGroupmaterials + ' , ' + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) )
         else
           strGroupmaterials := strGroupmaterials + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) ) ;

    End;
    if materialCode <> -1 then
       strGroupmaterials := ' tm.code in ('+ IntToStr(materialCode)+')' ;
     if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
         strGroupmaterials := ' tm.rootgrouprefcode in ('+strGroupmaterials+')';

     argnames[16] := 'strGroupmaterials';
     args[16]:= strGroupmaterials;

     argnames[17] := 'porgcode';
     args[17]:=  IntToStr(porgcode);


     argnames[18] := 'paccount';
     args[18]:= IntToStr(cbAccountFilter.ItemIndex);

     argnames[19] := 'ddscode';
     args[19]:= IntToStr(ddsCodes);

     argnames[20] := 'pstatusbill';
     if chkNeopata.Checked = true then
      args[20]:= '0'
      else
      args[20]:= '1';

     argnames[21] := 'orderitemstatus';
     if chkorderitemstatus.Checked = true then
      args[21]:= '0'
      else
      args[21]:= '1';

      argnames[22] := 'orderstatus';
     if chkOrderStatus.Checked = true then
      args[22]:= '23' // только заявки со статуском "в роботі ОМТС "
      else
      args[22]:= '2'; // заявки со статусом в роботы ОМТС и попередні 

      argNames[23] := 'fkorderstatus';
      if chkStatusFkOrder.Checked = True then
      args[23]:= '1'
      else
      args[23]:= '0';

      argNames[24] := 'responsiblesCode';
      args[24]:=  IntToStr(ENResponsiblesCode);

     if ((strGroupmaterials = '' ) and (materialCode = -1 ))  then
  begin
      Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
      exit;
  end  ;

   //   if ((renCode <> 0 ) or (elementcode <>  0 ) or (planCode <> 0 )) then
   //  reportName := 'orderOborotByObject/rqOrderOborotByObject'   ;
   //   else
     if ((chkrepBudg.Checked ) or (elementcode <>  0 ) ) then
       reportName := 'orderOborotByObject/rqOrderOborotByObject'
     else
       reportName := 'orderOborot/rqOrderOborot';

     if  budgCode = 75000016  then // если служба транспорта
         reportName := 'orderOborotShowObject/rqOrderOborotByObject';

     if chkExpandObject.Checked then
     reportName := 'orderOborotByExpandObject/OrderOborotByExpandObject';

     // SUPP-91442  звіт по периоду закупок
     if byPurchaseDate = true then
     reportName := 'orderOborotbyPurchaseDate/rqOrderOborot';


    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');
  end;

end;



procedure TfrmReportOborotMaterials.spbInvoiceClick(Sender: TObject);
begin
  
end;

{procedure TfrmReportOborotMaterials.spbMolClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;
 TempENDepartment2EPRen : ENDepartment2EPRenControllerSoapPort;
 i : Integer;
 ENDepartment2EPRenList : ENDepartment2EPRenShortList;
 renFilter : ENDepartment2EPRenFilter;
 renList : ENDepartment2EPRenShortList;
 molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...


   {  if renCode <> LOW_INT then
     begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code := renCode;  // ENWorkOrder2ENPlanWorkObj.workOrder.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;
    }

// пока подразделения - это РЭС ... надо Подразделение !!!

  { frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := false;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               edtMol.Text := GetReturnValue(sgFINMol,0) + ' ' +GetReturnValue(sgFINMol,1);
               molName := edtMol.Text;
               molCode := StrToInt(GetReturnValue(sgFINMol,0));

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;}


procedure TfrmReportOborotMaterials.spbOrderClick(Sender: TObject);
var
   frmRQOrderShow: TfrmRQOrderShow;
   f : RQOrderFilter;
begin
    f := RQOrderFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.kindRef := RQOrderKindRef.Create;
    f.kindRef.code := LOW_INT;//RQORDER_KIND_OE_PLANNED_AUTO;
    f.statusRef := RQOrderStatusRef.Create;
    f.statusRef.code := RQORDER_STATUS_WORK_IN_MTS;

   frmRQOrderShow := TfrmRQOrderShow.Create(Application,fmNormal, f);
   try

      with frmRQOrderShow do
      begin
        if ShowModal = mrOk then
        begin
            try
              orderCode := StrToInt(GetReturnValue(sgRQOrder,0));
              orderName := GetReturnValue(sgRQOrder,1);
              edtOrder.Text := orderName;

              orderperiod := GetReturnValue(sgRQOrder,3);
              dategen := GetReturnValue(sgRQOrder,4);

              GroupBox2.Enabled := false;
              GroupBox3.Enabled := false;
              dtpStartDate.Enabled := false;
              dtpEndDate.Enabled := false;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmRQOrderShow.Free;
   end;
end;


procedure TfrmReportOborotMaterials.spbContractClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораотрные работы

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   //f.contractNumber := edtContractNumber.Text;

   f.conditionSQL := ' a.io_flag = ''B''';
   //and p.id in (205, 342, 319, 88)';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContract.Text := '№' + GetReturnValue(sgFINServicesObject, 1);
                //contractName := GetReturnValue(sgFINServicesObject, 1);
                contractNumber := StrToInt(GetReturnValue(sgFINServicesObject, 6));

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmReportOborotMaterials.spbPlanClick(Sender: TObject);
var
   frmENPlanWorkShow: TfrmENPlanWorkShow;
   f : ENPlanWorkFilter;
begin
   f := ENPlanWorkFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.kind := ENPlanWorkKind.Create;
   f.kind.code := ENPLANWORKKIND_CURRENT;

   frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application,fmNormal, f);

   try
      with frmENPlanWorkShow do begin
        //isFiltered := true;
        outerCondition := 'enplanwork.kindcode = ' + IntToStr(ENPLANWORKKIND_CURRENT);
        if ShowModal = mrOk then
        begin
          planCode := StrToInt(GetReturnValue(sgENPlanWork,0));
          edtPlan.Text := GetReturnValue(sgENPlanWork,1)+ ', '+ #13#10 +
          'інв.№ ' +GetReturnValue(sgENPlanWork,2) + ', '+ #13#10 +
          GetReturnValue(sgENPlanWork,5) + ' ' + GetReturnValue(sgENPlanWork,4) + ' р., ' + #13#10 +
          GetReturnValue(sgENPlanWork,7) + ', ' + GetReturnValue(sgENPlanWork,8) + ', ' + GetReturnValue(sgENPlanWork,9);
          planName := edtPlan.Text;
          elementName := GetReturnValue(sgENPlanWork,1)+ ', '+
          'інв.№ ' +GetReturnValue(sgENPlanWork,2) + ', '+
          GetReturnValue(sgENPlanWork,5) + ' ' + GetReturnValue(sgENPlanWork,4) + ' р., ' +
          GetReturnValue(sgENPlanWork,7) + ', ' + GetReturnValue(sgENPlanWork,8) + ', ' + GetReturnValue(sgENPlanWork,9);

          GroupBox2.Enabled := false;
          GroupBox3.Enabled := false;
          dtpStartDate.Enabled := false;
          dtpEndDate.Enabled := false;
        end;
      end;
   finally
      frmENPlanWorkShow.Free;
   end;
end;


procedure TfrmReportOborotMaterials.spbPlanClearClick(Sender: TObject);
begin
  planCode := 0;
  planName := '';
  elementName := '';
  edtPlan.Text := '';
  GroupBox2.Enabled := true;
  GroupBox3.Enabled := true;
  dtpStartDate.Enabled := true;
  dtpEndDate.Enabled := true;
end;


procedure TfrmReportOborotMaterials.cbLackDeliveranceOrderClick(
  Sender: TObject);
begin
  inherited;

 if cbLackDeliveranceOrder.Checked = true then
 begin

    if cbExcessDeliveranceOrder.Checked = false then
    IsIncompleteDelivery := 1
    else
    IsIncompleteDelivery := 3;
 end
    else
    begin

          if cbExcessDeliveranceOrder.Checked = false then
          IsIncompleteDelivery := 0
          else
          IsIncompleteDelivery := 2;
    end;

    if cbLackDeliveranceOrder.Checked = true  then
        DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ])
    else if
        ((cbLackDeliveranceOrder.Checked = false)  and (cbExcessDeliveranceOrder.Checked = true)) then
        DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ])
    else
         DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ],False);

end;


procedure TfrmReportOborotMaterials.cbExcessDeliveranceOrderClick(
  Sender: TObject);
begin
  inherited;
if cbExcessDeliveranceOrder.Checked = true then
begin

      if cbLackDeliveranceOrder.Checked = false then
      IsIncompleteDelivery := 2
      else
      IsIncompleteDelivery := 3;
end
else
begin

      if cbLackDeliveranceOrder.Checked = false then
      IsIncompleteDelivery := 0
      else
      IsIncompleteDelivery := 1;
end;


      if cbExcessDeliveranceOrder.Checked = true  then
        DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ])
    else if
        ((cbExcessDeliveranceOrder.Checked = false)  and (cbLackDeliveranceOrder.Checked = true)) then
        DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ])
    else
         DisableControls([cbLackDeliveranceBill, cbExcessDeliveranceBill ],False);


end;

procedure TfrmReportOborotMaterials.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin
      strGroupmaterials:= '';
   ///\\\ собираем строку групп материалов
   For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] then
        if strGroupmaterials <>  '' then
           strGroupmaterials := strGroupmaterials + ' , ' + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) )
         else
           strGroupmaterials := strGroupmaterials + IntToStr(  Integer( CheckListBox1.Items.Objects[i] ) ) ;

    End;
     if trim(strGroupmaterials) <> '' then
         strGroupmaterials := '('+strGroupmaterials+')';
     ///\\\

     if strGroupmaterials <>  '' then
     begin

     fmFilter := TkMaterialsFilter.Create;


     SetNullIntProps(fmFilter);
     SetNullXSProps(fmFilter);

     fmFilter.conditionSQL := 'TK1.code in ' + strGroupmaterials ;
     fmFilter.orderBySQL := 'TK1.NAME';


     frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal , fmFilter);
    end
    else
    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal );

  try
    with frmSpr_matherialShow do
    begin

      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin

        try
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterial.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
          // очищаем лочим чек лист
        //  btnClearCleckListClick(sender);
          DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ]);


        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmReportOborotMaterials.btnClearCleckListClick(
  Sender: TObject);
 var
  I : Integer;
begin
     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = True then
           CheckListBox1.Checked[i] := False;
    End;
end;

procedure TfrmReportOborotMaterials.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin

     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;

end;
end;

procedure TfrmReportOborotMaterials.FormShow(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  i: Integer;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;
begin

    {заполняем группы материалов}
     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);
     CheckListBox1.Items.Clear;

    for i:=0 to High(TKMaterialsList.list) do
      begin
        ///////
        
        CheckListBox1.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
      end;


      if byPurchaseDate then
   grpPeriodOrder.Caption := 'Період закупівель';
end;

procedure TfrmReportOborotMaterials.FormCreate(Sender: TObject);
begin
  porgcode := 0;
  materialCode := -1;
  paccount := 0;
  elementCode := 0;
  ENResponsiblesCode := 0;

end;

procedure TfrmReportOborotMaterials.btnOrgClick(Sender: TObject);
var
   frmRQOrgShow: TfrmRQOrgShow;
   org : RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
begin
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               porgcode :=   StrToInt(GetReturnValue(sgRQOrg,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;
procedure TfrmReportOborotMaterials.btndelOrgClick(Sender: TObject);
begin
   porgcode := 0;
   edtRQOrgOrgName.Text := '';

end;

procedure TfrmReportOborotMaterials.spbENElementClick(Sender: TObject);
 var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
     frmENElementShow.isFiltered := True;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;


end;

procedure TfrmReportOborotMaterials.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

end;



procedure TfrmReportOborotMaterials.cbExcessDeliveranceBillClick(
  Sender: TObject);
begin

if cbExcessDeliveranceBill.Checked = true then
begin

      if cbLackDeliveranceBill.Checked = false then
      IsIncompleteDelivery := 5
      else
      IsIncompleteDelivery := 6;
end
else
begin

      if cbLackDeliveranceBill.Checked = false then
      IsIncompleteDelivery := 0
      else
      IsIncompleteDelivery := 4;
end;


      if cbExcessDeliveranceBill.Checked = true  then
        DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ])
    else if
        ((cbExcessDeliveranceBill.Checked = false)  and (cbLackDeliveranceBill.Checked = true)) then
        DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ])
    else
         DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ],False);

end;

procedure TfrmReportOborotMaterials.cbLackDeliveranceBillClick(
  Sender: TObject);
begin

 if cbLackDeliveranceBill.Checked = true then
 begin

    if cbExcessDeliveranceBill.Checked = false then
    IsIncompleteDelivery := 4
    else
    IsIncompleteDelivery := 6;
 end
    else
    begin

          if cbExcessDeliveranceOrder.Checked = false then
          IsIncompleteDelivery := 0
          else
          IsIncompleteDelivery := 5;
    end;

    if cbLackDeliveranceBill.Checked = true  then
        DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ])
    else if
        ((cbLackDeliveranceBill.Checked = false)  and (cbExcessDeliveranceBill.Checked = true)) then
        DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ])
    else
         DisableControls([cbLackDeliveranceOrder, cbExcessDeliveranceOrder ],False);


end;

procedure TfrmReportOborotMaterials.spbRQDDSCodesDdsCodesClick(
  Sender: TObject);
var
   frmRQDDSCodesShow: TfrmRQDDSCodesShow;
   f : RQDDSCodesFilter;
begin
   f := RQDDSCodesFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.isActual := 1;
   f.conditionSQL := 'q1.PARENTDDSCODESREFCODE is null';
   frmRQDDSCodesShow:=TfrmRQDDSCodesShow.Create(Application,fmNormal,f);
   try

      with frmRQDDSCodesShow do
        if ShowModal = mrOk then
        begin
          if tvDDSCodes.Selected = nil then Exit;
          if tvDDSCodes.Selected.Data = nil then Exit;

          try
            // if RQOrderItemObj.ddsCodes = nil then RQOrderItemObj.ddsCodes := RQDDSCodes.Create();
            // RQOrderItemObj.ddsCodes.code := RQDDSCodesShort(tvDDSCodes.Selected.Data).code; //StrToInt(GetReturnValue(sgRQDDSCodes,0));
             edtRQDDSCodesDdsCodesName.Text := RQDDSCodesShort(tvDDSCodes.Selected.Data).txtCode + ' ' +
                                               RQDDSCodesShort(tvDDSCodes.Selected.Data).name; //GetReturnValue(sgRQDDSCodes,1);
             ddsCodes:=   RQDDSCodesShort(tvDDSCodes.Selected.Data).code;
          except
             on EConvertError do Exit;
          end;
        end;
   finally
      frmRQDDSCodesShow.Free;
   end;

end;

procedure TfrmReportOborotMaterials.SpeedButton1Click(Sender: TObject);
begin
  ddsCodes:= 0;
  edtRQDDSCodesDdsCodesName.Clear;

end;

procedure TfrmReportOborotMaterials.btnResponsiblesClick(Sender: TObject);
var
   frmenresponsiblesShow: TfrmenresponsiblesShow;
   f : enresponsiblesFilter;
begin
    f := enresponsiblesFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);


   frmenresponsiblesShow := TfrmenresponsiblesShow.Create(Application,fmNormal, f);
   try

      with frmenresponsiblesShow do
      begin
        if ShowModal = mrOk then
        begin
            try
              ENResponsiblesCode := StrToInt(GetReturnValue(sgENResponsibles,0));
              edtResponsibles.Text := GetReturnValue(sgENResponsibles,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmenresponsiblesShow.Free;
   end;
end;

procedure TfrmReportOborotMaterials.btnResponsiblesClearClick(
  Sender: TObject);
begin
 // inherited;
   ENResponsiblesCode := 0;
   edtResponsibles.Text := '';
end;

end.
