unit ENWorkOrderStatusController;

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

  ENWorkOrderStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENWorkOrderStatusFilter = class(TRemotable)
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


  ENWorkOrderStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWorkOrderStatusShort = array of ENWorkOrderStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderStatusController/message/
  // soapAction: http://ksoe.org/ENWorkOrderStatusController/action/ENWorkOrderStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderStatusControllerSoapPort = interface(IInvokable)
  ['{63ac63ac-63ac-63ac-63ac-63ac63ac63ac}']
    function  add(const aENWorkOrderStatus: ENWorkOrderStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrderStatus: ENWorkOrderStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENWorkOrderStatus; stdcall;
    function  getList: ENWorkOrderStatusShortList; stdcall;
    function  getFilteredList(const aENWorkOrderStatusFilter: ENWorkOrderStatusFilter): ENWorkOrderStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENWorkOrderStatusFilter: ENWorkOrderStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor ENWorkOrderStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderStatus');
  RemClassRegistry.RegisterXSClass(ENWorkOrderStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderStatusRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderStatusFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderStatusShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderStatusControllerSoapPort), 'http://ksoe.org/ENWorkOrderStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderStatusControllerSoapPort), 'http://ksoe.org/ENWorkOrderStatusController/action/ENWorkOrderStatusController.%operationName%');


end.
