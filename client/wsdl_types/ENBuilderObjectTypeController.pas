unit ENBuilderObjectTypeController;

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

  ENBuilderObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilderObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilderObjectType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENBuilderObjectTypeFilter = class(TRemotable)
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


  ENBuilderObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBuilderObjectTypeShort = array of ENBuilderObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilderObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilderObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilderObjectTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilderObjectTypeController/message/
  // soapAction: http://ksoe.org/ENBuilderObjectTypeController/action/ENBuilderObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilderObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilderObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilderObjectTypeControllerSoapPort = interface(IInvokable)
  ['{156b156b-156b-156b-156b-156b156b156b}']
    function  add(const aENBuilderObjectType: ENBuilderObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilderObjectType: ENBuilderObjectType); stdcall;
    function  getObject(const anObjectCode: Integer): ENBuilderObjectType; stdcall;
    function  getList: ENBuilderObjectTypeShortList; stdcall;
    function  getFilteredList(const aENBuilderObjectTypeFilter: ENBuilderObjectTypeFilter): ENBuilderObjectTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENBuilderObjectTypeFilter: ENBuilderObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilderObjectTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENBuilderObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilderObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectType');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENBuilderObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilderObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilderObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilderObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilderObjectTypeControllerSoapPort), 'http://ksoe.org/ENBuilderObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilderObjectTypeControllerSoapPort), 'http://ksoe.org/ENBuilderObjectTypeController/action/ENBuilderObjectTypeController.%operationName%');


end.
