unit ENMetrologyDeviceTypeController;

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

  ENMetrologyDeviceType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyDeviceTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyDeviceType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENMetrologyDeviceTypeFilter = class(TRemotable)
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


  ENMetrologyDeviceTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMetrologyDeviceTypeShort = array of ENMetrologyDeviceTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMetrologyDeviceTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMetrologyDeviceTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMetrologyDeviceTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMetrologyDeviceTypeController/message/
  // soapAction: http://ksoe.org/ENMetrologyDeviceTypeController/action/ENMetrologyDeviceTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMetrologyDeviceTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMetrologyDeviceTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMetrologyDeviceTypeControllerSoapPort = interface(IInvokable)
  ['{1f2e1f2e-1f2e-1f2e-1f2e-1f2e1f2e1f2e}']
    function  add(const aENMetrologyDeviceType: ENMetrologyDeviceType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMetrologyDeviceType: ENMetrologyDeviceType); stdcall;
    function  getObject(const anObjectCode: Integer): ENMetrologyDeviceType; stdcall;
    function  getList: ENMetrologyDeviceTypeShortList; stdcall;
    function  getFilteredList(const aENMetrologyDeviceTypeFilter: ENMetrologyDeviceTypeFilter): ENMetrologyDeviceTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENMetrologyDeviceTypeFilter: ENMetrologyDeviceTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENMetrologyDeviceTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceType');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceTypeRef');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceTypeFilter');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceTypeShort');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMetrologyDeviceTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMetrologyDeviceTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMetrologyDeviceTypeControllerSoapPort), 'http://ksoe.org/ENMetrologyDeviceTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMetrologyDeviceTypeControllerSoapPort), 'http://ksoe.org/ENMetrologyDeviceTypeController/action/ENMetrologyDeviceTypeController.%operationName%');


end.
