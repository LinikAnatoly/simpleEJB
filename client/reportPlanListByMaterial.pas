unit reportPlanListByMaterial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ChildFormUnit, Buttons, StdCtrls;

type
  TfrmReportPlanListByMaterial = class(TDialogForm)
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    edtMaterialText: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    edtYear: TEdit;
    Label3: TLabel;
    cbStartMonth: TComboBox;
    Label4: TLabel;
    cbEndMonth: TComboBox;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    e: TEdit;
    procedure spbMaterialNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    report : Integer;   // - 1 выбор материала .. 2 - все материалы
  end;

var
  frmReportPlanListByMaterial: TfrmReportPlanListByMaterial;
  materialCode : Integer;
  budgetCode : Integer;

  
implementation

uses ShowTKMaterials, EnergyproController, TKMaterialsController,
  DMReportsUnit, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ENConsts;

{$R *.dfm}

procedure TfrmReportPlanListByMaterial.spbMaterialNameClick(
  Sender: TObject);
var
 frmSpr_matherialShow: TfrmTKMaterialsShow;
 //mtFilter : TKMaterialsFilter;

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
          materialCode := TKMaterialsShort(tvDep.Selected.Data).code;
          edtMaterialName.Text :=  TKMaterialsShort(tvDep.Selected.Data).name ;
          edtMaterialText.Text :=  TKMaterialsShort(tvDep.Selected.Data).name + ' , од.виміру ' + TKMaterialsShort(tvDep.Selected.Data).measurementName;
          e.Text := IntToStr(materialCode);
          
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

procedure TfrmReportPlanListByMaterial.FormShow(Sender: TObject);
begin

  DisableControls([edtMaterialName, edtMaterialText]);

  if report = 1 then
    DenyBlankValues([edtMaterialName, edtMaterialText])
  else
  begin
    HideControls([edtMaterialName, edtMaterialText, spbMaterialName, Label1]);
  end;

  edtYear.Text := '2010';
  spbENBudgetClearClick(Sender);
end;

procedure TfrmReportPlanListByMaterial.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then


  if ( report = 1 ) and (not NoBlankValues([
       edtMaterialName, edtMaterialText
     ]))  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin

    SetLength(argNames, 7);
    SetLength(args, 7);


    argNames[0] := 'materialText';
    args[0] :=  edtMaterialText.Text ;

    argNames[1] := 'materialCode';
    args[1] :=  IntToStr(materialCode);

    argNames[2] := 'yearGen';
    args[2] :=  edtYear.Text;

    argNames[3] := 'startMonth';
    args[3] :=  IntToStr(cbStartMonth.ItemIndex + 1);

    argNames[4] := 'endMonth';
    args[4] :=  IntToStr(cbEndMonth.ItemIndex + 1);

    argNames[5] := 'budjetText';
    args[5] :=  edtENBudgetName.Text;

    argNames[6] := 'budjetCode';
    args[6] :=  IntToStr(budgetCode);

    if report = 1 then
    reportName := 'planListByMaterial'
    else
    reportName := 'planListByMaterialFull';
    
    makeReport(reportName, argNames, args, 'xls');
  end;

end;

procedure TfrmReportPlanListByMaterial.spbENBudgetClick(Sender: TObject);
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
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
              ///
              //if budgetCode > 0 then chbByBudgets.Checked := false;
              //HideControls([chbByBudgets], (budgetCode > 0));
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

procedure TfrmReportPlanListByMaterial.spbENBudgetClearClick(
  Sender: TObject);
begin

  budgetCode := -1;
  edtENBudgetName.Text := '';
  
end;

end.
