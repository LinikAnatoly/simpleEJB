unit RQBillItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,RQBillItemController 
   ,RQBillItem2ENEstimateItemStatusController 
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

  RQBillItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FbillItem : RQBillItem;
//???
    FstatusRef : RQBillItem2ENEstimateItemStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property billItem : RQBillItem read FbillItem write FbillItem; 
    property statusRef : RQBillItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;

  RQBillItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItem : ENEstimateItem;
//???
    FbillItem : RQBillItem;
//???
    FstatusRef : RQBillItem2ENEstimateItemStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem; 
    property billItem : RQBillItem read FbillItem write FbillItem; 
    property statusRef : RQBillItem2ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
  end;


  RQBillItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FestimateItemCode : Integer; 
    FestimateItemCountGen : TXSDecimal;
    FestimateItemCountFact : TXSDecimal;
    FestimateItemPrice : TXSDecimal;
    FestimateItemCost : TXSDecimal;
    FestimateItemUserGen : WideString;
    FestimateItemDateEdit : TXSDate;
    FbillItemCode : Integer; 
    FbillItemCountGen : TXSDecimal;
    FbillItemMaterialNameTxt : WideString;
    FbillItemMeasurementNameTxt : WideString;
    FbillItemCountFact : TXSDecimal;
    FbillItemPriceWithoutNds : TXSDecimal;
    FbillItemNds : TXSDecimal;
    FbillItemSumWithoutNds : TXSDecimal;
    FbillItemSumNds : TXSDecimal;
    FbillItemSumGen : TXSDecimal;
    FbillItemCommentGen : WideString;
    FbillItemUserGen : WideString;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;

    FbillRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode; 
    property estimateItemCountGen : TXSDecimal read FestimateItemCountGen write FestimateItemCountGen; 
    property estimateItemCountFact : TXSDecimal read FestimateItemCountFact write FestimateItemCountFact; 
    property estimateItemPrice : TXSDecimal read FestimateItemPrice write FestimateItemPrice; 
    property estimateItemCost : TXSDecimal read FestimateItemCost write FestimateItemCost; 
    property estimateItemUserGen : WideString read FestimateItemUserGen write FestimateItemUserGen; 
    property estimateItemDateEdit : TXSDate read FestimateItemDateEdit write FestimateItemDateEdit; 
    property billItemCode : Integer read FbillItemCode write FbillItemCode; 
    property billItemCountGen : TXSDecimal read FbillItemCountGen write FbillItemCountGen; 
    property billItemMaterialNameTxt : WideString read FbillItemMaterialNameTxt write FbillItemMaterialNameTxt; 
    property billItemMeasurementNameTxt : WideString read FbillItemMeasurementNameTxt write FbillItemMeasurementNameTxt; 
    property billItemCountFact : TXSDecimal read FbillItemCountFact write FbillItemCountFact; 
    property billItemPriceWithoutNds : TXSDecimal read FbillItemPriceWithoutNds write FbillItemPriceWithoutNds; 
    property billItemNds : TXSDecimal read FbillItemNds write FbillItemNds; 
    property billItemSumWithoutNds : TXSDecimal read FbillItemSumWithoutNds write FbillItemSumWithoutNds; 
    property billItemSumNds : TXSDecimal read FbillItemSumNds write FbillItemSumNds; 
    property billItemSumGen : TXSDecimal read FbillItemSumGen write FbillItemSumGen; 
    property billItemCommentGen : WideString read FbillItemCommentGen write FbillItemCommentGen; 
    property billItemUserGen : WideString read FbillItemUserGen write FbillItemUserGen; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;

    property billRefCode : Integer read FbillRefCode write FbillRefCode;
  end;

  ArrayOfRQBillItem2ENEstimateItemShort = array of RQBillItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillItem2ENEstimateItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQBillItem2ENEstimateItemController/action/RQBillItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{19bc19bc-19bc-19bc-19bc-19bc19bc19bc}']
    function  add(const aRQBillItem2ENEstimateItem: RQBillItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillItem2ENEstimateItem: RQBillItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillItem2ENEstimateItem; stdcall;
    function  getList: RQBillItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aRQBillItem2ENEstimateItemFilter: RQBillItem2ENEstimateItemFilter): RQBillItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillItem2ENEstimateItemFilter: RQBillItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2ENEstimateItemShortList; stdcall;
  end; 


implementation

  destructor RQBillItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FbillItem) then
      billItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
  
  destructor RQBillItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(FbillItem) then
      billItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQBillItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
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
    if Assigned(FbillItemCountGen) then
      billItemCountGen.Free;
    if Assigned(FbillItemCountFact) then
      billItemCountFact.Free;
    if Assigned(FbillItemPriceWithoutNds) then
      billItemPriceWithoutNds.Free;
    if Assigned(FbillItemNds) then
      billItemNds.Free;
    if Assigned(FbillItemSumWithoutNds) then
      billItemSumWithoutNds.Free;
    if Assigned(FbillItemSumNds) then
      billItemSumNds.Free;
    if Assigned(FbillItemSumGen) then
      billItemSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQBillItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQBillItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQBillItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQBillItem2ENEstimateItemController/action/RQBillItem2ENEstimateItemController.%operationName%');


end.
