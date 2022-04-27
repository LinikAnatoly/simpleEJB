unit ENWorkOrder2ENPlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENWorkOrderController 
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

  ENWorkOrder2ENPlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrder2ENPlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrder2ENPlanWork = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FworkOrder : ENWorkOrder;
//???
    Fplan : ENPlanWork;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property workOrder : ENWorkOrder read FworkOrder write FworkOrder; 
    property plan : ENPlanWork read Fplan write Fplan; 
  end;

  ENWorkOrder2ENPlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FworkOrder : ENWorkOrder;
//???
    Fplan : ENPlanWork;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property workOrder : ENWorkOrder read FworkOrder write FworkOrder; 
    property plan : ENPlanWork read Fplan write Fplan; 
  end;


  ENWorkOrder2ENPlanWorkShort = class(TRemotable)
  private
    Fcode : Integer; 
    FworkOrderCode : Integer; 
    FworkOrderWorkOrderNumber : WideString;
    FworkOrderDateGen : TXSDate;
    FworkOrderFinMolName : WideString;
    FworkOrderFinMechanicName : WideString;
    FworkOrderUserGen : WideString;
    FworkOrderDateEdit : TXSDate;
    FplanCode : Integer; 
    FplanDateGen : TXSDate;
    FplanDateStart : TXSDate;
    FplanDateFinal : TXSDate;
    FplanYearGen : Integer; 
    FplanMonthGen : Integer; 
    FplanUserGen : WideString;
    FplanDateEdit : TXSDate;
    FplanWorkOrderNumber : WideString;
    FplanDateWorkOrder : TXSDate;
    FplanPriConnectionNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property workOrderCode : Integer read FworkOrderCode write FworkOrderCode; 
    property workOrderWorkOrderNumber : WideString read FworkOrderWorkOrderNumber write FworkOrderWorkOrderNumber; 
    property workOrderDateGen : TXSDate read FworkOrderDateGen write FworkOrderDateGen; 
    property workOrderFinMolName : WideString read FworkOrderFinMolName write FworkOrderFinMolName; 
    property workOrderFinMechanicName : WideString read FworkOrderFinMechanicName write FworkOrderFinMechanicName; 
    property workOrderUserGen : WideString read FworkOrderUserGen write FworkOrderUserGen; 
    property workOrderDateEdit : TXSDate read FworkOrderDateEdit write FworkOrderDateEdit; 
    property planCode : Integer read FplanCode write FplanCode; 
    property planDateGen : TXSDate read FplanDateGen write FplanDateGen; 
    property planDateStart : TXSDate read FplanDateStart write FplanDateStart; 
    property planDateFinal : TXSDate read FplanDateFinal write FplanDateFinal; 
    property planYearGen : Integer read FplanYearGen write FplanYearGen; 
    property planMonthGen : Integer read FplanMonthGen write FplanMonthGen; 
    property planUserGen : WideString read FplanUserGen write FplanUserGen; 
    property planDateEdit : TXSDate read FplanDateEdit write FplanDateEdit; 
    property planWorkOrderNumber : WideString read FplanWorkOrderNumber write FplanWorkOrderNumber; 
    property planDateWorkOrder : TXSDate read FplanDateWorkOrder write FplanDateWorkOrder; 
    property planPriConnectionNumber : WideString read FplanPriConnectionNumber write FplanPriConnectionNumber; 
  end;

  ArrayOfENWorkOrder2ENPlanWorkShort = array of ENWorkOrder2ENPlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrder2ENPlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrder2ENPlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrder2ENPlanWorkShort read Flist write Flist;
  end;


  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrder2ENPlanWorkController/message/
  // soapAction: http://ksoe.org/ENWorkOrder2ENPlanWorkController/action/ENWorkOrder2ENPlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrder2ENPlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrder2ENPlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrder2ENPlanWorkControllerSoapPort = interface(IInvokable)
  ['{CE91613F-BD69-42F7-BE5C-16D6651A3FD5}']
    function  addtezzzt(const aENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWork); stdcall;
    function  getObject(const anObjectCode: Integer): ENWorkOrder2ENPlanWork; stdcall;
    function  getList: ENWorkOrder2ENPlanWorkShortList; stdcall;
    function  getFilteredList(const aENWorkOrder2ENPlanWorkFilter: ENWorkOrder2ENPlanWorkFilter): ENWorkOrder2ENPlanWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrder2ENPlanWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENWorkOrder2ENPlanWorkFilter: ENWorkOrder2ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrder2ENPlanWorkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrder2ENPlanWorkShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWorkOrder2ENPlanWorkFilter: ENWorkOrder2ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getPlanCodeArray(const aENWorkOrder2ENPlanWorkFilter: ENWorkOrder2ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

   {tezzzt} function  addWithCheck(const aENWorkOrder2ENPlanWork: ENWorkOrder2ENPlanWork ; const checkFinworkerTime : Boolean ): Integer; stdcall;
  end;



implementation

  destructor ENWorkOrder2ENPlanWork.Destroy;
  begin
    if Assigned(FworkOrder) then
      workOrder.Free;
    if Assigned(Fplan) then
      plan.Free;
    inherited Destroy;
  end;
  
  destructor ENWorkOrder2ENPlanWorkFilter.Destroy;
  begin
    if Assigned(FworkOrder) then
      workOrder.Free;
    if Assigned(Fplan) then
      plan.Free;
    inherited Destroy;
  end; 
  
  destructor ENWorkOrder2ENPlanWorkShort.Destroy;
  begin
    if Assigned(FworkOrderDateGen) then
      workOrderDateGen.Free;
    if Assigned(FworkOrderDateEdit) then
      workOrderDateEdit.Free;
    if Assigned(FplanDateGen) then
      planDateGen.Free;
    if Assigned(FplanDateStart) then
      planDateStart.Free;
    if Assigned(FplanDateFinal) then
      planDateFinal.Free;
    if Assigned(FplanDateEdit) then
      planDateEdit.Free;
    if Assigned(FplanDateWorkOrder) then
      planDateWorkOrder.Free;
    inherited Destroy;
  end; 
  
  destructor ENWorkOrder2ENPlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrder2ENPlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder2ENPlanWork');
  RemClassRegistry.RegisterXSClass(ENWorkOrder2ENPlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder2ENPlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrder2ENPlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder2ENPlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrder2ENPlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder2ENPlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrder2ENPlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder2ENPlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrder2ENPlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrder2ENPlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrder2ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENWorkOrder2ENPlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrder2ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENWorkOrder2ENPlanWorkController/action/ENWorkOrder2ENPlanWorkController.%operationName%');


end.
