unit RQInvoice2BillController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQBillController 
   ,RQInvoiceController
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

  RQInvoice2Bill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoice2BillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoice2Bill = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    FinvoiceRef : RQInvoiceRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
  end;

  RQInvoice2BillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    FinvoiceRef : RQInvoiceRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
  end;


  RQInvoice2BillShort = class(TRemotable)
  private
    Fcode : Integer; 
    FbillRefCode : Integer; 
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FinvoiceRefCode : Integer; 
    FinvoiceRefNumberDoc : WideString;
    FinvoiceRefNumberProject : WideString;
    FinvoiceRefDateGen : TXSDate;
    FinvoiceRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property billRefCode : Integer read FbillRefCode write FbillRefCode; 
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc; 
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject; 
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen; 
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen; 
    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; 
    property invoiceRefNumberDoc : WideString read FinvoiceRefNumberDoc write FinvoiceRefNumberDoc; 
    property invoiceRefNumberProject : WideString read FinvoiceRefNumberProject write FinvoiceRefNumberProject; 
    property invoiceRefDateGen : TXSDate read FinvoiceRefDateGen write FinvoiceRefDateGen; 
    property invoiceRefUserGen : WideString read FinvoiceRefUserGen write FinvoiceRefUserGen; 
  end;

  ArrayOfRQInvoice2BillShort = array of RQInvoice2BillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoice2BillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoice2BillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoice2BillShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoice2BillController/message/
  // soapAction: http://ksoe.org/RQInvoice2BillController/action/RQInvoice2BillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoice2BillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoice2BillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoice2BillControllerSoapPort = interface(IInvokable)
  ['{1ab91ab9-1ab9-1ab9-1ab9-1ab91ab91ab9}']
    function  add(const aRQInvoice2Bill: RQInvoice2Bill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoice2Bill: RQInvoice2Bill); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoice2Bill; stdcall;
    function  getList: RQInvoice2BillShortList; stdcall;
    function  getFilteredList(const aRQInvoice2BillFilter: RQInvoice2BillFilter): RQInvoice2BillShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoice2BillShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoice2BillFilter: RQInvoice2BillFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoice2BillShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoice2BillShortList; stdcall;
  end; 


implementation

  destructor RQInvoice2Bill.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    inherited Destroy;
  end;
  
  destructor RQInvoice2BillFilter.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoice2BillShort.Destroy;
  begin
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FinvoiceRefDateGen) then
      invoiceRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoice2BillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoice2Bill, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice2Bill');
  RemClassRegistry.RegisterXSClass(RQInvoice2BillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice2BillRef');
  RemClassRegistry.RegisterXSClass(RQInvoice2BillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice2BillFilter');
  RemClassRegistry.RegisterXSClass(RQInvoice2BillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice2BillShort');
  RemClassRegistry.RegisterXSClass(RQInvoice2BillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoice2BillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoice2BillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoice2BillShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoice2BillControllerSoapPort), 'http://ksoe.org/RQInvoice2BillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoice2BillControllerSoapPort), 'http://ksoe.org/RQInvoice2BillController/action/RQInvoice2BillController.%operationName%');


end.
