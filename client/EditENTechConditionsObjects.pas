
unit EditENTechConditionsObjects;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechConditionsObjectsController,
  AdvObj, ENConsts;

type
  TfrmENTechConditionsObjectsEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
  edtENDepartmentDepartmentName : TEdit;
  spbENDepartmentDepartment : TSpeedButton;

  btnOk: TButton;
  btnCancel: TButton;
    lbl1: TLabel;
    HTTPRIOENTechConditionsObjects: THTTPRIO;
    lblENPowerReliabilityCategoryCategoryRefName: TLabel;
    edtENPowerReliabilityCategoryCategoryRefName: TEdit;
    spbENPowerReliabilityCategoryCategoryRef: TSpeedButton;
    lblENConnectionPowerPointPowerPointRefName: TLabel;
    edtENConnectionPowerPointPowerPointRefName: TEdit;
    spbENConnectionPowerPointPowerPointRef: TSpeedButton;
    HTTPRIOENConnectionPowerPoint: THTTPRIO;
    HTTPRIOENPowerReliabilityCategory: THTTPRIO;
    gb1: TGroupBox;
    lblNumberGen: TLabel;
    lblDateGen: TLabel;
    lblBuilding: TLabel;
    lblConnectionPowerPlaces: TLabel;
    lblConnectionPowerPoint: TLabel;
    Label8: TLabel;
    lblConnectionPowerPlacesNum: TLabel;
    lblConnectionPowerPointNum: TLabel;
    lblConnectionSource: TLabel;
    lblConnectionSourceNum: TLabel;
    edtNumberGen: TEdit;
    edtDateGen: TDateTimePicker;
    edtBuilding: TEdit;
    mmoConnectionPowerPlaces: TMemo;
    mmoConnectionPowerPoint: TMemo;
    grpCurrentPower: TGroupBox;
    lblCat1CurrentPower: TLabel;
    lblCat2CurrentPower: TLabel;
    lblCat3CurrentPower: TLabel;
    edtCat1CurrentPower: TEdit;
    edtCat2CurrentPower: TEdit;
    edtCat3CurrentPower: TEdit;
    grpServicesPower: TGroupBox;
    lblCat1ServicesPower: TLabel;
    lblCat2ServicesPower: TLabel;
    lblCat3ServicesPower: TLabel;
    edtCat1ServicesPower: TEdit;
    edtCat2ServicesPower: TEdit;
    edtCat3ServicesPower: TEdit;
    grpOveral: TGroupBox;
    lblTyServicesPower: TLabel;
    lblTyCurrentPower: TLabel;
    lblPowerGeneration: TLabel;
    edtTyServicesPower: TEdit;
    edtTyCurrentPower: TEdit;
    edtPowerGeneration: TEdit;
    grpVoltage: TGroupBox;
    lblVoltageCurrent: TLabel;
    lblVoltageServices: TLabel;
    edtVoltageCurrent: TEdit;
    edtVoltageServices: TEdit;
    grpHeating: TGroupBox;
    lblTyServicesPowerCooker: TLabel;
    lblTyServicesPowerWater: TLabel;
    lblTyServicesPowerHeating: TLabel;
    edtTyServicesPowerCooker: TEdit;
    edtTyServicesPowerWater: TEdit;
    edtTyServicesPowerHeating: TEdit;
    mmoConnectionPowerPlacesNum: TMemo;
    mmoConnectionPowerPointNum: TMemo;
    mmoConnectionSource: TMemo;
    mmoConnectionSourceNum: TMemo;
    edtCustomer: TEdit;
    lblAddress: TLabel;
    edtAddress: TMemo;
    Label1: TLabel;
    edtYeargen: TEdit;
    Label2: TLabel;
    edtPerformer: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtPerformerPhone: TEdit;
    btnGetFromCC: TButton;
    HTTPRIOENSO2Node: THTTPRIO;
    Button1: TButton;
    grpTCOValues: TGroupBox;
    ToolBar5: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    sgENTCOValues: TAdvStringGrid;
    HTTPRIOENTCOValues: THTTPRIO;
    pmTCOValues: TPopupMenu;
    alTCOValues: TActionList;
    actInsertTCOVal: TAction;
    actViewTCOVal: TAction;
    actDeleteTCOVal: TAction;
    actEditTCOVal: TAction;
    btnZNP: TButton;
    cbUseAnExistingCounter: TCheckBox;
    ImageList1: TImageList;
    actUpdateTCOVal: TAction;
    HTTPRIOENSOValues: THTTPRIO;
    mmoObjectSecurityZone: TMemo;
    lblObjectSecurityZone: TLabel;
    cbSecurityZone: TCheckBox;
    btnGenerateIdent: TButton;
    btnResetIdent: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbENPowerReliabilityCategoryCategoryRefClick(
      Sender: TObject);
    procedure spbENConnectionPowerPointPowerPointRefClick(Sender: TObject);
    procedure btnGetFromCCClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure updateTCOValues;
    procedure actInsertTCOValExecute(Sender: TObject);
    procedure actViewTCOValExecute(Sender: TObject);
    procedure actDeleteTCOValExecute(Sender: TObject);
    procedure actEditTCOValExecute(Sender: TObject);
    procedure actUpdateTCOValExecute(Sender: TObject);
    procedure btnZNPClick(Sender: TObject);
    procedure sgENTCOValuesDblClick(Sender: TObject);
    procedure cbSecurityZoneClick(Sender: TObject);
    procedure btnGenerateIdentClick(Sender: TObject);
    procedure btnResetIdentClick(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
    techConditionsCode, servicesObjectCode : Integer;

end;

var
  frmENTechConditionsObjectsEdit: TfrmENTechConditionsObjectsEdit;
  ENTechConditionsObjectsObj: ENTechConditionsObjects;
  tcoValLastRow: Integer = 1;
  ENTCOValuesHeaders: array [1..3] of String =
        ( 'Код'
          ,'Найменування'
          ,'Опис роботи з приєднення'
        );

implementation

uses
  ShowENElement
  ,ENElementController
  ,ShowENDepartment
  ,ENDepartmentController
  ,ENPowerReliabilityCategoryController
  ,ENConnectionPowerPointController
  ,ShowENPowerReliabilityCategory
  ,ShowENConnectionPowerPoint
, ENSO2NodeController, printTechConditions, DMReportsUnit, ENTCOValuesController, EditENTCOValues
,ENSOValuesController, ENServicesObjectController, ENSOValuesTypeController;

{uses
    EnergyproController, EnergyproController2, ENTechConditionsObjectsController  ;
}
{$R *.dfm}



procedure TfrmENTechConditionsObjectsEdit.FormShow(Sender: TObject);
var TempENPowerReliabilityCategory: ENPowerReliabilityCategoryControllerSoapPort;
  TempENConnectionPowerPoint: ENConnectionPowerPointControllerSoapPort;
  ENPowerReliabilityCategoryObj: ENPowerReliabilityCategory;
  ENConnectionPowerPointObj: ENConnectionPowerPoint;
begin
  DisableControls([edtCode, edtENPowerReliabilityCategoryCategoryRefName,
     edtENConnectionPowerPointPowerPointRefName,edtCustomer,edtAddress]);
  SetFloatStyle([edtTyServicesPower, edtTyCurrentPower,
                 edtTyServicesPowerCooker, edtTyServicesPowerWater,
                 edtTyServicesPowerHeating, edtCat1CurrentPower, edtCat2CurrentPower,
                 edtCat3CurrentPower, edtCat1ServicesPower, edtCat2ServicesPower,
                 edtCat3ServicesPower, edtPowerGeneration, edtVoltageCurrent,
                 edtVoltageServices, edtYeargen]);

  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtENDepartmentDepartmentName
      ,edtCode
      ,spbENDepartmentDepartment
      , edtDateGen
      , edtENDepartmentDepartmentName
      , spbENDepartmentDepartment
      ,edtENPowerReliabilityCategoryCategoryRefName
      ,spbENPowerReliabilityCategoryCategoryRef
      ,edtENConnectionPowerPointPowerPointRefName
      ,spbENConnectionPowerPointPowerPointRef
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENDepartmentDepartmentName]);

    DenyBlankValues([
      edtNumberGen
      ,edtCustomer
      ,edtBuilding
      ,edtAddress
      ,edtENDepartmentDepartmentName
      ,edtCode
      ,edtTyServicesPower
      ,mmoConnectionPowerPlaces
      ,mmoConnectionPowerPoint
      ,edtENPowerReliabilityCategoryCategoryRefName
      ,edtENConnectionPowerPointPowerPointRefName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENTechConditionsObjectsObj.code);
    edtNumberGen.Text := ENTechConditionsObjectsObj.numberGen;

      if ENTechConditionsObjectsObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENTechConditionsObjectsObj.dateGen.Year,ENTechConditionsObjectsObj.dateGen.Month,ENTechConditionsObjectsObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

    edtCustomer.Text := ENTechConditionsObjectsObj.customer;

    edtBuilding.Text := ENTechConditionsObjectsObj.building;
    MakeMultiline(edtAddress.Lines,ENTechConditionsObjectsObj.address);

    if ENTechConditionsObjectsObj.voltageCurrent <> Low(Integer) then
    edtVoltageCurrent.Text := IntToStr(ENTechConditionsObjectsObj.voltageCurrent);

    if ENTechConditionsObjectsObj.voltageServices <> Low(Integer) then
    edtVoltageServices.Text := IntToStr(ENTechConditionsObjectsObj.voltageServices);

    if ( ENTechConditionsObjectsObj.tyServicesPower <> nil ) then
       edtTyServicesPower.Text := ENTechConditionsObjectsObj.tyServicesPower.decimalString
    else
       edtTyServicesPower.Text := '';

    if ( ENTechConditionsObjectsObj.tyCurrentPower <> nil ) then
       edtTyCurrentPower.Text := ENTechConditionsObjectsObj.tyCurrentPower.decimalString
    else
       edtTyCurrentPower.Text := '';

    if ( ENTechConditionsObjectsObj.powerGeneration <> nil ) then
       edtPowerGeneration.Text := ENTechConditionsObjectsObj.powerGeneration.decimalString
    else
       edtPowerGeneration.Text := '';

    if ( ENTechConditionsObjectsObj.tyServicesPowerWaterHeating <> nil ) then
       edtTyServicesPowerWater.Text := ENTechConditionsObjectsObj.tyServicesPowerWaterHeating.decimalString
    else
       edtTyServicesPowerWater.Text := '';

    if ( ENTechConditionsObjectsObj.tyServicesPowerHeating <> nil ) then
       edtTyServicesPowerHeating.Text := ENTechConditionsObjectsObj.tyServicesPowerHeating.decimalString
    else
       edtTyServicesPowerHeating.Text := '';

    if ( ENTechConditionsObjectsObj.tyServicesPowerCooker <> nil ) then
       edtTyServicesPowerCooker.Text := ENTechConditionsObjectsObj.tyServicesPowerCooker.decimalString
    else
       edtTyServicesPowerCooker.Text := '';

    if ( ENTechConditionsObjectsObj.cat1CurrentPower <> nil ) then
       edtCat1CurrentPower.Text := ENTechConditionsObjectsObj.cat1CurrentPower.decimalString
    else
       edtCat1CurrentPower.Text := '';

    if ( ENTechConditionsObjectsObj.cat2CurrentPower <> nil ) then
       edtCat2CurrentPower.Text := ENTechConditionsObjectsObj.cat2CurrentPower.decimalString
    else
       edtCat2CurrentPower.Text := '';

    if ( ENTechConditionsObjectsObj.cat3CurrentPower <> nil ) then
       edtCat3CurrentPower.Text := ENTechConditionsObjectsObj.cat3CurrentPower.decimalString
    else
       edtCat3CurrentPower.Text := '';

    if ( ENTechConditionsObjectsObj.cat1ServicesPower <> nil ) then
       edtCat1ServicesPower.Text := ENTechConditionsObjectsObj.cat1ServicesPower.decimalString
    else
       edtCat1ServicesPower.Text := '';

    if ( ENTechConditionsObjectsObj.cat2ServicesPower <> nil ) then
       edtCat2ServicesPower.Text := ENTechConditionsObjectsObj.cat2ServicesPower.decimalString
    else
       edtCat2ServicesPower.Text := '';

    if ( ENTechConditionsObjectsObj.cat3ServicesPower <> nil ) then
       edtCat3ServicesPower.Text := ENTechConditionsObjectsObj.cat3ServicesPower.decimalString
    else
       edtCat3ServicesPower.Text := '';

    if ENTechConditionsObjectsObj.yearGen <> Low(Integer) then
    edtYeargen.Text := IntToStr(ENTechConditionsObjectsObj.yearGen);

    edtENDepartmentDepartmentName.Text := ENTechConditionsObjectsObj.department.name;

    edtPerformer.Text := ENTechConditionsObjectsObj.performer;
    edtPerformerPhone.Text := ENTechConditionsObjectsObj.performerPhone;

    MakeMultiline(mmoConnectionPowerPlaces.Lines,ENTechConditionsObjectsObj.connectionPowerPlaces);
    MakeMultiline(mmoConnectionPowerPoint.Lines,ENTechConditionsObjectsObj.connectionPowerPoint);
    MakeMultiline(mmoConnectionPowerPlacesNum.Lines,ENTechConditionsObjectsObj.connectionPowerPlacesNum);
    MakeMultiline(mmoConnectionPowerPointNum.Lines,ENTechConditionsObjectsObj.connectionPowerPointNum);
    MakeMultiline(mmoConnectionSource.Lines,ENTechConditionsObjectsObj.connectionSource);
    MakeMultiline(mmoConnectionSourceNum.Lines,ENTechConditionsObjectsObj.connectionSourceNum);

    if ENTechConditionsObjectsObj.securityZone = ENTECHCONDITIONSOBJECT_SECURITYZONE_YES then
    begin
        cbSecurityZone.Checked := true;
        lblObjectSecurityZone.Visible := true;
        mmoObjectSecurityZone.Visible := true;
        MakeMultiline(mmoObjectSecurityZone.Lines,ENTechConditionsObjectsObj.objectSecurityZone);
    end;

    if ENTechConditionsObjectsObj.categoryRef <> nil then
      if ENTechConditionsObjectsObj.categoryRef.code <> low(Integer) then
        begin
          TempENPowerReliabilityCategory := HTTPRIOENPowerReliabilityCategory
            as ENPowerReliabilityCategoryControllerSoapPort;
          ENPowerReliabilityCategoryObj :=
            TempENPowerReliabilityCategory.getObject(
              ENTechConditionsObjectsObj.categoryRef.code);
          try
            edtENPowerReliabilityCategoryCategoryRefName.Text :=
              ENPowerReliabilityCategoryObj.name;
          finally
            ENPowerReliabilityCategoryObj.Free;
            ENPowerReliabilityCategoryObj := nil;
          end;
        end; //if ENTechConditionsObjectsObj.categoryRef.code <> low(Integer) then

    if ENTechConditionsObjectsObj.powerPointRef <> nil then
      if ENTechConditionsObjectsObj.powerPointRef.code <> low(Integer) then
        begin
          TempENConnectionPowerPoint := HTTPRIOENConnectionPowerPoint
            as ENConnectionPowerPointControllerSoapPort;
          ENConnectionPowerPointObj :=
            TempENConnectionPowerPoint.getObject(
              ENTechConditionsObjectsObj.powerPointRef.code);
          try
            edtENConnectionPowerPointPowerPointRefName.Text :=
              ENConnectionPowerPointObj.name;
          finally
            ENConnectionPowerPointObj.Free;
            ENConnectionPowerPointObj := nil;
          end;
        end; //if ENTechConditionsObjectsObj.powerPointRef.code <> low(Integer) then
       updateTCOValues;
  end;
end;



procedure TfrmENTechConditionsObjectsEdit.actViewTCOValExecute(Sender: TObject);
var
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  selectedRow: Integer;
begin
  TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
  try
    ENTCOValuesObj := TempENTCOValues.getObject(StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENTCOValues.Row;
  frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsView);

  try
    frmENTCOValuesEdit.ShowModal;
  finally
    frmENTCOValuesEdit.Free;
    frmENTCOValuesEdit:=nil;
  end;

  if sgENTCOValues.RowCount > selectedRow then
    sgENTCOValues.Row := selectedRow
  else
    sgENTCOValues.Row := sgENTCOValues.RowCount - 1;

end;

procedure TfrmENTechConditionsObjectsEdit.btnGenerateIdentClick(
  Sender: TObject);
  var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  begin
  inherited;
  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
  TempENTechConditionsObjects.generateIdentNumber(ENTechConditionsObjectsObj.code);
  ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(ENTechConditionsObjectsObj.code);
  FormShow(Sender);
end;

procedure TfrmENTechConditionsObjectsEdit.btnGetFromCCClick(Sender: TObject);
var
  TempENSO2Node: ENSO2NodeControllerSoapPort;
  i: Integer;
  ENSO2NodeList: ENSO2NodeShortList;
  so2nodeFilter : ENSO2NodeFilter;
  connectionSourceFromCC : string;
begin


  TempENSO2Node :=  HTTPRIOENSO2Node as ENSO2NodeControllerSoapPort;

   so2nodeFilter := ENSO2NodeFilter.Create;
   SetNullIntProps(so2nodeFilter);
   SetNullXSProps(so2nodeFilter);

   so2nodeFilter.conditionSQL := 'ccnodecode in (select so2n.ccnodecode from' +
                                 ' entechconditionsservcs tcs, enservicesobject2techcondtnsservices s2t,' +
                                 ' ENSO2NODE so2n , entechconditionsobjcts tco, encontragent ecnt' +
                                 ' where ' +
                                 ' ecnt.techcondservicesrefcod = tcs.code' +
                                 ' and ecnt.techconobjectscode = tco.code' +
                                 ' and tcs.code = s2t.techcondservrefcode' +
                                 ' and so2n.servicesobjectcode = s2t.servicesobjectrefcode' +
                                 ' and so2n.so2nodetypecode = 1' +
                                 ' and tco.code = ' + IntToStr(ENTechConditionsObjectsObj.code) + ')';

  ENSO2NodeList := TempENSO2Node.getScrollableFilteredList(so2nodeFilter,0,1);
  if ENSO2NodeList.totalCount > 0 then
  begin
     if (ENSO2NodeList.list[0].s35 = '') then
        connectionSourceFromCC := ENSO2NodeList.list[0].s150
     else
        connectionSourceFromCC := ENSO2NodeList.list[0].s35;
        MakeMultiline(mmoConnectionSource.Lines, connectionSourceFromCC);
  end;


end;

procedure TfrmENTechConditionsObjectsEdit.btnResetIdentClick(Sender: TObject);
  var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
  begin
  inherited;
  TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;
  TempENTechConditionsObjects.resetIdentNumber(ENTechConditionsObjectsObj.code);
  ENTechConditionsObjectsObj := TempENTechConditionsObjects.getObject(ENTechConditionsObjectsObj.code);
  FormShow(Sender);
end;

procedure TfrmENTechConditionsObjectsEdit.btnZNPClick(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;
begin
      SetLength(argNames, 2);
      SetLength(args, 2);

      argNames[0] := 'agreeCode';
      args[0] := IntToStr(techConditionsCode);

      argNames[1] := 'useAnExistingCounter';
      if cbUseAnExistingCounter.Checked then
          args[1] := 'використати існуючий'
      else
          args[1] := 'не потрібно';

      reportName :=  'TechConditions/NewConnection_09122019/designTsks';
      makeReport(reportName , argNames , args , 'doc');

end;

procedure TfrmENTechConditionsObjectsEdit.Button1Click(Sender: TObject);
var argNames, args: ArrayOfString;
    reportName: String;

  TempENSOValues: ENSOValuesControllerSoapPort;
  ENSOValuesList: ENSOValuesShortList;
  soValuesFilter : ENSOValuesFilter;
  soValLastCount: Integer;
begin

      //SUPP-88213
    TempENSOValues :=  HTTPRIOENSOValues as ENSOValuesControllerSoapPort;

     soValuesFilter := ENSOValuesFilter.Create;
     SetNullIntProps(soValuesFilter);
     SetNullXSProps(soValuesFilter);
     soValuesFilter.servicesobject := ENServicesObjectRef.Create;
     soValuesFilter.servicesobject.code := servicesObjectCode;
     soValuesFilter.soValuesType := ENSOValuesTypeRef.Create;
     soValuesFilter.soValuesType.code := ENDATE_NUMBER_REGISTRATION_STATEMENT;

    ENSOValuesList := TempENSOValues.getScrollableFilteredList(soValuesFilter,0,-1);
    soValLastCount:=High(ENSOValuesList.list);

     if soValLastCount <= -1 then
     begin
          Application.MessageBox(PChar('Додайте дату та номер реєстрації заяви.'),
              PChar('Увага!'), MB_ICONWARNING);
          Exit;
     end;

  if not Assigned(frmPrintTechConditions) then
    frmPrintTechConditions := TfrmPrintTechConditions.Create(Owner);
    frmPrintTechConditions.edtTechConditionStr.Text := 'визначити проєктом';
  try

    if frmPrintTechConditions.ShowModal = mrOk then
      begin

          SetLength(argNames, 2);
          SetLength(args, 2);

          argNames[0] := 'agreeCode';
          args[0] := IntToStr(techConditionsCode);

          argNames[1] := 'techCondStr';
          args[1] := frmPrintTechConditions.edtTechConditionStr.Text;

          if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) < EncodeDate(2019,12,9)) then
          begin
                Application.MessageBox(PChar('Договор ТУ 02 2019'),
                        PChar('Увага!'), MB_ICONWARNING);
                reportName :=  'TechConditions/NewConnection_022019/techConditions';
          end;
          if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2019,12,9)) then
                reportName :=  'TechConditions/NewConnection_09122019/techConditions';
          if (EncodeDate(ENSOValuesList.list[0].dateVal.Year, ENSOValuesList.list[0].dateVal.Month,
                          ENSOValuesList.list[0].dateVal.Day) >= EncodeDate(2020,07,1)) then
          begin
               if ENTechConditionsObjectsObj.securityZone = ENTECHCONDITIONSOBJECT_SECURITYZONE_YES then
               begin
                    reportName :=  'TechConditions/NewConnection_01072020/techConditions';
               end
               else
                    reportName :=  'TechConditions/NewConnection_09122019/techConditions';
          end;

          makeReport(reportName , argNames , args , 'pdf');
      end;
  finally
    frmPrintTechConditions.Free;
    frmPrintTechConditions := nil;
  end;
end;

procedure TfrmENTechConditionsObjectsEdit.cbSecurityZoneClick(Sender: TObject);
begin
  if cbSecurityZone.Checked then
  begin
      lblObjectSecurityZone.Visible := true;
      mmoObjectSecurityZone.Visible := true;
  end
  else
    begin
      lblObjectSecurityZone.Visible := false;
      mmoObjectSecurityZone.Visible := false;
      mmoObjectSecurityZone.Clear;
  end
end;

procedure TfrmENTechConditionsObjectsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechConditionsObjects: ENTechConditionsObjectsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtCustomer
      ,edtBuilding
      ,edtAddress
      ,edtENDepartmentDepartmentName
      ,edtTyServicesPower
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTechConditionsObjects := HTTPRIOENTechConditionsObjects as ENTechConditionsObjectsControllerSoapPort;


     ENTechConditionsObjectsObj.numberGen := edtNumberGen.Text;

     if edtdateGen.checked then
     begin 
       if ENTechConditionsObjectsObj.dateGen = nil then
          ENTechConditionsObjectsObj.dateGen := TXSDate.Create;
       ENTechConditionsObjectsObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       ENTechConditionsObjectsObj.dateGen := nil;

     ENTechConditionsObjectsObj.building := edtBuilding.Text;

     ENTechConditionsObjectsObj.address := edtAddress.Text;

     if (ENTechConditionsObjectsObj.tyServicesPower = nil ) then
       ENTechConditionsObjectsObj.tyServicesPower := TXSDecimal.Create;
     if edtTyServicesPower.Text <> '' then
       ENTechConditionsObjectsObj.tyServicesPower.decimalString := edtTyServicesPower.Text
     else
       ENTechConditionsObjectsObj.tyServicesPower := nil;

     if (ENTechConditionsObjectsObj.tyCurrentPower = nil ) then
       ENTechConditionsObjectsObj.tyCurrentPower := TXSDecimal.Create;
     if edtTyCurrentPower.Text <> '' then
       ENTechConditionsObjectsObj.tyCurrentPower.decimalString := edtTyCurrentPower.Text
     else
       ENTechConditionsObjectsObj.tyCurrentPower := nil;

    ENTechConditionsObjectsObj.customer :=  edtCustomer.Text;

    ENTechConditionsObjectsObj.connectionPowerPlaces := mmoConnectionPowerPlaces.Text;
    ENTechConditionsObjectsObj.connectionPowerPoint := mmoConnectionPowerPoint.Text;

    //// новые поля техусловий

    ENTechConditionsObjectsObj.connectionPowerPlacesNum := mmoConnectionPowerPlacesNum.Text;
    ENTechConditionsObjectsObj.connectionPowerPointNum := mmoConnectionPowerPointNum.Text;
    ENTechConditionsObjectsObj.connectionSource := mmoConnectionSource.Text;
    ENTechConditionsObjectsObj.connectionSourceNum := mmoConnectionSourceNum.Text;

     if edtVoltageCurrent.Text <> '' then
       ENTechConditionsObjectsObj.voltageCurrent := StrToInt(edtVoltageCurrent.Text)
     else
       ENTechConditionsObjectsObj.voltageCurrent := Low(Integer);

     if edtVoltageServices.Text <> '' then
       ENTechConditionsObjectsObj.voltageServices := StrToInt(edtVoltageServices.Text)
     else
       ENTechConditionsObjectsObj.voltageServices := Low(Integer);

    if (ENTechConditionsObjectsObj.tyServicesPowerWaterHeating = nil ) then
       ENTechConditionsObjectsObj.tyServicesPowerWaterHeating := TXSDecimal.Create;
     if edtTyServicesPowerWater.Text <> '' then
       ENTechConditionsObjectsObj.tyServicesPowerWaterHeating.decimalString := edtTyServicesPowerWater.Text
     else
       ENTechConditionsObjectsObj.tyServicesPowerWaterHeating := nil;

    if (ENTechConditionsObjectsObj.tyServicesPowerHeating = nil ) then
       ENTechConditionsObjectsObj.tyServicesPowerHeating := TXSDecimal.Create;
     if edtTyServicesPowerHeating.Text <> '' then
       ENTechConditionsObjectsObj.tyServicesPowerHeating.decimalString := edtTyServicesPowerHeating.Text
     else
       ENTechConditionsObjectsObj.tyServicesPowerHeating := nil;

    if (ENTechConditionsObjectsObj.tyServicesPowerCooker = nil ) then
       ENTechConditionsObjectsObj.tyServicesPowerCooker := TXSDecimal.Create;
     if edtTyServicesPowerCooker.Text <> '' then
       ENTechConditionsObjectsObj.tyServicesPowerCooker.decimalString := edtTyServicesPowerCooker.Text
     else
       ENTechConditionsObjectsObj.tyServicesPowerCooker := nil;

     if (ENTechConditionsObjectsObj.cat1CurrentPower = nil ) then
       ENTechConditionsObjectsObj.cat1CurrentPower := TXSDecimal.Create;
     if edtCat1CurrentPower.Text <> '' then
       ENTechConditionsObjectsObj.cat1CurrentPower.decimalString := edtCat1CurrentPower.Text
     else
       ENTechConditionsObjectsObj.cat1CurrentPower := nil;

     if (ENTechConditionsObjectsObj.cat2CurrentPower = nil ) then
       ENTechConditionsObjectsObj.cat2CurrentPower := TXSDecimal.Create;
     if edtCat2CurrentPower.Text <> '' then
       ENTechConditionsObjectsObj.cat2CurrentPower.decimalString := edtCat2CurrentPower.Text
     else
       ENTechConditionsObjectsObj.cat2CurrentPower := nil;

     if (ENTechConditionsObjectsObj.cat3CurrentPower = nil ) then
       ENTechConditionsObjectsObj.cat3CurrentPower := TXSDecimal.Create;
     if edtCat3CurrentPower.Text <> '' then
       ENTechConditionsObjectsObj.cat3CurrentPower.decimalString := edtCat3CurrentPower.Text
     else
       ENTechConditionsObjectsObj.cat3CurrentPower := nil;

     if (ENTechConditionsObjectsObj.cat1ServicesPower = nil ) then
       ENTechConditionsObjectsObj.cat1ServicesPower := TXSDecimal.Create;
     if edtCat1ServicesPower.Text <> '' then
       ENTechConditionsObjectsObj.cat1ServicesPower.decimalString := edtCat1ServicesPower.Text
     else
       ENTechConditionsObjectsObj.cat1ServicesPower := nil;

      if (ENTechConditionsObjectsObj.cat2ServicesPower = nil ) then
       ENTechConditionsObjectsObj.cat2ServicesPower := TXSDecimal.Create;
     if edtCat2ServicesPower.Text <> '' then
       ENTechConditionsObjectsObj.cat2ServicesPower.decimalString := edtCat2ServicesPower.Text
     else
       ENTechConditionsObjectsObj.cat2ServicesPower := nil;

       if (ENTechConditionsObjectsObj.cat3ServicesPower = nil ) then
       ENTechConditionsObjectsObj.cat3ServicesPower := TXSDecimal.Create;
     if edtCat3ServicesPower.Text <> '' then
       ENTechConditionsObjectsObj.cat3ServicesPower.decimalString := edtCat3ServicesPower.Text
     else
       ENTechConditionsObjectsObj.cat3ServicesPower := nil;

       if (ENTechConditionsObjectsObj.powerGeneration = nil ) then
       ENTechConditionsObjectsObj.powerGeneration := TXSDecimal.Create;
     if edtPowerGeneration.Text <> '' then
       ENTechConditionsObjectsObj.powerGeneration.decimalString := edtPowerGeneration.Text
     else
       ENTechConditionsObjectsObj.powerGeneration := nil;
    ///
      if edtYeargen.Text <> '' then
       ENTechConditionsObjectsObj.yearGen := StrToInt(edtYeargen.Text)
     else
       ENTechConditionsObjectsObj.yearGen := Low(Integer);

     ENTechConditionsObjectsObj.performer := edtPerformer.Text;
     ENTechConditionsObjectsObj.performerPhone := edtPerformerPhone.Text;

      if cbSecurityZone.Checked then
      begin
        ENTechConditionsObjectsObj.securityZone := ENTECHCONDITIONSOBJECT_SECURITYZONE_YES;
        ENTechConditionsObjectsObj.objectSecurityZone := mmoObjectSecurityZone.Text;
      end
      else
      begin
        ENTechConditionsObjectsObj.securityZone := ENTECHCONDITIONSOBJECT_SECURITYZONE_NO;
        ENTechConditionsObjectsObj.objectSecurityZone := '';
      end;

    if DialogState = dsInsert then
    begin
      ENTechConditionsObjectsObj.code:=low(Integer);
      TempENTechConditionsObjects.add(ENTechConditionsObjectsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTechConditionsObjects.save(ENTechConditionsObjectsObj);
    end;
  end;
end;


procedure TfrmENTechConditionsObjectsEdit.spbENDepartmentDepartmentClick(Sender : TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsObjectsObj.department = nil then ENTechConditionsObjectsObj.department := ENDepartment.Create();
               ENTechConditionsObjectsObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
end;



procedure TfrmENTechConditionsObjectsEdit.spbENPowerReliabilityCategoryCategoryRefClick(
  Sender: TObject);
var frmENPowerReliabilityCategoryShow: TfrmENPowerReliabilityCategoryShow;
begin
   frmENPowerReliabilityCategoryShow :=
     TfrmENPowerReliabilityCategoryShow.Create(Application, fmNormal);
   try
      with frmENPowerReliabilityCategoryShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsObjectsObj.categoryRef = nil then
                 ENTechConditionsObjectsObj.categoryRef :=
                   ENPowerReliabilityCategoryRef.Create();
               ENTechConditionsObjectsObj.categoryRef.code :=
                 StrToInt(GetReturnValue(sgENPowerReliabilityCategory,0));
               edtENPowerReliabilityCategoryCategoryRefName.Text :=
                 GetReturnValue(sgENPowerReliabilityCategory, 1) + ' - ' +
                 GetReturnValue(sgENPowerReliabilityCategory, 2);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPowerReliabilityCategoryShow.Free;
   end;
end;

procedure TfrmENTechConditionsObjectsEdit.sgENTCOValuesDblClick(
  Sender: TObject);
begin
  inherited;
  actViewTCOValExecute(Sender);
end;

procedure TfrmENTechConditionsObjectsEdit.spbENConnectionPowerPointPowerPointRefClick(
  Sender: TObject);
var frmENConnectionPowerPointShow: TfrmENConnectionPowerPointShow;
begin
   frmENConnectionPowerPointShow :=
     TfrmENConnectionPowerPointShow.Create(Application, fmNormal);
   try
      with frmENConnectionPowerPointShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTechConditionsObjectsObj.powerPointRef = nil then
                 ENTechConditionsObjectsObj.powerPointRef :=
                   ENConnectionPowerPointRef.Create();
               ENTechConditionsObjectsObj.powerPointRef.code :=
                 StrToInt(GetReturnValue(sgENConnectionPowerPoint,0));
               edtENConnectionPowerPointPowerPointRefName.Text :=
                 GetReturnValue(sgENConnectionPowerPoint, 1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionPowerPointShow.Free;
   end;
end;

procedure TfrmENTechConditionsObjectsEdit.updateTCOValues;
var
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  i, tcoValLastCount: Integer;
  ENTCOValuesList: ENTCOValuesShortList;
  tcoValuesFilter : ENTCOValuesFilter;
begin

  ClearGrid(sgENTCOValues);
  SetGridHeaders(ENTCOValuesHeaders, sgENTCOValues.ColumnHeaders);
  TempENTCOValues :=  HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;

   tcoValuesFilter := ENTCOValuesFilter.Create;
   SetNullIntProps(tcoValuesFilter);
   SetNullXSProps(tcoValuesFilter);
   tcoValuesFilter.techconditionsobjects := ENTechConditionsObjectsRef.Create;
   tcoValuesFilter.techconditionsobjects.code := ENTechConditionsObjectsObj.code;

  ENTCOValuesList := TempENTCOValues.getScrollableFilteredList(tcoValuesFilter,0,-1);
  tcoValLastCount:=High(ENTCOValuesList.list);

  if tcoValLastCount > -1 then
     sgENTCOValues.RowCount:=tcoValLastCount+2
  else
     sgENTCOValues.RowCount:=2;

   with sgENTCOValues do
    for i:=0 to tcoValLastCount do
      begin
        Application.ProcessMessages;
        if ENTCOValuesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTCOValuesList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENTCOValuesList.list[i].tcoValuesTypeName;

        Cells[2,i+1] := ENTCOValuesList.list[i].description;

        tcoValLastRow:=i+1;
        sgENTCOValues.RowCount:=tcoValLastRow+1;
      end;

    tcoValLastCount:=tcoValLastCount+1;
    sgENTCOValues.Row:=1;

end;

procedure TfrmENTechConditionsObjectsEdit.actDeleteTCOValExecute(
  Sender: TObject);
Var TempENTCOValues: ENTCOValuesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTCOValues.remove(ObjCode);
      updateTCOValues;
  end;
end;

procedure TfrmENTechConditionsObjectsEdit.actEditTCOValExecute(Sender: TObject);
var
  TempENTCOValues: ENTCOValuesControllerSoapPort;
  selectedRow: Integer;
begin
  TempENTCOValues := HTTPRIOENTCOValues as ENTCOValuesControllerSoapPort;
  try
    ENTCOValuesObj := TempENTCOValues.getObject(StrToInt(sgENTCOValues.Cells[0,sgENTCOValues.Row]));
  except
    on EConvertError do Exit;
  end;

  selectedRow := sgENTCOValues.Row;
  frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsEdit);

  try
    if frmENTCOValuesEdit.ShowModal= mrOk then
      begin
        updateTCOValues;
      end;
  finally
    frmENTCOValuesEdit.Free;
    frmENTCOValuesEdit:=nil;
  end;

  if sgENTCOValues.RowCount > selectedRow then
    sgENTCOValues.Row := selectedRow
  else
    sgENTCOValues.Row := sgENTCOValues.RowCount - 1;

end;

procedure TfrmENTechConditionsObjectsEdit.actInsertTCOValExecute(Sender: TObject);
begin

  ENTCOValuesObj:=ENTCOValues.Create;
  SetNullIntProps(ENTCOValuesObj);
  SetNullXSProps(ENTCOValuesObj);
  ENTCOValuesObj.techconditionsobjects := ENTechConditionsObjectsRef.Create;
  ENTCOValuesObj.techconditionsobjects.code := ENTechConditionsObjectsObj.code;

  try
    frmENTCOValuesEdit:=TfrmENTCOValuesEdit.Create(Application, dsInsert);
    try
      if frmENTCOValuesEdit.ShowModal = mrOk then
      begin
        if ENTCOValuesObj<>nil then
            updateTCOValues;
      end;
    finally
      frmENTCOValuesEdit.Free;
      frmENTCOValuesEdit:=nil;
    end;
  finally
    ENTCOValuesObj.Free;
  end;

end;


procedure TfrmENTechConditionsObjectsEdit.actUpdateTCOValExecute(
  Sender: TObject);
begin
    updateTCOValues;
end;

end.
