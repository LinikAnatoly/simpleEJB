unit RQOrder2OrderStatusHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQOrder2OrderController 
   ,RQOrder2OrderStatusController 
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

  RQOrder2OrderStatusHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2OrderStatusHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2OrderStatusHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forder2OrderRef : RQOrder2OrderRef;
//???
    FstatusRef : RQOrder2OrderStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property order2OrderRef : RQOrder2OrderRef read Forder2OrderRef write Forder2OrderRef; 
    property statusRef : RQOrder2OrderStatusRef read FstatusRef write FstatusRef; 
  end;

  RQOrder2OrderStatusHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Forder2OrderRef : RQOrder2OrderRef;
//???
    FstatusRef : RQOrder2OrderStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property order2OrderRef : RQOrder2OrderRef read Forder2OrderRef write Forder2OrderRef; 
    property statusRef : RQOrder2OrderStatusRef read FstatusRef write FstatusRef; 
  end;


  RQOrder2OrderStatusHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    Forder2OrderRefCode : Integer; 
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;

    property order2OrderRefCode : Integer read Forder2OrderRefCode write Forder2OrderRefCode; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
  end;

  ArrayOfRQOrder2OrderStatusHistoryShort = array of RQOrder2OrderStatusHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2OrderStatusHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2OrderStatusHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2OrderStatusHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2OrderStatusHistoryController/message/
  // soapAction: http://ksoe.org/RQOrder2OrderStatusHistoryController/action/RQOrder2OrderStatusHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2OrderStatusHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2OrderStatusHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2OrderStatusHistoryControllerSoapPort = interface(IInvokable)
  ['{11731173-1173-1173-1173-117311731173}']
    function  add(const aRQOrder2OrderStatusHistory: RQOrder2OrderStatusHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2OrderStatusHistory: RQOrder2OrderStatusHistory); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder2OrderStatusHistory; stdcall;
    function  getList: RQOrder2OrderStatusHistoryShortList; stdcall;
    function  getFilteredList(const aRQOrder2OrderStatusHistoryFilter: RQOrder2OrderStatusHistoryFilter): RQOrder2OrderStatusHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrder2OrderStatusHistoryFilter: RQOrder2OrderStatusHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderStatusHistoryShortList; stdcall;
  end; 


implementation

  destructor RQOrder2OrderStatusHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Forder2OrderRef) then
      order2OrderRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrder2OrderStatusHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Forder2OrderRef) then
      order2OrderRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor RQOrder2OrderStatusHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusHistory');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusHistoryRef');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusHistoryFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusHistoryShort');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderStatusHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderStatusHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2OrderStatusHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2OrderStatusHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2OrderStatusHistoryControllerSoapPort), 'http://ksoe.org/RQOrder2OrderStatusHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2OrderStatusHistoryControllerSoapPort), 'http://ksoe.org/RQOrder2OrderStatusHistoryController/action/RQOrder2OrderStatusHistoryController.%operationName%');


end.
