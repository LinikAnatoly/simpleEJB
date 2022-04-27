unit ENPlanProjectCalculationController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKProjectWorkCalculationController
   ,ENPlanProjectController
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

  ENPlanProjectCalculation            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProjectCalculationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanProjectCalculation = class(TRemotable)
  private
    Fcode : Integer;
//???
    FtkProjWorkCalculation : TKProjectWorkCalculation;
//???
    FprojectWorkRef : ENPlanProjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property tkProjWorkCalculation : TKProjectWorkCalculation read FtkProjWorkCalculation write FtkProjWorkCalculation;
    property projectWorkRef : ENPlanProjectRef read FprojectWorkRef write FprojectWorkRef;
  end;

{
  ENPlanProjectCalculationFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FtkProjWorkCalculation : TKProjectWorkCalculation;
//???
    FprojectWorkRef : ENPlanProjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property tkProjWorkCalculation : TKProjectWorkCalculation read FtkProjWorkCalculation write FtkProjWorkCalculation;
    property projectWorkRef : ENPlanProjectRef read FprojectWorkRef write FprojectWorkRef;
  end;
}

  ENPlanProjectCalculationFilter = class(ENPlanProjectCalculation)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanProjectCalculationShort = class(TRemotable)
  private
    Fcode : Integer;
    FtkProjWorkCalculationCode : Integer;
    FtkProjWorkCalculationName : WideString;
    FprojectWorkRefCode : Integer;
    FprojectWorkRefProjectCipher : WideString;
    FprojectWorkRefProjectName : WideString;
    FprojectWorkRefUserGen : WideString;
    FprojectWorkRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property tkProjWorkCalculationCode : Integer read FtkProjWorkCalculationCode write FtkProjWorkCalculationCode;
    property tkProjWorkCalculationName : WideString read FtkProjWorkCalculationName write FtkProjWorkCalculationName;
    property projectWorkRefCode : Integer read FprojectWorkRefCode write FprojectWorkRefCode;
    property projectWorkRefProjectCipher : WideString read FprojectWorkRefProjectCipher write FprojectWorkRefProjectCipher;
    property projectWorkRefProjectName : WideString read FprojectWorkRefProjectName write FprojectWorkRefProjectName;
    property projectWorkRefUserGen : WideString read FprojectWorkRefUserGen write FprojectWorkRefUserGen;
    property projectWorkRefDateEdit : TXSDateTime read FprojectWorkRefDateEdit write FprojectWorkRefDateEdit;
  end;

  ArrayOfENPlanProjectCalculationShort = array of ENPlanProjectCalculationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanProjectCalculationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanProjectCalculationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanProjectCalculationShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanProjectCalculationController/message/
  // soapAction: http://ksoe.org/ENPlanProjectCalculationController/action/ENPlanProjectCalculationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanProjectCalculationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanProjectCalculationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanProjectCalculationControllerSoapPort = interface(IInvokable)
  ['{AEB208E6-193A-4F8F-BBFE-97E9DD3D057C}']
    function add(const aENPlanProjectCalculation: ENPlanProjectCalculation): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanProjectCalculation: ENPlanProjectCalculation); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanProjectCalculation; stdcall;
    function getList: ENPlanProjectCalculationShortList; stdcall;
    function getFilteredList(const aENPlanProjectCalculationFilter: ENPlanProjectCalculationFilter): ENPlanProjectCalculationShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectCalculationShortList; stdcall;
    function getScrollableFilteredList(const aENPlanProjectCalculationFilter: ENPlanProjectCalculationFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectCalculationShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanProjectCalculationShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanProjectCalculationFilter: ENPlanProjectCalculationFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanProjectCalculationShort; stdcall;

    procedure addCalculationList(const planProjCalcList : ENPlanProjectCalculationShortList);  stdcall;
  end;


implementation

  destructor ENPlanProjectCalculation.Destroy;
  begin
    if Assigned(FtkProjWorkCalculation) then
      tkProjWorkCalculation.Free;
    if Assigned(FprojectWorkRef) then
      projectWorkRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanProjectCalculationFilter.Destroy;
  begin
    if Assigned(FtkProjWorkCalculation) then
      tkProjWorkCalculation.Free;
    if Assigned(FprojectWorkRef) then
      projectWorkRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanProjectCalculationFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanProjectCalculationShort.Destroy;
  begin
    if Assigned(FprojectWorkRefDateEdit) then
      projectWorkRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPlanProjectCalculationShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanProjectCalculation, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectCalculation');
  RemClassRegistry.RegisterXSClass(ENPlanProjectCalculationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectCalculationRef');
  RemClassRegistry.RegisterXSClass(ENPlanProjectCalculationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectCalculationFilter');
  RemClassRegistry.RegisterXSClass(ENPlanProjectCalculationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectCalculationShort');
  RemClassRegistry.RegisterXSClass(ENPlanProjectCalculationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanProjectCalculationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanProjectCalculationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanProjectCalculationShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanProjectCalculationControllerSoapPort), 'http://ksoe.org/ENPlanProjectCalculationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanProjectCalculationControllerSoapPort), 'http://ksoe.org/ENPlanProjectCalculationController/action/ENPlanProjectCalculationController.%operationName%');


end.
