unit ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   ,ENPlanWorkItemController 
   ,TKMaterialsController 
   ,ENEstimateItemTypeController 
   ,ENEstimateItemKindController 
   ,ENEstimateItemStatusController 
   ,TKAccountingTypeController
   ,RQOrderController
   ,ENMetrologyCounterController
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

  ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    Fprice : TXSDecimal;
    FpriceVRTU : TXSDecimal;
    Fcost : TXSDecimal;
    FisUseVAT : Integer;
    FdeliveryTime : Integer; 
    FuseWorkTime : Integer; 
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FkindRef : ENEstimateItemKindRef;
//???
    FstatusRef : ENEstimateItemStatusRef;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property priceVRTU : TXSDecimal read FpriceVRTU write FpriceVRTU;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  isUseVAT : Integer read FisUseVAT write FisUseVAT;
    property  deliveryTime : Integer read FdeliveryTime write FdeliveryTime; 
    property  useWorkTime : Integer read FuseWorkTime write FuseWorkTime; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef; 
    property kindRef : ENEstimateItemKindRef read FkindRef write FkindRef; 
    property statusRef : ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef; 
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
  end;
  
{
  ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FisUseVAT : Integer;
    FdeliveryTime : Integer; 
    FuseWorkTime : Integer; 
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FkindRef : ENEstimateItemKindRef;
//???
    FstatusRef : ENEstimateItemStatusRef;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property cost : TXSDecimal read Fcost write Fcost; 
    property  isUseVAT : Integer read FisUseVAT write FisUseVAT;
    property  deliveryTime : Integer read FdeliveryTime write FdeliveryTime; 
    property  useWorkTime : Integer read FuseWorkTime write FuseWorkTime; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef; 
    property kindRef : ENEstimateItemKindRef read FkindRef write FkindRef; 
    property statusRef : ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef; 
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
  end;
}

  ENEstimateItemFilter = class(ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    Fprice : TXSDecimal;
    FpriceVRTU : TXSDecimal;
    Fcost : TXSDecimal;
    FisUseVAT : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanItemRefCode : Integer; 
    FplanItemRefCountGen : TXSDecimal;
//    FplanItemRefWorkerCount_ : Integer;
    FplanItemRefUserGen : WideString;
    FplanItemRefDateEdit : TXSDate;
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;

    FmeasureType: WideString;
    FkartaRefCode :Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;


    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FkindRefCode : Integer; 
    FkindRefName : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;

    /////
    FcountFINMaterials: Integer;
    /////
    FinvNumber : WideString;
    FelementName : WideString;
    Fecode : Integer;
    FplanType : WideString;
    FplanState : WideString;
    FdeliveryTime : Integer;

    FplanRefDepartmentCode : Integer;
    FplanRefDepartmentName : WideString;

    FuseWorkTime : Integer;
    FuseWorkTimeName : WideString;

    //FstatusRefName : WideString;

    FaccountingTypeRefCode : Integer;
    FaccountingTypeRefName : WideString;

    FbudgetRefCode : Integer;
    FddsCodeAvz : Integer;

    /////
    ForderNumber : WideString;
    ForderPeriod : TXSDate;

    ForgName : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    /////

    FplanRefStatusCode : Integer;
    FpurchaseItemRefCode : Integer;
    FenContractCode : Integer;
    FpurchaseItem2EstimateitemCode : Integer;

    Fidentid2010 : WideString;
    Fidentid2015 : WideString;

    FpurchaseInfoByOrderItem : WideString;


  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property price : TXSDecimal read Fprice write Fprice; 
    property priceVRTU : TXSDecimal read FpriceVRTU write FpriceVRTU;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  isUseVAT : Integer read FisUseVAT write FisUseVAT;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property deliveryTime : Integer read FdeliveryTime write FdeliveryTime;
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen;
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart;
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal;
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen;
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit;
    property planItemRefCode : Integer read FplanItemRefCode write FplanItemRefCode;
    property planItemRefCountGen : TXSDecimal read FplanItemRefCountGen write FplanItemRefCountGen;
//    property planItemRefWorkerCount_ : Integer read FplanItemRefWorkerCount_ write FplanItemRefWorkerCount_;
    property planItemRefUserGen : WideString read FplanItemRefUserGen write FplanItemRefUserGen;
    property planItemRefDateEdit : TXSDate read FplanItemRefDateEdit write FplanItemRefDateEdit;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;

    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;


    property measureType: WideString read FmeasureType write FmeasureType;

    property kartaRefCode :Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;

    /////
    property countFINMaterials: Integer read FcountFINMaterials write FcountFINMaterials;
    /////
    property invNumber : WideString read FinvNumber write FinvNumber;
    property elementName : WideString read FelementName write FelementName;
    property planType : WideString read FplanType write FplanType;
    property planState : WideString read FplanState write FplanState;
    property ecode : Integer read Fecode write Fecode;

    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property statusRefCode :Integer read FstatusRefCode write FstatusRefCode;

    property planRefDepartmentCode :Integer read FplanRefDepartmentCode write FplanRefDepartmentCode;
    property planRefDepartmentName : WideString read FplanRefDepartmentName write FplanRefDepartmentName;

    property useWorkTime : Integer read FuseWorkTime write FuseWorkTime;
    property useWorkTimeName : WideString read FuseWorkTimeName write FuseWorkTimeName;

    property accountingTypeRefCode :Integer read FaccountingTypeRefCode write FaccountingTypeRefCode;
    property accountingTypeRefName : WideString read FaccountingTypeRefName write FaccountingTypeRefName;

    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property ddsCodeAvz : Integer read FddsCodeAvz write FddsCodeAvz;

    /////
    property orderNumber : WideString read ForderNumber write ForderNumber;
    property orderPeriod : TXSDate read ForderPeriod write ForderPeriod;

    property orgName : WideString read ForgName write ForgName;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property finDocID : Integer read FfinDocID write FfinDocID;         
    /////

    property planRefStatusCode : Integer read FplanRefStatusCode write FplanRefStatusCode;
    property purchaseItemRefCode : Integer read FpurchaseItemRefCode write FpurchaseItemRefCode;

    property enContractCode : Integer read FenContractCode write FenContractCode;
    property purchaseItem2EstimateitemCode : Integer read FpurchaseItem2EstimateitemCode write FpurchaseItem2EstimateitemCode;

    property identid2010 : WideString read Fidentid2010 write  Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write  Fidentid2015;

    property purchaseInfoByOrderItem :WideString read FpurchaseInfoByOrderItem write FpurchaseInfoByOrderItem;

  end;



  ArrayOfInteger = array of Integer;

    ArrayOfENEstimateItemShort = array of ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemShort read Flist write Flist;
  end;


   ENEstimateItemWriteOffShort = class(TRemotable)
  private

     Festimateitemrefcode : Integer;
     Fenmatname : WideString;
	   Fenmeasurementcode : Integer;
	   Fenmeasurementname : WideString;
     Ffmmatname: WideString;
	   Ffmmeasurementname : WideString;
	   Ffmmeasurementcode : Integer;
	   Fnn :  WideString;
	   Fdiv_code : WideString;
	   Fdiv_name : WideString;
	   Fparty_id : Integer;
	   Fbal_sch : WideString;
     Ftabnumber : WideString;
	   Ffio : WideString;
	   Fprofesion : WideString;
	   Fdepname : WideString;
     Fsizcode : Integer;
     Fdateloadexpl : WideString;
     Fcountgen : TXSDecimal;
     Fcheckplan : Integer;
     Fcountmonth_txt : WideString;
     FcountgenForView : TXSDecimal;
  public
   // destructor Destroy; override;
  published
    property estimateitemrefcode : Integer read Festimateitemrefcode write Festimateitemrefcode;
    property enmatname : WideString read Fenmatname write Fenmatname;
	  property enmeasurementcode : Integer read Fenmeasurementcode write Fenmeasurementcode;
	  property enmeasurementname : WideString read Fenmeasurementname write Fenmeasurementname;
    property fmmatname: WideString read Ffmmatname write Ffmmatname;
    property fmmeasurementname : WideString read Ffmmeasurementname write Ffmmeasurementname;
	  property fmmeasurementcode : Integer read Ffmmeasurementcode write Ffmmeasurementcode;
	  property nn :  WideString read Fnn write Fnn;
	  property div_code : WideString read Fdiv_code write Fdiv_code;
	  property div_name : WideString read Fdiv_name write Fdiv_name;
	  property party_id : Integer read Fparty_id write Fparty_id;
	  property bal_sch : WideString read Fbal_sch write Fbal_sch;
    property tabnumber : WideString read Ftabnumber write Ftabnumber;
	  property fio : WideString read Ffio write Ffio;
	  property profesion : WideString read Fprofesion write Fprofesion;
	  property depname : WideString read Fdepname write Fdepname;
    property sizcode : Integer read Fsizcode write Fsizcode;
    property dateloadexpl : WideString read Fdateloadexpl write Fdateloadexpl;
    property countgen : TXSDecimal read Fcountgen write Fcountgen;
    property checkplan : Integer read Fcheckplan write Fcheckplan;
    property countmonth_txt : WideString read Fcountmonth_txt write Fcountmonth_txt;
    property countgenForView : TXSDecimal read FcountgenForView write FcountgenForView;

  end;



  ArrayOfENEstimateItemWriteOffShort = array of ENEstimateItemWriteOffShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemWriteOffShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemWriteOffShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemWriteOffShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemController/message/
  // soapAction: http://ksoe.org/ENEstimateItemController/action/ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{1967DEC3-C3CE-42B4-B337-535C6C46ACD1}']
    function  add(const aENEstimateItem: ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItem: ENEstimateItem); stdcall; overload;
    procedure save(const aENEstimateItem: ENEstimateItem; account : String); stdcall; overload;
    /// 01.08.10
    // Уже не надо !!! МТС передумал и переубедил СВЭС :-)
    // procedure saveForOrder(const aENEstimateItem: ENEstimateItem); stdcall;
    ///
    function  getObject(const anObjectCode: Integer): ENEstimateItem; stdcall;
    function  getList: ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aENEstimateItemFilter: ENEstimateItemFilter): ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItemFilter: ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemShortList; stdcall;

    function  getDetailedEstimateList(const aENEstimateItemFilter: ENEstimateItemFilter; const aENPlanWorkFilter: ENPlanWorkFilter): ENEstimateItemShortList; stdcall;
    function  getDetailedEstimateListForTender(const aENEstimateItemFilter: ENEstimateItemFilter; const aENPlanWorkFilter: ENPlanWorkFilter;
                const aRQOrderFilter: RQOrderFilter; const aIncludePlanned: Boolean; const aIncludeOrdered: Boolean; const aIncludePresent: Boolean): ENEstimateItemShortList; stdcall;

    function  getForBillInvoiceList(const aENEstimateItemFilter: ENEstimateItemFilter; const isBill: Boolean; const billType: Integer): ENEstimateItemShortList; stdcall;
    function  changeStatus(const aEstimateItemCode: Integer; const aStatusCode: Integer): Integer; stdcall;

    function getEstimateFromCurrentPlanByEstimateCode(const aEstimateItemCode: Integer): ENEstimateItem; stdcall;
    function getEstimateCodesFromCurrentPlan(const aEstimateItemCode: Integer): String; stdcall;

    function getParentByMovedTyp(const aEstimateItemCode: Integer; const cMovedType : Integer): ENEstimateItem; stdcall;

    function addInClosedPlan(const aENEstimateItem: ENEstimateItem ) : Integer; stdcall;

    function addUnmount(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; isCreateObject : Integer; account : String) : Integer; stdcall; overload;
    function addUnmount(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; isCreateObject : Integer; finMaterialsParentRefCode : Integer; account : String) : Integer; stdcall; overload;
    procedure saveUnmount(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String); stdcall;
    procedure removeUnmount(const aENEstimateItemCode: Integer); stdcall;

    function addProduced(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String; divCode4Order : string; divName4Order: string) : Integer; stdcall;
    procedure saveProduced(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String; divCode4Order : string; divName4Order: string); stdcall;
    procedure removeProduced(const aENEstimateItemCode: Integer); stdcall;

    function addProduced4Services(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String) : Integer; stdcall;
    procedure saveProduced4Services(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; acount : String); stdcall;
    procedure removeProduced4Services(const aENEstimateItemCode: Integer); stdcall;

    function addUnmountForWriteOff(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; isCreateObject : Integer ; dismountFromEstimate : Integer; account : String) : Integer; stdcall;
    procedure saveUnmountForWriteOff(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer ; nn : String; dismountFromEstimate : Integer; account : String ); stdcall;

    ////// 06.12.11 Демонтаж при списании МБП и МНМА
    function addUnmountForWriteOff_MBP_MNMA(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; isCreateObject : Integer; finMaterialParentCode : Integer; account : String) : Integer; stdcall;
    procedure saveUnmountForWriteOff_MBP_MNMA(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String); stdcall;
    procedure removeUnmountForWriteOff_MBP_MNMA(const aENEstimateItemCode: Integer); stdcall;
    //////

    function addRefinement(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String) : Integer; stdcall; overload;
    function addRefinement(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String; molCode : String) : Integer; stdcall; overload;
    procedure saveRefinement(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String); stdcall; overload;
    procedure saveRefinement(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; account : String; molCode : String); stdcall; overload;
    procedure removeRefinement(const aENEstimateItemCode: Integer); stdcall;

    function add4Refinement(const aENEstimateItem: ENEstimateItem) : Integer; stdcall;
    procedure save4Refinement(const aENEstimateItem: ENEstimateItem; isMain4Refinement : Integer); stdcall;

    // 08.11.12 NET-3079
    function addCustomerMaterial(const aENEstimateItem: ENEstimateItem; nomenclatureCode: Integer; nn : String; account : String): Integer; stdcall;
	  procedure saveCustomerMaterial(const aENEstimateItem: ENEstimateItem; nomenclatureCode: Integer; nn : String; account :String); stdcall;
	  procedure removeCustomerMaterial(const aENEstimateItemCode: Integer); stdcall;


    function  getScrollableFilteredListWriteOff(const aCondition: WideString ):ENEstimateItemWriteOffShortList; stdcall;
    function  getScrollableFilteredListWriteOffSubstation(const aCondition: WideString ):ENEstimateItemWriteOffShortList; stdcall;
    function  getScrollableFilteredListWriteOffBrigade(const aCondition: WideString ):ENEstimateItemWriteOffShortList; stdcall;

    function addForWriteOffFromEstimateList(const  aENPlanWorkCode: Integer ; estimateList : ArrayOfENEstimateItemShort) : Integer; stdcall;
    procedure removeForWriteOff(const anObjectCode: Integer); stdcall;

    function addUnmountCountersWriteOff(const aENEstimateItem: ENEstimateItem; nomenclatureCode : Integer; nn : String; isCreateObject : Integer; account : String) : Integer; stdcall;
    procedure removeUnmountCountersWriteOff(const aENEstimateItemCode: Integer); stdcall;

    // 02.03.2012 +++ изменить обнулённое кол-во
    procedure changeCountFact(const aENEstimateItem: ENEstimateItem); stdcall;

    function getEstimateByTransportRouteList(
         const aENEstimateItemFilter: ENEstimateItemFilter;
         const anCondition: WideString;
         const anOrderBy: WideString;
         const aFromPosition: Integer;
         const aQuantity: Integer): ENEstimateItemShortList; stdcall;


    //  16.06.2012 +++
    //  ENEstimateItem. Список материалов для передачи счетчиков Метрологии под плановые замены
    //  обычный лист (getDetailedEstimateList) страшно тормозит на PostgreSQL 9
    function getDetailedEstimateBySCCountersList(
         const aENEstimateItemFilter: ENEstimateItemFilter;
         const aENPlanWorkFilter: ENPlanWorkFilter): ENEstimateItemShortList; stdcall;

    function getFilteredCodeArray(const aENEstimateItemFilter: ENEstimateItemFilter;
      const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function getShortListForOSExpl(const aENEstimateItemFilter: ENEstimateItemFilter;
      const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemShortList; stdcall;

   // 21.02.2014 SUPP-8470 автоматический поиск остатков под материалы на планах
    function bindingMaterialsFromRem(const enplanworkCode : Integer ;  const dateGet : TXSDate): Integer; stdcall;
    procedure UnBindingMaterialsFromRem(const enplanworkCode : Integer; const  strCodes : String);stdcall;

    //SUPP-13857 отдельный метод для получения списка естимейтов доступных для вкидывания в счет
    // итнимаем со свзки заявки с естимейтом а не с самого естимейта на плане т.к естимейт может делиться и кол-во уедет
    function  getForBillInvoiceListForGenerateItem(const aENEstimateItemFilter: ENEstimateItemFilter; const isBill: Boolean; const billType: Integer): ENEstimateItemShortList; stdcall;

    {NET-4445 - возвращает код естимейта с месячного плана по инвентарному и по num_un старого состояния счетчика (тот который выбирали в sccounter при перемещении на кладовщика)
              - используется для формирования строк на перемещение счетчика с кладовщика реса на мастера по счету 1533.
               --  С проверкой если не нашли такой план то ругаемся ,
                   если нашли план но МОЛ на плане не совпадает с молом получателя на ордере , то ругаемся }
    function  getEstimateCodeFromMonthPlanByMovingCounterFromStorekeeper2Master(const aENMetrologyCounter: ENMetrologyCounter; const molOutCode : String): Integer; stdcall;

    // добавление естимейтов в спецификацию к проекту договора
    procedure estimateWithoutContractAdd2SpecificationExecute(const eiShortList : ArrayOfENEstimateItemShort );stdcall;

    // Видалити прив`язку вибраних строк матеріалів із проекту договора
    procedure estimate2ProjectAgreeUnlink(const eiShortList : ArrayOfENEstimateItemShort );stdcall;
    // перечень естимейтов с учетом  связки естимейта к договорам enestimateitem2contrct
    function  getDetailedEstimate2ContractList(const aENEstimateItemFilter: ENEstimateItemFilter; const aENPlanWorkFilter: ENPlanWorkFilter): ENEstimateItemShortList; stdcall;

    // связка естимейтов без договоров к договорам
    procedure estimateWithoutContractLink2Contract(const eiShortList : ArrayOfENEstimateItemShort ; const enContractItemCode : Integer );stdcall;

    //  Відмінити прив`язку вибраних строк матеріалів з планів від договору
    procedure estimateWithContractUnLink2Contract(const eiShortList : ArrayOfENEstimateItemShort );stdcall;
    //  добавление выбранных естимейтов в план закупок
    procedure estimateAdd2Planpurchase(const eiShortList : ArrayOfENEstimateItemShort ; const planPurchaseCode : Integer );stdcall;


    //  Списання ЗЗ персоналу ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
    procedure writeOffZZOnlyEnergyNETBySizObject(const aENEstimateItem: ENEstimateItem; const finMolCode : String ) ;stdcall;

    //  Списання ЗЗ бригады ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
    procedure writeOffZZOnlyEnergyNETByBrigadeObject(const aENEstimateItem: ENEstimateItem; const finMolCode : String ) ;stdcall;

     // Списання ЗЗ подстанции ( використовується  якщо в ФК немає залишків) . Естимейт который вводился в экспл. добавляем в связку с признаком списано
    procedure writeOffZZOnlyEnergyNETBySubstation150Object(const aENEstimateItem: ENEstimateItem; const finMolCode : String ) ;stdcall;

    // преобразование незаказанных материалов на годовых и месячных планах
    procedure transformEstimate(const estimateItemCode: Integer; const aENEstimateItem: ENEstimateItem); stdcall;

  end;


implementation



  destructor ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FpriceVRTU) then
      priceVRTU.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    inherited Destroy;
  end;
  
{  
  destructor ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 


  destructor ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FpriceVRTU) then
      priceVRTU.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanItemRefCountGen) then
      planItemRefCountGen.Free;
    if Assigned(FplanItemRefDateEdit) then
      planItemRefDateEdit.Free;

    /////
    if Assigned(ForderPeriod) then
      orderPeriod.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;          
    /////

    inherited Destroy;
  end;


  
  destructor ENEstimateItemShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

   destructor ENEstimateItemWriteOffShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem');
  RemClassRegistry.RegisterXSClass(ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemControllerSoapPort), 'http://ksoe.org/ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemControllerSoapPort), 'http://ksoe.org/ENEstimateItemController/action/ENEstimateItemController.%operationName%');

  RemClassRegistry.RegisterXSClass(ENEstimateItemWriteOffShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemWriteOffShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemWriteOffShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemWriteOffShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemWriteOffShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemWriteOffShort');
end.
