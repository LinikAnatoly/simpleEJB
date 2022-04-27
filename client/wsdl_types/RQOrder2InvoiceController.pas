unit RQOrder2InvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQInvoiceController 
   ,RQOrderController 
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

  RQOrder2Invoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2InvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2Invoice = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : RQInvoiceRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
  end;

  RQOrder2InvoiceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : RQInvoiceRef;
//???
    ForderRef : RQOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
  end;


  RQOrder2InvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvoiceRefCode : Integer; 
    FinvoiceRefNumberDoc : WideString;
    FinvoiceRefNumberProject : WideString;
    FinvoiceRefDateGen : TXSDate;
    FinvoiceRefUserGen : WideString;
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

    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; 
    property invoiceRefNumberDoc : WideString read FinvoiceRefNumberDoc write FinvoiceRefNumberDoc; 
    property invoiceRefNumberProject : WideString read FinvoiceRefNumberProject write FinvoiceRefNumberProject; 
    property invoiceRefDateGen : TXSDate read FinvoiceRefDateGen write FinvoiceRefDateGen; 
    property invoiceRefUserGen : WideString read FinvoiceRefUserGen write FinvoiceRefUserGen; 
    property orderRefCode : Integer read ForderRefCode write ForderRefCode; 
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc; 
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject; 
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod; 
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen; 
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen; 
  end;

  ArrayOfRQOrder2InvoiceShort = array of RQOrder2InvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2InvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2InvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2InvoiceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2InvoiceController/message/
  // soapAction: http://ksoe.org/RQOrder2InvoiceController/action/RQOrder2InvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2InvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2InvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2InvoiceControllerSoapPort = interface(IInvokable)
  ['{a620a620-a620-a620-a620-a620a620a620}']
    function  add(const aRQOrder2Invoice: RQOrder2Invoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2Invoice: RQOrder2Invoice); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder2Invoice; stdcall;
    function  getList: RQOrder2InvoiceShortList; stdcall;
    function  getFilteredList(const aRQOrder2InvoiceFilter: RQOrder2InvoiceFilter): RQOrder2InvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2InvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrder2InvoiceFilter: RQOrder2InvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2InvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2InvoiceShortList; stdcall;
  end; 


implementation

  destructor RQOrder2Invoice.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrder2InvoiceFilter.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2InvoiceShort.Destroy;
  begin
    if Assigned(FinvoiceRefDateGen) then
      invoiceRefDateGen.Free;
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2InvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2Invoice, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2Invoice');
  RemClassRegistry.RegisterXSClass(RQOrder2InvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2InvoiceRef');
  RemClassRegistry.RegisterXSClass(RQOrder2InvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2InvoiceFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2InvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2InvoiceShort');
  RemClassRegistry.RegisterXSClass(RQOrder2InvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2InvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2InvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2InvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2InvoiceControllerSoapPort), 'http://ksoe.org/RQOrder2InvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2InvoiceControllerSoapPort), 'http://ksoe.org/RQOrder2InvoiceController/action/RQOrder2InvoiceController.%operationName%');


end.
