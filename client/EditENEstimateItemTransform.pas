unit EditENEstimateItemTransform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ENEstimateItemController, EditENEstimateItem, TKMaterialsController,
  ShowTKMaterials, ChildFormUnit, XSBuiltIns;

type
  TfrmENEstimateItemTransformEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    edtMaterialName: TEdit;
    spbMaterialName: TSpeedButton;
    edtCountFact: TEdit;
    lblCountFact: TLabel;
    lblMeasurement: TLabel;
    HTTPRIOENEstimateItem: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbMaterialNameClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    eiCode : Integer;
  end;

var
  frmENEstimateItemTransformEdit: TfrmENEstimateItemTransformEdit;
  newEstimate : ENEstimateItem;

implementation

uses ENConsts;


{$R *.dfm}

procedure TfrmENEstimateItemTransformEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENEstimateItem: ENEstimateItemControllerSoapPort;

begin

   if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMaterialName
      ,edtCountFact
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
      TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
      if newEstimate = nil then
      newEstimate := ENEstimateItem.Create;

      if (newEstimate.countFact = nil ) then
       newEstimate.countFact := TXSDecimal.Create;
      newEstimate.countFact.DecimalString := edtCountFact.Text;

      if eiCode = LOW_INT then
      Exit;


      if newEstimate.materialRef.code = LOW_INT then
        begin
          Application.MessageBox(PChar('Оберіть матеріал на який потрібно змінити!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
        end;


      TempENEstimateItem.transformEstimate(eiCode, newEstimate);

  end;

end;

procedure TfrmENEstimateItemTransformEdit.spbMaterialNameClick(Sender: TObject);
var frmSpr_matherialShow: TfrmTKMaterialsShow;
mtFilter : TKMaterialsFilter;

begin
  if DialogState = dsView then Exit;

    frmSpr_matherialShow := TfrmTKMaterialsShow.Create(Application, fmNormal);//, mtFilter);

  try
    with frmSpr_matherialShow do
    begin
      // NET-73 Закрываем любое редактирование материалов (оставляем только просмотр)
      // (для редактирования есть отдельный клиент!)
      DisableActions([actInsert, actEdit, actDelete]);

      DenyGroupSelection := true;

      if ShowModal = mrOk then
      begin
        try
            begin
              if newEstimate = nil then
              newEstimate := ENEstimateItem.Create;
              if newEstimate.materialRef = nil then newEstimate.materialRef := TKMaterialsRef.Create;
              newEstimate.materialRef.code := TKMaterialsShort(tvDep.Selected.Data).code; //StrToInt(GetReturnValue(sgSpr_matherial, 0));
              edtMaterialName.Text := TKMaterialsShort(tvDep.Selected.Data).name ; //GetReturnValue(sgSpr_matherial, 1);
              lblMeasurement.Caption := 'од.виміру : '+ TKMaterialsShort(tvDep.Selected.Data).measurementName ;//GetReturnValue(sgSpr_matherial, 2);

            end
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmSpr_matherialShow.Free;
  end;
end;

end.
