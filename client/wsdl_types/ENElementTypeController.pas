unit ENElementTypeController;

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

  ENElementType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElementTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElementType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENElementTypeFilter = class(TRemotable)
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


  ENElementTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENElementTypeShort = array of ENElementTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElementTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElementTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElementTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElementTypeController/message/
  // soapAction: http://ksoe.org/ENElementTypeController/action/ENElementTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElementTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElementTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElementTypeControllerSoapPort = interface(IInvokable)
  ['{87378737-8737-8737-8737-873787378737}']
    function  add(const aENElementType: ENElementType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElementType: ENElementType); stdcall;
    function  getObject(const anObjectCode: Integer): ENElementType; stdcall;
    function  getList: ENElementTypeShortList; stdcall;
    function  getFilteredList(const aENElementTypeFilter: ENElementTypeFilter): ENElementTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElementTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENElementTypeFilter: ENElementTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElementTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElementTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENElementTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElementType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementType');
  RemClassRegistry.RegisterXSClass(ENElementTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementTypeRef');
  RemClassRegistry.RegisterXSClass(ENElementTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementTypeFilter');
  RemClassRegistry.RegisterXSClass(ENElementTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementTypeShort');
  RemClassRegistry.RegisterXSClass(ENElementTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElementTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElementTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElementTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElementTypeControllerSoapPort), 'http://ksoe.org/ENElementTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElementTypeControllerSoapPort), 'http://ksoe.org/ENElementTypeController/action/ENElementTypeController.%operationName%');


end.
