
unit PrintRegisterDefects;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENInspectionSheetController, EnergyproController;

type
    TfrmPrintRegisterDefects = class(TDialogForm)
    lblDateGen : TLabel;
    edtDateGenStart: TDateTimePicker;
    lblDateEdit : TLabel;
    edtDateGenEnd: TDateTimePicker;
    HTTPRIOENInspectionSheet: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    Label3: TLabel;
    cbInspectionKind: TComboBox;
    edtElementType: TEdit;
    spbENElementType: TSpeedButton;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    spbENElementClear: TSpeedButton;
    spbDepartmentClear: TSpeedButton;
    spbENElementTypeClear: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbDepartmentClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENElementTypeClick(Sender: TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure spbENElementClearClick(Sender: TObject);
    procedure spbDepartmentClearClick(Sender: TObject);
    procedure spbENElementTypeClearClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    elementCode, elementTypeCode, renCode, inspectionKindCode : Integer;

end;

var
  frmPrintRegisterDefects: TfrmPrintRegisterDefects;

implementation


uses
  ShowENEPRen, ShowENElementType, ENElementTypeController,
  ENInspectionSheetStatusController, ShowENElement,
  ENElementController, DMReportsUnit;

{$R *.dfm}



procedure TfrmPrintRegisterDefects.FormCreate(Sender: TObject);
begin
  inherited;
  elementTypeCode := Low(Integer);
  renCode := Low(Integer);
  elementCode := Low(Integer);
end;


procedure TfrmPrintRegisterDefects.FormShow(Sender: TObject);
begin
  DisableControls([edtElementType, edtDepartment, edtENElementName]);
  DenyBlankValues([edtDateGenStart, edtDateGenEnd, edtElementType, edtENElementName, edtDepartment, cbInspectionKind]);
end;


procedure TfrmPrintRegisterDefects.spbDepartmentClearClick(Sender: TObject);
begin
  inherited;
  edtDepartment.Text := '';
  renCode := Low(Integer);
end;


procedure TfrmPrintRegisterDefects.spbDepartmentClick(Sender: TObject);
var
  frmENEPRenShow: TfrmENEPRenShow;
begin
  inherited;
  frmENEPRenShow := TfrmENEPRenShow.Create(Application, fmNormal);
  try
    with frmENEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          edtDepartment.Text := GetReturnValue(sgEPRen, 1);
          renCode := StrToInt(GetReturnValue(sgEPRen, 0));
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENEPRenShow.Free;
  end;
end;


procedure TfrmPrintRegisterDefects.spbENElementClearClick(Sender: TObject);
begin
  inherited;
  edtENElementName.Text := '';
  elementCode := Low(Integer);
end;


procedure TfrmPrintRegisterDefects.spbENElementClick(Sender: TObject);
var
  frmENElementShow : TfrmENElementShow;
  f : ENElementFilter;
  //invNum, depName: String;
  //depCode : Integer;
begin
  inherited;

  f := ENElementFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.orderBySQL := 'typerefcode';

  frmENElementShow := TfrmENElementShow.Create(Application, fmNormal, f);
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


procedure TfrmPrintRegisterDefects.spbENElementTypeClearClick(Sender: TObject);
begin
  inherited;
  edtElementType.Text := '';
  elementTypeCode := Low(Integer);
end;


procedure TfrmPrintRegisterDefects.spbENElementTypeClick(Sender: TObject);
var
  frmENElementTypeShow: TfrmENElementTypeShow;
  f: ENElementTypeFilter;
begin
  inherited;
  f := ENElementTypeFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  frmENElementTypeShow := TfrmENElementTypeShow.Create(Application,fmNormal, f);
  DisableActions([frmENElementTypeShow.actInsert, frmENElementTypeShow.actEdit,
    frmENElementTypeShow.actFilter, frmENElementTypeShow.actNoFilter, frmENElementTypeShow.actDelete]);
  try
    with frmENElementTypeShow do
    if ShowModal = mrOk then
    begin
      try
        elementTypeCode := StrToInt(GetReturnValue(sgENElementType,0));
        edtElementType.Text := GetReturnValue(sgENElementType,1);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementTypeShow.Free;
  end;
end;


procedure TfrmPrintRegisterDefects.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  if (ModalResult = mrOk)  then
  begin

    SetLength(argNames, 6);
    SetLength(args, 6);

    argNames[0] := 'datestart';
    args[0] := DateToStr(edtDateGenStart.Date);

    argNames[1] := 'datefinal';
    args[1] := DateToStr(edtDateGenEnd.Date);

    argNames[2] := 'elementCode';
    args[2] := IntToStr(elementCode);

    argNames[3] := 'renCode';
    args[3] := IntToStr(renCode);

    argNames[4] := 'elementTypeCode';
    args[4] := IntToStr(elementTypeCode);


    if (cbInspectionKind.ItemIndex > 0) then
      inspectionKindCode := cbInspectionKind.ItemIndex
    else
      inspectionKindCode := Low(Integer);

    argNames[5] := 'inspectionKindCode';
    args[5] := IntToStr(inspectionKindCode);

    reportName := 'InspectionSheet/registerDefects';
    makeReport(reportName , argNames , args , 'xls');

  end;
end;


end.