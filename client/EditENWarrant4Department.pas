
unit EditENWarrant4Department;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENWarrant4DepartmentController;

type
    TfrmENWarrant4DepartmentEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;

    HTTPRIOENWarrant4Department: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblENDepartmentName: TLabel;
    edtENDepartmentName: TEdit;
    spbENDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    gbWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantNumber: TLabel;
    spbWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantNumber: TEdit;
    lblAgreementKind: TLabel;
    edtAgreementKind: TEdit;
    spbAgreementKind: TSpeedButton;
    HTTPRIOENWarrant: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure spbAgreementKindClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENWarrant4DepartmentEdit: TfrmENWarrant4DepartmentEdit;
  ENWarrant4DepartmentObj: ENWarrant4Department;

implementation



{$R *.dfm}


uses
  ENDepartmentController
  , ShowENDepartment
  , ENDepartmentTypeController
  , ENConsts
  , ENWarrantController
  , ShowENWarrant
  , ShowENAgreementKind
  , ENAgreementKindController
  , EditENWarrant
;



procedure TfrmENWarrant4DepartmentEdit.FormShow(Sender: TObject);
var
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
  warrant4DepartmentShortObj: ENWarrant4DepartmentShort;
begin
  lblCode.Visible := (DialogState <> dsInsert);
  edtCode.Visible := (DialogState <> dsInsert);
  TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;

  DisableControls([edtCode, edtENDepartmentName, edtWarrantNumber, edtWarrantFIO, edtAgreementKind]);

  if (DialogState = dsView)then
  begin
    DisableControls([spbENDepartment, spbAgreementKind]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtENDepartmentName, edtWarrantNumber, edtWarrantFIO, edtAgreementKind]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENWarrant4DepartmentObj.code);

    warrant4DepartmentShortObj := TempENWarrant4Department.getShortObject(ENWarrant4DepartmentObj.code);

    edtENDepartmentName.Text := warrant4DepartmentShortObj.departmentRefShortName;
    edtWarrantFIO.Text := warrant4DepartmentShortObj.warrantRefWarrantFIO;
    edtWarrantNumber.Text := warrant4DepartmentShortObj.warrantRefNumbergen;
    edtAgreementKind.Text := warrant4DepartmentShortObj.agreementKindRefName;
  end;
end;



procedure TfrmENWarrant4DepartmentEdit.spbAgreementKindClick(Sender: TObject);
var
  AgreementKindFilter: ENAgreementKindFilter;
  frmENAgreementKindShow: TfrmENAgreementKindShow;
begin
  inherited;
  frmENAgreementKindShow := TfrmENAgreementKindShow.Create(Application, fmNormal);

  try
    // frmENDepartmentShow.isShowAll := True;

    with frmENAgreementKindShow do begin
      if ShowModal = mrOk then
      begin
        try
          ENWarrant4DepartmentObj.agreementKindRef := ENAgreementKindRef.Create;
          ENWarrant4DepartmentObj.agreementKindRef.code := StrToInt(GetReturnValue(sgENAgreementKind,0));
          edtAgreementKind.Text := GetReturnValue(sgENAgreementKind,1);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENAgreementKindShow.Free;
  end;
end;


procedure TfrmENWarrant4DepartmentEdit.spbENDepartmentClick(Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  depFilter: ENDepartmentFilter;
  TempENDepartment: ENDepartmentControllerSoapPort;
begin
  inherited;
  TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

  depFilter := ENDepartmentFilter.Create;
  SetNullXSProps(depFilter);
  SetNullIntProps(depFilter);

  depFilter.typeRef := ENDepartmentTypeRef.Create;
  depFilter.typeRef.code := ENDEPARTMENTTYPE_DEPARTMENT;
  depFilter.parentRef := ENDepartmentRef.Create;
  depFilter.parentRef.code := ENDEPARTMENT_REM;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, depFilter);

  try
    // frmENDepartmentShow.isShowAll := True;

    with frmENDepartmentShow do begin
      if ShowModal = mrOk then
      begin
        try
          ENWarrant4DepartmentObj.departmentRef := ENDepartmentRef.Create();
          ENWarrant4DepartmentObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
          edtENDepartmentName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmENWarrant4DepartmentEdit.spbWarrantNumberClick(Sender: TObject);
var
  frmENWarrantShow: TfrmENWarrantShow;
  warrantFilter: ENWarrantFilter;
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
  warrant4DepartmentShortObj: ENWarrant4DepartmentShort;
  TempENWarrant: ENWarrantControllerSoapPort;
begin
  inherited;
  TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;

  if (DialogState = dsView) then
  begin
    if (ENWarrant4DepartmentObj.code = Low(Integer)) then Exit;

    warrant4DepartmentShortObj := TempENWarrant4Department.getShortObject(ENWarrant4DepartmentObj.code);
    ENWarrantObj := TempENWarrant.getObject(warrant4DepartmentShortObj.warrantRefCode);

    frmENWarrantEdit := TfrmENWarrantEdit.Create(Application, dsView);
    try
      frmENWarrantEdit.ShowModal;
    finally
      frmENWarrantEdit.Free;
      frmENWarrantEdit := nil;
    end;

  end else
  begin
    warrantFilter := ENWarrantFilter.Create();
    SetNullXSProps(warrantFilter);
    SetNullIntProps(warrantFilter);
    warrantFilter.conditionSQL := ' warrantstatusrefcode = 0';

    frmENWarrantShow := TfrmENWarrantShow.Create(Application, fmNormal, warrantFilter);

    try
      with frmENWarrantShow do
        if ShowModal = mrOk then
        begin
          try
            ENWarrant4DepartmentObj.warrantRef := ENWarrantRef.Create();
            ENWarrant4DepartmentObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

            edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
            edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
          except
            on EConvertError do Exit;
          end;
        end;
    finally
      frmENWarrantShow.Free;
    end;
  end;
end;


procedure TfrmENWarrant4DepartmentEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([ edtENDepartmentName, edtWarrantNumber, edtWarrantFIO, edtAgreementKind ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENWarrant4DepartmentObj.code:=low(Integer);
      TempENWarrant4Department.add(ENWarrant4DepartmentObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENWarrant4Department.save(ENWarrant4DepartmentObj);
    end;
  end;
end;


end.