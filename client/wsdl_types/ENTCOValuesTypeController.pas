unit ENTCOValuesTypeController;

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

  ENTCOValuesType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTCOValuesTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTCOValuesType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENTCOValuesTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENTCOValuesTypeFilter = class(ENTCOValuesType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTCOValuesTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTCOValuesTypeShort = array of ENTCOValuesTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTCOValuesTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTCOValuesTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTCOValuesTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTCOValuesTypeController/message/
  // soapAction: http://ksoe.org/ENTCOValuesTypeController/action/ENTCOValuesTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTCOValuesTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTCOValuesTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTCOValuesTypeControllerSoapPort = interface(IInvokable)
  ['{5A8C86FF-2F10-49CB-910E-4BA50C7EAFC7}']
    function add(const aENTCOValuesType: ENTCOValuesType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTCOValuesType: ENTCOValuesType); stdcall;
    function getObject(const anObjectCode: Integer): ENTCOValuesType; stdcall;
    function getList: ENTCOValuesTypeShortList; stdcall;
    function getFilteredList(const aENTCOValuesTypeFilter: ENTCOValuesTypeFilter): ENTCOValuesTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesTypeShortList; stdcall;
    function getScrollableFilteredList(const aENTCOValuesTypeFilter: ENTCOValuesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTCOValuesTypeFilter: ENTCOValuesTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTCOValuesTypeShort; stdcall;
  end;


implementation



  destructor ENTCOValuesTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTCOValuesType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesType');
  RemClassRegistry.RegisterXSClass(ENTCOValuesTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesTypeRef');
  RemClassRegistry.RegisterXSClass(ENTCOValuesTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTCOValuesTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesTypeShort');
  RemClassRegistry.RegisterXSClass(ENTCOValuesTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTCOValuesTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTCOValuesTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTCOValuesTypeControllerSoapPort), 'http://ksoe.org/ENTCOValuesTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTCOValuesTypeControllerSoapPort), 'http://ksoe.org/ENTCOValuesTypeController/action/ENTCOValuesTypeController.%operationName%');


end.
