unit ENElement2DistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENTransportDepartmentController
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

  ENElement2Distance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2DistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2Distance = class(TRemotable)
  private
    Fcode : Integer;
    Fdistance : TXSDecimal;
//???
    FelementRef : ENElementRef;
//???
    FtransportDepartment : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property transportDepartment : ENTransportDepartmentRef read FtransportDepartment write FtransportDepartment;
  end;

{
  ENElement2DistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fdistance : TXSDecimal;
//???
    FelementRef : ENElementRef;
//???
    FtransportDepartment : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property distance : TXSDecimal read Fdistance write Fdistance;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property transportDepartment : ENTransportDepartmentRef read FtransportDepartment write FtransportDepartment;
  end;
}

  ENElement2DistanceFilter = class(ENElement2Distance)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2DistanceShort = class(TRemotable)
  private
    Fcode : Integer;
    Fdistance : TXSDecimal;
    FelementRefCode : Integer;
    FtransportDepartmentCode : Integer;
    FtransportDepartmentName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property distance : TXSDecimal read Fdistance write Fdistance;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property transportDepartmentCode : Integer read FtransportDepartmentCode write FtransportDepartmentCode;
    property transportDepartmentName : WideString read FtransportDepartmentName write FtransportDepartmentName;
  end;

  ArrayOfENElement2DistanceShort = array of ENElement2DistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2DistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2DistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2DistanceShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2DistanceController/message/
  // soapAction: http://ksoe.org/ENElement2DistanceController/action/ENElement2DistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2DistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2DistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2DistanceControllerSoapPort = interface(IInvokable)
  ['{13BB817A-11CE-4E74-810B-E9DFFB5DCE88}']
    function add(const aENElement2Distance: ENElement2Distance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2Distance: ENElement2Distance); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2Distance; stdcall;
    function getList: ENElement2DistanceShortList; stdcall;
    function getFilteredList(const aENElement2DistanceFilter: ENElement2DistanceFilter): ENElement2DistanceShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2DistanceShortList; stdcall;
    function getScrollableFilteredList(const aENElement2DistanceFilter: ENElement2DistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2DistanceShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2DistanceShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2DistanceFilter: ENElement2DistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2DistanceShort; stdcall;
  end;


implementation

  destructor ENElement2Distance.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    inherited Destroy;
  end;

{
  destructor ENElement2DistanceFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    inherited Destroy;
  end;
}

  destructor ENElement2DistanceFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENElement2DistanceShort.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    inherited Destroy;
  end;

  destructor ENElement2DistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2Distance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2Distance');
  RemClassRegistry.RegisterXSClass(ENElement2DistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2DistanceRef');
  RemClassRegistry.RegisterXSClass(ENElement2DistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2DistanceFilter');
  RemClassRegistry.RegisterXSClass(ENElement2DistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2DistanceShort');
  RemClassRegistry.RegisterXSClass(ENElement2DistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2DistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2DistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2DistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2DistanceControllerSoapPort), 'http://ksoe.org/ENElement2DistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2DistanceControllerSoapPort), 'http://ksoe.org/ENElement2DistanceController/action/ENElement2DistanceController.%operationName%');


end.
