unit ENPlan2HumenController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,ENHumenItemKindController
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

  ENPlan2Humen            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlan2HumenRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlan2Humen = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    Ffio : WideString;
    FpositionCode : Integer;
    FpriceGen : TXSDecimal;
    FtimeWorkGen : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpositionId : WideString;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FhumenKindRef : ENHumenItemKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property timeWorkGen : TXSDecimal read FtimeWorkGen write FtimeWorkGen;
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property positionId : WideString read FpositionId write FpositionId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property humenKindRef : ENHumenItemKindRef read FhumenKindRef write FhumenKindRef;
  end;

{
  ENPlan2HumenFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtabNumber : WideString;
    Ffio : WideString;
    FpositionCode : Integer;
    FpriceGen : TXSDecimal;
    FtimeWorkGen : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpositionId : WideString;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FhumenKindRef : ENHumenItemKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property timeWorkGen : TXSDecimal read FtimeWorkGen write FtimeWorkGen;
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property positionId : WideString read FpositionId write FpositionId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property humenKindRef : ENHumenItemKindRef read FhumenKindRef write FhumenKindRef;
  end;
}

  ENPlan2HumenFilter = class(ENPlan2Humen)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlan2HumenShort = class(TRemotable)
  private
    Fcode : Integer;
    FtabNumber : WideString;
    Ffio : WideString;
    FpositionCode : Integer;
    FpriceGen : TXSDecimal;
    FtimeWorkGen : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpositionId : WideString;
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
    FhumenKindRefCode : Integer;
    FhumenKindRefName : WideString;
    ///
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefStatusCode : Integer;
    FactRefStatusName : WideString;
    ///
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property timeWorkGen : TXSDecimal read FtimeWorkGen write FtimeWorkGen;
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property positionId : WideString read FpositionId write FpositionId;

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
    property humenKindRefCode : Integer read FhumenKindRefCode write FhumenKindRefCode;
    property humenKindRefName : WideString read FhumenKindRefName write FhumenKindRefName;
    ///
    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefStatusCode : Integer read FactRefStatusCode write FactRefStatusCode;
    property actRefStatusName : WideString read FactRefStatusName write FactRefStatusName;
    ///
  end;

  ArrayOfENPlan2HumenShort = array of ENPlan2HumenShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlan2HumenShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlan2HumenShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlan2HumenShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlan2HumenController/message/
  // soapAction: http://ksoe.org/ENPlan2HumenController/action/ENPlan2HumenController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlan2HumenControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlan2HumenController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlan2HumenControllerSoapPort = interface(IInvokable)
  ['{C5A58641-75B8-4350-8534-864DDE50FA33}']
    function add(const aENPlan2Humen: ENPlan2Humen): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlan2Humen: ENPlan2Humen); stdcall;
    function getObject(const anObjectCode: Integer): ENPlan2Humen; stdcall;
    function getList: ENPlan2HumenShortList; stdcall;
    function getFilteredList(const aENPlan2HumenFilter: ENPlan2HumenFilter): ENPlan2HumenShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlan2HumenShortList; stdcall;
    function getScrollableFilteredList(const aENPlan2HumenFilter: ENPlan2HumenFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlan2HumenShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlan2HumenShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlan2HumenFilter: ENPlan2HumenFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlan2HumenShort; stdcall;
  end;


implementation

  destructor ENPlan2Humen.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FtimeWorkGen) then
      timeWorkGen.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FhumenKindRef) then
      humenKindRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlan2HumenFilter.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FtimeWorkGen) then
      timeWorkGen.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FhumenKindRef) then
      humenKindRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlan2HumenFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlan2HumenShort.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FtimeWorkGen) then
      timeWorkGen.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
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

  destructor ENPlan2HumenShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlan2Humen, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2Humen');
  RemClassRegistry.RegisterXSClass(ENPlan2HumenRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2HumenRef');
  RemClassRegistry.RegisterXSClass(ENPlan2HumenFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2HumenFilter');
  RemClassRegistry.RegisterXSClass(ENPlan2HumenShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2HumenShort');
  RemClassRegistry.RegisterXSClass(ENPlan2HumenShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlan2HumenShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlan2HumenShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlan2HumenShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlan2HumenControllerSoapPort), 'http://ksoe.org/ENPlan2HumenController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlan2HumenControllerSoapPort), 'http://ksoe.org/ENPlan2HumenController/action/ENPlan2HumenController.%operationName%');


end.
