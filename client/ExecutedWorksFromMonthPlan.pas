unit ExecutedWorksFromMonthPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit , EnergyproController , DMReportsUnit,
  InvokeRegistry, Rio, SOAPHTTPClient , ENActController , ChildFormUnit , FINMaterialsController,
  CheckLst ;

type
  TfrmExecutedWorksFromMonthPlan = class(TDialogForm)
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label1: TLabel;
    dtpEndDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkAllAct: TCheckBox;
    spbEPRenClear: TSpeedButton;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblWorkState: TLabel;
    edtActType: TEdit;
    spbENPlanWorkState: TSpeedButton;
    spbTypeactClear: TSpeedButton;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbPodVidClear: TSpeedButton;
    Label2: TLabel;
    edtNumberAct: TEdit;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    spbFINExetutorClear: TSpeedButton;
    GroupBox3: TGroupBox;
    chkShowNoVikonWork: TCheckBox;
    chkStatusAct: TCheckBox;
    chkVar: TCheckBox;
    GroupBox1: TGroupBox;
    chkFormPlanPlan: TCheckBox;
    chkFormPlanPozaPlan: TCheckBox;
    Label3: TLabel;
    chkSumRepByWork: TCheckBox;
    Label4: TLabel;
    ListBudget: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    btnClearCleckList: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    HTTPRIOTENDepartment: THTTPRIO;
    chkOnlyDraftActStatus: TCheckBox;
    chkPlanStatus: TCheckBox;
    grpConsolid: TGroupBox;
    chkConsolid_by_podr: TCheckBox;
    chkShowBudjConsolid: TCheckBox;
    HTTPRIOFINExecutor: THTTPRIO;
    chkConsolid_by_podr_coef: TCheckBox;
    chbChildFinExecutor: TCheckBox;
    chkShowStatusPlan: TCheckBox;
    chkConsolidReport: TCheckBox;
    chkConsolid_for_tech_selector: TCheckBox;
    procedure btnOkClick(Sender: TObject);
    procedure chkAllActClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spbTypeactClearClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbPodVidClearClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure chkConsolid_for_tech_selectorClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
    procedure chkConsolid_by_podrClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure chkConsolidReportClick(Sender: TObject);
    procedure toggleChbChildFinExecutor;


  private
    { Private declarations }
  public
    { Public declarations }
    renCode: Integer;
    renName: String;
    budgCode: Integer;
    budgName: String;
    elementCode : integer;
    elementName : String;
    ActTypeCode : Integer;
    ActTypeName : String;
    WorkTypeCode : Integer ;
    WorkTypeName : String ;
    NumberActCode : Integer ;

    materialCode : Integer;
    materialName : String;


    finExecutor_name : String;
    finExecutor_finCode : String;
    finExecutor_axCode : String;

    wasSetAxapta : Boolean;

  end;

var
  frmExecutedWorksFromMonthPlan: TfrmExecutedWorksFromMonthPlan;

implementation

uses Math , ENDepartmentController, ENDepartmentTypeController , ShowENDepartment ,
 ENConsts , ShowENElement, ENElementController , ENElementTypeController ,
ShowENPlanWorkState , ENPlanWorkStateController , ShowENPlanWorkType , ENPlanWorkTypeController ,
EditENAct, EditENActFilter , ShowENAct  , ShowFINMaterials , ShowTKMaterials, TKMaterialsController ,
ShowFINExecutorTree , FINExecutorController , ENForImplementation, XSBuiltIns;

{$R *.dfm}

procedure TfrmExecutedWorksFromMonthPlan.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i : integer;
  ii : integer;
  strGroupmaterials : String;
  strBudget : string;
  countselbudj : Integer;
  strFinExecutorCodes : string;
  strFinExecutorAxCodes : string;
  isMDAX : TXSBoolean;
begin

  begin

  countselbudj := 0;
                 /// собираем строку кодов бюджетодержателей
   For ii:=0 to frmExecutedWorksFromMonthPlan.ListBudget.Count -1  do
    Begin

       if  frmExecutedWorksFromMonthPlan.ListBudget.Checked[ii] then
        if strBudget <>  '' then
           begin
           strBudget := strBudget + ' , ' + IntToStr(  Integer( frmExecutedWorksFromMonthPlan.ListBudget.Items.Objects[ii] ) );
           countselbudj:= countselbudj + 1;
           end
         else
          begin
           strBudget := strBudget + IntToStr(  Integer( frmExecutedWorksFromMonthPlan.ListBudget.Items.Objects[ii] ) ) ;
           countselbudj:= countselbudj + 1;
           end;

    End;

//     countselbudj:= frmExecutedWorksFromMonthPlan.ListBudget.Count;

     SetLength(argNames, 21);
     SetLength(args, 21);


     argNames[0] := 'datestart';
     args[0] := DateToStr(dtpStartDate.DateTime);

     argNames[1] := 'datefinal';
     args[1] := DateToStr(dtpEndDate.DateTime);

     argNames[2] := 'podr';
     args[2] :=  IntToStr(renCode);


     argNames[3] := 'budj';
     if countselbudj = 1 then
     begin
     budgCode:= StrToInt(strBudget);
     args[3] := IntToStr(budgCode);
     end
     else
     args[3] := '0';

     argNames[4] := 'enactcode';
     args[4] := IntToStr(NumberActCode);

     argNames[5]:= 'shownullfact';
     if chkShowNoVikonWork.Checked = true then
     args[5]:= '1'
     else
     args[5]:= '0';

     argNames[6] := 'typeact';
     args[6] :=  IntToStr(ActTypeCode);

     argNames[7] := 'actstatus';
     if chkStatusAct.Checked = true then
     args[7] :=  '0'  // черновые и проведеные нада показывать
     else
     args[7] := '3'; // только проведенные


     argNames[8] := 'finexecutorname';
     args[8]:= finExecutor_name;

     argNames[9] := 'finexecutorfincode';

     args[9]:=  finExecutor_finCode;


     argNames[10] := 'obj';
     args[10] :=  IntToStr(elementCode);

     if NumberActCode <> 0 then
      begin
        args[0] := '01.01.2000';
        args[1] := '01.01.3000';
        args[2] := '0';
        args[3] := '0';
        args[6] := '0';
        args[7] := '0';
        args[8] := '';
        args[9] := '0';
        args[10] := '0';
      end;

      argNames[11] := 'formplan';
      if ( (chkFormPlanPlan.Checked = true) and (chkFormPlanPozaPlan.Checked = true) )then
      args[11] := '0' ;
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = false) )then
      args[11] := '0' ;
      if ( (chkFormPlanPlan.Checked = true) and (chkFormPlanPozaPlan.Checked = false) )then
      args[11] := '1' ; // плановые работы
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = true) )then
      args[11] := '2' ; //  позаплановые работы

      argNames[12] := 'podrname';
      args[12] := renName;

      argNames[13] := 'budjname';
      args[13] := budgName;


        argnames[14] := 'budgetstringcode';
       if strBudget <> '' then
       args[14] :=  ' enp.budgetrefcode in (  ' + strBudget + ')'
       else
       args[14] := ' 1 = 1 ';

       argnames[15] := 'onlydraftactstatus';
       if chkOnlyDraftActStatus.Checked = true
       then
       args[15] := '1'
       else
       args[15] := '0';

       argnames[16] := 'planstatus';
       if chkPlanStatus.Checked = true
       then
       args[16] := '-8'
       else
       args[16] := '0';

       argNames[17] := 'worktypecode';
       args[17] := IntToStr(worktypecode) ;

       argNames[18] := 'finexecutoraxcode';
       args[18]:=  finExecutor_axCode;

       if chbChildFinExecutor.Checked then begin

          isMDAX := TXSBoolean.Create;
          isMDAX.AsBoolean := false;
          if wasSetAxapta then begin
            strFinExecutorCodes := finExecutor_finCode;
          end else begin
            strFinExecutorCodes := DMReports.getStrAllFINExecutorIdsByParent(finExecutor_finCode, isMDAX);
          end;
          isMDAX := TXSBoolean.Create;
          isMDAX.AsBoolean := true;

          strFinExecutorAxCodes := DMReports.getStrAllFINExecutorIdsByParent(finExecutor_axCode, isMDAX);
       end else begin
          strFinExecutorCodes := finExecutor_finCode;
          strFinExecutorAxCodes := chr(39) + finExecutor_axCode + chr(39);
       end;

       argNames[19] := 'conditionExecutor';
       if ((finExecutor_finCode <> '') or (finExecutor_axCode <> ''))  then
       begin
         if (finExecutor_finCode <> '') then
           args[19]:=  ' finexecutorfincode::varchar in( ' + strFinExecutorCodes + ')' ;
         if (finExecutor_axCode <> '') then
           if ( length(args[19]) ) > 0  then
             args[19]:= args[19] + ' or  finexecutoraxcode in( ' + strFinExecutorAxCodes +  ')'
           else
             args[19]:= ' finexecutoraxcode in( ' +  strFinExecutorAxCodes + ')';
            args[19]:= '('+args[19]+')';
       end
        else
         args[19]:= '(1=1)';

       argNames[20] := 'budjname';
       args[20] :=  IntToStr(renCode);


        if ((chkConsolid_by_podr.Checked) and ( chkShowBudjConsolid.Checked = false )) then
        begin
          reportName := 'WorkByAkt/Consolid_podr/gray_lanscape'; // консолидированный по подразделениям
        end
        else
        if ((chkConsolid_by_podr.Checked) and ( chkShowBudjConsolid.Checked = true )) then
        begin
          reportName := 'WorkByAkt/Consolid_podr_budg/gray_lanscape'; // консолидированный по подразделениям  и бюджетодержателю
        end
        else
        Begin

        if ( ( rencode  <> 0 ) and ( budgCode <> 0 )) then
        // reportName := 'WorkByAkt/ByMonthPlan/gray_lanscape_notcol_budj_podr' // вариант без колонок подразделения и бюджетодержателя
         reportName := 'WorkByAkt/ByMonthPlan2/gray_lanscape' // выборка из мес планов временно
        else
        // reportName := 'WorkByAkt/ByMonthPlan/gray_lanscape'; // выборка из мес планов
         reportName := 'WorkByAkt/ByMonthPlan2/gray_lanscape'; // выборка из мес планов

        if chkSumRepByWork.Checked = true then
        reportName := 'WorkByAkt/SumWorkByMonthPlan/MonthWork';
        end;

        if chkConsolid_by_podr_coef.Checked = true  then
        begin
          reportName := 'WorkByAkt/Consolid_podr_coef/gray_lanscape'; // консолидированный по подразделениям с коеф загрузки
        end ;

        if chkConsolidReport.Checked = true then
        begin
           reportName := 'WorkByAkt/Consolid_hoe/consolid_hoe'; // консолидированный по HOE
        end;

        if chkShowStatusPlan.Checked = true then
        begin
           reportName := 'WorkByAkt/ByMonthPlanWithStatus/gray_lanscapeWithStatus'; // со статусом месячного плана
        end;

        if chkConsolid_for_tech_selector.Checked = true then
        begin
           reportName := 'WorkByAkt/Consolid_hoe/consolid_hoe_for_tech_selector'; // консолидированный по HOE для селектора
        end;

     makeReport(reportName, argNames, args, 'xls');
  end;

end;

procedure TfrmExecutedWorksFromMonthPlan.chkAllActClick(Sender: TObject);
begin
   if chkAllAct.Checked then
   begin
   DisableControls([ dtpStartDate , dtpEndDate ]);
   dtpStartDate.Checked:= false;
   dtpEndDate.Checked:= false;
   end
   else
   begin
   DisableControls([ dtpStartDate , dtpEndDate ],false);

   end;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbENBudgetClick(Sender: TObject);
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


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbEPRenClearClick(Sender: TObject);
begin


  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmExecutedWorksFromMonthPlan.spbEPRenClick(Sender: TObject);
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

procedure TfrmExecutedWorksFromMonthPlan.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';

end;

procedure TfrmExecutedWorksFromMonthPlan.FormCreate(Sender: TObject);
begin
   renCode:= 0;
   budgCode:= 0;
   elementCode :=0 ;
   ActTypeCode :=0 ;
   WorkTypeCode :=0 ;
   NumberActCode := 0;
   materialCode := -1;
   finExecutor_finCode := '';
   finExecutor_name:= '';
   finExecutor_axCode := '';
   wasSetAxapta := false;

   
end;

procedure TfrmExecutedWorksFromMonthPlan.spbENElementClick(Sender: TObject);

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


procedure TfrmExecutedWorksFromMonthPlan.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

end;

procedure TfrmExecutedWorksFromMonthPlan.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;

  TempTKMaterials: TKMaterialsControllerSoapPort;
  ti: Integer;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;

  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin
  DisableControls([edtEPRenName, edtENElementName, edtActType , edtTypeName , edtNumberAct
                   , edtFINExecutorName ]);


  { заполняем выпадающий список типов объектов }
  cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';  
  f.orderBySQL := 'code';

  cbElementType.Items.Add('');

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


    // TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
    // TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);

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


     /// подымаем поля вверх

        {   lblExecuter.Top := 130 ;
           edtFINExecutorName.Top := 130;
           spbFINExecutor.Top := 130;
           spbFINExetutorClear.Top  := 130;


           lblENElementName.Top := 160;
           edtENElementName.Top := 160;
           spbENElement.Top := 160;
           spbENElementClear.Top := 160;

           Label2.Top := 200;
           edtNumberAct.Top := 200;
           SpeedButton3.Top := 200;
           SpeedButton4.Top := 200;



           lblWorkState.Top := 240;
           edtActType.Top := 240;
           spbENPlanWorkState.Top := 240;
           spbTypeactClear.Top := 240;

           GroupBox3.Top := 280;

           GroupBox1.top := 200;


           Btnok.Top := 350;
           BtnCancel.Top := 350;


           frmExecutedWorksFromMonthPlan.Height := 500;    }

           DisableControls([chkShowBudjConsolid]);

end;

procedure TfrmExecutedWorksFromMonthPlan.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin
      DisableActions([ actEdit, actInsert ],DialogState = dsView  );
        if ShowModal = mrOk then
        begin
            try
              // if ENPlanWorkFilterObj.stateRef = nil then ENPlanWorkFilterObj.stateRef := ENPlanWorkStateRef.Create();
              // ENPlanWorkFilterObj.stateRef.code := StrToInt(GetReturnValue(sgENPlanWorkState,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtActType.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               ActTypeCode:= StrToInt(GetReturnValue(sgENPlanWorkState,0));
               ActTypeName:= GetReturnValue(sgENPlanWorkState,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbTypeactClearClick(Sender: TObject);
begin
  ActTypeCode := 0 ;
  ActTypeName := ' ' ;
  edtActType.Text := '' ;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbTypeClearClick(Sender: TObject);
begin
  inherited;
   edtTypeName.Text:= '';
   WorkTypeCode := 0;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbTypeClick(Sender: TObject);
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

              // ENPlanWorkFilterObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));//ENDepartmentShort(tvDep.Selected.Data).code;
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

procedure TfrmExecutedWorksFromMonthPlan.spbPodVidClearClick(Sender: TObject);
begin
  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;

end;

procedure TfrmExecutedWorksFromMonthPlan.SpeedButton3Click(Sender: TObject);
 var
 frmENActShow : TfrmENActShow;
   f : ENActFilter;
begin
 frmENActShow:= TfrmENActShow.Create(Application,fmNormal);
   try
      with frmENActShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtNumberAct.Text:= GetReturnValue(sgENAct,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               NumberActCode :=   StrToInt(GetReturnValue(sgENAct,0));

               // обнуляем остальные параметры с очищением полей
                  if   NumberActCode > 0 then
                  begin
                    spbEPRenClear.Click();
                    spbENElementClear.Click();
                    cbElementType.ItemIndex:= -1;
                    spbTypeactClear.Click();
                    cbENPlanWorkFormName.ItemIndex := -1;
                    spbPodVidClear.Click();

                    
                  end;


            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENActShow.Free;
   end;


end;

procedure TfrmExecutedWorksFromMonthPlan.SpeedButton4Click(Sender: TObject);
begin

   edtNumberAct.Text := '';
   NumberActCode:= 0 ;

end;

procedure TfrmExecutedWorksFromMonthPlan.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmExecutedWorksFromMonthPlan.btnClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmExecutedWorksFromMonthPlan.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin

end;

procedure TfrmExecutedWorksFromMonthPlan.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';


end;

procedure TfrmExecutedWorksFromMonthPlan.chkConsolid_for_tech_selectorClick(Sender: TObject);
begin

    inherited;
    if chkConsolid_for_tech_selector.Checked = true then
    begin
      renCode:= 0;
      edtEPRenName.Text:= '';
      DisableControls([spbEPRen , spbEPRenClear ]);

      finExecutor_finCode := '';
      finExecutor_name:= '';
      finExecutor_axCode := '';
      edtFINExecutorName.Text:= '';
      DisableControls([spbFINExecutor , spbFINExetutorClear ]);
    end
    else
    begin
     DisableControls([spbEPRen , spbEPRenClear ] , false);
     DisableControls([spbFINExecutor , spbFINExetutorClear ] , false);
    end;
end;



procedure TfrmExecutedWorksFromMonthPlan.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
   TempFINExecutor : FINExecutorControllerSoapPort;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
    TempFINExecutor := HTTPRIOFINExecutor as FINExecutorControllerSoapPort;
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
               finExecutor_name := DMReports.getFullExecutorName(tvDep.Selected); //FINExecutorShort(tvDep.Selected.Data).name;
               if FINExecutorShort(tvDep.Selected.Data).finCode <> LOW_INT then
               finExecutor_finCode := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode);

               finExecutor_axCode := FINExecutorShort(tvDep.Selected.Data).axOrgId;
               toggleChbChildFinExecutor;
               if( (finExecutor_finCode = '')  and ( finExecutor_axCode <> '' )  )
               then
               begin
                wasSetAxapta := true;
                finExecutor_finCode := TempFINExecutor.getpodrFinCodeBypodrAxCodeFromFinexecutor(finExecutor_axCode);
               end;

               edtFINExecutorName.Text := finExecutor_name ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmExecutedWorksFromMonthPlan.spbFINExetutorClearClick(
  Sender: TObject);
begin

   edtFINExecutorName.Text := '';
   finExecutor_finCode:= '';
   finExecutor_axCode := '';
   toggleChbChildFinExecutor;
end;

procedure TfrmExecutedWorksFromMonthPlan.chkConsolidReportClick(
  Sender: TObject);
begin
  inherited;
    if chkConsolidReport.Checked = true then
    begin
      renCode:= 0;
      edtEPRenName.Text:= '';
      DisableControls([spbEPRen , spbEPRenClear ]);

      finExecutor_finCode := '';
      finExecutor_name:= '';
      finExecutor_axCode := '';
      edtFINExecutorName.Text:= '';
      DisableControls([spbFINExecutor , spbFINExetutorClear ]);
    end
    else
    begin
     DisableControls([spbEPRen , spbEPRenClear ] , false);
     DisableControls([spbFINExecutor , spbFINExetutorClear ] , false);
    end;
end;

procedure TfrmExecutedWorksFromMonthPlan.chkConsolid_by_podrClick(
  Sender: TObject);
begin
 // inherited;
     if chkConsolid_by_podr.Checked then
     DisableControls([chkShowBudjConsolid],false)
     else
     begin
     DisableControls([chkShowBudjConsolid]);
     chkShowBudjConsolid.Checked := False;
     end;

end;

procedure TfrmExecutedWorksFromMonthPlan.toggleChbChildFinExecutor;
begin
  if (DMReports.UsesMDAXData) then begin
  {haha}
    {  finExecutor_finCode : String;
    finExecutor_axCode : String;}
    if (Length(finExecutor_axCode) > 0) then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;

  end else begin
    if (Length(finExecutor_finCode) > 0) then begin
        chbChildFinExecutor.Visible := True;
        chbChildFinExecutor.Checked := False;
    end else begin
        chbChildFinExecutor.Visible := False;
        chbChildFinExecutor.Checked := False;
    end;
  end;
end;

end.
