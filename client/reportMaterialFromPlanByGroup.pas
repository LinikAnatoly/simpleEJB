unit reportMaterialFromPlanByGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ChildFormUnit, Buttons, StdCtrls;

type
  TfrmReportMaterialFromPlanByGroup = class(TDialogForm)
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label2: TLabel;
    lblENPodrName: TLabel;
    edtENPodrName: TEdit;
    spbENPodr: TSpeedButton;
    spbENPodrClear: TSpeedButton;
    edtYear: TComboBox;
    spbGroupClear: TSpeedButton;
    lnBudg: TLabel;
    edtBudg: TEdit;
    SpbBudg: TSpeedButton;
    sbpBudgClear: TSpeedButton;
    procedure spbMaterialNameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbENPodrClick(Sender: TObject);
    procedure spbENPodrClearClick(Sender: TObject);
    procedure spbGroupClearClick(Sender: TObject);
    procedure SpbBudgClick(Sender: TObject);
    procedure sbpBudgClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    report : Integer;   // - 1 выбор материала .. 2 - все материалы
  end;

var
  frmReportMaterialFromPlanByGroup: TfrmReportMaterialFromPlanByGroup;
  materialCode : Integer;
  budgetCode : Integer;
  budgetName : String;
  PodrCode : Integer;


  
implementation

uses ShowTKMaterials, EnergyproController, TKMaterialsController,
  DMReportsUnit, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, ENConsts;

{$R *.dfm}

procedure TfrmReportMaterialFromPlanByGroup.spbMaterialNameClick(
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
          //edtMaterialText.Text :=  TKMaterialsShort(tvDep.Selected.Data).name + ' , од.виміру ' + TKMaterialsShort(tvDep.Selected.Data).measurementName;

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

procedure TfrmReportMaterialFromPlanByGroup.FormShow(Sender: TObject);
begin
  DisableControls([edtMaterialName, edtENPodrName , edtBudg]);
  DenyBlankValues([edtMaterialName, edtENPodrName , edtBudg]);
  spbENPodrClearClick(Sender);
  sbpBudgClearClick(Sender);
  spbGroupClearClick(Sender);
end;

procedure TfrmReportMaterialFromPlanByGroup.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

{
  if ( report = 1 ) and (not NoBlankValues([
       edtMaterialName, edtMaterialText
     ]))  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  }
  begin

    SetLength(argNames, 7);
    SetLength(args, 7);


    argNames[0] := 'departmentCode';
    args[0] :=  IntToStr(podrCode) ;

    argNames[1] := 'departmentName';
    args[1] :=  edtENPodrName.Text;

    argNames[2] := 'yearGen';
    args[2] :=  edtYear.Text;

    argNames[3] := 'groupCode';
    args[3] := IntToStr(materialCode);

    argNames[4] := 'groupName';
    args[4] := edtMaterialName.Text ;


    argNames[5] := 'budgCode';
    args[5] :=  IntToStr(budgetCode) ;

    argNames[6] := 'budgName';
    args[6] :=  edtBudg.Text;

{
    if report = 1 then
    reportName := 'planListByMaterial'
    else
    reportName := 'planListByMaterialFull';
}
    reportName := 'RepOrder/materialByLevelFromPlan';

    makeReport(reportName, argNames, args, 'xls');
  end;

end;

procedure TfrmReportMaterialFromPlanByGroup.spbENPodrClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   //f.conditionSQL := ' parentrefcode is null';
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              PodrCode := ENDepartmentShort(tvDep.Selected.Data).code;
              //budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENPodrName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
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

procedure TfrmReportMaterialFromPlanByGroup.spbENPodrClearClick(
  Sender: TObject);
begin

  PodrCode := -1;
  edtENPodrName.Text := 'ХОЕ';
  
end;

procedure TfrmReportMaterialFromPlanByGroup.spbGroupClearClick(
  Sender: TObject);
begin
  inherited;
  materialCode := -1;
  edtMaterialName.Text := '';
end;

procedure TfrmReportMaterialFromPlanByGroup.SpbBudgClick(Sender: TObject);
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

      With frmENDepartmentShow do
      begin
  
        if ShowModal = mrOk then
        begin
            try
              budgetCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgetName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtBudg.Text := budgetName;

            Except
               on EConvertError do Exit;
            End;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportMaterialFromPlanByGroup.sbpBudgClearClick(
  Sender: TObject);
begin
  budgetCode := -1;
  edtBudg.Text := 'Всі бюджетотримачі';

end;

end.
