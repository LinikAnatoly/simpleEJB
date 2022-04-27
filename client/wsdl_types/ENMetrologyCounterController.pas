unit ENMetrologyCounterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController, RQStorageZoneController
   ,TKAccountingTypeController

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

  ENMetrologyCounter            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyCounterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyCounter = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FcounterType : WideString;
    Fphasity : Integer;
    Fzones : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  scCode : Integer read FscCode write FscCode; 
    property counterType : WideString read FcounterType write FcounterType;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef;
    property phasity : Integer read Fphasity write Fphasity;
    property zones : Integer read Fzones write Fzones;
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef;
  end;

  ENMetrologyCounterFilter = class(ENMetrologyCounter)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;


  ENMetrologyCounterShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FcounterType : WideString;
    FelementCode : Integer;
    FzoneRefCode : Integer;
    FzoneRefName : WideString;
    Fphasity : Integer;
    Fzones : Integer;
	  // Доп. поля для пломб
	  ///////
    FtypeObject : Integer;
    FtabnExecutor : WideString;
    FfioExecutor : WideString;
    ForderBytNum : WideString;
    ForderBytDate : TXSDate;
    ///////
    FaccountingTypeRefCode : Integer;
    FaccountingTypeRefName : WideString;
    FisEmergency : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  scCode : Integer read FscCode write FscCode; 
    property counterType : WideString read FcounterType write FcounterType;
    property elementCode : Integer read FelementCode write FelementCode;
    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode;
    property zoneRefName : WideString read FzoneRefName write FzoneRefName;
    property phasity : Integer read Fphasity write Fphasity;
    property zones : Integer read Fzones write Fzones;
	  // Доп. поля для пломб
	  ///////
    property typeObject : Integer read FtypeObject write FtypeObject;
    property tabnExecutor : WideString read FtabnExecutor write FtabnExecutor;
    property fioExecutor : WideString read FfioExecutor write FfioExecutor;
    property orderBytNum : WideString read ForderBytNum write ForderBytNum;
    property orderBytDate : TXSDate read ForderBytDate write ForderBytDate;
    ///////
    property accountingTypeRefCode : Integer read FaccountingTypeRefCode write FaccountingTypeRefCode;
    property accountingTypeRefName : WideString read FaccountingTypeRefName write FaccountingTypeRefName;
    property isEmergency : TXSBoolean read FisEmergency write FisEmergency;
  end;

  ArrayOfENMetrologyCounterShort = array of ENMetrologyCounterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfENMetrologyCounters = array of ENMetrologyCounter;

  ENMetrologyCounterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMetrologyCounterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMetrologyCounterShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMetrologyCounterController/message/
  // soapAction: http://ksoe.org/ENMetrologyCounterController/action/ENMetrologyCounterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMetrologyCounterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMetrologyCounterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMetrologyCounterControllerSoapPort = interface(IInvokable)
['{450C9642-FB40-4E7F-8BAC-A45721EDB616}']
    function  add(const aENMetrologyCounter: ENMetrologyCounter): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMetrologyCounter: ENMetrologyCounter); stdcall;
    function  getObject(const anObjectCode: Integer): ENMetrologyCounter; stdcall;
    function  getList: ENMetrologyCounterShortList; stdcall;
    function  getFilteredList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter): ENMetrologyCounterShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; stdcall;
    function  getScrollableFilteredList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; stdcall;

    function  getCountersList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; stdcall; overload;
    function  getCountersList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer; accountingTypeCode : Integer): ENMetrologyCounterShortList; stdcall; overload;
    function  getCountersListDistinctName(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; stdcall;

    function  getSealsList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyCounterShortList; overload; stdcall;
    function  getSealsList(const aENMetrologyCounterFilter: ENMetrologyCounterFilter; const aFromPosition: Integer; const aQuantity: Integer; const aShowAll: Boolean): ENMetrologyCounterShortList; overload; stdcall;
    function  isAccountForParametrization(const account: WideString): TXSBoolean; stdcall;
    function  getStringAccountsForParametrization(): WideString; stdcall;
  
  
  end;


implementation

  destructor ENMetrologyCounter.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(zoneRef) then
      zoneRef.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
    inherited Destroy;
  end;
  
  destructor ENMetrologyCounterFilter.Destroy;
  begin
    inherited Destroy;
  end; 
  
  destructor ENMetrologyCounterShort.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(ForderBytDate) then
      orderBytDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENMetrologyCounterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMetrologyCounter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyCounter');
  RemClassRegistry.RegisterXSClass(ENMetrologyCounterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyCounterRef');
  RemClassRegistry.RegisterXSClass(ENMetrologyCounterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyCounterFilter');
  RemClassRegistry.RegisterXSClass(ENMetrologyCounterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyCounterShort');
  RemClassRegistry.RegisterXSClass(ENMetrologyCounterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyCounterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMetrologyCounterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMetrologyCounterShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMetrologyCounterControllerSoapPort), 'http://ksoe.org/ENMetrologyCounterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMetrologyCounterControllerSoapPort), 'http://ksoe.org/ENMetrologyCounterController/action/ENMetrologyCounterController.%operationName%');


end.
