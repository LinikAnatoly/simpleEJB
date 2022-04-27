unit ENPlanWork2DecreeController;

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

  ENPlanWork2Decree            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2DecreeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2Decree = class(TRemotable)
  private
    Fcode : Integer;
    FdecreeCode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  decreeCode : Integer read FdecreeCode write FdecreeCode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENPlanWork2DecreeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdecreeCode : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  decreeCode : Integer read FdecreeCode write FdecreeCode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENPlanWork2DecreeFilter = class(ENPlanWork2Decree)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWork2DecreeShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FinvNumber : WideString;
    FelementName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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

    property invNumber : WideString read FinvNumber write FinvNumber;
    property elementName : WideString read FelementName write FelementName;
  end;

  ArrayOfENPlanWork2DecreeShort = array of ENPlanWork2DecreeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2DecreeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2DecreeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2DecreeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2DecreeController/message/
  // soapAction: http://ksoe.org/ENPlanWork2DecreeController/action/ENPlanWork2DecreeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2DecreeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2DecreeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2DecreeControllerSoapPort = interface(IInvokable)
  ['{4B90466D-B74F-41B0-9BFF-C227406AFCE4}']
    function add(const aENPlanWork2Decree: ENPlanWork2Decree): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2Decree: ENPlanWork2Decree); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanWork2Decree; stdcall;
    function getList: ENPlanWork2DecreeShortList; stdcall;
    function getFilteredList(const aENPlanWork2DecreeFilter: ENPlanWork2DecreeFilter): ENPlanWork2DecreeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2DecreeShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWork2DecreeFilter: ENPlanWork2DecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2DecreeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2DecreeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWork2DecreeFilter: ENPlanWork2DecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWork2DecreeShort; stdcall;
  end;


implementation

  destructor ENPlanWork2Decree.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWork2DecreeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWork2DecreeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWork2DecreeShort.Destroy;
  begin
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
    inherited Destroy;
  end;

  destructor ENPlanWork2DecreeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWork2Decree, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2Decree');
  RemClassRegistry.RegisterXSClass(ENPlanWork2DecreeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2DecreeRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2DecreeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2DecreeFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2DecreeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2DecreeShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2DecreeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2DecreeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2DecreeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2DecreeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2DecreeControllerSoapPort), 'http://ksoe.org/ENPlanWork2DecreeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2DecreeControllerSoapPort), 'http://ksoe.org/ENPlanWork2DecreeController/action/ENPlanWork2DecreeController.%operationName%');


end.
