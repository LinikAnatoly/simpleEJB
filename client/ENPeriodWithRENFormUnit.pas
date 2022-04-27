unit ENPeriodWithRENFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls , ENPlanWorkController,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst;

type
  TfrmENPeriodWithREN = class(TDialogForm)
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
    CheckPr_identid: TCheckBox;
    HTTPRIORQOrder: THTTPRIO;
    Label6: TLabel;
    ListBudget: TCheckListBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Label8: TLabel;
    HTTPRIOTENDepartment: THTTPRIO;
    listDDS: TCheckListBox;
    Label1: TLabel;
    SpeedButton5: TSpeedButton;
    Label2: TLabel;
    SpeedButton6: TSpeedButton;
    Label3: TLabel;
    HTTPRIORQDDSCodes: THTTPRIO;
    CheckPr_identid2015: TCheckBox;
    chkShowMatInStatusVnayavnosti: TCheckBox;
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
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
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
    maxorderperiod : String;
    strBudget : String;
    strDDS: String;
  end;

var
  frmENPeriodWithREN: TfrmENPeriodWithREN;
  ENPlanWorkFilterObj: ENPlanWorkFilter;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController , EditENPlanWorkState,
  ShowENPlanWorkState , ENPlanWorkStateController , ENElementTypeController ,
  ShowTKMaterials, TKMaterialsController , ShowENPlanWorkType , ENPlanWorkTypeController  ,
  RQOrderController, RQDDSCodesController;

{$R *.dfm}

procedure TfrmENPeriodWithREN.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
  HideControls([chbByMonths], not chbWholeYear.Checked);
end;

procedure TfrmENPeriodWithREN.spbEPRenClick(Sender: TObject);
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
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENPeriodWithREN.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;


 TempRQOrder: RQOrderControllerSoapPort;
 RQOrderList: RQOrderShortList;
 ordfilter : RQOrderFilter;

  TempTKBudget: ENDepartmentControllerSoapPort;
  bi: Integer;
  ENDepartmentList: ENDepartmentShortList;
  departmentfilter : ENDepartmentFilter;




  TempRQDDSCodes: RQDDSCodesControllerSoapPort;
  dds: Integer;
  RQDDSCodesList: RQDDSCodesShortList;
  ddsfilter : RQDDSCodesFilter;


begin

  TempRQOrder :=  HTTPRIORQOrder as RQOrderControllerSoapPort;

  ordfilter := RQOrderFilter.Create;
  SetNullIntProps(ordfilter);
  SetNullXSProps(ordfilter);

  ordfilter.conditionSQL := ' rqorder.code = ( ' +
                            ' select  rqorder.code  from rqorder , rqorderitem ' +
                            '          where rqorder.code = rqorderitem.orderrefcode ' +
                            '           and rqorder.kindrefcode = 4 ' +
                            '           and rqorder.rqordertypecode = 1 ' +
                            '           order by first_day(rqorder.orderperiod) desc ' +
                            '           limit 1 )';


  RQOrderList := TempRQOrder.getScrollableFilteredList(ordfilter, 0, -1);

  if RQOrderList.totalCount = 0  then
  begin
    Application.MessageBox(PChar('Немає зв`язку з EnergyNET !!!'), PChar('Увага'), MB_ICONWARNING);
    exit;
  end;



  maxorderperiod := '1.' +  IntToStr(RQOrderList.list[0].orderPeriod.Month) + '.' +
                          IntToStr(RQOrderList.list[0].orderPeriod.Year) ;



  DisableControls([edtEPRenName, edtENElementName, edtENBudgetName , edtWorkState]);
  HideControls([{lblENElementName, edtENElementName, spbENElement, spbENElementClear,} chbByMonths]);

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



      // заполняем список кодов ДДС

     ddsfilter := RQDDSCodesFilter.Create;
     SetNullIntProps(ddsfilter);
     SetNullXSProps(ddsfilter);

     ddsfilter.isActual := 1;
     ddsfilter.orderBySQL := ' q1.txtCode ';

     TempRQDDSCodes:= HTTPRIORQDDSCodes as RQDDSCodesControllerSoapPort;
     RQDDSCodesList := TempRQDDSCodes.getScrollableFilteredList(ddsfilter,0,-1);
     listDDS.Items.Clear;

     for dds:=0 to High(RQDDSCodesList.list) do
      begin

        listDDS.Items.AddObject(RQDDSCodesList.list[dds].txtCode + '   ' + RQDDSCodesList.list[dds].name   , TObject( RQDDSCodesList.list[dds].code )  );
      end;

end;

procedure TfrmENPeriodWithREN.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';
  WorkStateCode := 0; // тип работ
  WorkTypeCode := 0; // подвидработ
  {SUPP-74178}SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2, true, true);
end;

procedure TfrmENPeriodWithREN.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmENPeriodWithREN.cbElementType.ItemIndex > -1 then
  begin
    if Integer(frmENPeriodWithREN.cbElementTYpe.Items.Objects[frmENPeriodWithREN.cbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmENPeriodWithREN.cbElementTYpe.Items.Objects[frmENPeriodWithREN.cbElementType.ItemIndex]);
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

procedure TfrmENPeriodWithREN.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);
end;

procedure TfrmENPeriodWithREN.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
  HideControls([chbByObjects], false);

  DisableControls([cbElementType] , False  ) ;
  cbElementType.ItemIndex := cbElementType.Items.IndexOf('');
end;

procedure TfrmENPeriodWithREN.spbENBudgetClick(Sender: TObject);
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

procedure TfrmENPeriodWithREN.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);
end;

procedure TfrmENPeriodWithREN.rbTekushClick(Sender: TObject);
begin
    rbTekush.Checked := True;
    rbYear.Checked := False;

end;

procedure TfrmENPeriodWithREN.rbYearClick(Sender: TObject);
begin
    rbTekush.Checked := False;
    rbYear.Checked := True;

end;

procedure TfrmENPeriodWithREN.spbENPlanWorkStateClick(Sender: TObject);
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

procedure TfrmENPeriodWithREN.SpeedButton1Click(Sender: TObject);
begin

  WorkStateCode := 0 ;
  WorkStateName := ' ' ;
  edtWorkState.Text := '' ;
  
end;

procedure TfrmENPeriodWithREN.btnOkClick(Sender: TObject);
var
i, d: Integer;
begin
  inherited;
  strBudget:= '';
   For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] then
        if strBudget <>  '' then
           strBudget := strBudget + ',' + IntToStr(  Integer( ListBudget.Items.Objects[i] ) )
         else
           strBudget := strBudget + IntToStr(  Integer( ListBudget.Items.Objects[i] ) ) ;

    End;

    if ((Length(strBudget) = 0 ) and ( ListBudget.Visible = True )) then
      begin
          Application.MessageBox(PChar('Необхідно обрати бюджетотримача !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
      end;

      // проверка на коды ддс
      strDDS:= '';

      For d:=0 to listDDS.Count -1  do
    Begin
       if  listDDS.Checked[d] then
        if strDDS <>  '' then
           strDDS := strDDS + ',' + IntToStr(  Integer( listDDS.Items.Objects[d] ) )
         else
           strDDS := strDDS + IntToStr(  Integer( listDDS.Items.Objects[d] ) ) ;

    End;

    if ((Length(strDDS) = 0 ) and ( listDDS.Visible = True )) then
      begin
          Application.MessageBox(PChar('Необхідно обрати коди ДДС !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          ModalResult := mrNone;
      end

end;

procedure TfrmENPeriodWithREN.cbElementTypeChange(Sender: TObject);
begin

  ObjectName:= frmENPeriodWithREN.cbElementTYpe.Text ;
  ObjectName:= ObjectName ;

end;

procedure TfrmENPeriodWithREN.spbMaterialGroupClick(Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;

begin
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin

        try
          materialGroupCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialGroup.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
          //e.Text := IntToStr(materialCode);

        {
          if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
          ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
          edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
          }
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmENPeriodWithREN.spbMaterialGroupClearClick(Sender: TObject);
begin
  materialGroupCode := 0;
  materialGroupName := '';
  edtMaterialGroup.Text := '';
end;

procedure TfrmENPeriodWithREN.spbTypeClick(Sender: TObject);
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



procedure TfrmENPeriodWithREN.SpeedButton2Click(Sender: TObject);
begin

  WorkTypeCode := 0 ;
  WorkTypeName := ' ' ;
  edtTypeName.Text := '' ;

end;

procedure TfrmENPeriodWithREN.SpeedButton3Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = false then
           ListBudget.Checked[i] := true;


    End;


end;

procedure TfrmENPeriodWithREN.SpeedButton4Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to ListBudget.Count -1  do
    Begin
       if  ListBudget.Checked[i] = True then
           ListBudget.Checked[i] := False;

    End;


end;

procedure TfrmENPeriodWithREN.SpeedButton5Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to listDDS.Count -1  do
    Begin
       if  listDDS.Checked[i] = false then
           listDDS.Checked[i] := true;


    End;


end;

procedure TfrmENPeriodWithREN.SpeedButton6Click(Sender: TObject);
var
  I : Integer;
begin


     For i:=0 to listDDS.Count -1  do
    Begin
       if  listDDS.Checked[i] = True then
           listDDS.Checked[i] := False;

    End;


end;

end.
