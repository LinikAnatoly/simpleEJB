unit FINMolDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,FINMolTypeController 
   ,ENActController 
   ,ENWorkOrderController 
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

  FINMolData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMolDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMolData = class(TRemotable)
  private
    Fcode : Integer; 
    FfinMolCode : WideString;
    FfinMolName : WideString;
    Fmodify_time : Int64;
//???
    FmolTypeRef : FINMolTypeRef;
//???
    Fact : ENAct;
//???
    FworkOrder : ENWorkOrder;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property molTypeRef : FINMolTypeRef read FmolTypeRef write FmolTypeRef; 
    property act : ENAct read Fact write Fact; 
    property workOrder : ENWorkOrder read FworkOrder write FworkOrder; 
  end;

  FINMolDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FfinMolCode : WideString;
    FfinMolName : WideString;
    Fmodify_time : Int64;
//???
    FmolTypeRef : FINMolTypeRef;
//???
    Fact : ENAct;
//???
    FworkOrder : ENWorkOrder;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property molTypeRef : FINMolTypeRef read FmolTypeRef write FmolTypeRef; 
    property act : ENAct read Fact write Fact; 
    property workOrder : ENWorkOrder read FworkOrder write FworkOrder; 
  end;


  FINMolDataShort = class(TRemotable)
  private
    Fcode : Integer; 
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FmolTypeRefCode : Integer; 
    FmolTypeRefName : WideString;
    FactCode : Integer; 
    FactNumberGen : WideString;
    FactDateGen : TXSDate;
    FactFinDocCode : Integer; 
    FactFinDocMechanicCode : Integer; 
    FactFinMolName : WideString;
    FactFinMechanicName : WideString;
    FactUserGen : WideString;
    FactDateEdit : TXSDate;
    FworkOrderCode : Integer; 
    FworkOrderWorkOrderNumber : WideString;
    FworkOrderDateGen : TXSDate;
    FworkOrderFinMolCode : WideString;
    FworkOrderFinMolName : WideString;
    FworkOrderFinMechanicCode : WideString;
    FworkOrderFinMechanicName : WideString;
    FworkOrderUserGen : WideString;
    FworkOrderDateEdit : TXSDate;
	FphoneNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;

    property molTypeRefCode : Integer read FmolTypeRefCode write FmolTypeRefCode; 
    property molTypeRefName : WideString read FmolTypeRefName write FmolTypeRefName; 
    property actCode : Integer read FactCode write FactCode; 
    property actNumberGen : WideString read FactNumberGen write FactNumberGen; 
    property actDateGen : TXSDate read FactDateGen write FactDateGen; 
    property actFinDocCode : Integer read FactFinDocCode write FactFinDocCode; 
    property actFinDocMechanicCode : Integer read FactFinDocMechanicCode write FactFinDocMechanicCode; 
    property actFinMolName : WideString read FactFinMolName write FactFinMolName; 
    property actFinMechanicName : WideString read FactFinMechanicName write FactFinMechanicName; 
    property actUserGen : WideString read FactUserGen write FactUserGen; 
    property actDateEdit : TXSDate read FactDateEdit write FactDateEdit; 
    property workOrderCode : Integer read FworkOrderCode write FworkOrderCode; 
    property workOrderWorkOrderNumber : WideString read FworkOrderWorkOrderNumber write FworkOrderWorkOrderNumber; 
    property workOrderDateGen : TXSDate read FworkOrderDateGen write FworkOrderDateGen; 
    property workOrderFinMolCode : WideString read FworkOrderFinMolCode write FworkOrderFinMolCode; 
    property workOrderFinMolName : WideString read FworkOrderFinMolName write FworkOrderFinMolName; 
    property workOrderFinMechanicCode : WideString read FworkOrderFinMechanicCode write FworkOrderFinMechanicCode; 
    property workOrderFinMechanicName : WideString read FworkOrderFinMechanicName write FworkOrderFinMechanicName; 
    property workOrderUserGen : WideString read FworkOrderUserGen write FworkOrderUserGen; 
    property workOrderDateEdit : TXSDate read FworkOrderDateEdit write FworkOrderDateEdit;
	property phoneNumber : WideString read FphoneNumber write FphoneNumber;	
  end;

  ArrayOfFINMolDataShort = array of FINMolDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINMolDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMolDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMolDataShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINMolDataController/message/
  // soapAction: http://ksoe.org/FINMolDataController/action/FINMolDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINMolDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINMolDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINMolDataControllerSoapPort = interface(IInvokable)
  ['{11bd11bd-11bd-11bd-11bd-11bd11bd11bd}']
    //function  add(const aFINMolData: FINMolData): Integer; stdcall;
    function  add(const aFINMolData: FINMolData; const parentCode : Integer; const parentTypeCode : Integer ): Integer; stdcall;

    //procedure remove(const anObjectCode: Integer); stdcall;
    procedure remove(const anObjectCode: Integer; const parentCode : Integer; const parentTypeCode : Integer); stdcall;

    //procedure save(const aFINMolData: FINMolData); stdcall;
    procedure save(const aFINMolData: FINMolData; const parentCode : Integer; const parentTypeCode : Integer); stdcall;

    function  getObject(const anObjectCode: Integer): FINMolData; stdcall;
    function  getList: FINMolDataShortList; stdcall;
    function  getFilteredList(const aFINMolDataFilter: FINMolDataFilter): FINMolDataShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINMolDataShortList; stdcall;
    function  getScrollableFilteredList(const aFINMolDataFilter: FINMolDataFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMolDataShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINMolDataShortList; stdcall;
  end; 


implementation

  destructor FINMolData.Destroy;
  begin
    if Assigned(FmolTypeRef) then
      molTypeRef.Free;
    if Assigned(Fact) then
      act.Free;
    if Assigned(FworkOrder) then
      workOrder.Free;
    inherited Destroy;
  end;
  
  destructor FINMolDataFilter.Destroy;
  begin
    if Assigned(FmolTypeRef) then
      molTypeRef.Free;
    if Assigned(Fact) then
      act.Free;
    if Assigned(FworkOrder) then
      workOrder.Free;
    inherited Destroy;
  end; 
  
  destructor FINMolDataShort.Destroy;
  begin
    if Assigned(FactDateGen) then
      actDateGen.Free;
    if Assigned(FactDateEdit) then
      actDateEdit.Free;
    if Assigned(FworkOrderDateGen) then
      workOrderDateGen.Free;
    if Assigned(FworkOrderDateEdit) then
      workOrderDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor FINMolDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINMolData, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolData');
  RemClassRegistry.RegisterXSClass(FINMolDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolDataRef');
  RemClassRegistry.RegisterXSClass(FINMolDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolDataFilter');
  RemClassRegistry.RegisterXSClass(FINMolDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolDataShort');
  RemClassRegistry.RegisterXSClass(FINMolDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINMolDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINMolDataShort');

  InvRegistry.RegisterInterface(TypeInfo(FINMolDataControllerSoapPort), 'http://ksoe.org/FINMolDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINMolDataControllerSoapPort), 'http://ksoe.org/FINMolDataController/action/FINMolDataController.%operationName%');


end.
