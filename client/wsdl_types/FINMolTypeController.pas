unit FINMolTypeController;

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

  FINMolType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMolTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMolType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  FINMolTypeFilter = class(TRemotable)
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


  FINMolTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINMolTypeShort = array of FINMolTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINMolTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMolTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMolTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINMolTypeController/message/
  // soapAction: http://ksoe.org/FINMolTypeController/action/FINMolTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINMolTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINMolTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINMolTypeControllerSoapPort = interface(IInvokable)
  ['{6fdc6fdc-6fdc-6fdc-6fdc-6fdc6fdc6fdc}']
    function  add(const aFINMolType: FINMolType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINMolType: FINMolType); stdcall;
    function  getObject(const anObjectCode: Integer): FINMolType; stdcall;
    function  getList: FINMolTypeShortList; stdcall;
    function  getFilteredList(const aFINMolTypeFilter: FINMolTypeFilter): FINMolTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINMolTypeShortList; stdcall;
    function  getScrollableFilteredList(const aFINMolTypeFilter: FINMolTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMolTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINMolTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor FINMolTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINMolType, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolType');
  RemClassRegistry.RegisterXSClass(FINMolTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolTypeRef');
  RemClassRegistry.RegisterXSClass(FINMolTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolTypeFilter');
  RemClassRegistry.RegisterXSClass(FINMolTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolTypeShort');
  RemClassRegistry.RegisterXSClass(FINMolTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINMolTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINMolTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(FINMolTypeControllerSoapPort), 'http://ksoe.org/FINMolTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINMolTypeControllerSoapPort), 'http://ksoe.org/FINMolTypeController/action/FINMolTypeController.%operationName%');


end.
