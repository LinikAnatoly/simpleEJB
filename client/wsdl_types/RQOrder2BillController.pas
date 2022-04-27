unit RQOrder2BillController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQBillController 
   ,RQOrderController
   ,RQBillTypeController 
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

  RQOrder2Bill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2BillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2Bill = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
  end;

  RQOrder2BillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
  end;


  RQOrder2BillShort = class(TRemotable)
  private
    Fcode : Integer; 
    FbillRefCode : Integer; 
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    ForderRefCode : Integer; 
    ForderRefNumberDoc : WideString;
    ForderRefNumberProject : WideString;
    ForderRefOrderPeriod : TXSDate;
    ForderRefDateGen : TXSDate;
    ForderRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property billRefCode : Integer read FbillRefCode write FbillRefCode; 
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc; 
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject; 
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen; 
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen; 
    property orderRefCode : Integer read ForderRefCode write ForderRefCode; 
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc; 
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject; 
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod; 
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen; 
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen; 
  end;

  ArrayOfRQOrder2BillShort = array of RQOrder2BillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2BillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2BillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2BillShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2BillController/message/
  // soapAction: http://ksoe.org/RQOrder2BillController/action/RQOrder2BillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2BillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2BillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2BillControllerSoapPort = interface(IInvokable)
  ['{13821382-1382-1382-1382-138213821382}']
    function  add(const aRQOrder2Bill: RQOrder2Bill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2Bill: RQOrder2Bill); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder2Bill; stdcall;
    function  getList: RQOrder2BillShortList; stdcall;
    function  getFilteredList(const aRQOrder2BillFilter: RQOrder2BillFilter): RQOrder2BillShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2BillShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrder2BillFilter: RQOrder2BillFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2BillShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2BillShortList; stdcall;
  end; 


implementation

  destructor RQOrder2Bill.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrder2BillFilter.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2BillShort.Destroy;
  begin
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2BillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2Bill, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2Bill');
  RemClassRegistry.RegisterXSClass(RQOrder2BillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2BillRef');
  RemClassRegistry.RegisterXSClass(RQOrder2BillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2BillFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2BillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2BillShort');
  RemClassRegistry.RegisterXSClass(RQOrder2BillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2BillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2BillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2BillShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2BillControllerSoapPort), 'http://ksoe.org/RQOrder2BillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2BillControllerSoapPort), 'http://ksoe.org/RQOrder2BillController/action/RQOrder2BillController.%operationName%');


end.
