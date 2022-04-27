unit ReportStateMaterialsByObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst , ChildFormUnit;

type
  TfrmReportStateMaterialsByObject = class(TDialogForm)
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
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    spbPlan: TSpeedButton;
    spbPlanClear: TSpeedButton;
    Label2: TLabel;
    edtPlan: TMemo;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    GroupBox1: TGroupBox;
    rbAllMaterial: TRadioButton;
    rbNedoMaterial: TRadioButton;
    rbPereMaterial: TRadioButton;
    rbKomplekt: TRadioButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtpEndDate: TDateTimePicker;
    Label3: TLabel;
    dtpStartDate: TDateTimePicker;
    Label4: TLabel;
    lblMonthRaznar: TLabel;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    CheckListBox1: TCheckListBox;
    HTTPRIOTKMaterials: THTTPRIO;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    lblMaterial: TLabel;
    spbMaterial: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    edtMaterial: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    chkGroupMaterials: TCheckBox;
    GroupBox3: TGroupBox;
    chkStateMaterialsByPlFact: TCheckBox;
    chkStateMaterialsByPlFactOnlyCS: TCheckBox;
    chkEmptyMaterials: TCheckBox;
    chkShowCeh: TCheckBox;
    Label6: TLabel;
    ListBudget: TCheckListBox;
    SpeedButton1: TSpeedButton;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    HTTPRIOTENDepartment: THTTPRIO;
    grpMaterialRest: TGroupBox;
    chkrestMaerialbycfo: TCheckBox;
    chrestmaterialbuallcfo: TCheckBox;
    lblOrder: TLabel;
    edtOrderNumber: TEdit;
    spbOrderNumber: TSpeedButton;
    spbOrderNumberClear: TSpeedButton;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbTypeClear: TSpeedButton;
    chkPlanStatus: TCheckBox;
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbInvoiceClick(Sender: TObject);
  //  procedure spbENElementClick(Sender: TObject);
    procedure spbEnElementClearClick(Sender: TObject);
    procedure spbPlanClick(Sender: TObject);
    procedure spbPlanClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure chkStateMaterialsByPlFactClick(Sender: TObject);
    procedure chkEmptyMaterialsClick(Sender: TObject);
    procedure chkStateMaterialsByPlFactOnlyCSClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure chkrestMaerialbycfoClick(Sender: TObject);
    procedure spbOrderNumberClearClick(Sender: TObject);
    procedure spbOrderNumberClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
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
    WorkTypeCode : Integer;
  end;

var
  frmReportStateMaterialsByObject: TfrmReportStateMaterialsByObject;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts ,
     EnergyproController, DMReportsUnit, ShowRQBill, RQBillController, ShowRQInvoice, RQInvoiceController,
     FINMolController, ShowFINMol, ENDepartment2EPRenController, ShowFINServicesObject, ENServicesObjectController,
     ShowTKMaterials, TKMaterialsController,
     ShowRQOrder, RQOrderController, RQOrderKindController, RQOrderStatusController,
     ShowENElement, ENElementController, ShowENPlanWork, ENPlanWorkController, ENPlanWorkKindController
     , ENElementTypeController , ENPeriodWithRENFormUnit, DateUtils,
  ShowENPlanWorkType, ENPlanWorkTypeController;


procedure TfrmReportStateMaterialsByObject.spbENBudgetClick(Sender: TObject);
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

procedure TfrmReportStateMaterialsByObject.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportStateMaterialsByObject.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '0';
  edtEPRenName.Text := '';
end;

procedure TfrmReportStateMaterialsByObject.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '0';
  edtENBudgetName.Text := '';
end;

procedure TfrmReportStateMaterialsByObject.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  edtMaterial.Text := '';
  DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);
end;

procedure TfrmReportStateMaterialsByObject.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName, strOrderMonth, strOrderYear : String;
  TempRQOrder: RQOrderControllerSoapPort;
  RQOrderObj: RQOrder;
  i : integer;
  strGroupmaterials , strBudget : String;
  orderDate : TDateTime; // Вспомогательная дата, используется в случае если выбрана заявка
begin

  TempRQOrder := HTTPRIORQOrder as RQOrderControllerSoapPort;


  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

 { if (not NoBlankValues([edtMonthGen, edtYearGen])  and (planCode <= 0))  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати період планів !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else }
  begin
    SetLength(argNames, 22);
    SetLength(args, 22);

    argNames[0] := 'startDate';

    if dtpStartDate.Checked then
      args[0] := DateToStr(dtpStartDate.DateTime)
    else
      args[0] := '01.01.0001';


    argNames[1] := 'endDate';

    if dtpEndDate.Checked then
      args[1] := DateToStr(dtpEndDate.DateTime)
    else
      args[1] := '01.01.9999';

      if (args[0] = '01.01.0001') and (orderCode = -1) then
      begin
          Application.MessageBox(PChar('Оберіть дати !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          Exit;
      end;
      {Если заявка выбрана, то выберается ее период}
      if orderCode <> -1 then
      begin
           RQOrderObj := TempRQOrder.getObject(orderCode);
           orderDate := RQOrderObj.orderPeriod.AsDate;
           orderDate := EndOfTheMonth(orderDate);
           strOrderMonth := IntToStr(RQOrderObj.orderPeriod.Month);
           strOrderYear := IntToStr(RQOrderObj.orderPeriod.Year);
           if(Length(strOrderMonth) = 1) then
              strOrderMonth := '0' + strOrderMonth;

           args[0] := '01.' + strOrderMonth+'.' + strOrderYear;
           args[1] := IntToStr(DayOfTheMonth(orderDate))+'.' + strOrderMonth+'.' + strOrderYear;

      end;
      
    argnames[2] := 'budgcode';
    // NET-2566
//    if budgCode > 0 then
//      args[2] := IntToStr(budgCode)
//    else
//      args[2] := IntToStr(0);

   For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ' , ' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

    End;
    

     if Length(strBudget) = 0 then
      begin
          Application.MessageBox(PChar('Необхідно обрати бюджетотримача !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
      end
     else
     begin
      if trim(strBudget) <> ''  then
         args[2] := strBudget ;
     end;

     if  ((chkStateMaterialsByPlFact.Checked = True) or (CheckBox1.Checked = True ))
         then
      Begin
        if trim(strBudget) <> ''  then
         strBudget := chr(39)+'{'+strBudget+'}'+chr(39) ;
         args[2] := strBudget ;
      End;


    argnames[3]:= 'rencode';
    if renCode > 0 then
     args[3] := IntTostr(renCode)
    else
     args[3] := '0';


    argnames[4]:= 'elementName';
    if planCode > 0 then
     args[4] := elementName
    else
     args[4] := '0';



    argnames[5]:= 'plancode';
    if planCode > 0 then
     args[5] := IntTostr(planCode)
    else
     args[5] := '0';

      argnames[6] := 'elementtypecode';
      if  (cbElementType.ItemIndex = -1) or
          (cbElementType.ItemIndex = 0 ) then
      args[6] := IntToStr(0)
      else
      args[6] := IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex])) ;

      argnames[7] := 'budgname';
      if length(budgName) <> 0 then
      args[7] := budgName
      else
      args[7] := '0';


      argnames[8] := 'renname';
      if length(renName) <> 0 then
      args[8] := renName
      else
      args[8] := '0';


      argnames[9] := 'elementtypename';
      if  (cbElementType.ItemIndex = -1) or
          (cbElementType.ItemIndex = 0 ) then
      args[9] := '0' else

      args[9] := cbElementType.Text;



       argnames[10] := 'komplekt';

       If chkEmptyMaterials.Checked = True then
          args[10] := '4'
       else If rbAllMaterial.Checked = True then
          args[10] := '0'
       else If rbNedoMaterial.Checked = True then
          args[10] := '1'
       else If rbPereMaterial.Checked = True then
          args[10] := '2'
       else If rbKomplekt.Checked = True then
          args[10] := '3';


    argnames[11] := 'pceh';
    if ((CheckBox2.Checked = true ) and (CheckBox2.Enabled = true ))  or
       ((chkStateMaterialsByPlFactOnlyCS.Checked = True ) and (chkStateMaterialsByPlFactOnlyCS.Enabled = True)) then
        args[11] := '18'
    else
        args[11] := '0';

    argnames[12] := 'formplancode';
    if (( cbENPlanWorkFormName.ItemIndex = - 1) or (cbENPlanWorkFormName.ItemIndex = 0 )) then
       args[12]:= '0'
       else
       args[12]:= IntToStr(cbENPlanWorkFormName.ItemIndex);

    argnames[13] := 'elementcode';
    args[13]:= IntToStr(elementCode);



       if plancode > 0 then
     begin
       args[0] := '0';
       args[1] := '0';
       args[2] := '0';
       args[3] := '0';
       args[4] := '0';
       args[6] := '0';
       args[7] := '0';
       args[8] := '0';
       args[9] := '0';
       args[12] := '0';
       args[13] := '0';

     end;
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
    if ((chkGroupMaterials.Checked <> True ) and (chkStateMaterialsByPlFact.Checked <> True )) then // если без групировки по материалам
     Begin
     if materialCode <> -1 then
        strGroupmaterials := IntToStr(materialCode) ;
     if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
         strGroupmaterials := strGroupmaterials;
     End;
    if ((chkGroupMaterials.Checked = True)
       or
       (CheckBox1.Checked = True)
       or
       (chkStateMaterialsByPlFact.Checked = True ))
         then // если с групировкой по материалам отчет state_lite_summary/stateMaterials
                                             // или  отчет material\state_lite_summaryByPlFact\stateMaterialsByPlFact
     Begin
     if materialCode <> -1 then
        strGroupmaterials :=  chr(39)+'{'+IntToStr(materialCode)+'}'+chr(39) ;
     if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
         strGroupmaterials := chr(39)+'{'+strGroupmaterials+'}'+chr(39) ;
     End;

     argnames[14] := 'strGroupmaterials';
     args[14]:= strGroupmaterials;

     argnames[15] := 'pgroup';
     if materialCode <> -1 then
        args[15]:= '0';
     if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
         args[15]:= '1';


     argNames[16] := 'pShowCeh';
     if chkShowCeh.Checked = true then
        args[16] := '1'
     else
        args[16] := '0';

    argNames[17] := 'grmatoronlymat';
    if materialCode <> -1 then
       args[17] := '2' ; // признак фильтра по одному материалу
    if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
       args[17] := '1' ; // признак фильтра по группе или группам

    args[18] := IntToStr(orderCode) ; // признак фильтра по заявке

     if ((strGroupmaterials = '' ) and (materialCode = -1 ))  then
  begin
      Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
      exit;
  end  ;
//     if ((renCode = 0 ) AND ( budgCode = 0  )) and (  (CheckBox1.Checked = false ) and (chkStateMaterialsByPlFact.Checked = false )  )  then
//  begin
//      Application.MessageBox(PChar('Необхідно обрати Бюджетотримача або Підрозділ !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
//      ModalResult := mrNone;
//      exit;
//  end  ;


   if chkStateMaterialsByPlFact.Checked = True  then
      begin
  //    args[14]:= '  tm.rootgrouprefcode in ('+ strGroupmaterials + ')';
      reportName := 'material/state_lite_summaryByPlFact/stateMaterialsByPlFact';     // v

      end
   else if ((CheckBox1.Checked = True) and (chkGroupMaterials.Checked = False)) then
      begin
//      reportName := 'material/state_lite/stateMaterials';                           // v
      reportName := 'material/state_lite_summary/stateMaterials'; // 20130521 дергаем этот репорт так как с предыдущим они одинаковые по структуре выводимых полей 
       {if materialCode <> -1 then
        args[14]:= ' tm.code = ' + IntToStr(materialCode)  ;
       if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
        args[14]:= 'tm.rootgrouprefcode in (' + strGroupmaterials + ')' ;

       args[2]:=  '  enplanwork.budgetrefcode in ( ' + strBudget + ' )';}
      end
   else if CheckBox1.Checked = False then
      // reportName := 'material/state/stateMaterials'
      // reportName := 'material/state_with_counter/stateMaterials'
         reportName := 'material/STT_TMP_TBL/state'    // Отчет с темп таблицами, функцией расчета  // v
   else if ((chkGroupMaterials.Checked = True ) and (CheckBox1.Checked = True)) then
     begin
      //args[2]:= chr(39)+'{'+strBudget+'}'+chr(39) ;
      reportName := 'material/state_lite_summary/stateMaterials' ;    // v
     end;

     argNames[18] := 'showRestMaterial';
     if ((chkrestMaerialbycfo.Checked = False) and (chrestmaterialbuallcfo.Checked = False )) then
     args[18] := '0' // не отображаем остатки по материалам
     else if ((chkrestMaerialbycfo.Checked = True) and (chrestmaterialbuallcfo.Checked = False ))  then
     args[18] := '1' // отображаем только те остатки которые есть в привязке бюджетодержателей и ЦФО
     else if ((chkrestMaerialbycfo.Checked = True) and (chrestmaterialbuallcfo.Checked = True ))  then
     args[18] := '2'; // отображаем все остатки без условий по цфо 

     argNames[19] := 'orderCode';
     args[19] := IntToStr(orderCode) ; // признак фильтра по заявке


     argNames[20] := 'worktypecode';
     args[20] := IntToStr(worktypecode) ;

     argNames[21] := 'planstatus';
     if chkPlanStatus.Checked = true then
      args[21] := '3'
    else
      args[21] := '0';


    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xlsx')
    else
      makeReport(reportName, argNames, args, 'pdf');
  end;

end;



procedure TfrmReportStateMaterialsByObject.spbInvoiceClick(Sender: TObject);

begin

end;

{procedure TfrmReportStateMaterialsByObject.spbMolClick(Sender: TObject);
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


{procedure TfrmReportStateMaterialsByObject.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try

      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               elementCode := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
               elementName := edtENElementName.Text;




            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;      }


procedure TfrmReportStateMaterialsByObject.spbEnElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

  if cbElementType.Enabled = False then
   begin
    cbElementType.Enabled:= True;
    cbElementType.ItemIndex := -1;
   end; 

end;


procedure TfrmReportStateMaterialsByObject.spbPlanClick(Sender: TObject);
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
   frmENPlanWorkShow.viewPlanWork := 1;
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


        end;
      end;
   finally
      frmENPlanWorkShow.Free;
   end;
end;


procedure TfrmReportStateMaterialsByObject.spbTypeClearClick(Sender: TObject);
begin
  inherited;
  edtTypeName.Text:= '';
  WorkTypeCode := 0;
end;

procedure TfrmReportStateMaterialsByObject.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try

               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               WorkTypeCode :=   StrToInt(GetReturnValue(sgENPlanWorkType,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;

procedure TfrmReportStateMaterialsByObject.spbPlanClearClick(Sender: TObject);
begin
  planCode := 0;
  planName := '';
  elementName := '';
  edtPlan.Text := '';

end;


procedure TfrmReportStateMaterialsByObject.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;
 //
  TempTKMaterials: TKMaterialsControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;

  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
  
begin
    {заполняем типы объектов}
 renname:= '0';
 budgname:= '0';
  cbElementType.Clear;
  chkEmptyMaterials.Enabled := false;

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


  // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';



     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     ListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        ListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;

     DisableControls([edtTypeName]);

end;

procedure TfrmReportStateMaterialsByObject.CheckBox1Click(Sender: TObject);
begin
   if CheckBox1.Checked = true
   then
    begin
    CheckBox2.Enabled := True;
    chkGroupMaterials.Enabled := True;
    chkStateMaterialsByPlFact.Enabled := False;
    chkStateMaterialsByPlFact.Checked := False;
    chkStateMaterialsByPlFactOnlyCS.Checked := False;
    chkStateMaterialsByPlFactOnlyCS.Enabled := False;
    chkEmptyMaterials.Enabled := False;
    chkEmptyMaterials.Checked := False;
    end
   else
     begin
        CheckBox2.Checked := False;
        CheckBox2.Enabled := False;

        chkGroupMaterials.Checked:= False;
        chkGroupMaterials.Enabled:= False;
        chkStateMaterialsByPlFact.Enabled := True;
        chkStateMaterialsByPlFactOnlyCS.Enabled := False;
        chkEmptyMaterials.Enabled := False;

        chkShowCeh.Enabled := False;
        chkShowCeh.Checked := False;

     end;

end;

procedure TfrmReportStateMaterialsByObject.FormCreate(Sender: TObject);
begin
   CheckBox2.Enabled:= false;
   chkGroupMaterials.Enabled := False;
   chkStateMaterialsByPlFactOnlyCS.Enabled := False;
   chkShowCeh.Enabled:= false;
   materialCode := -1;
   orderCode := -1;
   chrestmaterialbuallcfo.Enabled := False;
   WorkTypeCode := 0;
end;

procedure TfrmReportStateMaterialsByObject.spbENElementClick(
  Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmReportStateMaterialsByObject.cbElementType.ItemIndex > -1 then
  begin
    if Integer(frmReportStateMaterialsByObject.cbElementTYpe.Items.Objects[frmReportStateMaterialsByObject.cbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmReportStateMaterialsByObject.cbElementTYpe.Items.Objects[frmReportStateMaterialsByObject.cbElementType.ItemIndex]);
    end;
  end;

  DisableControls([edtOrderNumber]);

  f.orderBySQL := 'typerefcode';

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
          /// показываем тип объекта в cbElementType
          cbElementType.Enabled := False;
          cbElementType.ItemIndex := cbElementType.Items.IndexOf(GetReturnValue(sgENElement,4));



        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmReportStateMaterialsByObject.btnCheckListAllClick(
  Sender: TObject);

var
  I : Integer;
begin


     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;


    End;
 

end;

procedure TfrmReportStateMaterialsByObject.btnClearCleckListClick(
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

procedure TfrmReportStateMaterialsByObject.spbMaterialClick(
  Sender: TObject);
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

procedure TfrmReportStateMaterialsByObject.chkStateMaterialsByPlFactClick(Sender: TObject);
begin
if chkStateMaterialsByPlFact.Checked then
   begin
   CheckBox1.Enabled := False;
   CheckBox1.Checked := False;
   chkStateMaterialsByPlFactOnlyCS.Enabled := True;
   chkEmptyMaterials.Enabled := True;
   end
else
begin
CheckBox1.Enabled := True;
chkStateMaterialsByPlFactOnlyCS.Enabled:= False;
chkStateMaterialsByPlFactOnlyCS.Checked:= False;
chkEmptyMaterials.Enabled := False;
chkEmptyMaterials.Checked := False;
chkShowCeh.Enabled := False;
chkShowCeh.Checked := False;
end;

end;

procedure TfrmReportStateMaterialsByObject.chkEmptyMaterialsClick(
  Sender: TObject);
begin
  if chkEmptyMaterials.Checked = True
  then
    begin
   GroupBox1.Enabled := false;
   GroupBox1.Visible := false;
   end
  else
    begin
    GroupBox1.Enabled := true;
    GroupBox1.Visible := true;
    end

end;

procedure TfrmReportStateMaterialsByObject.chkStateMaterialsByPlFactOnlyCSClick(
  Sender: TObject);
begin
   if chkStateMaterialsByPlFactOnlyCS.Checked = True then
      chkShowCeh.Enabled := True
   else
     begin
      chkShowCeh.Enabled := False;
      chkShowCeh.Checked := False;
     end;


end;

procedure TfrmReportStateMaterialsByObject.SpeedButton1Click(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmReportStateMaterialsByObject.SpeedButton2Click(
  Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmReportStateMaterialsByObject.chkrestMaerialbycfoClick(
  Sender: TObject);
begin
  inherited;
    if chkrestMaerialbycfo.Checked then
       chrestmaterialbuallcfo.Enabled := True
    else
     begin
       chrestmaterialbuallcfo.Checked := False;
       chrestmaterialbuallcfo.Enabled := False;
     end;
end;

procedure TfrmReportStateMaterialsByObject.spbOrderNumberClearClick(
  Sender: TObject);
begin
  inherited;
  orderCode := -1;
  edtOrderNumber.Text := '';
end;

procedure TfrmReportStateMaterialsByObject.spbOrderNumberClick(
  Sender: TObject);
var
  frmRQOrderShow: TfrmRQOrderShow;
  f: RQOrderFilter;
begin
  f := RQOrderFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.kindRef := RQOrderKindRef.Create;
  f.kindRef.code := Low(Integer);

  frmRQOrderShow :=TfrmRQOrderShow.Create(Application,fmNormal, f);
  try

    with frmRQOrderShow do
      if ShowModal = mrOk then
      begin
        try
          orderCode := StrToInt(GetReturnValue(sgRQOrder,0));
          edtOrderNumber.Text := GetReturnValue(sgRQOrder,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQOrderShow.Free;
  end;
end;

end.
