unit ENRZAObjectTypeController;

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

  ENRZAObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRZAObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRZAObjectType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENRZAObjectTypeFilter = class(TRemotable)
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


  ENRZAObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENRZAObjectTypeShort = array of ENRZAObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRZAObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRZAObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRZAObjectTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRZAObjectTypeController/message/
  // soapAction: http://ksoe.org/ENRZAObjectTypeController/action/ENRZAObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRZAObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRZAObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRZAObjectTypeControllerSoapPort = interface(IInvokable)
   ['{7519294D-A81E-438E-9316-5821A1223F88}']
    function  add(const aENRZAObjectType: ENRZAObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRZAObjectType: ENRZAObjectType); stdcall;
    function  getObject(const anObjectCode: Integer): ENRZAObjectType; stdcall;
    function  getList: ENRZAObjectTypeShortList; stdcall;
    function  getFilteredList(const aENRZAObjectTypeFilter: ENRZAObjectTypeFilter): ENRZAObjectTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENRZAObjectTypeFilter: ENRZAObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENRZAObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRZAObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectType');
  RemClassRegistry.RegisterXSClass(ENRZAObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENRZAObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENRZAObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENRZAObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRZAObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRZAObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRZAObjectTypeControllerSoapPort), 'http://ksoe.org/ENRZAObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRZAObjectTypeControllerSoapPort), 'http://ksoe.org/ENRZAObjectTypeController/action/ENRZAObjectTypeController.%operationName%');


end.
