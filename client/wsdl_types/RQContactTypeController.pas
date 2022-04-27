unit RQContactTypeController;

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

  RQContactType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContactTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContactType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQContactTypeFilter = class(TRemotable)
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

  RQContactTypeFilter = class(RQContactType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQContactTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQContactTypeShort = array of RQContactTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQContactTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQContactTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQContactTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQContactTypeController/message/
  // soapAction: http://ksoe.org/RQContactTypeController/action/RQContactTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQContactTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQContactTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQContactTypeControllerSoapPort = interface(IInvokable)
  ['{0B2C075F-6624-48B5-B69D-90706EBD64A0}']
    function add(const aRQContactType: RQContactType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQContactType: RQContactType); stdcall;
    function getObject(const anObjectCode: Integer): RQContactType; stdcall;
    function getList: RQContactTypeShortList; stdcall;
    function getFilteredList(const aRQContactTypeFilter: RQContactTypeFilter): RQContactTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQContactTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQContactTypeFilter: RQContactTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQContactTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQContactTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQContactTypeFilter: RQContactTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQContactTypeShort; stdcall;
  end;


implementation



  destructor RQContactTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQContactType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactType');
  RemClassRegistry.RegisterXSClass(RQContactTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactTypeRef');
  RemClassRegistry.RegisterXSClass(RQContactTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactTypeFilter');
  RemClassRegistry.RegisterXSClass(RQContactTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactTypeShort');
  RemClassRegistry.RegisterXSClass(RQContactTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQContactTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQContactTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQContactTypeControllerSoapPort), 'http://ksoe.org/RQContactTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQContactTypeControllerSoapPort), 'http://ksoe.org/RQContactTypeController/action/RQContactTypeController.%operationName%');


end.
