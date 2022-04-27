unit ENPlanWork2CCDamageLogController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,ENPlan2CCDamageLogTypeController
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

  ENPlanWork2CCDamageLog            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2CCDamageLogRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2CCDamageLog = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FccDamageLogCode : Integer;
    FnewsPaperName : WideString;
    FnewsPaperNumber : WideString;
    FdatePubl : TXSDate;
    FdateBegin : TXSDate;
    FdateFinish : TXSDate;
    FneedsApprovalByCustomer : Integer;
//???
    FplanRef : ENPlanWorkRef;
//???
    FtypeRef : ENPlan2CCDamageLogTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property ccDamageLogCode : Integer read FccDamageLogCode write FccDamageLogCode;
    property newsPaperName : WideString read FnewsPaperName write FnewsPaperName;
    property newsPaperNumber : WideString read FnewsPaperNumber write FnewsPaperNumber;
    property datePubl : TXSDate read FdatePubl write FdatePubl;
    property dateBegin : TXSDate read FdateBegin write FdateBegin;
    property dateFinish : TXSDate read FdateFinish write FdateFinish;
    property needsApprovalByCustomer : Integer read FneedsApprovalByCustomer write FneedsApprovalByCustomer;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property typeRef : ENPlan2CCDamageLogTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENPlanWork2CCDamageLogFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FccDamageLogCode : Integer;
    FnewsPaperName : WideString;
    FnewsPaperNumber : WideString;
    FdatePubl : TXSDate;
    FdateBegin : TXSDate;
    FdateFinish : TXSDate;
    FneedsApprovalByCustomer : Integer;
//???
    FplanRef : ENPlanWorkRef;
//???
    FtypeRef : ENPlan2CCDamageLogTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property ccDamageLogCode : Integer read FccDamageLogCode write FccDamageLogCode;
    property newsPaperName : WideString read FnewsPaperName write FnewsPaperName;
    property newsPaperNumber : WideString read FnewsPaperNumber write FnewsPaperNumber;
    property datePubl : TXSDate read FdatePubl write FdatePubl;
    property dateBegin : TXSDate read FdateBegin write FdateBegin;
    property dateFinish : TXSDate read FdateFinish write FdateFinish;
    property needsApprovalByCustomer : Integer read FneedsApprovalByCustomer write FneedsApprovalByCustomer;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property typeRef : ENPlan2CCDamageLogTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENPlanWork2CCDamageLogFilter = class(ENPlanWork2CCDamageLog)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWork2CCDamageLogShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FccDamageLogCode : Integer;
    FnewsPaperName : WideString;
    FnewsPaperNumber : WideString;
    FdatePubl : TXSDate;
    FdateBegin : TXSDate;
    FdateFinish : TXSDate;
    FneedsApprovalByCustomer : Integer;
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
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  ccDamageLogCode : Integer read FccDamageLogCode write FccDamageLogCode;
    property newsPaperName : WideString read FnewsPaperName write FnewsPaperName;
    property newsPaperNumber : WideString read FnewsPaperNumber write FnewsPaperNumber;
    property datePubl : TXSDate read FdatePubl write FdatePubl;
    property dateBegin : TXSDate read FdateBegin write FdateBegin;
    property dateFinish : TXSDate read FdateFinish write FdateFinish;
    property  needsApprovalByCustomer : Integer read FneedsApprovalByCustomer write FneedsApprovalByCustomer;

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
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENPlanWork2CCDamageLogShort = array of ENPlanWork2CCDamageLogShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2CCDamageLogShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2CCDamageLogShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2CCDamageLogShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2CCDamageLogController/message/
  // soapAction: http://ksoe.org/ENPlanWork2CCDamageLogController/action/ENPlanWork2CCDamageLogController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2CCDamageLogControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2CCDamageLogController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2CCDamageLogControllerSoapPort = interface(IInvokable)
  ['{AE287ECA-C657-40B0-A02F-E1302B0CAF88}']
    function add(const aENPlanWork2CCDamageLog: ENPlanWork2CCDamageLog): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2CCDamageLog: ENPlanWork2CCDamageLog); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanWork2CCDamageLog; stdcall;
    function getList: ENPlanWork2CCDamageLogShortList; stdcall;
    function getFilteredList(const aENPlanWork2CCDamageLogFilter: ENPlanWork2CCDamageLogFilter): ENPlanWork2CCDamageLogShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2CCDamageLogShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWork2CCDamageLogFilter: ENPlanWork2CCDamageLogFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2CCDamageLogShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2CCDamageLogShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWork2CCDamageLogFilter: ENPlanWork2CCDamageLogFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWork2CCDamageLogShort; stdcall;
  end;


implementation

  destructor ENPlanWork2CCDamageLog.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePubl) then
      datePubl.Free;
    if Assigned(FdateBegin) then
      dateBegin.Free;
    if Assigned(FdateFinish) then
      dateFinish.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWork2CCDamageLogFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePubl) then
      datePubl.Free;
    if Assigned(FdateBegin) then
      dateBegin.Free;
    if Assigned(FdateFinish) then
      dateFinish.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWork2CCDamageLogFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWork2CCDamageLogShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePubl) then
      datePubl.Free;
    if Assigned(FdateBegin) then
      dateBegin.Free;
    if Assigned(FdateFinish) then
      dateFinish.Free;
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

  destructor ENPlanWork2CCDamageLogShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWork2CCDamageLog, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2CCDamageLog');
  RemClassRegistry.RegisterXSClass(ENPlanWork2CCDamageLogRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2CCDamageLogRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2CCDamageLogFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2CCDamageLogFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2CCDamageLogShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2CCDamageLogShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2CCDamageLogShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2CCDamageLogShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2CCDamageLogShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2CCDamageLogShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2CCDamageLogControllerSoapPort), 'http://ksoe.org/ENPlanWork2CCDamageLogController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2CCDamageLogControllerSoapPort), 'http://ksoe.org/ENPlanWork2CCDamageLogController/action/ENPlanWork2CCDamageLogController.%operationName%');


end.
