unit ENCoefficientQualityStandardsController;

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

  ENCoefficientQualityStandards            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoefficientQualityStandardsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCoefficientQualityStandards = class(TRemotable)
  private
    Fcode : Integer;
    Fsumma : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FdateGen : TXSDateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
  end;

{
  ENCoefficientQualityStandardsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fsumma : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FdateGen : DateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : DateTime;
    property finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
  end;
}

  ENCoefficientQualityStandardsFilter = class(ENCoefficientQualityStandards)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCoefficientQualityStandardsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fsumma : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FdateGen : TXSDateTime;
    FfinPodrCode : Integer;
    FaxOrgId : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property  finPodrCode : Integer read FfinPodrCode write FfinPodrCode;
    property axOrgId : WideString read FaxOrgId write FaxOrgId;

  end;

  ArrayOfENCoefficientQualityStandardsShort = array of ENCoefficientQualityStandardsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCoefficientQualityStandardsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCoefficientQualityStandardsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCoefficientQualityStandardsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCoefficientQualityStandardsController/message/
  // soapAction: http://ksoe.org/ENCoefficientQualityStandardsController/action/ENCoefficientQualityStandardsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCoefficientQualityStandardsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCoefficientQualityStandardsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCoefficientQualityStandardsControllerSoapPort = interface(IInvokable)
  ['{EFFD6440-4D8A-40BF-AD7F-75C3818A6509}']
    function add(const aENCoefficientQualityStandards: ENCoefficientQualityStandards): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCoefficientQualityStandards: ENCoefficientQualityStandards); stdcall;
    function getObject(const anObjectCode: Integer): ENCoefficientQualityStandards; stdcall;
    function getList: ENCoefficientQualityStandardsShortList; stdcall;
    function getFilteredList(const aENCoefficientQualityStandardsFilter: ENCoefficientQualityStandardsFilter): ENCoefficientQualityStandardsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientQualityStandardsShortList; stdcall;
    function getScrollableFilteredList(const aENCoefficientQualityStandardsFilter: ENCoefficientQualityStandardsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientQualityStandardsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCoefficientQualityStandardsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCoefficientQualityStandardsFilter: ENCoefficientQualityStandardsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCoefficientQualityStandardsShort; stdcall;
  end;


implementation

  destructor ENCoefficientQualityStandards.Destroy;
  begin
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

{
  destructor ENCoefficientQualityStandardsFilter.Destroy;
  begin
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;
}

  destructor ENCoefficientQualityStandardsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCoefficientQualityStandardsShort.Destroy;
  begin
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

  destructor ENCoefficientQualityStandardsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCoefficientQualityStandards, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientQualityStandards');
  RemClassRegistry.RegisterXSClass(ENCoefficientQualityStandardsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientQualityStandardsRef');
  RemClassRegistry.RegisterXSClass(ENCoefficientQualityStandardsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientQualityStandardsFilter');
  RemClassRegistry.RegisterXSClass(ENCoefficientQualityStandardsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientQualityStandardsShort');
  RemClassRegistry.RegisterXSClass(ENCoefficientQualityStandardsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCoefficientQualityStandardsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCoefficientQualityStandardsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCoefficientQualityStandardsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCoefficientQualityStandardsControllerSoapPort), 'http://ksoe.org/ENCoefficientQualityStandardsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCoefficientQualityStandardsControllerSoapPort), 'http://ksoe.org/ENCoefficientQualityStandardsController/action/ENCoefficientQualityStandardsController.%operationName%');


end.
