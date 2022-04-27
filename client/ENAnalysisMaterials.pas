unit ENAnalysisMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst;

type
  TfrmAnalysisMaterials = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    rbgVidPlan: TRadioGroup;
    chkkindrefcodemat: TCheckBox;
    lblYearGenS: TLabel;
    edtYearGenS: TComboBox;
    lblMonthGenS: TLabel;
    edtMonthGenS: TComboBox;
    lblYearGenPo: TLabel;
    lblMonthGenPo: TLabel;
    edtYearGenPo: TComboBox;
    edtMonthGenPo: TComboBox;
    lblEstimateItemStatus: TLabel;
    ListEstimateItemStatus: TCheckListBox;
    HTTPRIOENEstimateItemStatus: THTTPRIO;
    lblENPlanWorkForm: TLabel;
    chbFormPlanned: TCheckBox;
    chbFormNoPlanned: TCheckBox;
    procedure spbEPRenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure spbMaterialNameClick(Sender: TObject);
    procedure edtYearGenSChange(Sender: TObject);
    procedure edtMonthGenSChange(Sender: TObject);
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
    materialCode : Integer;
    materialname : String ;
  end;

var
  frmAnalysisMaterials: TfrmAnalysisMaterials;
 // ENEstimateItemObj: ENEstimateItem;

implementation

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController ,  ENPlanWorkController, Main, DMReportsUnit,
  ENPeriodWithRENFormUnitTaskPlanFact, TKMaterialsController , ShowTKMaterials
  , ENEstimateItemStatusController
  ;

{$R *.dfm}

procedure TfrmAnalysisMaterials.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

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

procedure TfrmAnalysisMaterials.FormShow(Sender: TObject);
var
  TempENEstimateItemStatus :  ENEstimateItemStatusControllerSoapPort;
  statusFilter : ENEstimateItemStatusFilter;
  statusList : ENEstimateItemStatusShortList;
  statusIndex : Integer;

begin
  DisableControls([edtEPRenName,  edtENBudgetName , edtMaterialName ]);

  TempENEstimateItemStatus := HTTPRIOENEstimateItemStatus as ENEstimateItemStatusControllerSoapPort;
  statusFilter := ENEstimateItemStatusFilter.Create;
  SetNullXSProps(statusFilter);
  SetNullIntProps(statusFilter);
  statusFilter.orderBySQL := 'ENESTIMATEITEMSTATUS.CODE ASC';
  statusList := TempENEstimateItemStatus.getScrollableFilteredList(statusFilter, 0, -1);

  for statusIndex := 0 to statusList.totalCount - 1 do begin
      ListEstimateItemStatus.Items.AddObject(statusList.list[statusIndex].name, TObject(statusList.list[statusIndex].code ));
  end;

  chbFormPlanned.Checked := True;
  chbFormNoPlanned.Checked := True;

  SetComboBoxCurrentYear(edtYearGenS, 3, 1);
  SetComboBoxCurrentYear(edtYearGenPo, 3, 1);

end;

procedure TfrmAnalysisMaterials.FormCreate(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  elementCode := 0;
  elementName := '';
  budgetCode := 0;
  budgetName := '';
  materialCode := 0;
  materialname := '';
end;



procedure TfrmAnalysisMaterials.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
 // HideControls([chbByRENs], false);
end;



procedure TfrmAnalysisMaterials.spbENBudgetClick(Sender: TObject);
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

procedure TfrmAnalysisMaterials.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
 // HideControls([chbByBudgets], false);
end;

procedure TfrmAnalysisMaterials.btnOkClick(Sender: TObject);
var
argNames, args: ArrayOfString;
  reportName: String;
  strEstimateStatus, strPlanForm : String;
  i : Integer;
begin
    if frmAnalysisMaterials.materialname = '' then
      begin
        Application.MessageBox(PChar('Для формування звіту необхідно обов`язково вибрати матеріал!!!'), PChar('Увага!'),MB_ICONWARNING);
        ModalResult := mrNone;
        Exit;
      end
    else if edtYearGenPo.ItemIndex < edtYearGenS.ItemIndex

     then
      begin
        Application.MessageBox(PChar(' Дата По повинна бути більшою або рівною даті початку!!!'), PChar('Увага!'),MB_ICONWARNING);
        ModalResult := mrNone;
       Exit;
      end
    else if  edtmonthGenPo.ItemIndex < edtmonthGenS.ItemIndex
     then
      begin
        Application.MessageBox(PChar(' Дата По повинна бути більшою або рівною даті початку!!!'), PChar('Увага!'),MB_ICONWARNING);
        ModalResult := mrNone;
       Exit;
      end
    else
    begin
      /////// Parameters
      SetLength(argNames, 14);
      SetLength(args, 14);



      argnames[0] := 'renCode';
      args[0] := IntToStr(frmAnalysisMaterials.renCode);

      argnames[1] := 'renName';
      if frmAnalysisMaterials.renName <> '' then
        args[1] := frmAnalysisMaterials.renName
      else
        args[1] := 'ХОЕ';

      argnames[2] := 'budgName';
      if frmAnalysisMaterials.budgetName <> '' then
        args[2] := frmAnalysisMaterials.budgetName
      else
        args[2] := '';

      argnames[3] := 'budgCode';
      args[3] := IntToStr(frmAnalysisMaterials.budgetCode);

      argnames[4] := 'materialCode';
      args[4] := IntToStr(frmAnalysisMaterials.materialCode);


      argnames[5] := 'order';
      if RadioGroup1.ItemIndex = 0 then
         args[5] := ' dname, budgetrefname , objname , workname , mname ';
      if RadioGroup1.ItemIndex = 1 then
         args[5] := ' dname ';
      if RadioGroup1.ItemIndex = 2 then
         args[5] := ' budgetrefname ';
      if RadioGroup1.ItemIndex = 3 then
         args[5] := ' objname ';
      if RadioGroup1.ItemIndex = 4 then
         args[5] := ' workname  ';
     //---------Виды планов ----------//
      argnames[6] := 'kindCode';
      If rbgVidPlan.ItemIndex = 0 then
         args[6] := '0';
      If rbgVidPlan.ItemIndex = 1 then
         args[6] := '1';
      If rbgVidPlan.ItemIndex = 2 then
         args[6] := '2';
      If rbgVidPlan.ItemIndex = 3 then
         args[6] := '3';
      If rbgVidPlan.ItemIndex = 4 then
         args[6] := '4';

      argnames[7] := 'kindrefcodemat';
        If chkkindrefcodemat.Checked = True then
           args[7] := '2' // отчет формируется с паливно мастильними материалами
        Else
           args[7] := '1'; // отчет формируется без паливно мастильних материалов

        argnames[8] := 'monthStart';
        args[8] := IntToStr(edtMonthGenS.ItemIndex + 1);

        argnames[9] := 'yearStart';
        args[9] :=  edtYearGenS.Text;

        argnames[10] := 'monthEnd';
        args[10] := IntToStr(edtMonthGenPo.ItemIndex + 1);

        argnames[11] := 'yearEnd';
        args[11] :=  edtYearGenPo.Text;

        strEstimateStatus := '-1';
        // Считывание выбранных статусов
        for i := 0 to ListEstimateItemStatus.Count - 1 do
        begin
          if  ListEstimateItemStatus.Checked[i] then
            if strEstimateStatus <>  '' then
              strEstimateStatus := strEstimateStatus + ', ' + IntToStr(  Integer( ListEstimateItemStatus.Items.Objects[i] ) )
            else
              strEstimateStatus := strEstimateStatus + IntToStr(Integer(ListEstimateItemStatus.Items.Objects[i]));
        end;

        argnames[12] := 'estimateItemStatuses';
        args[12] :=  strEstimateStatus;

        strPlanForm := '-1';
        if chbFormPlanned.Checked = True then strPlanForm := strPlanForm + ',1';
        if chbFormNoPlanned.Checked = True then strPlanForm := strPlanForm + ',2';

        argnames[13] := 'planWorkForms';
        args[13] :=  strPlanForm;

      reportName := 'AnalysisMaterials/AnalysisMaterials';


      makeReport(reportName, argNames, args, 'xls');
    end;


end;

procedure TfrmAnalysisMaterials.SpeedButton1Click(Sender: TObject);
begin
  materialCode := 0;
  materialName := '';
  edtMaterialName.Text := '';


end;

procedure TfrmAnalysisMaterials.spbMaterialNameClick(Sender: TObject);
var
frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;
begin
  if DialogState = dsView then Exit;
  {
  mtFilter := TKMaterialsFilter.Create;
  SetNullIntProps(mtFilter);
  SetNullXSProps(mtFilter);

  mtFilter.conditionSQL := 'parentrefcode is null';
  mtFilter.orderBySQL := ' tk1.name'; // в ДАО в запросе пробит алиас tk1 !!!
  }
  frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);
  try
    with frmSpr_matherialShow do
    begin


      DisableActions([actInsert, actEdit, actDelete]);

      if ShowModal = mrOk then
      begin
        try
        //  if ENEstimateItemObj.materialRef = nil then ENEstimateItemObj.materialRef := TKMaterialsRef.Create;
        //  ENEstimateItemObj.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
        // --    edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          materialName := TKMaterialsShort(tvDep.Selected.Data).name ;
              edtMaterialName.Text := materialName;
         // lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

procedure TfrmAnalysisMaterials.edtYearGenSChange(Sender: TObject);
begin

   edtYearGenPo.ItemIndex := edtYearGenS.ItemIndex;
    

end;

procedure TfrmAnalysisMaterials.edtMonthGenSChange(Sender: TObject);
begin


   edtMonthGenPo.ItemIndex :=  edtMonthGenS.ItemIndex ;

end;

end.
