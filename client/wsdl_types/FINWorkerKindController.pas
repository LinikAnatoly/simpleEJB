unit FINWorkerKindController;

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

  FINWorkerKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINWorkerKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINWorkerKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  FINWorkerKindFilter = class(TRemotable)
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


  FINWorkerKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINWorkerKindShort = array of FINWorkerKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINWorkerKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINWorkerKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINWorkerKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINWorkerKindController/message/
  // soapAction: http://ksoe.org/FINWorkerKindController/action/FINWorkerKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINWorkerKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINWorkerKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINWorkerKindControllerSoapPort = interface(IInvokable)
  ['{89238923-8923-8923-8923-892389238923}']
    function  add(const aFINWorkerKind: FINWorkerKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINWorkerKind: FINWorkerKind); stdcall;
    function  getObject(const anObjectCode: Integer): FINWorkerKind; stdcall;
    function  getList: FINWorkerKindShortList; stdcall;
    function  getFilteredList(const aFINWorkerKindFilter: FINWorkerKindFilter): FINWorkerKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINWorkerKindShortList; stdcall;
    function  getScrollableFilteredList(const aFINWorkerKindFilter: FINWorkerKindFilter; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerKindShortList; stdcall;
  end; 


implementation

  
  
  destructor FINWorkerKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINWorkerKind, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerKind');
  RemClassRegistry.RegisterXSClass(FINWorkerKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerKindRef');
  RemClassRegistry.RegisterXSClass(FINWorkerKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerKindFilter');
  RemClassRegistry.RegisterXSClass(FINWorkerKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerKindShort');
  RemClassRegistry.RegisterXSClass(FINWorkerKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINWorkerKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINWorkerKindShort');

  InvRegistry.RegisterInterface(TypeInfo(FINWorkerKindControllerSoapPort), 'http://ksoe.org/FINWorkerKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINWorkerKindControllerSoapPort), 'http://ksoe.org/FINWorkerKindController/action/FINWorkerKindController.%operationName%');


end.
