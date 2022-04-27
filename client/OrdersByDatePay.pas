unit OrdersByDatePay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DialogFormUnit , EnergyproController , DMReportsUnit,
  CheckLst, InvokeRegistry, Rio, SOAPHTTPClient ;

type
  TfrmOrdersByDatePay = class(TDialogForm)
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    RadioGroup1: TRadioGroup;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    GroupBox2: TGroupBox;
    cbOrderFormPlan: TCheckBox;
    cbOrderFormNeplan: TCheckBox;
    GroupBox3: TGroupBox;
    cbOrderTypeBudg: TCheckBox;
    cbOrderTypeInvest: TCheckBox;
    CheckListBox1: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    btnClearCleckList: TSpeedButton;
    Label3: TLabel;
    edtMaterial: TEdit;
    spbMaterial: TSpeedButton;
    SpeedButton2: TSpeedButton;
    lblContract: TLabel;
    edtContract: TEdit;
    spbContract: TSpeedButton;
    spbContractClear: TSpeedButton;
    lblOrg: TLabel;
    edtRQOrgOrgName: TEdit;
    btnOrg: TSpeedButton;
    btndelOrg: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure spbContractClick(Sender: TObject);
    procedure spbContractClearClick(Sender: TObject);
    procedure btnOrgClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   materialCode : Integer;
   materialName : String;
   contractNumber : Integer;
   contractCode : Integer;
   contractName : String;
   porgcode : Integer;
   budgCode : Integer;
   budgName : String;
  end;

var
  frmOrdersByDatePay: TfrmOrdersByDatePay;

implementation

{$R *.dfm}
uses ShowTKMaterials , TKMaterialsController , ChildFormUnit , ShowFINServicesObject , ENServicesObjectController ,
ShowRQOrg , RQOrgController , ShowENDepartment , ENDepartmentController , ENDepartmentTypeController , ENConsts ;

procedure TfrmOrdersByDatePay.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i: Integer;
  strGroupmaterials : String;
begin

   begin
    SetLength(argNames, 10);
    SetLength(args, 10);

    argNames[0] := 'startDate';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
    args[1] := DateToStr(dtpEndDate.DateTime);


    argNames[2] := 'contractNumber';
    if contractNumber > 0 then
      args[2] := IntToStr(contractNumber)
    else
      args[2] := IntToStr(0);

    argnames[3] := 'pkindrefcode';  // вид заявки   (параметр orderform используем временно как kind )
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true)) then
    args[3] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[3] := '4'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[3] := '5'; // внеплановые


    argnames[4]:= 'ordertype';    // тип заявки
    if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = true )) then
    args[4] := '0'
    Else if ((cbOrderTypeBudg.Checked = True) and (cbOrderTypeInvest.Checked = False)) then
    args[4] := '1'  // бюджет
    Else if ((cbOrderTypeInvest.Checked = True) and (cbOrderTypeBudg.Checked = False)) then
    args[4] := '2'; // инввест


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

     argnames[5] := 'strGroupmaterials';
     args[5]:= strGroupmaterials;

     argnames[6] := 'porgcode';
     args[6]:=  IntToStr(porgcode);


     argnames[7] := 'budgCode';
    if budgCode > 0 then
      args[7] := IntToStr(budgCode)
    else
      args[7] := IntToStr(0);


     if ((strGroupmaterials = '' ) and (materialCode = -1 ))  then
  begin
      Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
      exit;
  end  ;
     reportName := 'RepOrder/rep_order_by_date_pay/rep_order_full';

    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');



   end;

end;

procedure TfrmOrdersByDatePay.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin

     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;

    end;

end;

procedure TfrmOrdersByDatePay.btnClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin
     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = True then
           CheckListBox1.Checked[i] := False;
    End;
end;

procedure TfrmOrdersByDatePay.spbMaterialClick(Sender: TObject);
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

procedure TfrmOrdersByDatePay.SpeedButton2Click(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  edtMaterial.Text := '';
  DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);

end;

procedure TfrmOrdersByDatePay.spbContractClick(Sender: TObject);
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

procedure TfrmOrdersByDatePay.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';

end;

procedure TfrmOrdersByDatePay.btnOrgClick(Sender: TObject);
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

procedure TfrmOrdersByDatePay.FormShow(Sender: TObject);
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

procedure TfrmOrdersByDatePay.FormCreate(Sender: TObject);
begin

  porgcode := 0;
  materialCode := -1;
  

end;

procedure TfrmOrdersByDatePay.spbENBudgetClick(Sender: TObject);
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

procedure TfrmOrdersByDatePay.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  edtENBudgetName.Text := '';

end;

end.
