unit RQBillStatusController;

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

  RQBillStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQBillStatusFilter = class(TRemotable)
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


  RQBillStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQBillStatusShort = array of RQBillStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillStatusController/message/
  // soapAction: http://ksoe.org/RQBillStatusController/action/RQBillStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillStatusControllerSoapPort = interface(IInvokable)
  ['{71ed71ed-71ed-71ed-71ed-71ed71ed71ed}']
    function  add(const aRQBillStatus: RQBillStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillStatus: RQBillStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillStatus; stdcall;
    function  getList: RQBillStatusShortList; stdcall;
    function  getFilteredList(const aRQBillStatusFilter: RQBillStatusFilter): RQBillStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillStatusFilter: RQBillStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQBillStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillStatus');
  RemClassRegistry.RegisterXSClass(RQBillStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillStatusRef');
  RemClassRegistry.RegisterXSClass(RQBillStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillStatusFilter');
  RemClassRegistry.RegisterXSClass(RQBillStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillStatusShort');
  RemClassRegistry.RegisterXSClass(RQBillStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillStatusControllerSoapPort), 'http://ksoe.org/RQBillStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillStatusControllerSoapPort), 'http://ksoe.org/RQBillStatusController/action/RQBillStatusController.%operationName%');


end.
