
unit EditENSheets4SOFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENSheets4SOController ;

type
  TfrmENSheets4SOFilterEdit = class(TDialogForm)
    lblName: TLabel;
    lblDateGen: TLabel;
    lblDayscnt: TLabel;
    lblCommentgen: TLabel;
    lblCode: TLabel;
    btnENSheet4SOType: TSpeedButton;
    Label2: TLabel;
    spbSOValuesTypeClear: TSpeedButton;
    lblNumbergen: TLabel;
    dtpDateGenFrom: TDateTimePicker;
    edtDayscnt: TEdit;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    edtCommentgen: TMemo;
    edtENSheet4SOTypeName: TEdit;
    edtNumbergen: TEdit;
    HTTPRIOENSheets4SOType: THTTPRIO;
    GroupBox1: TGroupBox;
    lblRecipient: TLabel;
    lblSignerPosition: TLabel;
    lblSignerFio: TLabel;
    lblExecutorFio: TLabel;
    lblExecutorPhone: TLabel;
    lblExecutorEmail: TLabel;
    lblAdditionalText: TLabel;
    lblRecipientAddress: TLabel;
    edtRecipient: TEdit;
    edtSignerPosition: TEdit;
    edtSignerFio: TEdit;
    edtExecutorFio: TEdit;
    edtExecutorPhone: TEdit;
    edtExecutorEmail: TEdit;
    edtAdditionalText: TMemo;
    edtRecipientAddress: TEdit;
    dtpDateGenTo: TDateTimePicker;
    Label1: TLabel;
    Label3: TLabel;
    edtName: TEdit;
    lblNextSheetDate: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dtpNextSheetDateFrom: TDateTimePicker;
    dtpNextSheetDateTo: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENSheet4SOTypeClick(Sender: TObject);
    procedure spbSOValuesTypeClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENSheets4SOFilterEdit: TfrmENSheets4SOFilterEdit;
  ENSheets4SOFilterObj: ENSheets4SOFilter;

implementation

uses ShowENSheets4SOType, ENSheets4SOTypeController, ENConsts;

{$R *.dfm}

procedure TfrmENSheets4SOFilterEdit.FormShow(Sender: TObject);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj: ENSheets4SOType;
begin
  DisableControls([edtENSheet4SOTypeName]);
  SetIntStyle([edtCode, edtDayscnt]);

  TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj := TempENSheets4SOType.getObject(ENSHEETS4SOTYPE_LAND_SHEET);
  if ENSheets4SOTypeObj <> nil then
  begin
    ENSheets4SOFilterObj.sheet4sotype := ENSheets4SOTypeRef.Create;
    ENSheets4SOFilterObj.sheet4sotype.code := ENSHEETS4SOTYPE_LAND_SHEET;
    edtENSheet4SOTypeName.Text := ENSheets4SOTypeObj.name;
  end;
end;

procedure TfrmENSheets4SOFilterEdit.spbSOValuesTypeClearClick(Sender: TObject);
begin
  ENSheets4SOFilterObj.sheet4sotype := nil;
  edtENSheet4SOTypeName.Text := '';
end;

procedure TfrmENSheets4SOFilterEdit.btnENSheet4SOTypeClick(Sender: TObject);
var
  frmENSheets4SOTypeShow: TfrmENSheets4SOTypeShow;
begin
  frmENSheets4SOTypeShow := TfrmENSheets4SOTypeShow.Create(Application, fmNormal);
  try
    with frmENSheets4SOTypeShow do
      begin
        if ShowModal = mrOk then
        begin
          try
            edtENSheet4SOTypeName.Text := GetReturnValue(sgENSheets4SOType, 1);
            ENSheets4SOFilterObj.sheet4sotype := ENSheets4SOTypeRef.Create;
            ENSheets4SOFilterObj.sheet4sotype.code := StrToInt(GetReturnValue(sgENSheets4SOType, 0));
          except
            on EConvertError do Exit;
          end;
        end;
      end;
  finally
    frmENSheets4SOTypeShow.Free;
  end;
end;

procedure TfrmENSheets4SOFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  condition: String;
begin
  if (ModalResult = mrOk)  then
  begin
    condition := ENSheets4SOFilterObj.conditionSQL;

    ENSheets4SOFilterObj.numbergen:= edtNumbergen.Text;
    ENSheets4SOFilterObj.name := edtName.Text;

    if dtpDateGenFrom.Checked then
      AddCondition(condition, ' ensheets4so.dategen >= to_date(''' + DateToStr(dtpDateGenFrom.Date) + ''', ''dd.MM.yyyy'')');

    if dtpDateGenTo.Checked then
      AddCondition(condition, ' ensheets4so.dategen <= to_date(''' + DateToStr(dtpDateGenTo.Date) + ''', ''dd.MM.yyyy'')');

    if dtpNextSheetDateFrom.Checked then
      AddCondition(condition, ' ensheets4so.nextsheetdate >= to_date(''' + DateToStr(dtpNextSheetDateFrom.Date) + ''', ''dd.MM.yyyy'')');

    if dtpNextSheetDateTo.Checked then
      AddCondition(condition, ' ensheets4so.nextsheetdate <= to_date(''' + DateToStr(dtpNextSheetDateTo.Date) + ''', ''dd.MM.yyyy'')');

    if (edtCode.Text <> '') then
      try
        ENSheets4SOFilterObj.code := StrToInt(edtCode.Text)
      except on EConvertError do
      end;

    ENSheets4SOFilterObj.dayscnt := LOW_INT;
    if (edtDayscnt.Text <> '') then
      try
        ENSheets4SOFilterObj.dayscnt := StrToInt(edtDayscnt.Text)
      except on EConvertError do
      end;

    ENSheets4SOFilterObj.recipient := edtRecipient.Text;
    ENSheets4SOFilterObj.recipientAddress := edtRecipientAddress.Text;
    ENSheets4SOFilterObj.signerPosition := edtSignerPosition.Text;
    ENSheets4SOFilterObj.signerFio := edtSignerFio.Text;
    ENSheets4SOFilterObj.executorFio := edtExecutorFio.Text;
    ENSheets4SOFilterObj.executorPhone := edtExecutorPhone.Text;
    ENSheets4SOFilterObj.executorEmail := edtExecutorEmail.Text;
    ENSheets4SOFilterObj.additionalText := edtAdditionalText.Text;
    ENSheets4SOFilterObj.commentgen := edtCommentgen.Text;

    ENSheets4SOFilterObj.conditionSQL := condition;
  end;
end;




end.