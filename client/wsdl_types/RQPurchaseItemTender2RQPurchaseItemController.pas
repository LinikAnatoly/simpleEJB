unit RQPurchaseItemTender2RQPurchaseItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPurchaseItemTenderController
   ,RQPurchaseItemController
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

  RQPurchaseItemTender2RQPurchaseItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTender2RQPurchaseItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTender2RQPurchaseItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FpurchaseItemTenderRef : RQPurchaseItemTenderRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property purchaseItemTenderRef : RQPurchaseItemTenderRef read FpurchaseItemTenderRef write FpurchaseItemTenderRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
  end;

{
  RQPurchaseItemTender2RQPurchaseItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FpurchaseItemTenderRef : RQPurchaseItemTenderRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property purchaseItemTenderRef : RQPurchaseItemTenderRef read FpurchaseItemTenderRef write FpurchaseItemTenderRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
  end;
}

  RQPurchaseItemTender2RQPurchaseItemFilter = class(RQPurchaseItemTender2RQPurchaseItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItemTender2RQPurchaseItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FpurchaseItemTenderRefCode : Integer;
    FpurchaseItemTenderRefIdentid : WideString;
    FpurchaseItemTenderRefIdentid2 : WideString;
    FpurchaseItemTenderRefPurchaseName : WideString;
    FpurchaseItemTenderRefFinancingSource : WideString;
    FpurchaseItemTenderRefSumGenWithNds : TXSDecimal;
    FpurchaseItemTenderRefSumFactWithNds : TXSDecimal;
    FpurchaseItemTenderRefTentativeYearGen : Integer;
    FpurchaseItemTenderRefTentativeMonthGen : Integer;
    FpurchaseItemTenderRefCountSymbolForGroup : Integer;
    FpurchaseItemTenderRefCommentGen : WideString;
    FpurchaseItemRefCode : Integer;
    FpurchaseItemRefMaterialNameGen : WideString;
    FpurchaseItemRefMeasurementNameGen : WideString;
    FpurchaseItemRefIdentid2010 : WideString;
    FpurchaseItemRefIdentid2015 : WideString;
    FpurchaseItemRefCountGen : TXSDecimal;
    FpurchaseItemRefCountPurchase : TXSDecimal;
    FpurchaseItemRefPriceGenWithoutNds : TXSDecimal;
    FpurchaseItemRefPriceGenWithNds : TXSDecimal;
    FpurchaseItemRefSumGenWithoutNds : TXSDecimal;
    FpurchaseItemRefSumGenWithNds : TXSDecimal;
    FpurchaseItemRefPricePurchaseWithoutNds : TXSDecimal;
    FpurchaseItemRefPricePurchaseWithNds : TXSDecimal;
    FpurchaseItemRefSumPurchaseWithoutNds : TXSDecimal;
    FpurchaseItemRefSumPurchaseWithNds : TXSDecimal;
    FpurchaseItemRefCommentGen : WideString;
    FpurchaseItemRefObjectsCodes : WideString;
    FpurchaseItemRefObjectsName : WideString;
    FpurchaseItemRefUserGen : WideString;
    FpurchaseItemRefCountFree : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;

    property purchaseItemTenderRefCode : Integer read FpurchaseItemTenderRefCode write FpurchaseItemTenderRefCode;
    property purchaseItemTenderRefIdentid : WideString read FpurchaseItemTenderRefIdentid write FpurchaseItemTenderRefIdentid;
    property purchaseItemTenderRefIdentid2 : WideString read FpurchaseItemTenderRefIdentid2 write FpurchaseItemTenderRefIdentid2;
    property purchaseItemTenderRefPurchaseName : WideString read FpurchaseItemTenderRefPurchaseName write FpurchaseItemTenderRefPurchaseName;
    property purchaseItemTenderRefFinancingSource : WideString read FpurchaseItemTenderRefFinancingSource write FpurchaseItemTenderRefFinancingSource;
    property purchaseItemTenderRefSumGenWithNds : TXSDecimal read FpurchaseItemTenderRefSumGenWithNds write FpurchaseItemTenderRefSumGenWithNds;
    property purchaseItemTenderRefSumFactWithNds : TXSDecimal read FpurchaseItemTenderRefSumFactWithNds write FpurchaseItemTenderRefSumFactWithNds;
    property purchaseItemTenderRefTentativeYearGen : Integer read FpurchaseItemTenderRefTentativeYearGen write FpurchaseItemTenderRefTentativeYearGen;
    property purchaseItemTenderRefTentativeMonthGen : Integer read FpurchaseItemTenderRefTentativeMonthGen write FpurchaseItemTenderRefTentativeMonthGen;
    property purchaseItemTenderRefCountSymbolForGroup : Integer read FpurchaseItemTenderRefCountSymbolForGroup write FpurchaseItemTenderRefCountSymbolForGroup;
    property purchaseItemTenderRefCommentGen : WideString read FpurchaseItemTenderRefCommentGen write FpurchaseItemTenderRefCommentGen;
    property purchaseItemRefCode : Integer read FpurchaseItemRefCode write FpurchaseItemRefCode;
    property purchaseItemRefMaterialNameGen : WideString read FpurchaseItemRefMaterialNameGen write FpurchaseItemRefMaterialNameGen;
    property purchaseItemRefMeasurementNameGen : WideString read FpurchaseItemRefMeasurementNameGen write FpurchaseItemRefMeasurementNameGen;
    property purchaseItemRefIdentid2010 : WideString read FpurchaseItemRefIdentid2010 write FpurchaseItemRefIdentid2010;
    property purchaseItemRefIdentid2015 : WideString read FpurchaseItemRefIdentid2015 write FpurchaseItemRefIdentid2015;
    property purchaseItemRefCountGen : TXSDecimal read FpurchaseItemRefCountGen write FpurchaseItemRefCountGen;
    property purchaseItemRefCountPurchase : TXSDecimal read FpurchaseItemRefCountPurchase write FpurchaseItemRefCountPurchase;
    property purchaseItemRefPriceGenWithoutNds : TXSDecimal read FpurchaseItemRefPriceGenWithoutNds write FpurchaseItemRefPriceGenWithoutNds;
    property purchaseItemRefPriceGenWithNds : TXSDecimal read FpurchaseItemRefPriceGenWithNds write FpurchaseItemRefPriceGenWithNds;
    property purchaseItemRefSumGenWithoutNds : TXSDecimal read FpurchaseItemRefSumGenWithoutNds write FpurchaseItemRefSumGenWithoutNds;
    property purchaseItemRefSumGenWithNds : TXSDecimal read FpurchaseItemRefSumGenWithNds write FpurchaseItemRefSumGenWithNds;
    property purchaseItemRefPricePurchaseWithoutNds : TXSDecimal read FpurchaseItemRefPricePurchaseWithoutNds write FpurchaseItemRefPricePurchaseWithoutNds;
    property purchaseItemRefPricePurchaseWithNds : TXSDecimal read FpurchaseItemRefPricePurchaseWithNds write FpurchaseItemRefPricePurchaseWithNds;
    property purchaseItemRefSumPurchaseWithoutNds : TXSDecimal read FpurchaseItemRefSumPurchaseWithoutNds write FpurchaseItemRefSumPurchaseWithoutNds;
    property purchaseItemRefSumPurchaseWithNds : TXSDecimal read FpurchaseItemRefSumPurchaseWithNds write FpurchaseItemRefSumPurchaseWithNds;
    property purchaseItemRefCommentGen : WideString read FpurchaseItemRefCommentGen write FpurchaseItemRefCommentGen;
    property purchaseItemRefObjectsCodes : WideString read FpurchaseItemRefObjectsCodes write FpurchaseItemRefObjectsCodes;
    property purchaseItemRefObjectsName : WideString read FpurchaseItemRefObjectsName write FpurchaseItemRefObjectsName;
    property purchaseItemRefUserGen : WideString read FpurchaseItemRefUserGen write FpurchaseItemRefUserGen;
    property purchaseItemRefCountFree : TXSDecimal read FpurchaseItemRefCountFree write FpurchaseItemRefCountFree;
  end;

  ArrayOfRQPurchaseItemTender2RQPurchaseItemShort = array of RQPurchaseItemTender2RQPurchaseItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItemTender2RQPurchaseItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItemTender2RQPurchaseItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItemTender2RQPurchaseItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItemTender2RQPurchaseItemController/message/
  // soapAction: http://ksoe.org/RQPurchaseItemTender2RQPurchaseItemController/action/RQPurchaseItemTender2RQPurchaseItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItemTender2RQPurchaseItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItemTender2RQPurchaseItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItemTender2RQPurchaseItemControllerSoapPort = interface(IInvokable)
  ['{6c106c10-6c10-6c10-6c10-6c106c106c10}']
    function add(const aRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItemTender2RQPurchaseItem: RQPurchaseItemTender2RQPurchaseItem); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItemTender2RQPurchaseItem; stdcall;
    function getList: RQPurchaseItemTender2RQPurchaseItemShortList; stdcall;
    function getFilteredList(const aRQPurchaseItemTender2RQPurchaseItemFilter: RQPurchaseItemTender2RQPurchaseItemFilter): RQPurchaseItemTender2RQPurchaseItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2RQPurchaseItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItemTender2RQPurchaseItemFilter: RQPurchaseItemTender2RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2RQPurchaseItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTender2RQPurchaseItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItemTender2RQPurchaseItemFilter: RQPurchaseItemTender2RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItemTender2RQPurchaseItemShort; stdcall;
  end;


implementation

  destructor RQPurchaseItemTender2RQPurchaseItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpurchaseItemTenderRef) then
      purchaseItemTenderRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPurchaseItemTender2RQPurchaseItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpurchaseItemTenderRef) then
      purchaseItemTenderRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPurchaseItemTender2RQPurchaseItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPurchaseItemTender2RQPurchaseItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpurchaseItemTenderRefSumGenWithNds) then
      purchaseItemTenderRefSumGenWithNds.Free;
    if Assigned(FpurchaseItemTenderRefSumFactWithNds) then
      purchaseItemTenderRefSumFactWithNds.Free;
    if Assigned(FpurchaseItemRefCountGen) then
      purchaseItemRefCountGen.Free;
    if Assigned(FpurchaseItemRefCountPurchase) then
      purchaseItemRefCountPurchase.Free;
    if Assigned(FpurchaseItemRefPriceGenWithoutNds) then
      purchaseItemRefPriceGenWithoutNds.Free;
    if Assigned(FpurchaseItemRefPriceGenWithNds) then
      purchaseItemRefPriceGenWithNds.Free;
    if Assigned(FpurchaseItemRefSumGenWithoutNds) then
      purchaseItemRefSumGenWithoutNds.Free;
    if Assigned(FpurchaseItemRefSumGenWithNds) then
      purchaseItemRefSumGenWithNds.Free;
    if Assigned(FpurchaseItemRefPricePurchaseWithoutNds) then
      purchaseItemRefPricePurchaseWithoutNds.Free;
    if Assigned(FpurchaseItemRefPricePurchaseWithNds) then
      purchaseItemRefPricePurchaseWithNds.Free;
    if Assigned(FpurchaseItemRefSumPurchaseWithoutNds) then
      purchaseItemRefSumPurchaseWithoutNds.Free;
    if Assigned(FpurchaseItemRefSumPurchaseWithNds) then
      purchaseItemRefSumPurchaseWithNds.Free;
    if Assigned(FpurchaseItemRefCountFree) then
      purchaseItemRefCountFree.Free;
    inherited Destroy;
  end;

  destructor RQPurchaseItemTender2RQPurchaseItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2RQPurchaseItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2RQPurchaseItem');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2RQPurchaseItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2RQPurchaseItemRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2RQPurchaseItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2RQPurchaseItemFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2RQPurchaseItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2RQPurchaseItemShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTender2RQPurchaseItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTender2RQPurchaseItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItemTender2RQPurchaseItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItemTender2RQPurchaseItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItemTender2RQPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTender2RQPurchaseItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItemTender2RQPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTender2RQPurchaseItemController/action/RQPurchaseItemTender2RQPurchaseItemController.%operationName%');


end.
