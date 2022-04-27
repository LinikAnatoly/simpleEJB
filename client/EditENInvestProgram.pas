
unit EditENInvestProgram;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENInvestProgramController, AdvObj ;

type
  TfrmENInvestProgramEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
  

  HTTPRIOENInvestProgram: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lblName: TLabel;
    lblYearGen: TLabel;
    lblCommentGen: TLabel;
    spbTKMeasurementMeasurement: TSpeedButton;
    lblTKMeasurementMeasurementName: TLabel;
    edtName: TEdit;
    edtCommentGen: TMemo;
    edtTKMeasurementMeasurementName: TEdit;
    gbNKRE: TGroupBox;
    lblCountGen: TLabel;
    lblPrice: TLabel;
    lblSumGen: TLabel;
    lblQuarter1count: TLabel;
    lblQuarter1sum: TLabel;
    lblQuarter2count: TLabel;
    lblQuarter2sum: TLabel;
    lblQuarter3count: TLabel;
    lblQuarter3sum: TLabel;
    lblQuarter4count: TLabel;
    lblQuarter4sum: TLabel;
    edtCountGen: TEdit;
    edtPrice: TEdit;
    edtSumGen: TEdit;
    edtQuarter1count: TEdit;
    edtQuarter1sum: TEdit;
    edtQuarter2count: TEdit;
    edtQuarter2sum: TEdit;
    edtQuarter3count: TEdit;
    edtQuarter3sum: TEdit;
    edtQuarter4count: TEdit;
    edtQuarter4sum: TEdit;
    cbYearGen: TComboBox;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    Label3: TLabel;
    edtInvNumber: TEdit;
    lbPlanlTypeName: TLabel;
    edtPlanTypeName: TEdit;
    spbPlanType: TSpeedButton;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOENPlanWorkType: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPurchasesObject: THTTPRIO;
    tsMaterials: TTabSheet;
    tsPlans: TTabSheet;
    sgENInvestProgramItem: TAdvStringGrid;
    HTTPRIOENInvestProgramItem: THTTPRIO;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ActionList1: TActionList;
    actViewItem: TAction;
    actInsertItem: TAction;
    actDeleteItem: TAction;
    actEditItem: TAction;
    actUpdateItem: TAction;
    actFilterItem: TAction;
    actNoFilterItem: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    lblInvestProgramGroupsName: TLabel;
    edtInvestProgramGroupsName: TEdit;
    spbInvestProgramGroups: TSpeedButton;
    lblItemNumber: TLabel;
    edtItemNumber: TEdit;
    HTTPRIOENInvestProgramGroups: THTTPRIO;
    Button1: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);

  procedure spbTKMeasurementMeasurementClick(Sender : TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbPlanTypeClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure actViewItemExecute(Sender: TObject);
    procedure actInsertItemExecute(Sender: TObject);
    procedure actEditItemExecute(Sender: TObject);
    procedure actDeleteItemExecute(Sender: TObject);
    procedure actUpdateItemExecute(Sender: TObject);
    procedure spbInvestProgramGroupsClick(Sender: TObject);
    procedure edtPriceChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    function getInvestObjectTypeByElementCode(elementCode: Integer): Integer;
    procedure LoadInvestProgramItems();
  public
    { Public declarations }

end;

var
  frmENInvestProgramEdit: TfrmENInvestProgramEdit;
  ENInvestProgramObj: ENInvestProgram;

implementation

uses
  ShowTKMeasurement
  ,TKMeasurementController
, ENConsts, ENDepartmentController, ShowENDepartment,
  ENDepartmentTypeController, ShowENElement, ENElementController,
  ShowENPlanWorkType, ENPlanWorkTypeController, DMReportsUnit,
  ENPurchasesObjectController, ENInvestObjectTypeController,
  ENInvestProgramItemController, EditENInvestProgramItem,
  ShowENInvestProgramGroups, ENInvestProgramGroupsController;

{uses  
    EnergyproController, EnergyproController2, ENInvestProgramController  ;
}
{$R *.dfm}

var
  ENInvestProgramItemHeaders: array [1..15] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Найменування'
          ,'Од. вим.'
          ,'Кільк. (рік)'
          ,'Ціна, тис. грн. з ПДВ (рік)'
          ,'Сума, тис. грн. з ПДВ (рік)'
          ,'Кільк. (I кв.)'
          ,'Сума, тис. грн. з ПДВ (I кв.)'
          ,'Кільк. (II кв.)'
          ,'Сума, тис. грн. з ПДВ (II кв.)'
          ,'Кільк. (III кв.)'
          ,'Сума, тис. грн. з ПДВ (III кв.)'
          ,'Кільк. (IV кв.)'
          ,'Сума, тис. грн. з ПДВ (IV кв.)'
        );



procedure TfrmENInvestProgramEdit.FormShow(Sender: TObject);
var
  TempENElement: ENElementControllerSoapPort;
  TempENDepartment: ENDepartmentControllerSoapPort;
  TempENPlanWorkType: ENPlanWorkTypeControllerSoapPort;
  TempENInvestProgramGroups: ENInvestProgramGroupsControllerSoapPort;
  eFilter: ENElementFilter;
  eList: ENElementShortList;
  planType: ENPlanWorkType;
  budget: ENDepartment;
  investProgramGroup: ENInvestProgramGroups;
begin
  SetGridHeaders(ENInvestProgramItemHeaders, sgENInvestProgramItem.ColumnHeaders);
  DisableControls([edtENElementName, edtInvNumber, edtENBudgetName, edtPlanTypeName, edtTKMeasurementMeasurementName, edtInvestProgramGroupsName,
                   edtCountGen, edtSumGen, edtQuarter1sum, edtQuarter2sum, edtQuarter3sum, edtQuarter4sum, edtCode]);
  HideControls([lblName, edtName]);

  pcMain.ActivePage := tsMain;

  /////
  Button1.Visible := false;
  /////

  SetFloatStyle([
      edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
  ]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      //edtTKMeasurementMeasurementName
      spbTKMeasurementMeasurement, spbENElement, spbPlanType, spbENBudget, spbInvestProgramGroups
       ]);
    DisableActions([actInsertItem, actDeleteItem, actEditItem]);

    edtPrice.OnChange := nil;
    edtQuarter1count.OnChange := nil;
    edtQuarter2count.OnChange := nil;
    edtQuarter3count.OnChange := nil;
    edtQuarter4count.OnChange := nil;
  end;

  if DialogState = dsEdit then
  begin
    DisableControls([spbENElement]);
  end;

  //if DialogState = dsInsert then
  //begin
    tsMaterials.TabVisible := false;
    tsPlans.TabVisible := false;
  //end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      //,edtYearGen
      ,edtENElementName
      ,edtInvNumber
      ,edtPlanTypeName
      ,edtENBudgetName
      ,edtTKMeasurementMeasurementName
      ,edtCountGen
      ,edtPrice
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENInvestProgramObj.code);

    edtItemNumber.Text := ENInvestProgramObj.itemNumber;

    edtName.Text := ENInvestProgramObj.name; 
    if ( ENInvestProgramObj.yearGen <> Low(Integer) ) then
       //edtYearGen.Text := IntToStr(ENInvestProgramObj.yearGen)
       cbYearGen.ItemIndex := ENInvestProgramObj.yearGen - 2013
    else
       //edtYearGen.Text := '';
       cbYearGen.ItemIndex := -1;

    MakeMultiline(edtCommentGen.Lines, ENInvestProgramObj.commentGen);

    edtPrice.OnChange := nil;
    edtQuarter1count.OnChange := nil;
    edtQuarter2count.OnChange := nil;
    edtQuarter3count.OnChange := nil;
    edtQuarter4count.OnChange := nil;

    try
      if ( ENInvestProgramObj.countGen <> nil ) then
         edtCountGen.Text := ENInvestProgramObj.countGen.decimalString
      else
         edtCountGen.Text := '';
      if ( ENInvestProgramObj.price <> nil ) then
         edtPrice.Text := ENInvestProgramObj.price.decimalString
      else
         edtPrice.Text := '';
      if ( ENInvestProgramObj.sumGen <> nil ) then
         edtSumGen.Text := ENInvestProgramObj.sumGen.decimalString
      else
         edtSumGen.Text := '';
      if ( ENInvestProgramObj.quarter1count <> nil ) then
         edtQuarter1count.Text := ENInvestProgramObj.quarter1count.decimalString
      else
         edtQuarter1count.Text := '';
      if ( ENInvestProgramObj.quarter1sum <> nil ) then
         edtQuarter1sum.Text := ENInvestProgramObj.quarter1sum.decimalString
      else
         edtQuarter1sum.Text := '';
      if ( ENInvestProgramObj.quarter2count <> nil ) then
         edtQuarter2count.Text := ENInvestProgramObj.quarter2count.decimalString
      else
         edtQuarter2count.Text := '';
      if ( ENInvestProgramObj.quarter2sum <> nil ) then
         edtQuarter2sum.Text := ENInvestProgramObj.quarter2sum.decimalString
      else
         edtQuarter2sum.Text := '';
      if ( ENInvestProgramObj.quarter3count <> nil ) then
         edtQuarter3count.Text := ENInvestProgramObj.quarter3count.decimalString
      else
         edtQuarter3count.Text := '';
      if ( ENInvestProgramObj.quarter3sum <> nil ) then
         edtQuarter3sum.Text := ENInvestProgramObj.quarter3sum.decimalString
      else
         edtQuarter3sum.Text := '';
      if ( ENInvestProgramObj.quarter4count <> nil ) then
         edtQuarter4count.Text := ENInvestProgramObj.quarter4count.decimalString
      else
         edtQuarter4count.Text := '';
      if ( ENInvestProgramObj.quarter4sum <> nil ) then
         edtQuarter4sum.Text := ENInvestProgramObj.quarter4sum.decimalString
      else
         edtQuarter4sum.Text := '';
    finally
      edtPrice.OnChange := edtPriceChange;
      edtQuarter1count.OnChange := edtPriceChange;
      edtQuarter2count.OnChange := edtPriceChange;
      edtQuarter3count.OnChange := edtPriceChange;
      edtQuarter4count.OnChange := edtPriceChange;
    end;

    edtTKMeasurementMeasurementName.Text := ENInvestProgramObj.measurement.name;

    /////

    if ENInvestProgramObj.elementRef <> nil then
      if ENInvestProgramObj.elementRef.code > LOW_INT then
      begin
        TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;

        eFilter := ENElementFilter.Create;
        try
          SetNullIntProps(eFilter);
          SetNullXSProps(eFilter);

          eFilter.code := ENInvestProgramObj.elementRef.code;

          eList := TempENElement.getScrollableFilteredList(eFilter, 0, -1);
          if eList.totalCount > 0 then
          begin
            edtENElementName.Text := eList.list[0].objectName;
            edtInvNumber.Text := eList.list[0].objectInvNumber;
          end;
        finally
          eFilter.Free;
        end;
      end;

    if ENInvestProgramObj.planTypeRef <> nil then
      if ENInvestProgramObj.planTypeRef.code > LOW_INT then
      begin
        TempENPlanWorkType := HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
        planType := TempENPlanWorkType.getObject(ENInvestProgramObj.planTypeRef.code);
        if planType <> nil then
        begin
          edtPlanTypeName.Text := planType.name;
          HideControls([lblName, edtName], (planType.code <> ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST));
        end;
      end;

    if ENInvestProgramObj.budgetRef <> nil then
      if ENInvestProgramObj.budgetRef.code > LOW_INT then
      begin
        TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
        budget := TempENDepartment.getObject(ENInvestProgramObj.budgetRef.code);
        if budget <> nil then
          edtENBudgetName.Text := budget.name;
      end;

    if ENInvestProgramObj.invGroupRef <> nil then
      if ENInvestProgramObj.invGroupRef.code > LOW_INT then
      begin
        TempENInvestProgramGroups := HTTPRIOENInvestProgramGroups as ENInvestProgramGroupsControllerSoapPort;
        investProgramGroup := TempENInvestProgramGroups.getObject(ENInvestProgramObj.invGroupRef.code);
        if investProgramGroup <> nil then
          edtInvestProgramGroupsName.Text := investProgramGroup.name + '. ' + investProgramGroup.commentgen;
      end;

    if ENInvestProgramObj.objectTypeRef <> nil then
    begin
      // tsPlans.TabVisible     := true; //(ENInvestProgramObj.objectTypeRef.code = ENINVESTOBJECTTYPE_OBJECT);
      tsMaterials.TabVisible := (ENInvestProgramObj.objectTypeRef.code = ENINVESTOBJECTTYPE_PURCHASES_NO_OBJECT);
    end;

  end;
end;



function TfrmENInvestProgramEdit.getInvestObjectTypeByElementCode(
  elementCode: Integer): Integer;
var
  element: ENElement;
  TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
  purchasesObject: ENPurchasesObject;
  purchasesObjectFilter: ENPurchasesObjectFilter;
  purchasesObjectList: ENPurchasesObjectShortList;
begin
  Result := ENINVESTOBJECTTYPE_OBJECT;

  element := DMReports.getElementByCode(elementCode);

  if element = nil then
    raise Exception.Create('Ошибка при определении типа объекта (element = nil)!');

  if element.typeRef = nil then
    raise Exception.Create('Ошибка при определении типа объекта (element.typeRef = nil)!');

  if element.typeRef.code = LOW_INT then
    raise Exception.Create('Ошибка при определении типа объекта (element.typeRef.code = LOW_INT)!');

  if not (element.typeRef.code in [EN_PURCHASES_OBJECT, EN_PURCHASES_NO_OBJECT]) then
    Exit;

  if element.typeRef.code = EN_PURCHASES_NO_OBJECT then
  begin
    Result := ENINVESTOBJECTTYPE_PURCHASES_NO_OBJECT;
    Exit;
  end;

  if element.typeRef.code = EN_PURCHASES_OBJECT then
  begin
    purchasesObjectFilter := ENPurchasesObjectFilter.Create;
    SetNullIntProps(purchasesObjectFilter);
    SetNullXSProps(purchasesObjectFilter);
    purchasesObjectFilter.element := ENElement.Create;
    purchasesObjectFilter.element.code := elementCode;

    TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
    purchasesObjectList := TempENPurchasesObject.getScrollableFilteredList(purchasesObjectFilter, 0, -1);

    if purchasesObjectList <> nil then
      if purchasesObjectList.totalCount > 0 then
      begin
        if purchasesObjectList.list[0].expandMaterialsIP = 1 then
        begin
          Result := ENINVESTOBJECTTYPE_PURCHASES_NO_OBJECT;
          Exit;
        end;
      end;
  end;
end;

procedure TfrmENInvestProgramEdit.LoadInvestProgramItems;
var
  i: Integer;
  TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
  itemFilter: ENInvestProgramItemFilter;
  ENInvestProgramItemList: ENInvestProgramItemShortList;
begin
  if DialogState = dsInsert then Exit;

  ClearGrid(sgENInvestProgramItem);

  TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;

  itemFilter := ENInvestProgramItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.investProgramRef := ENInvestProgramRef.Create;
  itemFilter.investProgramRef.code := ENInvestProgramObj.code;

  ENInvestProgramItemList := TempENInvestProgramItem.getScrollableFilteredList(itemFilter, 0, -1);

  if High(ENInvestProgramItemList.list) > -1 then
    sgENInvestProgramItem.RowCount := High(ENInvestProgramItemList.list) + 2
  else
    sgENInvestProgramItem.RowCount := 2;

{
        ( 'Код'
          ,'Матеріал'
          ,'Найменування'
          ,'Од. вим.'
          ,'Кільк. (рік)'
          ,'Ціна, тис. грн. з ПДВ (рік)'
          ,'Сума, тис. грн. з ПДВ (рік)'
          ,'Кільк. (I кв.)'
          ,'Сума, тис. грн. з ПДВ (I кв.)'
          ,'Кільк. (II кв.)'
          ,'Сума, тис. грн. з ПДВ (II кв.)'
          ,'Кільк. (III кв.)'
          ,'Сума, тис. грн. з ПДВ (III кв.)'
          ,'Кільк. (IV кв.)'
          ,'Сума, тис. грн. з ПДВ (IV кв.)'
        );
}

  with sgENInvestProgramItem do
    for i := 0 to High(ENInvestProgramItemList.list) do
    begin
      Application.ProcessMessages;
      if ENInvestProgramItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENInvestProgramItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENInvestProgramItemList.list[i].materialRefName;
      Cells[2,i+1] := ENInvestProgramItemList.list[i].name;
      Cells[3,i+1] := ENInvestProgramItemList.list[i].measurementName;

      if ENInvestProgramItemList.list[i].countGen = nil then
        Cells[4,i+1] := ''
      else
        Cells[4,i+1] := ENInvestProgramItemList.list[i].countGen.DecimalString;
      if ENInvestProgramItemList.list[i].price = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := ENInvestProgramItemList.list[i].price.DecimalString;
      if ENInvestProgramItemList.list[i].sumGen = nil then
        Cells[6,i+1] := ''
      else
        Cells[6,i+1] := ENInvestProgramItemList.list[i].sumGen.DecimalString;
      if ENInvestProgramItemList.list[i].quarter1count = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := ENInvestProgramItemList.list[i].quarter1count.DecimalString;
      if ENInvestProgramItemList.list[i].quarter1sum = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := ENInvestProgramItemList.list[i].quarter1sum.DecimalString;
      if ENInvestProgramItemList.list[i].quarter2count = nil then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := ENInvestProgramItemList.list[i].quarter2count.DecimalString;
      if ENInvestProgramItemList.list[i].quarter2sum = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := ENInvestProgramItemList.list[i].quarter2sum.DecimalString;
      if ENInvestProgramItemList.list[i].quarter3count = nil then
        Cells[11,i+1] := ''
      else
        Cells[11,i+1] := ENInvestProgramItemList.list[i].quarter3count.DecimalString;
      if ENInvestProgramItemList.list[i].quarter3sum = nil then
        Cells[12,i+1] := ''
      else
        Cells[12,i+1] := ENInvestProgramItemList.list[i].quarter3sum.DecimalString;
      if ENInvestProgramItemList.list[i].quarter4count = nil then
        Cells[13,i+1] := ''
      else
        Cells[13,i+1] := ENInvestProgramItemList.list[i].quarter4count.DecimalString;
      if ENInvestProgramItemList.list[i].quarter4sum = nil then
        Cells[14,i+1] := ''
      else
        Cells[14,i+1] := ENInvestProgramItemList.list[i].quarter4sum.DecimalString;

      sgENInvestProgramItem.RowCount := i + 2;
    end;

  sgENInvestProgramItem.Row := 1;
end;

procedure TfrmENInvestProgramEdit.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage = tsMaterials then
    LoadInvestProgramItems;
end;

procedure TfrmENInvestProgramEdit.actDeleteItemExecute(Sender: TObject);
Var TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
    ObjCode: Integer;
begin
  TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;

  try
    ObjCode := StrToInt(sgENInvestProgramItem.Cells[0, sgENInvestProgramItem.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENInvestProgramItem.remove(ObjCode);
    LoadInvestProgramItems;
  end;
end;

procedure TfrmENInvestProgramEdit.actEditItemExecute(Sender: TObject);
Var TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
begin
  TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;
  try
    ENInvestProgramItemObj := TempENInvestProgramItem.getObject(StrToInt(sgENInvestProgramItem.Cells[0, sgENInvestProgramItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENInvestProgramItemEdit := TfrmENInvestProgramItemEdit.Create(Application, dsEdit);
  try
    if frmENInvestProgramItemEdit.ShowModal = mrOk then
      LoadInvestProgramItems;
  finally
    frmENInvestProgramItemEdit.Free;
    frmENInvestProgramItemEdit := nil;
  end;
end;

procedure TfrmENInvestProgramEdit.actInsertItemExecute(Sender: TObject);
begin
  ENInvestProgramItemObj := ENInvestProgramItem.Create;
  try
    ENInvestProgramItemObj.investProgramRef := ENInvestProgramRef.Create;
    ENInvestProgramItemObj.investProgramRef.code := ENInvestProgramObj.code;

    frmENInvestProgramItemEdit := TfrmENInvestProgramItemEdit.Create(Application, dsInsert);
    try
      if frmENInvestProgramItemEdit.ShowModal = mrOk then
      begin
        if ENInvestProgramItemObj <> nil then
          LoadInvestProgramItems;
      end;
    finally
      frmENInvestProgramItemEdit.Free;
      frmENInvestProgramItemEdit := nil;
    end;
  finally
    ENInvestProgramItemObj.Free;
  end;
end;

procedure TfrmENInvestProgramEdit.actUpdateItemExecute(Sender: TObject);
begin
  LoadInvestProgramItems;
end;

procedure TfrmENInvestProgramEdit.actViewItemExecute(Sender: TObject);
Var TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
begin
  TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;
  try
    ENInvestProgramItemObj := TempENInvestProgramItem.getObject(StrToInt(sgENInvestProgramItem.Cells[0, sgENInvestProgramItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENInvestProgramItemEdit := TfrmENInvestProgramItemEdit.Create(Application, dsView);
  try
    frmENInvestProgramItemEdit.ShowModal;
  finally
    frmENInvestProgramItemEdit.Free;
    frmENInvestProgramItemEdit := nil;
  end;
end;

procedure TfrmENInvestProgramEdit.Button1Click(Sender: TObject);
Var //TempENInvestProgramItem: ENInvestProgramItemControllerSoapPort;
    TempENInvestProgram: ENInvestProgramControllerSoapPort;
    //ENInvestProgramItemList: ENInvestProgramItemShortList;
begin
  //TempENInvestProgramItem := HTTPRIOENInvestProgramItem as ENInvestProgramItemControllerSoapPort;
  //ENInvestProgramItemList := TempENInvestProgramItem.getMaterialsFromPlans(ENInvestProgramObj.code);
  //ShowMessage('ENInvestProgramItemList.totalCount: ' + IntToStr(ENInvestProgramItemList.totalCount));

  TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;

//  TempENInvestProgram.fillItems(ENInvestProgramObj.code);

  ShowMessage('FillItems finished!');
  actUpdateItemExecute(Sender);
end;

procedure TfrmENInvestProgramEdit.edtPriceChange(Sender: TObject);
var price, count,
    countQ1, countQ2, countQ3, countQ4: Double;
begin
 if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

      try
        price := StrToFloat(edtPrice.Text);
      except
        on EConvertError do
          price := 0;
      end;

      {
      try
        count := StrToFloat(edtCountGen.Text);
      except
        on EConvertError do
          count := 0;
      end;
      }

      try
        countQ1 := StrToFloat(edtQuarter1count.Text);
      except
        on EConvertError do
          countQ1 := 0;
      end;

      try
        countQ2 := StrToFloat(edtQuarter2count.Text);
      except
        on EConvertError do
          countQ2 := 0;
      end;

      try
        countQ3 := StrToFloat(edtQuarter3count.Text);
      except
        on EConvertError do
          countQ3 := 0;
      end;

      try
        countQ4 := StrToFloat(edtQuarter4count.Text);
      except
        on EConvertError do
          countQ4 := 0;
      end;

      edtQuarter1sum.Text := FloatToStr(Conv(price * countQ1, 3));
      edtQuarter2sum.Text := FloatToStr(Conv(price * countQ2, 3));
      edtQuarter3sum.Text := FloatToStr(Conv(price * countQ3, 3));
      edtQuarter4sum.Text := FloatToStr(Conv(price * countQ4, 3));

      count := Conv(Conv(countQ1, 6) + Conv(countQ2, 6) +
                    Conv(countQ3, 6) + Conv(countQ4, 6), 6);

      edtCountGen.Text := FloatToStr(count);

      //edtSumGen.Text := FloatToStrF(price * count, ffFixed, 15, 2);
      edtSumGen.Text := FloatToStr(Conv(price * count, 3));

  end;

end;

procedure TfrmENInvestProgramEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInvestProgram: ENInvestProgramControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtName
      //,edtYearGen
      edtENElementName
      ,edtPlanTypeName
      ,edtENBudgetName
      ,edtPrice
      ,edtCountGen
      ,edtSumGen
      ,edtQuarter1count
      ,edtQuarter1sum
      ,edtQuarter2count
      ,edtQuarter2sum
      ,edtQuarter3count
      ,edtQuarter3sum
      ,edtQuarter4count
      ,edtQuarter4sum
      ,edtTKMeasurementMeasurementName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if cbYearGen.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть рік Інвестпрограми !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      if cbYearGen.CanFocus then
        cbYearGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    ///// Определяем тип объекта ИП (т.е. признак, необходимо ли разворачивать объект по материалам)
    if ENInvestProgramObj.elementRef = nil then
      raise Exception.Create('Ошибка при определении типа объекта (ENInvestProgramObj.elementRef = nil)!');

    if ENInvestProgramObj.elementRef.code = LOW_INT then
      raise Exception.Create('Ошибка при определении типа объекта (ENInvestProgramObj.elementRef.code = LOW_INT)!');

    ENInvestProgramObj.objectTypeRef := ENInvestObjectTypeRef.Create;
    ENInvestProgramObj.objectTypeRef.code := getInvestObjectTypeByElementCode(ENInvestProgramObj.elementRef.code);
    /////

     ENInvestProgramObj.name := edtName.Text;

     ENInvestProgramObj.itemNumber := edtItemNumber.Text;

     {
     if ( edtYearGen.Text <> '' ) then
       ENInvestProgramObj.yearGen := StrToInt(edtYearGen.Text)
     else
       ENInvestProgramObj.yearGen := Low(Integer) ;
     }

     if ENInvestProgramObj.name = '' then
       ENInvestProgramObj.name := edtENElementName.Text;

     if (cbYearGen.ItemIndex >= 0) then
       ENInvestProgramObj.yearGen := cbYearGen.ItemIndex + 2013
     else
       ENInvestProgramObj.yearGen := Low(Integer);


     ENInvestProgramObj.commentGen := edtCommentGen.Text;

     if (ENInvestProgramObj.countGen = nil ) then
       ENInvestProgramObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENInvestProgramObj.countGen.decimalString := edtCountGen.Text 
     else
       ENInvestProgramObj.countGen := nil;

     if (ENInvestProgramObj.price = nil ) then
       ENInvestProgramObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENInvestProgramObj.price.decimalString := edtPrice.Text 
     else
       ENInvestProgramObj.price := nil;

     if (ENInvestProgramObj.sumGen = nil ) then
       ENInvestProgramObj.sumGen := TXSDecimal.Create;
     if edtSumGen.Text <> '' then
       ENInvestProgramObj.sumGen.decimalString := edtSumGen.Text 
     else
       ENInvestProgramObj.sumGen := nil;

     if (ENInvestProgramObj.quarter1count = nil ) then
       ENInvestProgramObj.quarter1count := TXSDecimal.Create;
     if edtQuarter1count.Text <> '' then
       ENInvestProgramObj.quarter1count.decimalString := edtQuarter1count.Text 
     else
       ENInvestProgramObj.quarter1count := nil;

     if (ENInvestProgramObj.quarter1sum = nil ) then
       ENInvestProgramObj.quarter1sum := TXSDecimal.Create;
     if edtQuarter1sum.Text <> '' then
       ENInvestProgramObj.quarter1sum.decimalString := edtQuarter1sum.Text 
     else
       ENInvestProgramObj.quarter1sum := nil;

     if (ENInvestProgramObj.quarter2count = nil ) then
       ENInvestProgramObj.quarter2count := TXSDecimal.Create;
     if edtQuarter2count.Text <> '' then
       ENInvestProgramObj.quarter2count.decimalString := edtQuarter2count.Text 
     else
       ENInvestProgramObj.quarter2count := nil;

     if (ENInvestProgramObj.quarter2sum = nil ) then
       ENInvestProgramObj.quarter2sum := TXSDecimal.Create;
     if edtQuarter2sum.Text <> '' then
       ENInvestProgramObj.quarter2sum.decimalString := edtQuarter2sum.Text 
     else
       ENInvestProgramObj.quarter2sum := nil;

     if (ENInvestProgramObj.quarter3count = nil ) then
       ENInvestProgramObj.quarter3count := TXSDecimal.Create;
     if edtQuarter3count.Text <> '' then
       ENInvestProgramObj.quarter3count.decimalString := edtQuarter3count.Text 
     else
       ENInvestProgramObj.quarter3count := nil;

     if (ENInvestProgramObj.quarter3sum = nil ) then
       ENInvestProgramObj.quarter3sum := TXSDecimal.Create;
     if edtQuarter3sum.Text <> '' then
       ENInvestProgramObj.quarter3sum.decimalString := edtQuarter3sum.Text 
     else
       ENInvestProgramObj.quarter3sum := nil;

     if (ENInvestProgramObj.quarter4count = nil ) then
       ENInvestProgramObj.quarter4count := TXSDecimal.Create;
     if edtQuarter4count.Text <> '' then
       ENInvestProgramObj.quarter4count.decimalString := edtQuarter4count.Text 
     else
       ENInvestProgramObj.quarter4count := nil;

     if (ENInvestProgramObj.quarter4sum = nil ) then
       ENInvestProgramObj.quarter4sum := TXSDecimal.Create;
     if edtQuarter4sum.Text <> '' then
       ENInvestProgramObj.quarter4sum.decimalString := edtQuarter4sum.Text 
     else
       ENInvestProgramObj.quarter4sum := nil;

    TempENInvestProgram := HTTPRIOENInvestProgram as ENInvestProgramControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENInvestProgramObj.code:=low(Integer);
      TempENInvestProgram.add(ENInvestProgramObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInvestProgram.save(ENInvestProgramObj);
    end;
  end;
end;


procedure TfrmENInvestProgramEdit.spbENBudgetClick(Sender: TObject);
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

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENInvestProgramObj.budgetRef = nil then ENInvestProgramObj.budgetRef := ENDepartmentRef.Create();
               ENInvestProgramObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENInvestProgramEdit.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);

  try
    DisableActions([frmENElementShow.actInsert, frmENElementShow.actEdit, frmENElementShow.actDelete]);

    with frmENElementShow do
      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramObj.elementRef = nil then ENInvestProgramObj.elementRef := ENElementRef.Create();
          ENInvestProgramObj.elementRef.code := StrToInt(GetReturnValue(sgENElement, 0));
          edtENElementName.Text := GetReturnValue(sgENElement, 1);
          edtInvNumber.Text := GetReturnValue(sgENElement, 3);

          if edtName.Text = '' then
            edtName.Text := edtENElementName.Text;

          ENInvestProgramObj.planTypeRef := nil;
          edtPlanTypeName.Text := '';
        except
          on EConvertError do Exit;
        end;
      end;
   finally
     frmENElementShow.Free;
   end;
end;

procedure TfrmENInvestProgramEdit.spbInvestProgramGroupsClick(Sender: TObject);
var
   frmENInvestProgramGroupsShow: TfrmENInvestProgramGroupsShow;
   //f : ENInvestProgramGroupsFilter;
begin
   {
   f := ENInvestProgramGroupsFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   }

   //frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal, f);
   frmENInvestProgramGroupsShow := TfrmENInvestProgramGroupsShow.Create(Application, fmNormal);
   try
     DisableActions([frmENInvestProgramGroupsShow.actInsert, frmENInvestProgramGroupsShow.actEdit, frmENInvestProgramGroupsShow.actDelete]);

     with frmENInvestProgramGroupsShow do
     begin
       if ShowModal = mrOk then
       begin
         try
           if ENInvestProgramObj.invGroupRef = nil then ENInvestProgramObj.invGroupRef := ENInvestProgramGroupsRef.Create();
           ENInvestProgramObj.invGroupRef.code := StrToInt(GetReturnValue(sgENInvestProgramGroups, 0));
           edtInvestProgramGroupsName.Text := GetReturnValue(sgENInvestProgramGroups, 1) + '. ' +
                                              GetReturnValue(sgENInvestProgramGroups, 2);
         except
           on EConvertError do Exit;
         end;
       end;
     end;
   finally
     frmENInvestProgramGroupsShow.Free;
   end;
end;

procedure TfrmENInvestProgramEdit.spbPlanTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f: ENPlanWorkTypeFilter;
   element: ENElement;
   TempENPurchasesObject: ENPurchasesObjectControllerSoapPort;
   purchasesObjectFilter: ENPurchasesObjectFilter;
   purchasesObjectList: ENPurchasesObjectShortList;
begin
  if ENInvestProgramObj.elementRef = nil  then
  begin
    Application.MessageBox(PChar('Спочатку оберіть Об''єкт планування!'), PChar('Увага!'), MB_ICONWARNING);
    edtENElementName.SetFocus;
    Exit;
  end;

  if ENInvestProgramObj.elementRef.code = LOW_INT then
  begin
    Application.MessageBox(PChar('Спочатку оберіть Об''єкт планування!'), PChar('Увага!'), MB_ICONWARNING);
    edtENElementName.SetFocus;
    Exit;
  end;

  /////
  f := ENPlanWorkTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.conditionSQL := 'code in (' + IntToStr(ENPLANWORKTYPE_INVEST) + ', ' +
                                  IntToStr(ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST) + ')';
  /////

  element := DMReports.getElementByCode(ENInvestProgramObj.elementRef.code);

  if (element <> nil) then
    if (element.typeRef.code = EN_PURCHASES_OBJECT) then
    begin
      purchasesObjectFilter := ENPurchasesObjectFilter.Create;
      SetNullIntProps(purchasesObjectFilter);
      SetNullXSProps(purchasesObjectFilter);

      purchasesObjectFilter.element := ENElement.Create;
      purchasesObjectFilter.element.code := ENInvestProgramObj.elementRef.code;

      TempENPurchasesObject := HTTPRIOENPurchasesObject as ENPurchasesObjectControllerSoapPort;
      purchasesObjectList := TempENPurchasesObject.getScrollableFilteredList(purchasesObjectFilter, 0, -1);

      if purchasesObjectList <> nil then
        if purchasesObjectList.totalCount > 0 then
        begin
          if purchasesObjectList.list[0].elementTypeRefCode = EN_INVEST_COUNTERS then
            f.conditionSQL := 'code in (' + IntToStr(ENPLANWORKTYPE_ESBYT_PZ) + ', ' +
                                            IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_106) + ', ' +
                                            IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_111) + ', ' +
                                            IntToStr(ENPLANWORKTYPE_ESBYT_ZKO_112) + ')';
        end;
    end;

  frmENPlanWorkTypeShow := TfrmENPlanWorkTypeShow.Create(Application, fmNormal, f);
  try
    DisableActions([frmENPlanWorkTypeShow.actInsert, frmENPlanWorkTypeShow.actEdit, frmENPlanWorkTypeShow.actDelete,
                    frmENPlanWorkTypeShow.actFilter, frmENPlanWorkTypeShow.actNoFilter]);

    with frmENPlanWorkTypeShow do
    begin
      //DisableActions([actEdit, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramObj.planTypeRef = nil then ENInvestProgramObj.planTypeRef := ENPlanWorkTypeRef.Create();
          ENInvestProgramObj.planTypeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType, 0));
          edtPlanTypeName.Text := GetReturnValue(sgENPlanWorkType, 1);

          HideControls([lblName, edtName], (ENInvestProgramObj.planTypeRef.code <> ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST));
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENPlanWorkTypeShow.Free;
  end;
end;

procedure TfrmENInvestProgramEdit.spbTKMeasurementMeasurementClick(Sender : TObject);
var 
  frmTKMeasurementShow: TfrmTKMeasurementShow;
  mFilter: TKMeasurementFilter;
begin
  mFilter := TKMeasurementFilter.Create;
  SetNullIntProps(mFilter);
  SetNullXSProps(mFilter);
  // Фильтруем по умолчанию по "КМ", "ШТ", "1 КОМПЛЕКС"
  mFilter.conditionSQL := 'code in (8, 796, 1000000015)';

  frmTKMeasurementShow := TfrmTKMeasurementShow.Create(Application, fmNormal, mFilter);
  try
    DisableActions([frmTKMeasurementShow.actInsert, frmTKMeasurementShow.actEdit, frmTKMeasurementShow.actDelete]);

    with frmTKMeasurementShow do
      if ShowModal = mrOk then
      begin
        try
          if ENInvestProgramObj.measurement = nil then ENInvestProgramObj.measurement := TKMeasurement.Create();
          ENInvestProgramObj.measurement.code := StrToInt(GetReturnValue(sgTKMeasurement, 0));
          edtTKMeasurementMeasurementName.Text := GetReturnValue(sgTKMeasurement, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmTKMeasurementShow.Free;
  end;
end;



end.
