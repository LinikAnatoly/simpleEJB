unit AvarVneplanWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls , DialogFormUnit, InvokeRegistry,
  Rio, SOAPHTTPClient ;

type
  TfrmAvarVneplanWork = class(TDialogForm)
    lblEPRenName: TLabel;
    lblENBudgetName: TLabel;
    edtEPRenName: TEdit;
    edtENBudgetName: TEdit;
    spbEPRen: TSpeedButton;
    spbENBudget: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    Label1: TLabel;
    Label3: TLabel;
    dtpDateFrom: TDateTimePicker;
    dtpDateTo: TDateTimePicker;
    Label2: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    GroupBox1: TGroupBox;
    rbtypeAll: TRadioButton;
    rbtypeYear: TRadioButton;
    rbtypeMonth: TRadioButton;
    rbtypePlan: TRadioButton;
    rbtypeFact: TRadioButton;
    lblTKTechCardSourceTechcardsourceName: TLabel;
    edtTKTechCardSourceName: TEdit;
    spbTKTechCardSourceTechcardsource: TSpeedButton;
    spbTKTechCardSourceTechcardsourceClear: TSpeedButton;
    Label4: TLabel;
    edtParentClassification: TEdit;
    spbTKClassificationType: TSpeedButton;
    spbTKClassificationTypeClear: TSpeedButton;
    lblNumberTechkart: TLabel;
    edtNumberTechkard: TEdit;
    lblNameTechkard: TLabel;
    edtNameTechkard: TEdit;
    lblTypeName: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbTypeClear: TSpeedButton;
    lblWorkState: TLabel;
    edtActType: TEdit;
    spbENPlanWorkState: TSpeedButton;
    spbTypeactClear: TSpeedButton;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbElementTypeChange(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbTKTechCardSourceTechcardsourceClick(Sender: TObject);
    procedure spbTKTechCardSourceTechcardsourceClearClick(Sender: TObject);
    procedure spbTKClassificationTypeClick(Sender: TObject);
    procedure spbTKClassificationTypeClearClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure spbTypeactClearClick(Sender: TObject);
    procedure spbENPlanWorkStateClick(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;
    budgetCode: Integer;
    budgetName: String;
    ObjectName : String;
    elementCode: Integer;
    elementName: String;
    techcardsourcecode : Integer;
    TKClassificationTypecode : Integer;
    NumberTechkard : String;
    NameTechkard : String;
    WorkTypeCode : Integer;
    ActTypeCode : Integer;
    { Public declarations }
  end;

var
  frmAvarVneplanWork: TfrmAvarVneplanWork;

implementation

{$R *.dfm}
uses ShowENDepartment, ENDepartmentController, ENDepartmentTypeController ,
     ChildFormUnit ,  ENConsts , ENElementTypeController , ShowENElement ,
     ENElementController ,  ShowENEPRen , EnergyproController ,
  ShowTKTechCardSource, ShowTKClassificationType, 
  TKClassificationTypeController, ShowENPlanWorkType, ENPlanWorkTypeController, 
  ShowENPlanWorkState;

procedure TfrmAvarVneplanWork.spbEPRenClearClick(Sender: TObject);

begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
end;

procedure TfrmAvarVneplanWork.spbENBudgetClick(Sender: TObject);
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

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;


procedure TfrmAvarVneplanWork.spbENBudgetClearClick(Sender: TObject);
begin
  budgetCode := 0;
  budgetName := '';
  edtENBudgetName.Text := '';
  
end;

procedure TfrmAvarVneplanWork.spbEPRenClick(Sender: TObject);
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


procedure TfrmAvarVneplanWork.FormCreate(Sender: TObject);
begin

  dtpDateFrom.Date := date;
  dtpDateTo.Date := date;

  renCode := 0;
  renName := '';

  budgetCode := 0;
  budgetName := '';

  techcardsourcecode := 0;
  TKClassificationTypecode := 0;
  WorkTypeCode := 0;
  ActTypeCode := 0;
end;
procedure TfrmAvarVneplanWork.FormShow(Sender: TObject);
var
TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;
begin
  DisableControls([edtEPRenName, edtENBudgetName, edtENElementName ]);
  

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
end;

procedure TfrmAvarVneplanWork.cbElementTypeChange(Sender: TObject);
begin
    ObjectName:= frmAvarVneplanWork.cbElementTYpe.Text ;
    ObjectName:= ObjectName ;

end;

procedure TfrmAvarVneplanWork.spbENElementClick(Sender: TObject);
var
  frmENElementShow: TfrmENElementShow;
  f: ENElementFilter;
begin
  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  // если определен тип объекта
  if frmAvarVneplanWork.cbElementType.ItemIndex > -1 then
  begin
    if Integer(frmAvarVneplanWork.cbElementTYpe.Items.Objects[frmAvarVneplanWork.cbElementType.ItemIndex]) <> 0 then
    begin
      f.typeRef := ENElementTypeRef.Create;
      f.typeRef.code :=  Integer(frmAvarVneplanWork.cbElementTYpe.Items.Objects[frmAvarVneplanWork.cbElementType.ItemIndex]);
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
         // y if elementCode > 0 then chbByObjects.Checked := false;
         // y HideControls([chbByObjects], (elementCode > 0));
          ///
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementShow.Free;
  end;
end;


procedure TfrmAvarVneplanWork.spbENElementClearClick(Sender: TObject);
begin
  elementCode := 0;
  elementName := '';
  edtENElementName.Text := '';

  DisableControls([cbElementType] , False  ) ;
  cbElementType.ItemIndex := cbElementType.Items.IndexOf('');

end;

procedure TfrmAvarVneplanWork.spbTKTechCardSourceTechcardsourceClick(
  Sender: TObject);
var
  frmTKTechCardSourceShow: TfrmTKTechCardSourceShow;

begin
   frmTKTechCardSourceShow:=TfrmTKTechCardSourceShow.Create(Application,fmNormal);
   DisableActions([ frmTKTechCardSourceShow.actInsert , frmTKTechCardSourceShow.actEdit , frmTKTechCardSourceShow.actDelete]);
   try
      with frmTKTechCardSourceShow do
        if ShowModal = mrOk then
        begin
            try
               techcardsourcecode := StrToInt(GetReturnValue(sgTKTechCardSource,0));
               edtTKTechCardSourceName.Text:=GetReturnValue(sgTKTechCardSource,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTechCardSourceShow.Free;
   end;
end;

procedure TfrmAvarVneplanWork.spbTKTechCardSourceTechcardsourceClearClick(
  Sender: TObject);
begin
  // inherited;
    techcardsourcecode:= 0;
    edtTKTechCardSourceName.Text := ''; 
end;

procedure TfrmAvarVneplanWork.spbTKClassificationTypeClick(
  Sender: TObject);
var
   frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
   TempClassificationType: TKClassificationTypeControllerSoapPort;
begin
   frmTKClassificationTypeShow:=TfrmTKClassificationTypeShow.Create(Application,fmNormal);
   DisableActions([ frmTKClassificationTypeShow.actInsert , frmTKClassificationTypeShow.actEdit , frmTKClassificationTypeShow.actDelete]);
   try
      with frmTKClassificationTypeShow do
        if ShowModal = mrOk then
        begin
            try

               TKClassificationTypecode:=  TKClassificationTypeShort(tvDep.Selected.Data).code;
               edtParentClassification.Text:= TKClassificationTypeShort(tvDep.Selected.Data).name;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKClassificationTypeShow.Free;
   end;
end;

procedure TfrmAvarVneplanWork.spbTKClassificationTypeClearClick(
  Sender: TObject);
begin
 //  inherited;

               TKClassificationTypecode:=  0;
               edtParentClassification.Text:= '';

end;

procedure TfrmAvarVneplanWork.spbTypeClick(Sender: TObject);
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

procedure TfrmAvarVneplanWork.spbTypeClearClick(Sender: TObject);
begin
  edtTypeName.Text:= '';
  WorkTypeCode := 0;

end;

procedure TfrmAvarVneplanWork.spbTypeactClearClick(Sender: TObject);
begin
   ActTypeCode := 0 ;
   edtActType.Text := '' ;

end;

procedure TfrmAvarVneplanWork.spbENPlanWorkStateClick(Sender: TObject);
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
               edtActType.Text:= GetReturnValue(sgENPlanWorkState,1); 
               ActTypeCode:= StrToInt(GetReturnValue(sgENPlanWorkState,0));
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;
end;
end.

