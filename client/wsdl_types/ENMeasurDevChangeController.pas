//Контроллер Замен Измерительных Устройств
unit ENMeasurDevChangeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController,
  EnergyProController2, ENMeasurDeviceController, ENSubstation04Controller,
  ENHighVoltageSellController, ENBranchController, EquipChangeWorkerController,
  ENPlanWorkController, ENActController, ENLowVoltBoardController,
  ENPanelController, TKMaterialsController, ENTransformerController;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"
  // !:date            - "http://www.w3.org/2001/XMLSchema"
  // !:long            - "http://www.w3.org/2001/XMLSchema"
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENMeasurDevChange            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDevChangeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDevChange = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;
    FactNumberGen : WideString;
    FactDateGen : TXSDate;
    FworkerEquipChange : WideString;
//???
    FmeasurDeviceRef : ENMeasurDeviceRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    FbranchRef : ENBranchRef;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    FpnlRef : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property actNumberGen : WideString read FactNumberGen write FactNumberGen;
    property actDateGen : TXSDate read FactDateGen write FactDateGen;
    property workerEquipChange : WideString read FworkerEquipChange write FworkerEquipChange;
    property measurDeviceRef : ENMeasurDeviceRef read FmeasurDeviceRef write FmeasurDeviceRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property branchRef : ENBranchRef read FbranchRef write FbranchRef; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property actRef : ENActRef read FactRef write FactRef; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property pnlRef : ENPanelRef read FpnlRef write FpnlRef; 
  end;
  
{
  ENMeasurDevChangeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;
    FactNumberGen : WideString;
    FactDateGen : TXSDate;
    FworkerEquipChange : WideString;
//???
    FmeasurDeviceRef : ENMeasurDeviceRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    FbranchRef : ENBranchRef;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    FpnlRef : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property actNumberGen : WideString read FactNumberGen write FactNumberGen;
    property actDateGen : TXSDate read FactDateGen write FactDateGen;
    property workerEquipChange : WideString read FworkerEquipChange write FworkerEquipChange;
    property measurDeviceRef : ENMeasurDeviceRef read FmeasurDeviceRef write FmeasurDeviceRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property branchRef : ENBranchRef read FbranchRef write FbranchRef; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property pnlRef : ENPanelRef read FpnlRef write FpnlRef; 
  end;
}

  ENMeasurDevChangeFilter = class(ENMeasurDevChange)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMeasurDevChangeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FinstallDate : TXSDate;	
    FuninstallDate : TXSDate;	
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;	
    FactNumberGen : WideString;
    FactDateGen : TXSDate;	
    FworkerEquipChange : WideString;
    FmeasurDeviceRefCode : Integer; 
    FmeasurDeviceRefName : WideString;
    FmeasurDeviceRefWorkNumber : WideString;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    Fsubstation04RefCode : Integer; 
    Fsubstation04RefName : WideString;
    Fsubstation04RefBuhName : WideString;
    Fsubstation04RefInvNumber : WideString;
    Fsubstation04RefNominalPower : TXSDecimal;
    Fsubstation04RefLastRepairDate : TXSDate;
    Fsubstation04RefSizCode : Integer; 
    Fsubstation04RefAddress : WideString;
    Fsubstation04RefYearBuild : Integer; 
    Fsubstation04RefYearWorkingStart : Integer; 
    Fsubstation04RefChambersQuantity : Integer; 
    FtransformerRefCode : Integer; 
    FtransformerRefInvNumber : WideString;
    FtransformerRefName : WideString;
    FtransformerRefBuhName : WideString;
    FtransformerRefNominalPower : TXSDecimal;
    FtransformerRefHighVoltage : TXSDecimal;
    FtransformerRefLowVoltage : TXSDecimal;
    FtransformerRefHighCurrent : TXSDecimal;
    FtransformerRefLowCurrent : TXSDecimal;
    FtransformerRefUkz : TXSDecimal;
    FtransformerRefManufacturingdPlant : WideString;
    FtransformerRefSerialNumber : WideString;
    FtransformerRefManufactureYear : TXSDate;
    FtransformerRefInstallDate : TXSDate;
    FtransformerRefRemovalDate : TXSDate;
    FtransformerRefConnectGroup : WideString;
    FhighVoltCellRefCode : Integer; 
    FhighVoltCellRefName : WideString;
    FhighVoltCellRefNumberGen : WideString;
    FbranchRefCode : Integer; 
    FbranchRefName : WideString;
    FbranchRefBasicConsumer : WideString;
    FbranchRefNumberGen : WideString;
    FbranchRefCurrentAdmis : TXSDecimal;
    FworkerCode : Integer; 
    FworkerName : WideString;
    FplanRefCode : Integer; 
    FactRefCode : Integer; 
    FlvbRefCode : Integer; 
    FlvbRefName : WideString;
    FpnlRefCode : Integer; 
    FpnlRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property actNumberGen : WideString read FactNumberGen write FactNumberGen;
    property actDateGen : TXSDate read FactDateGen write FactDateGen;
    property workerEquipChange : WideString read FworkerEquipChange write FworkerEquipChange;

    property measurDeviceRefCode : Integer read FmeasurDeviceRefCode write FmeasurDeviceRefCode; 
    property measurDeviceRefName : WideString read FmeasurDeviceRefName write FmeasurDeviceRefName; 
    property measurDeviceRefWorkNumber : WideString read FmeasurDeviceRefWorkNumber write FmeasurDeviceRefWorkNumber; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property substation04RefCode : Integer read Fsubstation04RefCode write Fsubstation04RefCode;
    property substation04RefName : WideString read Fsubstation04RefName write Fsubstation04RefName; 
    property substation04RefBuhName : WideString read Fsubstation04RefBuhName write Fsubstation04RefBuhName; 
    property substation04RefInvNumber : WideString read Fsubstation04RefInvNumber write Fsubstation04RefInvNumber; 
    property substation04RefNominalPower : TXSDecimal read Fsubstation04RefNominalPower write Fsubstation04RefNominalPower; 
    property substation04RefLastRepairDate : TXSDate read Fsubstation04RefLastRepairDate write Fsubstation04RefLastRepairDate; 
    property substation04RefSizCode : Integer read Fsubstation04RefSizCode write Fsubstation04RefSizCode; 
    property substation04RefAddress : WideString read Fsubstation04RefAddress write Fsubstation04RefAddress; 
    property substation04RefYearBuild : Integer read Fsubstation04RefYearBuild write Fsubstation04RefYearBuild; 
    property substation04RefYearWorkingStart : Integer read Fsubstation04RefYearWorkingStart write Fsubstation04RefYearWorkingStart; 
    property substation04RefChambersQuantity : Integer read Fsubstation04RefChambersQuantity write Fsubstation04RefChambersQuantity; 
    property transformerRefCode : Integer read FtransformerRefCode write FtransformerRefCode; 
    property transformerRefInvNumber : WideString read FtransformerRefInvNumber write FtransformerRefInvNumber; 
    property transformerRefName : WideString read FtransformerRefName write FtransformerRefName; 
    property transformerRefBuhName : WideString read FtransformerRefBuhName write FtransformerRefBuhName; 
    property transformerRefNominalPower : TXSDecimal read FtransformerRefNominalPower write FtransformerRefNominalPower; 
    property transformerRefHighVoltage : TXSDecimal read FtransformerRefHighVoltage write FtransformerRefHighVoltage; 
    property transformerRefLowVoltage : TXSDecimal read FtransformerRefLowVoltage write FtransformerRefLowVoltage; 
    property transformerRefHighCurrent : TXSDecimal read FtransformerRefHighCurrent write FtransformerRefHighCurrent; 
    property transformerRefLowCurrent : TXSDecimal read FtransformerRefLowCurrent write FtransformerRefLowCurrent; 
    property transformerRefUkz : TXSDecimal read FtransformerRefUkz write FtransformerRefUkz; 
    property transformerRefManufacturingdPlant : WideString read FtransformerRefManufacturingdPlant write FtransformerRefManufacturingdPlant; 
    property transformerRefSerialNumber : WideString read FtransformerRefSerialNumber write FtransformerRefSerialNumber; 
    property transformerRefManufactureYear : TXSDate read FtransformerRefManufactureYear write FtransformerRefManufactureYear; 
    property transformerRefInstallDate : TXSDate read FtransformerRefInstallDate write FtransformerRefInstallDate; 
    property transformerRefRemovalDate : TXSDate read FtransformerRefRemovalDate write FtransformerRefRemovalDate; 
    property transformerRefConnectGroup : WideString read FtransformerRefConnectGroup write FtransformerRefConnectGroup; 
    property highVoltCellRefCode : Integer read FhighVoltCellRefCode write FhighVoltCellRefCode; 
    property highVoltCellRefName : WideString read FhighVoltCellRefName write FhighVoltCellRefName; 
    property highVoltCellRefNumberGen : WideString read FhighVoltCellRefNumberGen write FhighVoltCellRefNumberGen; 
    property branchRefCode : Integer read FbranchRefCode write FbranchRefCode; 
    property branchRefName : WideString read FbranchRefName write FbranchRefName; 
    property branchRefBasicConsumer : WideString read FbranchRefBasicConsumer write FbranchRefBasicConsumer; 
    property branchRefNumberGen : WideString read FbranchRefNumberGen write FbranchRefNumberGen; 
    property branchRefCurrentAdmis : TXSDecimal read FbranchRefCurrentAdmis write FbranchRefCurrentAdmis; 
    property workerCode : Integer read FworkerCode write FworkerCode; 
    property workerName : WideString read FworkerName write FworkerName; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; //ENPlanWorkRef read FplanRefCode write FplanRefCode; 
    property actRefCode : Integer read FactRefCode write FactRefCode; //ENActRef read FactRefCode write FactRefCode; 
    property lvbRefCode : Integer read FlvbRefCode write FlvbRefCode; 
    property lvbRefName : WideString read FlvbRefName write FlvbRefName; 
    property pnlRefCode : Integer read FpnlRefCode write FpnlRefCode; 
    property pnlRefName : WideString read FpnlRefName write FpnlRefName; 
  end;

  ArrayOfENMeasurDevChangeShort = array of ENMeasurDevChangeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMeasurDevChangeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMeasurDevChangeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMeasurDevChangeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMeasurDevChangeController/message/
  // soapAction: http://ksoe.org/ENMeasurDevChangeController/action/ENMeasurDevChangeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMeasurDevChangeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMeasurDevChangeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMeasurDevChangeControllerSoapPort = interface(IInvokable)
  ['{81998199-8199-8199-8199-819981998199}']
    function  add(const aENMeasurDevChange: ENMeasurDevChange): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMeasurDevChange: ENMeasurDevChange); stdcall;
    function  getObject(const anObjectCode: Integer): ENMeasurDevChange; stdcall;
    function  getList: ENMeasurDevChangeShortList; stdcall;
    function  getFilteredList(const aENMeasurDevChangeFilter: ENMeasurDevChangeFilter): ENMeasurDevChangeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDevChangeShortList; stdcall;
    function  getScrollableFilteredList(const aENMeasurDevChangeFilter: ENMeasurDevChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDevChangeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDevChangeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMeasurDevChangeFilter: ENMeasurDevChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure installMeasurDevice(const anObject: ENMeasurDevice; //Установить измерительный прибор
      const aMeasurDevChObject: ENMeasurDevChange); stdcall;
    procedure uninstallMeasurDevice(const anObject: ENMeasurDevice; //Снять измерительный прибор
      const aMeasurDevChObject: ENMeasurDevChange); stdcall;
    procedure changeMeasurDevice(const anObjectOld: ENMeasurDevice; //Заменить измерительный прибор
      const aMeasurDevChObjectOld: ENMeasurDevChange;
      const anObjectNew: ENMeasurDevice;
      const aMeasurDevChObjectNew: ENMeasurDevChange); stdcall;
  end; 


implementation

  destructor ENMeasurDevChange.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FmeasurDeviceRef) then
      measurDeviceRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(FpnlRef) then
      pnlRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENMeasurDevChangeFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FmeasurDeviceRef) then
      measurDeviceRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(FpnlRef) then
      pnlRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENMeasurDevChangeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENMeasurDevChangeShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    if Assigned(FtransformerRefNominalPower) then
      transformerRefNominalPower.Free;
    if Assigned(FtransformerRefHighVoltage) then
      transformerRefHighVoltage.Free;
    if Assigned(FtransformerRefLowVoltage) then
      transformerRefLowVoltage.Free;
    if Assigned(FtransformerRefHighCurrent) then
      transformerRefHighCurrent.Free;
    if Assigned(FtransformerRefLowCurrent) then
      transformerRefLowCurrent.Free;
    if Assigned(FtransformerRefUkz) then
      transformerRefUkz.Free;
    if Assigned(FtransformerRefManufactureYear) then
      transformerRefManufactureYear.Free;
    if Assigned(FtransformerRefInstallDate) then
      transformerRefInstallDate.Free;
    if Assigned(FtransformerRefRemovalDate) then
      transformerRefRemovalDate.Free;
    if Assigned(FbranchRefCurrentAdmis) then
      branchRefCurrentAdmis.Free;
    inherited Destroy;
  end; 
  
  destructor ENMeasurDevChangeShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;



initialization

  RemClassRegistry.RegisterXSClass(ENMeasurDevChange, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevChange');
  RemClassRegistry.RegisterXSClass(ENMeasurDevChangeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevChangeRef');
  RemClassRegistry.RegisterXSClass(ENMeasurDevChangeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevChangeFilter');
  RemClassRegistry.RegisterXSClass(ENMeasurDevChangeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevChangeShort');
  RemClassRegistry.RegisterXSClass(ENMeasurDevChangeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevChangeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMeasurDevChangeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMeasurDevChangeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMeasurDevChangeControllerSoapPort), 'http://ksoe.org/ENMeasurDevChangeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMeasurDevChangeControllerSoapPort), 'http://ksoe.org/ENMeasurDevChangeController/action/ENMeasurDevChangeController.%operationName%');


end.
