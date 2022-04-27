unit ENPlanWork2ActFailureController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,ENActFailureController
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

  ENPlanWork2ActFailure            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2ActFailureRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2ActFailure = class(TRemotable)
  private
    Fcode : Integer;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactFailureRef : ENActFailureRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property actFailureRef : ENActFailureRef read FactFailureRef write FactFailureRef;
  end;

{
  ENPlanWork2ActFailureFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FplanRef : ENPlanWorkRef;
//???
    FactFailureRef : ENActFailureRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property actFailureRef : ENActFailureRef read FactFailureRef write FactFailureRef;
  end;
}

  ENPlanWork2ActFailureFilter = class(ENPlanWork2ActFailure)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWork2ActFailureShort = class(TRemotable)
  private
    Fcode : Integer;
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
    FactFailureRefCode : Integer;
    FactFailureRefNumberGen : WideString;
    FactFailureRefDateAct : TXSDateTime;
    FactFailureRefCommentGen : WideString;
    FactFailureRefUserAdd : WideString;
    FactFailureRefDateAdd : TXSDateTime;
    FactFailureRefUserGen : WideString;
    FactFailureRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

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
    property actFailureRefCode : Integer read FactFailureRefCode write FactFailureRefCode;
    property actFailureRefNumberGen : WideString read FactFailureRefNumberGen write FactFailureRefNumberGen;
    property actFailureRefDateAct : TXSDateTime read FactFailureRefDateAct write FactFailureRefDateAct;
    property actFailureRefCommentGen : WideString read FactFailureRefCommentGen write FactFailureRefCommentGen;
    property actFailureRefUserAdd : WideString read FactFailureRefUserAdd write FactFailureRefUserAdd;
    property actFailureRefDateAdd : TXSDateTime read FactFailureRefDateAdd write FactFailureRefDateAdd;
    property actFailureRefUserGen : WideString read FactFailureRefUserGen write FactFailureRefUserGen;
    property actFailureRefDateEdit : TXSDateTime read FactFailureRefDateEdit write FactFailureRefDateEdit;
  end;

  ArrayOfENPlanWork2ActFailureShort = array of ENPlanWork2ActFailureShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2ActFailureShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2ActFailureShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2ActFailureShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2ActFailureController/message/
  // soapAction: http://ksoe.org/ENPlanWork2ActFailureController/action/ENPlanWork2ActFailureController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2ActFailureControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2ActFailureController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2ActFailureControllerSoapPort = interface(IInvokable)
 ['{B51804AC-1490-4A2B-B19A-BC338E4B7B70}']
    function add(const aENPlanWork2ActFailure: ENPlanWork2ActFailure): Integer; stdcall; overload;
    function add(const aENPlanWork2ActFailure: ENPlanWork2ActFailure; aENActFailure : ENActFailure): Integer; stdcall;  overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2ActFailure: ENPlanWork2ActFailure); stdcall; overload;
    procedure save(const aENPlanWork2ActFailure: ENPlanWork2ActFailure; aENActFailure : ENActFailure ); stdcall;  overload;
    function getObject(const anObjectCode: Integer): ENPlanWork2ActFailure; stdcall;
    function getList: ENPlanWork2ActFailureShortList; stdcall;
    function getFilteredList(const aENPlanWork2ActFailureFilter: ENPlanWork2ActFailureFilter): ENPlanWork2ActFailureShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ActFailureShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWork2ActFailureFilter: ENPlanWork2ActFailureFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ActFailureShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2ActFailureShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWork2ActFailureFilter: ENPlanWork2ActFailureFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWork2ActFailureShort; stdcall;
  end;


implementation

  destructor ENPlanWork2ActFailure.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactFailureRef) then
      actFailureRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWork2ActFailureFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FactFailureRef) then
      actFailureRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWork2ActFailureFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWork2ActFailureShort.Destroy;
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
    if Assigned(FactFailureRefDateAct) then
      actFailureRefDateAct.Free;
    if Assigned(FactFailureRefDateAdd) then
      actFailureRefDateAdd.Free;
    if Assigned(FactFailureRefDateEdit) then
      actFailureRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPlanWork2ActFailureShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWork2ActFailure, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ActFailure');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ActFailureRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ActFailureRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ActFailureFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ActFailureFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ActFailureShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ActFailureShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2ActFailureShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2ActFailureShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2ActFailureShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2ActFailureShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2ActFailureControllerSoapPort), 'http://ksoe.org/ENPlanWork2ActFailureController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2ActFailureControllerSoapPort), 'http://ksoe.org/ENPlanWork2ActFailureController/action/ENPlanWork2ActFailureController.%operationName%');


end.
