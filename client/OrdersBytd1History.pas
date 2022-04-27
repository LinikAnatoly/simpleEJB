unit OrdersBytd1History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DialogFormUnit , EnergyproController , DMReportsUnit,
  CheckLst, InvokeRegistry, Rio, SOAPHTTPClient ;

type
  TfrmOrdersBytd1History = class(TDialogForm)
    lblYearRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
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
    chkCurrentPeriod: TCheckBox;
    lblRQDDSCodesDdsCodesName: TLabel;
    edtRQDDSCodesDdsCodesName: TEdit;
    spbRQDDSCodesDdsCodes: TSpeedButton;
    SpeedButton1: TSpeedButton;
    chkorderstatus: TCheckBox;
    lblinfo: TLabel;
    chkShowGroup: TCheckBox;
    chkshowcurrentofforder: TCheckBox;
    chkprizn_postavka: TCheckBox;
    chkShowCompletedPlan: TCheckBox;
    chkshowpayincurperiod: TCheckBox;
    GroupBox1: TGroupBox;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    edtcode: TEdit;
    chkShowPayOnlyCurPeriod: TCheckBox;
    chkonlyNotPayItem: TCheckBox;
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
    procedure spbRQDDSCodesDdsCodesClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure chkCurrentPeriodClick(Sender: TObject);
    procedure chkShowPayOnlyCurPeriodClick(Sender: TObject);
    procedure chkonlyNotPayItemClick(Sender: TObject);
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

   ddsCodes : Integer;
   reportVersion: Integer;
   // 1 - ТД старый, 2 - ТД новый (16.07.13),
   // 3 - Реестр плановых платежей (18.07.13), 4 - Реестр плановых платежей 2 (23.07.13) 
  end;

var
  frmOrdersBytd1History: TfrmOrdersBytd1History;

implementation

{$R *.dfm}
uses ShowTKMaterials , TKMaterialsController , ChildFormUnit , ShowFINServicesObject , ENServicesObjectController ,
ShowRQOrg , RQOrgController , ShowENDepartment , ENDepartmentController , ENDepartmentTypeController , ENConsts ,
 ShowRQDDSCodes , RQDDSCodesController  ;

procedure TfrmOrdersBytd1History.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i: Integer;
  strGroupmaterials : String;
begin
   if (not NoBlankValues([dtpStartDate]) )   then
  begin
      Application.MessageBox(PChar('Необхідно вибрати дату !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end
   else
   begin
		SetLength(argNames, 20);
		SetLength(args, 20);

		argNames[0] := 'startDate';
    args[0] := DateToStr(dtpStartDate.DateTime);

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
         strGroupmaterials := '  sm.rootgrouprefcode in ('+strGroupmaterials+')';

     argnames[5] := 'strGroupmaterials';
     args[5]:= strGroupmaterials;

     argnames[6] := 'porgcode';
     args[6]:=  IntToStr(porgcode);


     argnames[7] := 'budgCode';
    if budgCode > 0 then
      args[7] := IntToStr(budgCode)
    else
      args[7] := IntToStr(0);

    argnames[8] := 'prizn_period';
    if chkCurrentPeriod.Checked = True then
       args[8] := '1'
    else
       args[8] := '0';

    argnames[9] := 'ddscode';
    args[9]:= IntToStr(ddsCodes);


    argnames[10] := 'orderstatus';
    if chkorderstatus.Checked then
    args[10]:= '0' // включаем заявки "попередні" и "в роботі"
    else
    args[10]:= '2'; // только "В роботі у ВМТП"

    argnames[11] := 'pr_ke';
    if chkShowGroup.Checked then
    args[11]:= '1' // включаем заявки "попередні" и "в роботі"
    else
    args[11]:= '0'; // только "В роботі у ВМТП"

    argnames[12] := 'showcurrentofforder';
    if chkshowcurrentofforder.Checked = True then
    args[12]:= '0'  // не отображать внеплановые заявки текущего месяца
    else
    args[12]:= '1'; // отображать все заявки текущего периода

    argnames[13] := 'prizn_postavka';
    if chkprizn_postavka.Checked = False then
    args[13]:= '1'  // показіваем все приході
    else
    args[13]:= '0'; //

    argnames[14] := 'ShowCompletedPlan';
    if chkShowCompletedPlan.Checked = True then
    args[14]:= '1'  // показываем строки с завершенных планов
    else
    args[14]:= '0'; // не показываем строки с завершенных планов


    argnames[15] := 'pkindrefcode_service';  // вид заявки по услугам
    if  ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = true)) then
    args[15] := '0'  // плановые +  внеплановые
    else if ((cbOrderFormPlan.Checked = True) and (cbOrderFormNeplan.Checked = false)) then
    args[15] := '7'  // плановые
    else if ((cbOrderFormNeplan.Checked = True ) and (cbOrderFormPlan.Checked = false)) then
    args[15] := '8'; // внеплановые


		argnames[16] := 'showpayincurperiod';
    if chkshowpayincurperiod.Checked = True then
    args[16]:= '1'  // показываем строки которые оплачены в текущем периода  (для бюджетного )
    else
		args[16]:= '0'; // не показываем строки которые оплачены в текущем периода  (для бюджетного )

		argnames[17] := 'rqorderitemcode';
				if edtcode.Text <> ''
				then
				args[17]:= edtcode.Text
				else args[17]:= '0';



				argnames[18] := 'ShowPayOnlyCurPeriod';
				if chkShowPayOnlyCurPeriod.Checked then
				args[18] := '1'
				else
				args[18] := '0';

       argnames[19] := 'onlyNotPayItem';  // сколько еще не оплотили
				if chkonlyNotPayItem.Checked then
				args[19] := '1'
				else
				args[19] := '0';

     if ((strGroupmaterials = '' ) and (materialCode = -1 ))  then
	begin
      Application.MessageBox(PChar('Необхідно обрати групи матеріалів або матеріал !!!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
      exit;
  end  ;


   case reportVersion of
		 1: reportName := 'RepOrder/rep_by_td1_history/rep_order_full';
		 2: reportName := 'RepOrder/rep_by_td1_history2/rep_order_full';
     3: reportName := 'RepOrder/reestrPaymentDS/rep_order_full';
		 4: reportName := 'RepOrder/reestrPaymentDS/rep_order_full';
		 5: reportName := 'RepOrder/reestrPaymentDSService/rep_order_full';
		 6: reportName := 'RepOrder/rep_by_td1_history2+service/rep_order_full';    // тест с услугами по новому олгоритму
     7: reportName := 'RepOrder/chartPayments/main';
     8: reportName := 'RepOrder/rep_by_td1_history2+service2/rep_order_full'; // сумма предыдущ заявки со счета SUPP-9591
		 else reportName := 'RepOrder/rep_by_td1_history/rep_order_full';
   end;





    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');



   end;

end;

procedure TfrmOrdersBytd1History.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin

     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = false then
           CheckListBox1.Checked[i] := true;

    end;

end;

procedure TfrmOrdersBytd1History.btnClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin
     For i:=0 to CheckListBox1.Count -1  do
    Begin
       if  CheckListBox1.Checked[i] = True then
           CheckListBox1.Checked[i] := False;
    End;
end;

procedure TfrmOrdersBytd1History.spbMaterialClick(Sender: TObject);
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

procedure TfrmOrdersBytd1History.SpeedButton2Click(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';
  edtMaterial.Text := '';
  DisableControls([btnCheckListAll , btnClearCleckList , CheckListBox1 ],False);

end;

procedure TfrmOrdersBytd1History.spbContractClick(Sender: TObject);
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

procedure TfrmOrdersBytd1History.spbContractClearClick(Sender: TObject);
begin
  contractCode := 0;
  contractNumber := 0;
  contractName := '';
  edtContract.Text := '';

end;

procedure TfrmOrdersBytd1History.btnOrgClick(Sender: TObject);
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

procedure TfrmOrdersBytd1History.FormShow(Sender: TObject);
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

procedure TfrmOrdersBytd1History.FormCreate(Sender: TObject);
begin

  porgcode := 0;
  materialCode := -1;
  ddsCodes:= 0;
  
  reportVersion := 1;
end;

procedure TfrmOrdersBytd1History.spbENBudgetClick(Sender: TObject);
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

procedure TfrmOrdersBytd1History.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';
  edtENBudgetName.Text := '';

end;

procedure TfrmOrdersBytd1History.spbRQDDSCodesDdsCodesClick(
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

procedure TfrmOrdersBytd1History.SpeedButton1Click(Sender: TObject);
begin

  ddsCodes:= 0;
  edtRQDDSCodesDdsCodesName.Clear;

end;

procedure TfrmOrdersBytd1History.chkCurrentPeriodClick(Sender: TObject);
begin
  if chkCurrentPeriod.Checked = True then
    Begin
     chkshowcurrentofforder.Enabled := True;
     chkshowcurrentofforder.Checked := True;
    End
  else
    Begin
     chkshowcurrentofforder.Enabled := False;
     chkshowcurrentofforder.Checked := False;
    End

end;

procedure TfrmOrdersBytd1History.chkonlyNotPayItemClick(Sender: TObject);
begin
//  inherited;
//   if chkonlyNotPayItem.checked =true then
//    chkShowPayOnlyCurPeriod.checked:= false;
end;

procedure TfrmOrdersBytd1History.chkShowPayOnlyCurPeriodClick(Sender: TObject);
begin
//  inherited;
//    if chkShowPayOnlyCurPeriod.checked =true then
//    chkonlyNotPayItem.checked:= false;

end;

end.
