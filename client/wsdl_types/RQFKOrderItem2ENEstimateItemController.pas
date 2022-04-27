unit RQFKOrderItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,RQFKOrderItemController 
   ,FINMaterialsController 
   ,RQFKOrderItem2EstimateItemStatusController 
   ,SCCounterController 
   ,SCSealController
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

  RQFKOrderItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FfinMaterialsRef : FINMaterialsRef;
//???
    FstatusRef : RQFKOrderItem2EstimateItemStatusRef;
//???
    FscCounterRef : SCCounterRef;
    FscSealRef : SCSealRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef;
    property finMaterialsRef : FINMaterialsRef read FfinMaterialsRef write FfinMaterialsRef; 
    property statusRef : RQFKOrderItem2EstimateItemStatusRef read FstatusRef write FstatusRef; 
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef; 
    property scSealRef : SCSealRef read FscSealRef write FscSealRef;
  end;
  
{
  RQFKOrderItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FfinMaterialsRef : FINMaterialsRef;
//???
    FstatusRef : RQFKOrderItem2EstimateItemStatusRef;
//???
    FscCounterRef : SCCounterRef;
    FscSealRef : SCSealRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property finMaterialsRef : FINMaterialsRef read FfinMaterialsRef write FfinMaterialsRef; 
    property statusRef : RQFKOrderItem2EstimateItemStatusRef read FstatusRef write FstatusRef; 
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef; 
    property scSealRef : SCSealRef read FscSealRef write FscSealRef;
  end;
}

  RQFKOrderItem2ENEstimateItemFilter = class(RQFKOrderItem2ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FestimateItemCode : Integer; 
    FestimateItemCountGen : TXSDecimal;
    FestimateItemCountFact : TXSDecimal;
    FestimateItemPrice : TXSDecimal;
    FestimateItemCost : TXSDecimal;
    FestimateItemUserGen : WideString;
    FestimateItemDateEdit : TXSDate;
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
    FfinMaterialsRefCode : Integer; 
    FfinMaterialsRefNn : WideString;
    FfinMaterialsRefMat_name : WideString;
    FfinMaterialsRefMu_name : WideString;
    FfinMaterialsRefDiv_name : WideString;
    FfinMaterialsRefPartner_name : WideString;
    FfinMaterialsRefDoc_date : TXSDate;
    FfinMaterialsRefParty_discription : WideString;
    FfinMaterialsRefRest_purpose_id : Integer; 
    FfinMaterialsRefRest_purpose_name : WideString;
    FfinMaterialsRefRest_purpose_type_id : Integer; 
    FfinMaterialsRefBudget_core_id : Integer; 
    FfinMaterialsRefFrc_code : Integer; 
    FfinMaterialsRefFrc_name : WideString;
    FfinMaterialsRefCalc_price : TXSDecimal;
    FfinMaterialsRefQuantity : TXSDecimal;
    FfinMaterialsRefPrice : TXSDecimal;
    FfinMaterialsRefCost : TXSDecimal;
    FfinMaterialsRefBal_sch : WideString;
    FfinMaterialsRefFullQuantity : TXSDecimal;
    FfinMaterialsRefFullCost : TXSDecimal;
    FfinMaterialsRefUserGen : WideString;
    FfinMaterialsRefDateEdit : TXSDate;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FscCounterRefCode : Integer; 
    FscCounterRefInvNumber : WideString;
    FscCounterRefName : WideString;
    FscCounterRefBuildNumber : WideString;
    FscCounterRefAccount : WideString;
    FscCounterRefDepartmetFKCode : WideString;
    FscCounterRefMolCode : WideString;
    FscCounterRefDateIn : TXSDate;
    FscCounterRefDateBuild : TXSDate;
    FscCounterRefDateCheck : TXSDate;
    FscCounterRefCost : TXSDecimal;
    FscCounterRefScCode : Integer; 
    FscCounterRefCounterType : WideString;
    FscCounterRefInstallOrderNumber : WideString;
    FscCounterRefReading : WideString;
    FscCounterRefDateEdit : TXSDateTime;
 FscSealRefCode : Integer;


    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;
    FinvNumber : WideString;
    FelementName : WideString;
    Fecode : Integer;

    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmeasurementRefCode : Integer;
    FmeasurementRefName : WideString;

    FfkOrderRefCode : Integer;

    FfkOrderRefNumberGen :WideString;
    FfkOrderRefDateGen : TXSDate;

    FfkOrderRefMOLINCode : WideString;
    FfkOrderRefMOLOUTCode : WideString;

    FfkOrderkindName: WideString;


  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 

    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode; 
    property estimateItemCountGen : TXSDecimal read FestimateItemCountGen write FestimateItemCountGen; 
    property estimateItemCountFact : TXSDecimal read FestimateItemCountFact write FestimateItemCountFact; 
    property estimateItemPrice : TXSDecimal read FestimateItemPrice write FestimateItemPrice; 
    property estimateItemCost : TXSDecimal read FestimateItemCost write FestimateItemCost; 
    property estimateItemUserGen : WideString read FestimateItemUserGen write FestimateItemUserGen; 
    property estimateItemDateEdit : TXSDate read FestimateItemDateEdit write FestimateItemDateEdit; 
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
    property finMaterialsRefCode : Integer read FfinMaterialsRefCode write FfinMaterialsRefCode; 
    property finMaterialsRefNn : WideString read FfinMaterialsRefNn write FfinMaterialsRefNn;
    property finMaterialsRefMat_name : WideString read FfinMaterialsRefMat_name write FfinMaterialsRefMat_name; 
    property finMaterialsRefMu_name : WideString read FfinMaterialsRefMu_name write FfinMaterialsRefMu_name; 
    property finMaterialsRefDiv_name : WideString read FfinMaterialsRefDiv_name write FfinMaterialsRefDiv_name; 
    property finMaterialsRefPartner_name : WideString read FfinMaterialsRefPartner_name write FfinMaterialsRefPartner_name; 
    property finMaterialsRefDoc_date : TXSDate read FfinMaterialsRefDoc_date write FfinMaterialsRefDoc_date; 
    property finMaterialsRefParty_discription : WideString read FfinMaterialsRefParty_discription write FfinMaterialsRefParty_discription; 
    property finMaterialsRefRest_purpose_id : Integer read FfinMaterialsRefRest_purpose_id write FfinMaterialsRefRest_purpose_id; 
    property finMaterialsRefRest_purpose_name : WideString read FfinMaterialsRefRest_purpose_name write FfinMaterialsRefRest_purpose_name; 
    property finMaterialsRefRest_purpose_type_id : Integer read FfinMaterialsRefRest_purpose_type_id write FfinMaterialsRefRest_purpose_type_id; 
    property finMaterialsRefBudget_core_id : Integer read FfinMaterialsRefBudget_core_id write FfinMaterialsRefBudget_core_id; 
    property finMaterialsRefFrc_code : Integer read FfinMaterialsRefFrc_code write FfinMaterialsRefFrc_code; 
    property finMaterialsRefFrc_name : WideString read FfinMaterialsRefFrc_name write FfinMaterialsRefFrc_name; 
    property finMaterialsRefCalc_price : TXSDecimal read FfinMaterialsRefCalc_price write FfinMaterialsRefCalc_price; 
    property finMaterialsRefQuantity : TXSDecimal read FfinMaterialsRefQuantity write FfinMaterialsRefQuantity; 
    property finMaterialsRefPrice : TXSDecimal read FfinMaterialsRefPrice write FfinMaterialsRefPrice; 
    property finMaterialsRefCost : TXSDecimal read FfinMaterialsRefCost write FfinMaterialsRefCost; 
    property finMaterialsRefBal_sch : WideString read FfinMaterialsRefBal_sch write FfinMaterialsRefBal_sch; 
    property finMaterialsRefFullQuantity : TXSDecimal read FfinMaterialsRefFullQuantity write FfinMaterialsRefFullQuantity; 
    property finMaterialsRefFullCost : TXSDecimal read FfinMaterialsRefFullCost write FfinMaterialsRefFullCost; 
    property finMaterialsRefUserGen : WideString read FfinMaterialsRefUserGen write FfinMaterialsRefUserGen;
    property finMaterialsRefDateEdit : TXSDate read FfinMaterialsRefDateEdit write FfinMaterialsRefDateEdit; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
    property scCounterRefCode : Integer read FscCounterRefCode write FscCounterRefCode; 
    property scCounterRefInvNumber : WideString read FscCounterRefInvNumber write FscCounterRefInvNumber; 
    property scCounterRefName : WideString read FscCounterRefName write FscCounterRefName; 
    property scCounterRefBuildNumber : WideString read FscCounterRefBuildNumber write FscCounterRefBuildNumber;
    property scCounterRefAccount : WideString read FscCounterRefAccount write FscCounterRefAccount; 
    property scCounterRefDepartmetFKCode : WideString read FscCounterRefDepartmetFKCode write FscCounterRefDepartmetFKCode; 
    property scCounterRefMolCode : WideString read FscCounterRefMolCode write FscCounterRefMolCode; 
    property scCounterRefDateIn : TXSDate read FscCounterRefDateIn write FscCounterRefDateIn; 
    property scCounterRefDateBuild : TXSDate read FscCounterRefDateBuild write FscCounterRefDateBuild; 
    property scCounterRefDateCheck : TXSDate read FscCounterRefDateCheck write FscCounterRefDateCheck; 
    property scCounterRefCost : TXSDecimal read FscCounterRefCost write FscCounterRefCost; 
    property scCounterRefScCode : Integer read FscCounterRefScCode write FscCounterRefScCode; 
    property scCounterRefCounterType : WideString read FscCounterRefCounterType write FscCounterRefCounterType; 
    property scCounterRefInstallOrderNumber : WideString read FscCounterRefInstallOrderNumber write FscCounterRefInstallOrderNumber; 
    property scCounterRefReading : WideString read FscCounterRefReading write FscCounterRefReading; 
    property scCounterRefDateEdit : TXSDateTime read FscCounterRefDateEdit write FscCounterRefDateEdit;
 property scSealRefCode : Integer read FscSealRefCode write FscSealRefCode; //SCSealRef read FscSealRefCode write FscSealRefCode;


    


    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property elementName : WideString read FelementName write FelementName;
    property ecode : Integer read Fecode write Fecode;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;

    property measurementRefCode : Integer read FmeasurementRefCode write FmeasurementRefCode;
    property measurementRefName : WideString read FmeasurementRefName write FmeasurementRefName;
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode;

    property fkOrderRefNumberGen : WideString read FfkOrderRefNumberGen write FfkOrderRefNumberGen;
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen;

    property fkOrderRefMOLINCode : WideString read FfkOrderRefMOLINCode write FfkOrderRefMOLINCode;
    property fkOrderRefMOLOUTCode : WideString read FfkOrderRefMOLOUTCode write FfkOrderRefMOLOUTCode;

    property fkOrderkindName: WideString read   FfkOrderkindName write FfkOrderkindName;
  end;

  ArrayOfRQFKOrderItem2ENEstimateItemShort = array of RQFKOrderItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2ENEstimateItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2ENEstimateItemController/action/RQFKOrderItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{149A5811-3793-413A-9151-2668AA038632}']
    function  add(const aRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2ENEstimateItem; stdcall;
    function  getList: RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2ENEstimateItemFilter: RQFKOrderItem2ENEstimateItemFilter): RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2ENEstimateItemFilter: RQFKOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKOrderItem2ENEstimateItemFilter: RQFKOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
function getShortObject(const anObjectCode: Integer): RQFKOrderItem2ENEstimateItemShort; stdcall;
    function  getEstimateGroupedList(const aRQFKOrderItem2ENEstimateItemFilter: RQFKOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2ENEstimateItemShortList; stdcall;
//    Лист для отображения материалов с планов показывающий сформированные под материалы ордера на перемещение и приход
    function  getEstimateWithMaterialsOrderList( const dateStart : String ; const dateFinal : String  ; const depCode : Integer  ; const planCode : Integer  ): RQFKOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredListOnlyDataTable(const aRQFKOrderItem2ENEstimateItemFilter: RQFKOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2ENEstimateItemShortList; stdcall;
  end;


implementation

  destructor RQFKOrderItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FfinMaterialsRef) then
      finMaterialsRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    if Assigned(FscSealRef) then
      scSealRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrderItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FfinMaterialsRef) then
      finMaterialsRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    if Assigned(FscSealRef) then
      scSealRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderItem2ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
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
    if Assigned(FfinMaterialsRefDoc_date) then
      finMaterialsRefDoc_date.Free;
    if Assigned(FfinMaterialsRefCalc_price) then
      finMaterialsRefCalc_price.Free;
    if Assigned(FfinMaterialsRefQuantity) then
      finMaterialsRefQuantity.Free;
    if Assigned(FfinMaterialsRefPrice) then
      finMaterialsRefPrice.Free;
    if Assigned(FfinMaterialsRefCost) then
      finMaterialsRefCost.Free;
    if Assigned(FfinMaterialsRefFullQuantity) then
      finMaterialsRefFullQuantity.Free;
    if Assigned(FfinMaterialsRefFullCost) then
      finMaterialsRefFullCost.Free;
    if Assigned(FfinMaterialsRefDateEdit) then
      finMaterialsRefDateEdit.Free;
    if Assigned(FscCounterRefDateIn) then
      scCounterRefDateIn.Free;
    if Assigned(FscCounterRefDateBuild) then
      scCounterRefDateBuild.Free;
    if Assigned(FscCounterRefDateCheck) then
      scCounterRefDateCheck.Free;
    if Assigned(FscCounterRefCost) then
      scCounterRefCost.Free;
    if Assigned(FscCounterRefDateEdit) then
      scCounterRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrderItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2ENEstimateItemController/action/RQFKOrderItem2ENEstimateItemController.%operationName%');


end.
