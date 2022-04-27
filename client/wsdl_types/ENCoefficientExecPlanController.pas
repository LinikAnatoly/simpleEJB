unit ENCoefficientExecPlanController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENCoefficientExecPlan            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoefficientExecPlanRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoefficientExecPlan = class(TRemotable)
  private
    Fcode : Integer;
    Fcoefficient : TXSDecimal;
    FdateGen : TXSDateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property  finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
  end;

{
  ENCoefficientExecPlanFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fcoefficient : TXSDecimal;
    FdateGen : DateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : DateTime;
    property  finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
  end;
}

  ENCoefficientExecPlanFilter = class(ENCoefficientExecPlan)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCoefficientExecPlanShort = class(TRemotable)
  private
    Fcode : Integer;
    Fcoefficient : TXSDecimal;
    FdateGen : TXSDateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property  finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;

  end;

  ArrayOfENCoefficientExecPlanShort = array of ENCoefficientExecPlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCoefficientExecPlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCoefficientExecPlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCoefficientExecPlanShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCoefficientExecPlanController/message/
  // soapAction: http://ksoe.org/ENCoefficientExecPlanController/action/ENCoefficientExecPlanController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCoefficientExecPlanControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCoefficientExecPlanController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCoefficientExecPlanControllerSoapPort = interface(IInvokable)
  ['{59545954-5954-5954-5954-595459545954}']
    function add(const aENCoefficientExecPlan: ENCoefficientExecPlan): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCoefficientExecPlan: ENCoefficientExecPlan); stdcall;
    function getObject(const anObjectCode: Integer): ENCoefficientExecPlan; stdcall;
    function getList: ENCoefficientExecPlanShortList; stdcall;
    function getFilteredList(const aENCoefficientExecPlanFilter: ENCoefficientExecPlanFilter): ENCoefficientExecPlanShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientExecPlanShortList; stdcall;
    function getScrollableFilteredList(const aENCoefficientExecPlanFilter: ENCoefficientExecPlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientExecPlanShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientExecPlanShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCoefficientExecPlanFilter: ENCoefficientExecPlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCoefficientExecPlanShort; stdcall;
  end;


implementation

  destructor ENCoefficientExecPlan.Destroy;
  begin
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

{
  destructor ENCoefficientExecPlanFilter.Destroy;
  begin
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;
}

  destructor ENCoefficientExecPlanFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCoefficientExecPlanShort.Destroy;
  begin
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

  destructor ENCoefficientExecPlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCoefficientExecPlan, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientExecPlan');
  RemClassRegistry.RegisterXSClass(ENCoefficientExecPlanRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientExecPlanRef');
  RemClassRegistry.RegisterXSClass(ENCoefficientExecPlanFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientExecPlanFilter');
  RemClassRegistry.RegisterXSClass(ENCoefficientExecPlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientExecPlanShort');
  RemClassRegistry.RegisterXSClass(ENCoefficientExecPlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientExecPlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCoefficientExecPlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCoefficientExecPlanShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCoefficientExecPlanControllerSoapPort), 'http://ksoe.org/ENCoefficientExecPlanController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCoefficientExecPlanControllerSoapPort), 'http://ksoe.org/ENCoefficientExecPlanController/action/ENCoefficientExecPlanController.%operationName%');


end.
