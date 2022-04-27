unit ENServFromSide2PlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesFromSideObjectController
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

  ENServFromSide2PlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServFromSide2PlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServFromSide2PlanWork = class(TRemotable)
  private
    Fcode : Integer;
//???
    FservFromSideRef : ENServicesFromSideObjectRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property servFromSideRef : ENServicesFromSideObjectRef read FservFromSideRef write FservFromSideRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENServFromSide2PlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FservFromSideRef : ENServicesFromSideObjectRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property servFromSideRef : ENServicesFromSideObjectRef read FservFromSideRef write FservFromSideRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENServFromSide2PlanWorkFilter = class(ENServFromSide2PlanWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServFromSide2PlanWorkShort = class(TRemotable)
  private
    Fcode : Integer;
    FservFromSideRefCode : Integer;
    FservFromSideRefContractNumber : WideString;
    FservFromSideRefContractDate : TXSDate;
    FservFromSideRefName : WideString;
    FservFromSideRefPartnerCode : WideString;
    FservFromSideRefFinDocCode : WideString;
    FservFromSideRefFinDocID : Integer;
    FservFromSideRefCommentGen : WideString;
    FservFromSideRefUserGen : WideString;
    FservFromSideRefDateEdit : TXSDate;
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

    property servFromSideRefCode : Integer read FservFromSideRefCode write FservFromSideRefCode;
    property servFromSideRefContractNumber : WideString read FservFromSideRefContractNumber write FservFromSideRefContractNumber;
    property servFromSideRefContractDate : TXSDate read FservFromSideRefContractDate write FservFromSideRefContractDate;
    property servFromSideRefName : WideString read FservFromSideRefName write FservFromSideRefName;
    property servFromSideRefPartnerCode : WideString read FservFromSideRefPartnerCode write FservFromSideRefPartnerCode;
    property servFromSideRefFinDocCode : WideString read FservFromSideRefFinDocCode write FservFromSideRefFinDocCode;
    property servFromSideRefFinDocID : Integer read FservFromSideRefFinDocID write FservFromSideRefFinDocID;
    property servFromSideRefCommentGen : WideString read FservFromSideRefCommentGen write FservFromSideRefCommentGen;
    property servFromSideRefUserGen : WideString read FservFromSideRefUserGen write FservFromSideRefUserGen;
    property servFromSideRefDateEdit : TXSDate read FservFromSideRefDateEdit write FservFromSideRefDateEdit;
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

  ArrayOfENServFromSide2PlanWorkShort = array of ENServFromSide2PlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServFromSide2PlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServFromSide2PlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServFromSide2PlanWorkShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServFromSide2PlanWorkController/message/
  // soapAction: http://ksoe.org/ENServFromSide2PlanWorkController/action/ENServFromSide2PlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServFromSide2PlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServFromSide2PlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServFromSide2PlanWorkControllerSoapPort = interface(IInvokable)
  ['{A0EDE104-5A70-4EAA-8D5A-CFA7226A4E46}']
    function add(const aENServFromSide2PlanWork: ENServFromSide2PlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServFromSide2PlanWork: ENServFromSide2PlanWork); stdcall;
    function getObject(const anObjectCode: Integer): ENServFromSide2PlanWork; stdcall;
    function getList: ENServFromSide2PlanWorkShortList; stdcall;
    function getFilteredList(const aENServFromSide2PlanWorkFilter: ENServFromSide2PlanWorkFilter): ENServFromSide2PlanWorkShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServFromSide2PlanWorkShortList; stdcall;
    function getScrollableFilteredList(const aENServFromSide2PlanWorkFilter: ENServFromSide2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServFromSide2PlanWorkShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServFromSide2PlanWorkShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServFromSide2PlanWorkFilter: ENServFromSide2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServFromSide2PlanWorkShort; stdcall;
  end;


implementation

  destructor ENServFromSide2PlanWork.Destroy;
  begin
    if Assigned(FservFromSideRef) then
      servFromSideRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServFromSide2PlanWorkFilter.Destroy;
  begin
    if Assigned(FservFromSideRef) then
      servFromSideRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServFromSide2PlanWorkFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServFromSide2PlanWorkShort.Destroy;
  begin
    if Assigned(FservFromSideRefContractDate) then
      servFromSideRefContractDate.Free;
    if Assigned(FservFromSideRefDateEdit) then
      servFromSideRefDateEdit.Free;
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

  destructor ENServFromSide2PlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServFromSide2PlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSide2PlanWork');
  RemClassRegistry.RegisterXSClass(ENServFromSide2PlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSide2PlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENServFromSide2PlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSide2PlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENServFromSide2PlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSide2PlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENServFromSide2PlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSide2PlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServFromSide2PlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServFromSide2PlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServFromSide2PlanWorkControllerSoapPort), 'http://ksoe.org/ENServFromSide2PlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServFromSide2PlanWorkControllerSoapPort), 'http://ksoe.org/ENServFromSide2PlanWorkController/action/ENServFromSide2PlanWorkController.%operationName%');


end.
