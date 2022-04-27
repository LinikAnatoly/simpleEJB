unit EditENFiderGuage;

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENFiderGuageController ;

type
  TfrmENFiderGuageEdit = class(TDialogForm)
    lblCode: TLabel;
	  edtCode: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblDateGuage: TLabel;
    dtpDateGuage: TDateTimePicker;
    lblEPWorkerName: TLabel;
    edtEPWorkerName: TEdit;
    spbEPWorker: TSpeedButton;
    dtpTimeGuage: TDateTimePicker;
    HTTPRIOENFiderGuage: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    spbBranch: TSpeedButton;
    lblTransformer: TLabel;
    spbTransformer: TSpeedButton;
    HTTPRIOENBranch: THTTPRIO;
    memBranch: TMemo;
    memTransformer: TMemo;
    GroupBox1: TGroupBox;
    lblPhaseYellow: TLabel;
    lbPhaseGreen: TLabel;
    lblPhaseRed: TLabel;
    gbCurrent: TGroupBox;
    edtCurrentPhaseYellow: TEdit;
    edtCurrentPhaseGreen: TEdit;
    edtCurrentPhaseRed: TEdit;
    gbTension: TGroupBox;
    edtTensionPhaseYellow: TEdit;
    edtTensionPhaseGreen: TEdit;
    edtTensionPhaseRed: TEdit;
    gbGuageArea: TGroupBox;
    rbGeneralSwitchingDevice: TRadioButton;
    rbBranch: TRadioButton;
    Label1: TLabel;
    lblPanel: TLabel;
    edtPanel: TEdit;
    HTTPRIOENPanel: THTTPRIO;
    HTTPRIOENTransformer: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPWorkerClick(Sender: TObject);
    procedure spbBranchClick(Sender: TObject);
    procedure spbTransformerClick(Sender: TObject);
    procedure rbGeneralSwitchingDeviceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbGeneralSwitchingDeviceMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure rbBranchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbBranchMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    codeElemS04: Integer; 
end;

var frmENFiderGuageEdit: TfrmENFiderGuageEdit;
  ENFiderGuageObj: ENFiderGuage;

implementation

uses ShowEPWorker, ENBranchController, ENPanelController, Main,
  ENTransformerController, ShowENBranch, ShowENTransformer;

{$R *.dfm}

procedure TfrmENFiderGuageEdit.FormShow(Sender: TObject);
var TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelObj: ENPanel;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  SetFloatStyle([
    edtCurrentPhaseYellow, edtCurrentPhaseGreen, edtCurrentPhaseRed,
    edtTensionPhaseYellow, edtTensionPhaseGreen, edtTensionPhaseRed]);
  DisableControls([edtEPWorkerName, edtPanel, memTransformer, memBranch,
    edtPanel]);
  if DialogState = dsView then
    DisableControls([spbEPWorker, spbTransformer, spbBranch,
      rbGeneralSwitchingDevice, rbBranch]);
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    begin
      DenyBlankValues([{edtName,} edtEPWorkerName,
        edtCurrentPhaseYellow, edtCurrentPhaseGreen, edtCurrentPhaseRed,
        edtTensionPhaseYellow, edtTensionPhaseGreen, edtTensionPhaseRed]);
    end;
  if  (DialogState = dsEdit) or (DialogState = dsView) then
    begin
      edtCode.Text := IntToStr(ENFiderGuageObj.code);
      if ENFiderGuageObj.name = '' then
        edtName.Text := 'Контрольный замер'
      else
        edtName.Text := ENFiderGuageObj.name;
      if ENFiderGuageObj.currentPhaseYellow <> nil then
        edtCurrentPhaseYellow.Text :=
          ENFiderGuageObj.currentPhaseYellow.decimalString
      else
        edtCurrentPhaseYellow.Text := '';
      if ENFiderGuageObj.currentPhaseGreen <> nil then
        edtCurrentPhaseGreen.Text :=
          ENFiderGuageObj.currentPhaseGreen.decimalString
      else
        edtCurrentPhaseGreen.Text := '';
      if ENFiderGuageObj.currentPhaseRed <> nil then
        edtCurrentPhaseRed.Text :=
          ENFiderGuageObj.currentPhaseRed.decimalString
      else
        edtCurrentPhaseRed.Text := '';
      if ENFiderGuageObj.tensionPhaseYellow <> nil then
        edtTensionPhaseYellow.Text :=
          ENFiderGuageObj.tensionPhaseYellow.decimalString
      else
        edtTensionPhaseYellow.Text := '';
      if ENFiderGuageObj.tensionPhaseGreen <> nil then
        edtTensionPhaseGreen.Text :=
          ENFiderGuageObj.tensionPhaseGreen.decimalString
      else
        edtTensionPhaseGreen.Text := '';
      if ENFiderGuageObj.tensionPhaseRed <> nil then
        edtTensionPhaseRed.Text :=
          ENFiderGuageObj.tensionPhaseRed.decimalString
      else
        edtTensionPhaseRed.Text := '';
      if ENFiderGuageObj.dateGuage <> nil then
        begin
          dtpDateGuage.DateTime:= EncodeDate(
            ENFiderGuageObj.dateGuage.Year,
            ENFiderGuageObj.dateGuage.Month,
            ENFiderGuageObj.dateGuage.Day);
          dtpDateGuage.Checked := True;
          dtpTimeGuage.DateTime := EncodeTime(
            ENFiderGuageObj.dateGuage.Hour,
            ENFiderGuageObj.dateGuage.Minute,
            ENFiderGuageObj.dateGuage.Second,
            ENFiderGuageObj.dateGuage.Millisecond);
          dtpTimeGuage.Checked := True;
        end
      else
        begin
          dtpDateGuage.DateTime := SysUtils.Date;
          dtpDateGuage.Checked := False;
          dtpTimeGuage.DateTime := SysUtils.Time;
          dtpTimeGuage.Checked := False;
        end;
      if ENFiderGuageObj.isGenSwitchDev = Low(Integer) then
        rbGeneralSwitchingDevice.Checked := False
      else
        rbGeneralSwitchingDevice.Checked :=
          (ENFiderGuageObj.isGenSwitchDev = 1);
      memBranch.Clear;
      memTransformer.Clear;
      edtPanel.Clear;
      if ENFiderGuageObj.branchRef <> nil then
        if ENFiderGuageObj.branchRef.code <> low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchObj :=
              TempENBranch.getObject(ENFiderGuageObj.branchRef.code);
            try
              memBranch.Text := ENBranchObj.numberGen + '. ' + ENBranchObj.name;
              if ENBranchObj.panel <> nil then
                if ENBranchObj.panel.code <> low(Integer) then
                  begin
                    TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                    ENPanelObj := TempENPanel.getObject(ENBranchObj.panel.code);
                    try
                      edtPanel.Text := ENPanelObj.name;
                      (*if ENPanelObj.transformer <> nil then
                        if ENPanelObj.transformer.code <> low(Integer) then
                          begin
                            TempENTransformer := HTTPRIOENTransformer as
                              ENTransformerControllerSoapPort;
                            ENTransformerObj := TempENTransformer.getObject(
                              ENPanelObj.transformer.code);
                            try
                              memTransformer.Text :=
                                ENTransformerObj.name + '. P = '
                                + ENTransformerObj.nominalPower.decimalString
                                + ' кВА. ';
                              if ENTransformerObj.transformerType <> nil then
                                if ENTransformerObj.transformerType.code <>
                                  low(Integer)
                                then
                                  memTransformer.Text := memTransformer.Text +
                                    ENTransformerObj.transformerType.name + '.';
                              if ENTransformerObj.invNumber <> '' then
                                memTransformer.Text := memTransformer.Text
                                  + ' Інв. № ' + ENTransformerObj.invNumber;
                            finally
                              ENTransformerObj.Free;
                              ENTransformerObj := nil;
                            end;
                          end;*)
                    finally
                      ENPanelObj.Free;
                      ENPanelObj := nil;
                    end;
                  end;
            finally
              ENBranchObj.Free;
              ENBranchObj := nil;
            end;
          end;
      if ENFiderGuageObj.transformer <> nil then
        if ENFiderGuageObj.transformer.code <> low(Integer) then
          begin
            TempENTransformer := HTTPRIOENTransformer as
              ENTransformerControllerSoapPort;
            ENTransformerObj := TempENTransformer.getObject(
              ENFiderGuageObj.transformer.code);
            try
              memTransformer.Text :=
                ENTransformerObj.name + '. P = '
                + ENTransformerObj.nominalPower.decimalString
                + ' кВА. ';
              if ENTransformerObj.transformerType <> nil then
                if ENTransformerObj.transformerType.code <>
                  low(Integer)
                then
                  memTransformer.Text := memTransformer.Text +
                    ENTransformerObj.transformerType.name + '.';
              if ENTransformerObj.invNumber <> '' then
                memTransformer.Text := memTransformer.Text
                  + ' Інв. № ' + ENTransformerObj.invNumber;
            finally
              ENTransformerObj.Free;
              ENTransformerObj := nil;
            end;
          end;
      edtEPWorkerName.Text := ENFiderGuageObj.worker.name;
    end;
  spbTransformer.Enabled := rbGeneralSwitchingDevice.Checked;
  spbBranch.Enabled := rbBranch.Checked;
end;

procedure TfrmENFiderGuageEdit.FormClose(
  Sender: TObject;  var Action: TCloseAction);
var TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if (not NoBlankValues([edtEPWorkerName,
      edtCurrentPhaseYellow, edtCurrentPhaseGreen, edtCurrentPhaseRed]))
      {, edtName, edtTensionPhaseYellow, edtTensionPhaseGreen,
      edtTensionPhaseRed}
    or ((rbGeneralSwitchingDevice.Checked)
      and not NoBlankValues([memTransformer]))
    or ((rbBranch.Checked) and not NoBlankValues([memBranch])) then
      begin
        Application.MessageBox(PChar('Пустые поля недопустимы!'),
          PChar('Внимание !'), MB_ICONWARNING + MB_OK);
        Action := caNone;
      end
    else
      begin
        TempENFiderGuage :=
          HTTPRIOENFiderGuage as ENFiderGuageControllerSoapPort;

        if rbGeneralSwitchingDevice.Checked then
          ENFiderGuageObj.isGenSwitchDev := 1
        else //if rbBranch.Checked then
          ENFiderGuageObj.isGenSwitchDev := 0;

        ENFiderGuageObj.name := edtName.Text;

        if ENFiderGuageObj.currentPhaseYellow = nil then
          ENFiderGuageObj.currentPhaseYellow := TXSDecimal.Create;
        if edtCurrentPhaseYellow.Text <> '' then
          ENFiderGuageObj.currentPhaseYellow.decimalString :=
            edtCurrentPhaseYellow.Text
        else
           ENFiderGuageObj.currentPhaseYellow := nil;

        if ENFiderGuageObj.currentPhaseGreen = nil then
          ENFiderGuageObj.currentPhaseGreen := TXSDecimal.Create;
        if edtCurrentPhaseGreen.Text <> '' then
          ENFiderGuageObj.currentPhaseGreen.decimalString :=
            edtCurrentPhaseGreen.Text
        else
          ENFiderGuageObj.currentPhaseGreen := nil;

        if ENFiderGuageObj.currentPhaseRed = nil then
          ENFiderGuageObj.currentPhaseRed := TXSDecimal.Create;
        if edtCurrentPhaseRed.Text <> '' then
          ENFiderGuageObj.currentPhaseRed.decimalString :=
            edtCurrentPhaseRed.Text
        else
          ENFiderGuageObj.currentPhaseRed := nil;

        if ENFiderGuageObj.tensionPhaseYellow = nil then
          ENFiderGuageObj.tensionPhaseYellow := TXSDecimal.Create;
        if edtTensionPhaseYellow.Text <> '' then
          ENFiderGuageObj.tensionPhaseYellow.decimalString :=
            edtTensionPhaseYellow.Text
        else
          ENFiderGuageObj.tensionPhaseYellow := nil;

        if ENFiderGuageObj.tensionPhaseGreen = nil then
          ENFiderGuageObj.tensionPhaseGreen := TXSDecimal.Create;
        if edtTensionPhaseGreen.Text <> '' then
          ENFiderGuageObj.tensionPhaseGreen.decimalString :=
            edtTensionPhaseGreen.Text
        else
          ENFiderGuageObj.tensionPhaseGreen := nil;

        if ENFiderGuageObj.tensionPhaseRed = nil then
          ENFiderGuageObj.tensionPhaseRed := TXSDecimal.Create;
        if edtTensionPhaseRed.Text <> '' then
          ENFiderGuageObj.tensionPhaseRed.decimalString :=
            edtTensionPhaseRed.Text
        else
          ENFiderGuageObj.tensionPhaseRed := nil;

        if dtpDateGuage.checked then
          begin
            dtpDateGuage.Time := 0;
            if dtpTimeGuage.Checked then
              dtpDateGuage.Time := dtpTimeGuage.Time;
            if ENFiderGuageObj.dateGuage = nil then
              ENFiderGuageObj.dateGuage := TXSDateTime.Create;
            ENFiderGuageObj.dateGuage.XSToNative(
              GetXSDateTime(dtpDateGuage.DateTime));
          end
        else
          ENFiderGuageObj.dateGuage := nil;

        if DialogState = dsInsert then
          begin
            ENFiderGuageObj.code := low(Integer);
            TempENFiderGuage.add(ENFiderGuageObj);
          end
        else if DialogState = dsEdit then
          TempENFiderGuage.save(ENFiderGuageObj);
      end;
end;

procedure TfrmENFiderGuageEdit.spbEPWorkerClick(Sender: TObject);
var frmEPWorkerShow: TfrmEPWorkerShow;
begin
  frmEPWorkerShow := TfrmEPWorkerShow.Create(Application, fmNormal);
  try
    with frmEPWorkerShow do
      if ShowModal = mrOk then
        begin
          try
            if ENFiderGuageObj.worker = nil then
              ENFiderGuageObj.worker := EPWorker.Create();
            ENFiderGuageObj.worker.code := StrToInt(GetReturnValue(sgMain,0));
            edtEPWorkerName.Text := GetReturnValue(sgMain, 1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmEPWorkerShow.Free;
  end;
end;

procedure TfrmENFiderGuageEdit.spbBranchClick(Sender: TObject);
var frmENBranchShow: TfrmENBranchShow;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
  ENBranchFilterObj: ENBranchFilter;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelObj: ENPanel;
  TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerObj: ENTransformer;
begin
  ENBranchFilterObj := ENBranchFilter.Create;
  SetNullIntProps(ENBranchFilterObj);
  SetNullXSProps(ENBranchFilterObj);
  ENBranchFilterObj.conditionSQL :=
    ' ENPANEL.ELEMENTCODE IN (SELECT E.CODE FROM ENELEMENT E '
    + 'WHERE E.ELEMENTINREFCODE = ' + IntToStr(codeElemS04) + ')';
  frmENBranchShow :=
    TfrmENBranchShow.Create(Application, fmFiltered, ENBranchFilterObj);
  try
    with frmENBranchShow do
      begin
        DisableActions([actInsert, actEdit, actDelete, actFilter, actNoFilter]);
        if ShowModal = mrOk then
          begin
            if ENFiderGuageObj.branchRef = nil then
              ENFiderGuageObj.branchRef := ENBranchRef.Create;
            ENFiderGuageObj.branchRef.code := branchCode;
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchObj := TempENBranch.getObject(branchCode);
            try
              if ENBranchObj.panel <> nil then
                if ENBranchObj.panel.code <> low(Integer) then
                  begin
                    memBranch.Text :=
                      ENBranchObj.numberGen + '. ' + ENBranchObj.name;
                    TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                    ENPanelObj := TempENPanel.getObject(ENBranchObj.panel.code);
                    try
                      edtPanel.Text := ENPanelObj.name;
                      if ENPanelObj.transformer <> nil then
                        if ENPanelObj.transformer.code <> low(Integer) then
                          begin
                            if ENFiderGuageObj.transformer = nil then
                              ENFiderGuageObj.transformer :=
                                ENTransformerRef.Create;
                              ENFiderGuageObj.transformer.code :=
                                ENPanelObj.transformer.code;
                            TempENTransformer := HTTPRIOENTransformer as
                              ENTransformerControllerSoapPort;
                            ENTransformerObj := TempENTransformer.getObject(
                              ENPanelObj.transformer.code);
                            try
                              memTransformer.Text :=
                                ENTransformerObj.name + '. P = '
                                + ENTransformerObj.nominalPower.decimalString
                                + ' кВА. ';
                              if ENTransformerObj.transformerType <> nil then
                                if ENTransformerObj.transformerType.code <>
                                  low(Integer)
                                then
                                  memTransformer.Text := memTransformer.Text +
                                    ENTransformerObj.transformerType.name + '.';
                              if ENTransformerObj.invNumber <> '' then
                                memTransformer.Text := memTransformer.Text
                                  + ' Інв. № ' + ENTransformerObj.invNumber;
                            finally
                              ENTransformerObj.Free;
                              ENTransformerObj := nil;
                            end;
                          end;
                    finally
                      ENPanelObj.Free;
                      ENPanelObj := nil;
                    end;
                  end;
            finally
              ENBranchObj.Free;
              ENBranchObj := nil;
            end;
          end;
      end;
  (*finally
    frmENBranchShow.Free;*)
  except
    on EConvertError do Exit;
  end;
end;

procedure TfrmENFiderGuageEdit.spbTransformerClick(Sender: TObject);
  var ENTransformerFilterObj: ENTransformerFilter;
begin
  ENTransformerFilterObj := ENTransformerFilter.Create;
  SetNullIntProps(ENTransformerFilterObj);
  SetNullXSProps(ENTransformerFilterObj);
  ENTransformerFilterObj.conditionSQL :=
    'SUBSTATION04REFCODE = ' + IntToStr(ENFiderGuageObj.substation04.code);
  frmENTransformerShow := TfrmENTransformerShow.Create(
    Application, fmFiltered, ENTransformerFilterObj);
  try
    with frmENTransformerShow do
      begin
        ShowModal;
        if ModalResult = mrOk then
          begin
            if ENFiderGuageObj.transformer = nil then
              ENFiderGuageObj.transformer := ENTransformerRef.Create;
            ENFiderGuageObj.transformer.code :=
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

procedure TfrmENFiderGuageEdit.rbGeneralSwitchingDeviceKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  rbGeneralSwitchingDevice.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENFiderGuageEdit.rbGeneralSwitchingDeviceMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  spbTransformer.Enabled := rbGeneralSwitchingDevice.Checked;
  spbBranch.Enabled := rbBranch.Checked;
  ENFiderGuageObj.branchRef := nil;
  memBranch.Clear;
  edtPanel.Clear;
end;

procedure TfrmENFiderGuageEdit.rbBranchKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var Button: TMouseButton; X, Y: Integer;
begin
  rbBranch.OnMouseUp(Sender, Button, Shift, X, Y);
end;

procedure TfrmENFiderGuageEdit.rbBranchMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  spbTransformer.Enabled := rbGeneralSwitchingDevice.Checked;
  spbBranch.Enabled := rbBranch.Checked;
end;

end.
