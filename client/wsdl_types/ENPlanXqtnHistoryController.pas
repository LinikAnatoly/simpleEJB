unit ENPlanXqtnHistoryController;

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

  ENPlanXqtnHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanXqtnHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanXqtnHistory = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FexecutionPercent : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property executionPercent : Integer read FexecutionPercent write FexecutionPercent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENPlanXqtnHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FexecutionPercent : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property executionPercent : Integer read FexecutionPercent write FexecutionPercent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENPlanXqtnHistoryFilter = class(ENPlanXqtnHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanXqtnHistoryShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FexecutionPercent : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
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
    FplanRefInvestDateStartWork : TXSDateTime;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  executionPercent : Integer read FexecutionPercent write FexecutionPercent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

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
    property planRefInvestDateStartWork : TXSDateTime read FplanRefInvestDateStartWork write FplanRefInvestDateStartWork;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
  end;

  ArrayOfENPlanXqtnHistoryShort = array of ENPlanXqtnHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanXqtnHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanXqtnHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanXqtnHistoryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanXqtnHistoryController/message/
  // soapAction: http://ksoe.org/ENPlanXqtnHistoryController/action/ENPlanXqtnHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanXqtnHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanXqtnHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanXqtnHistoryControllerSoapPort = interface(IInvokable)
  ['{B2330364-E2E7-4EB3-8401-A2A637C93F32}']
    function add(const aENPlanXqtnHistory: ENPlanXqtnHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanXqtnHistory: ENPlanXqtnHistory); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanXqtnHistory; stdcall;
    function getList: ENPlanXqtnHistoryShortList; stdcall;
    function getFilteredList(const aENPlanXqtnHistoryFilter: ENPlanXqtnHistoryFilter): ENPlanXqtnHistoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanXqtnHistoryShortList; stdcall;
    function getScrollableFilteredList(const aENPlanXqtnHistoryFilter: ENPlanXqtnHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanXqtnHistoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanXqtnHistoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanXqtnHistoryFilter: ENPlanXqtnHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanXqtnHistoryShort; stdcall;
  end;


implementation

  destructor ENPlanXqtnHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanXqtnHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanXqtnHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanXqtnHistoryShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
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
    if Assigned(FplanRefInvestDateStartWork) then
      planRefInvestDateStartWork.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENPlanXqtnHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanXqtnHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanXqtnHistory');
  RemClassRegistry.RegisterXSClass(ENPlanXqtnHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanXqtnHistoryRef');
  RemClassRegistry.RegisterXSClass(ENPlanXqtnHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanXqtnHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENPlanXqtnHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanXqtnHistoryShort');
  RemClassRegistry.RegisterXSClass(ENPlanXqtnHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanXqtnHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanXqtnHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanXqtnHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanXqtnHistoryControllerSoapPort), 'http://ksoe.org/ENPlanXqtnHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanXqtnHistoryControllerSoapPort), 'http://ksoe.org/ENPlanXqtnHistoryController/action/ENPlanXqtnHistoryController.%operationName%');


end.
