unit RQOrderTypeController;

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

  RQOrderType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderTypeFilter = class(TRemotable)
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


  RQOrderTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderTypeShort = array of RQOrderTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderTypeController/message/
  // soapAction: http://ksoe.org/RQOrderTypeController/action/RQOrderTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderTypeControllerSoapPort = interface(IInvokable)
  ['{1de41de4-1de4-1de4-1de4-1de41de41de4}']
    function  add(const aRQOrderType: RQOrderType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderType: RQOrderType); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderType; stdcall;
    function  getList: RQOrderTypeShortList; stdcall;
    function  getFilteredList(const aRQOrderTypeFilter: RQOrderTypeFilter): RQOrderTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderTypeFilter: RQOrderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderType');
  RemClassRegistry.RegisterXSClass(RQOrderTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderTypeRef');
  RemClassRegistry.RegisterXSClass(RQOrderTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderTypeFilter');
  RemClassRegistry.RegisterXSClass(RQOrderTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderTypeShort');
  RemClassRegistry.RegisterXSClass(RQOrderTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderTypeControllerSoapPort), 'http://ksoe.org/RQOrderTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderTypeControllerSoapPort), 'http://ksoe.org/RQOrderTypeController/action/RQOrderTypeController.%operationName%');


end.
