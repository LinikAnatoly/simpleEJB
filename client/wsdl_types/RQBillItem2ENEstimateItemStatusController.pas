unit RQBillItem2ENEstimateItemStatusController;

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

  RQBillItem2ENEstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2ENEstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2ENEstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQBillItem2ENEstimateItemStatusFilter = class(TRemotable)
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


  RQBillItem2ENEstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQBillItem2ENEstimateItemStatusShort = array of RQBillItem2ENEstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillItem2ENEstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillItem2ENEstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillItem2ENEstimateItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillItem2ENEstimateItemStatusController/message/
  // soapAction: http://ksoe.org/RQBillItem2ENEstimateItemStatusController/action/RQBillItem2ENEstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillItem2ENEstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillItem2ENEstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillItem2ENEstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{84198419-8419-8419-8419-841984198419}']
    function  add(const aRQBillItem2ENEstimateItemStatus: RQBillItem2ENEstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillItem2ENEstimateItemStatus: RQBillItem2ENEstimateItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillItem2ENEstimateItemStatus; stdcall;
    function  getList: RQBillItem2ENEstimateItemStatusShortList; stdcall;
    function  getFilteredList(const aRQBillItem2ENEstimateItemStatusFilter: RQBillItem2ENEstimateItemStatusFilter): RQBillItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillItem2ENEstimateItemStatusFilter: RQBillItem2ENEstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor RQBillItem2ENEstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemStatus');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillItem2ENEstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillItem2ENEstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQBillItem2ENEstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillItem2ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQBillItem2ENEstimateItemStatusController/action/RQBillItem2ENEstimateItemStatusController.%operationName%');


end.
