unit EditENHighVoltageSell;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons, EnergyproController,
  EnergyproController2, ENHighVoltageSellController,
  ENSafetyPrecautionsController;

type
  TfrmENHighVoltageSellEdit = class(TDialogForm)
    lblName : TLabel;
    edtName: TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblENHighVoltageSellTypeName: TLabel;
    edtENHighVoltageSellTypeName: TEdit;
    spbENHighVoltageSellType: TSpeedButton;
  

  HTTPRIOENHighVoltageSell: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblENFencing: TLabel;
    cbENFencing: TComboBox;
    gbLockType: TGroupBox;
    rbLockTypeExternal: TRadioButton;
    rbLockTypeInternal: TRadioButton;
    rbLockTypeAbsent: TRadioButton;
    memTkMaterialsLock: TMemo;
    spbTkMaterialsLock: TSpeedButton;
    lblTkMaterialsLock: TLabel;
    HTTPRIOENSafetyPrecautions: THTTPRIO;
    HTTPRIOLockTypeMaterial: THTTPRIO;
    HTTPRIOENTransformer: THTTPRIO;
    lblTransformer: TLabel;
    memTransformer: TMemo;
    spbTransformer: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENHighVoltageSellTypeClick(Sender : TObject);
    procedure cbENFencingChange(Sender: TObject);
    procedure rbLockTypeAbsentClick(Sender: TObject);
    procedure rbLockTypeInternalClick(Sender: TObject);
    procedure rbLockTypeExternalClick(Sender: TObject);
    procedure spbTransformerClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    st04Code: Integer;

end;

var frmENHighVoltageSellEdit: TfrmENHighVoltageSellEdit;
  ENHighVoltageSellObj: ENHighVoltageSell;
  ENSafetyPrecautionsHVCObj: ENSafetyPrecautions;
  codeSPrHVC: Integer; //Код Соблюдения Мер Техники Безопасности Высоковольтной Ячейки

implementation

uses ShowENHighVoltageSellType, ENHighVoltageSellTypeController, ShowENElement,
  ENElementController, TKMaterialsController, ENTransformerController,
  ShowENTransformer, Main;

{$R *.dfm}

procedure TfrmENHighVoltageSellEdit.FormShow(Sender: TObject);
var TempENSafetyPrecautions: ENSafetyPrecautionsControllerSoapPort;
  ENSafPrHVCObj: ENSafetyPrecautions;
  TempTKMaterials: TKMaterialsControllerSoapPort;
  lockTypeMatObj: TKMaterials;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  DisableControls([memTransformer]);
  if DialogState = dsView then
    DisableControls([edtENHighVoltageSellTypeName,spbENHighVoltageSellType,
      spbTransformer]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DisableControls([edtENHighVoltageSellTypeName]);
      DenyBlankValues([edtName, edtNumberGen, edtENHighVoltageSellTypeName,
        memTransformer]);
    end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtName.Text := ENHighVoltageSellObj.name;
      edtNumberGen.Text := ENHighVoltageSellObj.numberGen;
      edtENHighVoltageSellTypeName.Text := ENHighVoltageSellObj.highvoltageType.name;
      if codeSPrHVC > 0 then
        begin
          TempENSafetyPrecautions := HTTPRIOENSafetyPrecautions
            as ENSafetyPrecautionsControllerSoapPort;
          ENSafPrHVCObj := TempENSafetyPrecautions.getObject(codeSprHVC);
          try
            if ENSafPrHVCObj.fencing <> nil then
              if ENSafPrHVCObj.fencing.code <> Low(Integer) then
                cbENFencing.ItemIndex := ENSafPrHVCObj.fencing.code;
            if ENSafPrHVCObj.lockType <> nil then
              if ENSafPrHVCObj.lockType.code <> Low(Integer) then
                case ENSafPrHVCObj.lockType.code of
                  0: rbLockTypeAbsent.Checked := True;
                  1: rbLockTypeInternal.Checked := True;
                  2: rbLockTypeExternal.Checked := True;
                end;
            gbLockType.Enabled := (DialogState = dsEdit) and
              not (ENSafPrHVCObj.fencing.code = 0);
            if ENSafPrHVCObj.matLockRef <> nil then
              if ENSafPrHVCObj.matLockRef.code <> Low(Integer) then
                begin
                  TempTKMaterials := HTTPRIOLockTypeMaterial
                    as TKMaterialsControllerSoapPort;
                  lockTypeMatObj := TempTKMaterials.getObject(
                    ENSafPrHVCObj.matLockRef.code);
                  try
                    if lockTypeMatObj <> nil then
                      memTkMaterialsLock.Text := lockTypeMatObj.name;
                  finally
                    lockTypeMatObj.Free;
                    lockTypeMatObj := nil;
                  end;
                end;
          finally
            ENSafPrHVCObj.Free;
            ENSafPrHVCObj := nil;
          end;
        end;
        //Трансформатор, к которому относится Высоковольтная Ячейка
        if ENHighVoltageSellObj.transformerRef = nil then
          memTransformer.Clear
        else if ENHighVoltageSellObj.transformerRef.code = low(Integer) then
          memTransformer.Clear
        else
          begin
            TempENTransformer :=
              HTTPRIOENTransformer as ENTransformerControllerSoapPort;
            ENTransformerObj :=
              TempENTransformer.getObject(ENHighVoltageSellObj.transformerRef.code);
            try
              memTransformer.Text := ENTransformerObj.name + '. P = ' +
                ENTransformerObj.nominalPower.decimalString + ' кВА. ';
              if ENTransformerObj.transformerType <> nil then
                if ENTransformerObj.transformerType.code <> low(Integer) then
                  memTransformer.Text := memTransformer.Text +
                    ENTransformerObj.transformerType.name + '.';
              if ENTransformerObj.invNumber <> '' then
                memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                  ENTransformerObj.invNumber;
            finally
              ENTransformerObj.Free;
              ENTransformerObj := nil;
            end;
          end;
    end;

  if (DialogState = dsInsert) then
    begin
      edtName.Text := 'Високовольтна ланка';
      try
        if ENHighVoltageSellObj.highvoltageType = nil then
          ENHighVoltageSellObj.highvoltageType := ENHighVoltageSellType.Create();
        ENHighVoltageSellObj.highvoltageType.code := 500000000;
        edtENHighVoltageSellTypeName.Text := 'Не визначений';
      except
        on EConvertError do Exit;
      end;
      edtNumberGen.SetFocus;
    end;
end;



procedure TfrmENHighVoltageSellEdit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then

    if not NoBlankValues([edtName, edtNumberGen, memTransformer]) then
      begin
        Application.MessageBox(PChar('Пусті поля недопустимі!'),
          PChar('Увага!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
  else
    begin
      TempENHighVoltageSell :=
        HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;

      if ENHighVoltageSellObj.highvoltageType <> nil then
        begin
          if ENHighVoltageSellObj.highvoltageType.code = low(Integer) then
            begin
              Application.MessageBox(PChar('Оберіть тип високовольтної ланки!'),
                PChar('Увага!'),MB_ICONWARNING+MB_OK);
              if edtENHighVoltageSellTypeName.CanFocus then
                edtENHighVoltageSellTypeName.SetFocus;
              Action := caNone;
              Abort;
            end;
        end
      else
        begin
          Application.MessageBox(PChar('Оберіть тип високовольтної ланки!'),
            PChar('Увага!'),MB_ICONWARNING+MB_OK);
          if edtENHighVoltageSellTypeName.CanFocus then
            edtENHighVoltageSellTypeName.SetFocus;
          Action := caNone;
          Abort;
        end;

      ENHighVoltageSellObj.name := edtName.Text;
      ENHighVoltageSellObj.numberGen := edtNumberGen.Text;

      if DialogState = dsInsert then
        begin
          ENHighVoltageSellObj.code := low(Integer);
          TempENHighVoltageSell.add(ENHighVoltageSellObj);
        end
      else if DialogState = dsEdit then
        TempENHighVoltageSell.save(ENHighVoltageSellObj);
    end;
end;


procedure TfrmENHighVoltageSellEdit.spbENHighVoltageSellTypeClick(Sender : TObject);
var 
   frmENHighVoltageSellTypeShow: TfrmENHighVoltageSellTypeShow;
begin
   frmENHighVoltageSellTypeShow :=
     TfrmENHighVoltageSellTypeShow.Create(Application, fmNormal);
   try
      with frmENHighVoltageSellTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHighVoltageSellObj.highvoltageType = nil then
                 ENHighVoltageSellObj.highvoltageType := ENHighVoltageSellType.Create();
               ENHighVoltageSellObj.highvoltageType.code := StrToInt(GetReturnValue(sgENHighVoltageSellType, 0));
               edtENHighVoltageSellTypeName.Text :=
                 GetReturnValue(sgENHighVoltageSellType, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENHighVoltageSellTypeShow.Free;
   end;
end;

procedure TfrmENHighVoltageSellEdit.cbENFencingChange(Sender: TObject);
begin
  if TComboBox(Sender).ItemIndex = 0 then
    begin
      gbLockType.Enabled := False;
      rbLockTypeAbsent.Checked := True;
      memTkMaterialsLock.Text := '';
    end
  else
    begin
      gbLockType.Enabled := True;
    end;
end;

procedure TfrmENHighVoltageSellEdit.rbLockTypeAbsentClick(Sender: TObject);
begin
  memTkMaterialsLock.Text := '';
end;

procedure TfrmENHighVoltageSellEdit.rbLockTypeInternalClick(
  Sender: TObject);
var TempTKMaterials: TKMaterialsControllerSoapPort;
  lockTypeMatObj: TKMaterials;
begin
  TempTKMaterials := HTTPRIOLockTypeMaterial as TKMaterialsControllerSoapPort;
  lockTypeMatObj := TempTKMaterials.getObject(500017912);
  try
    if lockTypeMatObj <> nil then
      memTkMaterialsLock.Text := lockTypeMatObj.name;
  finally
    lockTypeMatObj.Free;
    lockTypeMatObj := nil;
  end;

end;

procedure TfrmENHighVoltageSellEdit.rbLockTypeExternalClick(
  Sender: TObject);
var TempTKMaterials: TKMaterialsControllerSoapPort;
  lockTypeMatObj: TKMaterials;
begin
  TempTKMaterials := HTTPRIOLockTypeMaterial as TKMaterialsControllerSoapPort;
  lockTypeMatObj := TempTKMaterials.getObject(75000735);
  try
    if lockTypeMatObj <> nil then
      memTkMaterialsLock.Text := lockTypeMatObj.name;
  finally
    lockTypeMatObj.Free;
    lockTypeMatObj := nil;
  end;
end;

procedure TfrmENHighVoltageSellEdit.spbTransformerClick(Sender: TObject);
var ENTransformerFilterObj: ENTransformerFilter;
begin
  ENTransformerFilterObj := ENTransformerFilter.Create;
  SetNullIntProps(ENTransformerFilterObj);
  SetNullXSProps(ENTransformerFilterObj);
  ENTransformerFilterObj.conditionSQL :=
    'SUBSTATION04REFCODE = ' + IntToStr(st04Code);
  frmENTransformerShow := TfrmENTransformerShow.Create(
    Application, fmFiltered, ENTransformerFilterObj);
  try
    with frmENTransformerShow do
      begin
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        ShowModal;
        if ModalResult = mrOk then
          begin
            if ENHighVoltageSellObj.transformerRef = nil then
              ENHighVoltageSellObj.transformerRef := ENTransformerRef.Create;
            ENHighVoltageSellObj.transformerRef.code :=
              ShowENTransformer.transformerCode;
            memTransformer.Text :=
              sgENTransformer.Cells[1, sgENTransformer.Row] + '. P = ' +
              sgENTransformer.Cells[2, sgENTransformer.Row] + ' кВА. ' +
              sgENTransformer.Cells[3, sgENTransformer.Row] + '.';
            if sgENTransformer.Cells[4, sgENTransformer.Row] <> '' then
              memTransformer.Text := memTransformer.Text + ' Інв. № ' +
                sgENTransformer.Cells[4, sgENTransformer.Row];
          end;
      end;
  finally
    frmENTransformerShow.Free;
  end;
end;

end.
