unit ENTransportOrderStatusController;

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

  ENTransportOrderStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrderStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrderStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTransportOrderStatusFilter = class(TRemotable)
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
}

  ENTransportOrderStatusFilter = class(ENTransportOrderStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportOrderStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 

  end;

  ArrayOfENTransportOrderStatusShort = array of ENTransportOrderStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportOrderStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportOrderStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportOrderStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportOrderStatusController/message/
  // soapAction: http://ksoe.org/ENTransportOrderStatusController/action/ENTransportOrderStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportOrderStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportOrderStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportOrderStatusControllerSoapPort = interface(IInvokable)
  ['{1df51df5-1df5-1df5-1df5-1df51df51df5}']
    function  add(const aENTransportOrderStatus: ENTransportOrderStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportOrderStatus: ENTransportOrderStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportOrderStatus; stdcall;
    function  getList: ENTransportOrderStatusShortList; stdcall;
    function  getFilteredList(const aENTransportOrderStatusFilter: ENTransportOrderStatusFilter): ENTransportOrderStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportOrderStatusFilter: ENTransportOrderStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrderStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportOrderStatusFilter: ENTransportOrderStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTransportOrderStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportOrderStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderStatus');
  RemClassRegistry.RegisterXSClass(ENTransportOrderStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderStatusRef');
  RemClassRegistry.RegisterXSClass(ENTransportOrderStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderStatusFilter');
  RemClassRegistry.RegisterXSClass(ENTransportOrderStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderStatusShort');
  RemClassRegistry.RegisterXSClass(ENTransportOrderStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrderStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportOrderStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportOrderStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportOrderStatusControllerSoapPort), 'http://ksoe.org/ENTransportOrderStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportOrderStatusControllerSoapPort), 'http://ksoe.org/ENTransportOrderStatusController/action/ENTransportOrderStatusController.%operationName%');


end.
