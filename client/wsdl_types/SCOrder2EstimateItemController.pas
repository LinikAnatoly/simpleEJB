unit SCOrder2EstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCOrderController 
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

  SCOrder2EstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrder2EstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrder2EstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FscOrderRef : SCOrderRef;
//???
    FestimateitemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property scOrderRef : SCOrderRef read FscOrderRef write FscOrderRef; 
    property estimateitemRef : ENEstimateItemRef read FestimateitemRef write FestimateitemRef; 
  end;
  
{
  SCOrder2EstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FscOrderRef : SCOrderRef;
//???
    FestimateitemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property scOrderRef : SCOrderRef read FscOrderRef write FscOrderRef; 
    property estimateitemRef : ENEstimateItemRef read FestimateitemRef write FestimateitemRef; 
  end;
}

  SCOrder2EstimateItemFilter = class(SCOrder2EstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCOrder2EstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FscOrderRefCode : Integer; 
    FscOrderRefMolCode : WideString;
    FscOrderRefPodrCode : WideString;
    FscOrderRefCountGen : Integer; 
    FscOrderRefScCode : Integer; 
    FestimateitemRefCode : Integer; 
    FestimateitemRefCountGen : TXSDecimal;
    FestimateitemRefCountFact : TXSDecimal;
    FestimateitemRefPrice : TXSDecimal;
    FestimateitemRefCost : TXSDecimal;
    FestimateitemRefUserGen : WideString;
    FestimateitemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property scOrderRefCode : Integer read FscOrderRefCode write FscOrderRefCode; 
    property scOrderRefMolCode : WideString read FscOrderRefMolCode write FscOrderRefMolCode; 
    property scOrderRefPodrCode : WideString read FscOrderRefPodrCode write FscOrderRefPodrCode; 
    property scOrderRefCountGen : Integer read FscOrderRefCountGen write FscOrderRefCountGen; 
    property scOrderRefScCode : Integer read FscOrderRefScCode write FscOrderRefScCode; 
    property estimateitemRefCode : Integer read FestimateitemRefCode write FestimateitemRefCode; 
    property estimateitemRefCountGen : TXSDecimal read FestimateitemRefCountGen write FestimateitemRefCountGen; 
    property estimateitemRefCountFact : TXSDecimal read FestimateitemRefCountFact write FestimateitemRefCountFact; 
    property estimateitemRefPrice : TXSDecimal read FestimateitemRefPrice write FestimateitemRefPrice; 
    property estimateitemRefCost : TXSDecimal read FestimateitemRefCost write FestimateitemRefCost; 
    property estimateitemRefUserGen : WideString read FestimateitemRefUserGen write FestimateitemRefUserGen; 
    property estimateitemRefDateEdit : TXSDate read FestimateitemRefDateEdit write FestimateitemRefDateEdit; 
  end;

  ArrayOfSCOrder2EstimateItemShort = array of SCOrder2EstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCOrder2EstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCOrder2EstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCOrder2EstimateItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCOrder2EstimateItemController/message/
  // soapAction: http://ksoe.org/SCOrder2EstimateItemController/action/SCOrder2EstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCOrder2EstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCOrder2EstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCOrder2EstimateItemControllerSoapPort = interface(IInvokable)
  ['{c6a2c6a2-c6a2-c6a2-c6a2-c6a2c6a2c6a2}']
    function  add(const aSCOrder2EstimateItem: SCOrder2EstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCOrder2EstimateItem: SCOrder2EstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): SCOrder2EstimateItem; stdcall;
    function  getList: SCOrder2EstimateItemShortList; stdcall;
    function  getFilteredList(const aSCOrder2EstimateItemFilter: SCOrder2EstimateItemFilter): SCOrder2EstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCOrder2EstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aSCOrder2EstimateItemFilter: SCOrder2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): SCOrder2EstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCOrder2EstimateItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCOrder2EstimateItemFilter: SCOrder2EstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCOrder2EstimateItem.Destroy;
  begin
    if Assigned(FscOrderRef) then
      scOrderRef.Free;
    if Assigned(FestimateitemRef) then
      estimateitemRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCOrder2EstimateItemFilter.Destroy;
  begin
    if Assigned(FscOrderRef) then
      scOrderRef.Free;
    if Assigned(FestimateitemRef) then
      estimateitemRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCOrder2EstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCOrder2EstimateItemShort.Destroy;
  begin
    if Assigned(FestimateitemRefCountGen) then
      estimateitemRefCountGen.Free;
    if Assigned(FestimateitemRefCountFact) then
      estimateitemRefCountFact.Free;
    if Assigned(FestimateitemRefPrice) then
      estimateitemRefPrice.Free;
    if Assigned(FestimateitemRefCost) then
      estimateitemRefCost.Free;
    if Assigned(FestimateitemRefDateEdit) then
      estimateitemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor SCOrder2EstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCOrder2EstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2EstimateItem');
  RemClassRegistry.RegisterXSClass(SCOrder2EstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2EstimateItemRef');
  RemClassRegistry.RegisterXSClass(SCOrder2EstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2EstimateItemFilter');
  RemClassRegistry.RegisterXSClass(SCOrder2EstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2EstimateItemShort');
  RemClassRegistry.RegisterXSClass(SCOrder2EstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrder2EstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCOrder2EstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCOrder2EstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(SCOrder2EstimateItemControllerSoapPort), 'http://ksoe.org/SCOrder2EstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCOrder2EstimateItemControllerSoapPort), 'http://ksoe.org/SCOrder2EstimateItemController/action/SCOrder2EstimateItemController.%operationName%');


end.
