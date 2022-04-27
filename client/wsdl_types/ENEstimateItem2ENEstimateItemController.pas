unit ENEstimateItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   //,ENEstimateItemController 
   ,ENEstimateItem2TypeController
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

  ENEstimateItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItemInRef : ENEstimateItemRef;
//???
    FestimateItemOutRef : ENEstimateItemRef;
//???
    FtypeRef : ENEstimateItem2TypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemInRef : ENEstimateItemRef read FestimateItemInRef write FestimateItemInRef; 
    property estimateItemOutRef : ENEstimateItemRef read FestimateItemOutRef write FestimateItemOutRef; 
    property typeRef : ENEstimateItem2TypeRef read FtypeRef write FtypeRef; 
  end;
  
{
  ENEstimateItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItemInRef : ENEstimateItemRef;
//???
    FestimateItemOutRef : ENEstimateItemRef;
//???
    FtypeRef : ENEstimateItem2TypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemInRef : ENEstimateItemRef read FestimateItemInRef write FestimateItemInRef; 
    property estimateItemOutRef : ENEstimateItemRef read FestimateItemOutRef write FestimateItemOutRef; 
    property typeRef : ENEstimateItem2TypeRef read FtypeRef write FtypeRef; 
  end;
}

  ENEstimateItem2ENEstimateItemFilter = class(ENEstimateItem2ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENEstimateItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FestimateItemInRefCode : Integer; 
    FestimateItemInRefCountGen : TXSDecimal;
    FestimateItemInRefCountFact : TXSDecimal;
    FestimateItemInRefPrice : TXSDecimal;
    FestimateItemInRefCost : TXSDecimal;
    FestimateItemInRefDeliveryTime : Integer; 
    FestimateItemInRefUserGen : WideString;
    FestimateItemInRefDateEdit : TXSDate;
    FestimateItemOutRefCode : Integer; 
    FestimateItemOutRefCountGen : TXSDecimal;
    FestimateItemOutRefCountFact : TXSDecimal;
    FestimateItemOutRefPrice : TXSDecimal;
    FestimateItemOutRefCost : TXSDecimal;
    FestimateItemOutRefDeliveryTime : Integer; 
    FestimateItemOutRefUserGen : WideString;
    FestimateItemOutRefDateEdit : TXSDate;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 

    property estimateItemInRefCode : Integer read FestimateItemInRefCode write FestimateItemInRefCode; 
    property estimateItemInRefCountGen : TXSDecimal read FestimateItemInRefCountGen write FestimateItemInRefCountGen; 
    property estimateItemInRefCountFact : TXSDecimal read FestimateItemInRefCountFact write FestimateItemInRefCountFact; 
    property estimateItemInRefPrice : TXSDecimal read FestimateItemInRefPrice write FestimateItemInRefPrice; 
    property estimateItemInRefCost : TXSDecimal read FestimateItemInRefCost write FestimateItemInRefCost; 
    property estimateItemInRefDeliveryTime : Integer read FestimateItemInRefDeliveryTime write FestimateItemInRefDeliveryTime; 
    property estimateItemInRefUserGen : WideString read FestimateItemInRefUserGen write FestimateItemInRefUserGen; 
    property estimateItemInRefDateEdit : TXSDate read FestimateItemInRefDateEdit write FestimateItemInRefDateEdit; 
    property estimateItemOutRefCode : Integer read FestimateItemOutRefCode write FestimateItemOutRefCode; 
    property estimateItemOutRefCountGen : TXSDecimal read FestimateItemOutRefCountGen write FestimateItemOutRefCountGen; 
    property estimateItemOutRefCountFact : TXSDecimal read FestimateItemOutRefCountFact write FestimateItemOutRefCountFact; 
    property estimateItemOutRefPrice : TXSDecimal read FestimateItemOutRefPrice write FestimateItemOutRefPrice; 
    property estimateItemOutRefCost : TXSDecimal read FestimateItemOutRefCost write FestimateItemOutRefCost; 
    property estimateItemOutRefDeliveryTime : Integer read FestimateItemOutRefDeliveryTime write FestimateItemOutRefDeliveryTime; 
    property estimateItemOutRefUserGen : WideString read FestimateItemOutRefUserGen write FestimateItemOutRefUserGen; 
    property estimateItemOutRefDateEdit : TXSDate read FestimateItemOutRefDateEdit write FestimateItemOutRefDateEdit; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfENEstimateItem2ENEstimateItemShort = array of ENEstimateItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItem2ENEstimateItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/ENEstimateItem2ENEstimateItemController/action/ENEstimateItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{dbd7dbd7-dbd7-dbd7-dbd7-dbd7dbd7dbd7}']
    function  add(const aENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItem): Integer; stdcall; overload;
    function  add(const aENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItem; const finCode : Integer; const finCount : TXSDecimal): Integer; stdcall;overload;

    function  addMoveSCCounter(const aENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItem): Integer; stdcall; overload;
    procedure removeMoveSCCounter(const anObjectCode: Integer); stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItem2ENEstimateItem: ENEstimateItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItem2ENEstimateItem; stdcall;
    function  getList: ENEstimateItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aENEstimateItem2ENEstimateItemFilter: ENEstimateItem2ENEstimateItemFilter): ENEstimateItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItem2ENEstimateItemFilter: ENEstimateItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ENEstimateItemShortList; stdcall;
    procedure getChangeBudegt(); stdcall;
  end; 


implementation

  destructor ENEstimateItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItemInRef) then
      estimateItemInRef.Free;
    if Assigned(FestimateItemOutRef) then
      estimateItemOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENEstimateItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItemInRef) then
      estimateItemInRef.Free;
    if Assigned(FestimateItemOutRef) then
      estimateItemOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENEstimateItem2ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENEstimateItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FestimateItemInRefCountGen) then
      estimateItemInRefCountGen.Free;
    if Assigned(FestimateItemInRefCountFact) then
      estimateItemInRefCountFact.Free;
    if Assigned(FestimateItemInRefPrice) then
      estimateItemInRefPrice.Free;
    if Assigned(FestimateItemInRefCost) then
      estimateItemInRefCost.Free;
    if Assigned(FestimateItemInRefDateEdit) then
      estimateItemInRefDateEdit.Free;
    if Assigned(FestimateItemOutRefCountGen) then
      estimateItemOutRefCountGen.Free;
    if Assigned(FestimateItemOutRefCountFact) then
      estimateItemOutRefCountFact.Free;
    if Assigned(FestimateItemOutRefPrice) then
      estimateItemOutRefPrice.Free;
    if Assigned(FestimateItemOutRefCost) then
      estimateItemOutRefCost.Free;
    if Assigned(FestimateItemOutRefDateEdit) then
      estimateItemOutRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENEstimateItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/ENEstimateItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/ENEstimateItem2ENEstimateItemController/action/ENEstimateItem2ENEstimateItemController.%operationName%');


end.
