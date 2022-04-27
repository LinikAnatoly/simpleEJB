unit ENAccess2EnelementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENAccess2Enelement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccess2EnelementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccess2Enelement = class(TRemotable)
  private
    Fcode : Integer;
    FisAccess : Integer;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  isAccess : Integer read FisAccess write FisAccess;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;

{
  ENAccess2EnelementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FisAccess : Integer;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  isAccess : Integer read FisAccess write FisAccess;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;
}

  ENAccess2EnelementFilter = class(ENAccess2Enelement)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAccess2EnelementShort = class(TRemotable)
  private
    Fcode : Integer;
    FisAccess : Integer;
    FelementRefCode : Integer;
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FrenName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  isAccess : Integer read FisAccess write FisAccess;


    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property renName : WideString read FrenName write FrenName;
  end;

  ArrayOfENAccess2EnelementShort = array of ENAccess2EnelementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAccess2EnelementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAccess2EnelementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAccess2EnelementShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAccess2EnelementController/message/
  // soapAction: http://ksoe.org/ENAccess2EnelementController/action/ENAccess2EnelementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAccess2EnelementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAccess2EnelementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAccess2EnelementControllerSoapPort = interface(IInvokable)
  ['{101a101a-101a-101a-101a-101a101a101a}']
    function add(const aENAccess2Enelement: ENAccess2Enelement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAccess2Enelement: ENAccess2Enelement); stdcall;
    function getObject(const anObjectCode: Integer): ENAccess2Enelement; stdcall;
    function getList: ENAccess2EnelementShortList; stdcall;
    function getFilteredList(const aENAccess2EnelementFilter: ENAccess2EnelementFilter): ENAccess2EnelementShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAccess2EnelementShortList; stdcall;
    function getScrollableFilteredList(const aENAccess2EnelementFilter: ENAccess2EnelementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAccess2EnelementShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAccess2EnelementShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAccess2EnelementFilter: ENAccess2EnelementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAccess2EnelementShort; stdcall;
  end;


implementation

  destructor ENAccess2Enelement.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAccess2EnelementFilter.Destroy;
  begin
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAccess2EnelementFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENAccess2EnelementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAccess2Enelement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccess2Enelement');
  RemClassRegistry.RegisterXSClass(ENAccess2EnelementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccess2EnelementRef');
  RemClassRegistry.RegisterXSClass(ENAccess2EnelementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccess2EnelementFilter');
  RemClassRegistry.RegisterXSClass(ENAccess2EnelementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccess2EnelementShort');
  RemClassRegistry.RegisterXSClass(ENAccess2EnelementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccess2EnelementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAccess2EnelementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAccess2EnelementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAccess2EnelementControllerSoapPort), 'http://ksoe.org/ENAccess2EnelementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAccess2EnelementControllerSoapPort), 'http://ksoe.org/ENAccess2EnelementController/action/ENAccess2EnelementController.%operationName%');


end.
