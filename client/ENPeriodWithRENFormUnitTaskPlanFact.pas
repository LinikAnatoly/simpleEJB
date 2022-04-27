unit ENPeriodWithRENFormUnitTaskPlanFact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, CheckLst;

type
  TfrmENPeriodWithRENTaskPlanFact = class(TDialogForm)
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    chbWholeYear: TCheckBox;
    lblENElementName: TLabel;
    spbENElement: TSpeedButton;
    edtENElementName: TEdit;
    chbByMonths: TCheckBox;
    GroupBox1: TGroupBox;
    chbByRENs: TCheckBox;
    chbByObjects: TCheckBox;
    spbEPRenClear: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    chbByBudgets: TCheckBox;
    edtDateStart: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtDateFinal: TDateTimePicker;
    GroupBox2: TGroupBox;
    rbv1: TRadioButton;
    rbv2: TRadioButton;
    rbv3: TRadioButton;
    GroupBox3: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckListBox1: TCheckListBox;
    chktransportation: TCheckBox;
    chbShowFinMaterials: TCheckBox;
    procedure chbWholeYearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
  end;

var
  frmENPeriodWithRENTaskPlanFact: TfrmENPeriodWithRENTaskPlanFact;

implementation

uses ShowENEPRen, ChildFormUnit , ShowENElement, ENElementController,
  EnergyproController, ENConsts , ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController ,  ENPlanWorkController, Main, DMReportsUnit;

{$R *.dfm}

procedure TfrmENPeriodWithRENTaskPlanFact.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
  HideControls([chbByMonths], not chbWholeYear.Checked);
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;
 {  if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > low(Integer) then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;    }





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            {try
               if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;}
          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithRENTaskPlanFact.FormShow(Sender: TObject);
begin
  DisableControls([edtEPRenName, edtENElementName , edtENBudgetName ]);
  HideControls([{lblENElementName, edtENElementName, spbENElement, spbENElementClear,} chbByMonths]);
  Height := btnOk.Top + btnOk.Height + 50;  
end;

procedure TfrmENPeriodWithRENTaskPlanFact.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';

  CheckListBox1.Checked[0]:= True ;
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.orderBySQL := 'typerefcode';

  if renCode > 0 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := renCode;
  end;
  // А для ХОЭ (renCode = 0) выбираем все объекты

  frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
  try
    frmENElementShow.isFiltered := true;
    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          elementCode := StrToInt(GetReturnValue(sgENElement,0));
          elementName := GetReturnValue(sgENElement,1);
          edtENElementName.Text := elementName;
          ///
         // if elementCode > 0 then chbByObjects.Checked := false;
         //  HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
 // HideControls([chbByObjects], false);  
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbENBudgetClick(Sender: TObject);
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
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgetName;
              ///
              if budgetCode > 0 then chbByBudgets.Checked := false;
              HideControls([chbByBudgets], (budgetCode > 0));
              ///
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENPeriodWithRENTaskPlanFact.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);
end;

procedure TfrmENPeriodWithRENTaskPlanFact.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
  reportName: String;
  i: Integer;
  strmanagement: String;
  strmanagementname : String;
begin
     if frmENPeriodWithRENTaskPlanFact.renName = '' then
      begin
        Application.MessageBox(PChar('Для формування звіту необхідно обов`язково вибрати підрозділ!!!'), PChar('Увага!'),MB_ICONWARNING);
        ModalResult := mrNone;
        Exit;
      end
    else
    begin
      /////// Parameters
      SetLength(argNames, 13);
      SetLength(args, 13);

      argNames[0] := 'pdatestart';
      args[0] :=  DateToStr( frmENPeriodWithRENTaskPlanFact.edtDateStart.date );

      argNames[1] := 'pdatefinal';
      args[1] := DateToStr( frmENPeriodWithRENTaskPlanFact.edtDateFinal.date );

      argnames[2] := 'renCode';
      args[2] := IntToStr(frmENPeriodWithRENTaskPlanFact.renCode);

      argnames[3] := 'renName';
      if frmENPeriodWithRENTaskPlanFact.renName <> '' then
        args[3] := frmENPeriodWithRENTaskPlanFact.renName
      else
        args[3] := 'ХОЕ';

     // argnames[4] := 'wholeYear';
     // args[4] := IntToStr(Ord(frmENPeriodWithRENTask.chbWholeYear.Checked));

      argnames[4] := 'dNameField';
      if frmENPeriodWithRENTaskPlanFact.chbByRENs.Checked then
        args[4] := 'd.name'
      else
        args[4] := '1';

      argnames[5] := 'objNameField';
      if frmENPeriodWithRENTaskPlanFact.chbByObjects.Checked then
        args[5] := '0'
      else
        args[5] := '1';

      argnames[6] := 'elementCode';
      args[6] := IntToStr(frmENPeriodWithRENTaskPlanFact.elementCode);

      argnames[7] := 'elementName';
      if frmENPeriodWithRENTaskPlanFact.elementName <> '' then
        args[7] := 'Об"єкт : ' + frmENPeriodWithRENTaskPlanFact.elementName + ' '
      else
        args[7] := '';

      argnames[8] := 'budgCode';
      args[8] := IntToStr(frmENPeriodWithRENTaskPlanFact.budgetCode);

      argnames[9] := 'budgName';
      args[9] := frmENPeriodWithRENTaskPlanFact.budgetName;



      strmanagement := '';
      strmanagementname := '';
      for i := 0 to CheckListBox1.Items.Count - 1 do
        if CheckListBox1.Checked[i] then
        begin
          AddListPos(strmanagement, IntToStr(i + 1));
        //  AddListPos(strmanagementname , CheckListBox1.Items[i]);
        end;

       if length(trim(strmanagement)) = 0 then
       begin
          Application.MessageBox(PChar('Оберіть обов`язково дирекцію   !!!'), PChar('Увага!'),MB_ICONWARNING);
          ModalResult:= mrNone;
          Exit;
       end;

      argnames[10] := 'managementCode';
      args[10] := '('+strmanagement+')';


      argnames[11] := 'transportation';

      if frmENPeriodWithRENTaskPlanFact.chktransportation.Checked = True then
      args[11] := '('+'500004872 , 500004873 , 500004874 , 500004875 , 500004876 , 500004877'+')'
      else args[11] := '('+'select code from tktechcard '+')';

      argnames[12] := 'transportationGen'; // параметр условие для главного отчета де выбираются коды планов
      if frmENPeriodWithRENTaskPlanFact.chktransportation.Checked = True then
      args[12] := ' and enp.code in ( select enplanworkitem.planrefcode From enplanworkitem , tktechcard '
                  + ' where tktechcard.code = enplanworkitem.kartarefcode '
                  + ' and tktechcard.code in (500004872 , 500004873 , 500004874 , 500004875 , 500004876 , 500004877) '
                  + ' ) ' 



      else args[12] := 'and 1 = 1 ';



    //  argnames[9] := 'managementName';
    //  args[9] := '('+strmanagementname+')';
{
dbNameField
budgCode
budgName
elementName
}
      ///////               8
      {if rbv1.Checked = true then
      reportName := 'TaskNormPlanFaktWorkByDate';
      if rbv2.Checked = true then
      reportName := 'TaskNormPlanFaktWorkByDateVAR2';
      if rbv3.Checked = true then }

    // reportName := 'TaskNormPlanFaktWorkByDateVAR3';
    // reportName := 'NpzAddition1Var3_no_fact/TaskNormPlanFaktWorkByDateVAR3';


   //   reportName := 'NpzAddition1Var3_npzplan_npzfact/TaskNormPlanFaktWorkByDateVAR3';

   {
     If RadioButton1.Checked = True then
      reportName := 'NpzAddition1Var3_npzplan_npzfact_YesNN/TaskNormPlanFaktWorkByDateVAR3'; // выводим отчет с подвязкой материалов к finmaterials
     If RadioButton2.Checked = True then
      reportName := 'NpzAddition1Var3_npzplan_npzfact_NotNN/TaskNormPlanFaktWorkByDateVAR3'; // выводим отчет без подвязки  материалов finmaterials
    }

      if not chbShowFinMaterials.Checked then
      begin
        if RadioButton1.Checked = True then
          reportName := 'NpzAddition1Var3_npzplan_npzfact_YesNN_OnDate/TaskNormPlanFaktWorkByDateVAR3'; // выводим отчет с подвязкой материалов к finmaterials
        if RadioButton2.Checked = True then
          reportName := 'NpzAddition1Var3_npzplan_npzfact_NotNN_OnDate/TaskNormPlanFaktWorkByDateVAR3'; // выводим отчет без подвязки  материалов finmaterials
      end
      else
        reportName := 'NpzAddition1Var3_plan_fact_NotNN_OnDate_with_fin/TaskNormPlanFaktWorkByDateVAR3'; // новая версия отчета с выводом привязанных материалов

      makeReport(reportName, argNames, args, 'xls');

    end;
 { finally
   frmENPeriodWithRENTaskPlanFact.Free;

  end;     }

end;

end.
