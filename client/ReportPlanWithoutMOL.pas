unit ReportPlanWithoutMOL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst ,  RQOrgController , RQOrderItemController;

type
  TfrmReportPlanWithoutMOL = class(TDialogForm)
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
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblMonthGen: TLabel;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
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
    procedure spbMaterialClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbRQDDSCodesDdsCodesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);


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
  end;

var

  frmReportPlanWithoutMOL: TfrmReportPlanWithoutMOL;
  RQOrderItemObj: RQOrderItem;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts , ChildFormUnit,
     EnergyproController, DMReportsUnit, ShowRQBill, RQBillController, ShowRQInvoice, RQInvoiceController,
     FINMolController, ShowFINMol, ENDepartment2EPRenController, ShowFINServicesObject, ENServicesObjectController,
     ShowTKMaterials, TKMaterialsController,
     ShowRQOrder, RQOrderController, RQOrderKindController, RQOrderStatusController,
     ShowENElement, ENElementController, ShowENPlanWork, ENPlanWorkController, ENPlanWorkKindController,
     ENElementTypeController , ShowRQOrg , ShowRQDDSCodes , RQDDSCodesController ;


procedure TfrmReportPlanWithoutMOL.spbENBudgetClick(Sender: TObject);
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

procedure TfrmReportPlanWithoutMOL.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportPlanWithoutMOL.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmReportPlanWithoutMOL.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  edtENBudgetName.Text := '';
end;

procedure TfrmReportPlanWithoutMOL.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';

end;

procedure TfrmReportPlanWithoutMOL.spbOrderClearClick(Sender: TObject);
begin
  orderCode := 0;
  orderName := '';

end;

procedure TfrmReportPlanWithoutMOL.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderObj: RQOrder;
  i: Integer;
  strGroupmaterials : String;
begin

    SetLength(argNames, 24);
    SetLength(args, 24);

      argNames[0] := 'pyeargen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'pmonthgen';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);

       argnames[2] := 'pbudgetrefcode';
    if budgCode > 0 then
      args[2] := IntToStr(budgCode)
    else
      args[2] := IntToStr(0);

    argnames[3]:= 'pdepartmentrefcode';
    if renCode > 0 then
     args[3] := IntTostr(renCode)
    else
     args[3] := '0';

      argnames[4] := 'pplanform';
    if (( cbENPlanWorkFormName.ItemIndex = - 1) or (cbENPlanWorkFormName.ItemIndex = 0 )) then
       args[4]:= '0'
       else
       args[4]:= IntToStr(cbENPlanWorkFormName.ItemIndex);

     argnames[5] := 'elementtypecode';
      if  (cbElementType.ItemIndex = -1) or
          (cbElementType.ItemIndex = 0 ) then
      args[5] := IntToStr(0)
      else
      args[5] := IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex])) ;




     reportName := 'planwithoutmol';

    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');


end;



procedure TfrmReportPlanWithoutMOL.spbInvoiceClick(Sender: TObject);
begin
  
end;

{procedure TfrmReportPlanWithoutMOL.spbMolClick(Sender: TObject);
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


procedure TfrmReportPlanWithoutMOL.spbOrderClick(Sender: TObject);
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


              orderperiod := GetReturnValue(sgRQOrder,3);
              dategen := GetReturnValue(sgRQOrder,4);

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmRQOrderShow.Free;
   end;
end;


procedure TfrmReportPlanWithoutMOL.spbContractClick(Sender: TObject);
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



            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmReportPlanWithoutMOL.spbPlanClick(Sender: TObject);
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


        end;
      end;
   finally
      frmENPlanWorkShow.Free;
   end;
end;


procedure TfrmReportPlanWithoutMOL.spbPlanClearClick(Sender: TObject);
begin
  planCode := 0;
  planName := '';
  elementName := '';

end;


procedure TfrmReportPlanWithoutMOL.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin

end;

procedure TfrmReportPlanWithoutMOL.btnClearCleckListClick(
  Sender: TObject);
 var
  I : Integer;
begin

end;

procedure TfrmReportPlanWithoutMOL.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin


end;

procedure TfrmReportPlanWithoutMOL.FormShow(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  i: Integer;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;
   f : ENElementTypeFilter;

   TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
begin

     {заполняем типы объектов}
 renname:= '0';
 budgname:= '0';
  cbElementType.Clear;


  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10)';
  //f.conditionSQL := 'code in (1,2,3,5,6,7,8,9,10,11)';
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';
  f.orderBySQL := 'code';

  //cbElementType.Items.Add('');
  cbElementType.Items.AddObject(' ', TObject(LOW_INT));

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;


end;

procedure TfrmReportPlanWithoutMOL.FormCreate(Sender: TObject);
begin
  porgcode := 0;
  materialCode := -1;
  paccount := 0;
end;

procedure TfrmReportPlanWithoutMOL.btnOrgClick(Sender: TObject);
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


               porgcode :=   StrToInt(GetReturnValue(sgRQOrg,0));
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;
procedure TfrmReportPlanWithoutMOL.spbENElementClick(Sender: TObject);
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


        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;


end;

procedure TfrmReportPlanWithoutMOL.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';


end;



procedure TfrmReportPlanWithoutMOL.spbRQDDSCodesDdsCodesClick(
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

          except
             on EConvertError do Exit;
          end;
        end;
   finally
      frmRQDDSCodesShow.Free;
   end;

end;

procedure TfrmReportPlanWithoutMOL.SpeedButton1Click(Sender: TObject);
begin
  ddsCodes:= 0;


end;

end.
