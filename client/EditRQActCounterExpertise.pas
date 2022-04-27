
unit EditRQActCounterExpertise;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQActCounterExpertiseController, SCCounterController ;

type
  TfrmRQActCounterExpertiseEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberGen : TLabel;
    edtNumberGen: TEdit;
    lblDateGen : TLabel;
    edtDateGen: TDateTimePicker;


  HTTPRIORQActCounterExpertise: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    gbPersonalAccount: TGroupBox;
    lblENDepartmentDepartmentName: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    lblPersonalAccountNumber: TLabel;
    edtPersonalAccountNumber: TEdit;
    spbGetPersonalInfo: TSpeedButton;
    lblPersonalAccountName: TLabel;
    edtPersonalAccountName: TEdit;
    gpbCounter: TGroupBox;
    spbMolIncome: TSpeedButton;
    lblMolIncome: TLabel;
    lblPhasity: TLabel;
    edtMolIncomeFIO: TEdit;
    edtMolIncomeCode: TEdit;
    cbPhasity: TComboBox;
    lblCounterType: TLabel;
    edtCounterType: TEdit;
    edtSerialNumber: TEdit;
    lblSerialNumber: TLabel;
    HTTPRIOENServicesObject: THTTPRIO;
    btnPrintOrder: TButton;
    HTTPRIOENDepartment: THTTPRIO;
    HTTPRIOSCCounter: THTTPRIO;
    HTTPRIOSCMol: THTTPRIO;
    edtInvNumber: TEdit;
    lblInvNumber: TLabel;
    spbInvNumber: TSpeedButton;
    rbIsByt: TRadioButton;
    rbIsJur: TRadioButton;
    Label1: TLabel;
    lblPurpose: TLabel;
    cbPurpose: TComboBox;
    spbChoosePersonalAccountInfo: TSpeedButton;
    HTTPRIOENRecordPointProm: THTTPRIO;
    HTTPRIOENRecordPointByt: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbMolIncomeClick(Sender: TObject);
    procedure spbGetPersonalInfoClick(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure spbInvNumberClick(Sender: TObject);
    procedure rbClick(Sender: TObject);
    procedure edtPersonalAccountNumberExit(Sender: TObject);
    procedure edtPersonalAccountNumberEnter(Sender: TObject);
  private
    personalAccountNumberOnEnter : String;
    procedure showCounterAttributes; overload;
    procedure showCounterAttributes(counter : SCCounter); overload;
    procedure clearPersonalAccount; overload;
    procedure clearPersonalAccount(clearPersonalAccountNumberEditText : Boolean); overload;
    { Private declarations }
  public
      isIncome: Boolean;
    { Public declarations }

end;

var
  frmRQActCounterExpertiseEdit: TfrmRQActCounterExpertiseEdit;
  RQActCounterExpertiseObj: RQActCounterExpertise;
  isRadioButtonsForCustomerTypeIsActiveOnClick : Boolean;

implementation

uses ShowENDepartment, ENDepartmentController, SCMolController, ShowSCMol
, ENServicesObjectController, EditRQFKOrder, ShowScanCounters
, ScanCountersController, RQActCounterExpertisePurposeController, ENRecordPointBytController
, ENRecordPointPromController, ShowENRecordPointByt, ShowENRecordPointProm;

{$R *.dfm}

procedure TfrmRQActCounterExpertiseEdit.clearPersonalAccount;
begin
   clearPersonalAccount(true);
end;

procedure TfrmRQActCounterExpertiseEdit.clearPersonalAccount(clearPersonalAccountNumberEditText : Boolean);
begin
    RQActCounterExpertiseObj.personalAccountCode := Low(Integer);
    RQActCounterExpertiseObj.personalAccountNumber := '';
    RQActCounterExpertiseObj.personalAccountName := '';
    if(clearPersonalAccountNumberEditText) then begin
      edtPersonalAccountNumber.Text := '';
    end;
    edtPersonalAccountName.Text := '';
end;


procedure TfrmRQActCounterExpertiseEdit.edtPersonalAccountNumberEnter(
  Sender: TObject);
begin
  inherited;
  personalAccountNumberOnEnter := edtPersonalAccountNumber.Text;
end;

procedure TfrmRQActCounterExpertiseEdit.edtPersonalAccountNumberExit(
  Sender: TObject);
begin
  inherited;
  if (Length(personalAccountNumberOnEnter) > 0) and
    (personalAccountNumberOnEnter <> edtPersonalAccountNumber.Text) then begin
      clearPersonalAccount(false);
    end;
end;

procedure TfrmRQActCounterExpertiseEdit.showCounterAttributes;
var
TempSCCounter : SCCounterControllerSoapPort;
counter : SCCounter;
begin
    if (not Assigned(RQActCounterExpertiseObj))
    or (not Assigned(RQActCounterExpertiseObj.counter))
    or (RQActCounterExpertiseObj.counter.code = Low(Integer)) then begin
        Self.showCounterAttributes(nil);
    end else begin
        TempSCCounter := HTTPRIOSCCounter as SCCounterControllerSoapPort;
        counter := TempSCCounter.getObject(RQActCounterExpertiseObj.counter.code);
        Self.showCounterAttributes(counter);
    end;
end;

procedure TfrmRQActCounterExpertiseEdit.showCounterAttributes(counter : SCCounter);
var
  phasityIndex: Integer;
  TempSCMol : SCMolControllerSoapPort;
  molFilter : SCMolFilter;
  molList : SCMolShortList;
begin
        if (not Assigned(counter)) then begin
          edtInvNumber.Text := '';
          cbPhasity.ItemIndex := -1;
          edtCounterType.Text := '';
          edtSerialNumber.Text := '';
          edtMolIncomeCode.Text := '';
          edtMolIncomeFIO.Text := '';
        end else begin
          if Assigned(counter.phasity) then begin
            phasityIndex := StrToInt(counter.phasity.DecimalString);
            if phasityIndex = 3 then phasityIndex := phasityIndex - 1;
            cbPhasity.itemIndex := phasityIndex;
            cbPhasity.Text := counter.phasity.DecimalString;
          end;
          edtCounterType.Text := counter.counterType;
          edtSerialNumber.Text := counter.buildNumber;
          edtMolIncomeCode.Text := counter.molCode;
          edtInvNumber.Text := counter.invNumber;

          	TempSCMol := HTTPRIOSCMol as SCMolControllerSoapPort;
            molFilter := SCMolFilter.Create;
            SetNullXSProps(molFilter);
            SetNullIntProps(molFilter);
            molFilter.kod_mol := counter.molCode;
            molList := TempSCMol.getScrollableFilteredList(molFilter, 0, -1);
            if molList.totalCount > 0 then begin
                edtMolIncomeFIO.Text := molList.list[0].name_mol;
            end;
        end;
end;

procedure TfrmRQActCounterExpertiseEdit.FormShow(Sender: TObject);
var
TempDepartment : ENDepartmentControllerSoapPort;
department : ENDepartment;
isByt : Boolean;
begin
  isRadioButtonsForCustomerTypeIsActiveOnClick := False;

  HideControls([lblPurpose, cbPurpose], not Self.isIncome);
	DisableControls([edtCode, edtENDepartment, edtPersonalAccountName, edtMolIncomeCode
  , edtMolIncomeFIO, edtInvNumber]);
  if DialogState = dsView then
  begin
     DisableControls([spbENDepartment, spbMolInCome, spbGetPersonalInfo, spbInvNumber, rbIsByt, rbIsJur]);
  end;

  if not Self.isIncome then begin
    lblMolIncome.Caption := 'МВО для передачі';
    gpbCounter.Caption := 'Інформація для передачі лічильника';
    HideControls([edtInvNumber, lblInvNumber, spbInvNumber], False);
  end;

  if (DialogState = dsInsert) then begin
	  edtNumberGen.Text := 'Auto';
    HideControls([btnPrintOrder]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
	  edtNumberGen
      ,edtDateGen
	  ,edtENDepartment
	  ,edtPersonalAccountNumber
	  , edtMolIncomeCode
	  , cbPhasity
	  , edtCounterType
	  , edtSerialNumber
     ]);

     if not Self.isIncome then begin
      DisableControls([cbPhasity, edtCounterType, edtSerialNumber, spbMolIncome]);
      HideControls([lblPurpose, cbPurpose]);
    end else begin
      // по умолчанию будет стоять цель приходования - экспертиза
      cbPurpose.ItemIndex := 0;
    end;
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    isByt := (RQActCounterExpertiseObj.isByt <> nil) and (RQActCounterExpertiseObj.isByt.AsBoolean);
    rbIsJur.Checked := not isByt;
      edtCode.Text := IntToStr(RQActCounterExpertiseObj.code);
    edtNumberGen.Text := RQActCounterExpertiseObj.numberGen;
      SetDateFieldForDateTimePicker(edtDateGen, RQActCounterExpertiseObj.dateGen);
    edtPersonalAccountNumber.Text := RQActCounterExpertiseObj.personalAccountNumber; 
    edtPersonalAccountName.Text := RQActCounterExpertiseObj.personalAccountName;
    
    if ((Assigned(RQActCounterExpertiseObj.purpose)) and (RQActCounterExpertiseObj.purpose.code <> Low(Integer))) then begin
       cbPurpose.ItemIndex := RQActCounterExpertiseObj.purpose.code - 1;
    end;	

    TempDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    department := TempDepartment.getObject(RQActCounterExpertiseObj.department.code);
    edtENDepartment.Text := department.shortName;
    Self.showCounterAttributes;
  end;
  isRadioButtonsForCustomerTypeIsActiveOnClick := True;
end;

procedure TfrmRQActCounterExpertiseEdit.rbClick(Sender: TObject);
begin
  inherited;
  if isRadioButtonsForCustomerTypeIsActiveOnClick then clearPersonalAccount;
end;

procedure TfrmRQActCounterExpertiseEdit.spbENDepartmentClick(Sender: TObject);
var
departmentOldCode : Integer;
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(procedure(selectedObj : ENDepartmentShort)
  begin
    if RQActCounterExpertiseObj.department = nil then RQActCounterExpertiseObj.department := ENDepartmentRef.Create();
    departmentOldCode := RQActCounterExpertiseObj.department.code;
    if departmentOldCode <> selectedObj.code then begin
      clearPersonalAccount;
    end;

    RQActCounterExpertiseObj.department.code := selectedObj.code;
    edtENDepartment.Text:= selectedObj.shortName;
  end);
end;

procedure TfrmRQActCounterExpertiseEdit.spbGetPersonalInfoClick(
  Sender: TObject);
var
  bytFilter : ENRecordPointBytFilter;
  promFilter : ENRecordPointPromFilter;
  selectedByt : ENRecordPointBytShort;
  selectedProm : ENRecordPointPromShort;
  TempENRecordPointByt : ENRecordPointBytControllerSoapPort;
  TempENRecordPointProm : ENRecordPointPromControllerSoapPort;
  byt : ENRecordPointByt;
  prom : ENRecordPointProm;
begin
  inherited;
  if (edtPersonalAccountNumber.Text = '') then begin
    Application.MessageBox(PChar('Не введено особовий рахунок!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    edtPersonalAccountNumber.SetFocus;
    Exit;
  end;
  if (edtENDepartment.Text = '') then begin
    Application.MessageBox(PChar('Оберіть підрозділ!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
    edtENDepartment.SetFocus;
    Exit;
  end;

  if rbIsByt.Checked then begin
    bytFilter := ENRecordPointBytFilter.Create;
    SetNullXSProps(bytFilter);
    SetNullIntProps(bytFilter);
    bytFilter.accountNumber := edtPersonalAccountNumber.Text;
    selectedByt := TfrmENRecordPointBytShow.chooseFromList(bytFilter);
    if Assigned(selectedByt) then begin
      TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
      byt := TempENRecordPointByt.getObject(selectedByt.code);
      RQActCounterExpertiseObj.personalAccountCode := byt.rpCode;
      edtPersonalAccountNumber.Text := byt.accountNumber;
      edtPersonalAccountName.text := byt.name;
    end;
  end else begin
    promFilter := ENRecordPointPromFilter.Create;
    SetNullXSProps(promFilter);
    SetNullIntProps(promFilter);
    promFilter.accountNumber := edtPersonalAccountNumber.Text;
    selectedProm := TfrmENRecordPointPromShow.chooseFromList(promFilter);
    if Assigned(selectedProm) then begin
      TempENRecordPointProm := HTTPRIOENRecordPointProm as ENRecordPointPromControllerSoapPort;
      prom := TempENRecordPointProm.getObject(selectedProm.code);
      RQActCounterExpertiseObj.personalAccountCode := prom.accountCode;
      edtPersonalAccountNumber.Text := prom.accountNumber;
      edtPersonalAccountName.text := prom.accountName;
    end;
  end;
end;

procedure TfrmRQActCounterExpertiseEdit.spbInvNumberClick(Sender: TObject);
var
counter : SCCounter;
selectedObj : ScanCountersShort;
begin
  inherited;
  selectedObj := TfrmScanCountersShow.chooseFromList;
  if not Assigned(selectedObj) then begin
    Exit;
  end;
  counter := SCCounter.Create;
  counter.invNumber := selectedObj.invNumber;
  counter.molCode := selectedObj.mol;
  counter.buildNumber := selectedObj.serialnumber;
  counter.counterType := selectedObj.type_counter;
  counter.phasity := selectedObj.phasity;
  Self.showCounterAttributes(counter);
  if not Self.isIncome then begin
    if (counter.phasity <> nil) then begin
      DisableControls([cbPhasity]);
    end else begin
      DisableControls([cbPhasity], false);
    end;
  end;
end;

procedure TfrmRQActCounterExpertiseEdit.spbMolIncomeClick(Sender: TObject);
var selectedMol : SCMolShort;
begin
  inherited;
  selectedMol := TfrmSCMolShow.chooseFromList();
  if(Assigned(selectedMol)) then begin
    edtMolIncomeCode.Text := selectedMol.kod_mol;
    edtMolIncomeFIO.Text := selectedMol.name_mol;
  end;
end;

procedure TfrmRQActCounterExpertiseEdit.btnPrintOrderClick(Sender: TObject);
begin
  inherited;
	try
		frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsView);
    frmRQFKOrderEdit.printOrder(RQActCounterExpertiseObj.fkOrder.code);
	finally
		if frmRQFKOrderEdit <> nil then begin
			frmRQFKOrderEdit.Free;
			frmRQFKOrderEdit := nil;
		end;
	end;
end;

procedure TfrmRQActCounterExpertiseEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
counter : SCCounter;
components : TArray<TWinControl>;
begin

  if Self.isIncome then begin
    components := TArray<TWinControl>.Create(edtNumberGen
    ,edtDateGen
    ,edtENDepartment
    ,edtPersonalAccountNumber
    , cbPhasity
    , edtMolIncomeCode
    , edtCounterType
    , edtSerialNumber
    , cbPurpose);
  end else begin
    components := TArray<TWinControl>.Create(edtNumberGen
    ,edtDateGen
    ,edtENDepartment
    ,edtPersonalAccountNumber
    , cbPhasity
    , edtMolIncomeCode
    , edtCounterType
    , edtSerialNumber
    , edtInvNumber);
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(components)  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQActCounterExpertise := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;


     RQActCounterExpertiseObj.numberGen := edtNumberGen.Text;
     RQActCounterExpertiseObj.isByt := TXSBoolean.Create;
     RQActCounterExpertiseObj.isByt.asBoolean := rbIsByt.Checked;

     RQActCounterExpertiseObj.dateGen := GetTXSDateFromTDateTimePicker(edtDateGen);
	 
     if(cbPurpose.ItemIndex >= 0) then begin 
       RQActCounterExpertiseObj.purpose := RQActCounterExpertisePurposeRef.Create;
       RQActCounterExpertiseObj.purpose.code := cbPurpose.ItemIndex + 1;
     end;

	 if(RQActCounterExpertiseObj.personalAccountCode = Low(Integer)) then begin
      Application.MessageBox(PChar('Введіть обліковий рахунок та натисніть "?"!'),PChar('“вага !'),MB_ICONWARNING+MB_OK);
			Action:=caNone;
      Exit;
	 end;

     RQActCounterExpertiseObj.personalAccountNumber := edtPersonalAccountNumber.Text;

     RQActCounterExpertiseObj.personalAccountName := edtPersonalAccountName.Text; 
	 
	 counter := SCCounter.Create;
	 SetNullIntProps(counter);
	 SetNullXSProps(counter);
	 counter.molCode := edtMolIncomeCode.Text;
	 counter.counterType := edtCounterType.Text;
   counter.name := edtCounterType.Text;
	 counter.buildNumber := edtSerialNumber.Text;
	 counter.phasity := TXSDecimal.Create;
	 counter.phasity.DecimalString := cbPhasity.Text;
   counter.invNumber := edtInvNumber.Text;

    if DialogState = dsInsert then
    begin
      RQActCounterExpertiseObj.code:=low(Integer);
      TempRQActCounterExpertise.add(RQActCounterExpertiseObj, counter, isIncome);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQActCounterExpertise.save(RQActCounterExpertiseObj, counter, isIncome);
    end;
  end;
end;


end.