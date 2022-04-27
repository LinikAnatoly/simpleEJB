
unit EditRQAllocationListItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListItemController ;

type
  TfrmRQAllocationListItemFilterEdit = class(TDialogForm)

    lblMaterialName : TLabel;

    lblMeasurementName : TLabel;
    edtMeasurementName: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblCountFact : TLabel;
    edtCountFact: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQAllocationListItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtMaterialName: TEdit;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    spbENBudgetClear: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENBudgetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENBudgetClearClick(Sender: TObject);
  

  private
    { Private declarations }
  public
  budgetRefCode : Integer;
    { Public declarations }

end;

var
  frmRQAllocationListItemFilterEdit: TfrmRQAllocationListItemFilterEdit;
  RQAllocationListItemFilterObj: RQAllocationListItemFilter;

implementation


uses
  ENDepartmentController, ENDepartmentTypeController, ShowENDepartment, ENConsts;

{$R *.dfm}



procedure TfrmRQAllocationListItemFilterEdit.FormCreate(Sender: TObject);
begin
  inherited;
  budgetRefCode := LOW_INT;
end;

procedure TfrmRQAllocationListItemFilterEdit.FormShow(Sender: TObject);
begin

  DisableControls([edtENBudgetName]);
  DenyBlankValues([edtMaterialName, edtENBudgetName]);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMaterialName
      ,edtMeasurementName
      ,edtCountGen
      ,edtCountFact
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    MakeMultiline(edtMaterialName.Lines, RQAllocationListItemObj.materialName);
    edtMeasurementName.Text := RQAllocationListItemObj.measurementName;

    if ( RQAllocationListItemObj.countGen <> nil ) then
       edtCountGen.Text := RQAllocationListItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    if ( RQAllocationListItemObj.countFact <> nil ) then
       edtCountFact.Text := RQAllocationListItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

    edtUserGen.Text := RQAllocationListItemObj.userGen;

      if RQAllocationListItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQAllocationListItemObj.dateEdit.Year,RQAllocationListItemObj.dateEdit.Month,RQAllocationListItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
  end;

}

end;



procedure TfrmRQAllocationListItemFilterEdit.spbENBudgetClearClick(
  Sender: TObject);
begin
  inherited;
  edtENBudgetName.Text := '';
  budgetRefCode := LOW_INT;
end;

procedure TfrmRQAllocationListItemFilterEdit.spbENBudgetClick(Sender: TObject);
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
        budgetRefCode := ENDepartmentShort(tvDep.Selected.Data).code;
        edtENBudgetName.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;
      except
        on EConvertError do Exit;
      end;
    end;
  end;
  finally
    frmENDepartmentShow.Free;
  end;
end;


procedure TfrmRQAllocationListItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQAllocationListItem: RQAllocationListItemControllerSoapPort;
begin
  if (ModalResult = mrOk) then

  if (edtMaterialName.Text = '') and (edtENBudgetName.Text ='') then
  begin
    Application.MessageBox(PChar('Нічого не вибрано!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end else

  begin
    {
     RQAllocationListItemFilterObj.materialName := edtMaterialName.Text;
     RQAllocationListItemFilterObj.measurementName := edtMeasurementName.Text;

     if (RQAllocationListItemFilterObj.countGen = nil ) then
       RQAllocationListItemFilterObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       RQAllocationListItemFilterObj.countGen.decimalString := edtCountGen.Text
     else
       RQAllocationListItemFilterObj.countGen := nil;

     if (RQAllocationListItemFilterObj.countFact = nil ) then
       RQAllocationListItemFilterObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       RQAllocationListItemFilterObj.countFact.decimalString := edtCountFact.Text
     else
       RQAllocationListItemFilterObj.countFact := nil;

     RQAllocationListItemFilterObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin
       if RQAllocationListItemFilterObj.dateEdit = nil then
          RQAllocationListItemFilterObj.dateEdit := TXSDate.Create;
       RQAllocationListItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQAllocationListItemFilterObj.dateEdit := nil;
  }
  end;
end;




end.