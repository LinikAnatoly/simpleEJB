unit ENFuelInvResultTypeController;

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

  ENFuelInvResultType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInvResultTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInvResultType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENFuelInvResultTypeFilter = class(TRemotable)
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

  ENFuelInvResultTypeFilter = class(ENFuelInvResultType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelInvResultTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENFuelInvResultTypeShort = array of ENFuelInvResultTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelInvResultTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelInvResultTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelInvResultTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelInvResultTypeController/message/
  // soapAction: http://ksoe.org/ENFuelInvResultTypeController/action/ENFuelInvResultTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelInvResultTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelInvResultTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelInvResultTypeControllerSoapPort = interface(IInvokable)
  ['{62d862d8-62d8-62d8-62d8-62d862d862d8}']
    function add(const aENFuelInvResultType: ENFuelInvResultType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelInvResultType: ENFuelInvResultType); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelInvResultType; stdcall;
    function getList: ENFuelInvResultTypeShortList; stdcall;
    function getFilteredList(const aENFuelInvResultTypeFilter: ENFuelInvResultTypeFilter): ENFuelInvResultTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultTypeShortList; stdcall;
    function getScrollableFilteredList(const aENFuelInvResultTypeFilter: ENFuelInvResultTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInvResultTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelInvResultTypeFilter: ENFuelInvResultTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelInvResultTypeShort; stdcall;
  end;


implementation



  destructor ENFuelInvResultTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelInvResultType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultType');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultTypeRef');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultTypeFilter');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultTypeShort');
  RemClassRegistry.RegisterXSClass(ENFuelInvResultTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInvResultTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelInvResultTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelInvResultTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelInvResultTypeControllerSoapPort), 'http://ksoe.org/ENFuelInvResultTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelInvResultTypeControllerSoapPort), 'http://ksoe.org/ENFuelInvResultTypeController/action/ENFuelInvResultTypeController.%operationName%');


end.
