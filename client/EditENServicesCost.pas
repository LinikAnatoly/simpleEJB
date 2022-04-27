unit EditENServicesCost;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesCostController
  , AdvObj, TKCalcCostController, ENServicesTransportController
  , TKClassificationTypeController;

type
  TfrmENServicesCostEdit = class(TDialogForm)


  HTTPRIOENServicesCost: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcENServicesCost: TPageControl;
    tsMain: TTabSheet;
    lblLimitedSum: TLabel;
    lblCostWithVAT: TLabel;
    lblCostVAT: TLabel;
    lblCostWithoutVAT: TLabel;
    lblCalculationCost: TLabel;
    lblNormIncome: TLabel;
    lblTotalExpenses: TLabel;
    lblProductionExpenses: TLabel;
    lblDirectExpenses: TLabel;
    lblSocialCharges: TLabel;
    lblSalaryExpenses: TLabel;
    lblDeliveryCost: TLabel;
    lblTransportExpenses: TLabel;
    lblMaterialExpenses: TLabel;
    lblDateGen: TLabel;
    edtLimitedSum: TEdit;
    edtCostWithVAT: TEdit;
    edtCostVAT: TEdit;
    edtCostWithoutVAT: TEdit;
    edtCalculationCost: TEdit;
    edtNormIncome: TEdit;
    edtTotalExpenses: TEdit;
    edtProductionExpenses: TEdit;
    edtDirectExpenses: TEdit;
    edtSocialCharges: TEdit;
    edtSalaryExpenses: TEdit;
    edtDeliveryCost: TEdit;
    edtTransportExpenses: TEdit;
    edtMaterialExpenses: TEdit;
    edtDateGen: TDateTimePicker;
    tsENServicesMaterials: TTabSheet;
    sgENServicesMaterials: TAdvStringGrid;
    tsENServicesHumenSalary: TTabSheet;
    sgENServicesHumenSalary: TAdvStringGrid;
    tsENServicesTransport: TTabSheet;
    sgENServicesTransport: TAdvStringGrid;
    tsENServicesDelivery: TTabSheet;
    sgENServicesDelivery: TAdvStringGrid;
    lblCountGen: TLabel;
    edtCountGen: TEdit;
    lblCode: TLabel;
    edtCode: TEdit;
    HTTPRIOENServicesMaterials: THTTPRIO;
    HTTPRIOENServicesHumenSalary: THTTPRIO;
    HTTPRIOENServicesTransport: THTTPRIO;
    HTTPRIOENServicesDelivery: THTTPRIO;
    tsAddInfo: TTabSheet;
    spbTKClassificationType: TSpeedButton;
    edtTKClassificationTypeName: TEdit;
    lblKarta: TLabel;
    edtTKClassificationTypeKod: TEdit;
    lblTKClassificationTypeKod: TLabel;
    lblAddInfoCountGen: TLabel;
    edtAddInfoCountGen: TEdit;
    gbTKCalcCost: TGroupBox;
    lblAddInfoSumWithVAT: TLabel;
    lblAddInfoSumVAT: TLabel;
    lblAddInfoSumWithoutVAT: TLabel;
    edtAddInfoSumVAT: TEdit;
    edtAddInfoSumWithVAT: TEdit;
    edtAddInfoSumWithoutVAT: TEdit;
    gbAddInfoTransport: TGroupBox;
    lblAddInfoMachineHoursCountGen: TLabel;
    lblAddInfoDistance: TLabel;
    edtAddInfoMachineHoursCountGen: TEdit;
    edtAddInfoDistance: TEdit;
    edtAddInfoDateGen: TDateTimePicker;
    lblAddInfoDateGen: TLabel;
    HTTPRIOTKCalcCost: THTTPRIO;
    tbENServicesCost: TToolBar;
    tbAddENServicesCost: TToolButton;
    actListENServicesCost: TActionList;
    actEditENServicesTransport: TAction;
    ImageList1: TImageList;
    actViewENServicesMaterials: TAction;
    actEditENServicesMaterials: TAction;
    actAddENServicesMaterials: TAction;
    actDeleteENServicesMaterials: TAction;
    ToolBar1: TToolBar;
    btnViewENServicesMaterials: TToolButton;
    btnAddENServicesMaterials: TToolButton;
    btnEditENServicesMaterials: TToolButton;
    btnDeleteENServicesMaterials: TToolButton;
    tsOthers: TTabSheet;
    btnTKCalcCost: TButton;
    HTTPRIOTKClassificationType: THTTPRIO;
    btnTKClassificationType: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateENServicesMaterials;
  procedure updateENServicesTransport;
  procedure updateENServicesHumenSalary;
  procedure updateENServicesDelivery;
  procedure pcENServicesCostChange(Sender: TObject);
  procedure spbTKClassificationTypeClick(Sender: TObject);
	function getTransportListByServicesCost : ENServicesTransportShortList;
  procedure openENServicesMaterialsEditForm(DialogState : TDialogState);
  procedure openENServicesHumenSalaryEditForm(DialogState : TDialogState);
  procedure openENServicesTransportEditForm(DialogState : TDialogState);
  procedure openENServicesDeliveryEditForm(DialogState : TDialogState);
    procedure sgENServicesDeliveryDblClick(Sender: TObject);
    procedure sgENServicesTransportDblClick(Sender: TObject);
    procedure sgENServicesHumenSalaryDblClick(Sender: TObject);
    procedure sgENServicesMaterialsDblClick(Sender: TObject);
    procedure actEditENServicesTransportExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actViewENServicesMaterialsExecute(Sender: TObject);
    procedure actEditENServicesMaterialsExecute(Sender: TObject);
    procedure actAddENServicesMaterialsExecute(Sender: TObject);
    procedure actDeleteENServicesMaterialsExecute(Sender: TObject);
    procedure btnTKClassificationTypeClick(Sender: TObject);
    procedure btnTKCalcCostClick(Sender: TObject);
  private
  isLicensed : Integer;
  oldDate : TXSDate;
    { Private declarations }
  function getTKCalcCostByClassificationTypeAndDate(cls : TKClassificationTypeShort;
      date : TXSDate; showWarningIfNotFound : Boolean) : TKCalcCost;
	procedure RefreshObject;
  public
     calcCost : TKCalcCost;
	 updateForTransport : Boolean;
    { Public declarations }

end;

var
  frmENServicesCostEdit: TfrmENServicesCostEdit;
  ENServicesCostObj: ENServicesCost;

          ENServicesMaterialsHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування'
          , 'Од. виміру'
          , 'Кількість'
          , 'Сума без ПДВ, грн.'
        );

		ENServicesHumenSalaryHeaders: array [1..5] of String =
        ( 'Код'
          , 'Найменування'
          , 'Витрати робочого часу, нормо-год.'
          , 'Заробітна плата за час роботи, грн.'
          , 'Заробітна плата, грн.'
        );

		ENServicesTransportHeaders: array [1..7] of String =
        ( 'Код'
          , 'Найменування'
		  , 'Робота, мч'
		  , 'Кілометраж, км.'
          , 'Вартість роботи, грн.'
          , 'Варість пробігу, грн.'
          , 'Загальна сума витрат, грн.'
        );

		ENServicesDeliveryHeaders: array [1..5] of String =
        ( 'Код'
          , 'Час знаходження працівників, год.'
          , 'Вартість знаходження працівників, грн.'
          , 'Нарахування, грн.'
          , 'Загальна вартість, грн.'
        );

implementation

uses
  ENServicesMaterialsController
  , ENServicesHumenSalaryController
  , ENServicesDeliveryController
  , ShowTKClassificationType
  , EditENServicesMaterials
  , EditENServicesTransport
  , EditENServicesDelivery
  , EditENServicesHumenSalary
  , EditTKCalcCost, EditTKClassificationType, ENConsts;

{$R *.dfm}

function TfrmENServicesCostEdit.getTKCalcCostByClassificationTypeAndDate(cls : TKClassificationTypeShort;
      date : TXSDate; showWarningIfNotFound : Boolean) : TKCalcCost;
var
  TempTKCalcCost : TKCalcCostControllerSoapPort;
  classificationTypeRef : TKClassificationTypeRef;
  res : TKCalcCost;
begin
  if not Assigned(date) then begin
    Application.MessageBox(PChar('Оберіть дату!'), PChar('Увага')
      , MB_ICONWARNING);
    Result := nil;
    Exit;
  end;
  TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
  classificationTypeRef := TKClassificationTypeRef.Create;
  classificationTypeRef.code := cls.code;
  res := TempTKCalcCost.getObject(classificationTypeRef, date);
  if (showWarningIfNotFound) and (not Assigned(res)) then begin
    Application.MessageBox(PChar(Format('Не знайдено розрахунку для калькуляції № %s на дату %s!'
    , [cls.kod, XSDate2String(date)])), PChar('Увага')
    , MB_ICONWARNING);
  end;
  Result := res;
end;

procedure TfrmENServicesCostEdit.RefreshObject;
var
  TempENServicesCost : ENServicesCostControllerSoapPort;
begin
  TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
  ENServicesCostObj := TempENServicesCost.getObject(ENServicesCostObj.code);
  Self.FormShow(nil);
end;

procedure TfrmENServicesCostEdit.FormShow(Sender: TObject);
var
TempTKClassificationType : TKClassificationTypeControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
calcCost : TKCalcCost;
clsType : TKClassificationType;
begin

  HideControls([lblAddInfoMachineHoursCountGen, edtAddInfoMachineHoursCountGen]);

  DisableControls([edtCode, edtAddInfoSumWithoutVAT, edtAddInfoSumVAT, edtAddInfoSumWithVAT, edtTKClassificationTypeName, edtTKClassificationTypeKod]);
  DisableActions([actEditENServicesTransport, actEditENServicesMaterials
    , actAddENServicesMaterials, actDeleteENServicesMaterials]);
  if DialogState = dsEdit then begin
    DisableControlChildren(tsMain);
    DisableControls([edtCountGen, edtDateGen], false);
	DisableActions([actEditENServicesTransport, actEditENServicesMaterials
      , actAddENServicesMaterials, actDeleteENServicesMaterials], false);
  end;

  tsAddInfo.TabVisible := (DialogState = dsInsert);
  tsOthers.TabVisible := (DialogState <> dsInsert);
  
  tsMain.TabVisible := (DialogState <> dsInsert);
  tsENServicesMaterials.TabVisible := (DialogState <> dsInsert);
  tsENServicesHumenSalary.TabVisible := (DialogState <> dsInsert);
  tsENServicesTransport.TabVisible := (DialogState <> dsInsert);
  tsENServicesDelivery.TabVisible := (DialogState <> dsInsert);
  
  if DialogState = dsInsert then begin
    edtAddInfoDateGen.Checked := True;
    edtAddInfoCountGen.Text := '1';
  end;
  
  if DialogState = dsInsert then begin
//  
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtAddInfoDateGen
      , edtAddInfoCountGen
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
      TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
      calcCost := TempTKCalcCost.getObject(ENServicesCostObj.tkCalcCostRef.code);
      clsType := TempTKClassificationType.getObject(calcCost.classificationTypeRef.code);
      isLicensed := clsType.isnotlicensedactivity;

      edtCode.Text := IntToStr(ENServicesCostObj.code);
      SetDateFieldForDateTimePicker(edtDateGen, ENServicesCostObj.dateGen);
      // oldDate - дата которая была первоначально у этого расчета при редактировании
      oldDate := ENServicesCostObj.dateGen;
    if ( ENServicesCostObj.countGen <> nil ) then
       edtCountGen.Text := ENServicesCostObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( ENServicesCostObj.materialExpenses <> nil ) then
       edtMaterialExpenses.Text := ENServicesCostObj.materialExpenses.decimalString
    else
       edtMaterialExpenses.Text := '';
    if ( ENServicesCostObj.transportExpenses <> nil ) then
       edtTransportExpenses.Text := ENServicesCostObj.transportExpenses.decimalString
    else
       edtTransportExpenses.Text := '';
    if ( ENServicesCostObj.deliveryCost <> nil ) then
       edtDeliveryCost.Text := ENServicesCostObj.deliveryCost.decimalString
    else
       edtDeliveryCost.Text := '';
    if ( ENServicesCostObj.salaryExpenses <> nil ) then
       edtSalaryExpenses.Text := ENServicesCostObj.salaryExpenses.decimalString
    else
       edtSalaryExpenses.Text := '';
    if ( ENServicesCostObj.socialCharges <> nil ) then
       edtSocialCharges.Text := ENServicesCostObj.socialCharges.decimalString
    else
       edtSocialCharges.Text := '';
    if ( ENServicesCostObj.directExpenses <> nil ) then
       edtDirectExpenses.Text := ENServicesCostObj.directExpenses.decimalString
    else
       edtDirectExpenses.Text := '';
    if ( ENServicesCostObj.productionExpenses <> nil ) then
       edtProductionExpenses.Text := ENServicesCostObj.productionExpenses.decimalString
    else
       edtProductionExpenses.Text := '';
    if ( ENServicesCostObj.totalExpenses <> nil ) then
       edtTotalExpenses.Text := ENServicesCostObj.totalExpenses.decimalString
    else
       edtTotalExpenses.Text := '';
    if ( ENServicesCostObj.normIncome <> nil ) then
       edtNormIncome.Text := ENServicesCostObj.normIncome.decimalString
    else
       edtNormIncome.Text := '';
    if ( ENServicesCostObj.calculationCost <> nil ) then
       edtCalculationCost.Text := ENServicesCostObj.calculationCost.decimalString
    else
       edtCalculationCost.Text := '';
    if ( ENServicesCostObj.costWithoutVAT <> nil ) then
       edtCostWithoutVAT.Text := ENServicesCostObj.costWithoutVAT.decimalString
    else
       edtCostWithoutVAT.Text := '';
    if ( ENServicesCostObj.costVAT <> nil ) then
       edtCostVAT.Text := ENServicesCostObj.costVAT.decimalString
    else
       edtCostVAT.Text := '';
    if ( ENServicesCostObj.costWithVAT <> nil ) then
       edtCostWithVAT.Text := ENServicesCostObj.costWithVAT.decimalString
    else
       edtCostWithVAT.Text := '';
  end;
end;



procedure TfrmENServicesCostEdit.pcENServicesCostChange(Sender: TObject);
begin
  inherited;
  if pcENServicesCost.ActivePage = tsENServicesMaterials then begin
    Self.updateENServicesMaterials;
  end else if pcENServicesCost.ActivePage = tsENServicesHumenSalary then begin
    Self.updateENServicesHumenSalary;
  end else if pcENServicesCost.ActivePage = tsENServicesTransport then begin
    Self.updateENServicesTransport;
  end else if pcENServicesCost.ActivePage = tsENServicesDelivery then begin
    Self.updateENServicesDelivery;
  end;
end;

procedure TfrmENServicesCostEdit.sgENServicesDeliveryDblClick(Sender: TObject);
begin
  inherited;
  Self.openENServicesDeliveryEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesCostEdit.sgENServicesHumenSalaryDblClick(Sender: TObject);
begin
  inherited;
  Self.openENServicesHumenSalaryEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesCostEdit.sgENServicesMaterialsDblClick(Sender: TObject);
begin
  inherited;
  actViewENServicesMaterialsExecute(Sender);
end;

procedure TfrmENServicesCostEdit.sgENServicesTransportDblClick(Sender: TObject);
begin
  inherited;
  Self.openENServicesTransportEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesCostEdit.spbTKClassificationTypeClick(Sender: TObject);
var
  dateGen : TXSDate;
begin
  dateGen := GetTXSDateFromTDateTimePicker(edtAddInfoDateGen);
  if dateGen = nil then begin
    Application.MessageBox(PChar('Оберіть дату'), PChar('Повідомлення'), MB_ICONWARNING);
    Exit;
  end;
  inherited;
  TfrmTKClassificationTypeShow.chooseFromListCalculation(procedure(selectedObj : TKClassificationTypeShort)
  begin
       calcCost := getTKCalcCostByClassificationTypeAndDate(selectedObj, dateGen, true);

       if not Assigned(calcCost) then begin
         edtTKClassificationTypeKod.Text := '';
         edtTKClassificationTypeName.Text := '';
         edtAddInfoSumWithoutVAT.Text := '';
         edtAddInfoSumVAT.Text := '';
         edtAddInfoSumWithVAT.Text := '';
		   end else begin
         edtTKClassificationTypeKod.Text := selectedObj.kod;
         edtTKClassificationTypeName.Text := selectedObj.name;
         edtAddInfoSumWithoutVAT.Text := calcCost.costWithoutVAT.DecimalString;
         edtAddInfoSumVAT.Text := calcCost.costVAT.DecimalString;
         edtAddInfoSumWithVAT.Text := calcCost.costWithVAT.DecimalString;

         isLicensed := selectedObj.isnotlicensedactivity;

         // Для услуг по транспорту можно редактировать машиночасы
         HideControls([lblAddInfoMachineHoursCountGen, edtAddInfoMachineHoursCountGen]
         , isLicensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT);
		   end;
  end);
end;

procedure TfrmENServicesCostEdit.actAddENServicesMaterialsExecute(
  Sender: TObject);
begin
  inherited;
  Self.openENServicesMaterialsEditForm(TDialogState.dsInsert);
end;

procedure TfrmENServicesCostEdit.actDeleteENServicesMaterialsExecute(
  Sender: TObject);
var
  TempENServicesMaterials : ENServicesMaterialsControllerSoapPort;
  ObjCode : Integer;
  obj : ENServicesMaterials;
begin
  inherited;
  TempENServicesMaterials := HTTPRIOENServicesMaterials as ENServicesMaterialsControllerSoapPort;
  try
    ObjCode := StrToInt(sgENServicesMaterials.Cells[0,sgENServicesMaterials.Row]);
	obj := TempENServicesMaterials.getObject(ObjCode);
  except on EConvertError do Exit;
  end;
  
  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте видалити матеріал %s?', [obj.materialName])),
                    PChar('Увага!'),MB_ICONQUESTION+MB_YESNO)=IDNO then begin
      Exit;
  end;
  
  TempENServicesMaterials.remove(ObjCode);
  Self.updateENServicesMaterials;
  Self.RefreshObject;
  Application.MessageBox(PChar('Матеріал видалено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmENServicesCostEdit.actEditENServicesMaterialsExecute(
  Sender: TObject);
begin
  inherited;
  Self.openENServicesMaterialsEditForm(TDialogState.dsEdit);
end;

procedure TfrmENServicesCostEdit.actEditENServicesTransportExecute(
  Sender: TObject);
begin
  inherited;
  Self.openENServicesTransportEditForm(TDialogState.dsEdit);
end;

procedure TfrmENServicesCostEdit.actViewENServicesMaterialsExecute(
  Sender: TObject);
begin
  inherited;
  Self.openENServicesMaterialsEditForm(TDialogState.dsView);
end;

procedure TfrmENServicesCostEdit.btnTKCalcCostClick(Sender: TObject);
var
TempTKCalcCost : TKCalcCostControllerSoapPort;
begin
  inherited;
  TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
    TKCalcCostObj := TempTKCalcCost.getObject(ENServicesCostObj.tkCalcCostRef.code);
  try
    frmTKCalcCostEdit := TfrmTKCalcCostEdit.Create(Application, dsView);
    try
      frmTKCalcCostEdit.ShowModal;
    finally
      frmTKCalcCostEdit.Free;
      frmTKCalcCostEdit := nil;
    end;
  finally
    TKCalcCostObj.Free;
  end;
end;

procedure TfrmENServicesCostEdit.btnTKClassificationTypeClick(Sender: TObject);
var
TempTKCalcCost : TKCalcCostControllerSoapPort;
TempTKClassificationType : TKClassificationTypeControllerSoapPort;
calcCost : TKCalcCost;
begin
  inherited;
  TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
    calcCost := TempTKCalcCost.getObject(ENServicesCostObj.tkCalcCostRef.code);
    TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
    TKClassificationTypeObj := TempTKClassificationType.getObject(calcCost.classificationTypeRef.code);
  try
    frmTKClassificationTypeEdit := TfrmTKClassificationTypeEdit.Create(Application, dsView);
    try
      frmTKClassificationTypeEdit.ShowModal;
    finally
      frmTKClassificationTypeEdit.Free;
      frmTKClassificationTypeEdit := nil;
    end;
  finally
    TKClassificationTypeObj.Free;
  end;
end;

procedure TfrmENServicesCostEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesCost: ENServicesCostControllerSoapPort;
TempTKCalcCost : TKCalcCostControllerSoapPort;
TempTKClassificationType : TKClassificationTypeControllerSoapPort;
transportList : ENServicesTransportShortList;
components : TArray<TWinControl>;
distance, machineHours : TXSDecimal;
newDate : TXSDate;

currentCalcCost : TKCalcCost;
newCalcCost : TKCalcCost;

clsFilter : TKClassificationTypeFilter;
cls : TKClassificationTypeShort;

begin
  if DialogState = dsEdit then begin
    components := TArray<TWinControl>.Create(edtDateGen, edtCountGen);
  end else begin
    components := TArray<TWinControl>.Create(edtAddInfoDateGen, edtAddInfoCountGen, edtTKClassificationTypeKod);
  end;
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(components)  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    if DialogState = dsInsert then begin
      if (calcCost = nil) or (calcCost.code = Low(Integer)) then begin
          Application.MessageBox(PChar('Оберіть калкуляцію!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
          Action:=caNone;
          Exit;
      end;
    end;

    TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
    TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
    TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;

    distance := TXSDecimal.Create;
    distance.DecimalString := '0';

	// Дистанция будет считываться с транспорта
  // (если пустые)
	if DialogState = dsEdit then begin
		transportList := Self.getTransportListByServicesCost;
		if (transportList <> nil) and (transportList.totalCount > 0) then begin
			distance := transportList.list[0].distance;
      if isLicensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then begin
        machineHours := transportList.list[0].machineHoursCount;
      end;
		end;
		ENServicesCostObj.countGen := GetTXSDecimalFromTEdit(edtCountGen);

    oldDate := ENServicesCostObj.dateGen;
    newDate := GetTXSDateFromTDateTimePicker(edtDateGen);

    if(oldDate.asDate <> newDate.asDate) then begin
      // SUPP-80411 Проверка, что при изменении даты не поменяется
      // расчет по калькуляции
      currentCalcCost := TempTKCalcCost.getObject(ENServicesCostObj.tkCalcCostRef.code);
      clsFilter := TKClassificationTypeFilter.Create;
      SetNullIntProps(clsFilter);
      SetNullXSProps(clsFilter);
      clsFilter.code := currentCalcCost.classificationTypeRef.code;
      cls := TempTKClassificationType.getScrollableFilteredList(clsFilter, 0, -1).list[0];

      newCalcCost := Self.getTKCalcCostByClassificationTypeAndDate(cls, newDate, true);
      if not Assigned(newCalcCost) then begin
        // SUPP-80411 Если не был найден расчет
        // значит на эту дату расчета по калькуляции нет
        Action:=caNone;
        Exit;
      end;
      // SUPP-80411 Если был найден новый расчет, то выдается предупреждение
      if newCalcCost.code <> currentCalcCost.code then begin
        if Application.MessageBox(PChar(Format('По калькуляції № %s на обрану дату (%s) діє інший розрахунок (від %s)' + Chr(10) +
              ' ніж на попередню дату - %s (діє розрахунок від %s). ' + Chr(10) +
              'Імовірно, що зміниться сума по калькуляції. Ви дійсно бажаєте змінити дату?'
          , [ cls.kod
              , XSDate2String(newDate)
              , XSDate2String(newCalcCost.dateGen)
              , XSDate2String(oldDate)
              , XSDate2String(currentCalcCost.dateGen)
              ])),
        PChar('Увага!'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then begin
          ENServicesCostObj.dateGen := oldDate;
          Action := caNone;
          Exit;
        end;
        ENServicesCostObj.tkCalcCostRef.code := newCalcCost.code;
      end;
      ENServicesCostObj.dateGen := newDate;
    end;
		
	end;
	
	if DialogState = dsInsert then begin

		distance := GetTXSDecimalFromTEdit(edtAddInfoDistance);

    if(isLicensed = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) then begin
      machineHours := GetTXSDecimalFromTEdit(edtAddInfoMachineHoursCountGen);
    end;
		if not Assigned(distance) then begin
		  distance := TXSDecimal.Create;
		  distance.DecimalString := '0';
		end;


		ENServicesCostObj.tkCalcCostRef := TKCalcCostRef.Create;
		ENServicesCostObj.tkCalcCostRef.code := calcCost.code;
		ENServicesCostObj.countGen := GetTXSDecimalFromTEdit(edtAddInfoCountGen);
		ENServicesCostObj.dateGen := GetTXSDateFromTDateTimePicker(edtAddInfoDateGen);
	end;
	 
	 

    if DialogState = dsInsert then
    begin
      ENServicesCostObj.code:=low(Integer);
      if(isLicensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) then begin
            TempENServicesCost.add(ENServicesCostObj, distance);
      end else begin
            TempENServicesCost.add(ENServicesCostObj, distance, machineHours);
      end;

    end
    else
    if DialogState = dsEdit then
    begin
      if(isLicensed <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT) then begin
        TempENServicesCost.save(ENServicesCostObj, distance);
      end else begin
        TempENServicesCost.save(ENServicesCostObj, distance, machineHours);
      end;
    end;
  end;
end;


procedure TfrmENServicesCostEdit.FormCreate(Sender: TObject);
begin
  inherited;
  calcCost := nil;
  oldDate := nil;
  updateForTransport := false;
  isLicensed := Low(Integer);
  pcENServicesCost.ActivePage := tsMain;
end;

procedure TfrmENServicesCostEdit.updateENServicesMaterials();
var
  TempENServicesMaterials : ENServicesMaterialsControllerSoapPort;
  i : Integer;
  list : ENServicesMaterialsShortList;
  filter : ENServicesMaterialsFilter;
  LastCount, ColCount, LastRow : Integer;
begin
  sgENServicesMaterials.Clear;
  SetGridHeaders(ENServicesMaterialsHeaders, sgENServicesMaterials.ColumnHeaders);
  TempENServicesMaterials := HTTPRIOENServicesMaterials as ENServicesMaterialsControllerSoapPort;
  filter := ENServicesMaterialsFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesCostRef := ENServicesCostRef.Create;
  filter.servicesCostRef.code := ENServicesCostObj.code;
  list := TempENServicesMaterials.getScrollableFilteredList(filter,0,-1);
  LastCount:=High(list.list);
  if LastCount > -1 then
     sgENServicesMaterials.RowCount:=LastCount+2
  else
     sgENServicesMaterials.RowCount:=2;

   with sgENServicesMaterials do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if list.list[i].code <> Low(Integer) then
		  Cells[0,i+1] := IntToStr(list.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1, i + 1] := list.list[i].materialName;
		Cells[2, i + 1] := list.list[i].measureUnitName;

		if list.list[i].countGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := list.list[i].countGen.DecimalString;

		if list.list[i].sumGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := list.list[i].sumGen.DecimalString;

        LastRow:=i+1;
        sgENServicesMaterials.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesMaterials.Row:=1;
end;

function TfrmENServicesCostEdit.getTransportListByServicesCost : ENServicesTransportShortList;
var
  TempENServicesTransport : ENServicesTransportControllerSoapPort;
  filter : ENServicesTransportFilter;
begin
  TempENServicesTransport := HTTPRIOENServicesTransport as ENServicesTransportControllerSoapPort;
  filter := ENServicesTransportFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesCostRef := ENServicesCostRef.Create;
  filter.servicesCostRef.code := ENServicesCostObj.code;
  Result := TempENServicesTransport.getScrollableFilteredList(filter,0,-1);
end;

procedure TfrmENServicesCostEdit.updateENServicesTransport();
var
  i : Integer;
  list : ENServicesTransportShortList;
  LastCount, ColCount, LastRow : Integer;
begin
  sgENServicesTransport.Clear;
  SetGridHeaders(ENServicesTransportHeaders, sgENServicesTransport.ColumnHeaders);
  list := Self.getTransportListByServicesCost;
  LastCount:=High(list.list);
  if LastCount > -1 then
     sgENServicesTransport.RowCount:=LastCount+2
  else
     sgENServicesTransport.RowCount:=2;

   with sgENServicesTransport do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if list.list[i].code <> Low(Integer) then
		  Cells[0,i+1] := IntToStr(list.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1, i + 1] := list.list[i].transportName;
		
		if list.list[i].machineHoursCount = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := list.list[i].machineHoursCount.DecimalString;
		  
		if list.list[i].distance = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := list.list[i].distance.DecimalString;

		if list.list[i].costMachineHours = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := list.list[i].costMachineHours.DecimalString;

		if list.list[i].costDistance = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := list.list[i].costDistance.DecimalString;

		if list.list[i].costTotal = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := list.list[i].costTotal.DecimalString;

        LastRow:=i+1;
        sgENServicesTransport.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesTransport.Row:=1;
end;

procedure TfrmENServicesCostEdit.updateENServicesHumenSalary();
var
  TempENServicesHumenSalary : ENServicesHumenSalaryControllerSoapPort;
  i : Integer;
  list : ENServicesHumenSalaryShortList;
  filter : ENServicesHumenSalaryFilter;
  LastCount, ColCount, LastRow : Integer;
begin
  sgENServicesHumenSalary.Clear;
  SetGridHeaders(ENServicesHumenSalaryHeaders, sgENServicesHumenSalary.ColumnHeaders);
  TempENServicesHumenSalary := HTTPRIOENServicesHumenSalary as ENServicesHumenSalaryControllerSoapPort;
  filter := ENServicesHumenSalaryFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesCostRef := ENServicesCostRef.Create;
  filter.servicesCostRef.code := ENServicesCostObj.code;
  list := TempENServicesHumenSalary.getScrollableFilteredList(filter,0,-1);
  LastCount:=High(list.list);
  if LastCount > -1 then
     sgENServicesHumenSalary.RowCount:=LastCount+2
  else
     sgENServicesHumenSalary.RowCount:=2;

   with sgENServicesHumenSalary do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if list.list[i].code <> Low(Integer) then
		  Cells[0,i+1] := IntToStr(list.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1, i + 1] := list.list[i].positionName;

		if list.list[i].timeGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := list.list[i].timeGen.DecimalString;

		if list.list[i].salaryHour = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := list.list[i].salaryHour.DecimalString;

		if list.list[i].salaryTotal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := list.list[i].salaryTotal.DecimalString;

        LastRow:=i+1;
        sgENServicesHumenSalary.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesHumenSalary.Row:=1;
end;

procedure TfrmENServicesCostEdit.updateENServicesDelivery();
var
  TempENServicesDelivery : ENServicesDeliveryControllerSoapPort;
  i : Integer;
  list : ENServicesDeliveryShortList;
  filter : ENServicesDeliveryFilter;
  LastCount, ColCount, LastRow : Integer;
begin
  sgENServicesDelivery.Clear;
  SetGridHeaders(ENServicesDeliveryHeaders, sgENServicesDelivery.ColumnHeaders);
  TempENServicesDelivery := HTTPRIOENServicesDelivery as ENServicesDeliveryControllerSoapPort;
  filter := ENServicesDeliveryFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.servicesCostRef := ENServicesCostRef.Create;
  filter.servicesCostRef.code := ENServicesCostObj.code;
  list := TempENServicesDelivery.getScrollableFilteredList(filter,0,-1);
  LastCount:=High(list.list);
  if LastCount > -1 then
     sgENServicesDelivery.RowCount:=LastCount+2
  else
     sgENServicesDelivery.RowCount:=2;

   with sgENServicesDelivery do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if list.list[i].code <> Low(Integer) then
		  Cells[0,i+1] := IntToStr(list.list[i].code)
        else
          Cells[0,i+1] := '';

		if list.list[i].timeGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := list.list[i].timeGen.DecimalString;

		if list.list[i].costGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := list.list[i].costGen.DecimalString;

		if list.list[i].chargeCostGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := list.list[i].chargeCostGen.DecimalString;

		if list.list[i].costTotal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := list.list[i].costTotal.DecimalString;

        LastRow:=i+1;
        sgENServicesDelivery.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENServicesDelivery.Row:=1;
end;

procedure TfrmENServicesCostEdit.openENServicesMaterialsEditForm(DialogState : TDialogState);
var
  TempENServicesMaterials : ENServicesMaterialsControllerSoapPort;
begin

  if DialogState = dsInsert then begin
	  ENServicesMaterialsObj := ENServicesMaterials.Create;
	  ENServicesMaterialsObj.servicesCostRef := ENServicesCostRef.Create;
  	ENServicesMaterialsObj.servicesCostRef.code := ENServicesCostObj.code;
  end else begin
    TempENServicesMaterials := HTTPRIOENServicesMaterials as ENServicesMaterialsControllerSoapPort;
    try
      ENServicesMaterialsObj := TempENServicesMaterials.getObject(StrToInt(sgENServicesMaterials.Cells[0,sgENServicesMaterials.Row]));
    except
      on EConvertError do Exit;
    end;
  end;

  try
    frmENServicesMaterialsEdit := TfrmENServicesMaterialsEdit.Create(Application, DialogState);
    try
      if frmENServicesMaterialsEdit.ShowModal = mrOk then
      begin
        if ENServicesMaterialsObj<>nil then
            Self.updateENServicesMaterials;

        if DialogState in [dsInsert, dsEdit] then begin
		  Self.RefreshObject;
		end;
      end;
    finally
      frmENServicesMaterialsEdit.Free;
      frmENServicesMaterialsEdit := nil;
    end;
  finally
    ENServicesMaterialsObj.Free;
  end;
end;

procedure TfrmENServicesCostEdit.openENServicesTransportEditForm(DialogState : TDialogState);
var
  TempENServicesTransport : ENServicesTransportControllerSoapPort;
  transportEditFormMrOk : Boolean;
  TempENServicesCost : ENServicesCostControllerSoapPort;
  machineHoursCount, distance : TXSDecimal;
  TempTKCalcCost : TKCalcCostControllerSoapPort;
  TempTKClassificationType : TKClassificationTypeControllerSoapPort;
  calcCost : TKCalcCost;
  clsType : TKClassificationType;
  msgQestion : String;
begin
  transportEditFormMrOk := false;
  TempENServicesCost := HTTPRIOENServicesCost as ENServicesCostControllerSoapPort;
  TempTKCalcCost := HTTPRIOTKCalcCost as TKCalcCostControllerSoapPort;
  TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
  if DialogState = dsInsert then begin
	  ENServicesTransportObj := ENServicesTransport.Create;
	  ENServicesTransportObj.servicesCostRef := ENServicesCostRef.Create;
  	ENServicesTransportObj.servicesCostRef.code := ENServicesCostObj.code;
  end else begin
    TempENServicesTransport := HTTPRIOENServicesTransport as ENServicesTransportControllerSoapPort;
    try
      ENServicesTransportObj := TempENServicesTransport.getObject(StrToInt(sgENServicesTransport.Cells[0,sgENServicesTransport.Row]));
    except
      on EConvertError do Exit;
    end;
  end;

  calcCost := TempTKCalcCost.getObject(ENServicesCostObj.tkCalcCostRef.code);
  clsType := TempTKClassificationType.getObject(calcCost.classificationTypeRef.code);

  if clsType.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then
    msgQestion := 'Ви дійсно бажаєте змінити кілометраж або машиночаси?'
  else
    msgQestion := 'Ви дійсно бажаєте змінити кілометраж?';

  try
    frmENServicesTransportEdit := TfrmENServicesTransportEdit.Create(Application, DialogState);
	frmENServicesTransportEdit.SetTKClassificationType(clsType);
    try
      if frmENServicesTransportEdit.ShowModal = mrOk then
      begin
        if ENServicesTransportObj<>nil then	    
			   if DialogState = dsEdit then begin
		      transportEditFormMrOk := True;
			  distance := TXSDecimal.Create;
			  machineHoursCount := TXSDecimal.Create;
			  distance.DecimalString := '0';
			  machineHoursCount.DecimalString := '0';
			  if ENServicesTransportObj.distance <> nil then distance.DecimalString := ENServicesTransportObj.distance.DecimalString;
			  if ENServicesTransportObj.machineHoursCount <> nil then machineHoursCount.DecimalString := ENServicesTransportObj.machineHoursCount.DecimalString;
			end else begin
				Self.updateENServicesTransport;
			end;
      end;
    finally
      frmENServicesTransportEdit.Free;
      frmENServicesTransportEdit := nil;
    end;
  finally
    ENServicesTransportObj.Free;
  end;
  if transportEditFormMrOk then begin
	  if Application.MessageBox(PChar(msgQestion),
						PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
	  begin
      if clsType.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then begin
		     TempENServicesCost.save(ENServicesCostObj, distance, machineHoursCount);
      end else begin
		     TempENServicesCost.save(ENServicesCostObj, distance);
		   end;
		   Self.Close;
		   updateForTransport := True;
       if clsType.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then begin
         Application.MessageBox(PChar('Кілометраж та машиночаси змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
       end else begin
         Application.MessageBox(PChar('Кілометраж змінено!'), PChar('Повідомлення'), MB_ICONINFORMATION);
       end;
	  end;
  end;
end;

procedure TfrmENServicesCostEdit.openENServicesHumenSalaryEditForm(DialogState : TDialogState);
var
  TempENServicesHumenSalary : ENServicesHumenSalaryControllerSoapPort;
begin

  if DialogState = dsInsert then begin
	  ENServicesHumenSalaryObj := ENServicesHumenSalary.Create;
	  ENServicesHumenSalaryObj.servicesCostRef := ENServicesCostRef.Create;
  	ENServicesHumenSalaryObj.servicesCostRef.code := ENServicesCostObj.code;
  end else begin
    TempENServicesHumenSalary := HTTPRIOENServicesHumenSalary as ENServicesHumenSalaryControllerSoapPort;
    try
      ENServicesHumenSalaryObj := TempENServicesHumenSalary.getObject(StrToInt(sgENServicesHumenSalary.Cells[0,sgENServicesHumenSalary.Row]));
    except
      on EConvertError do Exit;
    end;
  end;

  try
    frmENServicesHumenSalaryEdit := TfrmENServicesHumenSalaryEdit.Create(Application, DialogState);
    try
      if frmENServicesHumenSalaryEdit.ShowModal = mrOk then
      begin
        if ENServicesHumenSalaryObj<>nil then
            Self.updateENServicesHumenSalary;
      end;
    finally
      frmENServicesHumenSalaryEdit.Free;
      frmENServicesHumenSalaryEdit := nil;
    end;
  finally
    ENServicesHumenSalaryObj.Free;
  end;
end;

procedure TfrmENServicesCostEdit.openENServicesDeliveryEditForm(DialogState : TDialogState);
var
  TempENServicesDelivery : ENServicesDeliveryControllerSoapPort;
begin

  if DialogState = dsInsert then begin
	  ENServicesDeliveryObj := ENServicesDelivery.Create;
	  ENServicesDeliveryObj.servicesCostRef := ENServicesCostRef.Create;
  	ENServicesDeliveryObj.servicesCostRef.code := ENServicesCostObj.code;
  end else begin
    TempENServicesDelivery := HTTPRIOENServicesDelivery as ENServicesDeliveryControllerSoapPort;
    try
      ENServicesDeliveryObj := TempENServicesDelivery.getObject(StrToInt(sgENServicesDelivery.Cells[0,sgENServicesDelivery.Row]));
    except
      on EConvertError do Exit;
    end;
  end;

  try
    frmENServicesDeliveryEdit := TfrmENServicesDeliveryEdit.Create(Application, DialogState);
    try
      if frmENServicesDeliveryEdit.ShowModal = mrOk then
      begin
        if ENServicesDeliveryObj<>nil then
            Self.updateENServicesDelivery;
      end;
    finally
      frmENServicesDeliveryEdit.Free;
      frmENServicesDeliveryEdit := nil;
    end;
  finally
    ENServicesDeliveryObj.Free;
  end;
end;



end.