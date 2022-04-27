unit ENHumenItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,ENPlanWorkItemController
   ,TKPositionController
   ,ENEstimateItemTypeController
   ,FINWorkerController
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

  ENHumenItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHumenItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHumenItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountFactOriginal : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FpositionGen : TKPosition;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FfinWorker : FINWorker;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property countFactOriginal : TXSDecimal read FcountFactOriginal write FcountFactOriginal;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef;
    property positionGen : TKPosition read FpositionGen write FpositionGen;
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
  end;

{
  ENHumenItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountFactOriginal : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanItemRef : ENPlanWorkItemRef;
//???
    FpositionGen : TKPosition;
//???
    FtypeRef : ENEstimateItemTypeRef;
//???
    FfinWorker : FINWorker;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property countFactOriginal : TXSDecimal read FcountFactOriginal write FcountFactOriginal;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property planItemRef : ENPlanWorkItemRef read FplanItemRef write FplanItemRef;
    property positionGen : TKPosition read FpositionGen write FpositionGen;
    property typeRef : ENEstimateItemTypeRef read FtypeRef write FtypeRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
  end;
}

  ENHumenItemFilter = class(ENHumenItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENHumenItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountFactOriginal : TXSDecimal;
    Fprice : TXSDecimal;
    Fcost : TXSDecimal;
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
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
    FplanItemRefCode : Integer;
    FplanItemRefCountGen : TXSDecimal;
    FplanItemRefTimeGen : TXSDecimal;
    FplanItemRefCostGen : TXSDecimal;
    FplanItemRefUserGen : WideString;
    FplanItemRefDateEdit : TXSDate;
    FpositionGenCode : Integer;
    FpositionGenName : WideString;
    FpositionGenSafetyGroup : WideString;
    FpositionGenRank : WideString;
    FpositionGenShortName : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FfinWorkerCode : Integer;
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    FfinWorkerPositionCode : Integer;
    FfinWorkerDepartmentName : WideString;
    FfinWorkerDepartmentCode : WideString;
    FfinWorkerPriceGen : TXSDecimal;
    FfinWorkerCategor : Integer;
    FfinWorkerFinCode : Integer;
    FfinWorkerIsSentAssignment : Integer;
    FfinWorkerChargePercent : TXSDecimal;

    FfinCode : Integer;

    FkartaRefCode :Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;

    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property countFactOriginal : TXSDecimal read FcountFactOriginal write FcountFactOriginal;
    property price : TXSDecimal read Fprice write Fprice;
    property cost : TXSDecimal read Fcost write Fcost;
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
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
    property planItemRefCode : Integer read FplanItemRefCode write FplanItemRefCode;
    property planItemRefCountGen : TXSDecimal read FplanItemRefCountGen write FplanItemRefCountGen;
    property planItemRefTimeGen : TXSDecimal read FplanItemRefTimeGen write FplanItemRefTimeGen;
    property planItemRefCostGen : TXSDecimal read FplanItemRefCostGen write FplanItemRefCostGen;
    property planItemRefUserGen : WideString read FplanItemRefUserGen write FplanItemRefUserGen;
    property planItemRefDateEdit : TXSDate read FplanItemRefDateEdit write FplanItemRefDateEdit;
    property positionGenCode : Integer read FpositionGenCode write FpositionGenCode;
    property positionGenName : WideString read FpositionGenName write FpositionGenName;
    property positionGenSafetyGroup : WideString read FpositionGenSafetyGroup write FpositionGenSafetyGroup;
    property positionGenRank : WideString read FpositionGenRank write FpositionGenRank;
    property positionGenShortName : WideString read FpositionGenShortName write FpositionGenShortName;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode;
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName;
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName;
    property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode;
    property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName;
    property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode;
    property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen;
    property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor;
    property finWorkerFinCode : Integer read FfinWorkerFinCode write FfinWorkerFinCode;
    property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment;
    property finWorkerChargePercent : TXSDecimal read FfinWorkerChargePercent write FfinWorkerChargePercent;
    property finCode : Integer read FfinCode write FfinCode;
        
    property kartaRefCode :Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;     
  end;

  ArrayOfENHumenItemShort = array of ENHumenItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHumenItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHumenItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHumenItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHumenItemController/message/
  // soapAction: http://ksoe.org/ENHumenItemController/action/ENHumenItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHumenItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHumenItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHumenItemControllerSoapPort = interface(IInvokable)
  ['{10f710f7-10f7-10f7-10f7-10f710f710f7}']
    function add(const aENHumenItem: ENHumenItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHumenItem: ENHumenItem); stdcall;
    function getObject(const anObjectCode: Integer): ENHumenItem; stdcall;
    function getList: ENHumenItemShortList; stdcall;
    function getFilteredList(const aENHumenItemFilter: ENHumenItemFilter): ENHumenItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemShortList; stdcall;
    function getScrollableFilteredList(const aENHumenItemFilter: ENHumenItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHumenItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENHumenItemFilter: ENHumenItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENHumenItemShort; stdcall;
  end;


implementation

  destructor ENHumenItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountFactOriginal) then
      countFactOriginal.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FpositionGen) then
      positionGen.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    inherited Destroy;
  end;

{
  destructor ENHumenItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountFactOriginal) then
      countFactOriginal.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanItemRef) then
      planItemRef.Free;
    if Assigned(FpositionGen) then
      positionGen.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    inherited Destroy;
  end;
}

  destructor ENHumenItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENHumenItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountFactOriginal) then
      countFactOriginal.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(Fcost) then
      cost.Free;
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
    if Assigned(FplanItemRefCountGen) then
      planItemRefCountGen.Free;
    if Assigned(FplanItemRefTimeGen) then
      planItemRefTimeGen.Free;
    if Assigned(FplanItemRefCostGen) then
      planItemRefCostGen.Free;
    if Assigned(FplanItemRefDateEdit) then
      planItemRefDateEdit.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    if Assigned(FfinWorkerChargePercent) then
      finWorkerChargePercent.Free;
    inherited Destroy;
  end;

  destructor ENHumenItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHumenItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItem');
  RemClassRegistry.RegisterXSClass(ENHumenItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemRef');
  RemClassRegistry.RegisterXSClass(ENHumenItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemFilter');
  RemClassRegistry.RegisterXSClass(ENHumenItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemShort');
  RemClassRegistry.RegisterXSClass(ENHumenItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHumenItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHumenItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHumenItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHumenItemControllerSoapPort), 'http://ksoe.org/ENHumenItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHumenItemControllerSoapPort), 'http://ksoe.org/ENHumenItemController/action/ENHumenItemController.%operationName%');


end.
