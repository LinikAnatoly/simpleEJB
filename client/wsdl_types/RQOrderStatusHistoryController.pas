unit RQOrderStatusHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQOrderController 
   ,RQOrderStatusController 
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

  RQOrderStatusHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderStatusHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderStatusHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    ForderRef : RQOrderRef;
//???
    FstatusRef : RQOrderStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
    property statusRef : RQOrderStatusRef read FstatusRef write FstatusRef; 
  end;

  RQOrderStatusHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    ForderRef : RQOrderRef;
//???
    FstatusRef : RQOrderStatusRef;
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
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
    property statusRef : RQOrderStatusRef read FstatusRef write FstatusRef; 
  end;


  RQOrderStatusHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    ForderRefCode : Integer; 
    ForderRefNumberDoc : WideString;
    ForderRefNumberProject : WideString;
    ForderRefOrderPeriod : TXSDate;
    ForderRefDateGen : TXSDate;
    ForderRefUserGen : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;

    property orderRefCode : Integer read ForderRefCode write ForderRefCode; 
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc; 
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject; 
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod; 
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen; 
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
  end;

  ArrayOfRQOrderStatusHistoryShort = array of RQOrderStatusHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderStatusHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderStatusHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderStatusHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderStatusHistoryController/message/
  // soapAction: http://ksoe.org/RQOrderStatusHistoryController/action/RQOrderStatusHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderStatusHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderStatusHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderStatusHistoryControllerSoapPort = interface(IInvokable)
  ['{6b4c6b4c-6b4c-6b4c-6b4c-6b4c6b4c6b4c}']
    function  add(const aRQOrderStatusHistory: RQOrderStatusHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderStatusHistory: RQOrderStatusHistory); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderStatusHistory; stdcall;
    function  getList: RQOrderStatusHistoryShortList; stdcall;
    function  getFilteredList(const aRQOrderStatusHistoryFilter: RQOrderStatusHistoryFilter): RQOrderStatusHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderStatusHistoryFilter: RQOrderStatusHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderStatusHistoryShortList; stdcall;
  end; 


implementation

  destructor RQOrderStatusHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrderStatusHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderStatusHistoryShort.Destroy;
  begin
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderStatusHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderStatusHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusHistory');
  RemClassRegistry.RegisterXSClass(RQOrderStatusHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusHistoryRef');
  RemClassRegistry.RegisterXSClass(RQOrderStatusHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusHistoryFilter');
  RemClassRegistry.RegisterXSClass(RQOrderStatusHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusHistoryShort');
  RemClassRegistry.RegisterXSClass(RQOrderStatusHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderStatusHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderStatusHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderStatusHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderStatusHistoryControllerSoapPort), 'http://ksoe.org/RQOrderStatusHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderStatusHistoryControllerSoapPort), 'http://ksoe.org/RQOrderStatusHistoryController/action/RQOrderStatusHistoryController.%operationName%');


end.
