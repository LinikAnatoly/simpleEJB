unit RQTypePayValueController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrderItemTypePayController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQTypePayValue            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTypePayValueRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTypePayValue = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : Integer;
//???
    FtypePayRef : RQOrderItemTypePayRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
  end;

{
  RQTypePayValueFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fvalue : Integer;
//???
    FtypePayRef : RQOrderItemTypePayRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
  end;
}

  RQTypePayValueFilter = class(RQTypePayValue)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQTypePayValueShort = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : Integer;
    FtypePayRefCode : Integer;
    FtypePayRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property  value : Integer read Fvalue write Fvalue;

    property typePayRefCode : Integer read FtypePayRefCode write FtypePayRefCode;
    property typePayRefName : WideString read FtypePayRefName write FtypePayRefName;
  end;

  ArrayOfRQTypePayValueShort = array of RQTypePayValueShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTypePayValueShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTypePayValueShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTypePayValueShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTypePayValueController/message/
  // soapAction: http://ksoe.org/RQTypePayValueController/action/RQTypePayValueController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTypePayValueControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTypePayValueController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTypePayValueControllerSoapPort = interface(IInvokable)
  ['{57e757e7-57e7-57e7-57e7-57e757e757e7}']
    function add(const aRQTypePayValue: RQTypePayValue): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTypePayValue: RQTypePayValue); stdcall;
    function getObject(const anObjectCode: Integer): RQTypePayValue; stdcall;
    function getList: RQTypePayValueShortList; stdcall;
    function getFilteredList(const aRQTypePayValueFilter: RQTypePayValueFilter): RQTypePayValueShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTypePayValueShortList; stdcall;
    function getScrollableFilteredList(const aRQTypePayValueFilter: RQTypePayValueFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTypePayValueShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTypePayValueShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQTypePayValueFilter: RQTypePayValueFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQTypePayValueShort; stdcall;
  end;


implementation

  destructor RQTypePayValue.Destroy;
  begin
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    inherited Destroy;
  end;

{
  destructor RQTypePayValueFilter.Destroy;
  begin
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    inherited Destroy;
  end;
}

  destructor RQTypePayValueFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor RQTypePayValueShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTypePayValue, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTypePayValue');
  RemClassRegistry.RegisterXSClass(RQTypePayValueRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTypePayValueRef');
  RemClassRegistry.RegisterXSClass(RQTypePayValueFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTypePayValueFilter');
  RemClassRegistry.RegisterXSClass(RQTypePayValueShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTypePayValueShort');
  RemClassRegistry.RegisterXSClass(RQTypePayValueShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTypePayValueShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTypePayValueShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTypePayValueShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTypePayValueControllerSoapPort), 'http://ksoe.org/RQTypePayValueController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTypePayValueControllerSoapPort), 'http://ksoe.org/RQTypePayValueController/action/RQTypePayValueController.%operationName%');


end.
