unit ENHumenItemKindController;

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

  ENHumenItemKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHumenItemKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHumenItemKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENHumenItemKindFilter = class(TRemotable)
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


  ENHumenItemKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENHumenItemKindShort = array of ENHumenItemKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHumenItemKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHumenItemKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHumenItemKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHumenItemKindController/message/
  // soapAction: http://ksoe.org/ENHumenItemKindController/action/ENHumenItemKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHumenItemKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHumenItemKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHumenItemKindControllerSoapPort = interface(IInvokable)
  ['{1c8b1c8b-1c8b-1c8b-1c8b-1c8b1c8b1c8b}']
    function  add(const aENHumenItemKind: ENHumenItemKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHumenItemKind: ENHumenItemKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENHumenItemKind; stdcall;
    function  getList: ENHumenItemKindShortList; stdcall;
    function  getFilteredList(const aENHumenItemKindFilter: ENHumenItemKindFilter): ENHumenItemKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemKindShortList; stdcall;
    function  getScrollableFilteredList(const aENHumenItemKindFilter: ENHumenItemKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemKindShortList; stdcall;
  end; 


implementation

  
  
  destructor ENHumenItemKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHumenItemKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemKind');
  RemClassRegistry.RegisterXSClass(ENHumenItemKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemKindRef');
  RemClassRegistry.RegisterXSClass(ENHumenItemKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemKindFilter');
  RemClassRegistry.RegisterXSClass(ENHumenItemKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemKindShort');
  RemClassRegistry.RegisterXSClass(ENHumenItemKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHumenItemKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHumenItemKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHumenItemKindControllerSoapPort), 'http://ksoe.org/ENHumenItemKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHumenItemKindControllerSoapPort), 'http://ksoe.org/ENHumenItemKindController/action/ENHumenItemKindController.%operationName%');


end.
