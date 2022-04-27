unit CNSubsystemTypeController;

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

  CNSubsystemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNSubsystemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  CNSubsystemType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  CNSubsystemTypeFilter = class(TRemotable)
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


  CNSubsystemTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfCNSubsystemTypeShort = array of CNSubsystemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  CNSubsystemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfCNSubsystemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfCNSubsystemTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/CNSubsystemTypeController/message/
  // soapAction: http://ksoe.org/CNSubsystemTypeController/action/CNSubsystemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : CNSubsystemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : CNSubsystemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  CNSubsystemTypeControllerSoapPort = interface(IInvokable)
  ['{1f381f38-1f38-1f38-1f38-1f381f381f38}']
    function  add(const aCNSubsystemType: CNSubsystemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aCNSubsystemType: CNSubsystemType); stdcall;
    function  getObject(const anObjectCode: Integer): CNSubsystemType; stdcall;
    function  getList: CNSubsystemTypeShortList; stdcall;
    function  getFilteredList(const aCNSubsystemTypeFilter: CNSubsystemTypeFilter): CNSubsystemTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): CNSubsystemTypeShortList; stdcall;
    function  getScrollableFilteredList(const aCNSubsystemTypeFilter: CNSubsystemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): CNSubsystemTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): CNSubsystemTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor CNSubsystemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(CNSubsystemType, 'http://ksoe.org/EnergyproControllerService/type/', 'CNSubsystemType');
  RemClassRegistry.RegisterXSClass(CNSubsystemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'CNSubsystemTypeRef');
  RemClassRegistry.RegisterXSClass(CNSubsystemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'CNSubsystemTypeFilter');
  RemClassRegistry.RegisterXSClass(CNSubsystemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'CNSubsystemTypeShort');
  RemClassRegistry.RegisterXSClass(CNSubsystemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'CNSubsystemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfCNSubsystemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfCNSubsystemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(CNSubsystemTypeControllerSoapPort), 'http://ksoe.org/CNSubsystemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(CNSubsystemTypeControllerSoapPort), 'http://ksoe.org/CNSubsystemTypeController/action/CNSubsystemTypeController.%operationName%');


end.
