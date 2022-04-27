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

    report_vid : Integer; //(1-���������  2- ���������� )
    ruta_rukoee : String; //
  end;

var
  frmExecutedWorksFromMonthPlanZbyt: TfrmExecutedWorksFromMonthPlanZbyt;

  ENReportAdditionZbytMetrologyHeaders: array [1..5] of String =
        ( '���'
          ,'��� ������'
          ,'isservices'
          ,'zbytOrmetrology'
          ,'������������ ������� '
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
         ShowMessage('����� ������� ���� � ����� ���� !!! ');
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
     args[7] :=  '0'  // �������� � ���������� ���� ����������
     else
     args[7] := '3'; // ������ �����������


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
      args[11] := '1' ; // �������� ������
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = true) )then
      args[11] := '2' ; //  ������������ ������

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
      args[16] := '1' ; // ��������
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '3' ; //  ������������


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
            reportName := 'Zbyt/planFactWorkZbyt'; //!!!!!!! 03,03,2017  �������� ������� �.� ����� ������������� � ����������� ��� �� ������ ��������
                                                  //  �������� �� ����� ���� ������������� � �������� �� ����� �� ������� �������� ���-�� ��� ����� ��� ��������� ��� �������� ���
                                                  ///   reportName := 'Zbyt/PlanFact/Main'; 07.02.2017 ��������� ������� ��� �� ����� ������� �� ���� ��� ������ 3
            makeReportWithExecute(reportName, argNames, args, 'xls', '������������������������');
          end
        else if report_vid = 2 then
          begin
           reportName := 'Metrology/planFactWorkMetrology';
           makeReportWithExecute(reportName, argNames, args, 'xls', '�����������������������');
          end
        else if report_vid = 3 then   // �������� ������ ���������� ��� ��� ������� 3
          begin
           reportName := 'Zbyt/PlanFact/Main';
           makeReportWithExecute(reportName, argNames, args, 'xls', '������������������������');
          end ;




     {  if report_vid = 1  then // ����������
       
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

        if report_vid = 2  then // ����������
        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  (   // ���� �������� ��� ��������(tc.code) ��� ���� ������������� (tkcl.code)
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
              // 01.03.2016 �� �������� code = 2017041445 ������� ������ ����� ���������� ���������� ����� ����� �� ������� ���� ��������� ����
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
  renName := '���������������';
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
   renCode := 1; // ������������� '���������������'
   renName := '���������������';
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
  // � ��� ��� (renCode = 0) �������� ��� �������

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
  { ��������� ���������� ������ ����� �������� }


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
if report_vid = 1  then // ������� ��� �����������
begin
      chkListWorks.Items.AddObject('�������1. ������� ����� ����������� ���������������� � ���������� ������� (�� �����''''�����, ������������, ���������� �����) 3 ����' , TObject(75001315) );
      chkListWorks.Items.AddObject('�������2. ������� ����� ����������� ���������������� � ���������� ������� (�� �����''''�����, ������������, ���������� �����) 4 ����' , TObject(75001316) );
      chkListWorks.Items.AddObject('�������3. ������� ����� ����������� ���������������� (�� �������, �����, ������) 1 ����' , TObject(75001311) );
      chkListWorks.Items.AddObject('�������4. ������� ����� ����������� ���������������� (�� �������, �����, ������) 3 ����' , TObject(75001313) );
      chkListWorks.Items.AddObject('�������5. ������� ����� ����������� ���������������� (������� ��������) 2 ����' , TObject(75001318) );
      chkListWorks.Items.AddObject('�������6. ������� ����� ����������� ���������������� (������� ��������) 3 ����' , TObject(75001319) );
      chkListWorks.Items.AddObject('�������7. ������� ����� ����������� ���������������� (������� ��������) 4 ����' , TObject(75001320) );


       chkListWorks.Items.AddObject('�������8. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� 1 ����' , TObject(75001302) );
       chkListWorks.Items.AddObject('�������9. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� 2 ����' , TObject(75001303) );
       chkListWorks.Items.AddObject('�������10. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� 3 ����' , TObject(75001304) );
       chkListWorks.Items.AddObject('�������11. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� 4 ����' , TObject(75001305) );
       chkListWorks.Items.AddObject('�������12. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� (������� ��������) 1 ����' , TObject(75001307 ) );
       chkListWorks.Items.AddObject('�������13. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� (������� ��������) 2 ����' , TObject(75001308 ) );
       chkListWorks.Items.AddObject('�������14. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� (������� ��������) 3 ����' , TObject(75001309 ) );
       chkListWorks.Items.AddObject('�������15. ����� ����������� ���������������� �� ��������� � ����� � ���������� ������� (������� ��������) 4 ����' , TObject(75001310 ) );
       chkListWorks.Items.AddObject('�������16. ������� ����� ����������� ���������������� (�� �������, �����, ������) 2 ����' , TObject(75001312 ) );
       chkListWorks.Items.AddObject('�������17. ����� ����������� ����������� ���������� Ѳ� �� ��-0,4 �� �� ����� � ������ (�������)' , TObject(75001416 ) );
       chkListWorks.Items.AddObject('�������18. ����� ���������� ���������������� ������� �������� 1 ����' , TObject(75001707 ) );
       chkListWorks.Items.AddObject('�������19. ����� ���������� ���������������� ������� �������� 2 ����' , TObject(75001708 ) );
       chkListWorks.Items.AddObject('�������20. ����� ���������� ���������������� ������� �������� (������� ��������) 1 ����' , TObject(75001709 ) );
       chkListWorks.Items.AddObject('�������21. ����� ���������� ���������������� ������� �������� (������� ��������) 3 ����' , TObject(75001711 ) );
       chkListWorks.Items.AddObject('�������22. ����� ���������� ���������������� ������� �������� (������� ��������) 4 ����' , TObject(75001712 ) );
       chkListWorks.Items.AddObject('�������23. ����� ���������� ���������������� ����� � ���������� ������� 3 ����' , TObject(75001715 ) );
       chkListWorks.Items.AddObject('�������24. ����� ���������� ���������������� ����� � ���������� ������� 4 ����' , TObject(75001717 ) );
       chkListWorks.Items.AddObject('�������25. ����� 1-� ������������� �������� � ��������� ���������� �������� ���������� ���������' , TObject(500011756 ) );
       chkListWorks.Items.AddObject('�������26. ����� ������� ���������� 1-� �����-������� ����' , TObject(500011768 ) );
       chkListWorks.Items.AddObject('�������27. ����� ������� ���������� 3-� �����-������� ����' , TObject(500011776 ) );
       chkListWorks.Items.AddObject('�������28. ����� 3-� ������������� �������� � ��������� ���������� ������� � ���������� ���������' , TObject(500011784 ) );
       chkListWorks.Items.AddObject('�������29. ����� ������������ ���������� ���� 1-� ��� 3-� �����-������� ����.' , TObject(500012312 ) );
       chkListWorks.Items.AddObject('�������30. ����� 1-� ������������� �������� � ���������� ���������' , TObject(2017018182 ) );
       chkListWorks.Items.AddObject('�������31. ����� 3-� ������������� �������� � ���������� ���������' , TObject(2017018183 ) );
       chkListWorks.Items.AddObject('�������32. ����� 1-� ������������� �������� � ���������� ��������� �� �������� ���������' , TObject(2017018184 ) );
       chkListWorks.Items.AddObject('�������33. ����� 3-� ������������� �������� � ���������� ��������� �� �������� ���������' , TObject(2017018185 ) );
       chkListWorks.Items.AddObject('�������34. ����� ���������� ������� ����� �����������㳿 �� ������� ���������� ��� ���������� ���������' , TObject(2140004643 ) );
       chkListWorks.Items.AddObject('�������35. ����� ����������� ������� ����� �����������㳿 �� ������� ���������� ��� ���������� ��������� � ������ �������� ���������' , TObject(2140004652 ) );
       chkListWorks.Items.AddObject('�������36. ����� ���������� ������� ����� �����������㳿 �� ������� ���������� ��� ���������� ���������' , TObject(2140004656 ) );
       chkListWorks.Items.AddObject('�������37. ������������ ���� �����-������� � ������������� 1-� ������������ ����� ��� �������� ������� �����' , TObject(500020889 ) );
       chkListWorks.Items.AddObject('�������38. ������������ ���� �����-������� � ������������� 3-� ������������ ����� ��� �������� ������� �����' , TObject(500020891 ) );
        // new not services

        chkListWorks.Items.AddObject('�������39. 110701 ��������� ����� ����������� �� ���� �� �� ��� ��������� �����' , TObject(2017017849 ) );
      chkListWorks.Items.AddObject('�������40. 110702 ��������� �������� ������� ����� �����������㳿 ��� ��������� �����' , TObject(2017017850 ) );
      chkListWorks.Items.AddObject('�������41. 2204 ³��������� �� ������������ �������� � ���������������� ' , TObject(500004821 ) );
      chkListWorks.Items.AddObject('�������42. 070201 ³��������� ���������������� ����������/���������� ��������� �� ���������� ����� ��� �� 1000� ���������� ��� (���������������� ���������)' , TObject(2017017845 ) );
      chkListWorks.Items.AddObject('�������43. 070204 ³��������� ���������������� ����������/���������� ��������� �� ���������� ����� � ��� �� 1000� ���������� ��� (���������������� ������)' , TObject(2017017865 ) );
      chkListWorks.Items.AddObject('�������44. 070205 ³��������� ���������������� ����������/���������� ��������� �� ���������� ����� � ��� �� 1000� ��������� ��� (���������������� ������)' , TObject(2017017866 ) );
      chkListWorks.Items.AddObject('�������45. 070202 ³���������  ���������������� ����������/����������  ��������� �� ���������� ����� � ��� �� 1000�  ���������  ���  (���������������� ���������)' , TObject(2017017846 ) );
      chkListWorks.Items.AddObject('�������46. 01050101 ³��������� � ���������� ����������� ���������������� �� ������� 3 ����' , TObject(75001341 ) );
      chkListWorks.Items.AddObject('�������47. 01050102 ³��������� � ���������� ����������� ���������������� �� ������� 4 ����' , TObject(75001342 ) );
      chkListWorks.Items.AddObject('�������48. 070101 ³��������� ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000 � (���������� ���)' , TObject(500012854 ) );
      chkListWorks.Items.AddObject('�������49. 070101 ³��������� ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000�  (���������� ���)' , TObject(500012855 ) );
      chkListWorks.Items.AddObject('�������50. 070102 ³��������� ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� (����������� ���)' , TObject(500012856 ) );
      chkListWorks.Items.AddObject('�������51. 070203 ³��������� ���������� (����������) ��������� �� ������������  � ��� ����� 1000�' , TObject(2017017857 ) );
      chkListWorks.Items.AddObject('�������52. 111401 �������� ��������� ����������� ��� ���������� �����������㳿' , TObject(2017018078 ) );
      chkListWorks.Items.AddObject('�������53. 110401 ������������ ������ ������ �� �� �� ������� ������� ����������������� �������' , TObject(500020196 ) );
      chkListWorks.Items.AddObject('�������54. 01020101 ������������ ����������� ���������������� ����� � ���������� ������� 1 ����' , TObject(75001290 ) );
      chkListWorks.Items.AddObject('�������55. 01020103 ������������ ����������� ���������������� ����� � ���������� ������� 3 ����' , TObject(75001292 ) );
      chkListWorks.Items.AddObject('�������56. 110303 ������������ ������' , TObject(2017017485 ) );
      chkListWorks.Items.AddObject('�������57. 040302 ������������ �� ���������� ���������� ��������� ������� ��������� � ����������������� �� 1000� � ����� �������������� ������� ����� �����������㳿' , TObject(500014734 ) );
      chkListWorks.Items.AddObject('�������58. 02020103 ������������ ���������� ���������������� ������� �������� 3 ����' , TObject(75001468 ) );
      chkListWorks.Items.AddObject('�������59. 02020204 ������������ ���������� ���������������� ������� �������� (������� ��������) 4 ����' , TObject(75001475 ) );
      chkListWorks.Items.AddObject('�������60. 010113 ������������ ���� �����-������� � ������������� 1-� ������������ ����� � ���������� �� ���������� �������� ��� �������� ������� �����                                                        ' , TObject(2017018186 ) );
      chkListWorks.Items.AddObject('�������61. 01010101 ������� ����������� ���������������� 1 ����' , TObject(75001284 ) );
      chkListWorks.Items.AddObject('�������62. 01010103 ������� ����������� ���������������� 3 ����' , TObject(75001286 ) );
      chkListWorks.Items.AddObject('�������63. 01010104 ������� ����������� ���������������� 4 ����' , TObject(75001289 ) );
      chkListWorks.Items.AddObject('�������64. 02010101 ������� ���������� ���������������� ������� �������� 1 ����' , TObject(75001287 ) );
      chkListWorks.Items.AddObject('�������65. 02010203 ������� ���������� ���������������� ������� �������� ( ������� ��������) 3 ����' , TObject(75001443 ) );
      chkListWorks.Items.AddObject('�������66. 02010204 ������� ���������� ���������������� ������� �������� ( ������� ��������) 4 ����' , TObject(75001444 ) );
      chkListWorks.Items.AddObject('�������67. 110301 ������ �� ������������ ������                              ' , TObject(2017017483 ) );
      chkListWorks.Items.AddObject('�������68. 080201 ���������� ������������ ���������� ��������� �� ���� ������ ��� ���������/������������� ������� �� ������������  ����������� ����㳺� �� ����������� ������� �������� ������� �����' , TObject(2017017836 ) );
      chkListWorks.Items.AddObject('�������69. 080101 ���������� ������������ ���������� ��������� �� ���� ������ ��� ��������� / ������������� �������� ��� ���������� ���������� ����㳿 ��� �������� ���������������� �� ������� �� 1000 �, 1� ���� ' , TObject(500020193 ) );
      chkListWorks.Items.AddObject('�������70. 080102 ���������� ������������ ���������� ��������� �� ���� ������ ��� ��������� / ������������� �������� ��� ���������� ���������� ����㳿 ��� �������� ���������������� �� ������� �� 1000 �, 3� ���� ' , TObject(500020194 ) );
      chkListWorks.Items.AddObject('�������71. 080103 ���������� ������������ ���������� ��������� �� ���� ������ ��� ��������� / ������������� �������� ��� ���������� ���������� ����㳿 ��� �������� ���������������� �� ������� ����� 1000 � ' , TObject(500020195 ) );
      chkListWorks.Items.AddObject('�������72. 110501 ����� ��                        ' , TObject(2017017486 ) );
      chkListWorks.Items.AddObject('�������73. 01040401 �������� � ����������� ����� ������������ �� ���������� ������ ����������� ���������������� ����� � ���������� ������� � ������ ��������� ������� 3 ����' , TObject(75001340 ) );
      chkListWorks.Items.AddObject('�������74. 02040101 �������� ���������� ���������������� ������� �������� 3 ����' , TObject(75001737 ) );
      chkListWorks.Items.AddObject('�������75. 02040102 �������� ���������� ���������������� ������� �������� 4 ����' , TObject(75001738 ) );
      chkListWorks.Items.AddObject('�������76. 02040501 �������� ���������� ���������������� ������� �������� � ����������������� �� 1000 �' , TObject(75001751 ) );
      chkListWorks.Items.AddObject('�������77. 02040203 �������� ���������� ���������������� ������� �������� (������� ��������) 3 ����' , TObject(75001741 ) );
      chkListWorks.Items.AddObject('�������78. 02040204 �������� ���������� ���������������� ������� �������� (������� ��������) 4 ����' , TObject(75001742 ) );
      chkListWorks.Items.AddObject('�������79. 010108 ������� 1-� ������� ����� �� ������� ���������� ��������� � ���� �����-������� ' , TObject(500020888 ) );
      chkListWorks.Items.AddObject('�������80. 010110 ������� 3-� ������� ����� �� ������� ���������� ��������� � ���� �����-�������                                     ' , TObject(500020890 ) );
      chkListWorks.Items.AddObject('�������81. 070402 �������� ���������� ��� ���������� ��������������� ������ ���������� / ���������� ��������� �� ���������� ����� � ��� �� 1000�  ���������  ��� (���������������� ���������)' , TObject(2017017848 ) );
      chkListWorks.Items.AddObject('�������82. 070401 �������� ���������� ��� ���������� ���������������� ������ ���������� / ���������� ���������  �� ���������� �����  � ��� �� 1000�  ����������  ���                                     ' , TObject(2017017847 ) );
      chkListWorks.Items.AddObject('�������83. 070301 �������� ���������� ��� ���������� ������ ���������� (����������)  ��������� �� ������������ �� ���� �� �� 1000� (���������� ���) ' , TObject(2017017859 ) );
      chkListWorks.Items.AddObject('�������84. 070303 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� ����� 1000 �' , TObject(2017017863 ) );
      chkListWorks.Items.AddObject('�������85. 070403 �������� ���������� ��� ���������� ������ ���������� (����������)  ��������� �� ������������  � ��� ���������� ��� �� 1000� (���������������� ������)' , TObject(2017017862 ) );
      chkListWorks.Items.AddObject('�������86. 060201 ���������� �������� �������� ����������� ������� ����� � ����������������� �� 1000� � ���������� ���������' , TObject(1017017753 ) );
      chkListWorks.Items.AddObject('�������87. 060202 ���������� �������� �������� ���������� ������� ����� � ����������������� �� 1000� � ���������� ���������' , TObject(1017017754 ) );
      chkListWorks.Items.AddObject('�������88. 060203 ���������� �������� �������� ���������� ������� ����� � ���������� ����� ������������� ������ � ����������������� �� 1000� � ���������� ���������' , TObject(1017017755 ) );
      chkListWorks.Items.AddObject('�������89. 21020103 ���������� ���������� ���������� ������� ����� ��� ������������� ��������' , TObject(75001792 ) );
      chkListWorks.Items.AddObject('�������90. 110601 ���������� ����� ������ �� ������� ������������� ���������� ���������' , TObject(2017017842 ) );
      chkListWorks.Items.AddObject('�������91. 21020106 ���������� ������������ ������ ������� �����' , TObject(75001801 ) );
      chkListWorks.Items.AddObject('�������92. 21020107 ���������� ������� �������� ������������� ���������' , TObject(75001804 ) );
      chkListWorks.Items.AddObject('�������93. 21020127 ������ � ��������� ��� �������������� ����� �� ������ �����������㳿 ���������' , TObject(75001831 ) );
      chkListWorks.Items.AddObject('�������94. 01040101 ������� �������� ����������� ���������������� �� ���������� ����������� ����� � ������������ ������� (�������� � �������, �������) 3 ����' , TObject(75001326 ) );
      chkListWorks.Items.AddObject('�������95. 01040102 ������� �������� ����������� ���������������� �� ���������� ����������� ����� � ������������ ������� (�������� � �������, �������) 4 ����' , TObject(75001327 ) );
      chkListWorks.Items.AddObject('�������96. 060101 ������� �������� ����������� ������� ����� ���� ������� ������ � ����������������� �� 1000�  � ���������� ���������                   ' , TObject(500014615 ) );
      chkListWorks.Items.AddObject('�������97. 060102 ������� �������� ���������� ������� ����� ���� ������� ������ � ����������������� �� 1000�  � ���������� ���������                   ' , TObject(500014616 ) );
      chkListWorks.Items.AddObject('�������98. 060103 ������� �������� ���������� �������  ����� ���� ������� ������ � ���������� ����� �������������� ������ � ����������������� �� 1000� � ���������� ��������� ' , TObject(500014617 ) );


         // new services
      chkListWorks.Items.AddObject('�������99. 2.2.060301.03-1 ������ ���������� �� ������� ���������� ���������  ��� ������������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ���� �� ���������, ��� �� ������ � ���� ����� ��� ������� �������� '+' ����� ����� (� �.�. ������������ ������ � ���������� ���� ��� ������������, ������������ �� ���������� ������) 1 �������� ���' , TObject(1040002374 ) );
      chkListWorks.Items.AddObject('�������100. 2.2.060301.03-2 ������ ���������� �� ������� ���������� ���������  ��� ������������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ���� �� ���������, ��� �� ������ � ���� ����� ��� ������� �������� '+' ����� ����� (� �.�. ������������ ������ � ���������� ���� ��� ������������, ������������ �� ���������� ������) 2 �������� ���' , TObject(1040005002 ) );
      chkListWorks.Items.AddObject('�������101. 2.2.060301.03-3 ������ ���������� �� ������� ���������� ���������  ��� ������������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ���� �� ���������, ��� �� ������ � ���� ����� ��� ������� �������� '+'����� ����� (� �.�. ������������ ������ � ���������� ���� ��� ������������, ������������ �� ���������� ������) 3 �������� ���' , TObject(1040005001 ) );
      chkListWorks.Items.AddObject('�������102. 2.2.060301.03-4 ������ ���������� �� ������� ���������� ���������  ��� ������������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ���� �� ���������, ��� �� ������ � ���� ����� ��� ������� �������� '+'����� ����� (� �.�. ������������ ������ � ���������� ���� ��� ������������, ������������ �� ���������� ������) 4 �������� ���' , TObject(1040005000 ) );
      chkListWorks.Items.AddObject('�������103. 2.2.060301.02-1 ������ ���������� �� ������� ���������� ��������� ��� ������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ����  �� ���������, ��� �� ������ � ���� �����, ��� ������� �������� '+'����� �����, � �.�. ������ ������ � ���������� ���� ��� ������������ 1 �������� ���' , TObject(1040002372 ) );
      chkListWorks.Items.AddObject('�������104. 2.2.060301.02-2 ������ ���������� �� ������� ���������� ��������� ��� ������ ������ (��� ������� ������� �� ���������� �����), ��� ��������� ����  �� ���������, ��� �� ������ � ���� �����, ��� ������� �������� '+'����� �����, � �.�. ������ ������ � ���������� ���� ��� ������������ 2 �������� ���' , TObject(1040004996 ) );
      chkListWorks.Items.AddObject('�������105. 2.2.030203.1 ³��������� ���������� (����������) ��������� �� ������������ � ��� ���������� ��� �� 1000 � (���������������� ���������) 1 �������� ���' , TObject(1040002436 ) );
      chkListWorks.Items.AddObject('�������106. 2.2.030203.2 ³��������� ���������� (����������) ��������� �� ������������ � ��� ���������� ��� �� 1000 � (���������������� ���������) 2 �������� ���' , TObject(1040004874 ) );
      chkListWorks.Items.AddObject('�������107. 2.2.030203.3 ³��������� ���������� (����������) ��������� �� ������������ � ��� ���������� ��� �� 1000 � (���������������� ���������) 3 �������� ���' , TObject(1040004873 ) );
      chkListWorks.Items.AddObject('�������108. 2.2.030203.4 ³��������� ���������� (����������) ��������� �� ������������ � ��� ���������� ��� �� 1000 � (���������������� ���������) 4 �������� ���' , TObject(1040004875 ) );
      chkListWorks.Items.AddObject('�������109. 2.2.030204.1 ³��������� ���������� (����������) ��������� �� ������������ � ��� ��������� ��� �� 1000 � (���������������� ���������) 1 �������� ���' , TObject(1040002437 ) );
      chkListWorks.Items.AddObject('�������110. 2.2.030204.2 ³��������� ���������� (����������) ��������� �� ������������ � ��� ��������� ��� �� 1000 � (���������������� ���������) 2 �������� ���' , TObject(1040004877 ) );
      chkListWorks.Items.AddObject('�������111. 2.2.030204.3 ³��������� ���������� (����������) ��������� �� ������������ � ��� ��������� ��� �� 1000 � (���������������� ���������) 3 �������� ���' , TObject(1040004876 ) );
      chkListWorks.Items.AddObject('�������112. 2.2.030204.4 ³��������� ���������� (����������) ��������� �� ������������ � ��� ��������� ��� �� 1000 � (���������������� ���������) 4 �������� ���' , TObject(1040004878 ) );
      chkListWorks.Items.AddObject('�������113. 2.2.060102.03.1-1 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102.03 '+'(������������� ��������� �� ������ 2.2.060102.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 1 �������� ���' , TObject(1040002390 ) );
      chkListWorks.Items.AddObject('�������114. 2.2.060102.03.1-2 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102.03 '+'(������������� ��������� �� ������ 2.2.060102.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 2 �������� ���' , TObject(1040004959 ) );
      chkListWorks.Items.AddObject('�������115. 2.2.060102.03.1-3 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102.03 '+'(������������� ��������� �� ������ 2.2.060102.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 3 �������� ���' , TObject(1040004957 ) );
      chkListWorks.Items.AddObject('�������116. 2.2.060102.03.1-4 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102.03 '+'(������������� ��������� �� ������ 2.2.060102.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 4 �������� ���' , TObject(1040004958 ) );
      chkListWorks.Items.AddObject('�������117. 2.2.060103.03.1-1 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103.03 '+'(������������� ��������� �� ������ 2.2.060103.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 1 �������� ���' , TObject(1040004988 ) );
      chkListWorks.Items.AddObject('�������118. 2.2.060103.03.1-2 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103.03 '+'(������������� ��������� �� ������ 2.2.060103.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 2 �������� ���' , TObject(1040002385 ) );
      chkListWorks.Items.AddObject('�������119. 2.2.060103.03.1-3 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103.03 '+'(������������� ��������� �� ������ 2.2.060103.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 3 �������� ���' , TObject(1040004990 ) );
      chkListWorks.Items.AddObject('�������120. 2.2.060103.03.1-4 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103.03 '+'(������������� ��������� �� ������ 2.2.060103.03 � ��������� �� ������� ����� �� ������ �ᒺ��) 4 �������� ���' , TObject(1040004989 ) );
      chkListWorks.Items.AddObject('�������121. 2.2.060301.03.1-1 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� �����, �� ��������� ��� �������� ������ 2.2.060301.03 '+'(������������� ��������� �� ������ 2.2.060301.03 � ��������� �� ������� ����� �� ������ ��`���) 1 �������� ���' , TObject(1040005004 ) );
      chkListWorks.Items.AddObject('�������122. 2.2.060301.03.1-2 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� �����, �� ��������� ��� �������� ������ 2.2.060301.03 '+'(������������� ��������� �� ������ 2.2.060301.03 � ��������� �� ������� ����� �� ������ ��`���) 2 �������� ���' , TObject(1040002375 ) );
      chkListWorks.Items.AddObject('�������123. 2.2.060301.03.1-3 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� �����, �� ��������� ��� �������� ������ 2.2.060301.03 '+'(������������� ��������� �� ������ 2.2.060301.03 � ��������� �� ������� ����� �� ������ ��`���) 3 �������� ���' , TObject(1040005005 ) );
      chkListWorks.Items.AddObject('�������124. 2.2.060301.03.1-4 ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� �����, �� ��������� ��� �������� ������ 2.2.060301.03 '+'(������������� ��������� �� ������ 2.2.060301.03 � ��������� �� ������� ����� �� ������ ��`���) 4 �������� ���' , TObject(1040005003 ) );
      chkListWorks.Items.AddObject('�������125. 2.2.060103.02.1-1 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� ������� ������ 2.2.060103.02 (������������� �� ������ 2.2.060103.02 '+'� ��������� �� ������� ����� �� ������ �ᒺ��) 1 �������� ���' , TObject(1040002383 ) );
      chkListWorks.Items.AddObject('�������126. 2.2.060103.02.1-2 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� ������� ������ 2.2.060103.02 (������������� �� ������ 2.2.060103.02 '+'� ��������� �� ������� ����� �� ������ �ᒺ��) 2 �������� ���' , TObject(1040004985 ) );
      chkListWorks.Items.AddObject('�������127. 2.2.060103.02.1-3 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� ������� ������ 2.2.060103.02 (������������� �� ������ 2.2.060103.02 '+'� ��������� �� ������� ����� �� ������ �ᒺ��) 3 �������� ���' , TObject(1040004986 ) );
      chkListWorks.Items.AddObject('�������128. 2.2.060103.02.1-4 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� ������� ������ 2.2.060103.02 (������������� �� ������ 2.2.060103.02 '+'� ��������� �� ������� ����� �� ������ �ᒺ��) 4 �������� ���' , TObject(1040004987 ) );
      chkListWorks.Items.AddObject('�������129. 2.2.060301.02.1-1 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� �������� ������ 2.2.060301.02 (������������� ��������� �� ������ 2.2.060301.02 '+'� ��������� �� ������� ����� �� ������ ��`���) 1 �������� ���' , TObject(1040002373 ) );
      chkListWorks.Items.AddObject('�������130. 2.2.060301.02.1-2 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� �������� ������ 2.2.060301.02 (������������� ��������� �� ������ 2.2.060301.02 '+'� ��������� �� ������� ����� �� ������ ��`���) 2 �������� ���' , TObject(1040004999 ) );
      chkListWorks.Items.AddObject('�������131. 2.2.060301.02.1-3 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� �������� ������ 2.2.060301.02 (������������� ��������� �� ������ 2.2.060301.02 '+'� ��������� �� ������� ����� �� ������ ��`���) 3 �������� ���' , TObject(1040004997 ) );
      chkListWorks.Items.AddObject('�������132. 2.2.060301.02.1-4 ������ ����� �������� ������ � ����������� � ��� ��� ������������, �� ��������� ��� �������� ������ 2.2.060301.02 (������������� ��������� �� ������ 2.2.060301.02 '+'� ��������� �� ������� ����� �� ������ ��`���) 4 �������� ���' , TObject(1040004998 ) );
      chkListWorks.Items.AddObject('�������133. 2.2.060101.01-1 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060101 (������������� ��������� �� ������ 2.2.060101 '+'� ��������� �� ������� ����� �� ������ ��`���) 1 �������� ���' , TObject(1040002391 ) );
      chkListWorks.Items.AddObject('�������134. 2.2.060101.01-2 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060101 (������������� ��������� �� ������ 2.2.060101 '+'� ��������� �� ������� ����� �� ������ ��`���) 2 �������� ���' , TObject(1040004911 ) );
      chkListWorks.Items.AddObject('�������135. 2.2.060101.01-3 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060101 (������������� ��������� �� ������ 2.2.060101 '+'� ��������� �� ������� ����� �� ������ ��`���) 3 �������� ���' , TObject(1040004912 ) );
      chkListWorks.Items.AddObject('�������136. 2.2.060101.01-4 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060101 (������������� ��������� �� ������ 2.2.060101 '+'� ��������� �� ������� ����� �� ������ ��`���) 4 �������� ���' , TObject(1040004913 ) );
      chkListWorks.Items.AddObject('�������137. 2.2.060102.01-1 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102 (������������� ��������� �� ������ 2.2.060102 '+'� ��������� �� ������� ����� �� ������ ��`���) 1 �������� ���' , TObject(1040002386 ) );
      chkListWorks.Items.AddObject('�������138. 2.2.060102.01-2 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102 (������������� ��������� �� ������ 2.2.060102 '+'� ��������� �� ������� ����� �� ������ ��`���) 2 �������� ���' , TObject(1040004941 ) );
      chkListWorks.Items.AddObject('�������139. 2.2.060102.01-3 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102 (������������� ��������� �� ������ 2.2.060102 '+'� ��������� �� ������� ����� �� ������ ��`���) 3 �������� ���' , TObject(1040004939 ) );
      chkListWorks.Items.AddObject('�������140. 2.2.060102.01-4 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060102 (������������� ��������� �� ������ 2.2.060102 '+'� ��������� �� ������� ����� �� ������ ��`���) 4 �������� ���' , TObject(1040004940 ) );
      chkListWorks.Items.AddObject('�������141. 2.2.060103.01-1 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103 (������������� ��������� �� ������ 2.2.060103 '+'� ��������� �� ������� ����� �� ������ ��`���) 1 �������� ���' , TObject(1040002381 ) );
      chkListWorks.Items.AddObject('�������142. 2.2.060103.01-2 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103 (������������� ��������� �� ������ 2.2.060103 '+'� ��������� �� ������� ����� �� ������ ��`���) 2 �������� ���' , TObject(1040004965 ) );
      chkListWorks.Items.AddObject('�������143. 2.2.060103.01-3 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103 (������������� ��������� �� ������ 2.2.060103 '+'� ��������� �� ������� ����� �� ������ ��`���) 3 �������� ���' , TObject(1040004964 ) );
      chkListWorks.Items.AddObject('�������144. 2.2.060103.01-4 ������ �� ������������ ����� �������� ������ � ����������� � ��� ��� ������������, ������������ �� ���������� ������, �� ��������� ��� �������� ������ 2.2.060103 (������������� ��������� �� ������ 2.2.060103 '+'� ��������� �� ������� ����� �� ������ ��`���) 4 �������� ���' , TObject(1040004963 ) );
      chkListWorks.Items.AddObject('�������145. 2.2.040305-1 �������������� ����- � ��������� ��������� � ����������������� �� 1000� � ����� �������������� ������� ����� �����������㳿 1 �������� ���' , TObject(1040002353 ) );
      chkListWorks.Items.AddObject('�������146. 2.2.050201-1 �������� ����������� ����� ���������� ����㳿 �� ������ ���������� ��������� 1 �������� ���' , TObject(1040002474 ) );
      chkListWorks.Items.AddObject('�������147. 2.2.050201-2 �������� ����������� ����� ���������� ����㳿 �� ������ ���������� ��������� 2 �������� ���' , TObject(1040004899 ) );
      chkListWorks.Items.AddObject('�������148. 2.2.050101-2 �������� ����������� ����� ���������� ����㳿 ��� �������� ���� ����� ����� 2 �������� ���' , TObject(1040004905 ) );
      chkListWorks.Items.AddObject('�������149. 2.2.050101-4 �������� ����������� ����� ���������� ����㳿 ��� �������� ���� ����� ����� 4 �������� ���' , TObject(1040004907 ) );
      chkListWorks.Items.AddObject('�������150. 2.2.050202-2 �������� ���������� ����� ���������� ����㳿 �������� 0,4�� �� ������ ���������� ��������� 2 �������� ���' , TObject(1040004903 ) );
      chkListWorks.Items.AddObject('�������151. 2.2.050103-1 �������� ���������� ����� ���������� ����㳿 �������� 0,4�� ��� �������� ���� ����� ����� 1 �������� ���' , TObject(1040002289 ) );
      chkListWorks.Items.AddObject('�������152. 2.2.050103-2 �������� ���������� ����� ���������� ����㳿 �������� 0,4�� ��� �������� ���� ����� ����� 2 �������� ���' , TObject(1040004927 ) );

      chkListWorks.Items.AddObject('�������153. 2.2.030101.1 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ � ��� ��� ���� ����� ��� 1-� ����� (���������������� ���������) 1 �������� ���' , TObject(1040004861 ) );
      chkListWorks.Items.AddObject('�������154. 2.2.030101.2 �������� ���������� ��� ���������� ������  (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ � ��� ��� ���� ����� ��� 1-� ����� (���������������� ���������) 2 �������� ���' , TObject(1040004863 ) );
      chkListWorks.Items.AddObject('�������155. 2.2.030101.3 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ � ��� ��� ���� ����� ��� 1-� ����� (���������������� ���������) 3 �������� ���' , TObject(1040004862 ) );
      chkListWorks.Items.AddObject('�������156. 2.2.030101.4 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ '+'� ��� ��� ���� ����� ��� 1-� ����� (���������������� ���������) 4 �������� ���' , TObject(1040002341 ) );
      chkListWorks.Items.AddObject('�������157. 2.2.030102.1 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ '+'� ��� ��� ���� ����� ��� 3-� ����� (���������������� ���������) 1 �������� ���' , TObject(1040002342 ) );

      chkListWorks.Items.AddObject('�������158. 2.2.030102.2 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ '+'� ��� ��� ���� ����� ��� 3-� ����� (���������������� ���������) 2 �������� ���' , TObject(1040004865 ) );
      chkListWorks.Items.AddObject('�������159. 2.2.030102.3 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ '+'� ��� ��� ���� ����� ��� 3-� ����� (���������������� ���������) 3 �������� ���' , TObject(1040004864 ) );
      chkListWorks.Items.AddObject('�������160. 2.2.030202.1 �������� ���������� ��� ���������� ������ (� ��������� ��������� ����� 16 ���) ���������� ��������� �� ������������ '+'� ��� ��������� ��� �� 1000 � (���������������� ���������) 1 �������� ���' , TObject(1040002346 ) );
      chkListWorks.Items.AddObject('�������161. 2.2.020201.1 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ���������� ��� 1 �������� ���' , TObject(1040002411 ) );
      chkListWorks.Items.AddObject('�������162. 2.2.020201.2 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ���������� ��� 2 �������� ���' , TObject(1040004843 ) );
      chkListWorks.Items.AddObject('�������163. 2.2.020201.3 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ���������� ��� 3 �������� ���' , TObject(1040004844 ) );
      chkListWorks.Items.AddObject('�������164. 2.2.020201.4 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ���������� ��� 4 �������� ���' , TObject(1040004845 ) );
      chkListWorks.Items.AddObject('�������165. 2.2.020202.2 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ��������� ��� 2 ��������  ���' , TObject(1040004846 ) );
      chkListWorks.Items.AddObject('�������166. 2.2.020202.3 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ��������� ��� 3 ��������  ���' , TObject(1040004847 ) );
      chkListWorks.Items.AddObject('�������167. 2.2.020202.4 �������� ���������� ��� ���������� ������ ���������� (����������) ��������� �� ������������ �� ���� �� �� 1000� ��������� ��� 4 ��������  ���' , TObject(1040004848 ) );
      chkListWorks.Items.AddObject('�������168. 2.2.060101-1 ����������� ������� �������� ����������� ������ ����������� ������ ����� �� 1000� �� ������� ���������� ���������, � �.�. ������ �� ������������ ������ � ���������� ���� '+'������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 1 �������� ���' , TObject(1040002360 ) );
      chkListWorks.Items.AddObject('�������169. 2.2.060101-4 ����������� ������� �������� ����������� ������ ����������� ������ ����� �� 1000� �� ������� ���������� ���������, � �.�. ������ �� ������������ ������ � ���������� ���� '+'������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 4 �������� ���' , TObject(1040004910 ) );
      chkListWorks.Items.AddObject('�������170. 2.2.060103.03-1 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������������ '+'������ � ���������� ���� ������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 1 �������� ���' , TObject(1040002384 ) );
      chkListWorks.Items.AddObject('�������171. 2.2.060103.03-2 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������������ '+'������ � ���������� ���� ������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 2 �������� ���' , TObject(1040004983 ) );
      chkListWorks.Items.AddObject('�������172. 2.2.060103.03-3 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������������ '+'������ � ���������� ���� ������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 3 �������� ���' , TObject(1040004982 ) );
      chkListWorks.Items.AddObject('�������173. 2.2.060103.03-4 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������������ '+'������ � ���������� ���� ������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 4 �������� ���' , TObject(1040004984 ) );
      chkListWorks.Items.AddObject('�������174. 2.2.060103.02 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������' , TObject(1040004966 ) );
      chkListWorks.Items.AddObject('�������175. 2.2.060103.02-1 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������ 1 �������� ���' , TObject(1040002382 ) );
      chkListWorks.Items.AddObject('�������176. 2.2.060103.02-2 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������ 2 �������� ���' , TObject(1040004981 ) );
      chkListWorks.Items.AddObject('�������177. 2.2.060103.02-3 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������ 3 �������� ���' , TObject(1040004967 ) );
      chkListWorks.Items.AddObject('�������178. 2.2.060103.02-4 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� � ���������� ����� ������������� ������ �� ������� ���������� ���������, � �.�. ������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������ 4 �������� ���' , TObject(1040004968 ) );
      chkListWorks.Items.AddObject('�������179. 2.2.060102.03-1 ����������� ������� �������� ����������� ������ ���������� ������ ����� �� 1000� ������� ��������� �� ������� ���������� ���������, � �.�. ������������ ������ � '+'���������� ���� ������� ��������, ������ ���������, ���� ��� ������������, ������������ �� ���������� ������ 1 �������� ���' , TObject(1040002389 ) );


end;  }

{if report_vid = 2  then // ������� ��� ����������
begin
      chkListWorks.Items.AddObject('�������1. ���������� ����������� ������������ ��������� ���������� ����㳿', TObject(500014198 ) );
      chkListWorks.Items.AddObject('�������2. ���������� ������������ ������������ ��������� ���������� ����㳿', TObject(500014758 ) );
      chkListWorks.Items.AddObject('�������3. ������� ����������� ������������ ��������� �����������㳿 ���� NP-06 TD', TObject(500013624 ) );
      chkListWorks.Items.AddObject('�������4. �������� � ���������� ����������� ������������ ��������� ���������� ����㳿', TObject(500021175 ) );
      chkListWorks.Items.AddObject('�������5. �������� ������� ������� ������� (����������, ����������) � ����������������� �������� ����� 1000 �', TObject(500020179 ) );
      chkListWorks.Items.AddObject('�������6. �������� ������ ��������������� (���������������������)  ����� �� �ᒺ�� ��������� � ����������������� �� 1000 � (��������� ���������)', TObject(500021212 ) );
      chkListWorks.Items.AddObject('�������7. �������� ������ ��������������� (���������������������)  ����� �� �ᒺ�� ��������� � ����������������� ����� 1000 � (��������� ���������)', TObject(500021213 ) );
      chkListWorks.Items.AddObject('�������8. ������� � ���������� ���� � ����������� ��������', TObject(1017016769 ) );
      chkListWorks.Items.AddObject('�������9. ������������� ������������ ��������� ���������� ����㳿 NP-06 TD ��� �������� � ����������', TObject(500014627 ) );
      chkListWorks.Items.AddObject('�������10. ������������� ������������ ��������� �����������㳿 � ������ ����������� ������', TObject(500021208 ) );
      chkListWorks.Items.AddObject('�������11. ������ 1 ����� ��������� ����������� ������������ ��������� ���������� ����㳿 NP-06TD', TObject(500013605 ) );
      chkListWorks.Items.AddObject('�������12. ������ 1 ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ������-1.15/2.0-�', TObject(500013595 ) );
      chkListWorks.Items.AddObject('�������13. ������ 1 ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ��-��05�', TObject(500013602 ) );
      chkListWorks.Items.AddObject('�������14. ������ 1 ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ��-��09', TObject(500013603 ) );
      chkListWorks.Items.AddObject('�������15. ������ 1 ����� ��������� ������������ ������������ ��������� ���������� ����㳿 ��4�-5030', TObject(500013607 ) );
      chkListWorks.Items.AddObject('�������16. ������ 1 ����� ��������� ������������ ������������ ��������� ���������� ����㳿 ��-6803 �', TObject(500013610 ) );
      chkListWorks.Items.AddObject('�������17. ������ I ����� ��������� ������� ��������������������� EP 180', TObject(500020846 ) );
      chkListWorks.Items.AddObject('�������18. ������ � ����� ��������� ���������� ����� ���������� �416, �4103', TObject(500020156 ) );
      chkListWorks.Items.AddObject('�������19. ������ � ����� ��������� ������������������� ���-85', TObject(500020164 ) );
      chkListWorks.Items.AddObject('�������20. ������ � ����� ��������� ����� ������������������� �91, �90, �4575/1�, 266�, �4501, �� 120', TObject(500020070 ) );
      chkListWorks.Items.AddObject('�������21. ������ � ����� ��������� ��������� ������������ �50, �505 (���� ������� 0,5) ', TObject(500020174 ) );
      chkListWorks.Items.AddObject('�������22. ������ � ����� ��������� ���������� �1101�, �4100/1-5, ���202/2�, ���210/3', TObject(500020159 ) );
      chkListWorks.Items.AddObject('�������23. ������ � ����� ��������� ������������, ����������, ���������� � ������������� �377, �378, �30', TObject(500020168 ) );
      chkListWorks.Items.AddObject('�������24. ������ � ����� ���������  ����� ������� ������ �595(���� ������� 01,5) �5026 (���� ������� 1,0)', TObject(500020177 ) );
      chkListWorks.Items.AddObject('�������25. ������ � ����� ��������� ����� �316, �334, �333', TObject(500020162 ) );
      chkListWorks.Items.AddObject('�������26. ������ � ����� ���������  �������������� ������������ ������� �� ��������� �829, �830, �842, �849, �855', TObject(500020178 ) );
      chkListWorks.Items.AddObject('�������27. ������ � ����� ���������  ��������� ������ ���-03��,���-10, ���-1', TObject(500020847 ) );
      chkListWorks.Items.AddObject('�������28. ������ � ����� ��������� ��������� ��� ������ � ����������� ������������������� ������� �300', TObject(500020272 ) );
      chkListWorks.Items.AddObject('�������29. ������ �� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 NP-06 TD', TObject(500014061 ) );
      chkListWorks.Items.AddObject('�������30. ������ �� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ������-1,15/2,0-�', TObject(500013930 ) );
      chkListWorks.Items.AddObject('�������31. ������ �� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ��-��05�', TObject(500014004 ) );
      chkListWorks.Items.AddObject('�������32. ������ �� ����� ��������� ������������ ������������ ��������� ���������� ����㳿 ��4�-5030', TObject(500013936 ) );
      chkListWorks.Items.AddObject('�������33. ������ �� ����� ��������� ������������ ������������ ��������� ��������� ����㳿 ��6803�', TObject(500014091 ) );
      chkListWorks.Items.AddObject('�������34. ������ ��� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 C�-��05�', TObject(500014263 ) );
      chkListWorks.Items.AddObject('�������35. ������ ��� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 NP-06 TD', TObject(500014203 ) );
      chkListWorks.Items.AddObject('�������36. ������ ��� ����� ��������� ����������� ������������ ��������� ���������� ����㳿 ������-1.15/2.0�', TObject(500014161 ) );
      chkListWorks.Items.AddObject('�������37. ������ ��� ����� ��������� ������������ ������������ ��������� ���������� ����㳿 ��4�-5030', TObject(500014201 ) );
      chkListWorks.Items.AddObject('�������38. ������ ��� ����� ��������� ������������ ������������ ��������� ���������� ����㳿 ��6803�', TObject(500014195 ) );
      chkListWorks.Items.AddObject('�������39. ������� �������� ��������� �� �� 150/35/10/6 ��', TObject(500019937 ) );
      chkListWorks.Items.AddObject('�������40. �������� ������������� ������������ ��������� �����������㳿 � ������ ����������� ������ 1 �������� ���', TObject(1040005208 ) );
      chkListWorks.Items.AddObject('�������41. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� �� 1000� (��������� ���������) 1 �������� ���', TObject(1040004837 ) );
      chkListWorks.Items.AddObject('�������42. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� �� 1000� (��������� ���������) 2 �������� ���', TObject(1040002648 ) );
      chkListWorks.Items.AddObject('�������43. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� �� 1000� (��������� ���������) 4 �������� ���', TObject(1040004839 ) );
      chkListWorks.Items.AddObject('�������44. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� ����� 1000� (��������� ���������) 1 �������� ���', TObject(1040004840 ) );
      chkListWorks.Items.AddObject('�������45. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� ����� 1000� (��������� ���������) 2 �������� ���', TObject(1040002665 ) );
      chkListWorks.Items.AddObject('�������46. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� ����� 1000� (��������� ���������) 3 �������� ���', TObject(1040004841 ) );
      chkListWorks.Items.AddObject('�������47. �������� ������ ��������������� (���������������������) ����� �� �ᒺ�� ��������� � ����������������� ����� 1000� (��������� ���������) 4 �������� ���', TObject(1040004842 ) );
      chkListWorks.Items.AddObject('�������48. ������������� ������������ ��������� �����������㳿 � ������ ����������� ������ 1 �������� ���', TObject(1040005207 ) );

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

               // �������� ��������� ��������� � ��������� �����
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
     args[7] :=  '0'  // �������� � ���������� ���� ����������
     else
     args[7] := '3'; // ������ �����������


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
      args[11] := '1' ; // �������� ������
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = true) )then
      args[11] := '2' ; //  ������������ ������

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
      args[16] := '1' ; // ��������
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[16] := '3' ; //  ������������


       argNames[17] := 'worktypecode';
       args[17] := IntToStr(worktypecode) ;

       argNames[20] := 'pwkindcode';
       if rbkindyear.Checked then
       args[20] := IntToStr(1)
        else
       args[20] := IntToStr(2);

     {  if report_vid = 1  then // ����������

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

        if report_vid = 2  then // ����������
        For i:=0 to chkListWorks.Count -1  do
        Begin
           if  chkListWorks.Checked[i] then
            begin
               argNames[18] := 'conditionTechcard';
                if  (   // ���� �������� ��� ��������(tc.code) ��� ���� ������������� (tkcl.code)
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
              // 01.03.2016 �� �������� code = 2017041445 ������� ������ ����� ���������� ���������� ����� ����� �� ������� ���� ��������� ����
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

           { �������� ����� �� ������� ��� �������� ����� 3 , ���� ������� �������� ��� ���� ,
           ������� ������ reportName := 'Zbyt/PlanFact/mainDodatok';
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
         ShowMessage('����� ������� ���� � ����� ���� !!! ');
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
