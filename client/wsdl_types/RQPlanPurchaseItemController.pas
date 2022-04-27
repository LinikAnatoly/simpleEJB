unit RQPlanPurchaseItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,TKMeasurementController
   ,RQPlanPurchaseController
   ,RQPlanPurchaseItemTypeController
   ,RQPlanPurchaseItemMainController
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

  RQPlanPurchaseItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPurchaseItem = class(TRemotable)
  private
    Fcode : Integer;
    FpurchaseName : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FcountContract : TXSDecimal;
    FpriceContractWithoutNds : TXSDecimal;
    FpriceContractWithNds : TXSDecimal;
    FsumContractWithoutNds : TXSDecimal;
    FsumContractWithNds : TXSDecimal;
    FobjectsCodesIn : WideString;
    FobjectsNameIn : WideString;
    FobjectsCodesOut : WideString;
    FobjectsNameOut : WideString;
    Fcontractnumber : WideString;
    FcontractDate : TXSDate;
    FfindocCode : WideString;
    FfinDocID : Integer;
    FidOrg : Integer;
    FnameOrg : WideString;
    FcountFree : TXSDecimal;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
//???
    FpurchaseItemTypeRef : RQPlanPurchaseItemTypeRef;
//???
    FpurchaseItemMainRef : RQPlanPurchaseItemMainRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property countContract : TXSDecimal read FcountContract write FcountContract;
    property priceContractWithoutNds : TXSDecimal read FpriceContractWithoutNds write FpriceContractWithoutNds;
    property priceContractWithNds : TXSDecimal read FpriceContractWithNds write FpriceContractWithNds;
    property sumContractWithoutNds : TXSDecimal read FsumContractWithoutNds write FsumContractWithoutNds;
    property sumContractWithNds : TXSDecimal read FsumContractWithNds write FsumContractWithNds;
    property objectsCodesIn : WideString read FobjectsCodesIn write FobjectsCodesIn;
    property objectsNameIn : WideString read FobjectsNameIn write FobjectsNameIn;
    property objectsCodesOut : WideString read FobjectsCodesOut write FobjectsCodesOut;
    property objectsNameOut : WideString read FobjectsNameOut write FobjectsNameOut;
    property contractnumber : WideString read Fcontractnumber write Fcontractnumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property findocCode : WideString read FfindocCode write FfindocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  idOrg : Integer read FidOrg write FidOrg;
    property nameOrg : WideString read FnameOrg write FnameOrg;
    property countFree : TXSDecimal read FcountFree write FcountFree;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPlanPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
    property purchaseItemMainRef : RQPlanPurchaseItemMainRef read FpurchaseItemMainRef write FpurchaseItemMainRef;
  end;

{
  RQPlanPurchaseItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpurchaseName : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FcountContract : TXSDecimal;
    FpriceContractWithoutNds : TXSDecimal;
    FpriceContractWithNds : TXSDecimal;
    FsumContractWithoutNds : TXSDecimal;
    FsumContractWithNds : TXSDecimal;
    FobjectsCodesIn : WideString;
    FobjectsNameIn : WideString;
    FobjectsCodesOut : WideString;
    FobjectsNameOut : WideString;
    Fcontractnumber : WideString;
    FcontractDate : TXSDate;
    FfindocCode : WideString;
    FfinDocID : Integer;
    FidOrg : Integer;
    FnameOrg : WideString;
    FcountFree : TXSDecimal;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmeasurementRef : TKMeasurementRef;
//???
    FpurchaseRef : RQPlanPurchaseRef;
//???
    FpurchaseItemTypeRef : RQPlanPurchaseItemTypeRef;
//???
    FpurchaseItemMainRef : RQPlanPurchaseItemMainRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property countContract : TXSDecimal read FcountContract write FcountContract;
    property priceContractWithoutNds : TXSDecimal read FpriceContractWithoutNds write FpriceContractWithoutNds;
    property priceContractWithNds : TXSDecimal read FpriceContractWithNds write FpriceContractWithNds;
    property sumContractWithoutNds : TXSDecimal read FsumContractWithoutNds write FsumContractWithoutNds;
    property sumContractWithNds : TXSDecimal read FsumContractWithNds write FsumContractWithNds;
    property objectsCodesIn : WideString read FobjectsCodesIn write FobjectsCodesIn;
    property objectsNameIn : WideString read FobjectsNameIn write FobjectsNameIn;
    property objectsCodesOut : WideString read FobjectsCodesOut write FobjectsCodesOut;
    property objectsNameOut : WideString read FobjectsNameOut write FobjectsNameOut;
    property contractnumber : WideString read Fcontractnumber write Fcontractnumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property findocCode : WideString read FfindocCode write FfindocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  idOrg : Integer read FidOrg write FidOrg;
    property nameOrg : WideString read FnameOrg write FnameOrg;
    property countFree : TXSDecimal read FcountFree write FcountFree;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property measurementRef : TKMeasurementRef read FmeasurementRef write FmeasurementRef;
    property purchaseRef : RQPlanPurchaseRef read FpurchaseRef write FpurchaseRef;
    property purchaseItemTypeRef : RQPlanPurchaseItemTypeRef read FpurchaseItemTypeRef write FpurchaseItemTypeRef;
    property purchaseItemMainRef : RQPlanPurchaseItemMainRef read FpurchaseItemMainRef write FpurchaseItemMainRef;
  end;
}

  RQPlanPurchaseItemFilter = class(RQPlanPurchaseItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPurchaseItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FpurchaseName : WideString;
    Fidentid2010 : WideString;
    Fidentid2015 : WideString;
    FcountGen : TXSDecimal;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FpriceGenWithoutNds : TXSDecimal;
    FpriceGenWithNds : TXSDecimal;
    FsumGenWithoutNds : TXSDecimal;
    FsumGenWithNds : TXSDecimal;
    FcommentGen : WideString;
    FobjectsCodes : WideString;
    FobjectsName : WideString;
    FuserGen : WideString;
    FcountContract : TXSDecimal;
    FpriceContractWithoutNds : TXSDecimal;
    FpriceContractWithNds : TXSDecimal;
    FsumContractWithoutNds : TXSDecimal;
    FsumContractWithNds : TXSDecimal;
    FobjectsCodesIn : WideString;
    FobjectsNameIn : WideString;
    FobjectsCodesOut : WideString;
    FobjectsNameOut : WideString;
    Fcontractnumber : WideString;
    FcontractDate : TXSDate;
    FfindocCode : WideString;
    FfinDocID : Integer;
    FidOrg : Integer;
    FnameOrg : WideString;
    FcountFree : TXSDecimal;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialRefCostnkre : TXSDecimal;
    FmaterialRefWeight : TXSDecimal;
    FmaterialRefCostAlternative : TXSDecimal;
   // FmaterialRefCode : Integer;
   // FmaterialRefName : WideString;
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
    FpurchaseItemMainRefCode : Integer;
    FpurchaseItemMainRefMaterialNameGen : WideString;
    FpurchaseItemMainRefMeasurementNameGen : WideString;
    FpurchaseItemMainRefIdentid2010 : WideString;
    FpurchaseItemMainRefIdentid2015 : WideString;
    FpurchaseItemMainRefCountGen : TXSDecimal;
    FpurchaseItemMainRefCountPurchase : TXSDecimal;
    FpurchaseItemMainRefPriceGenWithoutNds : TXSDecimal;
    FpurchaseItemMainRefPriceGenWithNds : TXSDecimal;
    FpurchaseItemMainRefSumGenWithoutNds : TXSDecimal;
    FpurchaseItemMainRefSumGenWithNds : TXSDecimal;
    FpurchaseItemMainRefPricePurchaseWithoutNds : TXSDecimal;
    FpurchaseItemMainRefPricePurchaseWithNds : TXSDecimal;
    FpurchaseItemMainRefSumPurchaseWithoutNds : TXSDecimal;
    FpurchaseItemMainRefSumPurchaseWithNds : TXSDecimal;
    FpurchaseItemMainRefCommentGen : WideString;
    FpurchaseItemMainRefObjectsCodes : WideString;
    FpurchaseItemMainRefObjectsName : WideString;
    FpurchaseItemMainRefUserGen : WideString;
    FpurchaseItemMainRefCountFree : TXSDecimal;
    FpurchaseKindCode : Integer;
    FpurchaseKindName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property purchaseName : WideString read FpurchaseName write FpurchaseName;
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property priceGenWithoutNds : TXSDecimal read FpriceGenWithoutNds write FpriceGenWithoutNds;
    property priceGenWithNds : TXSDecimal read FpriceGenWithNds write FpriceGenWithNds;
    property sumGenWithoutNds : TXSDecimal read FsumGenWithoutNds write FsumGenWithoutNds;
    property sumGenWithNds : TXSDecimal read FsumGenWithNds write FsumGenWithNds;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectsCodes : WideString read FobjectsCodes write FobjectsCodes;
    property objectsName : WideString read FobjectsName write FobjectsName;
    property userGen : WideString read FuserGen write FuserGen;
    property countContract : TXSDecimal read FcountContract write FcountContract;
    property priceContractWithoutNds : TXSDecimal read FpriceContractWithoutNds write FpriceContractWithoutNds;
    property priceContractWithNds : TXSDecimal read FpriceContractWithNds write FpriceContractWithNds;
    property sumContractWithoutNds : TXSDecimal read FsumContractWithoutNds write FsumContractWithoutNds;
    property sumContractWithNds : TXSDecimal read FsumContractWithNds write FsumContractWithNds;
    property objectsCodesIn : WideString read FobjectsCodesIn write FobjectsCodesIn;
    property objectsNameIn : WideString read FobjectsNameIn write FobjectsNameIn;
    property objectsCodesOut : WideString read FobjectsCodesOut write FobjectsCodesOut;
    property objectsNameOut : WideString read FobjectsNameOut write FobjectsNameOut;
    property contractnumber : WideString read Fcontractnumber write Fcontractnumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property findocCode : WideString read FfindocCode write FfindocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  idOrg : Integer read FidOrg write FidOrg;
    property nameOrg : WideString read FnameOrg write FnameOrg;
    property countFree : TXSDecimal read FcountFree write FcountFree;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre;
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight;
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;
 //   property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
 //   property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
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
    property purchaseItemMainRefCode : Integer read FpurchaseItemMainRefCode write FpurchaseItemMainRefCode;
    property purchaseItemMainRefMaterialNameGen : WideString read FpurchaseItemMainRefMaterialNameGen write FpurchaseItemMainRefMaterialNameGen;
    property purchaseItemMainRefMeasurementNameGen : WideString read FpurchaseItemMainRefMeasurementNameGen write FpurchaseItemMainRefMeasurementNameGen;
    property purchaseItemMainRefIdentid2010 : WideString read FpurchaseItemMainRefIdentid2010 write FpurchaseItemMainRefIdentid2010;
    property purchaseItemMainRefIdentid2015 : WideString read FpurchaseItemMainRefIdentid2015 write FpurchaseItemMainRefIdentid2015;
    property purchaseItemMainRefCountGen : TXSDecimal read FpurchaseItemMainRefCountGen write FpurchaseItemMainRefCountGen;
    property purchaseItemMainRefCountPurchase : TXSDecimal read FpurchaseItemMainRefCountPurchase write FpurchaseItemMainRefCountPurchase;
    property purchaseItemMainRefPriceGenWithoutNds : TXSDecimal read FpurchaseItemMainRefPriceGenWithoutNds write FpurchaseItemMainRefPriceGenWithoutNds;
    property purchaseItemMainRefPriceGenWithNds : TXSDecimal read FpurchaseItemMainRefPriceGenWithNds write FpurchaseItemMainRefPriceGenWithNds;
    property purchaseItemMainRefSumGenWithoutNds : TXSDecimal read FpurchaseItemMainRefSumGenWithoutNds write FpurchaseItemMainRefSumGenWithoutNds;
    property purchaseItemMainRefSumGenWithNds : TXSDecimal read FpurchaseItemMainRefSumGenWithNds write FpurchaseItemMainRefSumGenWithNds;
    property purchaseItemMainRefPricePurchaseWithoutNds : TXSDecimal read FpurchaseItemMainRefPricePurchaseWithoutNds write FpurchaseItemMainRefPricePurchaseWithoutNds;
    property purchaseItemMainRefPricePurchaseWithNds : TXSDecimal read FpurchaseItemMainRefPricePurchaseWithNds write FpurchaseItemMainRefPricePurchaseWithNds;
    property purchaseItemMainRefSumPurchaseWithoutNds : TXSDecimal read FpurchaseItemMainRefSumPurchaseWithoutNds write FpurchaseItemMainRefSumPurchaseWithoutNds;
    property purchaseItemMainRefSumPurchaseWithNds : TXSDecimal read FpurchaseItemMainRefSumPurchaseWithNds write FpurchaseItemMainRefSumPurchaseWithNds;
    property purchaseItemMainRefCommentGen : WideString read FpurchaseItemMainRefCommentGen write FpurchaseItemMainRefCommentGen;
    property purchaseItemMainRefObjectsCodes : WideString read FpurchaseItemMainRefObjectsCodes write FpurchaseItemMainRefObjectsCodes;
    property purchaseItemMainRefObjectsName : WideString read FpurchaseItemMainRefObjectsName write FpurchaseItemMainRefObjectsName;
    property purchaseItemMainRefUserGen : WideString read FpurchaseItemMainRefUserGen write FpurchaseItemMainRefUserGen;
    property purchaseItemMainRefCountFree : TXSDecimal read FpurchaseItemMainRefCountFree write FpurchaseItemMainRefCountFree;

    property purchaseKindCode : Integer read FpurchaseKindCode write FpurchaseKindCode;
    property purchaseKindName : WideString read FpurchaseKindName write FpurchaseKindName;
  end;

  ArrayOfRQPlanPurchaseItemShort = array of RQPlanPurchaseItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPurchaseItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPurchaseItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPurchaseItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPurchaseItemController/message/
  // soapAction: http://ksoe.org/RQPlanPurchaseItemController/action/RQPlanPurchaseItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPurchaseItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPurchaseItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPurchaseItemControllerSoapPort = interface(IInvokable)
  ['{42d242d2-42d2-42d2-42d2-42d242d242d2}']
    function add(const aRQPlanPurchaseItem: RQPlanPurchaseItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPurchaseItem: RQPlanPurchaseItem); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPurchaseItem; stdcall;
    function getList: RQPlanPurchaseItemShortList; stdcall;
    function getFilteredList(const aRQPlanPurchaseItemFilter: RQPlanPurchaseItemFilter): RQPlanPurchaseItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPurchaseItemFilter: RQPlanPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPurchaseItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPurchaseItemFilter: RQPlanPurchaseItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPurchaseItemShort; stdcall;
  end;


implementation

  destructor RQPlanPurchaseItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountContract) then
      countContract.Free;
    if Assigned(FpriceContractWithoutNds) then
      priceContractWithoutNds.Free;
    if Assigned(FpriceContractWithNds) then
      priceContractWithNds.Free;
    if Assigned(FsumContractWithoutNds) then
      sumContractWithoutNds.Free;
    if Assigned(FsumContractWithNds) then
      sumContractWithNds.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
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
    if Assigned(FpurchaseItemMainRef) then
      purchaseItemMainRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPurchaseItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountContract) then
      countContract.Free;
    if Assigned(FpriceContractWithoutNds) then
      priceContractWithoutNds.Free;
    if Assigned(FpriceContractWithNds) then
      priceContractWithNds.Free;
    if Assigned(FsumContractWithoutNds) then
      sumContractWithoutNds.Free;
    if Assigned(FsumContractWithNds) then
      sumContractWithNds.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
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
    if Assigned(FpurchaseItemMainRef) then
      purchaseItemMainRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPurchaseItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPurchaseItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpriceGenWithoutNds) then
      priceGenWithoutNds.Free;
    if Assigned(FpriceGenWithNds) then
      priceGenWithNds.Free;
    if Assigned(FsumGenWithoutNds) then
      sumGenWithoutNds.Free;
    if Assigned(FsumGenWithNds) then
      sumGenWithNds.Free;
    if Assigned(FcountContract) then
      countContract.Free;
    if Assigned(FpriceContractWithoutNds) then
      priceContractWithoutNds.Free;
    if Assigned(FpriceContractWithNds) then
      priceContractWithNds.Free;
    if Assigned(FsumContractWithoutNds) then
      sumContractWithoutNds.Free;
    if Assigned(FsumContractWithNds) then
      sumContractWithNds.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
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
    if Assigned(FpurchaseItemMainRefCountGen) then
      purchaseItemMainRefCountGen.Free;
    if Assigned(FpurchaseItemMainRefCountPurchase) then
      purchaseItemMainRefCountPurchase.Free;
    if Assigned(FpurchaseItemMainRefPriceGenWithoutNds) then
      purchaseItemMainRefPriceGenWithoutNds.Free;
    if Assigned(FpurchaseItemMainRefPriceGenWithNds) then
      purchaseItemMainRefPriceGenWithNds.Free;
    if Assigned(FpurchaseItemMainRefSumGenWithoutNds) then
      purchaseItemMainRefSumGenWithoutNds.Free;
    if Assigned(FpurchaseItemMainRefSumGenWithNds) then
      purchaseItemMainRefSumGenWithNds.Free;
    if Assigned(FpurchaseItemMainRefPricePurchaseWithoutNds) then
      purchaseItemMainRefPricePurchaseWithoutNds.Free;
    if Assigned(FpurchaseItemMainRefPricePurchaseWithNds) then
      purchaseItemMainRefPricePurchaseWithNds.Free;
    if Assigned(FpurchaseItemMainRefSumPurchaseWithoutNds) then
      purchaseItemMainRefSumPurchaseWithoutNds.Free;
    if Assigned(FpurchaseItemMainRefSumPurchaseWithNds) then
      purchaseItemMainRefSumPurchaseWithNds.Free;
    if Assigned(FpurchaseItemMainRefCountFree) then
      purchaseItemMainRefCountFree.Free;
    inherited Destroy;
  end;

  destructor RQPlanPurchaseItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPurchaseItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseItem');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseItemRef');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseItemFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseItemShort');
  RemClassRegistry.RegisterXSClass(RQPlanPurchaseItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPurchaseItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPurchaseItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPurchaseItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPurchaseItemControllerSoapPort), 'http://ksoe.org/RQPlanPurchaseItemController/action/RQPlanPurchaseItemController.%operationName%');


end.
