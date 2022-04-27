unit ENEstimateHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENEstimateHistoryTypeController
   ,ENEstimateItemController
   ,RQOrderItemController
   ,RQBillItemController
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

  ENEstimateHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateHistory = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
//???
    FhistoryTypeRef : ENEstimateHistoryTypeRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
//???
    FrqBillItemRef : RQBillItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property historyTypeRef : ENEstimateHistoryTypeRef read FhistoryTypeRef write FhistoryTypeRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
    property rqBillItemRef : RQBillItemRef read FrqBillItemRef write FrqBillItemRef;
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef;
  end;

{
  ENEstimateHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountFact : TXSDecimal;
//???
    FhistoryTypeRef : ENEstimateHistoryTypeRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
//???
    FrqBillItemRef : RQBillItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property historyTypeRef : ENEstimateHistoryTypeRef read FhistoryTypeRef write FhistoryTypeRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
    property rqBillItemRef : RQBillItemRef read FrqBillItemRef write FrqBillItemRef;
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef;
  end;
}

  ENEstimateHistoryFilter = class(ENEstimateHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateHistoryShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
    FhistoryTypeRefCode : Integer;
    FhistoryTypeRefName : WideString;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefDeliveryTime : Integer;
    FestimateItemRefUseWorkTime : Integer;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FrqOrderItemRefCode : Integer;
    FrqOrderItemRefCountGen : TXSDecimal;
    FrqOrderItemRefMaterialNameTxt : WideString;
    FrqOrderItemRefMeasurementNameTxt : WideString;
    FrqOrderItemRefMaterialNameGen : WideString;
    FrqOrderItemRefMeasurementNameGen : WideString;
    FrqOrderItemRefMaterialNameGenRQ : WideString;
    FrqOrderItemRefMeasurementNameGenRQ : WideString;
    FrqOrderItemRefCountFact : TXSDecimal;
    FrqOrderItemRefPriceWithoutNds : TXSDecimal;
    FrqOrderItemRefNds : TXSDecimal;
    FrqOrderItemRefPriceWithNds : TXSDecimal;
    FrqOrderItemRefSumWithoutNds : TXSDecimal;
    FrqOrderItemRefSumNds : TXSDecimal;
    FrqOrderItemRefSumGen : TXSDecimal;
    FrqOrderItemRefCommentGen : WideString;
    FrqOrderItemRefDeliveryTime : Integer;
    FrqOrderItemRefContractNumber : WideString;
    FrqOrderItemRefContractDate : TXSDate;
    FrqOrderItemRefFinDocCode : WideString;
    FrqOrderItemRefFinDocID : Integer;
    FrqOrderItemRefPlannedDatePays : TXSDate;
    FrqOrderItemRefPlannedDateDelivery : TXSDate;
    FrqOrderItemRefStatusReason : WideString;
    FrqOrderItemRefPaymentValue : Integer;
    FrqOrderItemRefUserGen : WideString;
    FrqBillItemRefCode : Integer;
    FrqBillItemRefCountGen : TXSDecimal;
    FrqBillItemRefMaterialNameTxt : WideString;
    FrqBillItemRefMeasurementNameTxt : WideString;
    FrqBillItemRefCountFact : TXSDecimal;
    FrqBillItemRefPriceWithoutNds : TXSDecimal;
    FrqBillItemRefNds : TXSDecimal;
    FrqBillItemRefSumWithoutNds : TXSDecimal;
    FrqBillItemRefSumNds : TXSDecimal;
    FrqBillItemRefSumGen : TXSDecimal;
    FrqBillItemRefCommentGen : WideString;
    FrqBillItemRefUserGen : WideString;
    FfkOrderItemRefCode : Integer;
    FfkOrderItemRefFinCode : Integer;
    FfkOrderItemRefNomenclatureCode : Integer;
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer;
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefContractNumber : WideString;
    FfkOrderItemRefContractDate : TXSDate;
    FfkOrderItemRefFinDocCode : WideString;
    FfkOrderItemRefFinDocID : Integer;
    FfkOrderItemRefMaterialNameTxt : WideString;
    FfkOrderItemRefMeasurementNameTxt : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefPriceWithNds : TXSDecimal;
    FfkOrderItemRefPriceNds : TXSDecimal;
    FfkOrderItemRefSumWithoutNds : TXSDecimal;
    FfkOrderItemRefSumNds : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
    FfkOrderItemRefCommentGen : WideString;
    FfkOrderItemRefNext_mat_name : WideString;
    FfkOrderItemRefMeasurementTwoUnits : WideString;
    FfkOrderItemRefCountTwoUnits : TXSDecimal;
    FfkOrderItemRefPriceTwoUnits : TXSDecimal;
    FfkOrderItemRefWeight : TXSDecimal;
    FfkOrderItemRefSellingPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefSellingCostWithoutNds : TXSDecimal;
    FfkOrderItemRefDateRealiz : TXSDate;
    FfkOrderItemRefFundingType : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;

    property historyTypeRefCode : Integer read FhistoryTypeRefCode write FhistoryTypeRefCode;
    property historyTypeRefName : WideString read FhistoryTypeRefName write FhistoryTypeRefName;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime;
    property estimateItemRefUseWorkTime : Integer read FestimateItemRefUseWorkTime write FestimateItemRefUseWorkTime;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
    property rqOrderItemRefCode : Integer read FrqOrderItemRefCode write FrqOrderItemRefCode;
    property rqOrderItemRefCountGen : TXSDecimal read FrqOrderItemRefCountGen write FrqOrderItemRefCountGen;
    property rqOrderItemRefMaterialNameTxt : WideString read FrqOrderItemRefMaterialNameTxt write FrqOrderItemRefMaterialNameTxt;
    property rqOrderItemRefMeasurementNameTxt : WideString read FrqOrderItemRefMeasurementNameTxt write FrqOrderItemRefMeasurementNameTxt;
    property rqOrderItemRefMaterialNameGen : WideString read FrqOrderItemRefMaterialNameGen write FrqOrderItemRefMaterialNameGen;
    property rqOrderItemRefMeasurementNameGen : WideString read FrqOrderItemRefMeasurementNameGen write FrqOrderItemRefMeasurementNameGen;
    property rqOrderItemRefMaterialNameGenRQ : WideString read FrqOrderItemRefMaterialNameGenRQ write FrqOrderItemRefMaterialNameGenRQ;
    property rqOrderItemRefMeasurementNameGenRQ : WideString read FrqOrderItemRefMeasurementNameGenRQ write FrqOrderItemRefMeasurementNameGenRQ;
    property rqOrderItemRefCountFact : TXSDecimal read FrqOrderItemRefCountFact write FrqOrderItemRefCountFact;
    property rqOrderItemRefPriceWithoutNds : TXSDecimal read FrqOrderItemRefPriceWithoutNds write FrqOrderItemRefPriceWithoutNds;
    property rqOrderItemRefNds : TXSDecimal read FrqOrderItemRefNds write FrqOrderItemRefNds;
    property rqOrderItemRefPriceWithNds : TXSDecimal read FrqOrderItemRefPriceWithNds write FrqOrderItemRefPriceWithNds;
    property rqOrderItemRefSumWithoutNds : TXSDecimal read FrqOrderItemRefSumWithoutNds write FrqOrderItemRefSumWithoutNds;
    property rqOrderItemRefSumNds : TXSDecimal read FrqOrderItemRefSumNds write FrqOrderItemRefSumNds;
    property rqOrderItemRefSumGen : TXSDecimal read FrqOrderItemRefSumGen write FrqOrderItemRefSumGen;
    property rqOrderItemRefCommentGen : WideString read FrqOrderItemRefCommentGen write FrqOrderItemRefCommentGen;
    property rqOrderItemRefDeliveryTime : Integer read FrqOrderItemRefDeliveryTime write FrqOrderItemRefDeliveryTime;
    property rqOrderItemRefContractNumber : WideString read FrqOrderItemRefContractNumber write FrqOrderItemRefContractNumber;
    property rqOrderItemRefContractDate : TXSDate read FrqOrderItemRefContractDate write FrqOrderItemRefContractDate;
    property rqOrderItemRefFinDocCode : WideString read FrqOrderItemRefFinDocCode write FrqOrderItemRefFinDocCode;
    property rqOrderItemRefFinDocID : Integer read FrqOrderItemRefFinDocID write FrqOrderItemRefFinDocID;
    property rqOrderItemRefPlannedDatePays : TXSDate read FrqOrderItemRefPlannedDatePays write FrqOrderItemRefPlannedDatePays;
    property rqOrderItemRefPlannedDateDelivery : TXSDate read FrqOrderItemRefPlannedDateDelivery write FrqOrderItemRefPlannedDateDelivery;
    property rqOrderItemRefStatusReason : WideString read FrqOrderItemRefStatusReason write FrqOrderItemRefStatusReason;
    property rqOrderItemRefPaymentValue : Integer read FrqOrderItemRefPaymentValue write FrqOrderItemRefPaymentValue;
    property rqOrderItemRefUserGen : WideString read FrqOrderItemRefUserGen write FrqOrderItemRefUserGen;
    property rqBillItemRefCode : Integer read FrqBillItemRefCode write FrqBillItemRefCode;
    property rqBillItemRefCountGen : TXSDecimal read FrqBillItemRefCountGen write FrqBillItemRefCountGen;
    property rqBillItemRefMaterialNameTxt : WideString read FrqBillItemRefMaterialNameTxt write FrqBillItemRefMaterialNameTxt;
    property rqBillItemRefMeasurementNameTxt : WideString read FrqBillItemRefMeasurementNameTxt write FrqBillItemRefMeasurementNameTxt;
    property rqBillItemRefCountFact : TXSDecimal read FrqBillItemRefCountFact write FrqBillItemRefCountFact;
    property rqBillItemRefPriceWithoutNds : TXSDecimal read FrqBillItemRefPriceWithoutNds write FrqBillItemRefPriceWithoutNds;
    property rqBillItemRefNds : TXSDecimal read FrqBillItemRefNds write FrqBillItemRefNds;
    property rqBillItemRefSumWithoutNds : TXSDecimal read FrqBillItemRefSumWithoutNds write FrqBillItemRefSumWithoutNds;
    property rqBillItemRefSumNds : TXSDecimal read FrqBillItemRefSumNds write FrqBillItemRefSumNds;
    property rqBillItemRefSumGen : TXSDecimal read FrqBillItemRefSumGen write FrqBillItemRefSumGen;
    property rqBillItemRefCommentGen : WideString read FrqBillItemRefCommentGen write FrqBillItemRefCommentGen;
    property rqBillItemRefUserGen : WideString read FrqBillItemRefUserGen write FrqBillItemRefUserGen;
    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode;
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode;
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode;
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum;
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch;
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName;
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode;
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName;
    property fkOrderItemRefContractNumber : WideString read FfkOrderItemRefContractNumber write FfkOrderItemRefContractNumber;
    property fkOrderItemRefContractDate : TXSDate read FfkOrderItemRefContractDate write FfkOrderItemRefContractDate;
    property fkOrderItemRefFinDocCode : WideString read FfkOrderItemRefFinDocCode write FfkOrderItemRefFinDocCode;
    property fkOrderItemRefFinDocID : Integer read FfkOrderItemRefFinDocID write FfkOrderItemRefFinDocID;
    property fkOrderItemRefMaterialNameTxt : WideString read FfkOrderItemRefMaterialNameTxt write FfkOrderItemRefMaterialNameTxt;
    property fkOrderItemRefMeasurementNameTxt : WideString read FfkOrderItemRefMeasurementNameTxt write FfkOrderItemRefMeasurementNameTxt;
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen;
    property fkOrderItemRefPriceWithoutNds : TXSDecimal read FfkOrderItemRefPriceWithoutNds write FfkOrderItemRefPriceWithoutNds;
    property fkOrderItemRefPriceWithNds : TXSDecimal read FfkOrderItemRefPriceWithNds write FfkOrderItemRefPriceWithNds;
    property fkOrderItemRefPriceNds : TXSDecimal read FfkOrderItemRefPriceNds write FfkOrderItemRefPriceNds;
    property fkOrderItemRefSumWithoutNds : TXSDecimal read FfkOrderItemRefSumWithoutNds write FfkOrderItemRefSumWithoutNds;
    property fkOrderItemRefSumNds : TXSDecimal read FfkOrderItemRefSumNds write FfkOrderItemRefSumNds;
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen;
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen;
    property fkOrderItemRefCommentGen : WideString read FfkOrderItemRefCommentGen write FfkOrderItemRefCommentGen;
    property fkOrderItemRefNext_mat_name : WideString read FfkOrderItemRefNext_mat_name write FfkOrderItemRefNext_mat_name;
    property fkOrderItemRefMeasurementTwoUnits : WideString read FfkOrderItemRefMeasurementTwoUnits write FfkOrderItemRefMeasurementTwoUnits;
    property fkOrderItemRefCountTwoUnits : TXSDecimal read FfkOrderItemRefCountTwoUnits write FfkOrderItemRefCountTwoUnits;
    property fkOrderItemRefPriceTwoUnits : TXSDecimal read FfkOrderItemRefPriceTwoUnits write FfkOrderItemRefPriceTwoUnits;
    property fkOrderItemRefWeight : TXSDecimal read FfkOrderItemRefWeight write FfkOrderItemRefWeight;
    property fkOrderItemRefSellingPriceWithoutNds : TXSDecimal read FfkOrderItemRefSellingPriceWithoutNds write FfkOrderItemRefSellingPriceWithoutNds;
    property fkOrderItemRefSellingCostWithoutNds : TXSDecimal read FfkOrderItemRefSellingCostWithoutNds write FfkOrderItemRefSellingCostWithoutNds;
    property fkOrderItemRefDateRealiz : TXSDate read FfkOrderItemRefDateRealiz write FfkOrderItemRefDateRealiz;
    property fkOrderItemRefFundingType : Integer read FfkOrderItemRefFundingType write FfkOrderItemRefFundingType;
  end;

  ArrayOfENEstimateHistoryShort = array of ENEstimateHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateHistoryController/message/
  // soapAction: http://ksoe.org/ENEstimateHistoryController/action/ENEstimateHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateHistoryControllerSoapPort = interface(IInvokable)
  ['{5DEE2121-FEE8-41EF-8FBE-53C4376AD4AB}']
    function add(const aENEstimateHistory: ENEstimateHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateHistory: ENEstimateHistory); stdcall;
    function getObject(const anObjectCode: Integer): ENEstimateHistory; stdcall;
    function getList: ENEstimateHistoryShortList; stdcall;
    function getFilteredList(const aENEstimateHistoryFilter: ENEstimateHistoryFilter): ENEstimateHistoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryShortList; stdcall;
    function getScrollableFilteredList(const aENEstimateHistoryFilter: ENEstimateHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENEstimateHistoryFilter: ENEstimateHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENEstimateHistoryShort; stdcall;
  end;


implementation

  destructor ENEstimateHistory.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FhistoryTypeRef) then
      historyTypeRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    if Assigned(FrqBillItemRef) then
      rqBillItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENEstimateHistoryFilter.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FhistoryTypeRef) then
      historyTypeRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    if Assigned(FrqBillItemRef) then
      rqBillItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENEstimateHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENEstimateHistoryShort.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
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
    if Assigned(FrqOrderItemRefCountGen) then
      rqOrderItemRefCountGen.Free;
    if Assigned(FrqOrderItemRefCountFact) then
      rqOrderItemRefCountFact.Free;
    if Assigned(FrqOrderItemRefPriceWithoutNds) then
      rqOrderItemRefPriceWithoutNds.Free;
    if Assigned(FrqOrderItemRefNds) then
      rqOrderItemRefNds.Free;
    if Assigned(FrqOrderItemRefPriceWithNds) then
      rqOrderItemRefPriceWithNds.Free;
    if Assigned(FrqOrderItemRefSumWithoutNds) then
      rqOrderItemRefSumWithoutNds.Free;
    if Assigned(FrqOrderItemRefSumNds) then
      rqOrderItemRefSumNds.Free;
    if Assigned(FrqOrderItemRefSumGen) then
      rqOrderItemRefSumGen.Free;
    if Assigned(FrqOrderItemRefContractDate) then
      rqOrderItemRefContractDate.Free;
    if Assigned(FrqOrderItemRefPlannedDatePays) then
      rqOrderItemRefPlannedDatePays.Free;
    if Assigned(FrqOrderItemRefPlannedDateDelivery) then
      rqOrderItemRefPlannedDateDelivery.Free;
    if Assigned(FrqBillItemRefCountGen) then
      rqBillItemRefCountGen.Free;
    if Assigned(FrqBillItemRefCountFact) then
      rqBillItemRefCountFact.Free;
    if Assigned(FrqBillItemRefPriceWithoutNds) then
      rqBillItemRefPriceWithoutNds.Free;
    if Assigned(FrqBillItemRefNds) then
      rqBillItemRefNds.Free;
    if Assigned(FrqBillItemRefSumWithoutNds) then
      rqBillItemRefSumWithoutNds.Free;
    if Assigned(FrqBillItemRefSumNds) then
      rqBillItemRefSumNds.Free;
    if Assigned(FrqBillItemRefSumGen) then
      rqBillItemRefSumGen.Free;
    if Assigned(FfkOrderItemRefContractDate) then
      fkOrderItemRefContractDate.Free;
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPriceWithoutNds) then
      fkOrderItemRefPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefPriceWithNds) then
      fkOrderItemRefPriceWithNds.Free;
    if Assigned(FfkOrderItemRefPriceNds) then
      fkOrderItemRefPriceNds.Free;
    if Assigned(FfkOrderItemRefSumWithoutNds) then
      fkOrderItemRefSumWithoutNds.Free;
    if Assigned(FfkOrderItemRefSumNds) then
      fkOrderItemRefSumNds.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    if Assigned(FfkOrderItemRefCountTwoUnits) then
      fkOrderItemRefCountTwoUnits.Free;
    if Assigned(FfkOrderItemRefPriceTwoUnits) then
      fkOrderItemRefPriceTwoUnits.Free;
    if Assigned(FfkOrderItemRefWeight) then
      fkOrderItemRefWeight.Free;
    if Assigned(FfkOrderItemRefSellingPriceWithoutNds) then
      fkOrderItemRefSellingPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefSellingCostWithoutNds) then
      fkOrderItemRefSellingCostWithoutNds.Free;
    if Assigned(FfkOrderItemRefDateRealiz) then
      fkOrderItemRefDateRealiz.Free;
    inherited Destroy;
  end;

  destructor ENEstimateHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistory');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryRef');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryShort');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateHistoryControllerSoapPort), 'http://ksoe.org/ENEstimateHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateHistoryControllerSoapPort), 'http://ksoe.org/ENEstimateHistoryController/action/ENEstimateHistoryController.%operationName%');


end.
