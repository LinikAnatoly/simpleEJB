unit RQFKOrderTypeController;

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

  RQFKOrderType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;

{
  RQFKOrderTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;
  end;
}

  RQFKOrderTypeFilter = class(RQFKOrderType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrderTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtxtGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property txtGen : WideString read FtxtGen write FtxtGen;

  end;

  ArrayOfRQFKOrderTypeShort = array of RQFKOrderTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderTypeController/message/
  // soapAction: http://ksoe.org/RQFKOrderTypeController/action/RQFKOrderTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderTypeControllerSoapPort = interface(IInvokable)
  ['{58D2A11F-08AA-4A42-9D09-4096F08EA40A}']
    function add(const aRQFKOrderType: RQFKOrderType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderType: RQFKOrderType); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrderType; stdcall;
    function getList: RQFKOrderTypeShortList; stdcall;
    function getFilteredList(const aRQFKOrderTypeFilter: RQFKOrderTypeFilter): RQFKOrderTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrderTypeFilter: RQFKOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrderTypeFilter: RQFKOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrderTypeShort; stdcall;
  end;


implementation



  destructor RQFKOrderTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderType');
  RemClassRegistry.RegisterXSClass(RQFKOrderTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderTypeRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderTypeFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderTypeShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrderTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrderTypeController/action/RQFKOrderTypeController.%operationName%');


end.
