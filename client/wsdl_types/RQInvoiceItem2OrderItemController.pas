unit RQInvoiceItem2OrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQInvoiceItemController 
   ,RQOrderItemController 
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

  RQInvoiceItem2OrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2OrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2OrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    ForderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef; 
  end;

  RQInvoiceItem2OrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    ForderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef; 
  end;


  RQInvoiceItem2OrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvoiceItemRefCode : Integer; 
    FinvoiceItemRefCountGen : TXSDecimal;
    FinvoiceItemRefMaterialNameTxt : WideString;
    FinvoiceItemRefMeasurementNameTxt : WideString;
    FinvoiceItemRefCountFact : TXSDecimal;
    FinvoiceItemRefPriceWithoutNds : TXSDecimal;
    FinvoiceItemRefNds : TXSDecimal;
    FinvoiceItemRefSumWithoutNds : TXSDecimal;
    FinvoiceItemRefSumNds : TXSDecimal;
    FinvoiceItemRefSumGen : TXSDecimal;
    FinvoiceItemRefCommentGen : WideString;
    FinvoiceItemRefUserGen : WideString;
    ForderItemRefCode : Integer; 
    ForderItemRefCountGen : TXSDecimal;
    ForderItemRefMaterialNameTxt : WideString;
    ForderItemRefMeasurementNameTxt : WideString;
    ForderItemRefCountFact : TXSDecimal;
    ForderItemRefPriceWithoutNds : TXSDecimal;
    ForderItemRefNds : TXSDecimal;
    ForderItemRefSumWithoutNds : TXSDecimal;
    ForderItemRefSumNds : TXSDecimal;
    ForderItemRefSumGen : TXSDecimal;
    ForderItemRefCommentGen : WideString;
    ForderItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property invoiceItemRefCode : Integer read FinvoiceItemRefCode write FinvoiceItemRefCode; 
    property invoiceItemRefCountGen : TXSDecimal read FinvoiceItemRefCountGen write FinvoiceItemRefCountGen; 
    property invoiceItemRefMaterialNameTxt : WideString read FinvoiceItemRefMaterialNameTxt write FinvoiceItemRefMaterialNameTxt; 
    property invoiceItemRefMeasurementNameTxt : WideString read FinvoiceItemRefMeasurementNameTxt write FinvoiceItemRefMeasurementNameTxt; 
    property invoiceItemRefCountFact : TXSDecimal read FinvoiceItemRefCountFact write FinvoiceItemRefCountFact; 
    property invoiceItemRefPriceWithoutNds : TXSDecimal read FinvoiceItemRefPriceWithoutNds write FinvoiceItemRefPriceWithoutNds; 
    property invoiceItemRefNds : TXSDecimal read FinvoiceItemRefNds write FinvoiceItemRefNds; 
    property invoiceItemRefSumWithoutNds : TXSDecimal read FinvoiceItemRefSumWithoutNds write FinvoiceItemRefSumWithoutNds; 
    property invoiceItemRefSumNds : TXSDecimal read FinvoiceItemRefSumNds write FinvoiceItemRefSumNds; 
    property invoiceItemRefSumGen : TXSDecimal read FinvoiceItemRefSumGen write FinvoiceItemRefSumGen; 
    property invoiceItemRefCommentGen : WideString read FinvoiceItemRefCommentGen write FinvoiceItemRefCommentGen; 
    property invoiceItemRefUserGen : WideString read FinvoiceItemRefUserGen write FinvoiceItemRefUserGen; 
    property orderItemRefCode : Integer read ForderItemRefCode write ForderItemRefCode; 
    property orderItemRefCountGen : TXSDecimal read ForderItemRefCountGen write ForderItemRefCountGen; 
    property orderItemRefMaterialNameTxt : WideString read ForderItemRefMaterialNameTxt write ForderItemRefMaterialNameTxt; 
    property orderItemRefMeasurementNameTxt : WideString read ForderItemRefMeasurementNameTxt write ForderItemRefMeasurementNameTxt; 
    property orderItemRefCountFact : TXSDecimal read ForderItemRefCountFact write ForderItemRefCountFact; 
    property orderItemRefPriceWithoutNds : TXSDecimal read ForderItemRefPriceWithoutNds write ForderItemRefPriceWithoutNds; 
    property orderItemRefNds : TXSDecimal read ForderItemRefNds write ForderItemRefNds; 
    property orderItemRefSumWithoutNds : TXSDecimal read ForderItemRefSumWithoutNds write ForderItemRefSumWithoutNds; 
    property orderItemRefSumNds : TXSDecimal read ForderItemRefSumNds write ForderItemRefSumNds; 
    property orderItemRefSumGen : TXSDecimal read ForderItemRefSumGen write ForderItemRefSumGen; 
    property orderItemRefCommentGen : WideString read ForderItemRefCommentGen write ForderItemRefCommentGen; 
    property orderItemRefUserGen : WideString read ForderItemRefUserGen write ForderItemRefUserGen; 
  end;

  ArrayOfRQInvoiceItem2OrderItemShort = array of RQInvoiceItem2OrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceItem2OrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceItem2OrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceItem2OrderItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceItem2OrderItemController/message/
  // soapAction: http://ksoe.org/RQInvoiceItem2OrderItemController/action/RQInvoiceItem2OrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceItem2OrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceItem2OrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceItem2OrderItemControllerSoapPort = interface(IInvokable)
  ['{18421842-1842-1842-1842-184218421842}']
    function  add(const aRQInvoiceItem2OrderItem: RQInvoiceItem2OrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoiceItem2OrderItem: RQInvoiceItem2OrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoiceItem2OrderItem; stdcall;
    function  getList: RQInvoiceItem2OrderItemShortList; stdcall;
    function  getFilteredList(const aRQInvoiceItem2OrderItemFilter: RQInvoiceItem2OrderItemFilter): RQInvoiceItem2OrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2OrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceItem2OrderItemFilter: RQInvoiceItem2OrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2OrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2OrderItemShortList; stdcall;
  end; 


implementation

  destructor RQInvoiceItem2OrderItem.Destroy;
  begin
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    inherited Destroy;
  end;
  
  destructor RQInvoiceItem2OrderItemFilter.Destroy;
  begin
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItem2OrderItemShort.Destroy;
  begin
    if Assigned(FinvoiceItemRefCountGen) then
      invoiceItemRefCountGen.Free;
    if Assigned(FinvoiceItemRefCountFact) then
      invoiceItemRefCountFact.Free;
    if Assigned(FinvoiceItemRefPriceWithoutNds) then
      invoiceItemRefPriceWithoutNds.Free;
    if Assigned(FinvoiceItemRefNds) then
      invoiceItemRefNds.Free;
    if Assigned(FinvoiceItemRefSumWithoutNds) then
      invoiceItemRefSumWithoutNds.Free;
    if Assigned(FinvoiceItemRefSumNds) then
      invoiceItemRefSumNds.Free;
    if Assigned(FinvoiceItemRefSumGen) then
      invoiceItemRefSumGen.Free;
    if Assigned(ForderItemRefCountGen) then
      orderItemRefCountGen.Free;
    if Assigned(ForderItemRefCountFact) then
      orderItemRefCountFact.Free;
    if Assigned(ForderItemRefPriceWithoutNds) then
      orderItemRefPriceWithoutNds.Free;
    if Assigned(ForderItemRefNds) then
      orderItemRefNds.Free;
    if Assigned(ForderItemRefSumWithoutNds) then
      orderItemRefSumWithoutNds.Free;
    if Assigned(ForderItemRefSumNds) then
      orderItemRefSumNds.Free;
    if Assigned(ForderItemRefSumGen) then
      orderItemRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItem2OrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoiceItem2OrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2OrderItem');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2OrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2OrderItemRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2OrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2OrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2OrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2OrderItemShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2OrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2OrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceItem2OrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceItem2OrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2OrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2OrderItemController/action/RQInvoiceItem2OrderItemController.%operationName%');


end.
