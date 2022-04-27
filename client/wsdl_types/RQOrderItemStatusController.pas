unit RQOrderItemStatusController;

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

  RQOrderItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQOrderItemStatusFilter = class(TRemotable)
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

  RQOrderItemStatusFilter = class(RQOrderItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQOrderItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderItemStatusShort = array of RQOrderItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItemStatusController/message/
  // soapAction: http://ksoe.org/RQOrderItemStatusController/action/RQOrderItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItemStatusControllerSoapPort = interface(IInvokable)
  ['{1c691c69-1c69-1c69-1c69-1c691c691c69}']
    function  add(const aRQOrderItemStatus: RQOrderItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItemStatus: RQOrderItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItemStatus; stdcall;
    function  getList: RQOrderItemStatusShortList; stdcall;
    function  getFilteredList(const aRQOrderItemStatusFilter: RQOrderItemStatusFilter): RQOrderItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItemStatusFilter: RQOrderItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQOrderItemStatusFilter: RQOrderItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor RQOrderItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemStatus');
  RemClassRegistry.RegisterXSClass(RQOrderItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQOrderItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQOrderItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItemStatusControllerSoapPort), 'http://ksoe.org/RQOrderItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItemStatusControllerSoapPort), 'http://ksoe.org/RQOrderItemStatusController/action/RQOrderItemStatusController.%operationName%');


end.
