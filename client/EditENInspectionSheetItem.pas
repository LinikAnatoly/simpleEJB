
unit EditENInspectionSheetItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENInspectionSheetItemController, ENConsts;

type
    TfrmENInspectionSheetItemEdit = class(TDialogForm)

    lblCode : TLabel;
    edtCode : TEdit;
    lblDefectCode : TLabel;
    edtDefectCode: TEdit;
    lblDefectName : TLabel;
    lblCommentGen : TLabel;
    edtCommentGen: TMemo;
    lblIsDetecting : TLabel;

    HTTPRIOENInspectionSheetItem: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    edtDefectName: TMemo;
    cbIsDetecting: TComboBox;
    lblCountGen: TLabel;
    edtCountGen: TEdit;
    lblCountDefects: TLabel;
    lblCoefficientKi: TLabel;
    lblPointsPi: TLabel;
    lblWeightXi: TLabel;
    edtWeightXi: TEdit;
    edtPointsPi: TEdit;
    edtCoefficientKi: TEdit;
    edtCountDefects: TEdit;
    lblDefectLength: TLabel;
    edtDefectLength: TEdit;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbIsDetectingChange(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENInspectionSheetItemEdit: TfrmENInspectionSheetItemEdit;
  ENInspectionSheetItemObj: ENInspectionSheetItem;

implementation


{uses  
    EnergyproController, EnergyproController2, ENInspectionSheetItemController  ;
}
{$R *.dfm}



procedure TfrmENInspectionSheetItemEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode, edtCoefficientKi, edtPointsPi, edtWeightXi]);
  SetFloatStyle([edtCountGen, edtDefectLength]);
  SetIntStyle([edtCountDefects]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtDefectCode, edtDefectName, edtCommentGen, cbIsDetecting, edtCountGen, edtCountDefects]);
    DisableControls([edtDefectCode, edtDefectName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENInspectionSheetItemObj.code);
    edtDefectCode.Text := ENInspectionSheetItemObj.defectCode;
    MakeMultiline(edtDefectName.Lines, ENInspectionSheetItemObj.defectName);
    MakeMultiline(edtCommentGen.Lines, ENInspectionSheetItemObj.commentGen);

    SetTXSDecimalForTEdit(edtCountGen, ENInspectionSheetItemObj.countGen);
    SetTXSDecimalForTEdit(edtCountDefects, ENInspectionSheetItemObj.countDefects);
    SetTXSDecimalForTEdit(edtDefectLength, ENInspectionSheetItemObj.defectLength);
    SetTXSDecimalForTEdit(edtCoefficientKi, ENInspectionSheetItemObj.coefficientKi);
    SetTXSDecimalForTEdit(edtPointsPi, ENInspectionSheetItemObj.pointsPi);
    SetTXSDecimalForTEdit(edtWeightXi, ENInspectionSheetItemObj.weightXi);

    cbIsDetecting.ItemIndex := ENInspectionSheetItemObj.isDetecting;

    cbIsDetectingChange(Sender);
  end;
end;


procedure TfrmENInspectionSheetItemEdit.cbIsDetectingChange(Sender: TObject);
begin
  inherited;
  if (DialogState = dsEdit) then
  if cbIsDetecting.ItemIndex = NO then
  begin
    DisableControls([edtCountGen, edtCountDefects, edtDefectLength]);
    ClearControls([edtCountGen, edtCountDefects, edtDefectLength]);
  end
  else
  begin
    DisableControls([edtCountGen, edtCountDefects, edtDefectLength], False);
    DenyBlankValues([edtCountGen, edtCountDefects]);
  end;
end;


procedure TfrmENInspectionSheetItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENInspectionSheetItem: ENInspectionSheetItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtDefectCode, edtDefectName]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end else

  if (cbIsDetecting.ItemIndex = YES) and not NoBlankValues([edtCountDefects]) then
  begin
    Application.MessageBox(PChar('Вкажіть кількість дефектів!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end else

  if (cbIsDetecting.ItemIndex = YES) and (StrToFloat(edtCountDefects.Text) = 0) then
  begin
    Application.MessageBox(PChar('Вкажіть кількість дефектів!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end else

  begin
    TempENInspectionSheetItem := HTTPRIOENInspectionSheetItem as ENInspectionSheetItemControllerSoapPort;

    ENInspectionSheetItemObj.defectCode := edtDefectCode.Text;
    ENInspectionSheetItemObj.defectName := edtDefectName.Text;
    ENInspectionSheetItemObj.commentGen := edtCommentGen.Text;

    ENInspectionSheetItemObj.isDetecting := cbIsDetecting.ItemIndex;

    ENInspectionSheetItemObj.countGen := GetTXSDecimalFromTEdit(edtCountGen);
    ENInspectionSheetItemObj.countDefects := GetTXSDecimalFromTEdit(edtCountDefects);
    ENInspectionSheetItemObj.defectLength := GetTXSDecimalFromTEdit(edtDefectLength);
    ENInspectionSheetItemObj.coefficientKi := GetTXSDecimalFromTEdit(edtCoefficientKi);
    ENInspectionSheetItemObj.pointsPi := GetTXSDecimalFromTEdit(edtPointsPi);
    ENInspectionSheetItemObj.weightXi := GetTXSDecimalFromTEdit(edtWeightXi);


    if DialogState = dsInsert then
    begin
      ENInspectionSheetItemObj.code:=low(Integer);
      TempENInspectionSheetItem.add(ENInspectionSheetItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENInspectionSheetItem.save(ENInspectionSheetItemObj);
    end;
  end;
end;


end.