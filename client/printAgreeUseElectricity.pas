unit printAgreeUseElectricity;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
    Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls,  ChildFormUnit, ENConsts,
    EnergyproController , DMReportsUnit, InvokeRegistry, Rio, SOAPHTTPClient,
    Grids, AdvObj, BaseGrid, AdvGrid, ENAgreeData2ServicesObjectController;

type
    TfrmPrintAgreeUseElectricity = class(TDialogForm)
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    edtRights: TMemo;
    Label2: TLabel;
    edtConnectionObj: TMemo;
    lblAdditional: TLabel;
    edtAdd1_1: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    edtAdd1_2: TMemo;
    Label5: TLabel;
    edtAdd2: TMemo;
    Label6: TLabel;
    edtAdd3: TMemo;
    Label7: TLabel;
    edtAdd4: TMemo;
    cbBuildersArea: TCheckBox;
    lblNumber: TLabel;
    edtNumberDoc: TMemo;
    lblVoltage: TLabel;
    lblPower: TLabel;
    edtVoltage: TMemo;
    edtI: TMemo;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENAgreeData2ServicesObject: THTTPRIO;
    btnSaveData: TButton;
    cbPrintHolder: TCheckBox;
    grpWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantNumber: TLabel;
    btnWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantNumber: TEdit;
    HTTPRIOENWarrant: THTTPRIO;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LoadAgreeData2ServicesObject();
    procedure btnSaveDataClick(Sender: TObject);
    procedure btnWarrantNumberClick(Sender: TObject);
  private
    { Private declarations }
    agreeDataCode: Integer;
    agreeData: ENAgreeData2ServicesObject;
  public
    { Public declarations }
    soCode, tcSoCode, departmentCode, warrantCode: Integer;
    servicesPower, voltageNominal: string;
  end;

var
  frmPrintAgreeUseElectricity: TfrmPrintAgreeUseElectricity;

implementation


uses
  ENServicesObjectController, ENWarrantController, ShowENWarrant;

{$R *.dfm}


procedure TfrmPrintAgreeUseElectricity.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  personalAccountInfo: PersonalServicesInfo;
  TempServicesObject: ENServicesObjectControllerSoapPort;
  ENServicesObjectObj: ENServicesObject;
begin
  inherited;

  TempServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  try
    ENServicesObjectObj := TempServicesObject.getObject(soCode);
  except
    on EConvertError do Exit;
  end;

  SetLength(argNames, 16);
  SetLength(args, 16);

  argNames[0] := 'agreeCode';
  args[0] := IntToStr(tcSoCode);

  personalAccountInfo := nil;

  // пробуем определить ТУ через план на установку счетчика или ЗКУ
  // personalAccountInfo := DMReports.getPersonalAccountInfo(ENTechConditionsServicesObj.code);

  if (ENServicesObjectObj.personalAccountNumber <> '') and (ENServicesObjectObj.personalAccountCode <> LOW_INT) then
    personalAccountInfo := TempServicesObject.getPersonalAccountInfo(ENServicesObjectObj.personalAccountNumber, departmentCode, True);

  if (personalAccountInfo <> nil) then
  begin
    if (personalAccountInfo.counterPhasity = 1) then
    begin
      argNames[1] := 'counterTypeF1';
      args[1] := personalAccountInfo.counterType;
      argNames[2] := 'counterCheckateF1';
      args[2] := Trim(personalAccountInfo.counterCheckDate);
      argNames[3] := 'lastControlF1';

      if (personalAccountInfo.lastControl = '') then
        personalAccountInfo.lastControl := '0';
      if (personalAccountInfo.counterDigit = LOW_INT) then
        personalAccountInfo.counterDigit := 4;

      args[3] := padl(FloatToStr(StrToFloat(personalAccountInfo.lastControl)), personalAccountInfo.counterDigit, '0');

      argNames[4] := 'servicesPower';
      if (StrToFloat(servicesPower) <= 1) then
        args[4] := '6A'
      else if (StrToFloat(servicesPower) > 1) and (StrToFloat(servicesPower) <= 2) then
        args[4] := '10A'
      else if (StrToFloat(servicesPower) > 2) and (StrToFloat(servicesPower) <= 3) then
        args[4] := '16A'
      else if (StrToFloat(servicesPower) > 3) and (StrToFloat(servicesPower) <= 4) then
        args[4] := '20A'
      else if (StrToFloat(servicesPower) > 4) and (StrToFloat(servicesPower) <= 5) then
        args[4] := '25A'
      else if (StrToFloat(servicesPower) > 5) and (StrToFloat(servicesPower) <= 6) then
        args[4] := '32A'
      else if (StrToFloat(servicesPower) > 6) and (StrToFloat(servicesPower) <= 8) then
        args[4] := '40A'
      else if (StrToFloat(servicesPower) > 8) and (StrToFloat(servicesPower) <= 10) then
        args[4] := '50A'
      else if (StrToFloat(servicesPower) > 10) and (StrToFloat(servicesPower) <= 11) then
        args[4] := '63A';

    end else
    begin

      argNames[4] := 'servicesPower';
      if (StrToFloat(servicesPower) <= 3) then
        args[4] := '6A'
      else if (StrToFloat(servicesPower) > 3) and (StrToFloat(servicesPower) <= 6) then
        args[4] := '10A'
      else if (StrToFloat(servicesPower) > 6) and (StrToFloat(servicesPower) <= 9) then
        args[4] := '16A'
      else if (StrToFloat(servicesPower) > 9) and (StrToFloat(servicesPower) <= 12) then
        args[4] := '20A'
      else if (StrToFloat(servicesPower) > 12) and (StrToFloat(servicesPower) <= 15) then
        args[4] := '25A'
      else if (StrToFloat(servicesPower) > 15) and (StrToFloat(servicesPower) <= 19) then
        args[4] := '32A'
      else if (StrToFloat(servicesPower) > 19) and (StrToFloat(servicesPower) <= 24) then
        args[4] := '40A'
      else if (StrToFloat(servicesPower) > 24) and (StrToFloat(servicesPower) <= 30) then
        args[4] := '50A'
      else if (StrToFloat(servicesPower) > 30) and (StrToFloat(servicesPower) <= 38) then
        args[4] := '63A';

      argNames[5] := 'counterTypeF3';
      args[5] := personalAccountInfo.counterType;
      argNames[6] := 'counterCheckateF3';
      args[6] := Trim(personalAccountInfo.counterCheckDate);
      argNames[7] := 'lastControlF3';

      if (personalAccountInfo.lastControl = '') then
        personalAccountInfo.lastControl := '0';
      if (personalAccountInfo.counterDigit = LOW_INT) then
        personalAccountInfo.counterDigit := 4;

      args[7] := padl(FloatToStr(StrToFloat(personalAccountInfo.lastControl)), personalAccountInfo.counterDigit, '0');
    end;

    argNames[8] := 'powerSupplyPoint';
    args[8] := personalAccountInfo.powerSupplyPoint;

    argNames[9] := 'voltageNominal';
    args[9] := FloatToStr(StrToFloat(voltageNominal));
  end;


  argNames[10] := 'connectionPowerPoint';
  args[10] := 'не визначено';

  argNames[11] := 'rightsDoc';

  if (frmPrintAgreeUseElectricity.edtRights.Text <> '') then
    args[11] := frmPrintAgreeUseElectricity.edtRights.Text
  else
    args[11] := 'не визначено';

  argNames[12] := 'connectionObj';
  if (frmPrintAgreeUseElectricity.edtConnectionObj.Text <> '') then
    args[12] := frmPrintAgreeUseElectricity.edtConnectionObj.Text
  else
    args[12] := 'не визначено';

  argNames[13] := 'numberDoc';
  if (frmPrintAgreeUseElectricity.edtNumberDoc.Text <> '') then
    args[13] := frmPrintAgreeUseElectricity.edtNumberDoc.Text
  else
    args[13] := '';

  argNames[14] := 'buildersArea';
  if (frmPrintAgreeUseElectricity.cbBuildersArea.Checked ) then
    args[14] := '1'
  else
    args[14] := '0';

  argNames[9] := 'voltageNominal';
  if (frmPrintAgreeUseElectricity.edtVoltage.Text <> '') then
    args[9] := FloatToStr(StrToFloat(frmPrintAgreeUseElectricity.edtVoltage.Text));

  argNames[4] := 'servicesPower';
  if (frmPrintAgreeUseElectricity.edtI.Text <> '') then
    args[4] := frmPrintAgreeUseElectricity.edtI.Text;

  argNames[15] := 'printHolder';
  if (frmPrintAgreeUseElectricity.cbPrintHolder.Checked ) then
    args[15] := '1'
  else
    args[15] := '0';


  reportName := 'TechConditions/agree_use_electricity';
  makeReport(reportName, argNames, args, 'pdf');


  /// додаток 2
  SetLength(argNames, 8);
  SetLength(args, 8);
  argNames[0] := 'agreeCode';
  args[0] := IntToStr(tcSoCode);

  argNames[1] := 'add1_1';
  if (frmPrintAgreeUseElectricity.edtAdd1_1.Text <> '') then
    args[1] := frmPrintAgreeUseElectricity.edtAdd1_1.Text
  else
    args[1] := 'не визначено';

  argNames[2] := 'add1_2';
  if (frmPrintAgreeUseElectricity.edtAdd1_2.Text <> '') then
    args[2] := frmPrintAgreeUseElectricity.edtAdd1_2.Text
  else
  args[2] := 'не визначено';

  argNames[3] := 'add2';
  if (frmPrintAgreeUseElectricity.edtAdd2.Text <> '') then
    args[3] := frmPrintAgreeUseElectricity.edtAdd2.Text
  else
    args[3] := 'не визначено';

  argNames[4] := 'add3';
  if (frmPrintAgreeUseElectricity.edtAdd3.Text <> '') then
    args[4] := frmPrintAgreeUseElectricity.edtAdd3.Text
  else
    args[4] := 'не визначено';

  argNames[5] := 'add4';
  if (frmPrintAgreeUseElectricity.edtAdd4.Text <> '') then
    args[5] := frmPrintAgreeUseElectricity.edtAdd4.Text
  else
    args[5] := 'не визначено';

  argNames[6] := 'numberDoc';
  if (frmPrintAgreeUseElectricity.edtNumberDoc.Text <> '') then
    args[6] := frmPrintAgreeUseElectricity.edtNumberDoc.Text
  else
    args[6] := '';

  argNames[7] := 'printHolder';
  if (frmPrintAgreeUseElectricity.cbPrintHolder.Checked ) then
    args[7] := '1'
  else
    args[7] := '0';

  reportName := 'TechConditions/agree_use_electricity_add2';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmPrintAgreeUseElectricity.btnSaveDataClick(Sender: TObject);
var
  TempENAgreeData2ServicesObject: ENAgreeData2ServicesObjectControllerSoapPort;
begin
  inherited;
  TempENAgreeData2ServicesObject := HTTPRIOENAgreeData2ServicesObject as ENAgreeData2ServicesObjectControllerSoapPort;

  if (agreeDataCode = Low(Integer)) then
  begin

    if agreeData = nil then
    begin
      agreeData := ENAgreeData2ServicesObject.Create;
      SetNullIntProps(agreeData);
      SetNullXSProps(agreeData);
    end;

    agreeData.servicesObjectRef := ENServicesObjectRef.Create;
    agreeData.servicesObjectRef.code := soCode;
  end;

  agreeData.numberDoc := edtNumberDoc.Text;
  agreeData.rights := edtRights.Text;
  agreeData.connectionObj := edtConnectionObj.Text;

  if cbBuildersArea.Checked then
    agreeData.buildersArea := YES
  else
    agreeData.buildersArea := NO;

  agreeData.voltage := edtVoltage.Text;
  agreeData.amperage := edtI.Text;
  agreeData.add1_1 := edtAdd1_1.Text;
  agreeData.add1_2 := edtAdd1_2.Text;
  agreeData.add2 := edtAdd2.Text;
  agreeData.add3 := edtAdd3.Text;
  agreeData.add4 := edtAdd4.Text;

  if warrantCode <> Low(Integer) then
  begin
    agreeData.warrantRef := ENWarrantRef.Create;
    agreeData.warrantRef.code := warrantCode;
  end;

  if cbPrintHolder.Checked then
    agreeData.printHolder := YES
  else
    agreeData.printHolder := NO;

  if (agreeDataCode = Low(Integer)) then
  begin
    agreeData.code := low(Integer);
    TempENAgreeData2ServicesObject.add(agreeData);
  end
  else
  if (agreeDataCode <> Low(Integer)) then
  begin
    TempENAgreeData2ServicesObject.save(agreeData);
  end;

  FormShow(Sender);
end;


procedure TfrmPrintAgreeUseElectricity.btnWarrantNumberClick(Sender: TObject);
var frmENWarrantShow : TfrmENWarrantShow;
    f : ENWarrantFilter;
    //warrant : ENWarrant; //Исключено объявление не используемых переменных
    datContract, datWarrant : TXSDate;
    //dtdatContract, dtdatWarrant : TDateTime;
    //power: Double;
begin

     datContract := TXSDate.Create;
     datWarrant := TXSDate.Create;

     f := ENWarrantFilter.Create();
     SetNullXSProps(f);
     SetNullIntProps(f);
     f.conditionSQL := ' warrantstatusrefcode = 0';

     frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
     DisableActions([frmENWarrantShow.actNoFilter]);

     try
        with frmENWarrantShow do
          if ShowModal = mrOk then
          begin
              try
                 if agreeData = nil then
                  begin
                    agreeData := ENAgreeData2ServicesObject.Create;
                    SetNullIntProps(agreeData);
                    SetNullXSProps(agreeData);
                  end;

                  agreeData.warrantRef := ENWarrantRef.Create();
                  agreeData.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

                  edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
                  edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);
                  warrantCode :=  StrToInt(GetReturnValue(sgENWarrant,0));

              except
                 on EConvertError do Exit;
              end;
          end;
     finally
        frmENWarrantShow.Free;
     end;

end;

procedure TfrmPrintAgreeUseElectricity.FormCreate(Sender: TObject);
begin
  inherited;
  soCode := Low(Integer);
  tcSoCode := Low(Integer);
  agreeDataCode := Low(Integer);
  warrantCode := Low(Integer);
end;


procedure TfrmPrintAgreeUseElectricity.FormShow(Sender: TObject);
begin
  inherited;
  DenyBlankValues([edtConnectionObj, edtRights]);

  if (soCode <> Low(Integer)) then LoadAgreeData2ServicesObject;
end;


procedure TfrmPrintAgreeUseElectricity.LoadAgreeData2ServicesObject();
var //i: Integer;
  TempENAgreeData2ServicesObject: ENAgreeData2ServicesObjectControllerSoapPort;
  agreeDataArr : ENAgreeData2ServicesObjectController.ArrayOfInteger;
  agreeDataFilter: ENAgreeData2ServicesObjectFilter;
  TempENWarrant : ENWarrantControllerSoapPort;
  warrant : ENWarrant;
begin
  TempENAgreeData2ServicesObject := HTTPRIOENAgreeData2ServicesObject as ENAgreeData2ServicesObjectControllerSoapPort;
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;

  agreeDataFilter := ENAgreeData2ServicesObjectFilter.Create;
  SetNullIntProps(agreeDataFilter);
  SetNullXSProps(agreeDataFilter);

  agreeDataFilter.servicesObjectRef := ENServicesObjectRef.Create;
  agreeDataFilter.servicesObjectRef.code := soCode;

  agreeDataArr := TempENAgreeData2ServicesObject.getScrollableFilteredCodeArray(agreeDataFilter, 0, -1);
  if High(agreeDataArr) > -1 then
  begin

    try
      agreeData := TempENAgreeData2ServicesObject.getObject(agreeDataArr[0]);
    except
      on EConvertError do Exit;
    end;

    agreeDataCode := agreeData.code;
    edtNumberDoc.Text := agreeData.numberDoc;
    edtRights.Text := agreeData.rights;
    edtConnectionObj.Text := agreeData.connectionObj;
    cbBuildersArea.Checked := agreeData.buildersArea = YES;
    edtVoltage.Text := agreeData.voltage;
    edtI.Text := agreeData.amperage;
    edtAdd1_1.Text := agreeData.add1_1;
    edtAdd1_2.Text := agreeData.add1_2;
    edtAdd2.Text := agreeData.add2;
    edtAdd3.Text := agreeData.add3;
    edtAdd4.Text := agreeData.add4;
    cbPrintHolder.Checked := agreeData.printHolder = YES;

    if ((agreeData.warrantRef <> nil) and ( agreeData.warrantRef.code <> Low(Integer))) then
    begin
       warrant := TempENWarrant.getObject(agreeData.warrantRef.code);
       edtWarrantFIO.Text := warrant.warrantShortFIO;
       edtWarrantNumber.Text := warrant.numbergen;
    end;

  end;
end;


end.
