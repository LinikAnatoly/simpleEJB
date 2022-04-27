unit ENCheckpointEventTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENCheckpointEventType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointEventTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointEventType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENCheckpointEventTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENCheckpointEventTypeFilter = class(ENCheckpointEventType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCheckpointEventTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCheckpointEventTypeShort = array of ENCheckpointEventTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCheckpointEventTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCheckpointEventTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCheckpointEventTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCheckpointEventTypeController/message/
  // soapAction: http://ksoe.org/ENCheckpointEventTypeController/action/ENCheckpointEventTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCheckpointEventTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCheckpointEventTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCheckpointEventTypeControllerSoapPort = interface(IInvokable)
  ['{7b487b48-7b48-7b48-7b48-7b487b487b48}']
    function add(const aENCheckpointEventType: ENCheckpointEventType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCheckpointEventType: ENCheckpointEventType); stdcall;
    function getObject(const anObjectCode: Integer): ENCheckpointEventType; stdcall;
    function getList: ENCheckpointEventTypeShortList; stdcall;
    function getFilteredList(const aENCheckpointEventTypeFilter: ENCheckpointEventTypeFilter): ENCheckpointEventTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointEventTypeShortList; stdcall;
    function getScrollableFilteredList(const aENCheckpointEventTypeFilter: ENCheckpointEventTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointEventTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointEventTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCheckpointEventTypeFilter: ENCheckpointEventTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCheckpointEventTypeShort; stdcall;
  end;


implementation



  destructor ENCheckpointEventTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCheckpointEventType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointEventType');
  RemClassRegistry.RegisterXSClass(ENCheckpointEventTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointEventTypeRef');
  RemClassRegistry.RegisterXSClass(ENCheckpointEventTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointEventTypeFilter');
  RemClassRegistry.RegisterXSClass(ENCheckpointEventTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointEventTypeShort');
  RemClassRegistry.RegisterXSClass(ENCheckpointEventTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointEventTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCheckpointEventTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCheckpointEventTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCheckpointEventTypeControllerSoapPort), 'http://ksoe.org/ENCheckpointEventTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCheckpointEventTypeControllerSoapPort), 'http://ksoe.org/ENCheckpointEventTypeController/action/ENCheckpointEventTypeController.%operationName%');


end.
