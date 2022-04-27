unit ENCustomerServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENCustomerServices            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCustomerServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCustomerServices = class(TRemotable)
  private
    FcustomerName : WideString;
    FcustomerAddress : WideString;
    FobjectsAddress : WideString;
    FdocNum : WideString;
    FdateRegistration : TXSDate;
    FtypeName : WideString;
    FserviceName : WideString;
    FdocStatus : WideString;
    FsourceInfo : WideString;
    FsourceTable : WideString;
    FsourceTableCode : Integer;
    FsourceType : Integer;
  public
    destructor Destroy; override;
  published
    property customerName : WideString read FcustomerName write FcustomerName;
    property customerAddress : WideString read FcustomerAddress write FcustomerAddress;
    property objectsAddress : WideString read FobjectsAddress write FobjectsAddress;
    property docNum : WideString read FdocNum write FdocNum;
    property dateRegistration : TXSDate read FdateRegistration write FdateRegistration;
    property typeName : WideString read FtypeName write FtypeName;
    property serviceName : WideString read FserviceName write FserviceName;
    property docStatus : WideString read FdocStatus write FdocStatus;
    property sourceInfo : WideString read FsourceInfo write FsourceInfo;
    property sourceTable : WideString read FsourceTable write FsourceTable;
    property sourceTableCode : Integer read FsourceTableCode write FsourceTableCode;
    property sourceType : Integer read FsourceType write FsourceType;
  end;

{
  ENCustomerServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    FcustomerName : WideString;
    FcustomerAddress : WideString;
    FobjectsAddress : WideString;
    FdocNum : WideString;
    FdateRegistration : TXSDate;
    FtypeName : WideString;
    FserviceName : WideString;
    FdocStatus : WideString;
    FsourceInfo : WideString;
    FsourceTable : WideString;
    FsourceTableCode : Integer;
    FsourceType : Integer;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property customerName : WideString read FcustomerName write FcustomerName;
    property customerAddress : WideString read FcustomerAddress write FcustomerAddress;
    property objectsAddress : WideString read FobjectsAddress write FobjectsAddress;
    property docNum : WideString read FdocNum write FdocNum;
    property dateRegistration : TXSDate read FdateRegistration write FdateRegistration;
    property typeName : WideString read FtypeName write FtypeName;
    property serviceName : WideString read FserviceName write FserviceName;
    property docStatus : WideString read FdocStatus write FdocStatus;
    property sourceInfo : WideString read FsourceInfo write FsourceInfo;
    property sourceTable : WideString read FsourceTable write FsourceTable;
    property sourceTableCode : Integer read FsourceTableCode write FsourceTableCode;
    property sourceType : Integer read FsourceType write FsourceType;
  end;
}

  ENCustomerServicesFilter = class(ENCustomerServices)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCustomerServicesShort = class(TRemotable)
  private
    FcustomerName : WideString;
    FcustomerAddress : WideString;
    FobjectsAddress : WideString;
    FdocNum : WideString;
    FdateRegistration : TXSDate;
    FtypeName : WideString;
    FserviceName : WideString;
    FdocStatus : WideString;
    FsourceInfo : WideString;
    FsourceTable : WideString;
    FsourceTableCode : Integer;
    FsourceType : Integer;
  public
    destructor Destroy; override;
  published
    property customerName : WideString read FcustomerName write FcustomerName;
    property customerAddress : WideString read FcustomerAddress write FcustomerAddress;
    property objectsAddress : WideString read FobjectsAddress write FobjectsAddress;
    property docNum : WideString read FdocNum write FdocNum;
    property dateRegistration : TXSDate read FdateRegistration write FdateRegistration;
    property typeName : WideString read FtypeName write FtypeName;
    property serviceName : WideString read FserviceName write FserviceName;
    property docStatus : WideString read FdocStatus write FdocStatus;
    property sourceInfo : WideString read FsourceInfo write FsourceInfo;
    property sourceTable : WideString read FsourceTable write FsourceTable;
    property sourceTableCode : Integer read FsourceTableCode write FsourceTableCode;
    property sourceType : Integer read FsourceType write FsourceType;

  end;

  ArrayOfENCustomerServicesShort = array of ENCustomerServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCustomerServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCustomerServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCustomerServicesShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCustomerServicesController/message/
  // soapAction: http://ksoe.org/ENCustomerServicesController/action/ENCustomerServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCustomerServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCustomerServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCustomerServicesControllerSoapPort = interface(IInvokable)
  ['{2708229A-CC0C-4350-A653-7040D0EC70F4}']
    function getList: ENCustomerServicesShortList; stdcall;
    function getFilteredList(const aENCustomerServicesFilter: ENCustomerServicesFilter): ENCustomerServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCustomerServicesShortList; stdcall;
    function getScrollableFilteredList(const aENCustomerServicesFilter: ENCustomerServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCustomerServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCustomerServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCustomerServicesFilter: ENCustomerServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCustomerServicesShort; stdcall;
  end;


implementation

  destructor ENCustomerServices.Destroy;
  begin
    if Assigned(FdateRegistration) then
      dateRegistration.Free;
    inherited Destroy;
  end;

{
  destructor ENCustomerServicesFilter.Destroy;
  begin
    if Assigned(FdateRegistration) then
      dateRegistration.Free;
    inherited Destroy;
  end;
}

  destructor ENCustomerServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCustomerServicesShort.Destroy;
  begin
    if Assigned(FdateRegistration) then
      dateRegistration.Free;
    inherited Destroy;
  end;

  destructor ENCustomerServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCustomerServices, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomerServices');
  RemClassRegistry.RegisterXSClass(ENCustomerServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomerServicesRef');
  RemClassRegistry.RegisterXSClass(ENCustomerServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomerServicesFilter');
  RemClassRegistry.RegisterXSClass(ENCustomerServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomerServicesShort');
  RemClassRegistry.RegisterXSClass(ENCustomerServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCustomerServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCustomerServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCustomerServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCustomerServicesControllerSoapPort), 'http://ksoe.org/ENCustomerServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCustomerServicesControllerSoapPort), 'http://ksoe.org/ENCustomerServicesController/action/ENCustomerServicesController.%operationName%');


end.
