//Контроллер Замен Разъединителей
unit ENDisconnectorChangeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController,
  EnergyProController2, ENDisconnectorController, ENSubstation04Controller,
  ENHighVoltageSellController, EquipChangeWorkerController,
  ENPlanWorkController, ENActController, ENLine10Controller, ENPostController,
  TKMaterialsController, ENTransformerController;

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

  ENDisconnectorChange            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorChangeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorChange = class(TRemotable)
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
    FdisconnectorRef : ENDisconnectorRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
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
    property disconnectorRef : ENDisconnectorRef read FdisconnectorRef write FdisconnectorRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property actRef : ENActRef read FactRef write FactRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENDisconnectorChangeFilter = class(TRemotable)
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
    FdisconnectorRef : ENDisconnectorRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
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
    property disconnectorRef : ENDisconnectorRef read FdisconnectorRef write FdisconnectorRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property actRef : ENActRef read FactRef write FactRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENDisconnectorChangeFilter = class(ENDisconnectorChange)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDisconnectorChangeShort = class(TRemotable)
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
    FdisconnectorRefCode : Integer; 
    FdisconnectorRefName : WideString;
    FdisconnectorRefRatedVoltage : TXSDecimal;
    FdisconnectorRefRatedCurrent : TXSDecimal;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmatDriveRefCode : Integer;
    FmatDriveRefName : WideString;
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
    FworkerCode : Integer; 
    FworkerName : WideString;
    FplanRefCode : Integer; 
    FactRefCode : Integer; 
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    Fline10RefExtentForest : TXSDecimal;
    FpostRefCode : Integer; 
    FpostRefName : WideString;
    FpostRefPostNumberGen : WideString;
    FpostRefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property actNumberGen : WideString read FactNumberGen write FactNumberGen;
    property actDateGen : TXSDate read FactDateGen write FactDateGen;
    property workerEquipChange : WideString read FworkerEquipChange write FworkerEquipChange;
    property disconnectorRefCode : Integer read FdisconnectorRefCode write FdisconnectorRefCode;
    property disconnectorRefName : WideString read FdisconnectorRefName write FdisconnectorRefName;
    property disconnectorRefRatedVoltage : TXSDecimal read FdisconnectorRefRatedVoltage write FdisconnectorRefRatedVoltage;
    property disconnectorRefRatedCurrent : TXSDecimal read FdisconnectorRefRatedCurrent write FdisconnectorRefRatedCurrent;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property matDriveRefCode : Integer read FmatDriveRefCode write FmatDriveRefCode; //TKMaterialsRef read FmatDriveRefCode write FmatDriveRefCode;
    property matDriveRefName : WideString read FmatDriveRefName write FmatDriveRefName;
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
    property workerCode : Integer read FworkerCode write FworkerCode; 
    property workerName : WideString read FworkerName write FworkerName; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; //ENPlanWorkRef read FplanRefCode write FplanRefCode; 
    property actRefCode : Integer read FactRefCode write FactRefCode; //ENActRef read FactRefCode write FactRefCode; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property line10RefExtentForest : TXSDecimal read Fline10RefExtentForest write Fline10RefExtentForest; 
    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen; 
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate; 
  end;

  ArrayOfENDisconnectorChangeShort = array of ENDisconnectorChangeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDisconnectorChangeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDisconnectorChangeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDisconnectorChangeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDisconnectorChangeController/message/
  // soapAction: http://ksoe.org/ENDisconnectorChangeController/action/ENDisconnectorChangeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDisconnectorChangeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDisconnectorChangeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDisconnectorChangeControllerSoapPort = interface(IInvokable)
  ['{142c142c-142c-142c-142c-142c142c142c}']
    function  add(const aENDisconnectorChange: ENDisconnectorChange): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDisconnectorChange: ENDisconnectorChange); stdcall;
    function  getObject(const anObjectCode: Integer): ENDisconnectorChange; stdcall;
    function  getList: ENDisconnectorChangeShortList; stdcall;
    function  getFilteredList(const aENDisconnectorChangeFilter: ENDisconnectorChangeFilter): ENDisconnectorChangeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorChangeShortList; stdcall;
    function  getScrollableFilteredList(const aENDisconnectorChangeFilter: ENDisconnectorChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorChangeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorChangeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDisconnectorChangeFilter: ENDisconnectorChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure installDisconnector(const anObject: ENDisconnector; //Установить разъединитель
      const aDChObject: ENDisconnectorChange); stdcall;
    procedure uninstallDisconnector(const anObject: ENDisconnector; //Снять разъединитель
      const aDChObject: ENDisconnectorChange); stdcall;
    procedure changeDisconnector(const anObjectOld: ENDisconnector; //Заменить разъединитель
      const aDChObjectOld: ENDisconnectorChange;
      const anObjectNew: ENDisconnector;
      const aDChObjectNew: ENDisconnectorChange); stdcall;
  end; 


implementation

  destructor ENDisconnectorChange.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FdisconnectorRef) then
      disconnectorRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENDisconnectorChangeFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FdisconnectorRef) then
      disconnectorRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENDisconnectorChangeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENDisconnectorChangeShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FdisconnectorRefRatedVoltage) then
      disconnectorRefRatedVoltage.Free;
    if Assigned(FdisconnectorRefRatedCurrent) then
      disconnectorRefRatedCurrent.Free;
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
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fline10RefExtentForest) then
      line10RefExtentForest.Free;
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENDisconnectorChangeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDisconnectorChange, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorChange');
  RemClassRegistry.RegisterXSClass(ENDisconnectorChangeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorChangeRef');
  RemClassRegistry.RegisterXSClass(ENDisconnectorChangeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorChangeFilter');
  RemClassRegistry.RegisterXSClass(ENDisconnectorChangeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorChangeShort');
  RemClassRegistry.RegisterXSClass(ENDisconnectorChangeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorChangeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDisconnectorChangeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDisconnectorChangeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDisconnectorChangeControllerSoapPort), 'http://ksoe.org/ENDisconnectorChangeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDisconnectorChangeControllerSoapPort), 'http://ksoe.org/ENDisconnectorChangeController/action/ENDisconnectorChangeController.%operationName%');


end.
