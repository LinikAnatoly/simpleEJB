unit RQPayDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPaymentMethodController
   ,FINWorkerController
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

  RQPayDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDoc = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FcommentGen : WideString;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpayOrder : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpaymentMethodRef : RQPaymentMethodRef;
//???
    FaccountablePersonRef : FINWorkerRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property payOrder : WideString read FpayOrder write FpayOrder;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property paymentMethodRef : RQPaymentMethodRef read FpaymentMethodRef write FpaymentMethodRef;
    property accountablePersonRef : FINWorkerRef read FaccountablePersonRef write FaccountablePersonRef;
  end;

{
  RQPayDocFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FcommentGen : WideString;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpayOrder : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpaymentMethodRef : RQPaymentMethodRef;
//???
    FaccountablePersonRef : FINWorkerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property payOrder : WideString read FpayOrder write FpayOrder;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property paymentMethodRef : RQPaymentMethodRef read FpaymentMethodRef write FpaymentMethodRef;
    property accountablePersonRef : FINWorkerRef read FaccountablePersonRef write FaccountablePersonRef;
  end;
}

  RQPayDocFilter = class(RQPayDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPayDocShort = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpayOrder : WideString;
    FpaymentMethodRefCode : Integer;
    FpaymentMethodRefName : WideString;
    FaccountablePersonRefCode : Integer;
    FaccountablePersonRefName : WideString;
    FaccountablePersonRefTabNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property payOrder : WideString read FpayOrder write FpayOrder;

    property paymentMethodRefCode : Integer read FpaymentMethodRefCode write FpaymentMethodRefCode;
    property paymentMethodRefName : WideString read FpaymentMethodRefName write FpaymentMethodRefName;
    property accountablePersonRefCode : Integer read FaccountablePersonRefCode write FaccountablePersonRefCode;
    property accountablePersonRefName : WideString read FaccountablePersonRefName write FaccountablePersonRefName;
    property accountablePersonRefTabNumber : WideString read FaccountablePersonRefTabNumber write FaccountablePersonRefTabNumber;
  end;

  ArrayOfRQPayDocShort = array of RQPayDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPayDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPayDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPayDocShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPayDocController/message/
  // soapAction: http://ksoe.org/RQPayDocController/action/RQPayDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPayDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPayDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPayDocControllerSoapPort = interface(IInvokable)
  ['{8F97A1A4-8256-4945-BCAE-AB4830339E83}']
    function  add(const aRQPayDoc: RQPayDoc;const budgcode : Integer ): Integer; stdcall; overload;
    procedure save(const aRQPayDoc: RQPayDoc ;const budgcode : Integer ); stdcall; overload;
    function  add(const aRQPayDoc: RQPayDoc;const budgcode : Integer; accountablePersonTabNumber : WideString ): Integer; stdcall; overload;
    procedure save(const aRQPayDoc: RQPayDoc ;const budgcode : Integer; accountablePersonTabNumber : WideString ); stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    function getObject(const anObjectCode: Integer): RQPayDoc; stdcall;
    function getList: RQPayDocShortList; stdcall;
    function getFilteredList(const aRQPayDocFilter: RQPayDocFilter): RQPayDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPayDocShortList; stdcall;
    function getScrollableFilteredList(const aRQPayDocFilter: RQPayDocFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPayDocFilter: RQPayDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPayDocShort; stdcall;
    procedure addPayDocByBill(const billCode : Integer ; const budgcode : Integer); stdcall; overload;
	  procedure addPayDocByBill(const billCode : Integer ; const budgcode : Integer; isCash : Boolean; accountablePersonTabNumber : WideString); stdcall; overload;
    procedure addPayDocByBillServices(const billCode : Integer ; const budgcode : Integer); stdcall; overload;
	  procedure addPayDocByBillServices(const billCode : Integer ; const budgcode : Integer; isCash : Boolean; accountablePersonTabNumber : WideString); stdcall; overload;

  end;


implementation

  destructor RQPayDoc.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpaymentMethodRef) then
      paymentMethodRef.Free;
    if Assigned(FaccountablePersonRef) then
      accountablePersonRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPayDocFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpaymentMethodRef) then
      paymentMethodRef.Free;
    if Assigned(FaccountablePersonRef) then
      accountablePersonRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPayDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPayDocShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

  destructor RQPayDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPayDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDoc');
  RemClassRegistry.RegisterXSClass(RQPayDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocRef');
  RemClassRegistry.RegisterXSClass(RQPayDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocFilter');
  RemClassRegistry.RegisterXSClass(RQPayDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocShort');
  RemClassRegistry.RegisterXSClass(RQPayDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPayDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPayDocShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPayDocControllerSoapPort), 'http://ksoe.org/RQPayDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPayDocControllerSoapPort), 'http://ksoe.org/RQPayDocController/action/RQPayDocController.%operationName%');


end.
