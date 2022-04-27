
unit EditRQAllocationListFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListController ;

type
  TfrmRQAllocationListFilterEdit = class(TDialogForm)

    lblNumberGen : TLabel;
    edtNumberGen: TEdit;

    lblDateGen : TLabel;
    edtDateStartDateGen: TDateTimePicker;
    lblDateStart : TLabel;
    edtDateStartListPeriod: TDateTimePicker;


  HTTPRIORQAllocationList: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtDateFinalDateGen: TDateTimePicker;
    lblDateFinalDateGen: TLabel;
    edtDateFinalListPeriod: TDateTimePicker;
    lblDateFinalListPeriod: TLabel;
    lblENDepartment: TLabel;
    edtENDepartment: TEdit;
    spbENDepartmentClear: TSpeedButton;
    spbENDepartment: TSpeedButton;
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQAllocationListFilterEdit: TfrmRQAllocationListFilterEdit;
  RQAllocationListFilterObj: RQAllocationListFilter;

implementation

 uses ENDepartmentController, ShowENDepartment;

{$R *.dfm}



procedure TfrmRQAllocationListFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationList: RQAllocationListControllerSoapPort;
condition : string;
begin
  if (ModalResult = mrOk)  then
  begin

     RQAllocationListFilterObj.numberGen := edtNumberGen.Text;

     condition := '';

     if edtDateStartDateGen.Checked then
       AddCondition(condition, ' RQALLOCATIONLIST.dategen >= to_date(''' + DateToStr(edtDateStartDateGen.Date) + ''', ''dd.MM.yyyy'')');

     if edtDateFinalDateGen.Checked then
       AddCondition(condition, ' RQALLOCATIONLIST.dategen <= to_date(''' + DateToStr(edtDateFinalDateGen.Date) + ''', ''dd.MM.yyyy'')');

	 if edtDateStartListPeriod.Checked then
       AddCondition(condition, ' RQALLOCATIONLIST.listPeriod >= to_date(''' + DateToStr(edtDateStartListPeriod.Date) + ''', ''dd.MM.yyyy'')');

     if edtDateFinalListPeriod.Checked then
       AddCondition(condition, ' RQALLOCATIONLIST.listPeriod <= to_date(''' + DateToStr(edtDateFinalListPeriod.Date) + ''', ''dd.MM.yyyy'')');
	   
	RQAllocationListFilterObj.conditionSQL := condition;


  end;
end;




procedure TfrmRQAllocationListFilterEdit.FormShow(Sender: TObject);
begin
  inherited;
  DisableControls([edtENDepartment]);
end;

procedure TfrmRQAllocationListFilterEdit.spbENDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
  if (not Assigned(RQAllocationListFilterObj)) 
    or (not Assigned(RQAllocationListFilterObj.departmentRef)) then begin
    Exit;
  end;
  
  RQAllocationListFilterObj.departmentRef.code := Low(Integer);
  edtENDepartment.Text := '';
end;

procedure TfrmRQAllocationListFilterEdit.spbENDepartmentClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
       if not Assigned(RQAllocationListFilterObj) then begin
		       RQAllocationListFilterObj := RQAllocationListFilter.Create;
		   end;
		   
		   if not Assigned(RQAllocationListFilterObj.departmentRef) then begin
		       RQAllocationListFilterObj.departmentRef := ENDepartmentRef.Create;
		   end;

       RQAllocationListFilterObj.departmentRef.code := selectedObj.code;
       edtENDepartment.Text := selectedObj.shortName;
  end);
end;

end.