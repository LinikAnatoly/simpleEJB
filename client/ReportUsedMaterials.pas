unit ReportUsedMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst, InvokeRegistry, Rio, SOAPHTTPClient,DialogFormUnit;

type
  TfrmReportUsedMaterials = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    lblWorkState: TLabel;
    edtWorkState: TEdit;
    spbENPlanWorkState: TSpeedButton;
    spb1: TSpeedButton;
    lblElementType: TLabel;
    cbbElementType: TComboBox;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spb2: TSpeedButton;
    chklstGroupMaterials: TCheckListBox;
    spbCheckListAll: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    spbClearCleckList: TSpeedButton;
    gb1: TGroupBox;
    chkFormWorkPlan: TCheckBox;
    chkFormWorkPozaPlan: TCheckBox;
    gb3: TGroupBox;
    chkByRENs: TCheckBox;
    chkByObjects: TCheckBox;
    chkByBudgets: TCheckBox;
    lbl3: TLabel;
    chklstListBudget: TCheckListBox;
    spbCheckListAll1: TSpeedButton;
    spbClearCleckList1: TSpeedButton;
    lblYearGen: TLabel;
    cbbYearGen: TComboBox;
    chkWholeYear: TCheckBox;
    chkByMonths: TCheckBox;
    cbbMonthGen: TComboBox;
    lblMonthGen: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    HTTPRIOENElementType: THTTPRIO;
    HTTPRIOTENDepartment: THTTPRIO;
    HTTPRIOTKMaterials: THTTPRIO;
    chkCheckPr_identid: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure spb1Click(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spb2Click(Sender: TObject);
    procedure spbCheckListAllClick(Sender: TObject);
    procedure spbClearCleckListClick(Sender: TObject);
    procedure chkByBudgetsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbCheckListAll1Click(Sender: TObject);
    procedure spbClearCleckList1Click(Sender: TObject);
    procedure chkWholeYearClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

    departmentCode: Integer;
    renName: String;
    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    WorkStateCode : Integer;
    WorkStateName : String ;
    ObjectName : String;
    materialGroupCode: Integer;
    materialGroupName: String;
    WorkTypeCode :  Integer ;
    WorkTypeName : String ;
  end;

var
  frmReportUsedMaterials: TfrmReportUsedMaterials;

implementation

uses
  ENDepartmentController, ShowENDepartment, ChildFormUnit,
  ShowENElement, EditENElementFilter, ENElementController,
  ENElementTypeController, EnergyproController, ShowENPlanWorkState, ENConsts, 
  TKMaterialsController, ShowENPlanWorkType, ENPlanWorkTypeController, 
  DMReportsUnit;

{$R *.dfm}

procedure TfrmReportUsedMaterials.FormCreate(Sender: TObject);
begin
  departmentCode := -1;
  renName := '';
  elementCode := -1;
  elementName := '';
  budgetCode := -1;
  budgetName := '';
  WorkStateCode := -1; // тип работ
  WorkTypeCode := -1; // подвидработ
end;

procedure TfrmReportUsedMaterials.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;

  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;

  TempTKMaterials: TKMaterialsControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;

begin

      DisableControls([edtEPRenName, edtENElementName, edtWorkState , edtTypeName]);
  HideControls([ chkByMonths]);

  chkCheckPr_identid.Checked := True;

  { заполняем выпадающий список типов объектов }
  cbbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE;   
  f.orderBySQL := 'code';

  cbbElementType.Items.Add('');

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  cbbElementType.DropDownCount := ENElementTypeList.totalCount + 1;


      // заполняем список бюджетодержателей

     departmentfilter := ENDepartmentFilter.Create;
     SetNullIntProps(departmentfilter);
     SetNullXSProps(departmentfilter);

     departmentfilter.conditionSQL := '  typerefcode = 200 and parentrefcode is not null ';

     TempTKBudget:= HTTPRIOTENDepartment as ENDepartmentControllerSoapPort;
     ENDepartmentList := TempTKBudget.getScrollableFilteredList(departmentfilter,0,-1);
     chklstListBudget.Items.Clear;

     for bi:=0 to High(ENDepartmentList.list) do
      begin

        chklstListBudget.Items.AddObject(ENDepartmentList.list[bi].shortName  , TObject( ENDepartmentList.list[bi].code )  );
      end;

      {заполняем группы материалов}

     
     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);
     chklstGroupMaterials.Items.Clear;

    for i:=0 to High(TKMaterialsList.list) do
      begin
        chklstGroupMaterials.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
      end;

      SetComboBoxCurrentYearWithStart(cbbYearGen, 2009, 2);
      SetComboBoxCurrentMonth(cbbMonthGen);
end;

procedure TfrmReportUsedMaterials.spbEPRenClick(Sender: TObject);
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
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin

          departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;

          HideControls([chkByRENs], (departmentCode > -1));
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmReportUsedMaterials.spbEPRenClearClick(Sender: TObject);
begin
  departmentCode := -1;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chkByRENs], false);

end;

procedure TfrmReportUsedMaterials.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmReportUsedMaterials.cbbElementType.ItemIndex > -1 then
  begin
    if Integer(frmReportUsedMaterials.cbbElementType.Items.Objects[frmReportUsedMaterials.cbbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmReportUsedMaterials.cbbElementTYpe.Items.Objects[frmReportUsedMaterials.cbbElementType.ItemIndex]);
    end;
  end;

  
  f.orderBySQL := 'typerefcode';

  if departmentCode > -1 then
  begin
    f.renRef := EPRenRef.Create;
    f.renRef.code := departmentCode;
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
          cbbElementType.Enabled := False;
          cbbElementType.ItemIndex := cbbElementType.Items.IndexOf(GetReturnValue(sgENElement,4));
         // ComboBox'->ItemIndex = ComboBox'->Items->IndexOf(your_text);

          ///
          if elementCode > -1 then chkByObjects.Checked := false;
          HideControls([chkByObjects], (elementCode > -1));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmReportUsedMaterials.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
  HideControls([chkByObjects], false);

  DisableControls([cbbElementType] , False  ) ;
  cbbElementType.ItemIndex := cbbElementType.Items.IndexOf('');

end;

procedure TfrmReportUsedMaterials.spbENPlanWorkStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow: TfrmENPlanWorkStateShow;

begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin
      DisableActions([ actEdit, actInsert ],DialogState = dsView  );
        if ShowModal = mrOk then
        begin
            try
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1);
               WorkStateCode:= StrToInt(GetReturnValue(sgENPlanWorkState,0));
               WorkStateName:= GetReturnValue(sgENPlanWorkState,1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;

procedure TfrmReportUsedMaterials.spb1Click(Sender: TObject);
begin

  WorkStateCode := 0 ;
  WorkStateName := ' ' ;
  edtWorkState.Text := '' ;

end;

procedure TfrmReportUsedMaterials.spbTypeClick(Sender: TObject);
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

procedure TfrmReportUsedMaterials.spb2Click(Sender: TObject);
begin
  inherited;
  WorkTypeCode := -1 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;
end;

procedure TfrmReportUsedMaterials.spbCheckListAllClick(Sender: TObject);
var
  i : Integer;
begin
   For i:=0 to chklstGroupMaterials.Count -1  do
    Begin
       if  chklstGroupMaterials.Checked[i] = false then
           chklstGroupMaterials.Checked[i] := true;

    end;

end;
procedure TfrmReportUsedMaterials.spbClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin
     For i:=0 to chklstGroupMaterials.Count -1  do
    Begin
       if  chklstGroupMaterials.Checked[i] = True then
           chklstGroupMaterials.Checked[i] := False;
    End;
end;

procedure TfrmReportUsedMaterials.chkByBudgetsClick(Sender: TObject);
var
i : integer;
begin
  if chkByBudgets.Checked = true  then
   DisableControls([chklstListBudget , spbCheckListAll1 , spbClearCleckList1 ],false)
   else
    begin
     DisableControls([chklstListBudget ,  spbCheckListAll1 ,  spbClearCleckList1 ]);
     For i:=0 to chklstListBudget.Count -1  do
      Begin
          if  chklstListBudget.Checked[i] = True then
              chklstListBudget.Checked[i] := False;
      End;


    end;

end;

procedure TfrmReportUsedMaterials.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName ,  strBudget , strGroupmaterials : String;
  i : integer;
begin

          /// собираем строку кодов бюджетодержателей
   For i:=0 to chklstListBudget.Count -1  do
    Begin
       if  chklstListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ' , ' + IntToStr(  Integer( chklstListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( chklstListBudget.Items.Objects[i] ) ) ;

    End;

    // Parameters
      SetLength(argNames, 26);
      SetLength(args, 26);

      argNames[0] := 'yearGen';
      args[0] := cbbYearGen.Text;

      argNames[1] := 'monthGen';
      args[1] := IntToStr(cbbMonthGen.ItemIndex + 1);

      argnames[2] := 'departmentCode';
      args[2] := IntToStr(departmentCode);

      argnames[3] := 'wholeYear';
      if chkWholeYear.Checked then
      args[3] := '1'
      else
      args[3] := '-1';


      argnames[4] := 'dNameField';
      if chkByRENs.Checked then
        args[4] := 'dep.name'
      else
        args[4] := '1';

      argnames[5] := 'dbNameField';
      if chkByBudgets.Checked then
        args[5] := 'budj.name'
      else
        args[5] := '1';

      argnames[6] := 'objNameField';
      if chkByObjects.Checked then
        args[6] := 'ed.ename||' + chr(39) + ', инв№ ' + chr(39) + ' ||coalesce(ed.invnumber,'+chr(39) + ' ' + chr(39) + ')'
      else
        args[6] := '1';

      argnames[7] := 'elementCode';
      args[7] := IntToStr(elementCode);

      argnames[8] := 'planworkstatecode';
      args[8] := IntToStr(WorkStateCode);

      argnames[9] := 'elementtypecode';
      if (cbbElementType.ItemIndex = -1  ) or
          (cbbElementType.ItemIndex = 0 ) then
      args[9] := IntToStr(-1)
      else
      args[9] := IntToStr(Integer(cbbElementTYpe.Items.Objects[cbbElementType.ItemIndex])) ;

      argnames[10] := 'planform';
      If (( chkFormWorkPozaPlan.Checked = True ) and (chkFormWorkPlan.Checked = True)) then
        args[10] := '-1'
      Else If chkFormWorkPlan.Checked = True Then // плановые работы
        args[10] := '1'
      Else If chkFormWorkPozaPlan.Checked = True Then   // внеплановые работы
        args[10] := '2';

      argNames[11] := 'planworktypecode';
      if WorkTypeCode <> -1 then
      args[11] := IntToStr(WorkTypeCode)
      else
      args[11] := IntToStr(-1);

      argnames[12] := 'budgetstringcode';
      if strBudget <> '' then
      args[12] :=  ' p.budgetrefcode in (  ' + strBudget + ')'
      else
      args[12] := ' 1 = 1 ';


   /// собираем строку групп материалов
   strGroupmaterials:= '';
   For i:=0 to chklstGroupMaterials.Count -1  do
    Begin
       if  chklstGroupMaterials.Checked[i] then
        if strGroupmaterials <>  '' then
           strGroupmaterials := strGroupmaterials + ' , ' + IntToStr(  Integer( chklstGroupMaterials.Items.Objects[i] ) )
         else
           strGroupmaterials := strGroupmaterials + IntToStr(  Integer( chklstGroupMaterials.Items.Objects[i] ) ) ;

    End;


    if strGroupmaterials = '' then
    begin
       Application.MessageBox(PChar('Необхідно обрати групи матеріалів !!!'),PChar('Увага !!!'),MB_ICONWARNING+MB_OK);
       ModalResult := mrNone;
       exit;
    end  ;

        if  trim(strGroupmaterials) <> ''  then
         strGroupmaterials := ' tm.rootgrouprefcode in ('+strGroupmaterials+')'
        else
         strGroupmaterials := ' 1 = 1 ';

     argnames[13] := 'strGroupmaterials';
     args[13]:= strGroupmaterials;

     argnames[14] := 'Titletxt';

        if  chkCheckPr_identid.Checked then
          begin
            if chkByMonths.Checked = False then
             begin
             reportName := 'material/usedMaterials/usedMaterials'; // c групировкой по класификатору для одного месяца
             args[14]:= 'Звіт по використаним матеріалам ' + ' за ' + cbbYearGen.Text + ' рік ' ;
             end
            else
            begin
            reportName := 'material/usedMaterials/usedMaterialsByYear';
            args[14]:= 'Звіт по використаним матеріалам ' + ' за ' + cbbYearGen.Text + ' рік ' ;
            end;
          end;


          if not chkCheckPr_identid.Checked then
          begin
            if chkByMonths.Checked = False then
            begin
            reportName := 'material/usedMaterials/usedMaterialsNotKlassificator';             // без группировки по класификатору для одного месяца
            args[14]:= 'Звіт по використаним матеріалам ' + ' за ' + cbbYearGen.Text + ' рік ' ;
            end
            else
            begin
            reportName := 'material/usedMaterials/usMatByYearNotKlassfctr';
            args[14]:= 'Звіт по використаним матеріалам ' + ' за ' + cbbYearGen.Text + ' рік ' ;
            end;
          end;

           if not chkWholeYear.Checked then
           args[14]:= args[14] + ' ' + cbbMonthGen.Text + ' місяць';

           if WorkStateName <> '' then
           args[14]:= args[14] + chr(10) +  '  Тип акту - ' + WorkStateName;
           if ((cbbElementType.ItemIndex <> -1) and (cbbElementType.ItemIndex <> 0 )) then
           args[14]:= args[14] + chr(10) + ' Тип об`єкта - ' + cbbElementType.Text;
           if Trim(edtTypeName.Text) <> '' then
           args[14]:= args[14] + chr(10) + ' Підвид робіт -' + edtTypeName.Text;

           If (( chkFormWorkPozaPlan.Checked = True ) and (chkFormWorkPlan.Checked = True)) then
           args[14] := args[14] + chr(10) + ' Вид робіт - Планові та позапланові'
           Else If ((chkFormWorkPlan.Checked = True) and (chkFormWorkPozaPlan.Checked = False)) Then // плановые работы
           args[14] := args[14] + chr(10) + ' Вид робіт - Планові '
           Else If ((chkFormWorkPozaPlan.Checked = True ) and ( chkFormWorkPlan.Checked = False )) Then   // внеплановые работы
           args[14] := args[14] + chr(10) + ' Вид робіт - Позапланові';

           makeReport(reportName, argNames, args, 'xls');

end;

procedure TfrmReportUsedMaterials.spbCheckListAll1Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to chklstListBudget.Count -1  do
    Begin
       if  chklstListBudget.Checked[i] = false then
           chklstListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmReportUsedMaterials.spbClearCleckList1Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to chklstListBudget.Count -1  do
    Begin
       if  chklstListBudget.Checked[i] = True then
           chklstListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmReportUsedMaterials.chkWholeYearClick(Sender: TObject);
begin
   HideControls([lblMonthGen, cbbMonthGen], chkWholeYear.Checked);
  HideControls([chkByMonths], not chkWholeYear.Checked);
  if chkWholeYear.Checked = False then
     chkByMonths.Checked := False;

end;

end.
