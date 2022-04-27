unit reportWorksZbyt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons , DialogFormUnit , EnergyproController , DMReportsUnit,
  InvokeRegistry, Rio, SOAPHTTPClient , ENActController , ChildFormUnit , FINMaterialsController,
  CheckLst , DateUtils ;

type
  TfrmreportWorksZbyt = class(TDialogForm)
    lblYearRaznar: TLabel;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label1: TLabel;
    dtpEndDate: TDateTimePicker;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    spbEPRenClear: TSpeedButton;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    HTTPRIOENElementType: THTTPRIO;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbPodVidClear: TSpeedButton;
    HTTPRIOTKMaterials: THTTPRIO;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    spbFINExetutorClear: TSpeedButton;
    GroupBox1: TGroupBox;
    chkFormPlanPlan: TCheckBox;
    chkFormPlanPozaPlan: TCheckBox;
    Label3: TLabel;
    HTTPRIOTENDepartment: THTTPRIO;
    gbPlanFactStatus: TGroupBox;
    chkENPLANWORKSTATUS_GOOD: TCheckBox;
    ENPLANWORKSTATUS_LOCKED: TCheckBox;
    procedure btnOkClick(Sender: TObject);
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
    procedure SpeedButton4Click(Sender: TObject);
    procedure spbMaterialClick(Sender: TObject);
    procedure spbMaterialClearClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure spbFINExetutorClearClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
    finExecutor_finCode : Integer;

    report_vid : Integer; //(1-енергосб≥т  2- метрологи€ )

  end;

var
  frmreportWorksZbyt: TfrmreportWorksZbyt;

implementation

uses Math , ENDepartmentController, ENDepartmentTypeController , ShowENDepartment ,
 ENConsts , ShowENElement, ENElementController , ENElementTypeController ,
ShowENPlanWorkState , ENPlanWorkStateController , ShowENPlanWorkType , ENPlanWorkTypeController ,
EditENAct, EditENActFilter , ShowENAct  , ShowFINMaterials , ShowTKMaterials, TKMaterialsController ,
ShowFINExecutorTree , FINExecutorController , ENForImplementation;

{$R *.dfm}

procedure TfrmreportWorksZbyt.btnOkClick(Sender: TObject);
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
begin

  begin

     countselbudj := 0;

     SetLength(argNames, 20);
     SetLength(args, 20);


     argNames[0] := 'datestart';
     args[0] := DateToStr(dtpStartDate.DateTime);

     argNames[1] := 'datefinal';
     args[1] := DateToStr(dtpEndDate.DateTime);

     argNames[2] := 'podr';
     args[2] :=  IntToStr(renCode);

     argNames[3] := 'finexecutorname';
     args[3]:= finExecutor_name;

     argNames[4] := 'finexecutorfincode';
     args[4]:=  IntToStr(finExecutor_finCode);

     argNames[5] := 'obj';
     args[5] :=  IntToStr(elementCode);

     argNames[6] := 'formplan';
      if ( (chkFormPlanPlan.Checked = true) and (chkFormPlanPozaPlan.Checked = true) )then
      args[6] := '0' ;
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = false) )then
      args[6] := '0' ;
      if ( (chkFormPlanPlan.Checked = true) and (chkFormPlanPozaPlan.Checked = false) )then
      args[6] := '1' ; // плановые работы
      if ( (chkFormPlanPlan.Checked = false) and (chkFormPlanPozaPlan.Checked = true) )then
      args[6] := '2' ; //  позаплановые работы

      argNames[7] := 'podrname';
      args[7] := renName;

      argNames[8] := 'statusplanfact';
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[8] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[8] := '0' ;
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = true) and (ENPLANWORKSTATUS_LOCKED.Checked = false) )then
      args[8] := '1' ; // черновые
      if ( (chkENPLANWORKSTATUS_GOOD.Checked = false) and (ENPLANWORKSTATUS_LOCKED.Checked = true) )then
      args[8] := '3' ; //  утвержденные


       argNames[9] := 'worktypecode';
       args[9] := IntToStr(worktypecode) ;


       reportName := 'Zbyt/worksZbyt/worksZbyt';
       makeReportWithExecute(reportName, argNames, args, 'xls', '–оботи_≈нергозбут');

  end;

end;

procedure TfrmreportWorksZbyt.spbENBudgetClick(Sender: TObject);
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

procedure TfrmreportWorksZbyt.spbEPRenClearClick(Sender: TObject);
begin


  renCode := 1;
  renName := '’ерсонќбл≈нерго';
  edtEPRenName.Text := '';
end;

procedure TfrmreportWorksZbyt.spbEPRenClick(Sender: TObject);
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

procedure TfrmreportWorksZbyt.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '';

end;

procedure TfrmreportWorksZbyt.FormCreate(Sender: TObject);
begin
   renCode := 1; // подразделение '’ерсонќбл≈нерго'
   renName := '’ерсонќбл≈нерго';
   budgCode:= 0;
   elementCode :=0 ;
   ActTypeCode :=0 ;
   WorkTypeCode :=0 ;
   NumberActCode := 0;
   materialCode := -1;
   finExecutor_finCode := 0;
   finExecutor_name:= '';
   

   
end;

procedure TfrmreportWorksZbyt.spbENElementClick(Sender: TObject);

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
  // ј дл€ ’ќЁ (renCode = 0) выбираем все объекты

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


procedure TfrmreportWorksZbyt.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

end;

procedure TfrmreportWorksZbyt.FormShow(Sender: TObject);
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
begin
  DisableControls([edtEPRenName, edtENElementName,  edtTypeName
                   , edtFINExecutorName ]);


  { заполн€ем выпадающий список типов объектов }


  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';  
  f.orderBySQL := 'code';



  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
//  for i:=0 to ENElementTypeList.totalCount-1 do
//  begin
//    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
//  end;
//
//    cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;
//

    {заполн€ем группы материалов}

     
     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);

   // заполн€ем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';



     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);

  DecodeDate(now,y,m,d);
  dtpEndDate.DateTime := EndOfAMonth(y, m);
  dtpEndDate.Checked := true;

  dtpStartDate.DateTime := EncodeDate(y,m,1);
  dtpStartDate.Checked := true;



end;

procedure TfrmreportWorksZbyt.spbENPlanWorkStateClick(Sender: TObject);
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

procedure TfrmreportWorksZbyt.spbTypeactClearClick(Sender: TObject);
begin
  ActTypeCode := 0 ;
  ActTypeName := ' ' ;
  //edtActType.Text := '' ;
end;

procedure TfrmreportWorksZbyt.spbTypeClearClick(Sender: TObject);
begin
  inherited;
   edtTypeName.Text:= '';
   WorkTypeCode := 0;
end;

procedure TfrmreportWorksZbyt.spbTypeClick(Sender: TObject);
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

procedure TfrmreportWorksZbyt.spbPodVidClearClick(Sender: TObject);
begin
  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;

end;

procedure TfrmreportWorksZbyt.SpeedButton4Click(Sender: TObject);
begin

  // edtNumberAct.Text := '';
   NumberActCode:= 0 ;

end;

procedure TfrmreportWorksZbyt.spbMaterialClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 fmFilter : TkMaterialsFilter;
 strGroupmaterials : String;
 i : integer;
begin

end;

procedure TfrmreportWorksZbyt.spbMaterialClearClick(Sender: TObject);
begin
  materialCode := -1;
  materialName := '0';


end;

procedure TfrmreportWorksZbyt.Button1Click(Sender: TObject);
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
begin
  begin

     countselbudj := 0;

     SetLength(argNames, 20);
     SetLength(args, 20);


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


     argNames[6] := 'typeact';
     args[6] :=  IntToStr(ActTypeCode);

     argNames[8] := 'finexecutorname';
     args[8]:= finExecutor_name;

     argNames[9] := 'finexecutorfincode';
     args[9]:=  IntToStr(finExecutor_finCode);


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


       if report_vid = 1  then // енергосбыт




  end;

end;

procedure TfrmreportWorksZbyt.CheckBox1Click(Sender: TObject);
var
i : integer;
begin


end;

procedure TfrmreportWorksZbyt.CheckBox2Click(Sender: TObject);
var
i : integer;
begin


end;

procedure TfrmreportWorksZbyt.spbFINExecutorClick(Sender: TObject);
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
              finExecutor_finCode := FINExecutorShort(tvDep.Selected.Data).finCode;

              edtFINExecutorName.Text := finExecutor_name;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmreportWorksZbyt.spbFINExetutorClearClick(
  Sender: TObject);
begin

   edtFINExecutorName.Text := '';
   finExecutor_finCode:= 0;

end;

end.
