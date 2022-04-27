unit EditPersonalAccountForServicesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, InvokeRegistry, Rio,
  SOAPHTTPClient, ENServicesObjectController;

type
  TfrmPersonalAccountForServicesObjectEdit = class(TDialogForm)
    lblPersonalAccount: TLabel;
    edtPersonalAccountNumber: TEdit;
    lblName: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    lblENDepartment: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    lblEIC: TLabel;
    cbbEIC: TComboBox;
    spbEIC: TSpeedButton;
    btnChoosePersonalInfo: TButton;
    HTTPRIOENRecordPointProm: THTTPRIO;
    HTTPRIOENRecordPointByt: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbEICClick(Sender: TObject);
    procedure btnChoosePersonalInfoClick(Sender: TObject);
  private
    { Private declarations }
    departmentCode: Integer;
    personalAccountCode: Integer;
    personalAccountNumber: String;
    personalAccountEIC : String;
    personalAccountUid : String;
    servicesObject: ENServicesObject;

    procedure disableEditing(disable: Boolean = true);
    procedure setPersonalServicesInfo(personalInfo : PersonalServicesInfo; isByt : Boolean);
    procedure toggleEICButton;
  public
    { Public declarations }
    {
    personalAccountCode: Integer;
    personalAccountNumber: String;
    personalAccountName: String;
    }
    servicesObjectCode: Integer;
  end;

var
  frmPersonalAccountForServicesObjectEdit: TfrmPersonalAccountForServicesObjectEdit;

implementation

uses ENConsts, ShowENDepartment, ENDepartmentController, ChildFormUnit
, ShowCCRecordPointLite, CCRecordPointController, Generics.Collections,
  DMReportsUnit
  , ShowENRecordPointByt, ENRecordPointBytController
  , ShowENRecordPointProm, ENRecordPointPromController
  , ENDepartment2EPRenController, EnergyProController;

{$R *.dfm}

procedure TfrmPersonalAccountForServicesObjectEdit.toggleEICButton;
begin
  DisableControls([spbEIC], (cbbEIC.Items.Count <= 1));
  HideControls([spbEIC], (cbbEIC.Items.Count <= 1));
end;


procedure TfrmPersonalAccountForServicesObjectEdit.btnChoosePersonalInfoClick(
  Sender: TObject);
var
  isByt : Boolean;
  TempENRecordPointByt : ENRecordPointBytControllerSoapPort;
  TempENRecordPointProm : ENRecordPointPromControllerSoapPort;
  promFilter : ENRecordPointPromFilter;
  bytFilter : ENRecordPointBytFilter;
  prom : ENRecordPointProm;
  selectedProm : ENRecordPointPromShort;
  byt : ENRecordPointByt;
  selectedByt : ENRecordPointBytShort;
  personalInfo : PersonalServicesInfo;
  accountNumber, codeEic : String;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  TempENDepartment2EPRen : ENDepartment2EPRenControllerSoapPort;
  dep2RenFilter : ENDepartment2EPRenFilter;
  dep2RenList : ENDepartment2EPRenShortList;
  depCode : Integer;
  uid : WideString;
begin
  inherited;
  if not NoBlankValues([edtPersonalAccountNumber]) then
  begin
    Application.MessageBox(PChar('Вкажіть, будь ласка, особовий рахунок!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
    if servicesObject = nil then
    raise Exception.Create('Не знайдено Послугу на сторону з кодом ' + IntToStr(servicesObjectCode) + ' !');

  if (departmentCode = LOW_INT) or (edtENDepartment.Text = '') then
  begin
    edtENDepartment.SetFocus;
    raise Exception.Create('Не заданий підрозділ!');
  end;

  if servicesObject.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL,
                                               ENSERVICESOBJECT_CONTRAGENTTYPE_PHYSICAL_NOREZIDENT] then
    isByt := True
  else if servicesObject.contragentTypeRef.code in [ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_BUDGET,
                                                    ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NONBUDGET,
                                                    ENSERVICESOBJECT_CONTRAGENTTYPE_JURIDICAL_NOREZIDENT] then
    isByt := False
  else
    raise Exception.Create('Помилка при визначенні типу контрагента!');

   if isByt then begin
    bytFilter := ENRecordPointBytFilter.Create;
    SetNullXSProps(bytFilter);
    SetNullIntProps(bytFilter);
    bytFilter.accountNumber := edtPersonalAccountNumber.Text;
    selectedByt := TfrmENRecordPointBytShow.chooseFromList(bytFilter);
    if Assigned(selectedByt) then begin
      TempENRecordPointByt := HTTPRIOENRecordPointByt as ENRecordPointBytControllerSoapPort;
      byt := TempENRecordPointByt.getObject(selectedByt.code);
      accountNumber := byt.accountNumber;
      depCode := byt.element.renRef.code;
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
      accountNumber := prom.accountNumber;
      depCode := prom.element.renRef.code;
    end;
  end;
  dep2RenFilter := ENDepartment2EPRenFilter.Create;
  SetNullXSProps(dep2RenFilter);
  SetNullIntProps(dep2RenFilter);
  dep2RenFilter.renRef := EPRenRef.Create;
  dep2RenFilter.renRef.code := depCode;
  dep2RenFilter.conditionSQL := Format('EXISTS (SELECT FROM endepartment AS dep1 WHERE endepartment2epren.departmentrefcode = dep1.code '
    + ' AND dep1.parentrefcode = %d)', [ENConsts.ENDEPARTMENT_DATA_MANAGEMENT_CENTER]);
  TempENDepartment2EPRen := HTTPRIOENDepartment2EPRen AS ENDepartment2EPRenControllerSoapPort;
  dep2RenList := TempENDepartment2EPRen.getScrollableFilteredList(dep2RenFilter, 0, -1);
  if dep2RenList.totalCount = 0 then Exit;
  if Length(accountNumber) = 0 then Exit;

  dep2RenFilter.renRef.code := LOW_INT;
  dep2RenFilter.departmentRef := ENDepartmentRef.Create;
  dep2RenFilter.departmentRef.code := dep2RenList.list[0].departmentRefCode;
  dep2RenFilter.conditionSQL := Format('endepartment2epren.renrefcode IN (%d, %d, %d, %d, %d)', [ENConsts.REN_RM_NORTH
    , ENConsts.REN_RM_EAST, ENConsts.REN_RM_SOUTH, ENConsts.REN_RM_WEST, ENConsts.REN_RM_CENTER]);

  dep2RenList := TempENDepartment2EPRen.getScrollableFilteredList(dep2RenFilter, 0, -1);
  if dep2RenList.totalCount = 0 then Exit;

  if isByt then begin
    uid := TempENRecordPointByt.getPersonalAccountUidByCode(byt.rpCode, dep2RenList.list[0].departmentRefCode);
  end else begin
    uid := TempENRecordPointProm.getPersonalAccountUidByCode(prom.accountCode, dep2RenList.list[0].departmentRefCode);
  end;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  if Length(uid) <> 0 then begin
      personalInfo := TempENServicesObject.getPersonalAccountInfo('', uid, dep2RenList.list[0].departmentRefCode, isByt);
  end else begin
        personalInfo := TempENServicesObject.getPersonalAccountInfo(accountNumber, dep2RenList.list[0].departmentRefCode, isByt);
  end;

  Self.setPersonalServicesInfo(personalInfo, isByt);
end;

procedure TfrmPersonalAccountForServicesObjectEdit.setPersonalServicesInfo(personalInfo : PersonalServicesInfo; isByt : Boolean);
var
  eic : WideString;
begin
  if (personalInfo <> nil) and (personalInfo.rpCode <> LOW_INT) then
  begin
    personalAccountCode := personalInfo.rpCode;
    personalAccountNumber := personalInfo.rpName;
    personalAccountUid := personalInfo.rpUid;

    edtPersonalAccountNumber.Text := personalAccountNumber;
    lblName.Caption := 'ПІБ/назва споживача: ' + personalInfo.fioLine;

    cbbEIC.Items.Clear;
    if isByt then begin
      if (Length(Trim(personalInfo.eic)) <> 0) then begin
        cbbEIC.Items.Add(personalInfo.eic);
        cbbEIC.ItemIndex := 0;
      end;
    end else begin
      if (Assigned(personalInfo.eics)) and (Length(personalInfo.eics) > 0) then begin
          DisableControls([cbbEIC], false);
          for eic in personalInfo.eics do cbbEIC.Items.Add(eic);
          if cbbEIC.Items.Count = 1 then begin
            DisableControls([cbbEIC]);
            cbbEIC.ItemIndex := 0;
          end else begin
            cbbEIC.ItemIndex := -1;
          end;
      end;
    end;
    toggleEICButton;
  end;
end;

procedure TfrmPersonalAccountForServicesObjectEdit.disableEditing(disable: Boolean = true);
begin
  DisableControls([edtPersonalAccountNumber, btnOk], disable);

  DenyBlankValues([edtPersonalAccountNumber]);
end;


procedure TfrmPersonalAccountForServicesObjectEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    if not NoBlankValues([edtPersonalAccountNumber]) then
    begin
      Application.MessageBox(PChar('Вкажіть, будь ласка, особовий рахунок!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end
    else begin
      if not NoBlankValues([edtENDepartment]) then
      begin
        Application.MessageBox(PChar('Вкажіть, будь ласка, підрозділ!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
        Action := caNone;
        Exit;
      end;

      if servicesObjectCode = LOW_INT then
        raise Exception.Create('Не заданий код Послуги на сторону!');

      if (departmentCode = LOW_INT) or (edtENDepartment.Text = '') then
      begin
        edtENDepartment.SetFocus;
        raise Exception.Create('Не заданий підрозділ!');
      end;

      personalAccountEIC := cbbEIC.Text;

      if (personalAccountCode = LOW_INT) or (personalAccountNumber = '') then
        raise Exception.Create('Помилка при визначенні особового рахунку! ' +
                               'Спочатку натисніть кнопку "Отримати дані за особовим рахунком"!');

      if DMReports.isEICRequired(servicesObjectCode) then
      begin
        if Length(Trim(personalAccountEIC)) = 0 then begin
          if (cbbEIC.Items.Count > 0) and (cbbEIC.ItemIndex = -1)  then begin
            raise Exception.Create('Оберіть EIC для особового рахунку!');
          end else begin
            raise Exception.Create('Не знайдено код EIC для особового рахунку у програмі Energy або EnergyPro!');
          end;
        end;
      end;

      TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      TempENServicesObject.updatePersonalAccount(
        servicesObjectCode, personalAccountCode, personalAccountNumber, personalAccountEIC, personalAccountUid);
    end;
end;


procedure TfrmPersonalAccountForServicesObjectEdit.FormCreate(Sender: TObject);
begin
  inherited;

  departmentCode := LOW_INT;

  personalAccountCode := LOW_INT;
  personalAccountNumber := '';
  personalAccountUid := '';

  servicesObjectCode := LOW_INT;
end;


procedure TfrmPersonalAccountForServicesObjectEdit.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  eic: WideString;
begin

  DisableControls([edtENDepartment, spbENDepartment, cbbEIC]);
  toggleEICButton;

  if servicesObjectCode = LOW_INT then
    raise Exception.Create('Не заданий код Послуги на сторону!');

  DenyBlankValues([edtPersonalAccountNumber, edtENDepartment]);

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(servicesObjectCode);

  if servicesObject = nil then
    raise Exception.Create('Не знайдено Послугу на сторону з кодом ' + IntToStr(servicesObjectCode) + ' !');



  if servicesObject.department <> nil then
  begin
    departmentCode := servicesObject.department.code;
    edtENDepartment.Text := servicesObject.department.name;
  end;

  if servicesObject.personalAccountCode <> LOW_INT then
  begin
    edtPersonalAccountNumber.Text := servicesObject.personalAccountNumber;

    cbbEIC.Items.Clear;
    if (Length(Trim(servicesObject.codeEIC)) <> 0) then begin
      cbbEIC.Items.Add(servicesObject.codeEIC);
      cbbEIC.ItemIndex := 0;
    end;
    toggleEICButton;


  end
  else begin
    disableEditing(false);
  end;

  // Если подразделение на договоре - ПАТ ЕК "Херсонобленерго", то нужно выбрать РЭС
  if (departmentCode = ENDEPARTMENT_KSOE) or (departmentCode = LOW_INT) then begin
    departmentCode := LOW_INT;
    edtENDepartment.Text := '';
    DisableControls([spbENDepartment], false);
  end else begin
      DisableControls([spbENDepartment]);
  end;
end;

procedure TfrmPersonalAccountForServicesObjectEdit.spbEICClick(Sender: TObject);
var
  filter : CCRecordPointFilter;
  selected : CCRecordPointShort;
  item, strConcat : String;
begin
  inherited;
  if cbbEIC.Items.Count > 0 then begin
    for item in cbbEIC.Items do begin
      if Length(strConcat) <> 0 then strConcat := strConcat + ',';
      strConcat := strConcat + ' ''' + item + '''';
    end;
    filter := CCRecordPointFilter.Create;
    SetNullXSProps(filter);
    SetNullIntProps(filter);
    filter.conditionSQL := 'EIC in (' + strConcat + ')';
    selected := TfrmCCRecordPointShowLite.chooseFromList(filter);
    if (Assigned(selected)) and (Length(Trim(selected.eiccode)) > 0)
    then begin
      cbbEIC.ItemIndex := cbbEIC.Items.IndexOf(selected.eiccode);
    end;
  end;


end;

procedure TfrmPersonalAccountForServicesObjectEdit.spbENDepartmentClick(
  Sender: TObject);
var
  frmENDepartmentShow: TfrmENDepartmentShow;
  f: ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  f.code := 1;

  frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
  try
    frmENDepartmentShow.isShowAll := true;
    with frmENDepartmentShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          departmentCode := ENDepartmentShort(tvDep.Selected.Data).code;
          edtENDepartment.Text := ENDepartmentShort(tvDep.Selected.Data).shortName;

          personalAccountCode := LOW_INT;
          personalAccountNumber := '';
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENDepartmentShow.Free;
  end;
end;

end.
