unit FINExecutor2PlanController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,FINExecutorTypeController
   ,ENPlanWorkController
   ,FINExecutorController
   ,ENDepartmentController
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

  FINExecutor2Plan            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutor2PlanRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutor2Plan = class(TRemotable)
  private
    Fcode : Integer;
    FpercentLoad : TXSDecimal;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FtotalTimeHours : TXSDecimal;
    FtotalTimeDays : TXSDecimal;
    FtotalTimeManHours : TXSDecimal;
    FdeliveryTime : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FfinExecutorTypeRef : FINExecutorTypeRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfinExecutor : FINExecutor;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property percentLoad : TXSDecimal read FpercentLoad write FpercentLoad;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property totalTimeHours : TXSDecimal read FtotalTimeHours write FtotalTimeHours;
    property totalTimeDays : TXSDecimal read FtotalTimeDays write FtotalTimeDays;
    property totalTimeManHours : TXSDecimal read FtotalTimeManHours write FtotalTimeManHours;
    property deliveryTime : TXSDecimal read FdeliveryTime write FdeliveryTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property finExecutorTypeRef : FINExecutorTypeRef read FfinExecutorTypeRef write FfinExecutorTypeRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property finExecutor : FINExecutor read FfinExecutor write FfinExecutor;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;

{
  FINExecutor2PlanFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpercentLoad : TXSDecimal;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FtotalTimeHours : TXSDecimal;
    FtotalTimeDays : TXSDecimal;
    FtotalTimeManHours : TXSDecimal;
    FdeliveryTime : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FfinExecutorTypeRef : FINExecutorTypeRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfinExecutor : FINExecutor;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property percentLoad : TXSDecimal read FpercentLoad write FpercentLoad;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property totalTimeHours : TXSDecimal read FtotalTimeHours write FtotalTimeHours;
    property totalTimeDays : TXSDecimal read FtotalTimeDays write FtotalTimeDays;
    property totalTimeManHours : TXSDecimal read FtotalTimeManHours write FtotalTimeManHours;
    property deliveryTime : TXSDecimal read FdeliveryTime write FdeliveryTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property finExecutorTypeRef : FINExecutorTypeRef read FfinExecutorTypeRef write FfinExecutorTypeRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property finExecutor : FINExecutor read FfinExecutor write FfinExecutor;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;
}

  FINExecutor2PlanFilter = class(FINExecutor2Plan)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINExecutor2PlanShort = class(TRemotable)
  private
    Fcode : Integer;
    FpercentLoad : TXSDecimal;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FtotalTimeHours : TXSDecimal;
    FtotalTimeDays : TXSDecimal;
    FtotalTimeManHours : TXSDecimal;
    FdeliveryTime : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FfinExecutorTypeRefCode : Integer;
    FfinExecutorTypeRefName : WideString;
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
    FfinExecutorCode : Integer;
    FfinExecutorName : WideString;
    FfinExecutorFinCode : Integer;
    FfinExecutorFinTypeName : WideString;
    FfinExecutorFinTypeCode : Integer;
    FfinExecutorFinKindName : WideString;
    FfinExecutorFinKindCode : Integer;
    FfinExecutorFinCehName : WideString;
    FfinExecutorFinCehCode : Integer;
    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FbudgetRefRenCode : Integer;
    FbudgetRefShpzBalans : WideString;
    FbudgetRefKau_table_id_1884 : Integer;
    FbudgetRefKau_1884 : WideString;
    FbudgetRefName_1884 : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property percentLoad : TXSDecimal read FpercentLoad write FpercentLoad;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property totalTimeHours : TXSDecimal read FtotalTimeHours write FtotalTimeHours;
    property totalTimeDays : TXSDecimal read FtotalTimeDays write FtotalTimeDays;
    property totalTimeManHours : TXSDecimal read FtotalTimeManHours write FtotalTimeManHours;
    property deliveryTime : TXSDecimal read FdeliveryTime write FdeliveryTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property finExecutorTypeRefCode : Integer read FfinExecutorTypeRefCode write FfinExecutorTypeRefCode;
    property finExecutorTypeRefName : WideString read FfinExecutorTypeRefName write FfinExecutorTypeRefName;
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
    property finExecutorCode : Integer read FfinExecutorCode write FfinExecutorCode;
    property finExecutorName : WideString read FfinExecutorName write FfinExecutorName;
    property finExecutorFinCode : Integer read FfinExecutorFinCode write FfinExecutorFinCode;
    property finExecutorFinTypeName : WideString read FfinExecutorFinTypeName write FfinExecutorFinTypeName;
    property finExecutorFinTypeCode : Integer read FfinExecutorFinTypeCode write FfinExecutorFinTypeCode;
    property finExecutorFinKindName : WideString read FfinExecutorFinKindName write FfinExecutorFinKindName;
    property finExecutorFinKindCode : Integer read FfinExecutorFinKindCode write FfinExecutorFinKindCode;
    property finExecutorFinCehName : WideString read FfinExecutorFinCehName write FfinExecutorFinCehName;
    property finExecutorFinCehCode : Integer read FfinExecutorFinCehCode write FfinExecutorFinCehCode;
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart;
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal;
    property budgetRefRenCode : Integer read FbudgetRefRenCode write FbudgetRefRenCode;
    property budgetRefShpzBalans : WideString read FbudgetRefShpzBalans write FbudgetRefShpzBalans;
    property budgetRefKau_table_id_1884 : Integer read FbudgetRefKau_table_id_1884 write FbudgetRefKau_table_id_1884;
    property budgetRefKau_1884 : WideString read FbudgetRefKau_1884 write FbudgetRefKau_1884;
    property budgetRefName_1884 : WideString read FbudgetRefName_1884 write FbudgetRefName_1884;
  end;

  ArrayOfFINExecutor2PlanShort = array of FINExecutor2PlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINExecutor2PlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINExecutor2PlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINExecutor2PlanShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINExecutor2PlanController/message/
  // soapAction: http://ksoe.org/FINExecutor2PlanController/action/FINExecutor2PlanController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINExecutor2PlanControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINExecutor2PlanController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINExecutor2PlanControllerSoapPort = interface(IInvokable)
  ['{136EC8D2-39E8-413B-971A-AF33CAB2C6B0}']
    function add(const aFINExecutor2Plan: FINExecutor2Plan): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINExecutor2Plan: FINExecutor2Plan); stdcall;
    function getObject(const anObjectCode: Integer): FINExecutor2Plan; stdcall;
    function getList: FINExecutor2PlanShortList; stdcall;
    function getFilteredList(const aFINExecutor2PlanFilter: FINExecutor2PlanFilter): FINExecutor2PlanShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINExecutor2PlanShortList; stdcall;
    function getScrollableFilteredList(const aFINExecutor2PlanFilter: FINExecutor2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): FINExecutor2PlanShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINExecutor2PlanShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINExecutor2PlanFilter: FINExecutor2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINExecutor2PlanShort; stdcall;
  end;


implementation

  destructor FINExecutor2Plan.Destroy;
  begin
    if Assigned(FpercentLoad) then
      percentLoad.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(FtotalTimeManHours) then
      totalTimeManHours.Free;
    if Assigned(FdeliveryTime) then
      deliveryTime.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfinExecutorTypeRef) then
      finExecutorTypeRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfinExecutor) then
      finExecutor.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;

{
  destructor FINExecutor2PlanFilter.Destroy;
  begin
    if Assigned(FpercentLoad) then
      percentLoad.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(FtotalTimeManHours) then
      totalTimeManHours.Free;
    if Assigned(FdeliveryTime) then
      deliveryTime.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfinExecutorTypeRef) then
      finExecutorTypeRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfinExecutor) then
      finExecutor.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;
}

  destructor FINExecutor2PlanFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FINExecutor2PlanShort.Destroy;
  begin
    if Assigned(FpercentLoad) then
      percentLoad.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(FtotalTimeManHours) then
      totalTimeManHours.Free;
    if Assigned(FdeliveryTime) then
      deliveryTime.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor FINExecutor2PlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINExecutor2Plan, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor2Plan');
  RemClassRegistry.RegisterXSClass(FINExecutor2PlanRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor2PlanRef');
  RemClassRegistry.RegisterXSClass(FINExecutor2PlanFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor2PlanFilter');
  RemClassRegistry.RegisterXSClass(FINExecutor2PlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor2PlanShort');
  RemClassRegistry.RegisterXSClass(FINExecutor2PlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor2PlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINExecutor2PlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINExecutor2PlanShort');

  InvRegistry.RegisterInterface(TypeInfo(FINExecutor2PlanControllerSoapPort), 'http://ksoe.org/FINExecutor2PlanController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINExecutor2PlanControllerSoapPort), 'http://ksoe.org/FINExecutor2PlanController/action/FINExecutor2PlanController.%operationName%');


end.
