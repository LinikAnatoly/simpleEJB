unit RQFKOrder2FKOrderTypeController;

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

  RQFKOrder2FKOrderType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKOrderTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKOrderType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQFKOrder2FKOrderTypeFilter = class(TRemotable)
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


  RQFKOrder2FKOrderTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQFKOrder2FKOrderTypeShort = array of RQFKOrder2FKOrderTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2FKOrderTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2FKOrderTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2FKOrderTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2FKOrderTypeController/message/
  // soapAction: http://ksoe.org/RQFKOrder2FKOrderTypeController/action/RQFKOrder2FKOrderTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2FKOrderTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2FKOrderTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2FKOrderTypeControllerSoapPort = interface(IInvokable)
  ['{4fe94fe9-4fe9-4fe9-4fe9-4fe94fe94fe9}']
    function  add(const aRQFKOrder2FKOrderType: RQFKOrder2FKOrderType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2FKOrderType: RQFKOrder2FKOrderType); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrder2FKOrderType; stdcall;
    function  getList: RQFKOrder2FKOrderTypeShortList; stdcall;
    function  getFilteredList(const aRQFKOrder2FKOrderTypeFilter: RQFKOrder2FKOrderTypeFilter): RQFKOrder2FKOrderTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrder2FKOrderTypeFilter: RQFKOrder2FKOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor RQFKOrder2FKOrderTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderType');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderTypeRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderTypeFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderTypeShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2FKOrderTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2FKOrderTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2FKOrderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKOrderTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2FKOrderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKOrderTypeController/action/RQFKOrder2FKOrderTypeController.%operationName%');


end.
