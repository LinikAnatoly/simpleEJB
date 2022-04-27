unit ComparePriceOrderedAndPurchaseMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, ComCtrls , DialogFormUnit  , ChildFormUnit,
  InvokeRegistry, Rio, SOAPHTTPClient ;

type
  TfrmComparePriceOrderedAndPurchaseMaterial = class(TDialogForm)
    grpPeriodOrder: TGroupBox;
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
    lblOrder: TLabel;
    edtOrder: TEdit;
    spbOrder: TSpeedButton;
    spbOrderClear: TSpeedButton;
    CheckListBox1: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    Label4: TLabel;
    btnClearCleckList: TSpeedButton;
    Label5: TLabel;
    Label3: TLabel;
    edtMaterial: TEdit;
    spbMaterial: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lblContract: TLabel;
    edtContract: TEdit;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
    procedure spbOrderClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure btndelOrgClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    orderCode , materialCode  , porgcode: Integer;
    orderName  , materialName: String;
    orderperiod : String;
    dategen : String;
    contractNumber: Integer;
    contractCode: Integer;
    contractName: String;
    budgCode : Integer;
    budgName : String;
  public
    { Public declarations }
  end;

var
  frmComparePriceOrderedAndPurchaseMaterial: TfrmComparePriceOrderedAndPurchaseMaterial;

implementation

uses
  ShowRQOrder, RQOrderController, RQOrderKindController, ENConsts,
  RQOrderStatusController, ShowTKMaterials, TKMaterialsController, 
  ShowFINServicesObject, ENServicesObjectController, ShowENDepartment, 
  ENDepartmentController, ENDepartmentTypeController, EnergyproController,
  ShowRQOrg, DMReportsUnit, RQOrgController;

{$R *.dfm}

procedure TfrmComparePriceOrderedAndPurchaseMaterial.spbOrderClick(
  Sender: TObject);
var
   frmRQOrderShow: TfrmRQOrderShow;
   f : RQOrderFilter;
begin
    f := RQOrderFilter.create();
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.kindRef := RQOrderKindRef.Create;
    f.kindRef.code := LOW_INT;
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

procedure TfrmComparePriceOrderedAndPurchaseMaterial.btnCheckListAllClick(
  Sender: TObject);
var
  I : Integer;
begin

     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;

end;
end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.btnClearCleckListClick(
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

procedure TfrmComparePriceOrderedAndPurchaseMaterial.spbMaterialClick(
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

procedure TfrmComparePriceOrderedAndPurchaseMaterial.SpeedButton2Click(
  Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  edtMaterial.Text := '';
  DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);
end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.spbContractClick(
  Sender: TObject);
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

procedure TfrmComparePriceOrderedAndPurchaseMaterial.spbContractClearClick(
  Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';
end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.FormShow(
  Sender: TObject);
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
end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.btnOkClick(
  Sender: TObject);
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

  if (not NoBlankValues([dtpStartDate, dtpEndDate]) and (orderCode <= 0)  )  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати період заявки !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
    SetLength(argNames, 15);
    SetLength(args, 15);

    argNames[0] := 'startDate';
    if not dtpStartDate.Checked then
    args[0] := '01.01.2000'
    else
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
    if not dtpEndDate.Checked then
    args[1] := '01.01.3000'
    else
    args[1] := DateToStr(dtpEndDate.DateTime);

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

    argnames[5] := 'orderform';  // вид заявки   (параметр orderform используем временно как kind )
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true))
        or
        ((cbOrderFormPlan.Checked = False) and (cbOrderFormNeplan.Checked = False)) then
    args[5] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[5] := '4'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[5] := '5'; // внеплановые


    argnames[6]:= 'ordertype';
    if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = true))
       //если ничего не выбрано
       or ((cbOrderTypeBudg.Checked = false) and (cbOrderTypeInvest.Checked = false)) then
    args[6] := '0'
    Else if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = False)) then
    args[6] := '1'  // бюджет
    Else if ((cbOrderTypeInvest.Checked = True) and (cbOrderTypeBudg.Checked = False)) then
    args[6] := '2'; // инввест


    if orderCode > 0 then
     begin
       args[5] := '0';
       args[6] := '0';
     end;


    argnames[7]:= 'orderCode';
    if orderCode > 0 then
     args[7] := IntTostr(orderCode)
    else
     args[7] := '0';


    if orderCode > 0 then
     begin
       args[0] := XSDate2String(RQOrderObj.orderPeriod);
       args[1] := XSDate2String(RQOrderObj.orderPeriod);
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
    if materialCode <> -1 then
       strGroupmaterials := ' tm.code in ('+ IntToStr(materialCode)+')' ;
     if (( trim(strGroupmaterials) <> '' ) and  ( materialCode = -1 )) then
         strGroupmaterials := ' tm.rootgrouprefcode in ('+strGroupmaterials+')';

     argnames[8] := 'strGroupmaterials';
     args[8]:= strGroupmaterials;

     argnames[9] := 'porgcode';
     args[9]:=  IntToStr(porgcode);

     if ((strGroupmaterials = '' ) and (materialCode = -1 ))  then
  begin
      Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
      exit;
  end  ;

       reportName := 'material/rpt_compare_material';


      makeReport(reportName, argNames, args, 'xls')

  end;

end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.btnOrgClick(
  Sender: TObject);
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
procedure TfrmComparePriceOrderedAndPurchaseMaterial.btndelOrgClick(
  Sender: TObject);
begin
   porgcode := 0;
   edtRQOrgOrgName.Text := '';
end;

procedure TfrmComparePriceOrderedAndPurchaseMaterial.FormCreate(
  Sender: TObject);
begin
    materialCode := -1;
end;

end.
