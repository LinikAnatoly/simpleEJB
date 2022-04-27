unit SCOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCInvoiceController 
   ,SCOrderKindController 
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

  SCOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FcountGen : Integer; 
    FscCode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : SCInvoiceRef;
//???
    FkindRef : SCOrderKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : SCInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property kindRef : SCOrderKindRef read FkindRef write FkindRef; 
  end;
  
{
  SCOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberDoc : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FcountGen : Integer; 
    FscCode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : SCInvoiceRef;
//???
    FkindRef : SCOrderKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : SCInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property kindRef : SCOrderKindRef read FkindRef write FkindRef; 
  end;
}

  SCOrderFilter = class(SCOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FcountGen : Integer; 
    FscCode : Integer; 
    FinvoiceRefCode : Integer; 
    FinvoiceRefSubAccountCode : WideString;
    FinvoiceRefMolCode : WideString;
    FinvoiceRefPodrCode : WideString;
    FinvoiceRefSourceCode : WideString;
    FinvoiceRefCostCode : WideString;
    FinvoiceRefCounterType : WideString;
    FinvoiceRefCharacters : WideString;
    FinvoiceRefNumberDoc : WideString;
    FinvoiceRefDateDoc : TXSDate;
    FinvoiceRefNumberTax : WideString;
    FinvoiceRefDateBuh : TXSDate;
    FinvoiceRefSupplierCode : WideString;
    FinvoiceRefContractCode : WideString;
    FinvoiceRefSumWithNds : TXSDecimal;
    FinvoiceRefSumNds : TXSDecimal;
    FinvoiceRefSumGen : TXSDecimal;
    FinvoiceRefCountGen : Integer; 
    FinvoiceRefScCode : Integer; 
    FkindRefCode : Integer; 
    FkindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 

    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; 
    property invoiceRefSubAccountCode : WideString read FinvoiceRefSubAccountCode write FinvoiceRefSubAccountCode; 
    property invoiceRefMolCode : WideString read FinvoiceRefMolCode write FinvoiceRefMolCode; 
    property invoiceRefPodrCode : WideString read FinvoiceRefPodrCode write FinvoiceRefPodrCode; 
    property invoiceRefSourceCode : WideString read FinvoiceRefSourceCode write FinvoiceRefSourceCode; 
    property invoiceRefCostCode : WideString read FinvoiceRefCostCode write FinvoiceRefCostCode; 
    property invoiceRefCounterType : WideString read FinvoiceRefCounterType write FinvoiceRefCounterType; 
    property invoiceRefCharacters : WideString read FinvoiceRefCharacters write FinvoiceRefCharacters; 
    property invoiceRefNumberDoc : WideString read FinvoiceRefNumberDoc write FinvoiceRefNumberDoc; 
    property invoiceRefDateDoc : TXSDate read FinvoiceRefDateDoc write FinvoiceRefDateDoc; 
    property invoiceRefNumberTax : WideString read FinvoiceRefNumberTax write FinvoiceRefNumberTax; 
    property invoiceRefDateBuh : TXSDate read FinvoiceRefDateBuh write FinvoiceRefDateBuh; 
    property invoiceRefSupplierCode : WideString read FinvoiceRefSupplierCode write FinvoiceRefSupplierCode; 
    property invoiceRefContractCode : WideString read FinvoiceRefContractCode write FinvoiceRefContractCode; 
    property invoiceRefSumWithNds : TXSDecimal read FinvoiceRefSumWithNds write FinvoiceRefSumWithNds; 
    property invoiceRefSumNds : TXSDecimal read FinvoiceRefSumNds write FinvoiceRefSumNds; 
    property invoiceRefSumGen : TXSDecimal read FinvoiceRefSumGen write FinvoiceRefSumGen; 
    property invoiceRefCountGen : Integer read FinvoiceRefCountGen write FinvoiceRefCountGen; 
    property invoiceRefScCode : Integer read FinvoiceRefScCode write FinvoiceRefScCode; 
    property kindRefCode : Integer read FkindRefCode write FkindRefCode; 
    property kindRefName : WideString read FkindRefName write FkindRefName; 
  end;

  ArrayOfSCOrderShort = array of SCOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCOrderController/message/
  // soapAction: http://ksoe.org/SCOrderController/action/SCOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCOrderControllerSoapPort = interface(IInvokable)
  ['{c3e9c3e9-c3e9-c3e9-c3e9-c3e9c3e9c3e9}']
    function  add(const aSCOrder: SCOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCOrder: SCOrder); stdcall;
    function  getObject(const anObjectCode: Integer): SCOrder; stdcall;
    function  getList: SCOrderShortList; stdcall;
    function  getFilteredList(const aSCOrderFilter: SCOrderFilter): SCOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCOrderShortList; stdcall;
    function  getScrollableFilteredList(const aSCOrderFilter: SCOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): SCOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCOrderFilter: SCOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCOrder.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCOrderFilter.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCOrderShort.Destroy;
  begin
    if Assigned(FinvoiceRefDateDoc) then
      invoiceRefDateDoc.Free;
    if Assigned(FinvoiceRefDateBuh) then
      invoiceRefDateBuh.Free;
    if Assigned(FinvoiceRefSumWithNds) then
      invoiceRefSumWithNds.Free;
    if Assigned(FinvoiceRefSumNds) then
      invoiceRefSumNds.Free;
    if Assigned(FinvoiceRefSumGen) then
      invoiceRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor SCOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder');
  RemClassRegistry.RegisterXSClass(SCOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderRef');
  RemClassRegistry.RegisterXSClass(SCOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderFilter');
  RemClassRegistry.RegisterXSClass(SCOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderShort');
  RemClassRegistry.RegisterXSClass(SCOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(SCOrderControllerSoapPort), 'http://ksoe.org/SCOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCOrderControllerSoapPort), 'http://ksoe.org/SCOrderController/action/SCOrderController.%operationName%');


end.
