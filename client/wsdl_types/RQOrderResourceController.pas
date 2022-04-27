unit RQOrderResourceController;

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

  RQOrderResource            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderResourceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderResource = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderResourceFilter = class(TRemotable)
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


  RQOrderResourceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderResourceShort = array of RQOrderResourceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderResourceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderResourceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderResourceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderResourceController/message/
  // soapAction: http://ksoe.org/RQOrderResourceController/action/RQOrderResourceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderResourceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderResourceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderResourceControllerSoapPort = interface(IInvokable)
  ['{1cbc1cbc-1cbc-1cbc-1cbc-1cbc1cbc1cbc}']
    function  add(const aRQOrderResource: RQOrderResource): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderResource: RQOrderResource); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderResource; stdcall;
    function  getList: RQOrderResourceShortList; stdcall;
    function  getFilteredList(const aRQOrderResourceFilter: RQOrderResourceFilter): RQOrderResourceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderResourceShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderResourceFilter: RQOrderResourceFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderResourceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderResourceShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderResourceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderResource, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderResource');
  RemClassRegistry.RegisterXSClass(RQOrderResourceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderResourceRef');
  RemClassRegistry.RegisterXSClass(RQOrderResourceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderResourceFilter');
  RemClassRegistry.RegisterXSClass(RQOrderResourceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderResourceShort');
  RemClassRegistry.RegisterXSClass(RQOrderResourceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderResourceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderResourceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderResourceShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderResourceControllerSoapPort), 'http://ksoe.org/RQOrderResourceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderResourceControllerSoapPort), 'http://ksoe.org/RQOrderResourceController/action/RQOrderResourceController.%operationName%');


end.
