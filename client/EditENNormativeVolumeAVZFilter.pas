
unit EditENNormativeVolumeAVZFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENNormativeVolumeAVZController,
    ShowENDepartment, ENDepartmentController, ENDepartmentTypeController, ENConsts ;

type
    TfrmENNormativeVolumeAVZFilterEdit = class(TDialogForm)


    HTTPRIOENNormativeVolumeAVZ: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblENBudgetName: TLabel;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbDepartment: TSpeedButton;
    cmbRest_purpose_type: TComboBox;
    lblRest_purpose_type: TLabel;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);


  private
    function getRest_purpose_type_id : Integer;
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENNormativeVolumeAVZFilterEdit: TfrmENNormativeVolumeAVZFilterEdit;
  ENNormativeVolumeAVZFilterObj: ENNormativeVolumeAVZFilter;

implementation

uses Generics.Collections;

{uses  
    EnergyproController, EnergyproController2, ENNormativeVolumeAVZController  ;
}
{$R *.dfm}

var rest_purpose_types : TList<Integer>;


function TfrmENNormativeVolumeAVZFilterEdit.getRest_purpose_type_id : Integer;
var rest_purpose_type_id : Integer;
begin
  if cmbRest_purpose_type.ItemIndex = -1 then begin
    Result := Low(Integer);
    Exit;
  end;

  rest_purpose_type_id := rest_purpose_types[cmbRest_purpose_type.ItemIndex];
  if rest_purpose_type_id < 0 then raise Exception.Create('Помилка при визначенні типу залишка');
  Result := rest_purpose_type_id;
end;

procedure TfrmENNormativeVolumeAVZFilterEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtDepartment, edtENBudgetName]);
  DenyBlankValues([edtDepartment, edtENBudgetName]);
end;


procedure TfrmENNormativeVolumeAVZFilterEdit.spbDepartmentClick(
  Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          if ENNormativeVolumeAVZFilterObj.departmentRef = nil then
            ENNormativeVolumeAVZFilterObj.departmentRef := ENDepartmentRef.Create();

          ENNormativeVolumeAVZFilterObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZFilterEdit.spbENBudgetClick(Sender: TObject);
var
  frmENDepartmentShow : TfrmENDepartmentShow;
  f : ENDepartmentFilter;
begin
  inherited;
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);
  f.typeRef := ENDepartmentTypeRef.Create;
  f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
  f.conditionSQL := ' parentrefcode is null';

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application,fmNormal, f);
  try
    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          if ENNormativeVolumeAVZFilterObj.budgetRef = nil then
            ENNormativeVolumeAVZFilterObj.budgetRef := ENDepartmentRef.Create();

          ENNormativeVolumeAVZFilterObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName ;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENNormativeVolumeAVZFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENNormativeVolumeAVZ: ENNormativeVolumeAVZControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin
     ENNormativeVolumeAVZFilterObj.rest_purpose_type_id := getRest_purpose_type_id;
     // ENNormativeVolumeAVZFilterObj.userGen := edtUserGen.Text;
  end;
end;

initialization

rest_purpose_types := TList<Integer>.Create;
rest_purpose_types.AddRange([REST_PURPOSE_TYPE_ID_AVAR
  , REST_PURPOSE_TYPE_ID_PVZ, REST_PURPOSE_TYPE_ID_AVR16]);


end.