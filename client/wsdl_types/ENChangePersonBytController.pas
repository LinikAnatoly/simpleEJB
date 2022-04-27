unit ENChangePersonBytController;

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

  ENChangePersonByt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENChangePersonBytRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENChangePersonByt = class(TRemotable)
  private
    Fcode : Integer;
    Ffio : WideString;
    FaccountNumber : WideString;
    FpackCode : Integer;
    FregistrationNumber : WideString;
    FregistrationDate : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property fio : WideString read Ffio write Ffio;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property  packCode : Integer read FpackCode write FpackCode;
    property registrationNumber : WideString read FregistrationNumber write FregistrationNumber;
    property registrationDate : TXSDate read FregistrationDate write FregistrationDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENChangePersonBytFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Ffio : WideString;
    FaccountNumber : WideString;
    FpackCode : Integer;
    FregistrationNumber : WideString;
    FregistrationDate : TXSDate;
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property fio : WideString read Ffio write Ffio;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property  packCode : Integer read FpackCode write FpackCode;
    property registrationNumber : WideString read FregistrationNumber write FregistrationNumber;
    property registrationDate : TXSDate read FregistrationDate write FregistrationDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENChangePersonBytFilter = class(ENChangePersonByt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENChangePersonBytShort = class(TRemotable)
  private
    Fcode : Integer;
    Ffio : WideString;
    FaccountNumber : WideString;
    FpackCode : Integer;
    FregistrationNumber : WideString;
    FregistrationDate : TXSDate;
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
    property fio : WideString read Ffio write Ffio;
    property accountNumber : WideString read FaccountNumber write FaccountNumber;
    property  packCode : Integer read FpackCode write FpackCode;
    property registrationNumber : WideString read FregistrationNumber write FregistrationNumber;
    property registrationDate : TXSDate read FregistrationDate write FregistrationDate;

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

  ArrayOfENChangePersonBytShort = array of ENChangePersonBytShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENChangePersonBytShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENChangePersonBytShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENChangePersonBytShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENChangePersonBytController/message/
  // soapAction: http://ksoe.org/ENChangePersonBytController/action/ENChangePersonBytController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENChangePersonBytControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENChangePersonBytController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENChangePersonBytControllerSoapPort = interface(IInvokable)
  ['{AD150654-6513-4FDD-9F34-EC9662384AD9}']
    function add(const aENChangePersonByt: ENChangePersonByt): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENChangePersonByt: ENChangePersonByt); stdcall;
    function getObject(const anObjectCode: Integer): ENChangePersonByt; stdcall;
    function getList: ENChangePersonBytShortList; stdcall;
    function getFilteredList(const aENChangePersonBytFilter: ENChangePersonBytFilter): ENChangePersonBytShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENChangePersonBytShortList; stdcall;
    function getScrollableFilteredList(const aENChangePersonBytFilter: ENChangePersonBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ENChangePersonBytShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENChangePersonBytShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENChangePersonBytFilter: ENChangePersonBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENChangePersonBytShort; stdcall;
  end;


implementation

  destructor ENChangePersonByt.Destroy;
  begin
    if Assigned(FregistrationDate) then
      registrationDate.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENChangePersonBytFilter.Destroy;
  begin
    if Assigned(FregistrationDate) then
      registrationDate.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENChangePersonBytFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENChangePersonBytShort.Destroy;
  begin
    if Assigned(FregistrationDate) then
      registrationDate.Free;
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

  destructor ENChangePersonBytShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENChangePersonByt, 'http://ksoe.org/EnergyproControllerService/type/', 'ENChangePersonByt');
  RemClassRegistry.RegisterXSClass(ENChangePersonBytRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENChangePersonBytRef');
  RemClassRegistry.RegisterXSClass(ENChangePersonBytFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENChangePersonBytFilter');
  RemClassRegistry.RegisterXSClass(ENChangePersonBytShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENChangePersonBytShort');
  RemClassRegistry.RegisterXSClass(ENChangePersonBytShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENChangePersonBytShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENChangePersonBytShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENChangePersonBytShort');

  InvRegistry.RegisterInterface(TypeInfo(ENChangePersonBytControllerSoapPort), 'http://ksoe.org/ENChangePersonBytController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENChangePersonBytControllerSoapPort), 'http://ksoe.org/ENChangePersonBytController/action/ENChangePersonBytController.%operationName%');


end.
