unit ReportFactTransport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  InvokeRegistry, Rio, SOAPHTTPClient, CheckLst , ChildFormUnit;

type
  TfrmReportFactTransport = class(TDialogForm)
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    RadioGroup1: TRadioGroup;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIORQOrder: THTTPRIO;
    lblElementType: TLabel;
    cbElementType: TComboBox;
    HTTPRIOENElementType: THTTPRIO;
    rbPDF: TRadioButton;
    rbXLS: TRadioButton;
    dtpEndDate: TDateTimePicker;
    Label3: TLabel;
    dtpStartDate: TDateTimePicker;
    Label4: TLabel;
    lblMonthRaznar: TLabel;
    HTTPRIOTKMaterials: THTTPRIO;
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  //  procedure spbENElementClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   public
    { Public declarations }
    renCode: Integer;
    renName: String;
    budgCode: Integer;
    budgName: String;
    materialCode: Integer;
    materialName: String;
    billCode: Integer;
    billName: String;
    invoiceCode: Integer;
    invoiceName: String;
    contractCode: Integer;
    contractNumber: Integer;
    contractName: String;
    materialGroupCode: Integer;
    materialGroupName: String;
	  zayakind : String;
    orderform : String;
    ordertype : String;
    orderCode : Integer;
    orderName : String;
    elementCode : Integer;
    elementName : String;
    orderperiod : String;
    dategen : String;
    planName : String;
    planCode : Integer;
  end;

var
  frmReportFactTransport: TfrmReportFactTransport;

implementation

{$R *.dfm}
uses ENDepartmentController, ENDepartmentTypeController , ShowENDepartment , ENConsts ,
     EnergyproController, DMReportsUnit, ShowRQBill, RQBillController, ShowRQInvoice, RQInvoiceController,
     FINMolController, ShowFINMol, ENDepartment2EPRenController, ShowFINServicesObject, ENServicesObjectController,
     ShowTKMaterials, TKMaterialsController,
     ShowRQOrder, RQOrderController, RQOrderKindController, RQOrderStatusController,
     ShowENElement, ENElementController, ShowENPlanWork, ENPlanWorkController, ENPlanWorkKindController
     , ENElementTypeController , ENPeriodWithRENFormUnit,
  ReportStateMaterialsByObject;


procedure TfrmReportFactTransport.spbENBudgetClick(Sender: TObject);
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
              budgCode := ENDepartmentShort(tvDep.Selected.Data).code;
              budgName := ENDepartmentShort(tvDep.Selected.Data).shortName;
              edtENBudgetName.Text := budgName;

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmReportFactTransport.spbEPRenClick(Sender: TObject);
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

procedure TfrmReportFactTransport.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '0';
  edtEPRenName.Text := '';
end;

procedure TfrmReportFactTransport.spbENBudgetClearClick(Sender: TObject);
begin
  budgCode := 0;
  budgName := '0';
  edtENBudgetName.Text := '';
end;

procedure TfrmReportFactTransport.btnOkClick(Sender: TObject);
var
  argNames, args : ArrayOfString;
  reportName : String;
  i : integer;

begin

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

  begin
    SetLength(argNames, 8);
    SetLength(args, 8);

    argNames[0] := 'startDate';
    args[0] := DateToStr(dtpStartDate.DateTime);

    argNames[1] := 'endDate';
    args[1] := DateToStr(dtpEndDate.DateTime);

    argnames[2] := 'budgcode';
    if budgCode > 0 then
      args[2] := IntToStr(budgCode)
    else
      args[2] := IntToStr(0);

    argnames[3]:= 'rencode';
    if renCode > 0 then
     args[3] := IntTostr(renCode)
    else
     args[3] := '0';

      argnames[4] := 'elementtypecode';
      if  (cbElementType.ItemIndex = -1) or
          (cbElementType.ItemIndex = 0 ) then
      args[4] := IntToStr(0)
      else
      args[4] := IntToStr(Integer(cbElementTYpe.Items.Objects[cbElementType.ItemIndex])) ;

      argnames[5] := 'budgname';
      if length(budgName) <> 0 then
      args[5] := budgName
      else
      args[5] := '0';

      argnames[6] := 'renname';
      if length(renName) <> 0 then
      args[6] := renName
      else
      args[6] := '0';

      argnames[7] := 'elementtypename';
      if  (cbElementType.ItemIndex = -1) or
          (cbElementType.ItemIndex = 0 ) then
      args[7] := '0' else

      args[7] := cbElementType.Text;

      reportName := 'factTransport/transport_order_report' ;


    if rbXLS.Checked then
      makeReport(reportName, argNames, args, 'xls')
    else
      makeReport(reportName, argNames, args, 'pdf');
  end;

end;


procedure TfrmReportFactTransport.FormShow(Sender: TObject);
var
 TempENElementType: ENElementTypeControllerSoapPort;
 ENElementTypeList: ENElementTypeShortList;
 f : ENElementTypeFilter;
 i : integer;
 //
  TempTKMaterials: TKMaterialsControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;
begin
    {заполняем типы объектов}
 renname:= '0';
 budgname:= '0';
  cbElementType.Clear;

  f:= ENElementTypeFilter.Create;
  SetNullIntProps(f);

  f.conditionSQL := SQL_NO_SELECTED_ELEMENT_TYPE; //'code <> 4';
  f.orderBySQL := 'code';

  //cbElementType.Items.Add('');
  cbElementType.Items.AddObject(' ', TObject(LOW_INT));

  TempENElementType := HTTPRIOENElementType as ENElementTypeControllerSoapPort;
  ENElementTypeList := TempENElementType.getScrollableFilteredList(f,0,-1);
  for i:=0 to ENElementTypeList.totalCount-1 do
  begin
    cbElementType.Items.AddObject(ENElementTypeList.list[i].name, TObject(ENElementTypeList.list[i].code));
  end;

  cbElementType.DropDownCount := ENElementTypeList.totalCount + 1;

end;


end.
