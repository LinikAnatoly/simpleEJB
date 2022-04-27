unit RQInvoiceItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,RQInvoiceItemController 
   ,RQInvoiceItem2ENEstimateItemStatusController 
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

  RQInvoiceItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    FstatusRef : RQInvoiceItem2ENEstimateItemStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property statusRef : RQInvoiceItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;

  RQInvoiceItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    FstatusRef : RQInvoiceItem2ENEstimateItemStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property statusRef : RQInvoiceItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;


  RQInvoiceItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FestimateItemCode : Integer; 
    FestimateItemCountGen : TXSDecimal;
    FestimateItemCountFact : TXSDecimal;
    FestimateItemPrice : TXSDecimal;
    FestimateItemCost : TXSDecimal;
    FestimateItemUserGen : WideString;
    FestimateItemDateEdit : TXSDate;
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
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode; 
    property estimateItemCountGen : TXSDecimal read FestimateItemCountGen write FestimateItemCountGen; 
    property estimateItemCountFact : TXSDecimal read FestimateItemCountFact write FestimateItemCountFact; 
    property estimateItemPrice : TXSDecimal read FestimateItemPrice write FestimateItemPrice; 
    property estimateItemCost : TXSDecimal read FestimateItemCost write FestimateItemCost; 
    property estimateItemUserGen : WideString read FestimateItemUserGen write FestimateItemUserGen; 
    property estimateItemDateEdit : TXSDate read FestimateItemDateEdit write FestimateItemDateEdit; 
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

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
  end;

  ArrayOfRQInvoiceItem2ENEstimateItemShort = array of RQInvoiceItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceItem2ENEstimateItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQInvoiceItem2ENEstimateItemController/action/RQInvoiceItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{1a841a84-1a84-1a84-1a84-1a841a841a84}']
    function  add(const aRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoiceItem2ENEstimateItem: RQInvoiceItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoiceItem2ENEstimateItem; stdcall;
    function  getList: RQInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aRQInvoiceItem2ENEstimateItemFilter: RQInvoiceItem2ENEstimateItemFilter): RQInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceItem2ENEstimateItemFilter: RQInvoiceItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItem2ENEstimateItemShortList; stdcall;
  end; 


implementation

  destructor RQInvoiceItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
  
  destructor RQInvoiceItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItemCountGen) then
      estimateItemCountGen.Free;
    if Assigned(FestimateItemCountFact) then
      estimateItemCountFact.Free;
    if Assigned(FestimateItemPrice) then
      estimateItemPrice.Free;
    if Assigned(FestimateItemCost) then
      estimateItemCost.Free;
    if Assigned(FestimateItemDateEdit) then
      estimateItemDateEdit.Free;
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
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItem2ENEstimateItemController/action/RQInvoiceItem2ENEstimateItemController.%operationName%');


end.
