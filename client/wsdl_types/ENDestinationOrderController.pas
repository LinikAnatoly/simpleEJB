unit ENDestinationOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENDestinationOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberInOrder : Integer; 
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  numberInOrder : Integer read FnumberInOrder write FnumberInOrder; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
  
{
  ENDestinationOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberInOrder : Integer; 
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  numberInOrder : Integer read FnumberInOrder write FnumberInOrder; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
}

  ENDestinationOrderFilter = class(ENDestinationOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDestinationOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberInOrder : Integer; 
    FelementInRefCode : Integer; 
    FelementOutRefCode : Integer; 
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefYearOriginal : Integer; 
    FplanRefMonthOriginal : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanRefServicesFSideFinId : Integer; 
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotaltimehours : TXSDecimal;
    FplanRefTotaltimedays : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  numberInOrder : Integer read FnumberInOrder write FnumberInOrder; 

    property elementInRefCode : Integer read FelementInRefCode write FelementInRefCode; 
    property elementOutRefCode : Integer read FelementOutRefCode write FelementOutRefCode; 
    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal; 
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId; 
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum; 
    property planRefTotaltimehours : TXSDecimal read FplanRefTotaltimehours write FplanRefTotaltimehours; 
    property planRefTotaltimedays : TXSDecimal read FplanRefTotaltimedays write FplanRefTotaltimedays; 
  end;

  ArrayOfENDestinationOrderShort = array of ENDestinationOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDestinationOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDestinationOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDestinationOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDestinationOrderController/message/
  // soapAction: http://ksoe.org/ENDestinationOrderController/action/ENDestinationOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDestinationOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDestinationOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDestinationOrderControllerSoapPort = interface(IInvokable)
  ['{586c586c-586c-586c-586c-586c586c586c}']
    function  add(const aENDestinationOrder: ENDestinationOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDestinationOrder: ENDestinationOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENDestinationOrder; stdcall;
    function  getList: ENDestinationOrderShortList; stdcall;
    function  getFilteredList(const aENDestinationOrderFilter: ENDestinationOrderFilter): ENDestinationOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDestinationOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENDestinationOrderFilter: ENDestinationOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDestinationOrderFilter: ENDestinationOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENDestinationOrder.Destroy;
  begin
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENDestinationOrderFilter.Destroy;
  begin
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENDestinationOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENDestinationOrderShort.Destroy;
  begin
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FplanRefTotaltimehours) then
      planRefTotaltimehours.Free;
    if Assigned(FplanRefTotaltimedays) then
      planRefTotaltimedays.Free;
    inherited Destroy;
  end; 
  
  destructor ENDestinationOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDestinationOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationOrder');
  RemClassRegistry.RegisterXSClass(ENDestinationOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationOrderRef');
  RemClassRegistry.RegisterXSClass(ENDestinationOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationOrderFilter');
  RemClassRegistry.RegisterXSClass(ENDestinationOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationOrderShort');
  RemClassRegistry.RegisterXSClass(ENDestinationOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDestinationOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDestinationOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDestinationOrderControllerSoapPort), 'http://ksoe.org/ENDestinationOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDestinationOrderControllerSoapPort), 'http://ksoe.org/ENDestinationOrderController/action/ENDestinationOrderController.%operationName%');


end.
