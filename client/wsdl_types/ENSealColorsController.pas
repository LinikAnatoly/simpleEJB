unit ENSealColorsController;

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

  ENSealColors            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSealColorsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSealColors = class(TRemotable)
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
  ENSealColorsFilter = class(TRemotable)
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

  ENSealColorsFilter = class(ENSealColors)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSealColorsShort = class(TRemotable)
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

  ArrayOfENSealColorsShort = array of ENSealColorsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSealColorsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSealColorsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSealColorsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSealColorsController/message/
  // soapAction: http://ksoe.org/ENSealColorsController/action/ENSealColorsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSealColorsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSealColorsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSealColorsControllerSoapPort = interface(IInvokable)
  ['{D2444002-4487-44A7-AB21-C16F35C8BB19}']
    function add(const aENSealColors: ENSealColors): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSealColors: ENSealColors); stdcall;
    function getObject(const anObjectCode: Integer): ENSealColors; stdcall;
    function getList: ENSealColorsShortList; stdcall;
    function getFilteredList(const aENSealColorsFilter: ENSealColorsFilter): ENSealColorsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSealColorsShortList; stdcall;
    function getScrollableFilteredList(const aENSealColorsFilter: ENSealColorsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSealColorsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSealColorsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSealColorsFilter: ENSealColorsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSealColorsShort; stdcall;
  end;


implementation

  destructor ENSealColors.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSealColorsFilter.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSealColorsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSealColorsShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENSealColorsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSealColors, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealColors');
  RemClassRegistry.RegisterXSClass(ENSealColorsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealColorsRef');
  RemClassRegistry.RegisterXSClass(ENSealColorsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealColorsFilter');
  RemClassRegistry.RegisterXSClass(ENSealColorsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealColorsShort');
  RemClassRegistry.RegisterXSClass(ENSealColorsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSealColorsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSealColorsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSealColorsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSealColorsControllerSoapPort), 'http://ksoe.org/ENSealColorsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSealColorsControllerSoapPort), 'http://ksoe.org/ENSealColorsController/action/ENSealColorsController.%operationName%');


end.
