unit RQFKOrderItem2InvoiceItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQInvoiceItemController 
   ,RQFKOrderItemController 
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

  RQFKOrderItem2InvoiceItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2InvoiceItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2InvoiceItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;

  RQFKOrderItem2InvoiceItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceItemRef : RQInvoiceItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceItemRef : RQInvoiceItemRef read FinvoiceItemRef write FinvoiceItemRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
  end;


  RQFKOrderItem2InvoiceItemShort = class(TRemotable)
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
    FfkOrderItemRefCode : Integer; 
    FfkOrderItemRefFinCode : Integer; 
    FfkOrderItemRefNomenclatureCode : Integer; 
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer; 
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPrice : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
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
    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode; 
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode; 
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode; 
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum; 
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch; 
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName; 
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode; 
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName; 
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen; 
    property fkOrderItemRefPrice : TXSDecimal read FfkOrderItemRefPrice write FfkOrderItemRefPrice; 
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen; 
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen; 
  end;

  ArrayOfRQFKOrderItem2InvoiceItemShort = array of RQFKOrderItem2InvoiceItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2InvoiceItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2InvoiceItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2InvoiceItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2InvoiceItemController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2InvoiceItemController/action/RQFKOrderItem2InvoiceItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2InvoiceItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2InvoiceItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2InvoiceItemControllerSoapPort = interface(IInvokable)
  ['{ed0fed0f-ed0f-ed0f-ed0f-ed0fed0fed0f}']
    function  add(const aRQFKOrderItem2InvoiceItem: RQFKOrderItem2InvoiceItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2InvoiceItem: RQFKOrderItem2InvoiceItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2InvoiceItem; stdcall;
    function  getList: RQFKOrderItem2InvoiceItemShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2InvoiceItemFilter: RQFKOrderItem2InvoiceItemFilter): RQFKOrderItem2InvoiceItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2InvoiceItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2InvoiceItemFilter: RQFKOrderItem2InvoiceItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2InvoiceItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2InvoiceItemShortList; stdcall;
  end; 


implementation

  destructor RQFKOrderItem2InvoiceItem.Destroy;
  begin
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;
  
  destructor RQFKOrderItem2InvoiceItemFilter.Destroy;
  begin
    if Assigned(FinvoiceItemRef) then
      invoiceItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2InvoiceItemShort.Destroy;
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
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPrice) then
      fkOrderItemRefPrice.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2InvoiceItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2InvoiceItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2InvoiceItem');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2InvoiceItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2InvoiceItemRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2InvoiceItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2InvoiceItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2InvoiceItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2InvoiceItemShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2InvoiceItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2InvoiceItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2InvoiceItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2InvoiceItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2InvoiceItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2InvoiceItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2InvoiceItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2InvoiceItemController/action/RQFKOrderItem2InvoiceItemController.%operationName%');


end.
