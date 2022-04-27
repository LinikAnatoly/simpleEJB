unit RQPurchaseItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,TKMeasurementController
   ,RQPlanPurchaseController
   ,RQPurchaseItemTypeController
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

  RQPurchaseItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItem = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FpricePurchaseWithoutNds : TXSDecimal;
    FpricePurchaseWithNds : TXSDecimal;
    FsumPurchaseWithoutNds : TXSDecimal;
    FsumPurchaseWithNds : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FcountFree : TXSDecimal;
    FisAbstractSum : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
//???
    FpurchaseItemTypeRef : RQPurchaseItemTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property pricePurchaseWithoutNds : TXSDecimal read FpricePurchaseWithoutNds write FpricePurchaseWithoutNds;
    property pricePurchaseWithNds : TXSDecimal read FpricePurchaseWithNds write FpricePurchaseWithNds;
    property sumPurchaseWithoutNds : TXSDecimal read FsumPurchaseWithoutNds write FsumPurchaseWithoutNds;
    property sumPurchaseWithNds : TXSDecimal read FsumPurchaseWithNds write FsumPurchaseWithNds;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property countFree : TXSDecimal read FcountFree write FcountFree;
    property  isAbstractSum : Integer read FisAbstractSum write FisAbstractSum;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
  end;

{
  RQPurchaseItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FpricePurchaseWithoutNds : TXSDecimal;
    FpricePurchaseWithNds : TXSDecimal;
    FsumPurchaseWithoutNds : TXSDecimal;
    FsumPurchaseWithNds : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FcountFree : TXSDecimal;
    FisAbstractSum : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
//???
    FpurchaseItemTypeRef : RQPurchaseItemTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property pricePurchaseWithoutNds : TXSDecimal read FpricePurchaseWithoutNds write FpricePurchaseWithoutNds;
    property pricePurchaseWithNds : TXSDecimal read FpricePurchaseWithNds write FpricePurchaseWithNds;
    property sumPurchaseWithoutNds : TXSDecimal read FsumPurchaseWithoutNds write FsumPurchaseWithoutNds;
    property sumPurchaseWithNds : TXSDecimal read FsumPurchaseWithNds write FsumPurchaseWithNds;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property countFree : TXSDecimal read FcountFree write FcountFree;
    property  isAbstractSum : Integer read FisAbstractSum write FisAbstractSum;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
  end;
}

  RQPurchaseItemFilter = class(RQPurchaseItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FpricePurchaseWithoutNds : TXSDecimal;
    FpricePurchaseWithNds : TXSDecimal;
    FsumPurchaseWithoutNds : TXSDecimal;
    FsumPurchaseWithNds : TXSDecimal;
    FsumPurchaseRest : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FcountFree : TXSDecimal;
    FisAbstractSum : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialRefCostnkre : TXSDecimal;
    FmaterialRefWeight : TXSDecimal;
    FmaterialRefCostAlternative : TXSDecimal;
    FmeasurementRefCode : Integer;
    FmeasurementRefName : WideString;
    FpurchaseRefCode : Integer;
    FpurchaseRefName : WideString;
    FpurchaseRefYearGen : Integer;
    FpurchaseRefVersion : Integer;
    FpurchaseRefCommentGen : WideString;
    FpurchaseRefDateAdd : TXSDateTime;
    FpurchaseRefDateEdit : TXSDateTime;
    FpurchaseRefUserAdd : WideString;
    FpurchaseRefUserEdit : WideString;
    FpurchaseItemTypeRefCode : Integer;
    FpurchaseItemTypeRefName : WideString;
    FpurchaseKindName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property pricePurchaseWithoutNds : TXSDecimal read FpricePurchaseWithoutNds write FpricePurchaseWithoutNds;
    property pricePurchaseWithNds : TXSDecimal read FpricePurchaseWithNds write FpricePurchaseWithNds;
    property sumPurchaseWithoutNds : TXSDecimal read FsumPurchaseWithoutNds write FsumPurchaseWithoutNds;
    property sumPurchaseWithNds : TXSDecimal read FsumPurchaseWithNds write FsumPurchaseWithNds;
    property sumPurchaseRest : TXSDecimal read FsumPurchaseRest write FsumPurchaseRest;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property countFree : TXSDecimal read FcountFree write FcountFree;
    property  isAbstractSum : Integer read FisAbstractSum write FisAbstractSum;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre;
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight;
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;

    property measurementRefCode : Integer read FmeasurementRefCode write FmeasurementRefCode;
    property measurementRefName : WideString read FmeasurementRefName write FmeasurementRefName;
    property purchaseRefCode : Integer read FpurchaseRefCode write FpurchaseRefCode;
    property purchaseRefName : WideString read FpurchaseRefName write FpurchaseRefName;
    property purchaseRefYearGen : Integer read FpurchaseRefYearGen write FpurchaseRefYearGen;
    property purchaseRefVersion : Integer read FpurchaseRefVersion write FpurchaseRefVersion;
    property purchaseRefCommentGen : WideString read FpurchaseRefCommentGen write FpurchaseRefCommentGen;
    property purchaseRefDateAdd : TXSDateTime read FpurchaseRefDateAdd write FpurchaseRefDateAdd;
    property purchaseRefDateEdit : TXSDateTime read FpurchaseRefDateEdit write FpurchaseRefDateEdit;
    property purchaseRefUserAdd : WideString read FpurchaseRefUserAdd write FpurchaseRefUserAdd;
    property purchaseRefUserEdit : WideString read FpurchaseRefUserEdit write FpurchaseRefUserEdit;
    property purchaseItemTypeRefCode : Integer read FpurchaseItemTypeRefCode write FpurchaseItemTypeRefCode;
    property purchaseItemTypeRefName : WideString read FpurchaseItemTypeRefName write FpurchaseItemTypeRefName;

    property purchaseKindName : WideString read FpurchaseKindName write FpurchaseKindName;
  end;

  ArrayOfRQPurchaseItemShort = array of RQPurchaseItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItemController/message/
  // soapAction: http://ksoe.org/RQPurchaseItemController/action/RQPurchaseItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItemControllerSoapPort = interface(IInvokable)
  ['{03EAC3FB-0F26-414A-96FB-F82C0160509F}']
    function add(const aRQPurchaseItem: RQPurchaseItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItem: RQPurchaseItem); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItem; stdcall;
    function getList: RQPurchaseItemShortList; stdcall;
    function getFilteredList(const aRQPurchaseItemFilter: RQPurchaseItemFilter): RQPurchaseItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItemFilter: RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItemFilter: RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItemShort; stdcall;

	  procedure changePurchaseItemType(const aRQPurchaseItem: RQPurchaseItem); stdcall;
    function getScrollableFilteredListWithoutContract(const aRQPurchaseItemFilter: RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemShortList; stdcall;

    procedure resetPurchaseCountByAbstractPurchaseItem(const piShortList : ArrayOfRQPurchaseItemShort ; const purchaseItemSource : Integer );stdcall;
    function getScrollableFilteredListForRestAbstractSum(const aRQPurchaseItemFilter: RQPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemShortList; stdcall;

  end;




implementation

  destructor RQPurchaseItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FpricePurchaseWithoutNds) then
      pricePurchaseWithoutNds.Free;
    if Assigned(FpricePurchaseWithNds) then
      pricePurchaseWithNds.Free;
    if Assigned(FsumPurchaseWithoutNds) then
      sumPurchaseWithoutNds.Free;
    if Assigned(FsumPurchaseWithNds) then
      sumPurchaseWithNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountFree) then
      countFree.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmeasurementRef) then
      measurementRef.Free;
    if Assigned(FpurchaseRef) then
      purchaseRef.Free;
    if Assigned(FpurchaseItemTypeRef) then
      purchaseItemTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPurchaseItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FpricePurchaseWithoutNds) then
      pricePurchaseWithoutNds.Free;
    if Assigned(FpricePurchaseWithNds) then
      pricePurchaseWithNds.Free;
    if Assigned(FsumPurchaseWithoutNds) then
      sumPurchaseWithoutNds.Free;
    if Assigned(FsumPurchaseWithNds) then
      sumPurchaseWithNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountFree) then
      countFree.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmeasurementRef) then
      measurementRef.Free;
    if Assigned(FpurchaseRef) then
      purchaseRef.Free;
    if Assigned(FpurchaseItemTypeRef) then
      purchaseItemTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPurchaseItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPurchaseItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FpricePurchaseWithoutNds) then
      pricePurchaseWithoutNds.Free;
    if Assigned(FpricePurchaseWithNds) then
      pricePurchaseWithNds.Free;
    if Assigned(FsumPurchaseWithoutNds) then
      sumPurchaseWithoutNds.Free;
    if Assigned(FsumPurchaseWithNds) then
      sumPurchaseWithNds.Free;
    if Assigned(FcountFree) then
      countFree.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmaterialRefCostnkre) then
      materialRefCostnkre.Free;
    if Assigned(FmaterialRefWeight) then
      materialRefWeight.Free;
    if Assigned(FmaterialRefCostAlternative) then
      materialRefCostAlternative.Free;
    if Assigned(FpurchaseRefDateAdd) then
      purchaseRefDateAdd.Free;
    if Assigned(FpurchaseRefDateEdit) then
      purchaseRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPurchaseItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItemController/action/RQPurchaseItemController.%operationName%');


end.
