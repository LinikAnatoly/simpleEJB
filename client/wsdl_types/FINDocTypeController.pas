unit FINDocTypeController;

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

  FINDocType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDocTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDocType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  FINDocTypeFilter = class(TRemotable)
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


  FINDocTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINDocTypeShort = array of FINDocTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINDocTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINDocTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINDocTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINDocTypeController/message/
  // soapAction: http://ksoe.org/FINDocTypeController/action/FINDocTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINDocTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINDocTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINDocTypeControllerSoapPort = interface(IInvokable)
  ['{1c8b1c8b-1c8b-1c8b-1c8b-1c8b1c8b1c8b}']
    function  add(const aFINDocType: FINDocType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINDocType: FINDocType); stdcall;
    function  getObject(const anObjectCode: Integer): FINDocType; stdcall;
    function  getList: FINDocTypeShortList; stdcall;
    function  getFilteredList(const aFINDocTypeFilter: FINDocTypeFilter): FINDocTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINDocTypeShortList; stdcall;
    function  getScrollableFilteredList(const aFINDocTypeFilter: FINDocTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): FINDocTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINDocTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor FINDocTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINDocType, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDocType');
  RemClassRegistry.RegisterXSClass(FINDocTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDocTypeRef');
  RemClassRegistry.RegisterXSClass(FINDocTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDocTypeFilter');
  RemClassRegistry.RegisterXSClass(FINDocTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDocTypeShort');
  RemClassRegistry.RegisterXSClass(FINDocTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDocTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINDocTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINDocTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(FINDocTypeControllerSoapPort), 'http://ksoe.org/FINDocTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINDocTypeControllerSoapPort), 'http://ksoe.org/FINDocTypeController/action/FINDocTypeController.%operationName%');


end.
