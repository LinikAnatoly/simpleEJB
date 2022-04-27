unit ReportOborotServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst ,  RQOrgController , RQOrderItemController;

type
  TfrmReportOborotServices = class(TDialogForm)
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
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
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
    Label1: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    HTTPRIORQOrder: THTTPRIO;
    spbPlan: TSpeedButton;
    spbPlanClear: TSpeedButton;
    Label2: TLabel;
    edtPlan: TMemo;
    chkMotion: TCheckBox;
    gbIsIncompleteDeliveranceOrder: TGroupBox;
    cbLackDeliveranceOrder: TCheckBox;
    cbExcessDeliveranceOrder: TCheckBox;
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
    lblActType: TLabel;
    edtActType: TEdit;
    spbActType: TSpeedButton;
    spbActTypeClear: TSpeedButton;
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure cbExcessDeliveranceBillClick(Sender: TObject);
    procedure cbLackDeliveranceBillClick(Sender: TObject);
    procedure spbRQDDSCodesDdsCodesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spbActTypeClick(Sender: TObject);
    procedure spbActTypeClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);


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

    ///// 18.07.12
    actTypeCode: Integer;
    /////
  end;

var

  frmReportOborotServices: TfrmReportOborotServices;
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
  ShowENPlanWorkState, ENPlanWorkStateController;


procedure TfrmReportOborotServices.spbENBudgetClick(Sender: TObject);
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

              // Показываем Тип акта только для Службы Транспорта
              HideControls([lblActType, edtActType, spbActType, spbActTypeClear], (budgCode <> ENBUDGET_TRANSPORT));

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportOborotServices.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportOborotServices.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmReportOborotServices.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  edtENBudgetName.Text := '';
  HideControls([lblActType, edtActType, spbActType, spbActTypeClear]);
end;

procedure TfrmReportOborotServices.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';
end;

procedure TfrmReportOborotServices.spbOrderClearClick(Sender: TObject);
begin
  orderCode := 0;
  orderName := '';
  edtOrder.Text := '';

  GroupBox2.Enabled := true;
  GroupBox3.Enabled := true;
  dtpStartDate.Enabled := true;
  dtpEndDate.Enabled := true;
end;

procedure TfrmReportOborotServices.btnOkClick(Sender: TObject);
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

  if (not NoBlankValues([dtpStartDate, dtpEndDate]) and (orderCode <= 0) and (planCode <= 0))  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати період заявки !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
    SetLength(argNames, 25);
    SetLength(args, 25);

    argNames[0] := 'startDate';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
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


    argnames[5] := 'zayakind';  // не используется 
    args[5] := '0';


    argnames[6] := 'orderform';  // вид заявки   (параметр orderform используем временно как kind )
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true)) then
    args[6] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[6] := '7'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[6] := '8'; // внеплановые


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
      args[21]:= '2'
      else
      args[21]:= '1';

      argnames[22] := 'orderstatus';
     if chkOrderStatus.Checked = true then
      args[22]:= '23' // только заявки со статуском "в роботі ОМТС "
      else
      args[22]:= '2'; // заявки со статусом в роботы ОМТС и попередні

      //// ???? А где параметр с индексом 23 ?????
      argnames[23] := 'actType';
      args[23]:= IntToStr(actTypeCode);

   { if chkrepBudg.Checked then
       reportName := 'orderOborotServicesByObject/rqOrderOborotByObject'
     else
       reportName := 'orderOborotServices/rqOrderOborot';

    if  budgCode = 75000016  then // если служба транспорта  то показываем объект
    begin
        reportName := 'orderOborotServicesShowObject/rqOrderOborotByObject';
        args[23]:= IntToStr(actTypeCode);
    end; }

    // NET-4371 один отчет вместо 3
    reportName := 'orderOborotServicesShowObject/rqOrderOborotByObject';

  //  reportName := 'orderOborotServices/rqOrderOborot';

    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');
  end;

end;



procedure TfrmReportOborotServices.spbInvoiceClick(Sender: TObject);
begin
  
end;

{procedure TfrmReportOborotServices.spbMolClick(Sender: TObject);
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


procedure TfrmReportOborotServices.spbOrderClick(Sender: TObject);
var
   frmRQOrderShow: TfrmRQOrderShow;
   f : RQOrderFilter;
begin
    f := RQOrderFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);


    f.kindRef := RQOrderKindRef.Create;
    f.kindRef.code :=  LOW_INT;//RQORDER_KIND_OE_PLANNED_AUTO;
    f.statusRef := RQOrderStatusRef.Create;
    f.statusRef.code :=  RQORDER_STATUS_WORK_IN_MTS;

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


procedure TfrmReportOborotServices.spbContractClick(Sender: TObject);
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


procedure TfrmReportOborotServices.spbPlanClick(Sender: TObject);
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


procedure TfrmReportOborotServices.spbPlanClearClick(Sender: TObject);
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


procedure TfrmReportOborotServices.cbLackDeliveranceOrderClick(
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


procedure TfrmReportOborotServices.cbExcessDeliveranceOrderClick(
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



procedure TfrmReportOborotServices.FormCreate(Sender: TObject);
begin
  porgcode := 0;
  materialCode := -1;
  paccount := 0;
  actTypeCode := 0;
end;

procedure TfrmReportOborotServices.btnOrgClick(Sender: TObject);
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
procedure TfrmReportOborotServices.btndelOrgClick(Sender: TObject);
begin
   porgcode := 0;
   edtRQOrgOrgName.Text := '';

end;

procedure TfrmReportOborotServices.spbENElementClick(Sender: TObject);
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

  f.conditionSQL := ' 1 <> 1 ';

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

procedure TfrmReportOborotServices.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

end;



procedure TfrmReportOborotServices.cbExcessDeliveranceBillClick(
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

procedure TfrmReportOborotServices.cbLackDeliveranceBillClick(
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

procedure TfrmReportOborotServices.spbRQDDSCodesDdsCodesClick(
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

procedure TfrmReportOborotServices.SpeedButton1Click(Sender: TObject);
begin
  ddsCodes:= 0;
  edtRQDDSCodesDdsCodesName.Clear;

end;

procedure TfrmReportOborotServices.spbActTypeClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
   f: ENPlanWorkStateFilter;
begin
   f := ENPlanWorkStateFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   // f.orderBySQL := 'ordered';
   f.conditionSQL := 'enplanworkstate.code in (' +
                        IntToStr(ENPLANWORKSTATE_TECHNICALSERVICE) + ', ' +
                        IntToStr(ENPLANWORKSTATE_CURRENTREPAIR) + ', ' +
                        IntToStr(ENPLANWORKSTATE_TRANSPORT_SERVICES_4_SIDE) +
                      ')';

   frmENPlanWorkStateShow := TfrmENPlanWorkStateShow.Create(Application, fmNormal, f);
   try
      with frmENPlanWorkStateShow do
      begin
        DisableActions([actEdit, actInsert, actDelete]);
        if ShowModal = mrOk then
        begin
            try
               actTypeCode := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtActType.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmReportOborotServices.spbActTypeClearClick(Sender: TObject);
begin
  actTypeCode := 0;
  edtActType.Text := '';
end;

procedure TfrmReportOborotServices.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtActType]);
  HideControls([lblActType, edtActType, spbActType, spbActTypeClear]);
end;

end.
