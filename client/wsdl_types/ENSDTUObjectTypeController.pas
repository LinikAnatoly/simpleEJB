unit ENSDTUObjectTypeController;

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

  ENSDTUObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSDTUObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSDTUObjectType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENSDTUObjectTypeFilter = class(TRemotable)
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


  ENSDTUObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENSDTUObjectTypeShort = array of ENSDTUObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSDTUObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSDTUObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSDTUObjectTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSDTUObjectTypeController/message/
  // soapAction: http://ksoe.org/ENSDTUObjectTypeController/action/ENSDTUObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSDTUObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSDTUObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSDTUObjectTypeControllerSoapPort = interface(IInvokable)
  ['{11dd11dd-11dd-11dd-11dd-11dd11dd11dd}']
    function  add(const aENSDTUObjectType: ENSDTUObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSDTUObjectType: ENSDTUObjectType); stdcall;
    function  getObject(const anObjectCode: Integer): ENSDTUObjectType; stdcall;
    function  getList: ENSDTUObjectTypeShortList; stdcall;
    function  getFilteredList(const aENSDTUObjectTypeFilter: ENSDTUObjectTypeFilter): ENSDTUObjectTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENSDTUObjectTypeFilter: ENSDTUObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENSDTUObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSDTUObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectType');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSDTUObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSDTUObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSDTUObjectTypeControllerSoapPort), 'http://ksoe.org/ENSDTUObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSDTUObjectTypeControllerSoapPort), 'http://ksoe.org/ENSDTUObjectTypeController/action/ENSDTUObjectTypeController.%operationName%');


end.
