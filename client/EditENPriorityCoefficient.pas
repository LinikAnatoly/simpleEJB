unit EditENPriorityCoefficient;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENPriorityCoefficientController ;

type
    TfrmENPriorityCoefficientEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblValue6 : TLabel;
    edtValue6: TEdit;
    lblValue35 : TLabel;
    edtValue35: TEdit;
    lblValue150 : TLabel;
    edtValue150: TEdit;

    HTTPRIOENPriorityCoefficient: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblElementType: TLabel;
    edtElementType: TEdit;
    spbENElementType: TSpeedButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENElementTypeClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENPriorityCoefficientEdit: TfrmENPriorityCoefficientEdit;
  ENPriorityCoefficientObj: ENPriorityCoefficient;

implementation


uses ENElementTypeController
  , ShowENElementType
;

{$R *.dfm}


procedure TfrmENPriorityCoefficientEdit.FormShow(Sender: TObject);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
  priorityCoefficientShort: ENPriorityCoefficientShort;
begin
  DisableControls([edtCode, edtElementType]);
  SetFloatStyle([edtValue6, edtValue35, edtValue150]);

  if DialogState = dsView then
  begin
    DisableControls([spbENElementType]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtElementType]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    TempENPriorityCoefficient := HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;
    priorityCoefficientShort := TempENPriorityCoefficient.getShortObject(ENPriorityCoefficientObj.code);

    edtElementType.Text := priorityCoefficientShort.elementTypeRefName;
    edtCode.Text := IntToStr(ENPriorityCoefficientObj.code);
    SetTXSDecimalForTEdit(edtValue6, ENPriorityCoefficientObj.value6);
    SetTXSDecimalForTEdit(edtValue35, ENPriorityCoefficientObj.value35);
    SetTXSDecimalForTEdit(edtValue150, ENPriorityCoefficientObj.value150);
  end;
end;


procedure TfrmENPriorityCoefficientEdit.spbENElementTypeClick(Sender: TObject);
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
        ENPriorityCoefficientObj.elementTypeRef := ENElementTypeRef.Create;
        ENPriorityCoefficientObj.elementTypeRef.code := StrToInt(GetReturnValue(sgENElementType,0));
        edtElementType.Text := GetReturnValue(sgENElementType,1);
      except
         on EConvertError do Exit;
      end;
    end;
  finally
    frmENElementTypeShow.Free;
  end;
end;


procedure TfrmENPriorityCoefficientEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENPriorityCoefficient: ENPriorityCoefficientControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtElementType]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENPriorityCoefficient := HTTPRIOENPriorityCoefficient as ENPriorityCoefficientControllerSoapPort;

    ENPriorityCoefficientObj.value6 := GetTXSDecimalFromTEdit(edtValue6);
    ENPriorityCoefficientObj.value35 := GetTXSDecimalFromTEdit(edtValue35);
    ENPriorityCoefficientObj.value150 := GetTXSDecimalFromTEdit(edtValue150);

    if DialogState = dsInsert then
    begin
      ENPriorityCoefficientObj.code := Low(Integer);
      TempENPriorityCoefficient.add(ENPriorityCoefficientObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENPriorityCoefficient.save(ENPriorityCoefficientObj);
    end;
  end;
end;


end.