unit ENDeliveryTimeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDeliveryKindController 
   ,ENHumenItemController 
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

  ENDeliveryTime            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryTimeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryTime = class(TRemotable)
  private
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FdeliveryKind : ENDeliveryKind;
//???
    FhumenItemRef : ENHumenItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property deliveryKind : ENDeliveryKind read FdeliveryKind write FdeliveryKind; 
    property humenItemRef : ENHumenItemRef read FhumenItemRef write FhumenItemRef; 
  end;

  ENDeliveryTimeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FdeliveryKind : ENDeliveryKind;
//???
    FhumenItemRef : ENHumenItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property deliveryKind : ENDeliveryKind read FdeliveryKind write FdeliveryKind; 
    property humenItemRef : ENHumenItemRef read FhumenItemRef write FhumenItemRef; 
  end;


  ENDeliveryTimeShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FdeliveryKindCode : Integer; 
    FdeliveryKindName : WideString;
    FhumenItemRefCode : Integer; 
    FhumenItemRefCountGen : TXSDecimal;
    FhumenItemRefCountFact : TXSDecimal;
    FhumenItemRefPrice : TXSDecimal;
    FhumenItemRefCost : TXSDecimal;
    FhumenItemRefUserGen : WideString;
    FhumenItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 

    property deliveryKindCode : Integer read FdeliveryKindCode write FdeliveryKindCode; 
    property deliveryKindName : WideString read FdeliveryKindName write FdeliveryKindName; 
    property humenItemRefCode : Integer read FhumenItemRefCode write FhumenItemRefCode; 
    property humenItemRefCountGen : TXSDecimal read FhumenItemRefCountGen write FhumenItemRefCountGen; 
    property humenItemRefCountFact : TXSDecimal read FhumenItemRefCountFact write FhumenItemRefCountFact; 
    property humenItemRefPrice : TXSDecimal read FhumenItemRefPrice write FhumenItemRefPrice; 
    property humenItemRefCost : TXSDecimal read FhumenItemRefCost write FhumenItemRefCost; 
    property humenItemRefUserGen : WideString read FhumenItemRefUserGen write FhumenItemRefUserGen; 
    property humenItemRefDateEdit : TXSDate read FhumenItemRefDateEdit write FhumenItemRefDateEdit; 
  end;

  ArrayOfENDeliveryTimeShort = array of ENDeliveryTimeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDeliveryTimeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDeliveryTimeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDeliveryTimeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDeliveryTimeController/message/
  // soapAction: http://ksoe.org/ENDeliveryTimeController/action/ENDeliveryTimeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDeliveryTimeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDeliveryTimeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDeliveryTimeControllerSoapPort = interface(IInvokable)
  ['{12c512c5-12c5-12c5-12c5-12c512c512c5}']
    function  add(const aENDeliveryTime: ENDeliveryTime): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDeliveryTime: ENDeliveryTime); stdcall;
    function  getObject(const anObjectCode: Integer): ENDeliveryTime; stdcall;
    function  getList: ENDeliveryTimeShortList; stdcall;
    function  getFilteredList(const aENDeliveryTimeFilter: ENDeliveryTimeFilter): ENDeliveryTimeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimeShortList; stdcall;
    function  getScrollableFilteredList(const aENDeliveryTimeFilter: ENDeliveryTimeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimeShortList; stdcall;
  end; 


implementation

  destructor ENDeliveryTime.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FdeliveryKind) then
      deliveryKind.Free;
    if Assigned(FhumenItemRef) then
      humenItemRef.Free;
    inherited Destroy;
  end;
  
  destructor ENDeliveryTimeFilter.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FdeliveryKind) then
      deliveryKind.Free;
    if Assigned(FhumenItemRef) then
      humenItemRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENDeliveryTimeShort.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FhumenItemRefCountGen) then
      humenItemRefCountGen.Free;
    if Assigned(FhumenItemRefCountFact) then
      humenItemRefCountFact.Free;
    if Assigned(FhumenItemRefPrice) then
      humenItemRefPrice.Free;
    if Assigned(FhumenItemRefCost) then
      humenItemRefCost.Free;
    if Assigned(FhumenItemRefDateEdit) then
      humenItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENDeliveryTimeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDeliveryTime, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTime');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimeRef');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimeFilter');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimeShort');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDeliveryTimeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDeliveryTimeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDeliveryTimeControllerSoapPort), 'http://ksoe.org/ENDeliveryTimeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDeliveryTimeControllerSoapPort), 'http://ksoe.org/ENDeliveryTimeController/action/ENDeliveryTimeController.%operationName%');


end.
