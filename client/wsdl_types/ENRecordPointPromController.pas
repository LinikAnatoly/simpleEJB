unit ENRecordPointPromController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   //,EPRenController
   ,ENElementController
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

  ENRecordPointProm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecordPointPromRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRecordPointProm = class(TRemotable)
  private
    Fcode : Integer;
    FaccountNumber : WideString;
    FaccountName : WideString;
    FaccountCode : Integer;
    FcounterNumber : WideString;
    FrecordPointName : WideString;
    FrecordPointAddr : WideString;
    FrecordPointKindName : WideString;
    FrecordPointCode : Integer;
    Ffeeder : WideString;
    Fsubstation : WideString;
    FinvNumber : WideString;
    Fdayofcalculation : Integer;
    Finspector : WideString;
    Fdatecontrol : TXSDate;
    Fdatetp : TXSDate;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
    FcontractDate : TXSDate;
//???
    Fren : EPRen;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property accountName : WideString read FaccountName write FaccountName;
    property accountCode : Integer read FaccountCode write FaccountCode;
    property counterNumber : WideString read FcounterNumber write FcounterNumber;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property recordPointAddr : WideString read FrecordPointAddr write FrecordPointAddr;
    property recordPointKindName : WideString read FrecordPointKindName write FrecordPointKindName;
    property recordPointCode : Integer read FrecordPointCode write FrecordPointCode;
    property feeder : WideString read Ffeeder write Ffeeder;
    property substation : WideString read Fsubstation write Fsubstation;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property dayofcalculation : Integer read Fdayofcalculation write Fdayofcalculation;
    property inspector : WideString read Finspector write Finspector;
    property datecontrol : TXSDate read Fdatecontrol write Fdatecontrol;
    property datetp : TXSDate read Fdatetp write Fdatetp;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property isworking : Integer read Fisworking write Fisworking;
    property fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property ren : EPRen read Fren write Fren;
    property element : ENElement read Felement write Felement;
  end;

{
  ENRecordPointPromFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FaccountNumber : WideString;
    FaccountName : WideString;
    FaccountCode : Integer;
    FcounterNumber : WideString;
    FrecordPointName : WideString;
    FrecordPointAddr : WideString;
    FrecordPointKindName : WideString;
    FrecordPointCode : Integer;
    Ffeeder : WideString;
    Fsubstation : WideString;
    FinvNumber : WideString;
    Fdayofcalculation : Integer;
    Finspector : WideString;
    Fdatecontrol : TXSDate;
    Fdatetp : TXSDate;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
    FcontractDate : TXSDate;
//???
    Fren : EPRen;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property accountName : WideString read FaccountName write FaccountName;
    property accountCode : Integer read FaccountCode write FaccountCode;
    property counterNumber : WideString read FcounterNumber write FcounterNumber;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property recordPointAddr : WideString read FrecordPointAddr write FrecordPointAddr;
    property recordPointKindName : WideString read FrecordPointKindName write FrecordPointKindName;
    property recordPointCode : Integer read FrecordPointCode write FrecordPointCode;
    property feeder : WideString read Ffeeder write Ffeeder;
    property substation : WideString read Fsubstation write Fsubstation;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property dayofcalculation : Integer read Fdayofcalculation write Fdayofcalculation;
    property inspector : WideString read Finspector write Finspector;
    property datecontrol : TXSDate read Fdatecontrol write Fdatecontrol;
    property datetp : TXSDate read Fdatetp write Fdatetp;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property isworking : Integer read Fisworking write Fisworking;
    property fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property ren : EPRen read Fren write Fren;
    property element : ENElement read Felement write Felement;
  end;
}

  ENRecordPointPromFilter = class(ENRecordPointProm)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRecordPointPromShort = class(TRemotable)
  private
    Fcode : Integer;
    FaccountNumber : WideString;
    FaccountName : WideString;
    FaccountCode : Integer;
    FcounterNumber : WideString;
    FrecordPointName : WideString;
    FrecordPointAddr : WideString;
    FrecordPointKindName : WideString;
    FrecordPointCode : Integer;
    Ffeeder : WideString;
    Fsubstation : WideString;
    FinvNumber : WideString;
    Fdayofcalculation : Integer;
    Finspector : WideString;
    Fdatecontrol : TXSDate;
    Fdatetp : TXSDate;
    FdateCounterInst : TXSDate;
    FdateCounterCheck : TXSDate;
    FcounterType : WideString;
    FclassAccuracy : TXSDecimal;
    Fcheckperiod : TXSDecimal;
    Fstatuscode : Integer;
    Fphasity : TXSDecimal;
    Fphone : WideString;
    Fseal : WideString;
    Fplacecounter : WideString;
    Fisworking : Integer;
    FfiderCode : Integer;
    FfiderName : WideString;
    FcounterCapacity : Integer;
    FcounterVoltageNominal : TXSDecimal;
    FcounterDateProduct : TXSDate;
    FdisablePlan : Integer;
    FcodeEIC : WideString;
    Ftower : WideString;
    Ffeeder04 : WideString;
    FdateFirstConsumption : TXSDate;
    FcontractDate : TXSDate;
    FrenCode : Integer;
    FrenName : WideString;
    FelementCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property accountName : WideString read FaccountName write FaccountName;
    property  accountCode : Integer read FaccountCode write FaccountCode;
    property counterNumber : WideString read FcounterNumber write FcounterNumber;
    property recordPointName : WideString read FrecordPointName write FrecordPointName;
    property recordPointAddr : WideString read FrecordPointAddr write FrecordPointAddr;
    property recordPointKindName : WideString read FrecordPointKindName write FrecordPointKindName;
    property  recordPointCode : Integer read FrecordPointCode write FrecordPointCode;
    property feeder : WideString read Ffeeder write Ffeeder;
    property substation : WideString read Fsubstation write Fsubstation;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property  dayofcalculation : Integer read Fdayofcalculation write Fdayofcalculation;
    property inspector : WideString read Finspector write Finspector;
    property datecontrol : TXSDate read Fdatecontrol write Fdatecontrol;
    property datetp : TXSDate read Fdatetp write Fdatetp;
    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;
    property classAccuracy : TXSDecimal read FclassAccuracy write FclassAccuracy;
    property checkperiod : TXSDecimal read Fcheckperiod write Fcheckperiod;
    property  statuscode : Integer read Fstatuscode write Fstatuscode;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property phone : WideString read Fphone write Fphone;
    property seal : WideString read Fseal write Fseal;
    property placecounter : WideString read Fplacecounter write Fplacecounter;
    property  isworking : Integer read Fisworking write Fisworking;
    property  fiderCode : Integer read FfiderCode write FfiderCode;
    property fiderName : WideString read FfiderName write FfiderName;
    property  counterCapacity : Integer read FcounterCapacity write FcounterCapacity;
    property counterVoltageNominal : TXSDecimal read FcounterVoltageNominal write FcounterVoltageNominal;
    property counterDateProduct : TXSDate read FcounterDateProduct write FcounterDateProduct;
    property  disablePlan : Integer read FdisablePlan write FdisablePlan;
    property codeEIC : WideString read FcodeEIC write FcodeEIC;
    property tower : WideString read Ftower write Ftower;
    property feeder04 : WideString read Ffeeder04 write Ffeeder04;
    property dateFirstConsumption : TXSDate read FdateFirstConsumption write FdateFirstConsumption;
    property contractDate : TXSDate read FcontractDate write FcontractDate;

    property renCode : Integer read FrenCode write FrenCode;
    property renName : WideString read FrenName write FrenName;
    property elementCode : Integer read FelementCode write FelementCode;
  end;

  ArrayOfENRecordPointPromShort = array of ENRecordPointPromShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRecordPointPromShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRecordPointPromShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRecordPointPromShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRecordPointPromController/message/
  // soapAction: http://ksoe.org/ENRecordPointPromController/action/ENRecordPointPromController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRecordPointPromControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRecordPointPromController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRecordPointPromControllerSoapPort = interface(IInvokable)
  ['{4E6C40F7-D9E4-47CF-9E6D-A5A0A70BDBB3}']
    function add(const aENRecordPointProm: ENRecordPointProm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRecordPointProm: ENRecordPointProm); stdcall;
    function getObject(const anObjectCode: Integer): ENRecordPointProm; stdcall;
    function getList: ENRecordPointPromShortList; stdcall;
    function getFilteredList(const aENRecordPointPromFilter: ENRecordPointPromFilter): ENRecordPointPromShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointPromShortList; stdcall;
    function getScrollableFilteredList(const aENRecordPointPromFilter: ENRecordPointPromFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointPromShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRecordPointPromShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRecordPointPromFilter: ENRecordPointPromFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRecordPointPromShort; stdcall;
    function getPersonalAccountUidByCode(const anObjectCode : Integer; const departmentCode : Integer) : WideString; stdcall;
  end;


implementation

  destructor ENRecordPointProm.Destroy;
  begin
    if Assigned(Fdatecontrol) then
      datecontrol.Free;
    if Assigned(Fdatetp) then
      datetp.Free;
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
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(Fren) then
      ren.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{
  destructor ENRecordPointPromFilter.Destroy;
  begin
    if Assigned(Fdatecontrol) then
      datecontrol.Free;
    if Assigned(Fdatetp) then
      datetp.Free;
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
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(Fren) then
      ren.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
}

  destructor ENRecordPointPromFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENRecordPointPromShort.Destroy;
  begin
    if Assigned(Fdatecontrol) then
      datecontrol.Free;
    if Assigned(Fdatetp) then
      datetp.Free;
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
    if Assigned(FcounterVoltageNominal) then
      counterVoltageNominal.Free;
    if Assigned(FcounterDateProduct) then
      counterDateProduct.Free;
    if Assigned(FdateFirstConsumption) then
      dateFirstConsumption.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    inherited Destroy;
  end;

  destructor ENRecordPointPromShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRecordPointProm, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointProm');
  RemClassRegistry.RegisterXSClass(ENRecordPointPromRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointPromRef');
  RemClassRegistry.RegisterXSClass(ENRecordPointPromFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointPromFilter');
  RemClassRegistry.RegisterXSClass(ENRecordPointPromShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointPromShort');
  RemClassRegistry.RegisterXSClass(ENRecordPointPromShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRecordPointPromShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRecordPointPromShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRecordPointPromShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRecordPointPromControllerSoapPort), 'http://ksoe.org/ENRecordPointPromController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRecordPointPromControllerSoapPort), 'http://ksoe.org/ENRecordPointPromController/action/ENRecordPointPromController.%operationName%');


end.
