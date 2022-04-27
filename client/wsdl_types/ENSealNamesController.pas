unit ENSealNamesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
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

  ENSealNames            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSealNamesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSealNames = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
  end;

{
  ENSealNamesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
  end;
}

  ENSealNamesFilter = class(ENSealNames)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSealNamesShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
  end;

  ArrayOfENSealNamesShort = array of ENSealNamesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSealNamesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSealNamesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSealNamesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSealNamesController/message/
  // soapAction: http://ksoe.org/ENSealNamesController/action/ENSealNamesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSealNamesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSealNamesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSealNamesControllerSoapPort = interface(IInvokable)
  ['{DACE0F1A-D8EC-4FC5-A598-1F7AA4EDF298}']
    function add(const aENSealNames: ENSealNames): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSealNames: ENSealNames); stdcall;
    function getObject(const anObjectCode: Integer): ENSealNames; stdcall;
    function getList: ENSealNamesShortList; stdcall;
    function getFilteredList(const aENSealNamesFilter: ENSealNamesFilter): ENSealNamesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSealNamesShortList; stdcall;
    function getScrollableFilteredList(const aENSealNamesFilter: ENSealNamesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSealNamesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSealNamesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSealNamesFilter: ENSealNamesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSealNamesShort; stdcall;
  end;


implementation

  destructor ENSealNames.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSealNamesFilter.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSealNamesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSealNamesShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENSealNamesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSealNames, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealNames');
  RemClassRegistry.RegisterXSClass(ENSealNamesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealNamesRef');
  RemClassRegistry.RegisterXSClass(ENSealNamesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealNamesFilter');
  RemClassRegistry.RegisterXSClass(ENSealNamesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealNamesShort');
  RemClassRegistry.RegisterXSClass(ENSealNamesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealNamesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSealNamesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSealNamesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSealNamesControllerSoapPort), 'http://ksoe.org/ENSealNamesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSealNamesControllerSoapPort), 'http://ksoe.org/ENSealNamesController/action/ENSealNamesController.%operationName%');


end.
