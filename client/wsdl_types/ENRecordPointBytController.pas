unit ENRecordPointBytController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENSiteController
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

  ENRecordPointByt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecordPointBytRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecordPointByt = class(TRemotable)
  private
    Fcode : Integer;
    FaccountNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    Faddress : WideString;
    FcommentGen : WideString;
    FrpCode : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FinvNumber : WideString;
    FserialNumber : WideString;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FareaType : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
//???
    Felement : ENElement;
//???
    FsiteRef : ENSiteRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property rpCode : Integer read FrpCode write FrpCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property isworking : Integer read Fisworking write Fisworking;
    property counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property areaType : Integer read FareaType write FareaType;
    property fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;
    property element : ENElement read Felement write Felement;
    property siteRef : ENSiteRef read FsiteRef write FsiteRef;
  end;

{
  ENRecordPointBytFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FaccountNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    Faddress : WideString;
    FcommentGen : WideString;
    FrpCode : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FinvNumber : WideString;
    FserialNumber : WideString;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FareaType : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
//???
    Felement : ENElement;
//???
    FsiteRef : ENSiteRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property rpCode : Integer read FrpCode write FrpCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property isworking : Integer read Fisworking write Fisworking;
    property counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property areaType : Integer read FareaType write FareaType;
    property fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;
    property element : ENElement read Felement write Felement;
    property siteRef : ENSiteRef read FsiteRef write FsiteRef;
  end;
}

  ENRecordPointBytFilter = class(ENRecordPointByt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRecordPointBytShort = class(TRemotable)
  private
    Fcode : Integer;
    FaccountNumber : WideString;
    FcontractDate : TXSDate;
    Fname : WideString;
    Faddress : WideString;
    FrpCode : Integer;
    FinvNumber : WideString;
    FserialNumber : WideString;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fdatecheck : TXSDate;
    Fcheckperiod1 : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FareaType : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
    FelementCode : Integer;
    FsiteRefCode : Integer;
    FsiteRefName : WideString;
    FsiteRefSiteaddress : WideString;
    FsiteRefSitephone : WideString;
    FrenName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property name : WideString read Fname write Fname;
    property address : WideString read Faddress write Faddress;
    property  rpCode : Integer read FrpCode write FrpCode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property  statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property datecheck : TXSDate read Fdatecheck write Fdatecheck;
    property checkperiod1 : TXSDecimal read Fcheckperiod1 write Fcheckperiod1;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property  isworking : Integer read Fisworking write Fisworking;
    property  counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property  areaType : Integer read FareaType write FareaType;
    property  fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property  disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;

    property elementCode : Integer read FelementCode write FelementCode;
    property siteRefCode : Integer read FsiteRefCode write FsiteRefCode;
    property siteRefName : WideString read FsiteRefName write FsiteRefName;
    property siteRefSiteaddress : WideString read FsiteRefSiteaddress write FsiteRefSiteaddress;
    property siteRefSitephone : WideString read FsiteRefSitephone write FsiteRefSitephone;
    property renName : WideString read FrenName write FrenName;
  end;

  ArrayOfENRecordPointBytShort = array of ENRecordPointBytShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRecordPointBytShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRecordPointBytShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRecordPointBytShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRecordPointBytController/message/
  // soapAction: http://ksoe.org/ENRecordPointBytController/action/ENRecordPointBytController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRecordPointBytControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRecordPointBytController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRecordPointBytControllerSoapPort = interface(IInvokable)
  ['{B97B9BE5-4BD6-4C66-8455-C7F4251A4740}']
    function add(const aENRecordPointByt: ENRecordPointByt): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRecordPointByt: ENRecordPointByt); stdcall;
    function getObject(const anObjectCode: Integer): ENRecordPointByt; stdcall;
    function getList: ENRecordPointBytShortList; stdcall;
    function getFilteredList(const aENRecordPointBytFilter: ENRecordPointBytFilter): ENRecordPointBytShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointBytShortList; stdcall;
    function getScrollableFilteredList(const aENRecordPointBytFilter: ENRecordPointBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointBytShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointBytShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRecordPointBytFilter: ENRecordPointBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRecordPointBytShort; stdcall;
    function getPersonalAccountUidByCode(const anObjectCode : Integer; const departmentCode : Integer) : WideString; stdcall;
  end;


implementation

  destructor ENRecordPointByt.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FsiteRef) then
      siteRef.Free;
    inherited Destroy;
  end;

{
  destructor ENRecordPointBytFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FsiteRef) then
      siteRef.Free;
    inherited Destroy;
  end;
}

  destructor ENRecordPointBytFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENRecordPointBytShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateCounterInst) then
      dateCounterInst.Free;
    if Assigned(FdateCounterCheck) then
      dateCounterCheck.Free;
    if Assigned(FclassAccuracy) then
      classAccuracy.Free;
    if Assigned(Fcheckperiod) then
      checkperiod.Free;
    if Assigned(Fphasity) then
      phasity.Free;
    if Assigned(Fdatecheck) then
      datecheck.Free;
    if Assigned(Fcheckperiod1) then
      checkperiod1.Free;
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    inherited Destroy;
  end;

  destructor ENRecordPointBytShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRecordPointByt, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointByt');
  RemClassRegistry.RegisterXSClass(ENRecordPointBytRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointBytRef');
  RemClassRegistry.RegisterXSClass(ENRecordPointBytFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointBytFilter');
  RemClassRegistry.RegisterXSClass(ENRecordPointBytShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointBytShort');
  RemClassRegistry.RegisterXSClass(ENRecordPointBytShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointBytShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRecordPointBytShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRecordPointBytShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRecordPointBytControllerSoapPort), 'http://ksoe.org/ENRecordPointBytController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRecordPointBytControllerSoapPort), 'http://ksoe.org/ENRecordPointBytController/action/ENRecordPointBytController.%operationName%');


end.
