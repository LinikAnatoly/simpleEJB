unit ReportCallCenterPlannedWorksUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,DialogFormUnit,
  ENElementController, ENDepartmentController, ENElementTypeController;

type
  TReportCallCenterPlannedWorks = class(TDialogForm)
    edtDateStart: TDateTimePicker;
    lblDateGen: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtDateEnd: TDateTimePicker;
    spbENElement: TSpeedButton;
    lblENElementName: TLabel;
    edtENElementName: TEdit;
    lblState: TLabel;
    spbState: TSpeedButton;
    edtStateName: TEdit;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    Label2: TLabel;
    spbENElementType: TSpeedButton;
    edtENElementTypeName: TEdit;
    procedure btnOkClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbStateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbENElementTypeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportCallCenterPlannedWorks: TReportCallCenterPlannedWorks;

implementation

{$R *.dfm}

uses ChildFormUnit,EnergyproController , DMReportsUnit,
ShowENPlanWorkState, ShowENElement, ShowENDepartment, ShowENElementType, ShowENEPRen;

var
  renCode:Integer = -1;
  elementCode:Integer = -1;
  stateCode:Integer = -1;
  elementtypeCode:Integer = -1;

procedure TReportCallCenterPlannedWorks.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
      /////// Parameters
      SetLength(argNames, 6);
      SetLength(args, 6);

      argNames[0] := 'startDate';
      args[0] := DateToStr(edtDateStart.Date);

      argNames[1] := 'endDate';
      args[1] := DateToStr(edtDateEnd.Date);

      argNames[2] := 'renCode';
      args[2] := IntToStr(renCode);

      argNames[3] := 'elementTypeCode';
      args[3] := IntToStr(elementTypeCode);

      argNames[4] := 'elementCode';
      args[4] := IntToStr(elementCode);

      argNames[5] := 'pwsCode';
      args[5] := IntToStr(stateCode);

      reportName := 'CallCenter/Planned_Damages';

      makeReport(reportName, argNames, args, 'xls');
end;

procedure TReportCallCenterPlannedWorks.FormShow(Sender: TObject);
begin
  DisableControls([edtENElementName, edtStateName, edtEPRenName, edtENElementTypeName]);
  edtDateStart.DateTime:=Now;
  edtDateEnd.DateTime:=Now;
  renCode:= -1;
  elementCode:= -1;
  stateCode:= -1;
  elementtypeCode:= -1;
end;

procedure TReportCallCenterPlannedWorks.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
   //o : EN
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
     //f.conditionSQL := 'code in (select elementrefcode from enline10 union all select elementcode from enlin150 union all select elementrefcode from ensubstation10 union all select elementrefcode from ensubstation150)
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               elementCode := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TReportCallCenterPlannedWorks.spbENElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  Filter: ENElementTypeFilter;
begin
  Filter := ENElementTypeFilter.Create;
  SetNullIntProps(Filter);
  SetNullXSProps(Filter);
  Filter.orderBySQL := 'code';



  frmENElementTypeShow := TfrmENElementTypeShow.Create(Application,fmNormal, Filter);
  try
  with frmENElementTypeShow do
      if ShowModal = mrOk then
      begin
        try
          elementtypeCode := StrToInt(GetReturnValue(sgENElementType,0));
          edtENElementTypeName.Text := GetReturnValue(sgENElementType,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENElementTypeShow.Free;
  end;

end;
procedure TReportCallCenterPlannedWorks.spbEPRenClick(Sender: TObject);
var
   frmENEPRenShow: TfrmENEPRenShow;
begin
   frmENEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal, nil);
  try
  with frmENEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          renCode := StrToInt(GetReturnValue(sgEPRen,0));
          edtEPRenName.Text := GetReturnValue(sgEPRen,1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENEPRenShow.Free;
  end;
end;

procedure TReportCallCenterPlannedWorks.spbStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow : TfrmENPlanWorkStateShow;
begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin

        if ShowModal = mrOk then
        begin
               stateCode := StrToInt(GetReturnValue(sgENPlanWorkState,0));
               edtStateName.Text := GetReturnValue(sgENPlanWorkState,1);
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;

end;
end.
