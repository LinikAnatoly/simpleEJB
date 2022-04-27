unit EditFINMaterialCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, AdvEdit, DBAdvEd,ENConsts, InvokeRegistry,
  Rio, SOAPHTTPClient;

type
  TfrmFINMaterialCountEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    edtCount: TAdvEdit;
    lblWarning: TLabel;
    lblMaterialName: TLabel;
    lblMaterialCount: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblPlanItemName: TLabel;
    lblTKMaterialName: TLabel;
    Label5: TLabel;
    lblPrice: TLabel;
    edtExtraCargo: TAdvEdit;
    HTTPRIOTKMaterials: THTTPRIO;
    lblTKMeasurementName: TLabel;
    procedure edtCountValueValidate(Sender: TObject; value: String;
      var IsValid: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    planItemName: String;
    tkMaterialName: String;
    materialName: String;
    nn: String;
    measurementName: String;
    tkMeasurementName: String;
    availableCount: Double;
    currentCount: Double;
    enteredCount: Double;
    boundedCount: Double;
    axFactor: Double;
    kindCode: Integer;
  end;

var
  frmFINMaterialCountEdit: TfrmFINMaterialCountEdit;

implementation

uses TKMaterialsController, XSBuiltIns, DMReportsUnit;

{$R *.dfm}

procedure TfrmFINMaterialCountEdit.edtCountValueValidate(Sender: TObject;
  value: String; var IsValid: Boolean);
var valueCount: Double;
begin
  try
    valueCount := StrToFloat(value);
  except
    on EConvertError do Exit;
  end;

  //if valueCount > availableCount then
  if (valueCount - availableCount) > 0.00000001 then
  begin
    IsValid := false;
    lblWarning.Caption := 'Кількість матеріалу не повинна перевищувати ' + FloatToStr(availableCount) + ' одиниць!';
    edtCount.Font.Color := clBlack;
    //edtCount.SetFocus;
    //ShowMessage('Too much!!!');
  end
  else begin
    IsValid := true;
    lblWarning.Caption := '';
  end;
end;

procedure TfrmFINMaterialCountEdit.FormCreate(Sender: TObject);
begin
  planItemName := '';
  materialName := '';
  tkMaterialName := '';
  nn := '';
  measurementName := '';
  tkMeasurementName := '';
  // availableCount := 0;
  // currentCount := 0;
  enteredCount := 0;
  axFactor := 0;

  lblWarning.Caption := '';
end;

procedure TfrmFINMaterialCountEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult = mrCancel then Exit;

  enteredCount := 0;

  if edtCount.Text = '' then Exit;

  try
    enteredCount := StrToFloat(edtCount.Text);
  except
    on EConvertError do Exit;
  end;

  if enteredCount > availableCount then
  begin
    Application.MessageBox(PChar('Кількість матеріалу не повинна перевищувати ' + FloatToStr(availableCount) + ' одиниць!'),
                           PChar('Увага!'),
                           MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    //edtCount.SetFocus;
    edtCount.Font.Color := clBlack;
    Exit;
  end;

  if enteredCount = 0 then
  begin
    Application.MessageBox(PChar('Нульова кількість не резервується'),
                           PChar('Увага!'),
                           MB_ICONWARNING + MB_OK);
    ModalResult := mrNone;
    //edtCount.SetFocus;
    edtCount.Font.Color := clBlack;
    Exit;
  end;

  if axFactor > 0 then
  begin
    enteredCount := Conv(enteredCount * axFactor, 6);
  end;
end;

procedure TfrmFINMaterialCountEdit.FormShow(Sender: TObject);
var
  TempTKMaterials: TKMaterialsControllerSoapPort;
  factor: TXSDecimal;
  //convertedCount: Double;
begin
  {
  currentCount := currentCount - boundedCount;

  if (kindCode = ENPLANWORKSTATE_BUFET_REALIZATION) or (kindCode = RQFKORDER_KIND_SALE_PRODUCTS) then
  begin
    HideControls([lblPrice, edtExtraCargo],false);
    if (kindCode = RQFKORDER_KIND_SALE_PRODUCTS) then
    begin
      lblPrice.Caption := 'Відпускна ціна';
      edtCount.Text := FloatToStr(availableCount);
    end;
    btnOk.SetFocus;
  end
  else begin
     HideControls([lblPrice, edtExtraCargo], true);
     if (availableCount < currentCount) then
       edtCount.Text := FloatToStr(availableCount)
     else
       edtCount.Text := FloatToStr(currentCount);
     edtCount.SetFocus;
  end;

  DenyBlankValues([edtCount, edtExtraCargo]);

  //??? availableCount := availableCount + currentCount;
  }

  lblTKMaterialName.Caption  := tkMaterialName;
  lblMaterialName.Caption  := materialName;
  lblMaterialCount.Caption := FloatToStr(availableCount) + ' ' + measurementName;
  lblPlanItemName.Caption  := planItemName;

  // В случае, если отличаются ед. измерения норм. материала и материала в остатке,
  // ищем коэффициент пересчета ед. измерения в AX
  if (measurementName <> tkMeasurementName) and (tkMeasurementName <> '') then
  begin
    //*** ПРОБУЕМ И ДЛЯ ФК!!!
    // Только, если мы уже на AX
    //if DMReports.UsesMDAXData(CONFIG_USES_MDAX_INVENTORYONHAND) then
    begin
      TempTKMaterials := HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;

      factor := TempTKMaterials.getAXFactor(nn, tkMeasurementName);

      if factor <> nil then
      begin
        try
          axFactor := StrToFloat(factor.DecimalString);
        except on EConvertError do
          //raise Exception.Create('Error Message');
          Exit;
        end;

        //convertedCount := Conv(availableCount / axFactor, 6);
        availableCount := Conv(availableCount / axFactor, 6);

        lblMaterialCount.Caption := lblMaterialCount.Caption + ' (' + FloatToStr(availableCount) + ' ' + tkMeasurementName + ')';
        lblTKMeasurementName.Caption := tkMeasurementName;
        lblTKMeasurementName.Visible := true;

        //ShowMessage('FACTOR: ' + factor.DecimalString);
      end;
    end;
  end;

  currentCount := currentCount - boundedCount;

  if (kindCode = ENPLANWORKSTATE_BUFET_REALIZATION) or (kindCode = RQFKORDER_KIND_SALE_PRODUCTS) then
  begin
    HideControls([lblPrice, edtExtraCargo],false);
    if (kindCode = RQFKORDER_KIND_SALE_PRODUCTS) then
    begin
      lblPrice.Caption := 'Відпускна ціна';
      edtCount.Text := FloatToStr(availableCount);
    end;
    btnOk.SetFocus;
  end
  else begin
     HideControls([lblPrice, edtExtraCargo], true);
     if (availableCount < currentCount) then
       edtCount.Text := FloatToStr(availableCount)
     else
       edtCount.Text := FloatToStr(currentCount);
     edtCount.SetFocus;
  end;

  DenyBlankValues([edtCount, edtExtraCargo]);

  //??? availableCount := availableCount + currentCount;
end;

end.
