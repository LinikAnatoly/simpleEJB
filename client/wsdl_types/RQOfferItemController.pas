unit RQOfferItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOfferController
   ,RQOrderItemController
   ,TKMaterialsController
   ,TKMeasurementController
   ,RQDDSCodesController
   ,RQOfferItemStatusController
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

  RQOfferItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferItem = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameOffer : WideString;
    FmeasurementNameOffer : WideString;
    FddsTxtCode : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FplannedDateDelivery : TXSDate;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FofferRef : RQOfferRef;
//???
    ForderItemRef : RQOrderItemRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FddsCodesRef : RQDDSCodesRef;
//???
    FstatusRef : RQOfferItemStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameOffer : WideString read FmaterialNameOffer write FmaterialNameOffer;
    property measurementNameOffer : WideString read FmeasurementNameOffer write FmeasurementNameOffer;
    property ddsTxtCode : WideString read FddsTxtCode write FddsTxtCode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property offerRef : RQOfferRef read FofferRef write FofferRef;
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property ddsCodesRef : RQDDSCodesRef read FddsCodesRef write FddsCodesRef;
    property statusRef : RQOfferItemStatusRef read FstatusRef write FstatusRef;
  end;

{
  RQOfferItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameOffer : WideString;
    FmeasurementNameOffer : WideString;
    FddsTxtCode : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FplannedDateDelivery : TXSDate;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FofferRef : RQOfferRef;
//???
    ForderItemRef : RQOrderItemRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FddsCodesRef : RQDDSCodesRef;
//???
    FstatusRef : RQOfferItemStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameOffer : WideString read FmaterialNameOffer write FmaterialNameOffer;
    property measurementNameOffer : WideString read FmeasurementNameOffer write FmeasurementNameOffer;
    property ddsTxtCode : WideString read FddsTxtCode write FddsTxtCode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property offerRef : RQOfferRef read FofferRef write FofferRef;
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property ddsCodesRef : RQDDSCodesRef read FddsCodesRef write FddsCodesRef;
    property statusRef : RQOfferItemStatusRef read FstatusRef write FstatusRef;
  end;
}

  RQOfferItemFilter = class(RQOfferItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOfferItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameOffer : WideString;
    FmeasurementNameOffer : WideString;
    FddsTxtCode : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FplannedDateDelivery : TXSDate;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FofferRefCode : Integer;
    FofferRefNumberDoc : WideString;
    FofferRefNumberProject : WideString;
    FofferRefDateGen : TXSDate;
    /////
    FofferRefOrgName: WideString;
    /////
    FofferRefEmail : WideString;
    FofferRefUserAdd : WideString;
    FofferRefDateAdd : TXSDateTime;
    FofferRefUserGen : WideString;
    FofferRefDateEdit : TXSDateTime;
    ForderItemRefCode : Integer;
    ForderItemRefCountGen : TXSDecimal;
    ForderItemRefMaterialNameTxt : WideString;
    ForderItemRefMeasurementNameTxt : WideString;
    ForderItemRefMaterialNameGen : WideString;
    ForderItemRefMeasurementNameGen : WideString;
    ForderItemRefMaterialNameGenRQ : WideString;
    ForderItemRefMeasurementNameGenRQ : WideString;
    ForderItemRefCountFact : TXSDecimal;
    ForderItemRefPriceWithoutNds : TXSDecimal;
    ForderItemRefNds : TXSDecimal;
    ForderItemRefPriceWithNds : TXSDecimal;
    ForderItemRefSumWithoutNds : TXSDecimal;
    ForderItemRefSumNds : TXSDecimal;
    ForderItemRefSumGen : TXSDecimal;
    ForderItemRefCommentGen : WideString;
    ForderItemRefDeliveryTime : Integer;
    ForderItemRefContractNumber : WideString;
    ForderItemRefContractDate : TXSDate;
    ForderItemRefFinDocCode : WideString;
    ForderItemRefFinDocID : Integer;
    ForderItemRefPlannedDatePays : TXSDate;
    ForderItemRefPlannedDateDelivery : TXSDate;
    ForderItemRefStatusReason : WideString;
    ForderItemRefPaymentValue : Integer;
    ForderItemRefIsPaid : Integer;
    ForderItemRefUserGen : WideString;
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
    FddsCodesRefCode : Integer;
    FddsCodesRefName : WideString;
    FddsCodesRefTxtCode : WideString;
    FddsCodesRefIsInvest : Integer;
    FddsCodesRefIsActual : Integer;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    /////
    public FofferRefStatusRefCode: Integer;
    public FofferRefStatusRefName: WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameOffer : WideString read FmaterialNameOffer write FmaterialNameOffer;
    property measurementNameOffer : WideString read FmeasurementNameOffer write FmeasurementNameOffer;
    property ddsTxtCode : WideString read FddsTxtCode write FddsTxtCode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property offerRefCode : Integer read FofferRefCode write FofferRefCode;
    property offerRefNumberDoc : WideString read FofferRefNumberDoc write FofferRefNumberDoc;
    property offerRefNumberProject : WideString read FofferRefNumberProject write FofferRefNumberProject;
    property offerRefDateGen : TXSDate read FofferRefDateGen write FofferRefDateGen;
    /////
    property offerRefOrgName: WideString read FofferRefOrgName write FofferRefOrgName;
    /////
    property offerRefEmail : WideString read FofferRefEmail write FofferRefEmail;
    property offerRefUserAdd : WideString read FofferRefUserAdd write FofferRefUserAdd;
    property offerRefDateAdd : TXSDateTime read FofferRefDateAdd write FofferRefDateAdd;
    property offerRefUserGen : WideString read FofferRefUserGen write FofferRefUserGen;
    property offerRefDateEdit : TXSDateTime read FofferRefDateEdit write FofferRefDateEdit;
    property orderItemRefCode : Integer read ForderItemRefCode write ForderItemRefCode;
    property orderItemRefCountGen : TXSDecimal read ForderItemRefCountGen write ForderItemRefCountGen;
    property orderItemRefMaterialNameTxt : WideString read ForderItemRefMaterialNameTxt write ForderItemRefMaterialNameTxt;
    property orderItemRefMeasurementNameTxt : WideString read ForderItemRefMeasurementNameTxt write ForderItemRefMeasurementNameTxt;
    property orderItemRefMaterialNameGen : WideString read ForderItemRefMaterialNameGen write ForderItemRefMaterialNameGen;
    property orderItemRefMeasurementNameGen : WideString read ForderItemRefMeasurementNameGen write ForderItemRefMeasurementNameGen;
    property orderItemRefMaterialNameGenRQ : WideString read ForderItemRefMaterialNameGenRQ write ForderItemRefMaterialNameGenRQ;
    property orderItemRefMeasurementNameGenRQ : WideString read ForderItemRefMeasurementNameGenRQ write ForderItemRefMeasurementNameGenRQ;
    property orderItemRefCountFact : TXSDecimal read ForderItemRefCountFact write ForderItemRefCountFact;
    property orderItemRefPriceWithoutNds : TXSDecimal read ForderItemRefPriceWithoutNds write ForderItemRefPriceWithoutNds;
    property orderItemRefNds : TXSDecimal read ForderItemRefNds write ForderItemRefNds;
    property orderItemRefPriceWithNds : TXSDecimal read ForderItemRefPriceWithNds write ForderItemRefPriceWithNds;
    property orderItemRefSumWithoutNds : TXSDecimal read ForderItemRefSumWithoutNds write ForderItemRefSumWithoutNds;
    property orderItemRefSumNds : TXSDecimal read ForderItemRefSumNds write ForderItemRefSumNds;
    property orderItemRefSumGen : TXSDecimal read ForderItemRefSumGen write ForderItemRefSumGen;
    property orderItemRefCommentGen : WideString read ForderItemRefCommentGen write ForderItemRefCommentGen;
    property orderItemRefDeliveryTime : Integer read ForderItemRefDeliveryTime write ForderItemRefDeliveryTime;
    property orderItemRefContractNumber : WideString read ForderItemRefContractNumber write ForderItemRefContractNumber;
    property orderItemRefContractDate : TXSDate read ForderItemRefContractDate write ForderItemRefContractDate;
    property orderItemRefFinDocCode : WideString read ForderItemRefFinDocCode write ForderItemRefFinDocCode;
    property orderItemRefFinDocID : Integer read ForderItemRefFinDocID write ForderItemRefFinDocID;
    property orderItemRefPlannedDatePays : TXSDate read ForderItemRefPlannedDatePays write ForderItemRefPlannedDatePays;
    property orderItemRefPlannedDateDelivery : TXSDate read ForderItemRefPlannedDateDelivery write ForderItemRefPlannedDateDelivery;
    property orderItemRefStatusReason : WideString read ForderItemRefStatusReason write ForderItemRefStatusReason;
    property orderItemRefPaymentValue : Integer read ForderItemRefPaymentValue write ForderItemRefPaymentValue;
    property orderItemRefIsPaid : Integer read ForderItemRefIsPaid write ForderItemRefIsPaid;
    property orderItemRefUserGen : WideString read ForderItemRefUserGen write ForderItemRefUserGen;
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
    property ddsCodesRefCode : Integer read FddsCodesRefCode write FddsCodesRefCode;
    property ddsCodesRefName : WideString read FddsCodesRefName write FddsCodesRefName;
    property ddsCodesRefTxtCode : WideString read FddsCodesRefTxtCode write FddsCodesRefTxtCode;
    property ddsCodesRefIsInvest : Integer read FddsCodesRefIsInvest write FddsCodesRefIsInvest;
    property ddsCodesRefIsActual : Integer read FddsCodesRefIsActual write FddsCodesRefIsActual;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    /////
    property offerRefStatusRefCode: Integer read FofferRefStatusRefCode write FofferRefStatusRefCode;
    property offerRefStatusRefName: WideString read FofferRefStatusRefName write FofferRefStatusRefName;
    /////
  end;

  ArrayOfRQOfferItemShort = array of RQOfferItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOfferItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOfferItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOfferItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOfferItemController/message/
  // soapAction: http://ksoe.org/RQOfferItemController/action/RQOfferItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOfferItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOfferItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOfferItemControllerSoapPort = interface(IInvokable)
  ['{F3A584F9-C383-4D8E-BDC2-17F9A6AED3C8}']
    function add(const aRQOfferItem: RQOfferItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOfferItem: RQOfferItem); stdcall;
    function getObject(const anObjectCode: Integer): RQOfferItem; stdcall;
    function getList: RQOfferItemShortList; stdcall;
    function getFilteredList(const aRQOfferItemFilter: RQOfferItemFilter): RQOfferItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemShortList; stdcall;
    function getScrollableFilteredList(const aRQOfferItemFilter: RQOfferItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOfferItemFilter: RQOfferItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOfferItemShort; stdcall;

    function getOfferItemsListForOrder(const aOrderCode: Integer): RQOfferItemShortList; stdcall;
  end;


implementation

  destructor RQOfferItem.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FofferRef) then
      offerRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmeasurementRef) then
      measurementRef.Free;
    if Assigned(FddsCodesRef) then
      ddsCodesRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor RQOfferItemFilter.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FofferRef) then
      offerRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmeasurementRef) then
      measurementRef.Free;
    if Assigned(FddsCodesRef) then
      ddsCodesRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor RQOfferItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOfferItemShort.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FofferRefDateGen) then
      offerRefDateGen.Free;
    if Assigned(FofferRefDateAdd) then
      offerRefDateAdd.Free;
    if Assigned(FofferRefDateEdit) then
      offerRefDateEdit.Free;
    if Assigned(ForderItemRefCountGen) then
      orderItemRefCountGen.Free;
    if Assigned(ForderItemRefCountFact) then
      orderItemRefCountFact.Free;
    if Assigned(ForderItemRefPriceWithoutNds) then
      orderItemRefPriceWithoutNds.Free;
    if Assigned(ForderItemRefNds) then
      orderItemRefNds.Free;
    if Assigned(ForderItemRefPriceWithNds) then
      orderItemRefPriceWithNds.Free;
    if Assigned(ForderItemRefSumWithoutNds) then
      orderItemRefSumWithoutNds.Free;
    if Assigned(ForderItemRefSumNds) then
      orderItemRefSumNds.Free;
    if Assigned(ForderItemRefSumGen) then
      orderItemRefSumGen.Free;
    if Assigned(ForderItemRefContractDate) then
      orderItemRefContractDate.Free;
    if Assigned(ForderItemRefPlannedDatePays) then
      orderItemRefPlannedDatePays.Free;
    if Assigned(ForderItemRefPlannedDateDelivery) then
      orderItemRefPlannedDateDelivery.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmaterialRefCostnkre) then
      materialRefCostnkre.Free;
    if Assigned(FmaterialRefWeight) then
      materialRefWeight.Free;
    if Assigned(FmaterialRefCostAlternative) then
      materialRefCostAlternative.Free;
    inherited Destroy;
  end;

  destructor RQOfferItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOfferItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItem');
  RemClassRegistry.RegisterXSClass(RQOfferItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemRef');
  RemClassRegistry.RegisterXSClass(RQOfferItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemFilter');
  RemClassRegistry.RegisterXSClass(RQOfferItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemShort');
  RemClassRegistry.RegisterXSClass(RQOfferItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOfferItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOfferItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOfferItemControllerSoapPort), 'http://ksoe.org/RQOfferItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOfferItemControllerSoapPort), 'http://ksoe.org/RQOfferItemController/action/RQOfferItemController.%operationName%');


end.
