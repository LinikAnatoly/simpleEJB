unit ENPlanProjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,TKProjectWorkController
  // ,EPVoltageNominalController
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

  ENPlanProject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProject = class(TRemotable)
  private
    Fcode : Integer;
    FnumberProject : WideString;
    FprojectCipher : WideString;
    FprojectName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
//???
    FprojectWorkRef : TKProjectWorkRef;
  
    Fvoltagenominal : EPVoltageNominal;
public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property projectCipher : WideString read FprojectCipher write FprojectCipher;
    property projectName : WideString read FprojectName write FprojectName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property projectWorkRef : TKProjectWorkRef read FprojectWorkRef write FprojectWorkRef;
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal;
  end;

{
  ENPlanProjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberProject : WideString;
    FprojectCipher : WideString;
    FprojectName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
//???
    FprojectWorkRef : TKProjectWorkRef;
    Fvoltagenominal : EPVoltageNominal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property projectCipher : WideString read FprojectCipher write FprojectCipher;
    property projectName : WideString read FprojectName write FprojectName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property projectWorkRef : TKProjectWorkRef read FprojectWorkRef write FprojectWorkRef;
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal;
  end;
}

  ENPlanProjectFilter = class(ENPlanProject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanProjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberProject : WideString;
    FprojectCipher : WideString;
    FprojectName : WideString;
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
    FprojectWorkRefCode : Integer;
    FvoltagenominalCode : Integer;
    FvoltagenominalValue : WideString;
 public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property projectCipher : WideString read FprojectCipher write FprojectCipher;
    property projectName : WideString read FprojectName write FprojectName;
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
    property projectWorkRefCode : Integer read FprojectWorkRefCode write FprojectWorkRefCode; //TKProjectWorkRef read FprojectWorkRefCode write FprojectWorkRefCode;
 property voltagenominalCode : Integer read FvoltagenominalCode write FvoltagenominalCode;
    property voltagenominalValue : WideString read FvoltagenominalValue write FvoltagenominalValue;
  end;

  ArrayOfENPlanProjectShort = array of ENPlanProjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanProjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanProjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanProjectShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanProjectController/message/
  // soapAction: http://ksoe.org/ENPlanProjectController/action/ENPlanProjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanProjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanProjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanProjectControllerSoapPort = interface(IInvokable)
  ['{4E2FA12E-6EE9-4CCA-9974-6BB78BF40EE2}']
    function add(const aENPlanProject: ENPlanProject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanProject: ENPlanProject); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanProject; stdcall;
    function getList: ENPlanProjectShortList; stdcall;
    function getFilteredList(const aENPlanProjectFilter: ENPlanProjectFilter): ENPlanProjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectShortList; stdcall;
    function getScrollableFilteredList(const aENPlanProjectFilter: ENPlanProjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanProjectFilter: ENPlanProjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanProjectShort; stdcall;

    function generateenplanprojecttemplate(const aENPlanProject: ENPlanProject): Integer; stdcall;
    function generatecipher(const aENPlanProject: ENPlanProject): String; stdcall;

    function generateprojectname(const aENPlanProject: ENPlanProject): String; stdcall;
  end;


implementation

  destructor ENPlanProject.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FprojectWorkRef) then
      projectWorkRef.Free;
 if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanProjectFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FprojectWorkRef) then
      projectWorkRef.Free;
if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanProjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanProjectShort.Destroy;
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

  destructor ENPlanProjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanProject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProject');
  RemClassRegistry.RegisterXSClass(ENPlanProjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectRef');
  RemClassRegistry.RegisterXSClass(ENPlanProjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectFilter');
  RemClassRegistry.RegisterXSClass(ENPlanProjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectShort');
  RemClassRegistry.RegisterXSClass(ENPlanProjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanProjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanProjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanProjectControllerSoapPort), 'http://ksoe.org/ENPlanProjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanProjectControllerSoapPort), 'http://ksoe.org/ENPlanProjectController/action/ENPlanProjectController.%operationName%');


end.
