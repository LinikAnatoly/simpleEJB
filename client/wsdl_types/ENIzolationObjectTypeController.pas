unit ENIzolationObjectTypeController;

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

  ENIzolationObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIzolationObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIzolationObjectType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENIzolationObjectTypeFilter = class(TRemotable)
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


  ENIzolationObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIzolationObjectTypeShort = array of ENIzolationObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIzolationObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIzolationObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIzolationObjectTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIzolationObjectTypeController/message/
  // soapAction: http://ksoe.org/ENIzolationObjectTypeController/action/ENIzolationObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIzolationObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIzolationObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIzolationObjectTypeControllerSoapPort = interface(IInvokable)
  ['{FD344D57-314A-42BA-8B64-C196BF73458C}']
    function  add(const aENIzolationObjectType: ENIzolationObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIzolationObjectType: ENIzolationObjectType); stdcall;
    function  getObject(const anObjectCode: Integer): ENIzolationObjectType; stdcall;
    function  getList: ENIzolationObjectTypeShortList; stdcall;
    function  getFilteredList(const aENIzolationObjectTypeFilter: ENIzolationObjectTypeFilter): ENIzolationObjectTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENIzolationObjectTypeFilter: ENIzolationObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENIzolationObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIzolationObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectType');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIzolationObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIzolationObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIzolationObjectTypeControllerSoapPort), 'http://ksoe.org/ENIzolationObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIzolationObjectTypeControllerSoapPort), 'http://ksoe.org/ENIzolationObjectTypeController/action/ENIzolationObjectTypeController.%operationName%');


end.
