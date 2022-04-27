unit RQPurchaseItem2EstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENEstimateItemController
   ,RQPurchaseItemController
   ,RQPurchaseItem2EstimateItemStatusController
   ,ENPlanWorkController
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

  RQPurchaseItem2EstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItem2EstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItem2EstimateItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    Fmodify_time : Int64;
    FstatusComment : WideString;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
//???
    FpurchaseItem2EstimateItemStatusRef : RQPurchaseItem2EstimateItemStatusRef;

    ForderCode : Integer;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusComment : WideString read FstatusComment write FstatusComment;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
    property purchaseItem2EstimateItemStatusRef : RQPurchaseItem2EstimateItemStatusRef read FpurchaseItem2EstimateItemStatusRef write FpurchaseItem2EstimateItemStatusRef;
    property orderCode : Integer read ForderCode write ForderCode;


  end;

{
  RQPurchaseItem2EstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    Fmodify_time : Int64;
    FstatusComment : WideString;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FpurchaseItemRef : RQPurchaseItemRef;
//???
    FpurchaseItem2EstimateItemStatusRef : RQPurchaseItem2EstimateItemStatus
		Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusComment : WideString read FstatusComment write FstatusComment;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
    property purchaseItem2EstimateItemStatusRef : RQPurchaseItem2EstimateItemStatus
		Ref read FpurchaseItem2EstimateItemStatusRef write FpurchaseItem2EstimateItemStatusRef;
  end;
}

  RQPurchaseItem2EstimateItemFilter = class(RQPurchaseItem2EstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItem2EstimateItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
    FstatusComment : WideString;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
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
    FpurchaseItem2EstimateItemStatusRefCode : Integer;

    FdepName : WideString;
    FobjInv : WideString;
    FobjName : WideString;
    FperiodPlan : WideString;
    FenplanworkTypeName : WideString;
    FenplanworkStateName : WideString;
    Ftechkartnumber : WideString;
    Ftechkartname : WideString;
    Fcontractnumber : WideString;
    FmaterialCode : Integer;
    Forder_info : WideString;
    ForderCode : Integer;
  public
    destructor Destroy; override;
  published

   property depName : WideString read FdepName write FdepName;
    property objInv : WideString read FobjInv write FobjInv;
    property objName: WideString read FobjName write FobjName;
    property periodPlan : WideString read FperiodPlan write FperiodPlan;
    property enplanworkTypeName : WideString read FenplanworkTypeName write FenplanworkTypeName;
    property enplanworkStateName : WideString read FenplanworkStateName write FenplanworkStateName;
    property techkartnumber : WideString read Ftechkartnumber write Ftechkartnumber;
    property techkartname : WideString read Ftechkartname write Ftechkartname;
    property contractnumber : WideString read Fcontractnumber write Fcontractnumber;

    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
    property statusComment : WideString read FstatusComment write FstatusComment;

    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
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
    property purchaseItem2EstimateItemStatusRefCode : Integer read FpurchaseItem2EstimateItemStatusRefCode write FpurchaseItem2EstimateItemStatusRefCode; //RQPurchaseItem2EstimateItemStatusRef read FpurchaseItem2EstimateItemStatusRefCode write FpurchaseItem2EstimateItemStatusRefCode;

    property materialCode : Integer read FmaterialCode write FmaterialCode;
    property order_info : WideString read Forder_info write Forder_info;
    property orderCode : Integer read ForderCode write ForderCode;
  end;



  ArrayOfRQPurchaseItem2EstimateItemShort = array of RQPurchaseItem2EstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItem2EstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItem2EstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItem2EstimateItemShort read Flist write Flist;
  end;



  ArrayOfInteger = array of Integer;


  RQPurchaseItem2EstimateItemGroupShort = class(TRemotable)
  private
    ForderPlanNumber : WideString;
    ForderPlanPeriod : WideString;
    FddsСode : WideString;
    FbudgetName : WideString;
    ForderitemСode : Integer;
    FcountFact : TXSDecimal;
    FpurchaseitemСode : Integer;
    FenContractCode : Integer;
    FmaterialInOrder : Integer;
    FdateForOrder : TXSDate;
    FestimateArray : ArrayOfString;
    FmaterialCode : Integer;
  public
    destructor Destroy; override;
  published
    property orderPlanNumber : WideString read ForderPlanNumber write ForderPlanNumber;
    property orderPlanPeriod : WideString read ForderPlanPeriod write ForderPlanPeriod;
    property ddsСode : WideString read FddsСode write FddsСode;
    property budgetName : WideString read FbudgetName write FbudgetName;
    property  orderitemСode : Integer read ForderitemСode write ForderitemСode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property  purchaseitemСode : Integer read FpurchaseitemСode write FpurchaseitemСode;
    property  enContractCode : Integer read FenContractCode write FenContractCode;
    property  materialInOrder : Integer read FmaterialInOrder write FmaterialInOrder;
    property dateForOrder : TXSDate read FdateForOrder write FdateForOrder;
    property estimateArray : ArrayOfString read Festimatearray write Festimatearray;
    property  materialCode : Integer read FmaterialCode write FmaterialCode;

  end;

  ArrayOfRQPurchaseItem2EstimateItemGroupShort = array of RQPurchaseItem2EstimateItemGroupShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItem2EstimateItemGroupShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItem2EstimateItemGroupShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItem2EstimateItemGroupShort read Flist write Flist;
  end;

     //////////////

  RQPurchaseItem2EstimateItemShortLite = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountPurchase : TXSDecimal;
	  FestimateItemRefCode : Integer;
	  FpurchaseItemRefMaterialNameGen : WideString;
	  FdepName : WideString;
    FobjInv : WideString;
    FobjName : WideString;
    FperiodPlan : WideString;
    FenplanworkTypeName : WideString;
    FenplanworkStateName : WideString;
    Ftechkartnumber : WideString;
    Ftechkartname : WideString;
    Fcontractnumber : WideString;
	  FpurchaseItem2EstimateItemStatusRefCode : Integer;
	  FmaterialCode : Integer;
	  Forder_info : WideString;
    FpurchaseItemRefMeasurementNameGen : WideString;

	public
    destructor Destroy; override;
  published

    property code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countPurchase : TXSDecimal read FcountPurchase write FcountPurchase;
   	property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
  	property purchaseItemRefMaterialNameGen : WideString read FpurchaseItemRefMaterialNameGen write FpurchaseItemRefMaterialNameGen;
	  property depName : WideString read FdepName write FdepName;
    property objInv : WideString read FobjInv write FobjInv;
    property objName: WideString read FobjName write FobjName;
    property periodPlan : WideString read FperiodPlan write FperiodPlan;
    property enplanworkTypeName : WideString read FenplanworkTypeName write FenplanworkTypeName;
    property enplanworkStateName : WideString read FenplanworkStateName write FenplanworkStateName;
    property techkartnumber : WideString read Ftechkartnumber write Ftechkartnumber;
    property techkartname : WideString read Ftechkartname write Ftechkartname;
    property contractnumber : WideString read Fcontractnumber write Fcontractnumber;
  	property purchaseItem2EstimateItemStatusRefCode : Integer read FpurchaseItem2EstimateItemStatusRefCode write FpurchaseItem2EstimateItemStatusRefCode;
  	property order_info : WideString read Forder_info write Forder_info;
    property materialCode : Integer read FmaterialCode write FmaterialCode;
    property purchaseItemRefMeasurementNameGen : WideString  read FpurchaseItemRefMeasurementNameGen write FpurchaseItemRefMeasurementNameGen;

 end;

 ArrayOfRQPurchaseItem2EstimateItemShortLite = array of RQPurchaseItem2EstimateItemShortLite;


  RQPurchaseItem2EstimateItemShortListLite = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItem2EstimateItemShortLite;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItem2EstimateItemShortLite read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItem2EstimateItemController/message/
  // soapAction: http://ksoe.org/RQPurchaseItem2EstimateItemController/action/RQPurchaseItem2EstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItem2EstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItem2EstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItem2EstimateItemControllerSoapPort = interface(IInvokable)
  ['{44D08212-87AB-43A6-97A9-EB25C338DCF9}']
    function add(const aRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItem2EstimateItem: RQPurchaseItem2EstimateItem); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItem2EstimateItem; stdcall;
    function getList: RQPurchaseItem2EstimateItemShortList; stdcall;
    function getFilteredList(const aRQPurchaseItem2EstimateItemFilter: RQPurchaseItem2EstimateItemFilter): RQPurchaseItem2EstimateItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItem2EstimateItemFilter: RQPurchaseItem2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItem2EstimateItemFilter: RQPurchaseItem2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItem2EstimateItemShort; stdcall;

    function getListWithPlanObj(const RQPurchaseItemObjCode: Integer ):RQPurchaseItem2EstimateItemShortList; stdcall;
    procedure replaceCountMaterials(const pi2eiList:  ArrayOfRQPurchaseItem2EstimateItemShort ;
                                          piList: ArrayOfRQPurchaseItemShort); stdcall;

    procedure unReplaceCountMaterials(const pi2eiList:  ArrayOfRQPurchaseItem2EstimateItemShort); stdcall;
    // ручная отмена учитывания количества по естимейту в строке плана закупок
    procedure notAccountMaterialsForPurchase(const pi2eiList:  ArrayOfRQPurchaseItem2EstimateItemShort); stdcall;
    // возврат учитывания количества из естимейта по материалу в строку плана закупок
    procedure unNotAccountMaterialsForPurchase(const pi2eiList:  ArrayOfRQPurchaseItem2EstimateItemShort); stdcall;
    // расширенный лист по материалам относящихся к строкам rqpurchaseitem
    function getScrollableFilteredListEstimate(const aRQPurchaseItem2EstimateItemFilter: RQPurchaseItem2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemShortListLite; stdcall;

    // сгрупированный лист по материалам относящихся к строкам rqpurchaseitem
    function getScrollableFilteredListEstimateGroupByAsOrderItem(const aRQPurchaseItem2EstimateItemFilter: RQPurchaseItem2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItem2EstimateItemGroupShortList; stdcall;

    // RQPurchaseItem2EstimateItem. Получить список естимейтов которые не в плане закупки для добавление в план закупки
    function  getEstimateFromPlanForAdding2PlanPurchase(const aENEstimateItemFilter: ENEstimateItemFilter; const aENPlanWorkFilter: ENPlanWorkFilter): ENEstimateItemShortList; stdcall;

    //////////////////////
    // добавление сгрупированных естимейтов в спецификацию к проекту договора
    procedure estimateGroupWithoutContractAdd2Specification(const eiGroupShortList : ArrayOfRQPurchaseItem2EstimateItemGroupShort );stdcall;

    //// zzz сгрупированный список с материалами связанными с договором
    function  getGroupedEstimate2ContractList(const aENEstimateItemFilter: ENEstimateItemFilter; const aENPlanWorkFilter: ENPlanWorkFilter): RQPurchaseItem2EstimateItemGroupShortList; stdcall;

    ///////// отвязка материалов из проекта договора
    procedure estimateGroupInContractUnlink2Specification(const eiGroupShortList : ArrayOfRQPurchaseItem2EstimateItemGroupShort );stdcall;

    //////////////////////
    // добавление сгрупированных естимейтов в спецификацию к проекту договора
    procedure estimateGroupWithoutContractAdd2Contract(const eiGroupShortList : ArrayOfRQPurchaseItem2EstimateItemGroupShort ; enContraciItemCode : Integer  );stdcall;

    ///////// отвязка материалов из договора
    procedure estimateGroupInContractUnlink2Contract(const eiGroupShortList : ArrayOfRQPurchaseItem2EstimateItemGroupShort );stdcall;

  end;


implementation

  destructor RQPurchaseItem2EstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    if Assigned(FpurchaseItem2EstimateItemStatusRef) then
      purchaseItem2EstimateItemStatusRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPurchaseItem2EstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    if Assigned(FpurchaseItem2EstimateItemStatusRef) then
      purchaseItem2EstimateItemStatusRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPurchaseItem2EstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPurchaseItem2EstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountPurchase) then
      countPurchase.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
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

  destructor RQPurchaseItem2EstimateItemShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;


  destructor RQPurchaseItem2EstimateItemGroupShort.Destroy;
  begin
    if Assigned(Fcountfact) then
      countfact.Free;

    inherited Destroy;
  end;

    destructor RQPurchaseItem2EstimateItemGroupShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;


  destructor RQPurchaseItem2EstimateItemShortLite.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;

    inherited Destroy;
  end;

  destructor RQPurchaseItem2EstimateItemShortListLite.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItem');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItem2EstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItem2EstimateItemShort');

  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItem2EstimateItemShortLite), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItem2EstimateItemShortLite');

  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItem2EstimateItemGroupShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItem2EstimateItemGroupShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemGroupShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemGroupShortList');
  RemClassRegistry.RegisterXSClass(RQPurchaseItem2EstimateItemGroupShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItem2EstimateItemGroupShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItem2EstimateItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItem2EstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItem2EstimateItemControllerSoapPort), 'http://ksoe.org/RQPurchaseItem2EstimateItemController/action/RQPurchaseItem2EstimateItemController.%operationName%');


end.


