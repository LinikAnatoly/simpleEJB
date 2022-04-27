unit ENPlanWorkItem2GraphController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkItemController
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

  ENPlanWorkItem2Graph            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2GraphRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2Graph = class(TRemotable)
  private
    Fcode : Integer;
    FdayWork : TXSDateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fcountgen : TXSDecimal;
//???
    FplanWorkItemRef : ENPlanWorkItemRef;
//???
    FplanWorkRef : ENPlanWorkRef;
    Fmonth : Integer;
    Fyear : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dayWork : TXSDateTime read FdayWork write FdayWork;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property countgen : TXSDecimal read Fcountgen write Fcountgen;
    property planWorkItemRef : ENPlanWorkItemRef read FplanWorkItemRef write FplanWorkItemRef;
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef;

    property month : Integer read Fmonth write Fmonth;
    property year : Integer read Fyear write Fyear;
  end;

{
  ENPlanWorkItem2GraphFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdayWork : DateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fcountgen : TXSDecimal;
//???
    FplanWorkItemRef : ENPlanWorkItemRef;
//???
    FplanWorkRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dayWork : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property countgen : TXSDecimal read Fcountgen write Fcountgen;
    property planWorkItemRef : ENPlanWorkItemRef read FplanWorkItemRef write FplanWorkItemRef;
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef;
  end;
}

  ENPlanWorkItem2GraphFilter = class(ENPlanWorkItem2Graph)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWorkItem2GraphShort = class(TRemotable)
  private
    Fcode : Integer;
    FdayWork : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fcountgen : TXSDecimal;
    FplanWorkItemRefCode : Integer;
    FplanWorkItemRefCountGen : TXSDecimal;
    FplanWorkItemRefTimeGen : TXSDecimal;
    FplanWorkItemRefCostGen : TXSDecimal;
    FplanWorkItemRefUserGen : WideString;
    FplanWorkItemRefDateEdit : TXSDate;
    FplanWorkRefCode : Integer;
    FplanWorkRefDateGen : TXSDateTime;
    FplanWorkRefDateStart : TXSDate;
    FplanWorkRefDateFinal : TXSDate;
    FplanWorkRefYearGen : Integer;
    FplanWorkRefMonthGen : Integer;
    FplanWorkRefYearOriginal : Integer;
    FplanWorkRefMonthOriginal : Integer;
    FplanWorkRefUserGen : WideString;
    FplanWorkRefDateEdit : TXSDate;
    FplanWorkRefWorkOrderNumber : WideString;
    FplanWorkRefDateWorkOrder : TXSDate;
    FplanWorkRefPriConnectionNumber : WideString;
    FplanWorkRefDateEndPriConnection : TXSDate;
    FplanWorkRefInvestWorksDescription : WideString;
    FplanWorkRefServicesFSideFinId : Integer;
    FplanWorkRefServicesFSideCnNum : WideString;
    FplanWorkRefTotalTimeHours : TXSDecimal;
    FplanWorkRefTotalTimeDays : TXSDecimal;
    FplanWorkRefInvestItemNumber : WideString;
    Fd1 : WideString;
    Fd2 : WideString;
    Fd3 : WideString;
    Fd4 : WideString;
    Fd5 : WideString;
    Fd6 : WideString;
    Fd7 : WideString;
    Fd8 : WideString;
    Fd9 : WideString;
    Fd10 : WideString;
    Fd11 : WideString;
    Fd12 : WideString;
    Fd13 : WideString;
    Fd14 : WideString;
    Fd15 : WideString;
    Fd16 : WideString;
    Fd17 : WideString;
    Fd18 : WideString;
    Fd19 : WideString;
    Fd20 : WideString;
    Fd21 : WideString;
    Fd22 : WideString;
    Fd23 : WideString;
    Fd24 : WideString;
    Fd25 : WideString;
    Fd26 : WideString;
    Fd27 : WideString;
    Fd28 : WideString;
    Fd29 : WideString;
    Fd30 : WideString;
    Fd31 : WideString;
    Flastdayinmonth : Integer;
    Fperiodenplanwork : string;
    Fpossiblecountgen : TXSDecimal;

    FtechkartNumber : WideString;
    FtkTechcardName  : WideString;
    FtkMeasurementName : WideString;
    Ftktechcardnormoftime  : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dayWork : TXSDateTime read FdayWork write FdayWork;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property countgen : TXSDecimal read Fcountgen write Fcountgen;

    property planWorkItemRefCode : Integer read FplanWorkItemRefCode write FplanWorkItemRefCode;
    property planWorkItemRefCountGen : TXSDecimal read FplanWorkItemRefCountGen write FplanWorkItemRefCountGen;
    property planWorkItemRefTimeGen : TXSDecimal read FplanWorkItemRefTimeGen write FplanWorkItemRefTimeGen;
    property planWorkItemRefCostGen : TXSDecimal read FplanWorkItemRefCostGen write FplanWorkItemRefCostGen;
    property planWorkItemRefUserGen : WideString read FplanWorkItemRefUserGen write FplanWorkItemRefUserGen;
    property planWorkItemRefDateEdit : TXSDate read FplanWorkItemRefDateEdit write FplanWorkItemRefDateEdit;
    property planWorkRefCode : Integer read FplanWorkRefCode write FplanWorkRefCode;
    property planWorkRefDateGen : TXSDateTime read FplanWorkRefDateGen write FplanWorkRefDateGen;
    property planWorkRefDateStart : TXSDate read FplanWorkRefDateStart write FplanWorkRefDateStart;
    property planWorkRefDateFinal : TXSDate read FplanWorkRefDateFinal write FplanWorkRefDateFinal;
    property planWorkRefYearGen : Integer read FplanWorkRefYearGen write FplanWorkRefYearGen;
    property planWorkRefMonthGen : Integer read FplanWorkRefMonthGen write FplanWorkRefMonthGen;
    property planWorkRefYearOriginal : Integer read FplanWorkRefYearOriginal write FplanWorkRefYearOriginal;
    property planWorkRefMonthOriginal : Integer read FplanWorkRefMonthOriginal write FplanWorkRefMonthOriginal;
    property planWorkRefUserGen : WideString read FplanWorkRefUserGen write FplanWorkRefUserGen;
    property planWorkRefDateEdit : TXSDate read FplanWorkRefDateEdit write FplanWorkRefDateEdit;
    property planWorkRefWorkOrderNumber : WideString read FplanWorkRefWorkOrderNumber write FplanWorkRefWorkOrderNumber;
    property planWorkRefDateWorkOrder : TXSDate read FplanWorkRefDateWorkOrder write FplanWorkRefDateWorkOrder;
    property planWorkRefPriConnectionNumber : WideString read FplanWorkRefPriConnectionNumber write FplanWorkRefPriConnectionNumber;
    property planWorkRefDateEndPriConnection : TXSDate read FplanWorkRefDateEndPriConnection write FplanWorkRefDateEndPriConnection;
    property planWorkRefInvestWorksDescription : WideString read FplanWorkRefInvestWorksDescription write FplanWorkRefInvestWorksDescription;
    property planWorkRefServicesFSideFinId : Integer read FplanWorkRefServicesFSideFinId write FplanWorkRefServicesFSideFinId;
    property planWorkRefServicesFSideCnNum : WideString read FplanWorkRefServicesFSideCnNum write FplanWorkRefServicesFSideCnNum;
    property planWorkRefTotalTimeHours : TXSDecimal read FplanWorkRefTotalTimeHours write FplanWorkRefTotalTimeHours;
    property planWorkRefTotalTimeDays : TXSDecimal read FplanWorkRefTotalTimeDays write FplanWorkRefTotalTimeDays;
    property planWorkRefInvestItemNumber : WideString read FplanWorkRefInvestItemNumber write FplanWorkRefInvestItemNumber;

    property d1 : WideString read Fd1 write Fd1;
    property d2 : WideString read Fd2 write Fd2;
    property d3 : WideString read Fd3 write Fd3;
    property d4 : WideString read Fd4 write Fd4;
    property d5 : WideString read Fd5 write Fd5;
    property d6 : WideString read Fd6 write Fd6;
    property d7 : WideString read Fd7 write Fd7;
    property d8 : WideString read Fd8 write Fd8;
    property d9 : WideString read Fd9 write Fd9;
    property d10 : WideString read Fd10 write Fd10;
    property d11 : WideString read Fd11 write Fd11;
    property d12 : WideString read Fd12 write Fd12;
    property d13 : WideString read Fd13 write Fd13;
    property d14 : WideString read Fd14 write Fd14;
    property d15 : WideString read Fd15 write Fd15;
    property d16 : WideString read Fd16 write Fd16;
    property d17 : WideString read Fd17 write Fd17;
    property d18 : WideString read Fd18 write Fd18;
    property d19 : WideString read Fd19 write Fd19;
    property d20 : WideString read Fd20 write Fd20;
    property d21 : WideString read Fd21 write Fd21;
    property d22 : WideString read Fd22 write Fd22;
    property d23 : WideString read Fd23 write Fd23;
    property d24 : WideString read Fd24 write Fd24;
    property d25 : WideString read Fd25 write Fd25;
    property d26 : WideString read Fd26 write Fd26;
    property d27 : WideString read Fd27 write Fd27;
    property d28 : WideString read Fd28 write Fd28;
    property d29 : WideString read Fd29 write Fd29;
    property d30 : WideString read Fd30 write Fd30;
    property d31 : WideString read Fd31 write Fd31;
    property lastdayinmonth : Integer read Flastdayinmonth write Flastdayinmonth;
    property periodenplanwork : string read Fperiodenplanwork write Fperiodenplanwork;
    property possiblecountgen : TXSDecimal read Fpossiblecountgen write Fpossiblecountgen;


    property techkartNumber : WideString read FtechkartNumber write FtechkartNumber;
    property tkTechcardName  : WideString read FtkTechcardName write FtkTechcardName;
    property tkMeasurementName : WideString read FtkMeasurementName  write FtkMeasurementName;
    property tktechcardnormoftime  : TXSDecimal read Ftktechcardnormoftime write Ftktechcardnormoftime;
  end;

  ArrayOfENPlanWorkItem2GraphShort = array of ENPlanWorkItem2GraphShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItem2GraphShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItem2GraphShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItem2GraphShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkItem2GraphController/message/
  // soapAction: http://ksoe.org/ENPlanWorkItem2GraphController/action/ENPlanWorkItem2GraphController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkItem2GraphControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkItem2GraphController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItem2GraphControllerSoapPort = interface(IInvokable)
  ['{67F567B7-C036-4CB4-AB1C-F669C0E66715}']
    function add(const aENPlanWorkItem2Graph: ENPlanWorkItem2Graph): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkItem2Graph: ENPlanWorkItem2Graph); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanWorkItem2Graph; stdcall;
    function getList: ENPlanWorkItem2GraphShortList; stdcall;
    function getFilteredList(const aENPlanWorkItem2GraphFilter: ENPlanWorkItem2GraphFilter): ENPlanWorkItem2GraphShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2GraphShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWorkItem2GraphFilter: ENPlanWorkItem2GraphFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2GraphShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2GraphShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWorkItem2GraphFilter: ENPlanWorkItem2GraphFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWorkItem2GraphShort; stdcall;

    function getScrollableFilteredListGraph(const aENPlanWorkItem2GraphFilter: ENPlanWorkItem2GraphFilter): ENPlanWorkItem2GraphShortList; stdcall;

    // редактирование графика
    procedure editENPlanWorkItem2Graph(const eiShortList : ArrayOfENPlanWorkItem2GraphShort );stdcall;

    // создание
    procedure closePlanWorkWithParamsOnGraph(const planWorkСode : Integer;
                                             const masterCode : WideString;
                                             const masterName : WideString;
                                             const mechanicCode : WideString;
                                             const mechanicName : WideString );stdcall;

  end;


implementation

  destructor ENPlanWorkItem2Graph.Destroy;
  begin
    if Assigned(FdayWork) then
      dayWork.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fcountgen) then
      countgen.Free;
    if Assigned(FplanWorkItemRef) then
      planWorkItemRef.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWorkItem2GraphFilter.Destroy;
  begin
    if Assigned(FdayWork) then
      dayWork.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fcountgen) then
      countgen.Free;
    if Assigned(FplanWorkItemRef) then
      planWorkItemRef.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWorkItem2GraphFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWorkItem2GraphShort.Destroy;
  begin
    if Assigned(FdayWork) then
      dayWork.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fcountgen) then
      countgen.Free;
    if Assigned(FplanWorkItemRefCountGen) then
      planWorkItemRefCountGen.Free;
    if Assigned(FplanWorkItemRefTimeGen) then
      planWorkItemRefTimeGen.Free;
    if Assigned(FplanWorkItemRefCostGen) then
      planWorkItemRefCostGen.Free;
    if Assigned(FplanWorkItemRefDateEdit) then
      planWorkItemRefDateEdit.Free;
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
    if Assigned(FplanWorkRefDateEndPriConnection) then
      planWorkRefDateEndPriConnection.Free;
    if Assigned(FplanWorkRefTotalTimeHours) then
      planWorkRefTotalTimeHours.Free;
    if Assigned(FplanWorkRefTotalTimeDays) then
      planWorkRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENPlanWorkItem2GraphShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2Graph, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2Graph');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2GraphRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2GraphRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2GraphFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2GraphFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2GraphShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2GraphShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2GraphShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2GraphShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItem2GraphShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItem2GraphShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkItem2GraphControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2GraphController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkItem2GraphControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2GraphController/action/ENPlanWorkItem2GraphController.%operationName%');


end.
