unit ENDeliveryTimePlanController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENDeliveryTimePlan            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryTimePlanRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryTimePlan = class(TRemotable)
  private
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FdeliveryDistance : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FplanWorkRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 
    property deliveryDistance : TXSDecimal read FdeliveryDistance write FdeliveryDistance; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef; 
  end;

  ENDeliveryTimePlanFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FdeliveryDistance : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FplanWorkRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 
    property deliveryDistance : TXSDecimal read FdeliveryDistance write FdeliveryDistance; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef; 
  end;


  ENDeliveryTimePlanShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdeliveryTimePlan : TXSDecimal;
    FdeliveryTimeFact : TXSDecimal;
    FdeliveryDistance : TXSDecimal;
    FplanWorkRefCode : Integer; 
    FplanWorkRefDateGen : TXSDate;
    FplanWorkRefDateStart : TXSDate;
    FplanWorkRefDateFinal : TXSDate;
    FplanWorkRefYearGen : Integer; 
    FplanWorkRefMonthGen : Integer; 
    FplanWorkRefUserGen : WideString;
    FplanWorkRefDateEdit : TXSDate;
    FplanWorkRefWorkOrderNumber : WideString;
    FplanWorkRefDateWorkOrder : TXSDate;
    FplanWorkRefPriConnectionNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property deliveryTimePlan : TXSDecimal read FdeliveryTimePlan write FdeliveryTimePlan; 
    property deliveryTimeFact : TXSDecimal read FdeliveryTimeFact write FdeliveryTimeFact; 
    property deliveryDistance : TXSDecimal read FdeliveryDistance write FdeliveryDistance; 

    property planWorkRefCode : Integer read FplanWorkRefCode write FplanWorkRefCode; 
    property planWorkRefDateGen : TXSDate read FplanWorkRefDateGen write FplanWorkRefDateGen; 
    property planWorkRefDateStart : TXSDate read FplanWorkRefDateStart write FplanWorkRefDateStart; 
    property planWorkRefDateFinal : TXSDate read FplanWorkRefDateFinal write FplanWorkRefDateFinal; 
    property planWorkRefYearGen : Integer read FplanWorkRefYearGen write FplanWorkRefYearGen; 
    property planWorkRefMonthGen : Integer read FplanWorkRefMonthGen write FplanWorkRefMonthGen; 
    property planWorkRefUserGen : WideString read FplanWorkRefUserGen write FplanWorkRefUserGen; 
    property planWorkRefDateEdit : TXSDate read FplanWorkRefDateEdit write FplanWorkRefDateEdit; 
    property planWorkRefWorkOrderNumber : WideString read FplanWorkRefWorkOrderNumber write FplanWorkRefWorkOrderNumber; 
    property planWorkRefDateWorkOrder : TXSDate read FplanWorkRefDateWorkOrder write FplanWorkRefDateWorkOrder; 
    property planWorkRefPriConnectionNumber : WideString read FplanWorkRefPriConnectionNumber write FplanWorkRefPriConnectionNumber; 
  end;

  ArrayOfENDeliveryTimePlanShort = array of ENDeliveryTimePlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDeliveryTimePlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDeliveryTimePlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDeliveryTimePlanShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDeliveryTimePlanController/message/
  // soapAction: http://ksoe.org/ENDeliveryTimePlanController/action/ENDeliveryTimePlanController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDeliveryTimePlanControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDeliveryTimePlanController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDeliveryTimePlanControllerSoapPort = interface(IInvokable)
  ['{1d8f1d8f-1d8f-1d8f-1d8f-1d8f1d8f1d8f}']
    function  add(const aENDeliveryTimePlan: ENDeliveryTimePlan): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDeliveryTimePlan: ENDeliveryTimePlan); stdcall;
    function  getObject(const anObjectCode: Integer): ENDeliveryTimePlan; stdcall;
    function  getList: ENDeliveryTimePlanShortList; stdcall;
    function  getFilteredList(const aENDeliveryTimePlanFilter: ENDeliveryTimePlanFilter): ENDeliveryTimePlanShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimePlanShortList; stdcall;
    function  getScrollableFilteredList(const aENDeliveryTimePlanFilter: ENDeliveryTimePlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimePlanShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryTimePlanShortList; stdcall;
  end; 


implementation

  destructor ENDeliveryTimePlan.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FdeliveryDistance) then
      deliveryDistance.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    inherited Destroy;
  end;
  
  destructor ENDeliveryTimePlanFilter.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FdeliveryDistance) then
      deliveryDistance.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENDeliveryTimePlanShort.Destroy;
  begin
    if Assigned(FdeliveryTimePlan) then
      deliveryTimePlan.Free;
    if Assigned(FdeliveryTimeFact) then
      deliveryTimeFact.Free;
    if Assigned(FdeliveryDistance) then
      deliveryDistance.Free;
    if Assigned(FplanWorkRefDateGen) then
      planWorkRefDateGen.Free;
    if Assigned(FplanWorkRefDateStart) then
      planWorkRefDateStart.Free;
    if Assigned(FplanWorkRefDateFinal) then
      planWorkRefDateFinal.Free;
    if Assigned(FplanWorkRefDateEdit) then
      planWorkRefDateEdit.Free;
    if Assigned(FplanWorkRefDateWorkOrder) then
      planWorkRefDateWorkOrder.Free;
    inherited Destroy;
  end; 
  
  destructor ENDeliveryTimePlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDeliveryTimePlan, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimePlan');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimePlanRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimePlanRef');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimePlanFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimePlanFilter');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimePlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimePlanShort');
  RemClassRegistry.RegisterXSClass(ENDeliveryTimePlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryTimePlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDeliveryTimePlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDeliveryTimePlanShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDeliveryTimePlanControllerSoapPort), 'http://ksoe.org/ENDeliveryTimePlanController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDeliveryTimePlanControllerSoapPort), 'http://ksoe.org/ENDeliveryTimePlanController/action/ENDeliveryTimePlanController.%operationName%');


end.
