unit EditMakePlanworkByGraph;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, InvokeRegistry, Rio,
  SOAPHTTPClient , ChildFormUnit  ;

type
  TfrmMakePlanworkByGraph = class(TDialogForm)
    gbWorkOrderMOL: TGroupBox;
    Label5: TLabel;
    spbMaster: TSpeedButton;
    spbMasterClear: TSpeedButton;
    lblMolMech: TLabel;
    spbMechanic: TSpeedButton;
    spbMechanicClear: TSpeedButton;
    edtMasterName: TEdit;
    edtMechanicName: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIOENDepartment: THTTPRIO;
    procedure spbMasterClick(Sender: TObject);
    procedure spbMechanicClick(Sender: TObject);
    procedure spbMasterClearClick(Sender: TObject);
    procedure spbMechanicClearClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planCode: Integer;
    departmentCode : Integer;
    masterName,  mechanicName, masterCode,  mechanicCode : string;
  end;

var
  frmMakePlanworkByGraph: TfrmMakePlanworkByGraph;

implementation

uses FINMolController, ShowFINMol, ENDepartment2EPRenController, ENConsts,
  ENDepartmentController;

{$R *.dfm}

procedure TfrmMakePlanworkByGraph.btnOkClick(Sender: TObject);
begin
    ModalResult:= mrOk;
end;

procedure TfrmMakePlanworkByGraph.spbMasterClearClick(Sender: TObject);
begin
  inherited;
  masterCode := '';
  masterName := '';
  edtMasterName.Text := '';
end;

procedure TfrmMakePlanworkByGraph.spbMasterClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        masterCode := GetReturnValue(sgFINMol, 0);
        masterName := GetReturnValue(sgFINMol, 1);

        edtMasterName.Text := masterCode + ' ' + masterName;

      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

procedure TfrmMakePlanworkByGraph.spbMechanicClearClick(Sender: TObject);
begin
  inherited;
  mechanicCode := '';
  mechanicName := '';
  edtMechanicName.Text := '';
end;

procedure TfrmMakePlanworkByGraph.spbMechanicClick(Sender: TObject);
var
  f: FINMolFilter;
  frmFINMolShow: TfrmFINMolShow;

  TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  //ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter: ENDepartment2EPRenFilter;
  renList: ENDepartment2EPRenShortList;

  //molSel: boolean;
begin
  f := FINMolFilter.Create;
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.state := 1; // типа только работающие ...

  if departmentCode <> LOW_INT then
  begin
    renFilter := ENDepartment2EPRenFilter.Create;
    SetNullXSProps(renFilter);
    SetNullIntProps(renFilter);

    renFilter.departmentRef := ENDepartmentRef.Create;
    renFilter.departmentRef.code := departmentCode;

    TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;

    renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);

    if renList.totalCount > 0 then
      f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode);
  end;

  frmFINMolShow := TfrmFINMolShow.Create(Application, fmNormal, f);
  try
    if Length(f.conditionSQL) > 0 then
      frmFINMolShow.isFiltered := true;

    with frmFINMolShow do
    begin
      DisableActions([frmFINMolShow.actEdit, frmFINMolShow.actInsert]);
      if ShowModal = mrOk then
      begin
        mechanicCode := GetReturnValue(sgFINMol, 0);
        mechanicName := GetReturnValue(sgFINMol, 1);

        edtMechanicName.Text := mechanicCode + ' ' + mechanicName;
      end;
    end;
  finally
    frmFINMolShow.Free;
  end;
end;

end.
