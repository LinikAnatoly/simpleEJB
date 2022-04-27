unit ENPlanProjectTemplateController;

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

  ENPlanProjectTemplate            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProjectTemplateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProjectTemplate = class(TRemotable)
  private
    Fcode : Integer;
    Ftag : WideString;
    FelementName : WideString;
    Felementcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property tag : WideString read Ftag write Ftag;
    property elementName : WideString read FelementName write FelementName;
    property elementcode : Integer read Felementcode write Felementcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENPlanProjectTemplateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Ftag : WideString;
    FelementName : WideString;
    Felementcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property tag : WideString read Ftag write Ftag;
    property elementName : WideString read FelementName write FelementName;
    property elementcode : Integer read Felementcode write Felementcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENPlanProjectTemplateFilter = class(ENPlanProjectTemplate)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanProjectTemplateShort = class(TRemotable)
  private
    Fcode : Integer;
    Ftag : WideString;
    FelementName : WideString;
    Felementcode : Integer;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property tag : WideString read Ftag write Ftag;
    property elementName : WideString read FelementName write FelementName;
    property  elementcode : Integer read Felementcode write Felementcode;
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
  end;

  ArrayOfENPlanProjectTemplateShort = array of ENPlanProjectTemplateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanProjectTemplateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanProjectTemplateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanProjectTemplateShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanProjectTemplateController/message/
  // soapAction: http://ksoe.org/ENPlanProjectTemplateController/action/ENPlanProjectTemplateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanProjectTemplateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanProjectTemplateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanProjectTemplateControllerSoapPort = interface(IInvokable)
  ['{C72DB851-DAC9-47B0-B09F-BA3214FF0854}']
    function add(const aENPlanProjectTemplate: ENPlanProjectTemplate): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanProjectTemplate: ENPlanProjectTemplate); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanProjectTemplate; stdcall;
    function getList: ENPlanProjectTemplateShortList; stdcall;
    function getFilteredList(const aENPlanProjectTemplateFilter: ENPlanProjectTemplateFilter): ENPlanProjectTemplateShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectTemplateShortList; stdcall;
    function getScrollableFilteredList(const aENPlanProjectTemplateFilter: ENPlanProjectTemplateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectTemplateShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectTemplateShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanProjectTemplateFilter: ENPlanProjectTemplateFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanProjectTemplateShort; stdcall;
  end;


implementation

  destructor ENPlanProjectTemplate.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanProjectTemplateFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanProjectTemplateFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanProjectTemplateShort.Destroy;
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

  destructor ENPlanProjectTemplateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanProjectTemplate, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectTemplate');
  RemClassRegistry.RegisterXSClass(ENPlanProjectTemplateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectTemplateRef');
  RemClassRegistry.RegisterXSClass(ENPlanProjectTemplateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectTemplateFilter');
  RemClassRegistry.RegisterXSClass(ENPlanProjectTemplateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectTemplateShort');
  RemClassRegistry.RegisterXSClass(ENPlanProjectTemplateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectTemplateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanProjectTemplateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanProjectTemplateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanProjectTemplateControllerSoapPort), 'http://ksoe.org/ENPlanProjectTemplateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanProjectTemplateControllerSoapPort), 'http://ksoe.org/ENPlanProjectTemplateController/action/ENPlanProjectTemplateController.%operationName%');


end.
