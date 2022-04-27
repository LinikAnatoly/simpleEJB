unit ENConnectionPowerPointController;

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

  ENConnectionPowerPoint            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionPowerPointRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionPowerPoint = class(TRemotable)
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
  ENConnectionPowerPointFilter = class(TRemotable)
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

  ENConnectionPowerPointFilter = class(ENConnectionPowerPoint)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionPowerPointShort = class(TRemotable)
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

  ArrayOfENConnectionPowerPointShort = array of ENConnectionPowerPointShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionPowerPointShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionPowerPointShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionPowerPointShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionPowerPointController/message/
  // soapAction: http://ksoe.org/ENConnectionPowerPointController/action/ENConnectionPowerPointController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionPowerPointControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionPowerPointController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionPowerPointControllerSoapPort = interface(IInvokable)
  ['{599A00B7-3383-4DE0-8F79-0306542B4C69}']
    function add(const aENConnectionPowerPoint: ENConnectionPowerPoint): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionPowerPoint: ENConnectionPowerPoint); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionPowerPoint; stdcall;
    function getList: ENConnectionPowerPointShortList; stdcall;
    function getFilteredList(const aENConnectionPowerPointFilter: ENConnectionPowerPointFilter): ENConnectionPowerPointShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPowerPointShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionPowerPointFilter: ENConnectionPowerPointFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPowerPointShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionPowerPointShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionPowerPointFilter: ENConnectionPowerPointFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionPowerPointShort; stdcall;
  end;


implementation

  destructor ENConnectionPowerPoint.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

{
  destructor ENConnectionPowerPointFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;
}

  destructor ENConnectionPowerPointFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENConnectionPowerPointShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

  destructor ENConnectionPowerPointShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionPowerPoint, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPowerPoint');
  RemClassRegistry.RegisterXSClass(ENConnectionPowerPointRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPowerPointRef');
  RemClassRegistry.RegisterXSClass(ENConnectionPowerPointFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPowerPointFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionPowerPointShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPowerPointShort');
  RemClassRegistry.RegisterXSClass(ENConnectionPowerPointShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionPowerPointShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionPowerPointShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionPowerPointShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionPowerPointControllerSoapPort), 'http://ksoe.org/ENConnectionPowerPointController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionPowerPointControllerSoapPort), 'http://ksoe.org/ENConnectionPowerPointController/action/ENConnectionPowerPointController.%operationName%');


end.
