unit ENForImplementation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls , ENPlanWorkController,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst, Mask;

type
  TfrmENForImplementation = class(TDialogForm)
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
    GroupBox2: TGroupBox;
    rbYear: TRadioButton;
    rbTekush: TRadioButton;
    chkkindrefcodemat: TCheckBox;
    spbENPlanWorkState: TSpeedButton;
    edtWorkState: TEdit;
    lblWorkState: TLabel;
    SpeedButton1: TSpeedButton;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    CheckPr_mat_group: TCheckBox;
    GroupBox3: TGroupBox;
    chkFormWorkPlan: TCheckBox;
    chkFormWorkPozaPlan: TCheckBox;
    lblMaterialGroup: TLabel;
    edtMaterialGroup: TEdit;
    spbMaterialGroup: TSpeedButton;
    spbMaterialGroupClear: TSpeedButton;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    SpeedButton2: TSpeedButton;
    chkEstimateStatus: TCheckBox;
    GroupBox5: TGroupBox;
    cbOrderTypeBudg: TCheckBox;
    cbOrderTypeInvest: TCheckBox;
    GroupBox4: TGroupBox;
    chkzamovl: TCheckBox;
    chknezamovl: TCheckBox;
    chkNayavn: TCheckBox;
    RadioGroup1: TRadioGroup;
    ListBudget: TCheckListBox;
    btnCheckListAll: TSpeedButton;
    Label1: TLabel;
    btnClearCleckList: TSpeedButton;
    Label5: TLabel;
    Label2: TLabel;
    HTTPRIOTENDepartment: THTTPRIO;
    grpklasskod: TGroupBox;
    edtSymbolcount1997: TEdit;
    lblIdentid: TLabel;
    edtIdentid: TMaskEdit;
    chkIsNotEnergozbyt: TCheckBox;
    HTTPRIOTKMaterialsLocal: THTTPRIO;
    grpStatusPozaplanPlans: TGroupBox;
    chkEnplanworkStatus1: TCheckBox;
    chkEnplanworkStatus3: TCheckBox;
    grpEnplanworkStatusInvest: TGroupBox;
    chkEnplanworkStatus1_Invest: TCheckBox;
    chkEnplanworkStatus3_Invest: TCheckBox;
    edtSymbolCount2010: TEdit;
    rbzamovl: TRadioButton;
    rbNezakazanie: TRadioButton;
    rbnezamovl: TRadioButton;
    rball: TRadioButton;
    rbnotNepotrNotNayavn: TRadioButton;
    rbAllstatus: TRadioButton;
    rbDK2010: TRadioButton;
    rbDK1997: TRadioButton;
    CheckPr_identid: TCheckBox;
    chk_enplanworkstatus_works_finished: TCheckBox;
    rbDK2015: TRadioButton;
    edtSymbolCount2015: TEdit;
    cbWithNN: TCheckBox;
    gbNomenclaturesDep: TGroupBox;
    cbDepNomVSP: TCheckBox;
    cbDepNomGP: TCheckBox;
    cbDepNomSK: TCheckBox;
    cbDepNomCur: TCheckBox;
    cbDepNomVLep: TCheckBox;
    cbDepNomGEN: TCheckBox;
    cbDepNomKAH: TCheckBox;
    cbDepNomIVA: TCheckBox;
    cbDepNomNTR: TCheckBox;
    cbDepNomCHA: TCheckBox;
    cbDepNomNKAH: TCheckBox;
    cbDepNomHGES: TCheckBox;
    cbDepNomSKLAD: TCheckBox;
    edtMOL: TEdit;
    lblMOL: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    chkOWN_PRODUCTION: TCheckBox;
    chkDisplayLast_buy_partner: TCheckBox;
    chbByFinExecutor: TCheckBox;
    procedure chbWholeYearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure rbTekushClick(Sender: TObject);
    procedure rbYearClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbElementTypeChange(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnClearCleckListClick(Sender: TObject);
    procedure btnCheckListAllClick(Sender: TObject);
    procedure ListBudgetClickCheck(Sender: TObject);
    procedure chbByBudgetsClick(Sender: TObject);
    procedure CheckPr_identidClick(Sender: TObject);
    procedure edtSymbolcount1997Change(Sender: TObject);
    procedure edtIdentidChange(Sender: TObject);
    procedure edtIdentidKeyPress(Sender: TObject; var Key: Char);
    procedure SaveToFile(str:string);
    procedure chkFormWorkPozaPlanClick(Sender: TObject);
    procedure cbOrderTypeInvestClick(Sender: TObject);
    procedure rbDK1997Click(Sender: TObject);
    procedure rbDK2010Click(Sender: TObject);
    procedure edtSymbolCount2010Change(Sender: TObject);
    procedure cbWithNNClick(Sender: TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
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
    WorkStateCode : Integer;
    WorkStateName : String ;
    ObjectName : String;
    materialGroupCode: Integer;
    materialGroupName: String;
    WorkTypeCode :  Integer ;
    WorkTypeName : String ;
    materialGroupCodes : WideString;
  end;

var
  frmENForImplementation: TfrmENForImplementation;
  ENPlanWorkFilterObj: ENPlanWorkFilter;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController , EditENPlanWorkState,
  ShowENPlanWorkState , ENPlanWorkStateController , ENElementTypeController ,
  ShowTKMaterials, TKMaterialsController , ShowENPlanWorkType , ENPlanWorkTypeController  , 
  ShowTKMaterialsAddGroup, Math, ShowFINMol, FINMolController;

{$R *.dfm}

procedure TfrmENForImplementation.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
  HideControls([chbByMonths], not chbWholeYear.Checked);
  if chbWholeYear.Checked = False then
     chbByMonths.Checked := False;
end;

procedure TfrmENForImplementation.spbEPRenClick(Sender: TObject);
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

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;

          HideControls([chbByRENs], (renCode > 0));
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENForImplementation.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;

  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;
begin


  DisableControls([edtEPRenName, edtENElementName, edtENBudgetName , edtWorkState , edtTypeName  , edtSymbolcount1997, edtSymbolcount2010] );
  HideControls([{lblENElementName, edtENElementName, spbENElement, spbENElementClear,} chbByMonths]);

  HideControls([gbNomenclaturesDep]);

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


      cbOrderTypeInvestClick(self);
      chkFormWorkPozaPlanClick(self);

      SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
      edtYearGen.Items.Add('2066');
      SetComboBoxCurrentMonth(edtMonthGen);
end;

procedure TfrmENForImplementation.FormCreate(Sender: TObject);
var
tn : TTreeNode;
  cnt : integer;
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';
  WorkStateCode := 0; // тип работ
  WorkTypeCode := 0; // подвидработ

//   MyTreeView := TTreeView.Create(Self);
//  with MyTreeView do begin
//    Parent := Self;
//    Align := alClient;
//    Items.Add(nil, 'Root');
//    Items.Add(1, 'Root');
//  end {with};
      
  
end;

procedure TfrmENForImplementation.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmENForImplementation.cbElementType.ItemIndex > -1 then
  begin
    if Integer(frmENForImplementation.cbElementTYpe.Items.Objects[frmENForImplementation.cbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmENForImplementation.cbElementTYpe.Items.Objects[frmENForImplementation.cbElementType.ItemIndex]);
    end;
  end;

  
  f.orderBySQL := 'typerefcode';

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
          /// показываем тип объекта в cbElementType
          cbElementType.Enabled := False;
          cbElementType.ItemIndex := cbElementType.Items.IndexOf(GetReturnValue(sgENElement,4));
         // ComboBox'->ItemIndex = ComboBox'->Items->IndexOf(your_text);

          ///
          if elementCode > 0 then chbByObjects.Checked := false;
          HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;

procedure TfrmENForImplementation.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);
end;

procedure TfrmENForImplementation.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
  HideControls([chbByObjects], false);

  DisableControls([cbElementType] , False  ) ;
  cbElementType.ItemIndex := cbElementType.Items.IndexOf('');
end;

procedure TfrmENForImplementation.spbENBudgetClick(Sender: TObject);
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

procedure TfrmENForImplementation.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);
end;

procedure TfrmENForImplementation.rbTekushClick(Sender: TObject);
begin
    rbTekush.Checked := True;
    rbYear.Checked := False;

end;

procedure TfrmENForImplementation.rbYearClick(Sender: TObject);
begin
    rbTekush.Checked := False;
    rbYear.Checked := True;

end;

procedure TfrmENForImplementation.spbENPlanWorkStateClick(Sender: TObject);
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
               edtWorkState.Text:= GetReturnValue(sgENPlanWorkState,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmENForImplementation.SpeedButton1Click(Sender: TObject);
begin

  WorkStateCode := 0 ;
  WorkStateName := ' ' ;
  edtWorkState.Text := '' ;
  
end;

procedure TfrmENForImplementation.cbElementTypeChange(Sender: TObject);
begin

  ObjectName:= frmENForImplementation.cbElementTYpe.Text ;
  ObjectName:= ObjectName ;

end;

procedure TfrmENForImplementation.spbMaterialGroupClick(Sender: TObject);
var
 frmSpr_matherialShowAddGroup: TfrmTKMaterialsShowAddGroup;

 i : Integer;
 TempmaterialGroupCodes :WideString;
 TempTKMaterials: TKMaterialsControllerSoapPort;
begin

 frmSpr_matherialShowAddGroup := TfrmTKMaterialsShowAddGroup.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShowAddGroup do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin

        try
          //materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          //edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
            // собираем выбранные группы материалов если есть )
            materialGroupCodes := '';

            TempTKMaterials := HTTPRIOTKMaterialsLocal as TKMaterialsControllerSoapPort;
            for i := 1 to advstrngrdFilterGroup.RowCount - 1 do
            begin
              TempmaterialGroupCodes := '';
              TempmaterialGroupCodes :=  TempTKMaterials.getTKMaterialsCodesDown(StrToInt(advstrngrdFilterGroup.cells[0,i]));

               if materialGroupCodes = '' then
                 begin
                  materialGroupCodes := TempmaterialGroupCodes;
                  edtMaterialGroup.Text :=  advstrngrdFilterGroup.cells[1,i];
                 end
               else
                 begin
                  materialGroupCodes := materialGroupCodes + ' , ' + TempmaterialGroupCodes;
                  edtMaterialGroup.Text :=  edtMaterialGroup.Text + ' , ' + advstrngrdFilterGroup.cells[1,i];
                 end;

            end;

            


        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShowAddGroup.Free;
  end;




    

end;

procedure TfrmENForImplementation.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
  edtMOL.Text := '';
end;

procedure TfrmENForImplementation.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

  i: Integer;

begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if Length(edtMol.Text) > 1 then
               edtMol.Text := edtMol.Text + ',';
               edtMol.Text := edtMol.Text + GetReturnValue(sgFINMol,0);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmENForImplementation.spbMaterialGroupClearClick(Sender: TObject);
begin
  materialGroupCode := 0;
  materialGroupName := '';
  edtMaterialGroup.Text := '';
  materialGroupCodes := '';
end;

procedure TfrmENForImplementation.spbTypeClick(Sender: TObject);
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



procedure TfrmENForImplementation.SpeedButton2Click(Sender: TObject);
begin

  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;

end;

procedure TfrmENForImplementation.btnClearCleckListClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;
   

end;

procedure TfrmENForImplementation.btnCheckListAllClick(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;
 

end;

procedure TfrmENForImplementation.ListBudgetClickCheck(Sender: TObject);
var
 i : integer;
 strBudget : string;
begin

    For i:=0 to frmENForImplementation.ListBudget.Count -1  do
    Begin
       if  frmENForImplementation.ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ' , ' + IntToStr(  Integer( frmENForImplementation.ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( frmENForImplementation.ListBudget.Items.Objects[i] ) ) ;

    End;

    if strBudget <> '' then
    btnOk.Enabled := true
    else
    btnOk.Enabled := False;

end;

procedure TfrmENForImplementation.chbByBudgetsClick(Sender: TObject);
var
i : integer;
begin
  if chbByBudgets.Checked = true  then
   frmENForImplementation.DisableControls([frmENForImplementation.ListBudget ,
                                           frmENForImplementation.btnCheckListAll ,
                                           frmENForImplementation.btnClearCleckList ],false)
   else
    begin
     frmENForImplementation.DisableControls([frmENForImplementation.ListBudget ,
                                           frmENForImplementation.btnCheckListAll ,
                                           frmENForImplementation.btnClearCleckList ]);
        For i:=0 to ListBudget.Count -1  do
     Begin
         if  ListBudget.Checked[i] = True then
             ListBudget.Checked[i] := False;


     End;

    
    end;

end;

procedure TfrmENForImplementation.CheckPr_identidClick(Sender: TObject);
begin

   // inherited;
      if CheckPr_identid.Checked then
      begin
          if edtIdentid.EditText <> '__.__.__.___._____'   then
          begin
                if Application.MessageBox(PChar('Вже введений фільтр по коду класифікатора ДК 016-97 '''+ edtIdentid.EditText +''' , якщо буде вибрана опція "групувати по коду класифікатора", то код класифікатора не буде враховатись!!!'),
                              PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
                  begin
                    DisableControls([edtSymbolcount1997,  edtSymbolcount2010] , false  );
                    edtIdentid.EditText := '__.__.__.___._____';
                    DisableControls([edtIdentid]);
                    edtSymbolcount1997.Text := '5';
                    edtSymbolcount2010.Text := '5';
                    edtSymbolcount2015.Text := '5';
                    if (rbDK2010.Checked = False) and (rbDK1997.Checked = False) then
                       rbDK2010.Checked := true;
                  end
                else
                  CheckPr_identid.Checked := False;
          end
          else
          begin
//              DisableControls([ edtSymbolcount1997, edtSymbolcount2010 ] , false  );
              grpklasskod.Visible := true;
              edtIdentid.EditText := '__.__.__.___._____';
              DisableControls([edtIdentid]);
              edtSymbolcount1997.Text := '5';
              edtSymbolcount2010.Text := '5';
              edtSymbolcount2015.Text := '5';
              if (rbDK2010.Checked = False) and (rbDK1997.Checked = False) then
                  rbDK2010.Checked := true;

          end

      end
      else
      begin
//        DisableControls([ grpklasskod]   );
        grpklasskod.Visible := false;
        edtSymbolcount1997.Text := '';
        edtSymbolcount2010.Text := '';
        DisableControls([edtIdentid] , false);
       end;

end;

procedure TfrmENForImplementation.edtSymbolcount1997Change(Sender: TObject);
begin
  inherited;
   try
     if ((StrToInt(edtSymbolcount1997.Text) > 14 )
      // and (edtSymbolcount.Text <> '' )
      and ( CheckPr_identid.Checked = true ) ) then
        begin
            Application.MessageBox(PChar('Кількість цифр не повинна перевищувати 14 !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            edtSymbolcount1997.SetFocus;
            if CheckPr_identid.Checked = true then
             edtSymbolcount1997.Text:= '5'
            else
             edtSymbolcount1997.Text:= '';
        end;

   except
      //if  edtSymbolcount.Text <> '' then
      begin
        // Application.MessageBox(PChar('Введено не чіслове значення!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        if CheckPr_identid.Checked = true then
           edtSymbolcount1997.Text:= '5'
        else
           edtSymbolcount1997.Text:= '';
       end;
   end;

   if CheckPr_identid.Checked = false then
        edtSymbolcount1997.Text := '';
end;

procedure TfrmENForImplementation.edtIdentidChange(Sender: TObject);
var
edtIdentidtext : String;
i : Integer;
isBreak : Boolean;
strbefore  : string;
strafter : string;
begin

edtIdentidtext:= edtIdentid.edittext;
  if Copy(edtIdentidtext , edtIdentid.selstart,1) = '.' then Exit;
   isBreak:= False; 

    if edtIdentid.selstart <> 0 then
    begin
         for i:= 0 to edtIdentid.selstart-1 do
         begin
           if Copy(edtIdentidtext,i,1) = '_' then
              begin
               Application.MessageBox(PChar('Фільтр по коду класифікатора ДК 016-97 заповнюється тільки послідовно !!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
               isBreak:= True;
               break;
              end;
         end;

    end;
    if isBreak then
     begin
      // отмена ввода символа
       // edtIdentid.selstart-1
        strbefore:= Copy(edtIdentidtext,0,edtIdentid.selstart-1);
        strafter:= Trim(Copy('__.__.__.___._____',edtIdentid.selstart+1,20));
        edtIdentid.EditText :=  strbefore + '_' + strafter;


     end;

   if edtIdentid.EditText <> '__.__.__.___._____' then
      CheckPr_identid.Checked := false;
end;

procedure TfrmENForImplementation.edtIdentidKeyPress(Sender: TObject;
  var Key: Char);
var
edtIdentidtext : String;
i : Integer;
isBreak : Boolean;
begin

//   edtIdentidtext:= edtIdentid.EditText;
//   isBreak:= False; 
//
//    if edtIdentid.selstart <> 0 then
//    begin
//         for i:= 0 to edtIdentid.selstart-1 do
//         begin
//           if Copy(edtIdentidtext,i,1) = '_' then
//              begin
//               Application.MessageBox(PChar('Фільтр по коду класифікатора ДК 016-97 заповнюється тільки послідовно !!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
//               isBreak:= True;
//               break;
//              end;
//         end;
//
//    end;
//    if isBreak then exit;
end;


procedure TfrmENForImplementation.SaveToFile(str:string);
var
 f:TextFile;
 FileDir:String;
begin
   FileDir:='c:\file.txt';
  AssignFile(f,FileDir);
  if not FileExists(FileDir) then
   begin
    Rewrite(f);
    CloseFile(f);
   end;
  Append(f);
  Writeln(f,str);
  Flush(f);
  CloseFile(f);
end;

procedure TfrmENForImplementation.chkFormWorkPozaPlanClick(
  Sender: TObject);
begin
  // inherited;
   if chkFormWorkPozaPlan.Checked = false then
    begin
      chkEnplanworkStatus1.Checked := false ;
      chkEnplanworkStatus3.Checked := false ;
      DisableControls( grpStatusPozaplanPlans );
    end
    else
    begin

      DisableControls( grpStatusPozaplanPlans , false );
    end;
end;

procedure TfrmENForImplementation.cbWithNNClick(Sender: TObject);
begin
  inherited;
  HideControls([gbNomenclaturesDep], not cbWithNN.Checked);

end;

procedure TfrmENForImplementation.cbOrderTypeInvestClick(Sender: TObject);
begin
  // inherited;
     if cbOrderTypeInvest.Checked = false then
    begin
      chkEnplanworkStatus1_Invest.Checked := false ;
      chkEnplanworkStatus3_Invest.Checked := false ;
      DisableControls( grpEnplanworkStatusInvest );
    end
    else
    begin

      DisableControls( grpEnplanworkStatusInvest , false );
    end;
end;

procedure TfrmENForImplementation.rbDK1997Click(Sender: TObject);
begin
//  inherited;
  If rbDK2010.Checked = true then rbDK2010.Checked := False;
end;

procedure TfrmENForImplementation.rbDK2010Click(Sender: TObject);
begin
//  inherited;
  If rbDK1997.Checked = true then rbDK1997.Checked := False;
end;

procedure TfrmENForImplementation.edtSymbolCount2010Change(
  Sender: TObject);
begin
  inherited;
   try
     if ((StrToInt(edtSymbolcount2010.Text) > 10 )
      // and (edtSymbolcount.Text <> '' )
      and ( CheckPr_identid.Checked = true ) ) then
        begin
            Application.MessageBox(PChar('Кількість цифр не повинна перевищувати 10 !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
            edtSymbolcount2010.SetFocus;
            if CheckPr_identid.Checked = true then
             edtSymbolcount2010.Text:= '5'
            else
             edtSymbolcount2010.Text:= '';
        end;

   except
      //if  edtSymbolcount.Text <> '' then
      begin
        // Application.MessageBox(PChar('Введено не чіслове значення!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
        if CheckPr_identid.Checked = true then
           edtSymbolcount2010.Text:= '5'
        else
           edtSymbolcount2010.Text:= '';
       end;
   end;

   if CheckPr_identid.Checked = false then
        edtSymbolcount2010.Text := '';
end;

end.
