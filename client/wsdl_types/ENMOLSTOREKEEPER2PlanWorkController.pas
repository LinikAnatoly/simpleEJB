unit ENMOLSTOREKEEPER2PlanWorkController;

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

  ENMOLSTOREKEEPER2PlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMOLSTOREKEEPER2PlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMOLSTOREKEEPER2PlanWork = class(TRemotable)
  private
    Fcode : Integer;
    FmolName : WideString;
    FmolCode : WideString;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENMOLSTOREKEEPER2PlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmolName : WideString;
    FmolCode : WideString;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENMOLSTOREKEEPER2PlanWorkFilter = class(ENMOLSTOREKEEPER2PlanWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMOLSTOREKEEPER2PlanWorkShort = class(TRemotable)
  private
    Fcode : Integer;
    FmolName : WideString;
    FmolCode : WideString;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDateTime;
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
    FplanRefDateEndPriConnection : TXSDate;
    FplanRefInvestWorksDescription : WideString;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;

    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDateTime read FplanRefDateGen write FplanRefDateGen;
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
    property planRefDateEndPriConnection : TXSDate read FplanRefDateEndPriConnection write FplanRefDateEndPriConnection;
    property planRefInvestWorksDescription : WideString read FplanRefInvestWorksDescription write FplanRefInvestWorksDescription;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
  end;

  ArrayOfENMOLSTOREKEEPER2PlanWorkShort = array of ENMOLSTOREKEEPER2PlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMOLSTOREKEEPER2PlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMOLSTOREKEEPER2PlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMOLSTOREKEEPER2PlanWorkShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMOLSTOREKEEPER2PlanWorkController/message/
  // soapAction: http://ksoe.org/ENMOLSTOREKEEPER2PlanWorkController/action/ENMOLSTOREKEEPER2PlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMOLSTOREKEEPER2PlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMOLSTOREKEEPER2PlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMOLSTOREKEEPER2PlanWorkControllerSoapPort = interface(IInvokable)
  ['{1bb31bb3-1bb3-1bb3-1bb3-1bb31bb31bb3}']
    function add(const aENMOLSTOREKEEPER2PlanWork: ENMOLSTOREKEEPER2PlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMOLSTOREKEEPER2PlanWork: ENMOLSTOREKEEPER2PlanWork); stdcall;
    function getObject(const anObjectCode: Integer): ENMOLSTOREKEEPER2PlanWork; stdcall;
    function getList: ENMOLSTOREKEEPER2PlanWorkShortList; stdcall;
    function getFilteredList(const aENMOLSTOREKEEPER2PlanWorkFilter: ENMOLSTOREKEEPER2PlanWorkFilter): ENMOLSTOREKEEPER2PlanWorkShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMOLSTOREKEEPER2PlanWorkShortList; stdcall;
    function getScrollableFilteredList(const aENMOLSTOREKEEPER2PlanWorkFilter: ENMOLSTOREKEEPER2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMOLSTOREKEEPER2PlanWorkShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMOLSTOREKEEPER2PlanWorkShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMOLSTOREKEEPER2PlanWorkFilter: ENMOLSTOREKEEPER2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMOLSTOREKEEPER2PlanWorkShort; stdcall;
  end;


implementation

  destructor ENMOLSTOREKEEPER2PlanWork.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENMOLSTOREKEEPER2PlanWorkFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENMOLSTOREKEEPER2PlanWorkFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENMOLSTOREKEEPER2PlanWorkShort.Destroy;
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
    if Assigned(FplanRefDateEndPriConnection) then
      planRefDateEndPriConnection.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENMOLSTOREKEEPER2PlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMOLSTOREKEEPER2PlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOLSTOREKEEPER2PlanWork');
  RemClassRegistry.RegisterXSClass(ENMOLSTOREKEEPER2PlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOLSTOREKEEPER2PlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENMOLSTOREKEEPER2PlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOLSTOREKEEPER2PlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENMOLSTOREKEEPER2PlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOLSTOREKEEPER2PlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENMOLSTOREKEEPER2PlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOLSTOREKEEPER2PlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMOLSTOREKEEPER2PlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMOLSTOREKEEPER2PlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMOLSTOREKEEPER2PlanWorkControllerSoapPort), 'http://ksoe.org/ENMOLSTOREKEEPER2PlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMOLSTOREKEEPER2PlanWorkControllerSoapPort), 'http://ksoe.org/ENMOLSTOREKEEPER2PlanWorkController/action/ENMOLSTOREKEEPER2PlanWorkController.%operationName%');


end.
