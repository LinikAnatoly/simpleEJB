unit ENIPImplementationTypeController;

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

  ENIPImplementationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPImplementationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPImplementationType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENIPImplementationTypeFilter = class(TRemotable)
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

  ENIPImplementationTypeFilter = class(ENIPImplementationType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPImplementationTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIPImplementationTypeShort = array of ENIPImplementationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPImplementationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPImplementationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPImplementationTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPImplementationTypeController/message/
  // soapAction: http://ksoe.org/ENIPImplementationTypeController/action/ENIPImplementationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPImplementationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPImplementationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPImplementationTypeControllerSoapPort = interface(IInvokable)
  ['{8f9a8f9a-8f9a-8f9a-8f9a-8f9a8f9a8f9a}']
    function add(const aENIPImplementationType: ENIPImplementationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPImplementationType: ENIPImplementationType); stdcall;
    function getObject(const anObjectCode: Integer): ENIPImplementationType; stdcall;
    function getList: ENIPImplementationTypeShortList; stdcall;
    function getFilteredList(const aENIPImplementationTypeFilter: ENIPImplementationTypeFilter): ENIPImplementationTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPImplementationTypeShortList; stdcall;
    function getScrollableFilteredList(const aENIPImplementationTypeFilter: ENIPImplementationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPImplementationTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPImplementationTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPImplementationTypeFilter: ENIPImplementationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPImplementationTypeShort; stdcall;
  end;


implementation



  destructor ENIPImplementationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPImplementationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPImplementationType');
  RemClassRegistry.RegisterXSClass(ENIPImplementationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPImplementationTypeRef');
  RemClassRegistry.RegisterXSClass(ENIPImplementationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPImplementationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENIPImplementationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPImplementationTypeShort');
  RemClassRegistry.RegisterXSClass(ENIPImplementationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPImplementationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPImplementationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPImplementationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPImplementationTypeControllerSoapPort), 'http://ksoe.org/ENIPImplementationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPImplementationTypeControllerSoapPort), 'http://ksoe.org/ENIPImplementationTypeController/action/ENIPImplementationTypeController.%operationName%');


end.
