unit ENEstimateItemPlanPayController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrderItemTypePayController
   ,ENEstimateItemController
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

  ENEstimateItemPlanPay            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemPlanPayRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemPlanPay = class(TRemotable)
  private
    Fcode : Integer;
    FpercentPay : TXSDecimal;
    FdatePay : TXSDate;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FtypePayRef : RQOrderItemTypePayRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property percentPay : TXSDecimal read FpercentPay write FpercentPay;
    property datePay : TXSDate read FdatePay write FdatePay;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;

{
  ENEstimateItemPlanPayFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpercentPay : TXSDecimal;
    FdatePay : TXSDate;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FtypePayRef : RQOrderItemTypePayRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property percentPay : TXSDecimal read FpercentPay write FpercentPay;
    property datePay : TXSDate read FdatePay write FdatePay;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;
}

  ENEstimateItemPlanPayFilter = class(ENEstimateItemPlanPay)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateItemPlanPayShort = class(TRemotable)
  private
    Fcode : Integer;
    FpercentPay : TXSDecimal;
    FdatePay : TXSDate;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtypePayRefCode : Integer;
    FtypePayRefName : WideString;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefIsUseVAT : Integer;
    FestimateItemRefDeliveryTime : Integer;
    FestimateItemRefUseWorkTime : Integer;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property percentPay : TXSDecimal read FpercentPay write FpercentPay;
    property datePay : TXSDate read FdatePay write FdatePay;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property typePayRefCode : Integer read FtypePayRefCode write FtypePayRefCode;
    property typePayRefName : WideString read FtypePayRefName write FtypePayRefName;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefIsUseVAT : Integer read FestimateItemRefIsUseVAT write FestimateItemRefIsUseVAT;
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime;
    property estimateItemRefUseWorkTime : Integer read FestimateItemRefUseWorkTime write FestimateItemRefUseWorkTime;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
  end;

  ArrayOfENEstimateItemPlanPayShort = array of ENEstimateItemPlanPayShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemPlanPayShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemPlanPayShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemPlanPayShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemPlanPayController/message/
  // soapAction: http://ksoe.org/ENEstimateItemPlanPayController/action/ENEstimateItemPlanPayController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemPlanPayControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemPlanPayController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemPlanPayControllerSoapPort = interface(IInvokable)
  ['{40b140b1-40b1-40b1-40b1-40b140b140b1}']
    function add(const aENEstimateItemPlanPay: ENEstimateItemPlanPay): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItemPlanPay: ENEstimateItemPlanPay); stdcall;
    function getObject(const anObjectCode: Integer): ENEstimateItemPlanPay; stdcall;
    function getList: ENEstimateItemPlanPayShortList; stdcall;
    function getFilteredList(const aENEstimateItemPlanPayFilter: ENEstimateItemPlanPayFilter): ENEstimateItemPlanPayShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemPlanPayShortList; stdcall;
    function getScrollableFilteredList(const aENEstimateItemPlanPayFilter: ENEstimateItemPlanPayFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemPlanPayShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemPlanPayShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENEstimateItemPlanPayFilter: ENEstimateItemPlanPayFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENEstimateItemPlanPayShort; stdcall;
  end;


implementation

  destructor ENEstimateItemPlanPay.Destroy;
  begin
    if Assigned(FpercentPay) then
      percentPay.Free;
    if Assigned(FdatePay) then
      datePay.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

{
  destructor ENEstimateItemPlanPayFilter.Destroy;
  begin
    if Assigned(FpercentPay) then
      percentPay.Free;
    if Assigned(FdatePay) then
      datePay.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;
}

  destructor ENEstimateItemPlanPayFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENEstimateItemPlanPayShort.Destroy;
  begin
    if Assigned(FpercentPay) then
      percentPay.Free;
    if Assigned(FdatePay) then
      datePay.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENEstimateItemPlanPayShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItemPlanPay, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemPlanPay');
  RemClassRegistry.RegisterXSClass(ENEstimateItemPlanPayRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemPlanPayRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemPlanPayFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemPlanPayFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemPlanPayShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemPlanPayShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemPlanPayShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemPlanPayShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemPlanPayShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemPlanPayShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemPlanPayControllerSoapPort), 'http://ksoe.org/ENEstimateItemPlanPayController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemPlanPayControllerSoapPort), 'http://ksoe.org/ENEstimateItemPlanPayController/action/ENEstimateItemPlanPayController.%operationName%');


end.
