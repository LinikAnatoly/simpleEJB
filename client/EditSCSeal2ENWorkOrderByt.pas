unit EditSCSeal2ENWorkOrderByt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls, ComCtrls,
  Buttons, ENMetrologyCounterController, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, ActnList, TB2Item, TB2Dock, TB2Toolbar;

type
  TfrmSCSeal2ENWorkOrderBytEdit = class(TDialogForm)
    gbParameters: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    lblAccount: TLabel;
    lblStorageZoneName: TLabel;
    spbStorageZoneName: TSpeedButton;
    spbStorageZoneNameClear: TSpeedButton;
    edtInvNumber: TEdit;
    edtSerialNumber: TEdit;
    edtName: TEdit;
    dtpDateIn: TDateTimePicker;
    btnSearch: TButton;
    cbAccount: TComboBox;
    edtStorageZoneName: TEdit;
    sgSeals: TAdvStringGrid;
    HTTPRIOENMetrologyCounter: THTTPRIO;
    lblMOL: TLabel;
    edtMOLCode: TEdit;
    edtMOLName: TEdit;
    spbMOLName: TSpeedButton;
    lblSealsCountForWorkOrderByt: TLabel;
    UpDown1: TUpDown;
    edtSealsCountAdditional: TEdit;
    edtSealsCountForWorkOrderByt: TEdit;
    lblSealsCountAdditional: TLabel;
    lblSealsCountTotal: TLabel;
    edtSealsCountTotal: TEdit;
    btnBindSeals: TBitBtn;
    btnCancel: TButton;
    btnSelect: TButton;
    lblSealsCountSelected: TLabel;
    edtSealsCountSelected: TEdit;
    Label1: TLabel;
    sgSealsReserved: TAdvStringGrid;
    Label2: TLabel;
    HTTPRIOENWorkOrderByt: THTTPRIO;
    HTTPRIOSCSeal: THTTPRIO;
    tbActions: TTBToolbar;
    TBItem7: TTBItem;
    ActionList1: TActionList;
    actDelete: TAction;
    ImageList1: TImageList;
    rdbSeals: TRadioButton;
    rdbIndicators: TRadioButton;
    rdbHolograms: TRadioButton;
    chbCheckAll: TCheckBox;
    chbNoBindingToPlans: TCheckBox;
    HTTPRIOSCMol: THTTPRIO;
    lblSealsReservedCount: TLabel;
    procedure spbMOLNameClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure spbStorageZoneNameClick(Sender: TObject);
    procedure spbStorageZoneNameClearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSealsCountAdditionalChange(Sender: TObject);
    procedure sgSealsCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btnSelectClick(Sender: TObject);
    procedure btnBindSealsClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure rdbSealsClick(Sender: TObject);
    procedure chbCheckAllClick(Sender: TObject);
    procedure edtMOLCodeExit(Sender: TObject);
  private
    { Private declarations }
    zoneCode: Integer;
    sealFilter: ENMetrologyCounterFilter;
    molCode: String;
    procedure UpdateSealsList;
    procedure UpdateSealsReservedList;
    procedure calculateSealsCountForWorkOrderByt();
    procedure calculateSealsCountTotal();
    procedure calculateSealsCountSelected();
  public
    { Public declarations }
    workOrderBytCode: Integer;
    workOrderBytType: Integer;
    //sealsCount: Integer;
    isBindingByFact: Boolean;
  end;

var
  frmSCSeal2ENWorkOrderBytEdit: TfrmSCSeal2ENWorkOrderBytEdit;

implementation

uses SCMolController, ShowSCMol, ChildFormUnit, GridHeadersUnit, XSBuiltIns,
  RQStorageZoneController, ShowRQStorageZone, ENConsts,
  ENWorkOrderBytController, SCSealController, DMReportsUnit;

{$R *.dfm}

var
  ENSealHeaders: array [1..12] of String =
        ( 'Код'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Вартість'
          ,'код зі ScanCounter'
          ,'Місце зберігання'
        );

procedure TfrmSCSeal2ENWorkOrderBytEdit.actDeleteExecute(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i, sealCode, sealsCount: Integer;
  state: Boolean;
  scObj: ENMetrologyCounterShort;
  sealCodesArr: ENWorkOrderBytController.ArrayOfInteger;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''яку обраних пломб до Змінного завдання ?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  if workOrderBytCode = LOW_INT then
    raise Exception.Create('Не задано код Змінного завдання!');

  for i := 1 to sgSealsReserved.RowCount - 1 do
  begin
    sgSealsReserved.GetCheckBoxState(1, i, state);
    if state then break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Не обрано жодної пломби!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  sealsCount := 0;

  for i := 1 to sgSealsReserved.RowCount - 1 do
  begin
    sgSealsReserved.GetCheckBoxState(1, i, state);

    if state then
    begin
      try
        sealCode := StrToInt(sgSealsReserved.Cells[0, i]);
      except on EConvertError do
        continue;
      end;

      sealsCount := sealsCount + 1;
      SetLength(sealCodesArr, sealsCount);
      sealCodesArr[sealsCount - 1] := sealCode;
    end;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

  if isBindingByFact then
    TempENWorkOrderByt.removeSealsByFact(workOrderBytCode, sealCodesArr)
  else
    TempENWorkOrderByt.removeSeals(workOrderBytCode, sealCodesArr);

  chbCheckAll.Checked := false;

  UpdateSealsList;
  UpdateSealsReservedList;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.btnBindSealsClick(Sender: TObject);
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i, sealsCount, accountingTypeCode: Integer;
  state: Boolean;
  scObj: ENMetrologyCounterShort;
  sealsArr: ArrayOfENMetrologyCounterShort;
  noBindingToPlans: Boolean;
begin
  if workOrderBytCode = LOW_INT then
    raise Exception.Create('Не задано код Змінного завдання!');

  if workOrderBytType = LOW_INT then
    raise Exception.Create('Не задано тип Змінного завдання!');

  for i := 1 to sgSeals.RowCount - 1 do
  begin
    sgSeals.GetCheckBoxState(1, i, state);
    if state then break;
  end;

  if not state then
  begin
    Application.MessageBox(PChar('Не обрано жодної пломби для видачі!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if rdbSeals.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_SEAL
  else if rdbIndicators.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_IMP
  else if rdbHolograms.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_HOLO
  else begin
    Application.MessageBox(PChar('Оберіть тип об''єкту (пломба/індикатор/голограма)!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  sealsCount := 0;
  noBindingToPlans := chbNoBindingToPlans.Checked;

{
        ( 'Код'
          ,'Серійний номер'
          ,'Найменування'
          ,'Інв. номер'
          ,'Рахунок'
          ,'Підрозділ'
          ,'Код МВО'
          ,'Дата приходу'
          ,'Дата випуску'
          ,'Вартість'
          ,'код зі ScanCounter'
          ,'Місце зберігання'
        );
}
  for i := 1 to sgSeals.RowCount - 1 do
  begin
    sgSeals.GetCheckBoxState(1, i, state);
    if state then
    begin
      scObj := ENMetrologyCounterShort.Create;
      SetNullIntProps(scObj);
      SetNullXSProps(scObj);

      scObj.buildNumber := sgSeals.Cells[1, i];
      scObj.name := sgSeals.Cells[2, i];
      scObj.invNumber := sgSeals.Cells[3, i];
      scObj.account := sgSeals.Cells[4, i];
      scObj.departmetFKCode := sgSeals.Cells[5, i];
      scObj.molCode := sgSeals.Cells[6, i];

      if sgSeals.Cells[7, i] <> '' then
      begin
        scObj.dateIn := TXSDate.Create;
        scObj.dateIn.XSToNative(GetXSDate(StrToDate(sgSeals.Cells[7, i])))
      end;

      if sgSeals.Cells[8, i] <> '' then
      begin
        scObj.dateBuild := TXSDate.Create;
        scObj.dateBuild.XSToNative(GetXSDate(StrToDate(sgSeals.Cells[8, i])));
      end;

      scObj.cost := TXSDecimal.Create;
      scObj.cost.DecimalString := sgSeals.Cells[9, i];

      scObj.scCode := StrToInt(sgSeals.Cells[10, i]);
      //scObj.counterType := sgSeals.Cells[12, i];

      //scObj.element := ENElement.Create;
      //scObj.element.code := estimateCode;

      scObj.zoneRefCode := Integer(sgSeals.Objects[1, i]);

      scObj.typeObject := Integer(sgSeals.Objects[0, i]);

      sealsCount := sealsCount + 1;
      SetLength(sealsArr, sealsCount);
      sealsArr[sealsCount - 1] := scObj;
    end;
  end;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

  if workOrderBytType = ENWORKORDERBYTTYPE_BY_ENERGYNET then
  begin
    if isBindingByFact then
      TempENWorkOrderByt.addSealsByFact(workOrderBytCode, sealsArr, accountingTypeCode, noBindingToPlans)
    else
      TempENWorkOrderByt.addSeals(workOrderBytCode, sealsArr, accountingTypeCode, noBindingToPlans);
  end
  else if workOrderBytType = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
  begin
    if isBindingByFact then
      TempENWorkOrderByt.addSealsForRaidByFact(workOrderBytCode, sealsArr, accountingTypeCode, noBindingToPlans)
    else
      TempENWorkOrderByt.addSealsForRaid(workOrderBytCode, sealsArr, accountingTypeCode, noBindingToPlans);
  end
  else
    raise Exception.Create('Невідомий тип Змінного завдання!');

  UpdateSealsList;
  UpdateSealsReservedList;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.btnSearchClick(Sender: TObject);
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  ENMetrologyCounterList: ENMetrologyCounterShortList;
  conditionSQL: String;
  typeObject: Integer;
begin
{28.10.2011 проверка на выбранный счет}
{
if (cbAccount.ItemIndex = -1) then
begin
     MessageBox(0, PCHAR('Оберить рахунок!'),
'Error', +mb_OK +mb_ICONERROR);
  exit;
end;
}
  if (edtMOLCode.Text = '') or (edtMOLName.Text = '') then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть МВО!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    edtMOLCode.SetFocus;
    Exit;
  end;

  TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  sealFilter := ENMetrologyCounterFilter.Create;
  SetNullIntProps(sealFilter);
  SetNullXSProps(sealFilter);

  sealFilter.molCode := edtMOLCode.Text;

  conditionSQL := '';

  // что бы не брали один и тотже ... + залоченые ;)
  AddCondition(conditionSQL, ' nvl(a.energy_lock, -1) < 0 ');

  if rdbSeals.Checked then
    typeObject := SCSEALTYPE_SEAL
  else if rdbIndicators.Checked then
    typeObject := SCSEALTYPE_IMP
  else if rdbHolograms.Checked then
    typeObject := SCSEALTYPE_HOLO
  else begin
    Application.MessageBox(PChar('Оберіть тип об''єкту (пломба/індикатор/голограма)!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  AddCondition(conditionSQL, ' a.type_object = ' + IntToStr(typeObject));

  // Пока берем только счет {2071} 2013
  //sealFilter.account := '2071'; //cbAccount.Text;
  sealFilter.account := '2013';

  {
  if dtpDateIn.Checked then
  begin
    sealFilter.dateIn := TXSDate.Create;
    sealFilter.dateIn.XSToNative(GetXSDate(dtpDateIn.DateTime));
  end;
  }

  if edtSerialNumber.Text <> '' then
    sealFilter.buildNumber := edtSerialNumber.Text;

  if edtInvNumber.Text <> '' then
    sealFilter.invNumber := edtInvNumber.Text;

  if edtName.Text <> '' then
    sealFilter.name := edtName.Text;

  if zoneCode > LOW_INT then
  begin
    sealFilter.zoneRef := RQStorageZoneRef.Create;
    sealFilter.zoneRef.code := zoneCode;
  end;

  sealFilter.conditionSQL := conditionSQL;

  UpdateSealsList;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.btnSelectClick(Sender: TObject);
var i, sealsCountTotal: Integer;
begin
  sealsCountTotal := 0;

  CheckGrid(sgSeals, 1, false);

  try
    sealsCountTotal := Round(StrToFloat(edtSealsCountTotal.Text));
  except on EConvertError do
    sealsCountTotal := 0;
  end;

  if sealsCountTotal <= 0 then Exit;

  // Чекаем (от слова "check", а не "ждем" по-украински, как некоторые могли подумать ;))
  // столько строк в гриде, сколько нам нужно выдать пломб (подряд, начиная с первой)
  for i := 1 to sgSeals.RowCount - 1 do
  begin
    if i <= sealsCountTotal then
      sgSeals.SetCheckBoxState(1, i, true)
    else
      break;
  end;

  calculateSealsCountSelected();
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.calculateSealsCountForWorkOrderByt();
var accountingTypeCode: Integer;
begin
  if rdbSeals.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_SEAL
  else if rdbIndicators.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_IMP
  else if rdbHolograms.Checked then
    accountingTypeCode := TK_ACCOUNTINGTYPE_HOLO
  else
    raise Exception.Create('Оберіть тип об''єкту (пломба/індикатор/голограма)!');

  if isBindingByFact then
    edtSealsCountForWorkOrderByt.Text := IntToStr(DMReports.getSealsCountForWorkOrderBytByFact(workOrderBytCode, accountingTypeCode))
  else
    edtSealsCountForWorkOrderByt.Text := IntToStr(DMReports.getSealsCountForWorkOrderByt(workOrderBytCode, accountingTypeCode));
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.calculateSealsCountSelected();
var
  i, sealsCountSelected: Integer;
  state: Boolean;
begin
  sealsCountSelected := 0;

  for i := 1 to sgSeals.RowCount - 1 do
  begin
    sgSeals.GetCheckBoxState(1, i, state);
    if state then
      inc(sealsCountSelected);
  end;

  edtSealsCountSelected.Text := IntToStr(sealsCountSelected);
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.calculateSealsCountTotal();
var sealsCountForWorkOrderByt, sealsCountAdditional, sealsCountTotal: Integer;
begin
  try
    sealsCountForWorkOrderByt := Round(StrToFloat(edtSealsCountForWorkOrderByt.Text));
  except on EConvertError do
    sealsCountForWorkOrderByt := 0;
  end;

  try
    sealsCountAdditional := Round(StrToFloat(edtSealsCountAdditional.Text));
  except on EConvertError do
    sealsCountAdditional := 0;
  end;

  sealsCountTotal := sealsCountForWorkOrderByt + sealsCountAdditional;

  edtSealsCountTotal.Text := IntToStr(sealsCountTotal);
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.chbCheckAllClick(Sender: TObject);
begin
  CheckGrid(sgSealsReserved, 1, chbCheckAll.Checked);
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.edtMOLCodeExit(Sender: TObject);
var
  TempSCMol: SCMolControllerSoapPort;
  SCMolList: SCMolShortList;
  molFilter: SCMolFilter;
begin
  if edtMOLCode.Text = molCode then
    Exit;

  molFilter := SCMolFilter.Create;
  SetNullXSProps(molFilter);
  SetNullIntProps(molFilter);

  molFilter.kod_mol := edtMOLCode.Text;
  molCode := edtMOLCode.Text;

  TempSCMol := HTTPRIOSCMol as SCMolControllerSoapPort;

  SCMolList := TempSCMol.getScrollableFilteredList(molFilter, 0, -1);

  if SCMolList.totalCount > 0 then
    edtMOLName.Text := SCMolList.list[0].name_mol
  else
    edtMOLName.Text := '';
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.edtSealsCountAdditionalChange(
  Sender: TObject);
begin
  calculateSealsCountTotal();
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.FormCreate(Sender: TObject);
begin
  zoneCode := LOW_INT;
  //sealsCount := LOW_INT;
  workOrderBytCode := LOW_INT;
  workOrderBytType := LOW_INT;
  sealFilter := nil;
  isBindingByFact := false;
  molCode := '';
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(sealFilter) then
    sealFilter.Free;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  //inherited;

  if Key = VK_ESCAPE then
    Exit;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENSealHeaders, sgSeals.ColumnHeaders);
  SetGridHeaders(ENSealHeaders, sgSealsReserved.ColumnHeaders);

  DisableControls([{edtMOLCode, }edtMOLName, edtStorageZoneName,
                   edtSealsCountForWorkOrderByt, edtSealsCountTotal, edtSealsCountSelected]);
  DenyBlankValues([edtMOLCode, edtMOLName,
                   edtSealsCountForWorkOrderByt, edtSealsCountAdditional,
                   edtSealsCountTotal, edtSealsCountSelected]);

  SetIntStyle(edtSealsCountAdditional);

  if workOrderBytCode = LOW_INT then
    raise Exception.Create('Не задано код Змінного завдання!');

  //edtSealsCountForWorkOrderByt.Text := IntToStr(sealsCount);
  calculateSealsCountForWorkOrderByt();
  calculateSealsCountTotal();
  edtSealsCountSelected.Text := '0';

  UpdateSealsReservedList;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.rdbSealsClick(Sender: TObject);
begin
  calculateSealsCountForWorkOrderByt();
  calculateSealsCountTotal();

  ClearGrid(sgSeals);
  calculateSealsCountSelected();
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.sgSealsCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  calculateSealsCountSelected();
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.spbMOLNameClick(Sender: TObject);
var
  molFilter: SCMolFilter;
  frmSCMolShow: TfrmSCMolShow;
  {molCode, }molName: String;
begin
  molFilter := SCMolFilter.Create;
  SetNullXSProps(molFilter);
  SetNullIntProps(molFilter);

  frmSCMolShow := TfrmSCMolShow.Create(Application, fmNormal, molFilter);
  try
    with frmSCMolShow do
    begin
      DisableActions([actEdit, actInsert, actDelete]);
      if ShowModal = mrOk then
      begin
        molCode := GetReturnValue(sgSCMol,0);
        molName := GetReturnValue(sgSCMol,2);

        edtMolName.Text := molName;
        edtMolCode.Text := molCode;
      end;
    end;
  finally
    frmSCMolShow.Free;
  end;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.spbStorageZoneNameClearClick(
  Sender: TObject);
begin
  edtStorageZoneName.Text := '';
  zoneCode := LOW_INT;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.spbStorageZoneNameClick(
  Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin
  if edtMOLCode.Text = '' then
  begin
    Application.MessageBox(PChar('Спочатку вкажіть МВО!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.conditionSQL :=
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + edtMOLCode.Text + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtStorageZoneName.Text := GetReturnValue(sgRQStorageZone, 2);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;

procedure TfrmSCSeal2ENWorkOrderBytEdit.UpdateSealsList;
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  sealList: ENMetrologyCounterShortList;
  i: Integer;
begin
  ClearGrid(sgSeals);
  calculateSealsCountSelected();

  if sealFilter = nil then Exit;

  TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  sealList := TempENMetrologyCounter.getSealsList(sealFilter, 0, -1);

  if High(sealList.list) > -1 then
    sgSeals.RowCount := High(sealList.list) + 2
  else
    sgSeals.RowCount := 2;

  with sgSeals do
    for i := 0 to High(sealList.list) do
    begin
      Application.ProcessMessages;

      if sealList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(sealList.list[i].code)
      else
        Cells[0,i+1] := '';

      //Cells[1,i+1] := sealList.list[i].invNumber;
      Cells[1,i+1] := sealList.list[i].buildNumber;

      AddCheckBox(1, i+1, false, false);

      Cells[2,i+1] := sealList.list[i].name;
      //Cells[3,i+1] := sealList.list[i].buildNumber;
      Cells[3,i+1] := sealList.list[i].invNumber;
      Cells[4,i+1] := sealList.list[i].account;
      Cells[5,i+1] := sealList.list[i].departmetFKCode;
      Cells[6,i+1] := sealList.list[i].molCode;

      if sealList.list[i].dateIn = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := XSDate2String(sealList.list[i].dateIn);
      if sealList.list[i].dateBuild = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSDate2String(sealList.list[i].dateBuild);

      if sealList.list[i].cost = nil then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := sealList.list[i].cost.DecimalString;

      if sealList.list[i].scCode = Low(Integer) then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := IntToStr(sealList.list[i].scCode);

      Cells[11,i+1] := sealList.list[i].zoneRefName;
      //Cells[12,i+1] := sealList.list[i].counterType;

      Objects[0, i+1] := TObject(sealList.list[i].typeObject);
      Objects[1, i+1] := TObject(sealList.list[i].zoneRefCode);

      sgSeals.RowCount := i + 2;
    end;

  sgSeals.Row := 1;
end;

(*
procedure TfrmSCSeal2ENWorkOrderBytEdit.UpdateSealsReservedList;
var
  TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  sealsReservedFilter: ENMetrologyCounterFilter;
  sealList: ENMetrologyCounterShortList;

  TempSCSeal: SCSealControllerSoapPort;
  scSealFilterObj: SCSealFilter;
  scSealObj: SCSeal;
  scSealArr: SCSealController.ArrayOfInteger; //SCSealShortList;
  strSCCodes: String;

  i: Integer;
begin
  ClearGrid(sgSealsReserved);

  scSealFilterObj := SCSealFilter.Create;
  SetNullIntProps(scSealFilterObj);
  SetNullXSProps(scSealFilterObj);

  scSealFilterObj.conditionSQL :=
    ' code in ' +
    ' ( ' +
    '    select swb.sealrefcode ' +
    '      from scseal2enworkorderbyt swb ' +
    '     where swb.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    ') ';

  TempSCSeal := HTTPRIOSCSeal as SCSealControllerSoapPort;

  scSealArr := TempSCSeal.getScrollableFilteredCodeArray(scSealFilterObj, 0, -1);

  if High(scSealArr) < 0 then Exit;

  strSCCodes := '';

  for i := 0 to High(scSealArr) do
  begin
    scSealObj := TempSCSeal.getObject(scSealArr[i]);
    AddListPos(strSCCodes, IntToStr(scSealObj.scCode));
  end;

  if strSCCodes = '' then Exit;

  sealsReservedFilter := ENMetrologyCounterFilter.Create;
  SetNullIntProps(sealsReservedFilter);
  SetNullXSProps(sealsReservedFilter);

  sealsReservedFilter.conditionSQL := 'a.num_un in (' + strSCCodes + ')';

  TempENMetrologyCounter := HTTPRIOENMetrologyCounter as ENMetrologyCounterControllerSoapPort;

  sealList := TempENMetrologyCounter.getSealsList(sealsReservedFilter, 0, -1, true);

  if High(sealList.list) > -1 then
    sgSealsReserved.RowCount := High(sealList.list) + 2
  else
    sgSealsReserved.RowCount := 2;

  with sgSealsReserved do
    for i := 0 to High(sealList.list) do
    begin
      Application.ProcessMessages;

      if sealList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(sealList.list[i].code)
      else
        Cells[0,i+1] := '';

      //Cells[1,i+1] := sealList.list[i].invNumber;
      Cells[1,i+1] := sealList.list[i].buildNumber;

      AddCheckBox(1, i+1, false, false);

      Cells[2,i+1] := sealList.list[i].name;
      //Cells[3,i+1] := sealList.list[i].buildNumber;
      Cells[3,i+1] := sealList.list[i].invNumber;
      Cells[4,i+1] := sealList.list[i].account;
      Cells[5,i+1] := sealList.list[i].departmetFKCode;
      Cells[6,i+1] := sealList.list[i].molCode;

      if sealList.list[i].dateIn = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := XSDate2String(sealList.list[i].dateIn);
      if sealList.list[i].dateBuild = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSDate2String(sealList.list[i].dateBuild);

      if sealList.list[i].cost = nil then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := sealList.list[i].cost.DecimalString;

      if sealList.list[i].scCode = Low(Integer) then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := IntToStr(sealList.list[i].scCode);

      Cells[11,i+1] := sealList.list[i].zoneRefName;
      //Cells[12,i+1] := sealList.list[i].counterType;

      Objects[0, i+1] := TObject(sealList.list[i].typeObject);
      Objects[1, i+1] := TObject(sealList.list[i].zoneRefCode);

      sgSealsReserved.RowCount := i + 2;
    end;

  sgSealsReserved.Row := 1;
end;
*)

procedure TfrmSCSeal2ENWorkOrderBytEdit.UpdateSealsReservedList;
var
  //TempENMetrologyCounter: ENMetrologyCounterControllerSoapPort;
  //sealsReservedFilter: ENMetrologyCounterFilter;
  //sealList: ENMetrologyCounterShortList;

  TempSCSeal: SCSealControllerSoapPort;
  scSealFilterObj: SCSealFilter;
  //scSealObj: SCSeal;
  //scSealArr: SCSealController.ArrayOfInteger; //SCSealShortList;
  sealList: SCSealShortList;
  //strSCCodes: String;

  i, scSeal2WorkOrderBytKind: Integer;
begin
  ClearGrid(sgSealsReserved);

  lblSealsReservedCount.Caption := 'Усього:  0';

  if isBindingByFact then
    scSeal2WorkOrderBytKind := SCSEAL2WORKORDERBYTKIND_FACT
  else
    scSeal2WorkOrderBytKind := SCSEAL2WORKORDERBYTKIND_PLAN;

  scSealFilterObj := SCSealFilter.Create;
  SetNullIntProps(scSealFilterObj);
  SetNullXSProps(scSealFilterObj);

  scSealFilterObj.conditionSQL :=
    ' code in ' +
    ' ( ' +
    '    select swb.sealrefcode ' +
    '      from scseal2enworkorderbyt swb ' +
    '     where swb.workorderbytrefcode = ' + IntToStr(workOrderBytCode) +
    '       and swb.kindrefcode = ' + IntToStr(scSeal2WorkOrderBytKind) +
    ') ';

  scSealFilterObj.orderBySQL := 'buildnumber';

  TempSCSeal := HTTPRIOSCSeal as SCSealControllerSoapPort;

  //scSealArr := TempSCSeal.getScrollableFilteredCodeArray(scSealFilterObj, 0, -1);
  sealList := TempSCSeal.getScrollableFilteredList(scSealFilterObj, 0, -1);

  if High(sealList.list) > -1 then
    sgSealsReserved.RowCount := High(sealList.list) + 2
  else
    sgSealsReserved.RowCount := 2;

  with sgSealsReserved do
    for i := 0 to High(sealList.list) do
    begin
      Application.ProcessMessages;

      if sealList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(sealList.list[i].code)
      else
        Cells[0,i+1] := '';

      //Cells[1,i+1] := sealList.list[i].invNumber;
      Cells[1,i+1] := sealList.list[i].buildNumber;

      AddCheckBox(1, i+1, false, false);

      Cells[2,i+1] := sealList.list[i].name;
      //Cells[3,i+1] := sealList.list[i].buildNumber;
      Cells[3,i+1] := sealList.list[i].invNumber;
      Cells[4,i+1] := sealList.list[i].account;
      Cells[5,i+1] := sealList.list[i].departmetFKCode;
      Cells[6,i+1] := sealList.list[i].molCode;

      if sealList.list[i].dateIn = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := XSDate2String(sealList.list[i].dateIn);
      if sealList.list[i].dateBuild = nil then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := XSDate2String(sealList.list[i].dateBuild);

      if sealList.list[i].cost = nil then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := sealList.list[i].cost.DecimalString;

      if sealList.list[i].scCode = Low(Integer) then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := IntToStr(sealList.list[i].scCode);

      Cells[11,i+1] := sealList.list[i].zoneRefName;
      //Cells[12,i+1] := sealList.list[i].counterType;

      Objects[0, i+1] := TObject(sealList.list[i].typeRefCode);
      Objects[1, i+1] := TObject(sealList.list[i].zoneRefCode);

      sgSealsReserved.RowCount := i + 2;
    end;

  sgSealsReserved.Row := 1;

  lblSealsReservedCount.Caption := 'Усього:  ' + IntToStr(High(sealList.list) + 1);
end;

end.
