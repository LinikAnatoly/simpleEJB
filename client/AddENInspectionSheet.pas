
unit AddENInspectionSheet;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENInspectionSheetController;

type
    TfrmENInspectionSheetAdd = class(TDialogForm)
    lblName : TLabel;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;

    HTTPRIOENInspectionSheet: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtName: TEdit;
    spbInspectionSheet: TSpeedButton;
    lblInspectionKind: TLabel;
    cbInspectionKind: TComboBox;
    lblExecutor: TLabel;
    lblAccepted: TLabel;
    edtExecutor: TEdit;
    spbExecutor: TSpeedButton;
    edtAccepted: TEdit;
    btnAccepted: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbInspectionSheetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbExecutorClick(Sender: TObject);
    procedure btnAcceptedClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
    elementType: Integer;
    voltageClassCode: Integer;
    ENInspectionSheetObj: ENInspectionSheet;
  end;

var
  frmENInspectionSheetAdd: TfrmENInspectionSheetAdd;
  // ENInspectionSheetObj: ENInspectionSheet;

implementation


uses
  TKDefects2InspectionController, ShowTKDefects2Inspection, ENElementTypeController,
  FINWorkerController, ShowFINWorker, ENVoltageClassController;

{$R *.dfm}



procedure TfrmENInspectionSheetAdd.FormCreate(Sender: TObject);
begin
  inherited;
  elementType := Low(Integer);
  voltageClassCode := Low(Integer);
end;


procedure TfrmENInspectionSheetAdd.FormShow(Sender: TObject);
begin
  if DialogState = dsView then
  begin
    // DisableControls([]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtName, edtExecutor, edtAccepted]);
    DenyBlankValues([edtName, edtDateGen, cbInspectionKind, edtExecutor, edtAccepted]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
   //
  end;
end;


procedure TfrmENInspectionSheetAdd.spbExecutorClick(Sender: TObject);
var
  frmFINWorkerShow : TfrmFINWorkerShow;
  f : FINWorkerFilter;
  //w : FINWorker;
  //TempFINWorker : FINWorkerControllerSoapPort;
begin
  inherited;
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.departmentCode := '-1';

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try
    frmFINWorkerShow.dateGet := TXSDate.Create;
    frmFINWorkerShow.isShowCEO := False;
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtExecutor.Text := GetReturnValue(sgFINWorker,3) + ' - ' + GetReturnValue(sgFINWorker,1);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENInspectionSheetAdd.spbInspectionSheetClick(Sender: TObject);
var
  defects2InspectionFilter: TKDefects2InspectionFilter;
  frmTKDefects2InspectionShow: TfrmTKDefects2InspectionShow;
begin
  inherited;
  defects2InspectionFilter := TKDefects2InspectionFilter.Create;
  SetNullIntProps(defects2InspectionFilter);
  SetNullXSProps(defects2InspectionFilter);

  defects2InspectionFilter.elementTypeRef := ENElementTypeRef.Create;
  defects2InspectionFilter.elementTypeRef.code := elementType;

  if voltageClassCode > 0 then
  begin
    defects2InspectionFilter.voltageClassRef := ENVoltageClassRef.Create;
    defects2InspectionFilter.voltageClassRef.code := voltageClassCode;
  end;

  frmTKDefects2InspectionShow := TfrmTKDefects2InspectionShow.Create(Application, fmNormal, defects2InspectionFilter);
  DisableActions([frmTKDefects2InspectionShow.actInsert, frmTKDefects2InspectionShow.actEdit, frmTKDefects2InspectionShow.actDelete,
      frmTKDefects2InspectionShow.actFilter, frmTKDefects2InspectionShow.actNoFilter]);
  try
    with frmTKDefects2InspectionShow do
    if ShowModal = mrOk then
    begin
      try
        if ENInspectionSheetObj.defects2InspectRef = nil then
          ENInspectionSheetObj.defects2InspectRef := TKDefects2InspectionRef.Create;
        ENInspectionSheetObj.defects2InspectRef.code := StrToInt(GetReturnValue(sgTKDefects2Inspection,0));
        edtName.Text := GetReturnValue(sgTKDefects2Inspection,1);

        ENInspectionSheetObj.inspectionKind := cbInspectionKind.ItemIndex + 1;
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmTKDefects2InspectionShow.Free;
  end;
end;


procedure TfrmENInspectionSheetAdd.btnAcceptedClick(Sender: TObject);
var
  frmFINWorkerShow : TfrmFINWorkerShow;
  f : FINWorkerFilter;
  //w : FINWorker;
  //TempFINWorker : FINWorkerControllerSoapPort;
begin
  inherited;
  f := FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.departmentCode := '-1';

  frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
  try
    frmFINWorkerShow.dateGet := TXSDate.Create;
    frmFINWorkerShow.isShowCEO := False;
    DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

    with frmFINWorkerShow do
      if ShowModal = mrOk then
      begin
        try
          edtAccepted.Text := GetReturnValue(sgFINWorker,3) + ' - ' + GetReturnValue(sgFINWorker,1);
        except
          on EConvertError do Exit;
        end;
      end;
   finally
      frmFINWorkerShow.Free;
   end;
end;


procedure TfrmENInspectionSheetAdd.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENInspectionSheet: ENInspectionSheetControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtdateGen]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENInspectionSheet := HTTPRIOENInspectionSheet as ENInspectionSheetControllerSoapPort;

    ENInspectionSheetObj.name := edtName.Text;
    ENInspectionSheetObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

    ENInspectionSheetObj.executor := edtExecutor.Text;
    ENInspectionSheetObj.accepted := edtAccepted.Text;

    ENInspectionSheetObj.inspectionKind := cbInspectionKind.ItemIndex + 1;

    if DialogState = dsInsert then
    begin
      ENInspectionSheetObj.code:=low(Integer);
      ENInspectionSheetObj.code:=TempENInspectionSheet.add(ENInspectionSheetObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInspectionSheet.save(ENInspectionSheetObj);
    end;
  end;
end;


end.