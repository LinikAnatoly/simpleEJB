unit ENTransformerChangeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransformerController 
   ,ENSubstation04Controller 
   ,EquipChangeWorkerController 
   ,ENPlanWorkController 
   ,ENActController 
;

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

  ENTransformerChange            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerChangeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerChange = class(TRemotable)
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
    FtransformerRef : ENTransformerRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
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
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
  
{
  ENTransformerChangeFilter = class(TRemotable)
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
    FtransformerRef : ENTransformerRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    Fworker : EquipChangeWorker;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
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
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property worker : EquipChangeWorker read Fworker write Fworker; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
}

  ENTransformerChangeFilter = class(ENTransformerChange)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransformerChangeShort = class(TRemotable)
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
    FworkerCode : Integer; 
    FworkerName : WideString;
    FplanRefCode : Integer; 
    FactRefCode : Integer; 
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
    property workerCode : Integer read FworkerCode write FworkerCode; 
    property workerName : WideString read FworkerName write FworkerName; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; //ENPlanWorkRef read FplanRefCode write FplanRefCode; 
    property actRefCode : Integer read FactRefCode write FactRefCode; //ENActRef read FactRefCode write FactRefCode; 
  end;

  ArrayOfENTransformerChangeShort = array of ENTransformerChangeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransformerChangeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransformerChangeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransformerChangeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransformerChangeController/message/
  // soapAction: http://ksoe.org/ENTransformerChangeController/action/ENTransformerChangeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransformerChangeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransformerChangeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransformerChangeControllerSoapPort = interface(IInvokable)
  ['{1b1a1b1a-1b1a-1b1a-1b1a-1b1a1b1a1b1a}']
    function  add(const aENTransformerChange: ENTransformerChange): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransformerChange: ENTransformerChange); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransformerChange; stdcall;
    function  getList: ENTransformerChangeShortList; stdcall;
    function  getFilteredList(const aENTransformerChangeFilter: ENTransformerChangeFilter): ENTransformerChangeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransformerChangeShortList; stdcall;
    function  getScrollableFilteredList(const aENTransformerChangeFilter: ENTransformerChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerChangeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerChangeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransformerChangeFilter: ENTransformerChangeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure installTransformer(const anObject: ENTransformer;
      const anTrChObject: ENTransformerChange); stdcall;
    procedure uninstallTransformer(const anObject: ENTransformer;
      const anTrChObject: ENTransformerChange); stdcall;
    procedure changeTransformer(const anObjectOld: ENTransformer;
      const anTrChObjectOld: ENTransformerChange;
      const anObjectNew: ENTransformer;
      const anTrChObjectNew: ENTransformerChange); stdcall;
  end; 


implementation

  destructor ENTransformerChange.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransformerChangeFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransformerChangeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransformerChangeShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FactDateGen) then
      actDateGen.Free;
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
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransformerChangeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransformerChange, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerChange');
  RemClassRegistry.RegisterXSClass(ENTransformerChangeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerChangeRef');
  RemClassRegistry.RegisterXSClass(ENTransformerChangeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerChangeFilter');
  RemClassRegistry.RegisterXSClass(ENTransformerChangeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerChangeShort');
  RemClassRegistry.RegisterXSClass(ENTransformerChangeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerChangeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransformerChangeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransformerChangeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransformerChangeControllerSoapPort), 'http://ksoe.org/ENTransformerChangeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransformerChangeControllerSoapPort), 'http://ksoe.org/ENTransformerChangeController/action/ENTransformerChangeController.%operationName%');


end.
