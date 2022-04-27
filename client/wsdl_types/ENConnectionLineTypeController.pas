unit ENConnectionLineTypeController;

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

  ENConnectionLineType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLineTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLineType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionLineTypeFilter = class(TRemotable)
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

  ENConnectionLineTypeFilter = class(ENConnectionLineType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionLineTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionLineTypeShort = array of ENConnectionLineTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionLineTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionLineTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionLineTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionLineTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionLineTypeController/action/ENConnectionLineTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionLineTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionLineTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionLineTypeControllerSoapPort = interface(IInvokable)
  ['{0008114D-3DA2-4D4A-BEC5-17C20BF5BE1B}']
    function add(const aENConnectionLineType: ENConnectionLineType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionLineType: ENConnectionLineType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionLineType; stdcall;
    function getList: ENConnectionLineTypeShortList; stdcall;
    function getFilteredList(const aENConnectionLineTypeFilter: ENConnectionLineTypeFilter): ENConnectionLineTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLineTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionLineTypeFilter: ENConnectionLineTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLineTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLineTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionLineTypeFilter: ENConnectionLineTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionLineTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionLineTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionLineType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLineType');
  RemClassRegistry.RegisterXSClass(ENConnectionLineTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLineTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionLineTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLineTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionLineTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLineTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionLineTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLineTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionLineTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionLineTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionLineTypeControllerSoapPort), 'http://ksoe.org/ENConnectionLineTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionLineTypeControllerSoapPort), 'http://ksoe.org/ENConnectionLineTypeController/action/ENConnectionLineTypeController.%operationName%');


end.
