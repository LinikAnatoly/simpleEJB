unit ENConnectionInstallationTypeController;

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

  ENConnectionInstallationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionInstallationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionInstallationType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;
  end;

{
  ENConnectionInstallationTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;
  end;
}

  ENConnectionInstallationTypeFilter = class(ENConnectionInstallationType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionInstallationTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcoef : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property coef : TXSDecimal read Fcoef write Fcoef;

  end;

  ArrayOfENConnectionInstallationTypeShort = array of ENConnectionInstallationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionInstallationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionInstallationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionInstallationTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionInstallationTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionInstallationTypeController/action/ENConnectionInstallationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionInstallationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionInstallationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionInstallationTypeControllerSoapPort = interface(IInvokable)
  ['{9E93BC71-DD75-49B7-A47D-2950BCF9472F}']
    function add(const aENConnectionInstallationType: ENConnectionInstallationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionInstallationType: ENConnectionInstallationType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionInstallationType; stdcall;
    function getList: ENConnectionInstallationTypeShortList; stdcall;
    function getFilteredList(const aENConnectionInstallationTypeFilter: ENConnectionInstallationTypeFilter): ENConnectionInstallationTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionInstallationTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionInstallationTypeFilter: ENConnectionInstallationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionInstallationTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionInstallationTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionInstallationTypeFilter: ENConnectionInstallationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionInstallationTypeShort; stdcall;
  end;


implementation

  destructor ENConnectionInstallationType.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

{
  destructor ENConnectionInstallationTypeFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;
}

  destructor ENConnectionInstallationTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENConnectionInstallationTypeShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

  destructor ENConnectionInstallationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionInstallationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionInstallationType');
  RemClassRegistry.RegisterXSClass(ENConnectionInstallationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionInstallationTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionInstallationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionInstallationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionInstallationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionInstallationTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionInstallationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionInstallationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionInstallationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionInstallationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionInstallationTypeControllerSoapPort), 'http://ksoe.org/ENConnectionInstallationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionInstallationTypeControllerSoapPort), 'http://ksoe.org/ENConnectionInstallationTypeController/action/ENConnectionInstallationTypeController.%operationName%');


end.
