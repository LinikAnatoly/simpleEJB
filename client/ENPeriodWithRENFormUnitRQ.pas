unit ENPeriodWithRENFormUnitRQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls , ENPlanWorkController,
  InvokeRegistry, Rio, SOAPHTTPClient;

type
  TfrmENPeriodWithRENRQ = class(TDialogForm)
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
    chkkindrefcodemat: TCheckBox;
    spbENPlanWorkState: TSpeedButton;
    edtWorkState: TEdit;
    lblWorkState: TLabel;
    SpeedButton1: TSpeedButton;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    GroupBox3: TGroupBox;
    CheckPr_mat_group: TCheckBox;
    lblMaterialGroup: TLabel;
    edtMaterialGroup: TEdit;
    spbMaterialGroup: TSpeedButton;
    spbMaterialGroupClear: TSpeedButton;
    GroupBox5: TGroupBox;
    cbOrderTypeBudg: TCheckBox;
    cbOrderTypeInvest: TCheckBox;
    GroupBox4: TGroupBox;
    cbOrderFormPlan: TCheckBox;
    cbOrderFormNeplan: TCheckBox;
    CheckPr_identid: TCheckBox;
    GroupBox2: TGroupBox;
    lblMonthRaznar: TLabel;
    dtpStartDate: TDateTimePicker;
    Label1: TLabel;
    dtpEndDate: TDateTimePicker;
    chkPriznPeriod: TCheckBox;
    chkpriznshoworder: TCheckBox;
    procedure chbWholeYearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbElementTypeChange(Sender: TObject);
    procedure spbMaterialGroupClearClick(Sender: TObject);
    procedure spbMaterialGroupClick(Sender: TObject);
    procedure chkPriznPeriodClick(Sender: TObject);
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
  end;

var
  frmENPeriodWithRENRQ: TfrmENPeriodWithRENRQ;
  ENPlanWorkFilterObj: ENPlanWorkFilter;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController , EditENPlanWorkState,
  ShowENPlanWorkState , ENPlanWorkStateController , ENElementTypeController , ShowTKMaterials, TKMaterialsController ;

{$R *.dfm}

procedure TfrmENPeriodWithRENRQ.chbWholeYearClick(Sender: TObject);
begin
  HideControls([lblMonthGen, edtMonthGen], chbWholeYear.Checked);
  HideControls([chbByMonths], not chbWholeYear.Checked);
end;

procedure TfrmENPeriodWithRENRQ.spbEPRenClick(Sender: TObject);
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

procedure TfrmENPeriodWithRENRQ.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;
begin
  DisableControls([edtEPRenName, edtENElementName, edtENBudgetName , edtWorkState , dtpStartDate , dtpEndDate ]);
  HideControls([{lblENElementName, edtENElementName, spbENElement, spbENElementClear,} chbByMonths]);

  { заполняем выпадающий список типов объектов }
  cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);
  f.conditionSQL := 'code <> 4';  
  f.orderBySQL := 'code';

  cbElementType.Items.Add('');

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;


end;

procedure TfrmENPeriodWithRENRQ.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';
  WorkStateCode := 0; // тип работ
end;

procedure TfrmENPeriodWithRENRQ.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmENPeriodWithRENRQ.cbElementType.ItemIndex > -1 then
  begin
    if Integer(frmENPeriodWithRENRQ.cbElementTYpe.Items.Objects[frmENPeriodWithRENRQ.cbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmENPeriodWithRENRQ.cbElementTYpe.Items.Objects[frmENPeriodWithRENRQ.cbElementType.ItemIndex]);
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

procedure TfrmENPeriodWithRENRQ.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  HideControls([chbByRENs], false);
end;

procedure TfrmENPeriodWithRENRQ.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';
  HideControls([chbByObjects], false);

  DisableControls([cbElementType] , False  ) ;
  cbElementType.ItemIndex := cbElementType.Items.IndexOf('');
end;

procedure TfrmENPeriodWithRENRQ.spbENBudgetClick(Sender: TObject);
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

procedure TfrmENPeriodWithRENRQ.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  HideControls([chbByBudgets], false);
end;

procedure TfrmENPeriodWithRENRQ.spbENPlanWorkStateClick(Sender: TObject);
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

procedure TfrmENPeriodWithRENRQ.SpeedButton1Click(Sender: TObject);
begin

  WorkStateCode := 0 ;
  WorkStateName := ' ' ;
  edtWorkState.Text := '' ;
  
end;

procedure TfrmENPeriodWithRENRQ.cbElementTypeChange(Sender: TObject);
begin

  ObjectName:= frmENPeriodWithRENRQ.cbElementTYpe.Text ;
  ObjectName:= ObjectName ;

end;

procedure TfrmENPeriodWithRENRQ.spbMaterialGroupClearClick(
  Sender: TObject);
begin
  materialGroupCode := 0;
  materialGroupName := '';
  edtMaterialGroup.Text := '';
end;

procedure TfrmENPeriodWithRENRQ.spbMaterialGroupClick(Sender: TObject);
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

procedure TfrmENPeriodWithRENRQ.chkPriznPeriodClick(Sender: TObject);
begin
   if chkPriznPeriod.Checked = true then
    begin
      DisableControls([dtpStartDate , dtpEndDate ],false);
      DisableControls([edtYearGen , edtMonthGen , chbWholeYear , chbByMonths ]);

    end
   else
    begin
      DisableControls([dtpStartDate , dtpEndDate ]);
      DisableControls([edtYearGen , edtMonthGen , chbWholeYear , chbByMonths ], false );
    end;
end;

end.
