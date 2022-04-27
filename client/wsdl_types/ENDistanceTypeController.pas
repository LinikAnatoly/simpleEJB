unit ENDistanceTypeController;

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

  ENDistanceType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistanceTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistanceType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENDistanceTypeFilter = class(TRemotable)
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


  ENDistanceTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDistanceTypeShort = array of ENDistanceTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDistanceTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDistanceTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDistanceTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDistanceTypeController/message/
  // soapAction: http://ksoe.org/ENDistanceTypeController/action/ENDistanceTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDistanceTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDistanceTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDistanceTypeControllerSoapPort = interface(IInvokable)
  ['{1b351b35-1b35-1b35-1b35-1b351b351b35}']
    function  add(const aENDistanceType: ENDistanceType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDistanceType: ENDistanceType); stdcall;
    function  getObject(const anObjectCode: Integer): ENDistanceType; stdcall;
    function  getList: ENDistanceTypeShortList; stdcall;
    function  getFilteredList(const aENDistanceTypeFilter: ENDistanceTypeFilter): ENDistanceTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDistanceTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENDistanceTypeFilter: ENDistanceTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDistanceTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDistanceTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENDistanceTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDistanceType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceType');
  RemClassRegistry.RegisterXSClass(ENDistanceTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceTypeRef');
  RemClassRegistry.RegisterXSClass(ENDistanceTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceTypeFilter');
  RemClassRegistry.RegisterXSClass(ENDistanceTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceTypeShort');
  RemClassRegistry.RegisterXSClass(ENDistanceTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDistanceTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDistanceTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDistanceTypeControllerSoapPort), 'http://ksoe.org/ENDistanceTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDistanceTypeControllerSoapPort), 'http://ksoe.org/ENDistanceTypeController/action/ENDistanceTypeController.%operationName%');


end.
