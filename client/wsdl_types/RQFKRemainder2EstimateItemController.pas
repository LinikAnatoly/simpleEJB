unit RQFKRemainder2EstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderItemRemainderController 
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

  RQFKRemainder2EstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKRemainder2EstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKRemainder2EstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FremainderRef : RQFKOrderItemRemainderRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property remainderRef : RQFKOrderItemRemainderRef read FremainderRef write FremainderRef; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
  end;
  
{
  RQFKRemainder2EstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FremainderRef : RQFKOrderItemRemainderRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property remainderRef : RQFKOrderItemRemainderRef read FremainderRef write FremainderRef; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
  end;
}

  RQFKRemainder2EstimateItemFilter = class(RQFKRemainder2EstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKRemainder2EstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FremainderRefCode : Integer; 
    FremainderRefMaterialNameTxt : WideString;
    FremainderRefCountGen : TXSDecimal;
    FremainderRefPriceWithoutNds : TXSDecimal;
    FremainderRefSumWithoutNds : TXSDecimal;
    FestimateItemRefCode : Integer; 
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property remainderRefCode : Integer read FremainderRefCode write FremainderRefCode; 
    property remainderRefMaterialNameTxt : WideString read FremainderRefMaterialNameTxt write FremainderRefMaterialNameTxt; 
    property remainderRefCountGen : TXSDecimal read FremainderRefCountGen write FremainderRefCountGen; 
    property remainderRefPriceWithoutNds : TXSDecimal read FremainderRefPriceWithoutNds write FremainderRefPriceWithoutNds; 
    property remainderRefSumWithoutNds : TXSDecimal read FremainderRefSumWithoutNds write FremainderRefSumWithoutNds; 
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit; 
  end;

  ArrayOfRQFKRemainder2EstimateItemShort = array of RQFKRemainder2EstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKRemainder2EstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKRemainder2EstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKRemainder2EstimateItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKRemainder2EstimateItemController/message/
  // soapAction: http://ksoe.org/RQFKRemainder2EstimateItemController/action/RQFKRemainder2EstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKRemainder2EstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKRemainder2EstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKRemainder2EstimateItemControllerSoapPort = interface(IInvokable)
  ['{ee55ee55-ee55-ee55-ee55-ee55ee55ee55}']
    function  add(const aRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKRemainder2EstimateItem: RQFKRemainder2EstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKRemainder2EstimateItem; stdcall;
    function  getList: RQFKRemainder2EstimateItemShortList; stdcall;
    function  getFilteredList(const aRQFKRemainder2EstimateItemFilter: RQFKRemainder2EstimateItemFilter): RQFKRemainder2EstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2EstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKRemainder2EstimateItemFilter: RQFKRemainder2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2EstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2EstimateItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKRemainder2EstimateItemFilter: RQFKRemainder2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQFKRemainder2EstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FremainderRef) then
      remainderRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKRemainder2EstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FremainderRef) then
      remainderRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKRemainder2EstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKRemainder2EstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FremainderRefCountGen) then
      remainderRefCountGen.Free;
    if Assigned(FremainderRefPriceWithoutNds) then
      remainderRefPriceWithoutNds.Free;
    if Assigned(FremainderRefSumWithoutNds) then
      remainderRefSumWithoutNds.Free;
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
  
  destructor RQFKRemainder2EstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKRemainder2EstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2EstimateItem');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2EstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2EstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2EstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2EstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2EstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2EstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2EstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2EstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKRemainder2EstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKRemainder2EstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKRemainder2EstimateItemControllerSoapPort), 'http://ksoe.org/RQFKRemainder2EstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKRemainder2EstimateItemControllerSoapPort), 'http://ksoe.org/RQFKRemainder2EstimateItemController/action/RQFKRemainder2EstimateItemController.%operationName%');


end.
