unit RQOrderKindController;

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

  RQOrderKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderKindFilter = class(TRemotable)
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


  RQOrderKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderKindShort = array of RQOrderKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderKindController/message/
  // soapAction: http://ksoe.org/RQOrderKindController/action/RQOrderKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderKindControllerSoapPort = interface(IInvokable)
  ['{9e759e75-9e75-9e75-9e75-9e759e759e75}']
    function  add(const aRQOrderKind: RQOrderKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderKind: RQOrderKind); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderKind; stdcall;
    function  getList: RQOrderKindShortList; stdcall;
    function  getFilteredList(const aRQOrderKindFilter: RQOrderKindFilter): RQOrderKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderKindShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderKindFilter: RQOrderKindFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderKindShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderKind, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderKind');
  RemClassRegistry.RegisterXSClass(RQOrderKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderKindRef');
  RemClassRegistry.RegisterXSClass(RQOrderKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderKindFilter');
  RemClassRegistry.RegisterXSClass(RQOrderKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderKindShort');
  RemClassRegistry.RegisterXSClass(RQOrderKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderKindShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderKindControllerSoapPort), 'http://ksoe.org/RQOrderKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderKindControllerSoapPort), 'http://ksoe.org/RQOrderKindController/action/RQOrderKindController.%operationName%');


end.
