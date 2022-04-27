unit ENWorkOrderBytTypeController;

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

  ENWorkOrderBytType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENWorkOrderBytTypeFilter = class(TRemotable)
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

  ENWorkOrderBytTypeFilter = class(ENWorkOrderBytType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWorkOrderBytTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWorkOrderBytTypeShort = array of ENWorkOrderBytTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderBytTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderBytTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderBytTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderBytTypeController/message/
  // soapAction: http://ksoe.org/ENWorkOrderBytTypeController/action/ENWorkOrderBytTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderBytTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderBytTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderBytTypeControllerSoapPort = interface(IInvokable)
  ['{C7A47FC9-1BF0-4E76-80A2-797CB9CDAA12}']
    function add(const aENWorkOrderBytType: ENWorkOrderBytType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrderBytType: ENWorkOrderBytType); stdcall;
    function getObject(const anObjectCode: Integer): ENWorkOrderBytType; stdcall;
    function getList: ENWorkOrderBytTypeShortList; stdcall;
    function getFilteredList(const aENWorkOrderBytTypeFilter: ENWorkOrderBytTypeFilter): ENWorkOrderBytTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytTypeShortList; stdcall;
    function getScrollableFilteredList(const aENWorkOrderBytTypeFilter: ENWorkOrderBytTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderBytTypeFilter: ENWorkOrderBytTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWorkOrderBytTypeShort; stdcall;
  end;


implementation



  destructor ENWorkOrderBytTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderBytType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytType');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytTypeRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytTypeFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytTypeShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderBytTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderBytTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderBytTypeControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderBytTypeControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytTypeController/action/ENWorkOrderBytTypeController.%operationName%');


end.
