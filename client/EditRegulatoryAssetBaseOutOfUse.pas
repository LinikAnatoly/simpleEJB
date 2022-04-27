unit EditRegulatoryAssetBaseOutOfUse;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, RegulatoryAssetBaseCalculationController ;

type
  TfrmRegulatoryAssetBaseOutOfUseEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinish : TLabel;
    edtDateFinish: TDateTimePicker;
    HTTPRIORegulatoryAssetBaseCalculation: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegulatoryAssetBaseOutOfUseEdit: TfrmRegulatoryAssetBaseOutOfUseEdit;
  RegulatoryAssetBaseOutOfUseObj: RegulatoryAssetBaseOutOfUse;

implementation



{$R *.dfm}

procedure TfrmRegulatoryAssetBaseOutOfUseEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtDateStart
      ,edtDateFinish
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RegulatoryAssetBaseOutOfUseObj.code);
    SetDateFieldForDateTimePicker(edtDateStart, RegulatoryAssetBaseOutOfUseObj.dateStart);
    SetDateFieldForDateTimePicker(edtDateFinish, RegulatoryAssetBaseOutOfUseObj.dateFinish);

  end;
end;



procedure TfrmRegulatoryAssetBaseOutOfUseEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRegulatoryAssetBaseOutOfUse: RegulatoryAssetBaseCalculationControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempRegulatoryAssetBaseOutOfUse := HTTPRIORegulatoryAssetBaseCalculation as RegulatoryAssetBaseCalculationControllerSoapPort;

    edtDateStart.Checked := True;
    RegulatoryAssetBaseOutOfUseObj.dateStart := GetTXSDateFromTDateTimePicker(edtDateStart);
    RegulatoryAssetBaseOutOfUseObj.dateFinish := GetTXSDateFromTDateTimePicker(edtDateFinish);

    if DialogState = dsInsert then
    begin
      RegulatoryAssetBaseOutOfUseObj.code := Low(Integer);
      TempRegulatoryAssetBaseOutOfUse.addOutOfUse(RegulatoryAssetBaseOutOfUseObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRegulatoryAssetBaseOutOfUse.saveOutOfUse(RegulatoryAssetBaseOutOfUseObj);
    end;
  end;
end;


end.