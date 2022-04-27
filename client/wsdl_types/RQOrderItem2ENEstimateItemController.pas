unit RQOrderItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,RQOrderItemController 
   ,RQOrderItem2ENEstimateItemStatusController 
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

  RQOrderItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    ForderItem : RQOrderItem;
//???
    FstatusRef : RQOrderItem2ENEstimateItemStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property orderItem : RQOrderItem read ForderItem write ForderItem; 
    property statusRef : RQOrderItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;
  
{
  RQOrderItem2ENEstimateItemFilter = class(TRemotable)
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
    ForderItem : RQOrderItem;
//???
    FstatusRef : RQOrderItem2ENEstimateItemStatusRef;
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
    property orderItem : RQOrderItem read ForderItem write ForderItem; 
    property statusRef : RQOrderItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;
}

  RQOrderItem2ENEstimateItemFilter = class(RQOrderItem2ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQOrderItem2ENEstimateItemShort = class(TRemotable)
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
    ForderItemCode : Integer; 
    ForderItemCountGen : TXSDecimal;
    ForderItemMaterialNameTxt : WideString;
    ForderItemMeasurementNameTxt : WideString;
    ForderItemCountFact : TXSDecimal;
    ForderItemPriceWithoutNds : TXSDecimal;
    ForderItemNds : TXSDecimal;
    ForderItemPriceWithNds : TXSDecimal;
    ForderItemSumWithoutNds : TXSDecimal;
    ForderItemSumNds : TXSDecimal;
    ForderItemSumGen : TXSDecimal;
    ForderItemCommentGen : WideString;
    ForderItemDeliveryTime : Integer; 
    ForderItemContractNumber : WideString;
    ForderItemContractDate : TXSDate;
    ForderItemFinDocCode : WideString;
    ForderItemFinDocID : Integer; 
    ForderItemPlannedDatePays : TXSDate;
    ForderItemPlannedDateDelivery : TXSDate;
    ForderItemUserGen : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;

    FtypeRefCode : Integer;
    FtypeRefName : WideString;

    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;

    FplanRefDepartmentCode : Integer;
    FplanRefDepartmentName : WideString;
        
    FmeasureType: WideString;
    FkartaRefCode :Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;

    FinvNumber : WideString;
    FelementName : WideString;
    Fecode : Integer;
    FplanType : WideString;
    FplanState : WideString;

    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;

    FmeasurementRefCode : Integer;
    FmeasurementRefName : WideString;
        
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
    property orderItemCode : Integer read ForderItemCode write ForderItemCode; 
    property orderItemCountGen : TXSDecimal read ForderItemCountGen write ForderItemCountGen; 
    property orderItemMaterialNameTxt : WideString read ForderItemMaterialNameTxt write ForderItemMaterialNameTxt; 
    property orderItemMeasurementNameTxt : WideString read ForderItemMeasurementNameTxt write ForderItemMeasurementNameTxt; 
    property orderItemCountFact : TXSDecimal read ForderItemCountFact write ForderItemCountFact; 
    property orderItemPriceWithoutNds : TXSDecimal read ForderItemPriceWithoutNds write ForderItemPriceWithoutNds; 
    property orderItemNds : TXSDecimal read ForderItemNds write ForderItemNds; 
    property orderItemPriceWithNds : TXSDecimal read ForderItemPriceWithNds write ForderItemPriceWithNds; 
    property orderItemSumWithoutNds : TXSDecimal read ForderItemSumWithoutNds write ForderItemSumWithoutNds; 
    property orderItemSumNds : TXSDecimal read ForderItemSumNds write ForderItemSumNds; 
    property orderItemSumGen : TXSDecimal read ForderItemSumGen write ForderItemSumGen; 
    property orderItemCommentGen : WideString read ForderItemCommentGen write ForderItemCommentGen; 
    property orderItemDeliveryTime : Integer read ForderItemDeliveryTime write ForderItemDeliveryTime; 
    property orderItemContractNumber : WideString read ForderItemContractNumber write ForderItemContractNumber; 
    property orderItemContractDate : TXSDate read ForderItemContractDate write ForderItemContractDate; 
    property orderItemFinDocCode : WideString read ForderItemFinDocCode write ForderItemFinDocCode; 
    property orderItemFinDocID : Integer read ForderItemFinDocID write ForderItemFinDocID; 
    property orderItemPlannedDatePays : TXSDate read ForderItemPlannedDatePays write ForderItemPlannedDatePays; 
    property orderItemPlannedDateDelivery : TXSDate read ForderItemPlannedDateDelivery write ForderItemPlannedDateDelivery; 
    property orderItemUserGen : WideString read ForderItemUserGen write ForderItemUserGen; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;

    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;

    property planRefDepartmentCode : Integer read FplanRefDepartmentCode write FplanRefDepartmentCode;
    property planRefDepartmentName : WideString read FplanRefDepartmentName write FplanRefDepartmentName;

    property measureType: WideString read FmeasureType write FmeasureType;

    property kartaRefCode :Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property elementName : WideString read FelementName write FelementName;
    property planType : WideString read FplanType write FplanType;
    property planState : WideString read FplanState write FplanState;
    property ecode : Integer read Fecode write Fecode;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;

    property measurementRefCode : Integer read FmeasurementRefCode write FmeasurementRefCode;
    property measurementRefName : WideString read FmeasurementRefName write FmeasurementRefName;
  end;

  ArrayOfRQOrderItem2ENEstimateItemShort = array of RQOrderItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItem2ENEstimateItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQOrderItem2ENEstimateItemController/action/RQOrderItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{c246c246-c246-c246-c246-c246c246c246}']
    function  add(const aRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItem2ENEstimateItem: RQOrderItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItem2ENEstimateItem; stdcall;
    function  getList: RQOrderItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aRQOrderItem2ENEstimateItemFilter: RQOrderItem2ENEstimateItemFilter): RQOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItem2ENEstimateItemFilter: RQOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemShortList; stdcall;

    function  getEstimateGroupedList(const aRQOrderItem2ENEstimateItemFilter: RQOrderItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2ENEstimateItemShortList; stdcall;

  end; 


implementation

  destructor RQOrderItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(ForderItem) then
      orderItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQOrderItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(ForderItem) then
      orderItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQOrderItem2ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQOrderItem2ENEstimateItemShort.Destroy;
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
    if Assigned(ForderItemCountGen) then
      orderItemCountGen.Free;
    if Assigned(ForderItemCountFact) then
      orderItemCountFact.Free;
    if Assigned(ForderItemPriceWithoutNds) then
      orderItemPriceWithoutNds.Free;
    if Assigned(ForderItemNds) then
      orderItemNds.Free;
    if Assigned(ForderItemPriceWithNds) then
      orderItemPriceWithNds.Free;
    if Assigned(ForderItemSumWithoutNds) then
      orderItemSumWithoutNds.Free;
    if Assigned(ForderItemSumNds) then
      orderItemSumNds.Free;
    if Assigned(ForderItemSumGen) then
      orderItemSumGen.Free;
    if Assigned(ForderItemContractDate) then
      orderItemContractDate.Free;
    if Assigned(ForderItemPlannedDatePays) then
      orderItemPlannedDatePays.Free;
    if Assigned(ForderItemPlannedDateDelivery) then
      orderItemPlannedDateDelivery.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQOrderItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQOrderItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQOrderItem2ENEstimateItemController/action/RQOrderItem2ENEstimateItemController.%operationName%');


end.
