unit ENInvestProgram2PlanController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENInvestProgramController
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

  ENInvestProgram2Plan            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgram2PlanRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgram2Plan = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FinvestProgramRef : ENInvestProgramRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property investProgramRef : ENInvestProgramRef read FinvestProgramRef write FinvestProgramRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENInvestProgram2PlanFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FinvestProgramRef : ENInvestProgramRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property investProgramRef : ENInvestProgramRef read FinvestProgramRef write FinvestProgramRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENInvestProgram2PlanFilter = class(ENInvestProgram2Plan)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInvestProgram2PlanShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FinvestProgramRefCode : Integer;
    FinvestProgramRefName : WideString;
    FinvestProgramRefYearGen : Integer;
    FinvestProgramRefCommentGen : WideString;
    FinvestProgramRefCountGen : TXSDecimal;
    FinvestProgramRefPrice : TXSDecimal;
    FinvestProgramRefSumGen : TXSDecimal;
    FinvestProgramRefQuarter1count : TXSDecimal;
    FinvestProgramRefQuarter1sum : TXSDecimal;
    FinvestProgramRefQuarter2count : TXSDecimal;
    FinvestProgramRefQuarter2sum : TXSDecimal;
    FinvestProgramRefQuarter3count : TXSDecimal;
    FinvestProgramRefQuarter3sum : TXSDecimal;
    FinvestProgramRefQuarter4count : TXSDecimal;
    FinvestProgramRefQuarter4sum : TXSDecimal;
    FinvestProgramRefUserAdd : WideString;
    FinvestProgramRefDateAdd : TXSDateTime;
    FinvestProgramRefUserGen : WideString;
    FinvestProgramRefDateEdit : TXSDateTime;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property investProgramRefCode : Integer read FinvestProgramRefCode write FinvestProgramRefCode;
    property investProgramRefName : WideString read FinvestProgramRefName write FinvestProgramRefName;
    property investProgramRefYearGen : Integer read FinvestProgramRefYearGen write FinvestProgramRefYearGen;
    property investProgramRefCommentGen : WideString read FinvestProgramRefCommentGen write FinvestProgramRefCommentGen;
    property investProgramRefCountGen : TXSDecimal read FinvestProgramRefCountGen write FinvestProgramRefCountGen;
    property investProgramRefPrice : TXSDecimal read FinvestProgramRefPrice write FinvestProgramRefPrice;
    property investProgramRefSumGen : TXSDecimal read FinvestProgramRefSumGen write FinvestProgramRefSumGen;
    property investProgramRefQuarter1count : TXSDecimal read FinvestProgramRefQuarter1count write FinvestProgramRefQuarter1count;
    property investProgramRefQuarter1sum : TXSDecimal read FinvestProgramRefQuarter1sum write FinvestProgramRefQuarter1sum;
    property investProgramRefQuarter2count : TXSDecimal read FinvestProgramRefQuarter2count write FinvestProgramRefQuarter2count;
    property investProgramRefQuarter2sum : TXSDecimal read FinvestProgramRefQuarter2sum write FinvestProgramRefQuarter2sum;
    property investProgramRefQuarter3count : TXSDecimal read FinvestProgramRefQuarter3count write FinvestProgramRefQuarter3count;
    property investProgramRefQuarter3sum : TXSDecimal read FinvestProgramRefQuarter3sum write FinvestProgramRefQuarter3sum;
    property investProgramRefQuarter4count : TXSDecimal read FinvestProgramRefQuarter4count write FinvestProgramRefQuarter4count;
    property investProgramRefQuarter4sum : TXSDecimal read FinvestProgramRefQuarter4sum write FinvestProgramRefQuarter4sum;
    property investProgramRefUserAdd : WideString read FinvestProgramRefUserAdd write FinvestProgramRefUserAdd;
    property investProgramRefDateAdd : TXSDateTime read FinvestProgramRefDateAdd write FinvestProgramRefDateAdd;
    property investProgramRefUserGen : WideString read FinvestProgramRefUserGen write FinvestProgramRefUserGen;
    property investProgramRefDateEdit : TXSDateTime read FinvestProgramRefDateEdit write FinvestProgramRefDateEdit;
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
  end;

  ArrayOfENInvestProgram2PlanShort = array of ENInvestProgram2PlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestProgram2PlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestProgram2PlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestProgram2PlanShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestProgram2PlanController/message/
  // soapAction: http://ksoe.org/ENInvestProgram2PlanController/action/ENInvestProgram2PlanController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestProgram2PlanControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestProgram2PlanController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestProgram2PlanControllerSoapPort = interface(IInvokable)
  ['{254a254a-254a-254a-254a-254a254a254a}']
    function add(const aENInvestProgram2Plan: ENInvestProgram2Plan): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestProgram2Plan: ENInvestProgram2Plan); stdcall;
    function getObject(const anObjectCode: Integer): ENInvestProgram2Plan; stdcall;
    function getList: ENInvestProgram2PlanShortList; stdcall;
    function getFilteredList(const aENInvestProgram2PlanFilter: ENInvestProgram2PlanFilter): ENInvestProgram2PlanShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgram2PlanShortList; stdcall;
    function getScrollableFilteredList(const aENInvestProgram2PlanFilter: ENInvestProgram2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgram2PlanShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgram2PlanShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInvestProgram2PlanFilter: ENInvestProgram2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInvestProgram2PlanShort; stdcall;
  end;


implementation

  destructor ENInvestProgram2Plan.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRef) then
      investProgramRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENInvestProgram2PlanFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRef) then
      investProgramRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENInvestProgram2PlanFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENInvestProgram2PlanShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRefCountGen) then
      investProgramRefCountGen.Free;
    if Assigned(FinvestProgramRefPrice) then
      investProgramRefPrice.Free;
    if Assigned(FinvestProgramRefSumGen) then
      investProgramRefSumGen.Free;
    if Assigned(FinvestProgramRefQuarter1count) then
      investProgramRefQuarter1count.Free;
    if Assigned(FinvestProgramRefQuarter1sum) then
      investProgramRefQuarter1sum.Free;
    if Assigned(FinvestProgramRefQuarter2count) then
      investProgramRefQuarter2count.Free;
    if Assigned(FinvestProgramRefQuarter2sum) then
      investProgramRefQuarter2sum.Free;
    if Assigned(FinvestProgramRefQuarter3count) then
      investProgramRefQuarter3count.Free;
    if Assigned(FinvestProgramRefQuarter3sum) then
      investProgramRefQuarter3sum.Free;
    if Assigned(FinvestProgramRefQuarter4count) then
      investProgramRefQuarter4count.Free;
    if Assigned(FinvestProgramRefQuarter4sum) then
      investProgramRefQuarter4sum.Free;
    if Assigned(FinvestProgramRefDateAdd) then
      investProgramRefDateAdd.Free;
    if Assigned(FinvestProgramRefDateEdit) then
      investProgramRefDateEdit.Free;
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

  destructor ENInvestProgram2PlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestProgram2Plan, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram2Plan');
  RemClassRegistry.RegisterXSClass(ENInvestProgram2PlanRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram2PlanRef');
  RemClassRegistry.RegisterXSClass(ENInvestProgram2PlanFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram2PlanFilter');
  RemClassRegistry.RegisterXSClass(ENInvestProgram2PlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram2PlanShort');
  RemClassRegistry.RegisterXSClass(ENInvestProgram2PlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram2PlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestProgram2PlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestProgram2PlanShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestProgram2PlanControllerSoapPort), 'http://ksoe.org/ENInvestProgram2PlanController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestProgram2PlanControllerSoapPort), 'http://ksoe.org/ENInvestProgram2PlanController/action/ENInvestProgram2PlanController.%operationName%');


end.
