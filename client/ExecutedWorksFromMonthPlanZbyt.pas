unit ExecutedWorksFromMonthPlanZbyt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit , EnergyproController , DMReportsUnit,
  InvokeRegistry, Rio, SOAPHTTPClient , ENActController , ChildFormUnit , FINMaterialsController,
  CheckLst , DateUtils, AdvListBox, ColListb, Grids, AdvObj, BaseGrid, AdvGrid,
  ExtCtrls ;

type
  TfrmExecutedWorksFromMonthPlanZbyt = class(TDialogForm)
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
    HTTPRIOENElementType: THTTPRIO;
    lblPlanWorkForm: TLabel;
    cbENPlanWorkFormName: TComboBox;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbPodVidClear: TSpeedButton;
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
    HTTPRIOTENDepartment: THTTPRIO;
    gbPlanFactStatus: TGroupBox;
    chkENPLANWORKSTATUS_GOOD: TCheckBox;
    ENPLANWORKSTATUS_LOCKED: TCheckBox;
    Button1: TButton;
    HTTPRIOENReportAdditionZbytMetrology: THTTPRIO;
    sgENReportAdditionZbytMetrology: TAdvStringGrid;
    chbCheckAll: TCheckBox;
    RadioGroup1: TRadioGroup;
    rbkindyear: TRadioButton;
    rbkinfmonth: TRadioButton;
    chkConsolidReportRUTA: TCheckBox;
    chkConsolidReportRUKOE: TCheckBox;
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
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);

    procedure SelectAvailableAddition(Sender: TObject);
    procedure dtpStartDateCloseUp(Sender: TObject);
    procedure dtpEndDateCloseUp(Sender: TObject);
    procedure chkConsolidReportRUTAClick(Sender: TObject);
    procedure chkConsolidReportRUKOEClick(Sender: TObject);

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
    finExecutor_code : String;

    report_vid : Integer; //(1-енергосбіт  2- метрология )
    ruta_rukoee : String; //
  end;

var
  frmExecutedWorksFromMonthPlanZbyt: TfrmExecutedWorksFromMonthPlanZbyt;

  ENReportAdditionZbytMetrologyHeaders: array [1..5] of String =
        ( 'Код'
          ,'Код работы'
          ,'isservices'
          ,'zbytOrmetrology'
          ,'Найменування додатка '
        );

implementation

uses Math , ENDepartmentController, ENDepartmentTypeController , ShowENDepartment ,
 ENConsts , ShowENElement, ENElementController , ENElementTypeController ,
ShowENPlanWorkState , ENPlanWorkStateController , ShowENPlanWorkType , ENPlanWorkTypeController ,
EditENAct, EditENActFilter , ShowENAct  , ShowFINMaterials , ShowTKMaterials, TKMaterialsController ,
ShowFINExecutorTree , FINExecutorController , ENForImplementation,
  ENReportAdditionZbytMetrologyController, EnergyproController2,
  GridHeadersUnit;

{$R *.dfm}

procedure TfrmExecutedWorksFromMonthPlanZbyt.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i : integer;
  ii : integer;
  strGroupmaterials : String;
  strBudget : string;
  countselbudj : Integer;
  fileName : String;
  position :Integer;
  state_ : boolean;
  m_end,d_end,y_end:word;
  m_start,d_start,y_start:word;

begin

      DecodeDate(dtpEndDate.DateTime,y_end,m_end,d_end);
      DecodeDate(dtpStartDate.DateTime,y_start,m_start,d_start);

      if ( y_start  <> y_end ) then
      begin
         ShowMessage('Період повинен бути в межах року !!! ');
         exit;
      end;

  begin

     countselbudj := 0;

     SetLength(argNames, 23);
     SetLength(args, 23);


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

     argNames[9] := 'finexecutorcode';
     args[9]:=  finExecutor_code;


     argNames[10] := 'obj';
     args[10] :=  IntToStr(elementCode);



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



       argNames[16] := 'statusplanfact';
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[16] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[16] := '1' ; // черновые
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '3' ; //  утвержденные


       argNames[17] := 'worktypecode';
       args[17] := IntToStr(worktypecode) ;


       argNames[20] := 'pwkindcode';
       if rbkindyear.Checked then
       args[20] := IntToStr(1)
        else
       args[20] := IntToStr(2);

       argNames[21] := 'ruta_rukoee';
       args[21] := ruta_rukoee;

        if report_vid = 1 then
          if ((chkConsolidReportRUTA.Checked = true) or ( chkConsolidReportRUKOE.Checked = true)) then
          begin
            if( chkConsolidReportRUTA.Checked = true ) then
             begin
              //reportName := 'Zbyt/planFactWorkZbytConsolid';
              reportName := 'Zbyt/planFactWorkConsolidRUTA';
              makeReport(reportName, argNames, args, 'xls');
             end;

             if chkConsolidReportRUKOE.Checked = true then
             begin

              reportName := 'Zbyt/planFactWorkConsolidRUKOE';
              makeReport(reportName, argNames, args, 'xls');
             end;
          end
           else
          begin
            reportName := 'Zbyt/planFactWorkZbyt'; //!!!!!!! 03,03,2017  временно закроем т.к нужно перепроверять и согласовать как он должен работать
                                                  //  например на факте если привязываться к штатному то тогда не попадут наверное кол-во тех работ где привязаны без признака НВЗ
                                                  ///   reportName := 'Zbyt/PlanFact/Main'; 07.02.2017 Семенцова сказала что бы отчет работал по типу как одаток 3
            makeReportWithExecute(reportName, argNames, args, 'xls', 'ПланФактРоботиЕнергозбут');
          end
        else if report_vid = 2 then
          begin
           reportName := 'Metrology/planFactWorkMetrology';
           makeReportWithExecute(reportName, argNames, args, 'xls', 'ПланФактРоботиМетрологія');
          end
        else if report_vid = 3 then   // тестовая версия енергосбыт так как додаток 3
          begin
           reportName := 'Zbyt/PlanFact/Main';
           makeReportWithExecute(reportName, argNames, args, 'xls', 'ПланФактРоботиЕнергозбут');
          end ;




     {  if report_vid = 1  then // енергосбыт
       
        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  ((Integer( chkListWorks.Items.Objects[i])  <>  2140004643)
                and (Integer( chkListWorks.Items.Objects[i])  <> 2140004652)
                and (Integer( chkListWorks.Items.Objects[i])  <> 2140004656)) then
                   args[18] := ' tc.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') '
                else
                   args[18] := ' tkcl.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') ';

               argNames[19] := 'nameDodatok';
               args[19] := chkListWorks.Items[i]  ;

                reportName := 'Zbyt/planFactWorkZbytDodatok';

                position := AnsiPos('. ', chkListWorks.Items[i]);
                fileName:= copy(chkListWorks.Items[i],1,position-1);

                makeReportWithExecute(reportName, argNames, args, 'xls', fileName);
            end;


        End;

        if report_vid = 2  then // метрология
        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  (   // типа разделим или техкарты(tc.code) или коды классификации (tkcl.code)
                (Integer( chkListWorks.Items.Objects[i])  <>  1040005208)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004837)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040002648)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004839)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004840)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040002665)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004841)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004842)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040005207)

                ) then
                   args[18] := ' tc.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') '
                else
                   args[18] := ' tkcl.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') ';

               argNames[19] := 'nameDodatok';
               args[19] := chkListWorks.Items[i]  ;

                reportName := 'Metrology/planFactWorkMetrologyDodatok';

                position := AnsiPos('. ', chkListWorks.Items[i]);
                fileName:= copy(chkListWorks.Items[i],1,position-1);

                makeReportWithExecute(reportName, argNames, args, 'xls', fileName);
            end;


        End; }

        for i:=1 to sgENReportAdditionZbytMetrology.RowCount - 1 do
      begin
         sgENReportAdditionZbytMetrology.GetCheckBoxState(4,i,state_);
         if state_ then
         begin
            argNames[18] := 'conditionTechcard';

            if StrToInt( sgENReportAdditionZbytMetrology.Cells[2, i ]) <> 1
            then
             args[18] := ' tc.code in (' + sgENReportAdditionZbytMetrology.Cells[1, i ] + ') '
            else
             args[18] := ' tkcl.code in (' + sgENReportAdditionZbytMetrology.Cells[1, i ] + ') ';

            argNames[19] := 'nameDodatok';
            args[19] := sgENReportAdditionZbytMetrology.Cells[4, i ]  ;



            if sgENReportAdditionZbytMetrology.Cells[3, i ] = 'zbyt' then
             begin
              // 01.03.2016 по техкарте code = 2017041445 Салыгин сказал нужно показывать конкретные точки учета по которым были оформлены акты
             if ( sgENReportAdditionZbytMetrology.Cells[1, i ] = '2017041445' ) then
              reportName := 'Zbyt/planFactWorkZbytDodatok_004060501'
              else
              reportName := 'Zbyt/planFactWorkZbytDodatok';
            end
            else if sgENReportAdditionZbytMetrology.Cells[3, i ] = 'metrology' then
            reportName := 'Metrology/planFactWorkMetrologyDodatok'
            else
            reportName :='';


            position := AnsiPos('. ', sgENReportAdditionZbytMetrology.Cells[4, i ]);
            fileName:= copy(sgENReportAdditionZbytMetrology.Cells[4, i ],1,position-1);

            makeReportWithExecute(reportName, argNames, args, 'xls', fileName);

         end;
      end;

  end;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.chkAllActClick(Sender: TObject);
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.chkConsolidReportRUKOEClick(
  Sender: TObject);
begin
  inherited;
  if chkConsolidReportRUKOE.Checked then
  begin
    edtEPRenName.Text:= '';
    spbEPRen.Enabled:= false;
    spbEPRenClear.Enabled:= false;
    renCode := 1;
  end
  else
  begin
    spbEPRen.Enabled:= true;
    spbEPRenClear.Enabled:= true;
  end;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.chkConsolidReportRUTAClick(
  Sender: TObject);
begin
  inherited;
  if chkConsolidReportRUTA.Checked then
  begin
    edtEPRenName.Text:= '';
    spbEPRen.Enabled:= false;
    spbEPRenClear.Enabled:= false;
    renCode := 1;
  end
  else
  begin
    spbEPRen.Enabled:= true;
    spbEPRenClear.Enabled:= true;
  end;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.dtpEndDateCloseUp(Sender: TObject);
begin

  SelectAvailableAddition(Sender);
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.dtpStartDateCloseUp(
  Sender: TObject);
begin

    SelectAvailableAddition(Sender);
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbENBudgetClick(Sender: TObject);
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbEPRenClearClick(Sender: TObject);
begin


  renCode := 1;
  renName := 'ХерсонОблЕнерго';
  edtEPRenName.Text := '';
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbEPRenClick(Sender: TObject);
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.FormCreate(Sender: TObject);
begin
   renCode := 1; // подразделение 'ХерсонОблЕнерго'
   renName := 'ХерсонОблЕнерго';
   budgCode:= 0;
   elementCode :=0 ;
   ActTypeCode :=0 ;
   WorkTypeCode :=0 ;
   NumberActCode := 0;
   materialCode := -1;
   finExecutor_code := '';
   finExecutor_name:= '';
   

   
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbENElementClick(Sender: TObject);

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


procedure TfrmExecutedWorksFromMonthPlanZbyt.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.FormShow(Sender: TObject);
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

  m,d,y:word;
  countdodatok , LastCount : Integer;

  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;

  ENReportAdditionZbytMetrologyList: ENReportAdditionZbytMetrologyShortList;
  reportaditionFilter : ENReportAdditionZbytMetrologyFilter;
begin
  chkConsolidReportRUTA.Checked:= False;
    chkConsolidReportRUKOE.Checked:= False;
  DisableControls([edtEPRenName, edtENElementName,  edtTypeName
                   , edtFINExecutorName ]);

  chkConsolidReportRUTA.Visible := report_vid = 1 ;
  chkConsolidReportRUKOE.Visible := report_vid = 1;
  { заполняем выпадающий список типов объектов }


  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';  
  f.orderBySQL := 'code';



  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);




  DecodeDate(now,y,m,d);
  dtpEndDate.DateTime := EndOfAMonth(y, m);
  dtpEndDate.Checked := true;

  dtpStartDate.DateTime := EncodeDate(y,m,1);
  dtpStartDate.Checked := true;

  ///

  if report_vid = 2 then
  HideControls([RadioGroup1 , rbkindyear , rbkinfmonth]);

  SelectAvailableAddition(Sender);

  if ruta_rukoee='rukoee' then
   begin
     chkConsolidReportRUTA.Visible:= False;
     chkConsolidReportRUKOE.Visible := True;
   end;

  {SetGridHeaders(ENReportAdditionZbytMetrologyHeaders, sgENReportAdditionZbytMetrology.ColumnHeaders);
  TempENReportAdditionZbytMetrology :=  HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;


     reportaditionFilter := ENReportAdditionZbytMetrologyFilter.Create;
     SetNullIntProps(reportaditionFilter);
     SetNullXSProps(reportaditionFilter);



  if report_vid = 1  then
  reportaditionFilter.zbytOrmetrology := 'zbyt'
  else
  reportaditionFilter.zbytOrmetrology := 'metrology';
  reportaditionFilter.orderBySQL := 'code';


  ENReportAdditionZbytMetrologyList := TempENReportAdditionZbytMetrology.getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter(reportaditionFilter),0,-1);


  LastCount:=High(ENReportAdditionZbytMetrologyList.list);

  if LastCount > -1 then
     sgENReportAdditionZbytMetrology.RowCount:=LastCount+2
  else
     sgENReportAdditionZbytMetrology.RowCount:=2;

   with sgENReportAdditionZbytMetrology do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReportAdditionZbytMetrologyList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].code)
        else
        Cells[0,i+1] := '';


        Cells[1,i+1] := ENReportAdditionZbytMetrologyList.list[i].workCode;

        if ENReportAdditionZbytMetrologyList.list[i].isServices = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].isServices);
        Cells[3,i+1] := ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology;

        AddCheckBox(4,i+1,false, false);
        Cells[4,i+1] := ENReportAdditionZbytMetrologyList.list[i].name;


      end;

   sgENReportAdditionZbytMetrology.Row:=1;  }


{chkListWorks.Items.Clear;
if report_vid = 1  then // додатки для енергосбыта
begin
      chkListWorks.Items.AddObject('Додаток1. Планова заміна однофазного електролічильника в приватному будинку (на дерев''''яному, карболітовому, металевому щитах) 3 пояс' , TObject(75001315) );
      chkListWorks.Items.AddObject('Додаток2. Планова заміна однофазного електролічильника в приватному будинку (на дерев''''яному, карболітовому, металевому щитах) 4 пояс' , TObject(75001316) );
      chkListWorks.Items.AddObject('Додаток3. Планова заміна однофазного електролічильника (на карболіті, дереві, мармурі) 1 пояс' , TObject(75001311) );
      chkListWorks.Items.AddObject('Додаток4. Планова заміна однофазного електролічильника (на карболіті, дереві, мармурі) 3 пояс' , TObject(75001313) );
      chkListWorks.Items.AddObject('Додаток5. Планова заміна однофазного електролічильника (сільська місцевість) 2 пояс' , TObject(75001318) );
      chkListWorks.Items.AddObject('Додаток6. Планова заміна однофазного електролічильника (сільська місцевість) 3 пояс' , TObject(75001319) );
      chkListWorks.Items.AddObject('Додаток7. Планова заміна однофазного електролічильника (сільська місцевість) 4 пояс' , TObject(75001320) );


       chkListWorks.Items.AddObject('Додаток8. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом 1 пояс' , TObject(75001302) );
       chkListWorks.Items.AddObject('Додаток9. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом 2 пояс' , TObject(75001303) );
       chkListWorks.Items.AddObject('Додаток10. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом 3 пояс' , TObject(75001304) );
       chkListWorks.Items.AddObject('Додаток11. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом 4 пояс' , TObject(75001305) );
       chkListWorks.Items.AddObject('Додаток12. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом (сільська місцевість) 1 пояс' , TObject(75001307 ) );
       chkListWorks.Items.AddObject('Додаток13. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом (сільська місцевість) 2 пояс' , TObject(75001308 ) );
       chkListWorks.Items.AddObject('Додаток14. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом (сільська місцевість) 3 пояс' , TObject(75001309 ) );
       chkListWorks.Items.AddObject('Додаток15. Заміна однофазного електролічильника за дефектами і згідно з поодиноким нарядом (сільська місцевість) 4 пояс' , TObject(75001310 ) );
       chkListWorks.Items.AddObject('Додаток16. Планова заміна однофазного електролічильника (на карболіті, дереві, мармурі) 2 пояс' , TObject(75001312 ) );
       chkListWorks.Items.AddObject('Додаток17. Заміна однофазного відгалуження двожильним СІП від ПЛ-0,4 кВ до вводу в будівлю (споруду)' , TObject(75001416 ) );
       chkListWorks.Items.AddObject('Додаток18. Заміна трифазного електролічильника прямого вмикання 1 пояс' , TObject(75001707 ) );
       chkListWorks.Items.AddObject('Додаток19. Заміна трифазного електролічильника прямого вмикання 2 пояс' , TObject(75001708 ) );
       chkListWorks.Items.AddObject('Додаток20. Заміна трифазного електролічильника прямого вмикання (сільська місцевість) 1 пояс' , TObject(75001709 ) );
       chkListWorks.Items.AddObject('Додаток21. Заміна трифазного електролічильника прямого вмикання (сільська місцевість) 3 пояс' , TObject(75001711 ) );
       chkListWorks.Items.AddObject('Додаток22. Заміна трифазного електролічильника прямого вмикання (сільська місцевість) 4 пояс' , TObject(75001712 ) );
       chkListWorks.Items.AddObject('Додаток23. Заміна трифазного електролічильника згідно з поодиноким нарядом 3 пояс' , TObject(75001715 ) );
       chkListWorks.Items.AddObject('Додаток24. Заміна трифазного електролічильника згідно з поодиноким нарядом 4 пояс' , TObject(75001717 ) );
       chkListWorks.Items.AddObject('Додаток25. Заміна 1-ф автоматичного вимикача з завищеним номінальним струмому побутового споживача' , TObject(500011756 ) );
       chkListWorks.Items.AddObject('Додаток26. Заміна корпусу пошкодженої 1-ф ввідно-облікової шафи' , TObject(500011768 ) );
       chkListWorks.Items.AddObject('Додаток27. Заміна корпусу пошкодженої 3-ф ввідно-облікової шафи' , TObject(500011776 ) );
       chkListWorks.Items.AddObject('Додаток28. Заміна 3-ф автоматичного вимикача з завищеним номінальним струмом у побутового споживача' , TObject(500011784 ) );
       chkListWorks.Items.AddObject('Додаток29. Заміна пошкодженого оглядового скла 1-ф або 3-ф ввідно-облікової шафи.' , TObject(500012312 ) );
       chkListWorks.Items.AddObject('Додаток30. Заміна 1-ф автоматичного вимикача у побутового споживача' , TObject(2017018182 ) );
       chkListWorks.Items.AddObject('Додаток31. Заміна 3-ф автоматичного вимикача у побутового споживача' , TObject(2017018183 ) );
       chkListWorks.Items.AddObject('Додаток32. Заміна 1-ф автоматичного вимикача у побутового споживача із матеріала замовника' , TObject(2017018184 ) );
       chkListWorks.Items.AddObject('Додаток33. Заміна 3-ф автоматичного вимикача у побутового споживача із матеріала замовника' , TObject(2017018185 ) );
       chkListWorks.Items.AddObject('Додаток34. Заміна трифазного приладу обліку електроенергії за заявкою юридичного або побутового споживача' , TObject(2140004643 ) );
       chkListWorks.Items.AddObject('Додаток35. Заміна однофазного приладу обліку електроенергії за заявкою юридичного або побутового споживача в умовах підвищеної небезпеки' , TObject(2140004652 ) );
       chkListWorks.Items.AddObject('Додаток36. Заміна трифазного приладу обліку електроенергії за заявкою юридичного або побутового споживача' , TObject(2140004656 ) );
       chkListWorks.Items.AddObject('Додаток37. Встановлення шафи ввідно-облікової з встановленням 1-ф ізольованого вводу без переносу приладу обліку' , TObject(500020889 ) );
       chkListWorks.Items.AddObject('Додаток38. Встановлення шафи ввідно-облікової з встановленням 3-ф ізольованого вводу без переносу приладу обліку' , TObject(500020891 ) );
        // new not services

        chkListWorks.Items.AddObject('Додаток39. 110701 Виконання заміру навантажень по лініям від ТП при проведенні рейду' , TObject(2017017849 ) );
      chkListWorks.Items.AddObject('Додаток40. 110702 Виконання перевірки приладу обліку електроенергії при проведенні рейду' , TObject(2017017850 ) );
      chkListWorks.Items.AddObject('Додаток41. 2204 Відключення від електромереж живлення в електролічильнику ' , TObject(500004821 ) );
      chkListWorks.Items.AddObject('Додаток42. 070201 Відключення електроустановок юридичного/побутового споживача від електричної мережі ВРП до 1000В однофазний ввід (електроустановки споживача)' , TObject(2017017845 ) );
      chkListWorks.Items.AddObject('Додаток43. 070204 Відключення електроустановок юридичного/побутового споживача від електричної мережі у ВРП до 1000В однофазний ввід (електроустановки компанії)' , TObject(2017017865 ) );
      chkListWorks.Items.AddObject('Додаток44. 070205 Відключення електроустановок юридичного/побутового споживача від електричної мережі у ВРП до 1000В трифазний ввід (електроустановки Компанії)' , TObject(2017017866 ) );
      chkListWorks.Items.AddObject('Додаток45. 070202 Відключення  електроустановок юридичного/побутового  споживача від електричної мережі у ВРП до 1000В  трифазний  ввід  (електроустановки споживача)' , TObject(2017017846 ) );
      chkListWorks.Items.AddObject('Додаток46. 01050101 Відключення і підключення однофазного електролічильника за нарядом 3 пояс' , TObject(75001341 ) );
      chkListWorks.Items.AddObject('Додаток47. 01050102 Відключення і підключення однофазного електролічильника за нарядом 4 пояс' , TObject(75001342 ) );
      chkListWorks.Items.AddObject('Додаток48. 070101 Відключення юридичного (побутового) споживача від електромережі на опорі ПЛ до 1000 В (однофазний увід)' , TObject(500012854 ) );
      chkListWorks.Items.AddObject('Додаток49. 070101 Відключення юридичного (побутового) споживача від електромережі на опорі ПЛ до 1000В  (однофазний увід)' , TObject(500012855 ) );
      chkListWorks.Items.AddObject('Додаток50. 070102 Відключення юридичного (побутового) споживача від електромережі на опорі ПЛ до 1000В (трьохфазний увід)' , TObject(500012856 ) );
      chkListWorks.Items.AddObject('Додаток51. 070203 Відключення юридичного (побутового) споживача від електромережі  у ВРП понад 1000В' , TObject(2017017857 ) );
      chkListWorks.Items.AddObject('Додаток52. 111401 Вручення споживачу повідомлення про відключення електроенергії' , TObject(2017018078 ) );
      chkListWorks.Items.AddObject('Додаток53. 110401 Встановлення запірної планки на РЩ на сходовій клітинці багатоповерхового будинку' , TObject(500020196 ) );
      chkListWorks.Items.AddObject('Додаток54. 01020101 Встановлення однофазного електролічильника згідно з поодиноким нарядом 1 пояс' , TObject(75001290 ) );
      chkListWorks.Items.AddObject('Додаток55. 01020103 Встановлення однофазного електролічильника згідно з поодиноким нарядом 3 пояс' , TObject(75001292 ) );
      chkListWorks.Items.AddObject('Додаток56. 110303 Встановлення пломби' , TObject(2017017485 ) );
      chkListWorks.Items.AddObject('Додаток57. 040302 Встановлення та підключення трифазного лічильника прямого увімкнення в електроустановках до 1000В у складі автоматизованої системи обліку електроенергії' , TObject(500014734 ) );
      chkListWorks.Items.AddObject('Додаток58. 02020103 Встановлення трифазного електролічильника прямого вмикання 3 пояс' , TObject(75001468 ) );
      chkListWorks.Items.AddObject('Додаток59. 02020204 Встановлення трифазного електролічильника прямого вмикання (сільська місцевість) 4 пояс' , TObject(75001475 ) );
      chkListWorks.Items.AddObject('Додаток60. 010113 Встановлення шафи ввідно-облікової з встановленням 1-ф ізольованого вводу з приєднанням до ізольованої магістралі без переносу приладу обліку                                                        ' , TObject(2017018186 ) );
      chkListWorks.Items.AddObject('Додаток61. 01010101 Знімання однофазного електролічильника 1 пояс' , TObject(75001284 ) );
      chkListWorks.Items.AddObject('Додаток62. 01010103 Знімання однофазного електролічильника 3 пояс' , TObject(75001286 ) );
      chkListWorks.Items.AddObject('Додаток63. 01010104 Знімання однофазного електролічильника 4 пояс' , TObject(75001289 ) );
      chkListWorks.Items.AddObject('Додаток64. 02010101 Знімання трифазного електролічильника прямого вмикання 1 пояс' , TObject(75001287 ) );
      chkListWorks.Items.AddObject('Додаток65. 02010203 Знімання трифазного електролічильника прямого вмикання ( сільська місцевість) 3 пояс' , TObject(75001443 ) );
      chkListWorks.Items.AddObject('Додаток66. 02010204 Знімання трифазного електролічильника прямого вмикання ( сільська місцевість) 4 пояс' , TObject(75001444 ) );
      chkListWorks.Items.AddObject('Додаток67. 110301 Зняття та встановлення пломби                              ' , TObject(2017017483 ) );
      chkListWorks.Items.AddObject('Додаток68. 080201 Обстеження електромереж побутового споживача за його заявою ддя укладання/переукладання Договру на користування  електричною енеогією із проведенням технічної перевірки приладу обліку' , TObject(2017017836 ) );
      chkListWorks.Items.AddObject('Додаток69. 080101 Обстеження електромереж юридичного споживача за його заявою для укладання / переукладання Договору про постачання електричної енергії при приєднанні електроустановок на напругу до 1000 В, 1ф облік ' , TObject(500020193 ) );
      chkListWorks.Items.AddObject('Додаток70. 080102 Обстеження електромереж юридичного споживача за його заявою для укладання / переукладання Договору про постачання електричної енергії при приєднанні електроустановок на напругу до 1000 В, 3ф облік ' , TObject(500020194 ) );
      chkListWorks.Items.AddObject('Додаток71. 080103 Обстеження електромереж юридичного споживача за його заявою для укладання / переукладання Договору про постачання електричної енергії при приєднанні електроустановок на напругу понад 1000 В ' , TObject(500020195 ) );
      chkListWorks.Items.AddObject('Додаток72. 110501 Огляд ТП                        ' , TObject(2017017486 ) );
      chkListWorks.Items.AddObject('Додаток73. 01040401 Перевірка і пломбування раніше пломбованого по загальному списку однофазного електролічильника згідно з поодиноким нарядом в новому житловому будинку 3 пояс' , TObject(75001340 ) );
      chkListWorks.Items.AddObject('Додаток74. 02040101 Перевірка трифазного електролічильника прямого вмикання 3 пояс' , TObject(75001737 ) );
      chkListWorks.Items.AddObject('Додаток75. 02040102 Перевірка трифазного електролічильника прямого вмикання 4 пояс' , TObject(75001738 ) );
      chkListWorks.Items.AddObject('Додаток76. 02040501 Перевірка трифазного електролічильника прямого вмикання в електроустановках до 1000 В' , TObject(75001751 ) );
      chkListWorks.Items.AddObject('Додаток77. 02040203 Перевірка трифазного електролічильника прямого вмикання (сільська місцевість) 3 пояс' , TObject(75001741 ) );
      chkListWorks.Items.AddObject('Додаток78. 02040204 Перевірка трифазного електролічильника прямого вмикання (сільська місцевість) 4 пояс' , TObject(75001742 ) );
      chkListWorks.Items.AddObject('Додаток79. 010108 Перенос 1-ф приладу обліку із будинку побутового споживача у шафу ввідно-облікову ' , TObject(500020888 ) );
      chkListWorks.Items.AddObject('Додаток80. 010110 Перенос 3-ф приладу обліку із будинку побутового споживача у шафу ввідно-облікову                                     ' , TObject(500020890 ) );
      chkListWorks.Items.AddObject('Додаток81. 070402 Повторне підключення або підключення електоустановок нового юридичного / побутового споживача до електричної мережі у ВРП до 1000В  трифазний  ввід (електроустановки споживача)' , TObject(2017017848 ) );
      chkListWorks.Items.AddObject('Додаток82. 070401 Повторне підключення або підключення електроустановок нового юридичного / побутового споживача  до електричної мережі  у ВРП до 1000В  однофазний  ввід                                     ' , TObject(2017017847 ) );
      chkListWorks.Items.AddObject('Додаток83. 070301 Повторне підключення або підключення нового юридичного (побутового)  споживача до електромережі на опорі ПЛ до 1000В (однофазний ввід) ' , TObject(2017017859 ) );
      chkListWorks.Items.AddObject('Додаток84. 070303 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ понад 1000 В' , TObject(2017017863 ) );
      chkListWorks.Items.AddObject('Додаток85. 070403 Повторне підключення або підключення нового юридичного (побутового)  споживача до електромережі  у ВРП однофазний ввід до 1000В (електроустановка Компанії)' , TObject(2017017862 ) );
      chkListWorks.Items.AddObject('Додаток86. 060201 Позаплнова теххнічна перевірка однофазного приладу обліку в електроустановках до 1000В у юридичного споживача' , TObject(1017017753 ) );
      chkListWorks.Items.AddObject('Додаток87. 060202 Позаплнова теххнічна перевірка трифазного приладу обліку в електроустановках до 1000В у юридичного споживача' , TObject(1017017754 ) );
      chkListWorks.Items.AddObject('Додаток88. 060203 Позаплнова теххнічна перевірка трифазного приладу обліку з включенням через трансформатор струму в електроустановках до 1000В у юридичного споживача' , TObject(1017017755 ) );
      chkListWorks.Items.AddObject('Додаток89. 21020103 Проведення візуального обстеження приладу обліку для переукладання договору' , TObject(75001792 ) );
      chkListWorks.Items.AddObject('Додаток90. 110601 Проведення звірки оплати за спожиту електроенергію побутового споживача' , TObject(2017017842 ) );
      chkListWorks.Items.AddObject('Додаток91. 21020106 Проведення контрольного огляду приладу обліку' , TObject(75001801 ) );
      chkListWorks.Items.AddObject('Додаток92. 21020107 Проведення технічної перевірки вимірювального комплексу' , TObject(75001804 ) );
      chkListWorks.Items.AddObject('Додаток93. 21020127 Робота з укладання або переоформлення угоди на відпуск електроенергії споживачу' , TObject(75001831 ) );
      chkListWorks.Items.AddObject('Додаток94. 01040101 Технічна перевірка однофазного електролічильника та дооблікових електричних мереж в індивідуальній забудові (лічильник у квартирі, будинку) 3 пояс' , TObject(75001326 ) );
      chkListWorks.Items.AddObject('Додаток95. 01040102 Технічна перевірка однофазного електролічильника та дооблікових електричних мереж в індивідуальній забудові (лічильник у квартирі, будинку) 4 пояс' , TObject(75001327 ) );
      chkListWorks.Items.AddObject('Додаток96. 060101 Технічна перевірка однофазного приладу обліку після планової повірки в електроустановках до 1000В  у юридичного споживача                   ' , TObject(500014615 ) );
      chkListWorks.Items.AddObject('Додаток97. 060102 Технічна перевірка трифазного приладу обліку після планової повірки в електроустановках до 1000В  у юридичного споживача                   ' , TObject(500014616 ) );
      chkListWorks.Items.AddObject('Додаток98. 060103 Технічна перевірка трифазного приладу  обліку після планової повірки з включенням через трансформатори струму в електроустановках до 1000В у юридичного споживача ' , TObject(500014617 ) );


         // new services
      chkListWorks.Items.AddObject('Додаток99. 2.2.060301.03-1 Виклик інспектора за заявкою юридичного споживача  для встановлення пломби (при закритті доступу до дооблікових мереж), для виконання робіт на обладнанні, яке не задіяне у схемі обліку без технічної перевірки '+' схеми обліку (в т.ч. встановлення пломби зі складенням акту про опломбування, встановлення та збереження пломби) 1 категорія РЕМ' , TObject(1040002374 ) );
      chkListWorks.Items.AddObject('Додаток100. 2.2.060301.03-2 Виклик інспектора за заявкою юридичного споживача  для встановлення пломби (при закритті доступу до дооблікових мереж), для виконання робіт на обладнанні, яке не задіяне у схемі обліку без технічної перевірки '+' схеми обліку (в т.ч. встановлення пломби зі складенням акту про опломбування, встановлення та збереження пломби) 2 категорія РЕМ' , TObject(1040005002 ) );
      chkListWorks.Items.AddObject('Додаток101. 2.2.060301.03-3 Виклик інспектора за заявкою юридичного споживача  для встановлення пломби (при закритті доступу до дооблікових мереж), для виконання робіт на обладнанні, яке не задіяне у схемі обліку без технічної перевірки '+'схеми обліку (в т.ч. встановлення пломби зі складенням акту про опломбування, встановлення та збереження пломби) 3 категорія РЕМ' , TObject(1040005001 ) );
      chkListWorks.Items.AddObject('Додаток102. 2.2.060301.03-4 Виклик інспектора за заявкою юридичного споживача  для встановлення пломби (при закритті доступу до дооблікових мереж), для виконання робіт на обладнанні, яке не задіяне у схемі обліку без технічної перевірки '+'схеми обліку (в т.ч. встановлення пломби зі складенням акту про опломбування, встановлення та збереження пломби) 4 категорія РЕМ' , TObject(1040005000 ) );
      chkListWorks.Items.AddObject('Додаток103. 2.2.060301.02-1 Виклик інспектора за заявкою юридичного споживача для зняття пломби (при закритті доступу до дооблікових мереж), для виконання робіт  на обладнанні, яке не задіяне у схемі обліку, без технічної перевірки '+'схеми обліку, в т.ч. зняття пломби зі складенням акту про опломбування 1 категорія РЕМ' , TObject(1040002372 ) );
      chkListWorks.Items.AddObject('Додаток104. 2.2.060301.02-2 Виклик інспектора за заявкою юридичного споживача для зняття пломби (при закритті доступу до дооблікових мереж), для виконання робіт  на обладнанні, яке не задіяне у схемі обліку, без технічної перевірки '+'схеми обліку, в т.ч. зняття пломби зі складенням акту про опломбування 2 категорія РЕМ' , TObject(1040004996 ) );
      chkListWorks.Items.AddObject('Додаток105. 2.2.030203.1 Відключення юридичного (побутового) споживача від електромережі у ВРП однофазний ввід до 1000 В (електроустановка споживача) 1 категорія РЕМ' , TObject(1040002436 ) );
      chkListWorks.Items.AddObject('Додаток106. 2.2.030203.2 Відключення юридичного (побутового) споживача від електромережі у ВРП однофазний ввід до 1000 В (електроустановка споживача) 2 категорія РЕМ' , TObject(1040004874 ) );
      chkListWorks.Items.AddObject('Додаток107. 2.2.030203.3 Відключення юридичного (побутового) споживача від електромережі у ВРП однофазний ввід до 1000 В (електроустановка споживача) 3 категорія РЕМ' , TObject(1040004873 ) );
      chkListWorks.Items.AddObject('Додаток108. 2.2.030203.4 Відключення юридичного (побутового) споживача від електромережі у ВРП однофазний ввід до 1000 В (електроустановка споживача) 4 категорія РЕМ' , TObject(1040004875 ) );
      chkListWorks.Items.AddObject('Додаток109. 2.2.030204.1 Відключення юридичного (побутового) споживача від електромережі у ВРП трифазний ввід до 1000 В (електроустановка споживача) 1 категорія РЕМ' , TObject(1040002437 ) );
      chkListWorks.Items.AddObject('Додаток110. 2.2.030204.2 Відключення юридичного (побутового) споживача від електромережі у ВРП трифазний ввід до 1000 В (електроустановка споживача) 2 категорія РЕМ' , TObject(1040004877 ) );
      chkListWorks.Items.AddObject('Додаток111. 2.2.030204.3 Відключення юридичного (побутового) споживача від електромережі у ВРП трифазний ввід до 1000 В (електроустановка споживача) 3 категорія РЕМ' , TObject(1040004876 ) );
      chkListWorks.Items.AddObject('Додаток112. 2.2.030204.4 Відключення юридичного (побутового) споживача від електромережі у ВРП трифазний ввід до 1000 В (електроустановка споживача) 4 категорія РЕМ' , TObject(1040004878 ) );
      chkListWorks.Items.AddObject('Додаток113. 2.2.060102.03.1-1 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102.03 '+'(застосовується додатково до роботи 2.2.060102.03 в залежності від кількості пломб на даному об’єкті) 1 категорія РЕМ' , TObject(1040002390 ) );
      chkListWorks.Items.AddObject('Додаток114. 2.2.060102.03.1-2 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102.03 '+'(застосовується додатково до роботи 2.2.060102.03 в залежності від кількості пломб на даному об’єкті) 2 категорія РЕМ' , TObject(1040004959 ) );
      chkListWorks.Items.AddObject('Додаток115. 2.2.060102.03.1-3 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102.03 '+'(застосовується додатково до роботи 2.2.060102.03 в залежності від кількості пломб на даному об’єкті) 3 категорія РЕМ' , TObject(1040004957 ) );
      chkListWorks.Items.AddObject('Додаток116. 2.2.060102.03.1-4 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102.03 '+'(застосовується додатково до роботи 2.2.060102.03 в залежності від кількості пломб на даному об’єкті) 4 категорія РЕМ' , TObject(1040004958 ) );
      chkListWorks.Items.AddObject('Додаток117. 2.2.060103.03.1-1 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103.03 '+'(застосовується додатково до роботи 2.2.060103.03 в залежності від кількості пломб на даному об’єкті) 1 категорія РЕМ' , TObject(1040004988 ) );
      chkListWorks.Items.AddObject('Додаток118. 2.2.060103.03.1-2 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103.03 '+'(застосовується додатково до роботи 2.2.060103.03 в залежності від кількості пломб на даному об’єкті) 2 категорія РЕМ' , TObject(1040002385 ) );
      chkListWorks.Items.AddObject('Додаток119. 2.2.060103.03.1-3 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103.03 '+'(застосовується додатково до роботи 2.2.060103.03 в залежності від кількості пломб на даному об’єкті) 3 категорія РЕМ' , TObject(1040004990 ) );
      chkListWorks.Items.AddObject('Додаток120. 2.2.060103.03.1-4 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103.03 '+'(застосовується додатково до роботи 2.2.060103.03 в залежності від кількості пломб на даному об’єкті) 4 категорія РЕМ' , TObject(1040004989 ) );
      chkListWorks.Items.AddObject('Додаток121. 2.2.060301.03.1-1 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломб, що складений при виконанні роботи 2.2.060301.03 '+'(застосовується додатково до роботи 2.2.060301.03 в залежності від кількості пломб на даному об`єкті) 1 категорія РЕМ' , TObject(1040005004 ) );
      chkListWorks.Items.AddObject('Додаток122. 2.2.060301.03.1-2 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломб, що складений при виконанні роботи 2.2.060301.03 '+'(застосовується додатково до роботи 2.2.060301.03 в залежності від кількості пломб на даному об`єкті) 2 категорія РЕМ' , TObject(1040002375 ) );
      chkListWorks.Items.AddObject('Додаток123. 2.2.060301.03.1-3 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломб, що складений при виконанні роботи 2.2.060301.03 '+'(застосовується додатково до роботи 2.2.060301.03 в залежності від кількості пломб на даному об`єкті) 3 категорія РЕМ' , TObject(1040005005 ) );
      chkListWorks.Items.AddObject('Додаток124. 2.2.060301.03.1-4 Встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломб, що складений при виконанні роботи 2.2.060301.03 '+'(застосовується додатково до роботи 2.2.060301.03 в залежності від кількості пломб на даному об`єкті) 4 категорія РЕМ' , TObject(1040005003 ) );
      chkListWorks.Items.AddObject('Додаток125. 2.2.060103.02.1-1 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконані роботи 2.2.060103.02 (застосовується до роботи 2.2.060103.02 '+'в залежності від кількості пломб на даному об’єкті) 1 категорія РЕМ' , TObject(1040002383 ) );
      chkListWorks.Items.AddObject('Додаток126. 2.2.060103.02.1-2 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконані роботи 2.2.060103.02 (застосовується до роботи 2.2.060103.02 '+'в залежності від кількості пломб на даному об’єкті) 2 категорія РЕМ' , TObject(1040004985 ) );
      chkListWorks.Items.AddObject('Додаток127. 2.2.060103.02.1-3 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконані роботи 2.2.060103.02 (застосовується до роботи 2.2.060103.02 '+'в залежності від кількості пломб на даному об’єкті) 3 категорія РЕМ' , TObject(1040004986 ) );
      chkListWorks.Items.AddObject('Додаток128. 2.2.060103.02.1-4 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконані роботи 2.2.060103.02 (застосовується до роботи 2.2.060103.02 '+'в залежності від кількості пломб на даному об’єкті) 4 категорія РЕМ' , TObject(1040004987 ) );
      chkListWorks.Items.AddObject('Додаток129. 2.2.060301.02.1-1 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконанні роботи 2.2.060301.02 (застосовується додатково до роботи 2.2.060301.02 '+'в залежності від кількості пломб на даному об`єкті) 1 категорія РЕМ' , TObject(1040002373 ) );
      chkListWorks.Items.AddObject('Додаток130. 2.2.060301.02.1-2 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконанні роботи 2.2.060301.02 (застосовується додатково до роботи 2.2.060301.02 '+'в залежності від кількості пломб на даному об`єкті) 2 категорія РЕМ' , TObject(1040004999 ) );
      chkListWorks.Items.AddObject('Додаток131. 2.2.060301.02.1-3 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконанні роботи 2.2.060301.02 (застосовується додатково до роботи 2.2.060301.02 '+'в залежності від кількості пломб на даному об`єкті) 3 категорія РЕМ' , TObject(1040004997 ) );
      chkListWorks.Items.AddObject('Додаток132. 2.2.060301.02.1-4 Зняття кожної наступної пломби з оформленням в акті про опломбування, що складений при виконанні роботи 2.2.060301.02 (застосовується додатково до роботи 2.2.060301.02 '+'в залежності від кількості пломб на даному об`єкті) 4 категорія РЕМ' , TObject(1040004998 ) );
      chkListWorks.Items.AddObject('Додаток133. 2.2.060101.01-1 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060101 (застосовується додатково до роботи 2.2.060101 '+'в залежності від кількості пломб на даному об`єкті) 1 категорія РЕМ' , TObject(1040002391 ) );
      chkListWorks.Items.AddObject('Додаток134. 2.2.060101.01-2 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060101 (застосовується додатково до роботи 2.2.060101 '+'в залежності від кількості пломб на даному об`єкті) 2 категорія РЕМ' , TObject(1040004911 ) );
      chkListWorks.Items.AddObject('Додаток135. 2.2.060101.01-3 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060101 (застосовується додатково до роботи 2.2.060101 '+'в залежності від кількості пломб на даному об`єкті) 3 категорія РЕМ' , TObject(1040004912 ) );
      chkListWorks.Items.AddObject('Додаток136. 2.2.060101.01-4 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060101 (застосовується додатково до роботи 2.2.060101 '+'в залежності від кількості пломб на даному об`єкті) 4 категорія РЕМ' , TObject(1040004913 ) );
      chkListWorks.Items.AddObject('Додаток137. 2.2.060102.01-1 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102 (застосовується додатково до роботи 2.2.060102 '+'в залежності від кількості пломб на даному об`єкті) 1 категорія РЕМ' , TObject(1040002386 ) );
      chkListWorks.Items.AddObject('Додаток138. 2.2.060102.01-2 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102 (застосовується додатково до роботи 2.2.060102 '+'в залежності від кількості пломб на даному об`єкті) 2 категорія РЕМ' , TObject(1040004941 ) );
      chkListWorks.Items.AddObject('Додаток139. 2.2.060102.01-3 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102 (застосовується додатково до роботи 2.2.060102 '+'в залежності від кількості пломб на даному об`єкті) 3 категорія РЕМ' , TObject(1040004939 ) );
      chkListWorks.Items.AddObject('Додаток140. 2.2.060102.01-4 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060102 (застосовується додатково до роботи 2.2.060102 '+'в залежності від кількості пломб на даному об`єкті) 4 категорія РЕМ' , TObject(1040004940 ) );
      chkListWorks.Items.AddObject('Додаток141. 2.2.060103.01-1 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103 (застосовується додатково до роботи 2.2.060103 '+'в залежності від кількості пломб на даному об`єкті) 1 категорія РЕМ' , TObject(1040002381 ) );
      chkListWorks.Items.AddObject('Додаток142. 2.2.060103.01-2 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103 (застосовується додатково до роботи 2.2.060103 '+'в залежності від кількості пломб на даному об`єкті) 2 категорія РЕМ' , TObject(1040004965 ) );
      chkListWorks.Items.AddObject('Додаток143. 2.2.060103.01-3 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103 (застосовується додатково до роботи 2.2.060103 '+'в залежності від кількості пломб на даному об`єкті) 3 категорія РЕМ' , TObject(1040004964 ) );
      chkListWorks.Items.AddObject('Додаток144. 2.2.060103.01-4 Зняття та встановлення кожної наступної пломби з оформленням в акті про опломбування, встановлення та збереження пломби, що складений при виконанні роботи 2.2.060103 (застосовується додатково до роботи 2.2.060103 '+'в залежності від кількості пломб на даному об`єкті) 4 категорія РЕМ' , TObject(1040004963 ) );
      chkListWorks.Items.AddObject('Додаток145. 2.2.040305-1 Параметризація одно- і трифазних лічильників в електроустановках до 1000В у складі автоматизованої системи обліку електроенергії 1 категорія РЕМ' , TObject(1040002353 ) );
      chkListWorks.Items.AddObject('Додаток146. 2.2.050201-1 Перевірка однофазного обліку електричної енергії по заявці побутового споживача 1 категорія РЕМ' , TObject(1040002474 ) );
      chkListWorks.Items.AddObject('Додаток147. 2.2.050201-2 Перевірка однофазного обліку електричної енергії по заявці побутового споживача 2 категорія РЕМ' , TObject(1040004899 ) );
      chkListWorks.Items.AddObject('Додаток148. 2.2.050101-2 Перевірка однофазного обліку електричної енергії при прийманні нової точки обліку 2 категорія РЕМ' , TObject(1040004905 ) );
      chkListWorks.Items.AddObject('Додаток149. 2.2.050101-4 Перевірка однофазного обліку електричної енергії при прийманні нової точки обліку 4 категорія РЕМ' , TObject(1040004907 ) );
      chkListWorks.Items.AddObject('Додаток150. 2.2.050202-2 Перевірка трифазного обліку електричної енергії напругою 0,4кВ по заявці побутового споживача 2 категорія РЕМ' , TObject(1040004903 ) );
      chkListWorks.Items.AddObject('Додаток151. 2.2.050103-1 Перевірка трифазного обліку електричної енергії напругою 0,4кВ при прийманні нової точки обліку 1 категорія РЕМ' , TObject(1040002289 ) );
      chkListWorks.Items.AddObject('Додаток152. 2.2.050103-2 Перевірка трифазного обліку електричної енергії напругою 0,4кВ при прийманні нової точки обліку 2 категорія РЕМ' , TObject(1040004927 ) );

      chkListWorks.Items.AddObject('Додаток153. 2.2.030101.1 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі у ВРП або шафі обліку для 1-ф вводів (електроустановка споживача) 1 категорія РЕМ' , TObject(1040004861 ) );
      chkListWorks.Items.AddObject('Додаток154. 2.2.030101.2 Повторне підключення або підключення нового  (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі у ВРП або шафі обліку для 1-ф вводів (електроустановка споживача) 2 категорія РЕМ' , TObject(1040004863 ) );
      chkListWorks.Items.AddObject('Додаток155. 2.2.030101.3 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі у ВРП або шафі обліку для 1-ф вводів (електроустановка споживача) 3 категорія РЕМ' , TObject(1040004862 ) );
      chkListWorks.Items.AddObject('Додаток156. 2.2.030101.4 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі '+'у ВРП або шафі обліку для 1-ф вводів (електроустановка споживача) 4 категорія РЕМ' , TObject(1040002341 ) );
      chkListWorks.Items.AddObject('Додаток157. 2.2.030102.1 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі '+'у ВРП або шафі обліку для 3-ф вводів (електроустановка споживача) 1 категорія РЕМ' , TObject(1040002342 ) );

      chkListWorks.Items.AddObject('Додаток158. 2.2.030102.2 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі '+'у ВРП або шафі обліку для 3-ф вводів (електроустановка споживача) 2 категорія РЕМ' , TObject(1040004865 ) );
      chkListWorks.Items.AddObject('Додаток159. 2.2.030102.3 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) побутового споживача до електромережі '+'у ВРП або шафі обліку для 3-ф вводів (електроустановка споживача) 3 категорія РЕМ' , TObject(1040004864 ) );
      chkListWorks.Items.AddObject('Додаток160. 2.2.030202.1 Повторне підключення або підключення нового (з приєднаною потужністю понад 16 кВт) юридичного споживача до електромережі '+'у ВРП трифазний ввід до 1000 В (електроустановка споживача) 1 категорія РЕМ' , TObject(1040002346 ) );
      chkListWorks.Items.AddObject('Додаток161. 2.2.020201.1 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В однофазний ввід 1 категорія РЕМ' , TObject(1040002411 ) );
      chkListWorks.Items.AddObject('Додаток162. 2.2.020201.2 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В однофазний ввід 2 категорія РЕМ' , TObject(1040004843 ) );
      chkListWorks.Items.AddObject('Додаток163. 2.2.020201.3 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В однофазний ввід 3 категорія РЕМ' , TObject(1040004844 ) );
      chkListWorks.Items.AddObject('Додаток164. 2.2.020201.4 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В однофазний ввід 4 категорія РЕМ' , TObject(1040004845 ) );
      chkListWorks.Items.AddObject('Додаток165. 2.2.020202.2 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В трифазний ввід 2 категорія  РЕМ' , TObject(1040004846 ) );
      chkListWorks.Items.AddObject('Додаток166. 2.2.020202.3 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В трифазний ввід 3 категорія  РЕМ' , TObject(1040004847 ) );
      chkListWorks.Items.AddObject('Додаток167. 2.2.020202.4 Повторне підключення або підключення нового юридичного (побутового) споживача до електромережі на опорі ПЛ до 1000В трифазний ввід 4 категорія  РЕМ' , TObject(1040004848 ) );
      chkListWorks.Items.AddObject('Додаток168. 2.2.060101-1 Позачергова технічна перевірка правильності роботи однофазного засобу обліку до 1000В за заявкою юридичного споживача, в т.ч. зняття та встановлення пломби зі складенням акту '+'технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 1 категорія РЕМ' , TObject(1040002360 ) );
      chkListWorks.Items.AddObject('Додаток169. 2.2.060101-4 Позачергова технічна перевірка правильності роботи однофазного засобу обліку до 1000В за заявкою юридичного споживача, в т.ч. зняття та встановлення пломби зі складенням акту '+'технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 4 категорія РЕМ' , TObject(1040004910 ) );
      chkListWorks.Items.AddObject('Додаток170. 2.2.060103.03-1 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. встановлення '+'пломби зі складенням акту технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 1 категорія РЕМ' , TObject(1040002384 ) );
      chkListWorks.Items.AddObject('Додаток171. 2.2.060103.03-2 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. встановлення '+'пломби зі складенням акту технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 2 категорія РЕМ' , TObject(1040004983 ) );
      chkListWorks.Items.AddObject('Додаток172. 2.2.060103.03-3 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. встановлення '+'пломби зі складенням акту технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 3 категорія РЕМ' , TObject(1040004982 ) );
      chkListWorks.Items.AddObject('Додаток173. 2.2.060103.03-4 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. встановлення '+'пломби зі складенням акту технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 4 категорія РЕМ' , TObject(1040004984 ) );
      chkListWorks.Items.AddObject('Додаток174. 2.2.060103.02 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. зняття пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування' , TObject(1040004966 ) );
      chkListWorks.Items.AddObject('Додаток175. 2.2.060103.02-1 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. зняття пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування 1 категорія РЕМ' , TObject(1040002382 ) );
      chkListWorks.Items.AddObject('Додаток176. 2.2.060103.02-2 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. зняття пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування 2 категорія РЕМ' , TObject(1040004981 ) );
      chkListWorks.Items.AddObject('Додаток177. 2.2.060103.02-3 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. зняття пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування 3 категорія РЕМ' , TObject(1040004967 ) );
      chkListWorks.Items.AddObject('Додаток178. 2.2.060103.02-4 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В з включенням через трансформатор струму за заявкою юридичного споживача, в т.ч. зняття пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування 4 категорія РЕМ' , TObject(1040004968 ) );
      chkListWorks.Items.AddObject('Додаток179. 2.2.060102.03-1 Позачергова технічна перевірка правильності роботи трифазного засобу обліку до 1000В прямого включення за заявкою юридичного споживача, в т.ч. встановлення пломби зі '+'складенням акту технічної перевірки, наряду установки, акту про опломбування, встановлення та збереження пломби 1 категорія РЕМ' , TObject(1040002389 ) );


end;  }

{if report_vid = 2  then // додатки для метрологии
begin
      chkListWorks.Items.AddObject('Додаток1. Держповірка однофазного електронного лічильника електричної енергії', TObject(500014198 ) );
      chkListWorks.Items.AddObject('Додаток2. Держповірка трьохфазного електронного лічильника електричної енергії', TObject(500014758 ) );
      chkListWorks.Items.AddObject('Додаток3. Доробка однофазного електронного лічильника електроенергії типу NP-06 TD', TObject(500013624 ) );
      chkListWorks.Items.AddObject('Додаток4. Здавання в Держповірку однофазного електронного лічильника електричної енергії', TObject(500021175 ) );
      chkListWorks.Items.AddObject('Додаток5. Перевірка простих щитових приладів (вольтметрів, амперметрів) в електроустановках напругою понад 1000 В', TObject(500020179 ) );
      chkListWorks.Items.AddObject('Додаток6. Перевірка систем багатотарифного (багатофункціонального)  обліку на об’єкті споживача в електроустановках до 1000 В (транспорт замовника)', TObject(500021212 ) );
      chkListWorks.Items.AddObject('Додаток7. Перевірка систем багатотарифного (багатофункціонального)  обліку на об’єкті споживача в електроустановках понад 1000 В (транспорт замовника)', TObject(500021213 ) );
      chkListWorks.Items.AddObject('Додаток8. Послуги з проведення робіт з метрологічної діяльності', TObject(1017016769 ) );
      chkListWorks.Items.AddObject('Додаток9. Програмування електронного лічильника електричної енергії NP-06 TD для здавання в держповірку', TObject(500014627 ) );
      chkListWorks.Items.AddObject('Додаток10. Програмування електронного лічильника електроенергії в умовах метрологічної служби', TObject(500021208 ) );
      chkListWorks.Items.AddObject('Додаток11. Ремонт 1 групи складності однофазного електронного лічильника електричної енергії NP-06TD', TObject(500013605 ) );
      chkListWorks.Items.AddObject('Додаток12. Ремонт 1 групи складності однофазного електронного лічильника електричної енергії Каскад-1.15/2.0-П', TObject(500013595 ) );
      chkListWorks.Items.AddObject('Додаток13. Ремонт 1 групи складності однофазного електронного лічильника електричної енергії СО-ЭА05Р', TObject(500013602 ) );
      chkListWorks.Items.AddObject('Додаток14. Ремонт 1 групи складності однофазного електронного лічильника електричної енергії СО-ЭА09', TObject(500013603 ) );
      chkListWorks.Items.AddObject('Додаток15. Ремонт 1 групи складності трьохфазного електронного лічильника електричної енергії СА4Е-5030', TObject(500013607 ) );
      chkListWorks.Items.AddObject('Додаток16. Ремонт 1 групи складності трьохфазного електронного лічильника електричної енергії ЦЭ-6803 В', TObject(500013610 ) );
      chkListWorks.Items.AddObject('Додаток17. Ремонт I групи складності приладу багатофункціонального EP 180', TObject(500020846 ) );
      chkListWorks.Items.AddObject('Додаток18. Ремонт І групи складності вимірювачів опору заземлення М416, Ф4103', TObject(500020156 ) );
      chkListWorks.Items.AddObject('Додаток19. Ремонт І групи складності вольтамперфазометрів ВАФ-85', TObject(500020164 ) );
      chkListWorks.Items.AddObject('Додаток20. Ремонт І групи складності кліщів електровимірювальних Ц91, Д90, К4575/1А, 266С, Ц4501, РК 120', TObject(500020070 ) );
      chkListWorks.Items.AddObject('Додаток21. Ремонт І групи складності комплектів вимірювальних К50, К505 (клас точності 0,5) ', TObject(500020174 ) );
      chkListWorks.Items.AddObject('Додаток22. Ремонт І групи складності мегомметрів М1101М, М4100/1-5, ЭСО202/2Г, ЭСО210/3', TObject(500020159 ) );
      chkListWorks.Items.AddObject('Додаток23. Ремонт І групи складності міліамперметрів, амперметрів, вольтметрів і кіловольтметрів Э377, Э378, Э30', TObject(500020168 ) );
      chkListWorks.Items.AddObject('Додаток24. Ремонт І групи складності  мостів змінного струму Р595(клас точності 01,5) Р5026 (клас точності 1,0)', TObject(500020177 ) );
      chkListWorks.Items.AddObject('Додаток25. Ремонт І групи складності мостів Р316, Р334, Р333', TObject(500020162 ) );
      chkListWorks.Items.AddObject('Додаток26. Ремонт І групи складності  перетворювачів вимірювальних активної та реактивної Е829, Е830, Е842, Е849, Е855', TObject(500020178 ) );
      chkListWorks.Items.AddObject('Додаток27. Ремонт І групи складності  покажчика струму ПСБ-03ТК,ПСр-10, ПСБ-1', TObject(500020847 ) );
      chkListWorks.Items.AddObject('Додаток28. Ремонт І групи складності установок для повірки і градуювання електровимірювальних приладів У300', TObject(500020272 ) );
      chkListWorks.Items.AddObject('Додаток29. Ремонт ІІ групи складності однофазного електронного лічильника електричної енергії NP-06 TD', TObject(500014061 ) );
      chkListWorks.Items.AddObject('Додаток30. Ремонт ІІ групи складності однофазного електронного лічильника електричної енергії Каскад-1,15/2,0-І', TObject(500013930 ) );
      chkListWorks.Items.AddObject('Додаток31. Ремонт ІІ групи складності однофазного електронного лічильника електричної енергії СО-ЭА05Р', TObject(500014004 ) );
      chkListWorks.Items.AddObject('Додаток32. Ремонт ІІ групи складності трьохфазного електронного лічильника електричної енергії СА4Е-5030', TObject(500013936 ) );
      chkListWorks.Items.AddObject('Додаток33. Ремонт ІІ групи складності трьохфазного електронного лічильника елктричної енергії ЦЭ6803В', TObject(500014091 ) );
      chkListWorks.Items.AddObject('Додаток34. Ремонт ІІІ групи складності однофазного електронного лічильника електричної енергії CО-ЭА05Р', TObject(500014263 ) );
      chkListWorks.Items.AddObject('Додаток35. Ремонт ІІІ групи складності однофазного електронного лічильника електричної енергії NP-06 TD', TObject(500014203 ) );
      chkListWorks.Items.AddObject('Додаток36. Ремонт ІІІ групи складності однофазного електронного лічильника електричної енергії Каскад-1.15/2.0П', TObject(500014161 ) );
      chkListWorks.Items.AddObject('Додаток37. Ремонт ІІІ групи складності трьохфазного електронного лічильника електричної енергії СА4Е-5030', TObject(500014201 ) );
      chkListWorks.Items.AddObject('Додаток38. Ремонт ІІІ групи складності трьохфазного електронного лічильника електричної енергії ЦЭ6803В', TObject(500014195 ) );
      chkListWorks.Items.AddObject('Додаток39. Технічна перевірка лічильника на ПС 150/35/10/6 кВ', TObject(500019937 ) );
      chkListWorks.Items.AddObject('Додаток40. Перевірка програмування електронного лічильника електроенергії в умовах метрологічної служби 1 категорія РЕМ', TObject(1040005208 ) );
      chkListWorks.Items.AddObject('Додаток41. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках до 1000В (транспорт замовника) 1 категорія РЕМ', TObject(1040004837 ) );
      chkListWorks.Items.AddObject('Додаток42. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках до 1000В (транспорт замовника) 2 категорія РЕМ', TObject(1040002648 ) );
      chkListWorks.Items.AddObject('Додаток43. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках до 1000В (транспорт замовника) 4 категорія РЕМ', TObject(1040004839 ) );
      chkListWorks.Items.AddObject('Додаток44. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках понад 1000В (транспорт замовника) 1 категорія РЕМ', TObject(1040004840 ) );
      chkListWorks.Items.AddObject('Додаток45. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках понад 1000В (транспорт замовника) 2 категорія РЕМ', TObject(1040002665 ) );
      chkListWorks.Items.AddObject('Додаток46. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках понад 1000В (транспорт замовника) 3 категорія РЕМ', TObject(1040004841 ) );
      chkListWorks.Items.AddObject('Додаток47. Перевірка систем багатотарифного (багатофункціонального) обліку на об’єкті споживача в електроустановках понад 1000В (транспорт замовника) 4 категорія РЕМ', TObject(1040004842 ) );
      chkListWorks.Items.AddObject('Додаток48. Програмування електронного лічильника електроенергії в умовах метрологічної служби 1 категорія РЕМ', TObject(1040005207 ) );

      end; }



end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbENPlanWorkStateClick(Sender: TObject);
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
              // edtActType.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbTypeactClearClick(Sender: TObject);
begin
  ActTypeCode := 0 ;
  ActTypeName := ' ' ;
  //edtActType.Text := '' ;
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbTypeClearClick(Sender: TObject);
begin
  inherited;
   edtTypeName.Text:= '';
   WorkTypeCode := 0;
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbTypeClick(Sender: TObject);
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbPodVidClearClick(Sender: TObject);
begin
  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.SpeedButton3Click(Sender: TObject);
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
               //edtNumberAct.Text:= GetReturnValue(sgENAct,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
               NumberActCode :=   StrToInt(GetReturnValue(sgENAct,0));

               // обнуляем остальные параметры с очищением полей
                  if   NumberActCode > 0 then
                  begin
                    spbEPRenClear.Click();
                    spbENElementClear.Click();
                    //cbElementType.ItemIndex:= -1;
                    //spbTypeactClear.Click();
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

procedure TfrmExecutedWorksFromMonthPlanZbyt.SpeedButton4Click(Sender: TObject);
begin

  // edtNumberAct.Text := '';
   NumberActCode:= 0 ;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';


end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.Button1Click(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i : integer;
  ii : integer;
  strGroupmaterials : String;
  strBudget : string;
  countselbudj : Integer;
  fileName : String;
  position :Integer;
  state_: boolean;
  enReportAdditionCodesString : String;
begin
  begin

     countselbudj := 0;

     SetLength(argNames, 22);
     SetLength(args, 22);


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

     argNames[9] := 'finexecutorcode';
     args[9]:=  finExecutor_code;


     argNames[10] := 'obj';
     args[10] :=  IntToStr(elementCode);



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


       argNames[16] := 'statusplanfact';
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[16] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[16] := '1' ; // черновые
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '3' ; //  утвержденные


       argNames[17] := 'worktypecode';
       args[17] := IntToStr(worktypecode) ;

       argNames[20] := 'pwkindcode';
       if rbkindyear.Checked then
       args[20] := IntToStr(1)
        else
       args[20] := IntToStr(2);

     {  if report_vid = 1  then // енергосбыт

        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  ((Integer( chkListWorks.Items.Objects[i])  <>  2140004643)
                and (Integer( chkListWorks.Items.Objects[i])  <> 2140004652)
                and (Integer( chkListWorks.Items.Objects[i])  <> 2140004656)) then
                   args[18] := ' tc.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') '
                else
                   args[18] := ' tkcl.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') ';

               argNames[19] := 'nameDodatok';
               args[19] := chkListWorks.Items[i]  ;

                reportName := 'Zbyt/planFactWorkZbytDodatok';

                position := AnsiPos('. ', chkListWorks.Items[i]);
                fileName:= copy(chkListWorks.Items[i],1,position-1);

                makeReportWithExecute(reportName, argNames, args, 'xls', fileName);
            end;


        End;

        if report_vid = 2  then // метрология
        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  (   // типа разделим или техкарты(tc.code) или коды классификации (tkcl.code)
                (Integer( chkListWorks.Items.Objects[i])  <>  1040005208)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004837)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040002648)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004839)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004840)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040002665)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004841)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040004842)
                and (Integer( chkListWorks.Items.Objects[i])  <> 1040005207)

                ) then
                   args[18] := ' tc.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') '
                else
                   args[18] := ' tkcl.code in (' + IntToStr(  Integer( chkListWorks.Items.Objects[i] ) ) + ') ';

               argNames[19] := 'nameDodatok';
               args[19] := chkListWorks.Items[i]  ;

                reportName := 'Metrology/planFactWorkMetrologyDodatok';

                position := AnsiPos('. ', chkListWorks.Items[i]);
                fileName:= copy(chkListWorks.Items[i],1,position-1);

                makeReportWithExecute(reportName, argNames, args, 'xls', fileName);
            end;


        End; }


     for i:=1 to sgENReportAdditionZbytMetrology.RowCount - 1 do
      begin
         sgENReportAdditionZbytMetrology.GetCheckBoxState(4,i,state_);
         if state_ then
         begin
            argNames[18] := 'conditionTechcard';

            if length(enReportAdditionCodesString)>0 then
            enReportAdditionCodesString := enReportAdditionCodesString + ',' + sgENReportAdditionZbytMetrology.Cells[0, i ]
            else
            enReportAdditionCodesString := sgENReportAdditionZbytMetrology.Cells[0, i ];

            

            if StrToInt( sgENReportAdditionZbytMetrology.Cells[2, i ]) <> 1
            then
             args[18] := ' tc.code in (' + sgENReportAdditionZbytMetrology.Cells[1, i ] + ') '
            else
             args[18] := ' tkcl.code in (' + sgENReportAdditionZbytMetrology.Cells[1, i ] + ') ';

            argNames[19] := 'nameDodatok';
            args[19] := sgENReportAdditionZbytMetrology.Cells[4, i ]  ;

            if sgENReportAdditionZbytMetrology.Cells[3, i ] = 'zbyt' then
            begin
              // 01.03.2016 по техкарте code = 2017041445 Салыгин сказал нужно показывать конкретные точки учета по которым были оформлены акты
             if ( sgENReportAdditionZbytMetrology.Cells[1, i ] = '2017041445' ) then
              reportName := 'Zbyt/planFactWorkZbytDodatok_004060501'
              else
              reportName := 'Zbyt/planFactWorkZbytDodatok';
            end
            else if sgENReportAdditionZbytMetrology.Cells[3, i ] = 'metrology' then
            reportName := 'Metrology/planFactWorkMetrologyDodatok'
            else
            reportName :='';


            position := AnsiPos('. ', sgENReportAdditionZbytMetrology.Cells[4, i ]);
            fileName:= copy(sgENReportAdditionZbytMetrology.Cells[4, i ],1,position-1);

             makeReportWithExecute(reportName, argNames, args, 'xls', fileName);

         end;
      end;
            argNames[21] := 'enReportAdditionCodesString';
            args[21]:= enReportAdditionCodesString;

           { тестовый отчет по примеру как работает додат 3 , пока сказали оставить как есть ,
           поэтому скроем reportName := 'Zbyt/PlanFact/mainDodatok';
            makeReport(reportName, argNames, args, 'xls'); }


  end;

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.chbCheckAllClick(Sender: TObject);
begin
      CheckGrid(sgENReportAdditionZbytMetrology, 4, chbCheckAll.Checked);
end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.CheckBox1Click(Sender: TObject);
var
i : integer;
begin


end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.CheckBox2Click(Sender: TObject);
var
i : integer;
begin


end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              // if ENPlanWorkObj.finExecutor = nil then ENPlanWorkObj.finExecutor := FINExecutor.Create();
               finExecutor_name := DMReports.getFullExecutorName(tvDep.Selected); //FINExecutorShort(tvDep.Selected.Data).name;

               finExecutor_code := IntToStr(FINExecutorShort(tvDep.Selected.Data).finCode);
               if FINExecutorShort(tvDep.Selected.Data).finCode = LOW_INT then
                finExecutor_code  := FINExecutorShort(tvDep.Selected.Data).axOrgId;




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

procedure TfrmExecutedWorksFromMonthPlanZbyt.spbFINExetutorClearClick(
  Sender: TObject);
begin

   edtFINExecutorName.Text := '';
   finExecutor_code:= '';

end;

procedure TfrmExecutedWorksFromMonthPlanZbyt.SelectAvailableAddition(Sender: TObject);
var
 i : integer;


  m_end,d_end,y_end:word;
  m_start,d_start,y_start:word;
  countdodatok , LastCount : Integer;

  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;

  ENReportAdditionZbytMetrologyList: ENReportAdditionZbytMetrologyShortList;
  reportaditionFilter : ENReportAdditionZbytMetrologyFilter;
  condition  , sql : String;
begin

  //DecodeDate(now,y,m,d);
  //dtpEndDate.DateTime := EndOfAMonth(y, m);
  //dtpEndDate.Checked := true;

  //dtpStartDate.DateTime := EncodeDate(y,m,1);
  //dtpStartDate.Checked := true;

//  if dtpEndDate. then
   ClearGrid(sgENReportAdditionZbytMetrology);
 if ((dtpEndDate.Checked) and (dtpStartDate.Checked)) then
 begin
      DecodeDate(dtpEndDate.DateTime,y_end,m_end,d_end);
      DecodeDate(dtpStartDate.DateTime,y_start,m_start,d_start);

      if ( y_start  <> y_end ) then
      begin
         ShowMessage('Період повинен бути в межах року !!! ');
         exit;
      end;


      SetGridHeaders(ENReportAdditionZbytMetrologyHeaders, sgENReportAdditionZbytMetrology.ColumnHeaders);
      TempENReportAdditionZbytMetrology :=  HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;


      reportaditionFilter := ENReportAdditionZbytMetrologyFilter.Create;
      SetNullIntProps(reportaditionFilter);
      SetNullXSProps(reportaditionFilter);


      if ((report_vid = 1) or (report_vid = 3 ))  then
      reportaditionFilter.zbytOrmetrology := 'zbyt'
      else
      reportaditionFilter.zbytOrmetrology := 'metrology';
      reportaditionFilter.orderBySQL := 'code';



      sql := ' ((  ENREPORTADDITNZBTMTRLG.datestart   <= '+chr(39)+ DateToStr(dtpStartDate.DateTime) + chr(39) + ' AND ' +
        ' coalesce(ENREPORTADDITNZBTMTRLG.datefinal,''01.01.3000'')   > '+chr(39)+  DateToStr(dtpStartDate.DateTime) +chr(39)+ ' )  OR ' +
        ' (  ENREPORTADDITNZBTMTRLG.datestart   >='+chr(39)+  DateToStr(dtpStartDate.DateTime) +chr(39)+ ' AND ' +
                    ' coalesce(ENREPORTADDITNZBTMTRLG.datefinal,''01.01.3000'')  < '+chr(39)+  DateToStr(dtpEndDate.DateTime) +chr(39)+ ' )  OR ' +
     ' (  ENREPORTADDITNZBTMTRLG.datestart   <='+chr(39)+  DateToStr(dtpEndDate.DateTime) +chr(39)+ ' AND ' +
     '               coalesce(ENREPORTADDITNZBTMTRLG.datefinal,''01.01.3000'')   > '+chr(39)+  DateToStr(dtpEndDate.DateTime) +chr(39)+ ' )) ' ;

      AddCondition(condition, sql );

      if ruta_rukoee = 'rukoee' then
      AddCondition(condition, ' ENREPORTADDITNZBTMTRLG.code not in (  ' + ENConsts.SQL_NOT_IN_SELECTED_ENREPORTADDITNZBTMTRLG_FOR_RUKOEE + ')' );

      reportaditionFilter.conditionSQL := condition;
      ENReportAdditionZbytMetrologyList := TempENReportAdditionZbytMetrology.getScrollableFilteredList(ENReportAdditionZbytMetrologyFilter(reportaditionFilter),0,-1);


      LastCount:=High(ENReportAdditionZbytMetrologyList.list);

      if LastCount > -1 then
         sgENReportAdditionZbytMetrology.RowCount:=LastCount+2
      else
         sgENReportAdditionZbytMetrology.RowCount:=2;

       with sgENReportAdditionZbytMetrology do
        for i:=0 to LastCount do
          begin
            Application.ProcessMessages;
            if ENReportAdditionZbytMetrologyList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].code)
            else
            Cells[0,i+1] := '';


            Cells[1,i+1] := ENReportAdditionZbytMetrologyList.list[i].workCode;

            if ENReportAdditionZbytMetrologyList.list[i].isServices = Low(Integer) then
              Cells[2,i+1] := ''
            else
              Cells[2,i+1] := IntToStr(ENReportAdditionZbytMetrologyList.list[i].isServices);
            Cells[3,i+1] := ENReportAdditionZbytMetrologyList.list[i].zbytOrmetrology;

            AddCheckBox(4,i+1,false, false);
            Cells[4,i+1] := ENReportAdditionZbytMetrologyList.list[i].name;


          end;

       sgENReportAdditionZbytMetrology.Row:=1;

  end;



end;

end.
