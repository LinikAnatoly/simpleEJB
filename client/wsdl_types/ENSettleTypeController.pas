unit ENSettleTypeController;

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

  ENSettleType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettleTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettleType = class(TRemotable)
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
  ENSettleTypeFilter = class(TRemotable)
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

  ENSettleTypeFilter = class(ENSettleType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSettleTypeShort = class(TRemotable)
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

  ArrayOfENSettleTypeShort = array of ENSettleTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSettleTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSettleTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSettleTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSettleTypeController/message/
  // soapAction: http://ksoe.org/ENSettleTypeController/action/ENSettleTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSettleTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSettleTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSettleTypeControllerSoapPort = interface(IInvokable)
  ['{F73FC4B2-2B2C-4899-9F01-26ACF5905A8D}']
    function add(const aENSettleType: ENSettleType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSettleType: ENSettleType); stdcall;
    function getObject(const anObjectCode: Integer): ENSettleType; stdcall;
    function getList: ENSettleTypeShortList; stdcall;
    function getFilteredList(const aENSettleTypeFilter: ENSettleTypeFilter): ENSettleTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSettleTypeShortList; stdcall;
    function getScrollableFilteredList(const aENSettleTypeFilter: ENSettleTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSettleTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSettleTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSettleTypeFilter: ENSettleTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSettleTypeShort; stdcall;
  end;


implementation

  destructor ENSettleType.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

{
  destructor ENSettleTypeFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;
}

  destructor ENSettleTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSettleTypeShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end;

  destructor ENSettleTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSettleType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettleType');
  RemClassRegistry.RegisterXSClass(ENSettleTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettleTypeRef');
  RemClassRegistry.RegisterXSClass(ENSettleTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettleTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSettleTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettleTypeShort');
  RemClassRegistry.RegisterXSClass(ENSettleTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettleTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSettleTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSettleTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSettleTypeControllerSoapPort), 'http://ksoe.org/ENSettleTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSettleTypeControllerSoapPort), 'http://ksoe.org/ENSettleTypeController/action/ENSettleTypeController.%operationName%');


end.
