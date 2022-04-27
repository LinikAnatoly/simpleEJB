unit ImplementationOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls , DialogFormUnit, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient
  , RQOrderItemController, RQOrgController , XSBuiltIns ;

type
  TfrmImplementationOrder = class(TDialogForm)
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
    Label1: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    GroupBox2: TGroupBox;
    cbOrderFormPlan: TCheckBox;
    cbOrderFormNeplan: TCheckBox;
    GroupBox3: TGroupBox;
    cbOrderTypeBudg: TCheckBox;
    cbOrderTypeInvest: TCheckBox;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblMaterialGroup: TLabel;
    edtMaterialGroup: TEdit;
    spbMaterialGroup: TSpeedButton;
    spbMaterialGroupClear: TSpeedButton;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
    spbMaterialClear: TSpeedButton;
    spbMaterial: TSpeedButton;
    edtMaterial: TEdit;
    lblMaterial: TLabel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    RadioGroup1: TRadioGroup;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    lblOrder: TLabel;
    edtOrder: TEdit;
    spbOrderClear: TSpeedButton;
    spbOrder: TSpeedButton;
    HTTPRIORQOrder: THTTPRIO;
    GroupBox1: TGroupBox;
    chkUslPredopl: TCheckBox;
    chkUslFact: TCheckBox;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbOrderClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure spbOrderClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
  private
    { Private declarations }
  public
   orderCode : Integer;
   materialGroupCode: Integer;
    materialGroupName: String;
	  zayakind : String;
    orderform : String;
    ordertype : String;
    orderName : String;
    elementCode : Integer;
    elementName : String;
    orderperiod : String;
    dategen : String;
    planName : String;
    planCode : Integer;
    budgCode : Integer;
    renCode : Integer;
    renName : String;
    porgcode : Integer;

    materialCode : Integer;


    { Public declarations }


  end;

var
  frmImplementationOrder: TfrmImplementationOrder;
  RQOrderItemObj: RQOrderItem;

implementation

{$R *.dfm}

Uses EnergyproController , DMReportsUnit , ShowRQOrder , RQOrderController , RQOrderKindController , ENConsts
     , RQOrderStatusController , ChildFormUnit, ENDepartmentController, ENDepartmentTypeController , ShowENDepartment ,
     ShowTKMaterials, TKMaterialsController , ShowRQOrg  ;

procedure TfrmImplementationOrder.btnOkClick(Sender: TObject);
var
argNames, args : ArrayOfString;
reportName : String;
RQOrderObj : RQOrder;
TempRQOrder: RQOrderControllerSoapPort;
Begin

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

   SetLength(argNames, 16);
   SetLength(args, 16);


   argNames[0] := 'startDate';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
    args[1] := DateToStr(dtpEndDate.DateTime);

   argNames[2] := 'materialGroupCode';
    if materialGroupCode > 0 then
      args[2] := IntToStr(materialGroupCode)
    else
      args[2] := IntToStr(0);

   argnames[3]:= 'orderCode';
  if orderCode > 0 then
     args[3] :=  IntTostr(orderCode)
    else
     args[3] := '0';

   argnames[4] := 'budgCode';
    if budgCode > 0 then
      args[4] := IntToStr(budgCode)
    else
      args[4] := IntToStr(0);

   argnames[5] := 'orderform';  // вид заявки   (параметр orderform используем временно как kind )
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true)) then
    args[5] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[5] := '4'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[5] := '5' // внеплановые
    else if  ((cbOrderFormPlan.Checked = False) and (cbOrderFormNeplan.Checked = False)) then
    args[5] := '0';  // плановые +  внеплановые


    argnames[6]:= 'ordertype';
    if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = true )) then
    args[6] := '0'
    Else if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = False)) then
    args[6] := '1'  // бюджет
    Else if ((cbOrderTypeInvest.Checked = True) and (cbOrderTypeBudg.Checked = False)) then
    args[6] := '2' // инввест
    else if ((cbOrderTypeBudg.Checked = false) and (cbOrderTypeInvest.Checked = false )) then
    args[6] := '0';


    argnames[7]:= 'renCode';
    if renCode > 0 then
     args[7] := IntTostr(renCode)
    else
     args[7] := '0';

    argnames[8]:= 'porgcode';
    if porgcode > 0 then
     args[8] := IntTostr(porgcode)
    else
     args[8] := '0';

     if orderCode > 0 then
     begin
       args[5] := '0';
       args[6] := '0';

     end;



     argnames[9]:= 'materialCode';
    if materialCode > 0 then
     args[9] := IntTostr(materialCode)
    else
     args[9] := '0';


     if orderCode > 0 then
     begin
       args[0] := XSDate2String(RQOrderObj.orderPeriod);
       args[1] := XSDate2String(RQOrderObj.orderPeriod);
     end;


    argnames[10]:= 'uslpostavki';
    if ((chkUslPredopl.Checked = true) and (chkUslFact.Checked = true)) then
       args[10] := '2526'; // только по предоплате и по факту
    if ((chkUslPredopl.Checked = false) and (chkUslFact.Checked = false)) then
       args[10] := '0';   // по всем формам оплат  
    if ((chkUslPredopl.Checked = true) and (chkUslFact.Checked = false)) then
       args[10] := '25';
    if ((chkUslPredopl.Checked = false) and (chkUslFact.Checked = true)) then
       args[10] := '26';


     argnames[11]:= 'renName';
     if renCode > 0 then
        args[11] := renName
     else
        args[11] := '';



   reportName := 'RepOrder/ImplementationOrder';

    if rbXLS.Checked then
       makeReport(reportName, argNames, args , 'xls')
    else
       makeReport(reportName, argNames, args , 'pdf');
    end;

end;

procedure TfrmImplementationOrder.spbOrderClick(Sender: TObject);
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

procedure TfrmImplementationOrder.spbENBudgetClick(Sender: TObject);
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
            //  budgName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmImplementationOrder.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';

end;

procedure TfrmImplementationOrder.spbEPRenClick(Sender: TObject);
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

procedure TfrmImplementationOrder.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  edtENBudgetName.Text := '';
end;

procedure TfrmImplementationOrder.spbMaterialGroupClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin

      DisableActions([actInsert, actEdit, actDelete]);
      
      if ShowModal = mrOk then
      begin

        try
          materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmImplementationOrder.spbMaterialGroupClearClick(
  Sender: TObject);
begin
  materialGroupCode := 0;
  materialGroupName := '';
  edtMaterialGroup.Text := '';
end;

procedure TfrmImplementationOrder.btnOrgClick(Sender: TObject);
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
             //  if RQOrderItemObj.org = nil then
             //  begin
             //   RQOrderItemObj.org := RQOrg.Create();
             //   SetNullIntProps(RQOrderItemObj.org);
             //   SetNullXSProps(RQOrderItemObj.org);
             //  end;
               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);
               {RQOrderItemObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               RQOrderItemObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               RQOrderItemObj.org.name := GetReturnValue(sgRQOrg,1);
               RQOrderItemObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               RQOrderItemObj.org.okpo := GetReturnValue(sgRQOrg,2);
               RQOrderItemObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               RQOrderItemObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               RQOrderItemObj.org.adr := GetReturnValue(sgRQOrg,5);
               RQOrderItemObj.org.tel := GetReturnValue(sgRQOrg,6);
               RQOrderItemObj.org.country := GetReturnValue(sgRQOrg,10);
               RQOrderItemObj.org.region := GetReturnValue(sgRQOrg,11);
               RQOrderItemObj.org.ministry := GetReturnValue(sgRQOrg,12);
               RQOrderItemObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               RQOrderItemObj.org.type_ := GetReturnValue(sgRQOrg,14);
               RQOrderItemObj.org.master_code := GetReturnValue(sgRQOrg,15);}

               porgcode :=   StrToInt(GetReturnValue(sgRQOrg,0));


              { sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    RQOrderItemObj.org.date_svidet := TXSDate.Create;
                    RQOrderItemObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    RQOrderItemObj.org.likv_date := TXSDate.Create;
                    RQOrderItemObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               RQOrderItemObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               RQOrderItemObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               RQOrderItemObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    RQOrderItemObj.org.date_nalogform := TXSDate.Create;
                    RQOrderItemObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               RQOrderItemObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               RQOrderItemObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               RQOrderItemObj.org.Primechan := GetReturnValue(sgRQOrg,7); }

              
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
end;

procedure TfrmImplementationOrder.btndelOrgClick(Sender: TObject);
begin
    porgcode := 0;
    edtRQOrgOrgName.Text := '';
end;

procedure TfrmImplementationOrder.FormCreate(Sender: TObject);
begin
   porgcode := 0;
   materialCode := 0 ;
end;

procedure TfrmImplementationOrder.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin

      DisableActions([actInsert, actEdit, actDelete]);
      
      if ShowModal = mrOk then
      begin

        try
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterial.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;

        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmImplementationOrder.spbMaterialClearClick(Sender: TObject);
begin
   materialCode := 0;
   edtMaterial.Text :=  '';
end;

procedure TfrmImplementationOrder.spbOrderClearClick(Sender: TObject);
begin
  orderCode := 0;
  orderName := '';
  edtOrder.Text := '';

  GroupBox2.Enabled := true;
  GroupBox3.Enabled := true;
  dtpStartDate.Enabled := true;
  dtpEndDate.Enabled := true;
end;

end.
