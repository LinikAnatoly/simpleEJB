unit ReportOborotMatBuh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst ,  RQOrgController ;

type
  TfrmReportOborotMatBuh = class(TDialogForm)
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
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    Label1: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    HTTPRIORQOrder: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
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
    procedure spbMaterialClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);


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
  end;

var
  frmReportOborotMatBuh: TfrmReportOborotMatBuh;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts , ChildFormUnit,
     EnergyproController, DMReportsUnit, ShowRQBill, RQBillController, ShowRQInvoice, RQInvoiceController,
     FINMolController, ShowFINMol, ENDepartment2EPRenController, ShowFINServicesObject, ENServicesObjectController,
     ShowTKMaterials, TKMaterialsController,
     ShowRQOrder, RQOrderController, RQOrderKindController, RQOrderStatusController,
     ShowENElement, ENElementController, ShowENPlanWork, ENPlanWorkController, ENPlanWorkKindController, ENElementTypeController , ShowRQOrg ;


procedure TfrmReportOborotMatBuh.spbENBudgetClick(Sender: TObject);
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
              // edtENBudgetName.Text := budgName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportOborotMatBuh.spbEPRenClick(Sender: TObject);
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
         // edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmReportOborotMatBuh.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  //edtEPRenName.Text := '';
end;

procedure TfrmReportOborotMatBuh.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  //edtENBudgetName.Text := '';
end;

procedure TfrmReportOborotMatBuh.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  //edtMaterial.Text := '';
  //DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);
end;

procedure TfrmReportOborotMatBuh.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';
end;

procedure TfrmReportOborotMatBuh.spbOrderClearClick(Sender: TObject);
begin
  orderCode := 0;
  orderName := '';
  //edtOrder.Text := '';


end;

procedure TfrmReportOborotMatBuh.btnOkClick(Sender: TObject);
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
      Application.MessageBox(PChar('Необхідно вибрати період поставки !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
    SetLength(argNames, 4);
    SetLength(args, 4);

    argNames[0] := 'datestart';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'datefinal';
    args[1] := DateToStr(dtpEndDate.DateTime);


    argNames[2] := 'contractNumber';
    if contractNumber > 0 then
      args[2] := IntToStr(contractNumber)
    else
      args[2] := IntToStr(0);


     argnames[3] := 'orgcode';
     args[3]:=  IntToStr(porgcode);

     reportName := 'orderOborotBuh/fkorder2bill/repFkOrderBillPay';

    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');
  end;

end;



procedure TfrmReportOborotMatBuh.spbInvoiceClick(Sender: TObject);
begin
  
end;

{procedure TfrmReportOborotMatBuh.spbMolClick(Sender: TObject);
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


procedure TfrmReportOborotMatBuh.spbOrderClick(Sender: TObject);
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
//              edtOrder.Text := orderName;

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


procedure TfrmReportOborotMatBuh.spbContractClick(Sender: TObject);
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


procedure TfrmReportOborotMatBuh.spbPlanClick(Sender: TObject);
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
         { planCode := StrToInt(GetReturnValue(sgENPlanWork,0));
          edtPlan.Text := GetReturnValue(sgENPlanWork,1)+ ', '+ #13#10 +
          'інв.№ ' +GetReturnValue(sgENPlanWork,2) + ', '+ #13#10 +
          GetReturnValue(sgENPlanWork,5) + ' ' + GetReturnValue(sgENPlanWork,4) + ' р., ' + #13#10 +
         GetReturnValue(sgENPlanWork,7) + ', ' + GetReturnValue(sgENPlanWork,8) + ', ' + GetReturnValue(sgENPlanWork,9);
          planName := edtPlan.Text;
          elementName := GetReturnValue(sgENPlanWork,1)+ ', '+
          'інв.№ ' +GetReturnValue(sgENPlanWork,2) + ', '+
          GetReturnValue(sgENPlanWork,5) + ' ' + GetReturnValue(sgENPlanWork,4) + ' р., ' +
          GetReturnValue(sgENPlanWork,7) + ', ' + GetReturnValue(sgENPlanWork,8) + ', ' + GetReturnValue(sgENPlanWork,9);    }

    //      GroupBox2.Enabled := false;
     //     GroupBox3.Enabled := false;
     //     dtpStartDate.Enabled := false;
     //     dtpEndDate.Enabled := false;
        end;
      end;
   finally
      frmENPlanWorkShow.Free;
   end;
end;


procedure TfrmReportOborotMatBuh.spbPlanClearClick(Sender: TObject);
begin
  planCode := 0;
  planName := '';
  elementName := '';
 // edtPlan.Text := '';

end;


procedure TfrmReportOborotMatBuh.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin

end;

procedure TfrmReportOborotMatBuh.btnClearCleckListClick(
  Sender: TObject);
 var
  I : Integer;
begin

end;

procedure TfrmReportOborotMatBuh.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin



end;

procedure TfrmReportOborotMatBuh.FormShow(Sender: TObject);
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
//     CheckListBox1.Items.Clear;

    for i:=0 to High(TKMaterialsList.list) do
      begin
        ///////
        
     //   CheckListBox1.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
      end;
end;

procedure TfrmReportOborotMatBuh.FormCreate(Sender: TObject);
begin
  porgcode := 0;
  materialCode := -1;
  paccount := 0;
end;

procedure TfrmReportOborotMatBuh.btnOrgClick(Sender: TObject);
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
procedure TfrmReportOborotMatBuh.btndelOrgClick(Sender: TObject);
begin
   porgcode := 0;
   edtRQOrgOrgName.Text := '';

end;

procedure TfrmReportOborotMatBuh.spbENElementClick(Sender: TObject);
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
         // edtENElementName.Text := elementName;

        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;


end;

procedure TfrmReportOborotMatBuh.spbENElementClearClick(
  Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
 // edtENElementName.Text := '';

end;







end.
