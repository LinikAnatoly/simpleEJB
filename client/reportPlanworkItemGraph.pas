unit reportPlanworkItemGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs , DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient ;

type
  TfrmReportPlanworkItemGraph = class(TDialogForm)
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    lblMonthGen: TLabel;
    cbElementType: TComboBox;
    lblElementType: TLabel;
    HTTPRIOENElementType: THTTPRIO;
    lblType: TLabel;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbClearType: TSpeedButton;
    procedure btnOkClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbClearTypeClick(Sender: TObject);
  private
    { Private declarations }
    budgetCode: Integer;
    budgetName: String;

    renCode : Integer;
    renName : String;

    typeCode : Integer;
  public
    { Public declarations }
  end;

var
  frmReportPlanworkItemGraph: TfrmReportPlanworkItemGraph;

implementation

uses DMReportsUnit, EnergyproController, ShowENDepartment,
  EditENDepartmentFilter, ENDepartmentController, ENDepartmentTypeController,
  ENConsts , ChildFormUnit , EditENElementTypeFilter, ENElementTypeController,
  ShowENPlanWorkType;

{$R *.dfm}

procedure TfrmReportPlanworkItemGraph.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName : String;
begin


// Установка параметров
SetLength(argNames, 37);
SetLength(args, 37);

argNames[0] := 'month';
argNames[1] := 'year';
argNames[2] := 'podrcode';
argNames[3] := 'budgetrefcode';
argNames[4] := 'elementtypecode';
argNames[5] := 'monthName';


     argNames[6] := 'typeCode';
      if typeCode = 0
      then args[6] := '0'
      else
      args[6] := IntToStr( typeCode) ;

     if (edtMonthGen.ItemIndex >= 0) then
       args[0] := IntToStr(edtMonthGen.ItemIndex + 1 )
     else
       args[0] := '0' ;

     if (edtYearGen.ItemIndex >= 0) then
       args[1] := IntToStr( edtYearGen.ItemIndex + 2009 )
     else
       args[1] := '0' ;


     args[2] := IntToStr(renCode);
     args[3] := IntToStr(budgetCode);


      if (cbElementType.ItemIndex = -1  ) or
          (cbElementType.ItemIndex = 0 ) then
      args[4] := IntToStr(0)
      else
      args[4] := IntToStr(Integer(cbElementType.Items.Objects[cbElementType.ItemIndex])) ;

      args[5] := edtMonthGen.Text;


      ///// test

   {

argNames[0] := 'countDayInMonth';
argNames[1] := 'p_month';
argNames[2] := 'p_year';
argNames[3] := 'isWorkDay1';
argNames[4] := 'isWorkDay2';
argNames[5] := 'isWorkDay3';
argNames[6] := 'isWorkDay4';
argNames[7] := 'isWorkDay5';
argNames[8] := 'isWorkDay6';
argNames[9] := 'isWorkDay7';
argNames[10] := 'isWorkDay8';
argNames[11] := 'isWorkDay9';
argNames[12] := 'isWorkDay10';
argNames[13] := 'isWorkDay11';
argNames[14] := 'isWorkDay12';
argNames[15] := 'isWorkDay13';
argNames[16] := 'isWorkDay14';
argNames[17] := 'isWorkDay15';
argNames[18] := 'isWorkDay16';
argNames[19] := 'isWorkDay17';
argNames[20] := 'isWorkDay18';
argNames[21] := 'isWorkDay19';
argNames[22] := 'isWorkDay20';
argNames[23] := 'isWorkDay21';
argNames[24] := 'isWorkDay22';
argNames[25] := 'isWorkDay23';
argNames[26] := 'isWorkDay24';
argNames[27] := 'isWorkDay25';
argNames[28] := 'isWorkDay26';
argNames[29] := 'isWorkDay27';
argNames[30] := 'isWorkDay28';
argNames[31] := 'isWorkDay29';
argNames[32] := 'isWorkDay30';
argNames[33] := 'isWorkDay31';
argNames[34] := 'podrcode';
argNames[35] := 'budgetrefcode';
argNames[36] := 'elementtypecode';

args[0] := '31';
args[1] := '3';
args[2] := '2018';
args[3] := '1';
args[4] := '1';
args[5] := '1';
args[6] := '0';
args[7] := '1';
args[8] := '1';
args[9] := '1';
args[10] := '0';
args[11] := '0';
args[12] := '0';
args[13] := '0';
args[14] := '1';
args[15] := '1';
args[16] := '1';
args[17] := '1';
args[18] := '1';
args[19] := '0';
args[20] := '0';
args[21] := '1';
args[22] := '1';
args[23] := '1';
args[24] := '1';
args[25] := '1';
args[26] := '0';
args[27] := '0';
args[28] := '1';
args[29] := '1';
args[30] := '1';
args[31] := '1';
args[32] := '1';
args[33] := '0';
args[34] := '1';
args[35] := '0';
args[36] := '0';     }


reportName := 'Graph/graphPlanworkItemMain';
//reportName := 'Graph/graphPlanworkItem';

makeReport(reportName, argNames, args, 'xls');



end;

procedure TfrmReportPlanworkItemGraph.FormShow(Sender: TObject);
var
 f : ENElementTypeFilter;
 TempENElementType :  ENElementTypeControllerSoapPort;
 ENElementTypeList :  ENElementTypeShortList;
 i : integer;
begin
     SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
     SetComboBoxCurrentMonth(edtMonthGen);

     DisableControls([edtTypeName , edtENBudgetName  ,  edtEPRenName ]);

     renCode := 1;
     budgetCode := 0;
     typeCode := 0;


     { заполняем выпадающий список типов объектов }
    cbElementType.Clear;

    f:= ENElementTypeFilter.Create;
    SetNullIntProps(f);
    f.conditionSQL := SQL_SELECTED_ELEMENT_TYPE_FOR_REPORT_WORK_SCHEDULE;
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

procedure TfrmReportPlanworkItemGraph.spbClearTypeClick(Sender: TObject);
begin
  inherited;
   typeCode := 0;
   edtTypeName.Text := '';
end;

procedure TfrmReportPlanworkItemGraph.spbENBudgetClearClick(Sender: TObject);
begin
  inherited;
  edtENBudgetName.Text := '';
  budgetCode := 0;
end;

procedure TfrmReportPlanworkItemGraph.spbENBudgetClick(Sender: TObject);
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

procedure TfrmReportPlanworkItemGraph.spbEPRenClearClick(Sender: TObject);
begin
  inherited;
  renCode:= 1;
  edtEPRenName.Text := '';

end;

procedure TfrmReportPlanworkItemGraph.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportPlanworkItemGraph.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin

        if ShowModal = mrOk then
        begin
               edtTypeName.Text := GetReturnValue(sgENPlanWorkType,1);
               typeCode := StrToInt(GetReturnValue(sgENPlanWorkType,0));
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;

end;

end.
