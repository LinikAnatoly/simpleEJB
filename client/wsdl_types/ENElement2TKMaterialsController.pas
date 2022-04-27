unit ENElement2TKMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,ENElementController
   ,ENElement2TKMaterialsTypeController
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

  ENElement2TKMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2TKMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2TKMaterials = class(TRemotable)
  private
    Fcode : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FelementRef : ENElementRef;
//???
    FtypeRef : ENElement2TKMaterialsTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property typeRef : ENElement2TKMaterialsTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENElement2TKMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FelementRef : ENElementRef;
//???
    FtypeRef : ENElement2TKMaterialsTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property typeRef : ENElement2TKMaterialsTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENElement2TKMaterialsFilter = class(ENElement2TKMaterials)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2TKMaterialsShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FelementRefCode : Integer;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENElement2TKMaterialsShort = array of ENElement2TKMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2TKMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2TKMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2TKMaterialsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2TKMaterialsController/message/
  // soapAction: http://ksoe.org/ENElement2TKMaterialsController/action/ENElement2TKMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2TKMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2TKMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2TKMaterialsControllerSoapPort = interface(IInvokable)
  ['{54cb54cb-54cb-54cb-54cb-54cb54cb54cb}']
    function add(const aENElement2TKMaterials: ENElement2TKMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2TKMaterials: ENElement2TKMaterials); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2TKMaterials; stdcall;
    function getList: ENElement2TKMaterialsShortList; stdcall;
    function getFilteredList(const aENElement2TKMaterialsFilter: ENElement2TKMaterialsFilter): ENElement2TKMaterialsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsShortList; stdcall;
    function getScrollableFilteredList(const aENElement2TKMaterialsFilter: ENElement2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2TKMaterialsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2TKMaterialsFilter: ENElement2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2TKMaterialsShort; stdcall;
  end;


implementation

  destructor ENElement2TKMaterials.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENElement2TKMaterialsFilter.Destroy;
  begin
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENElement2TKMaterialsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENElement2TKMaterialsShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENElement2TKMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2TKMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterials');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsRef');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsFilter');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsShort');
  RemClassRegistry.RegisterXSClass(ENElement2TKMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2TKMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2TKMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2TKMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2TKMaterialsControllerSoapPort), 'http://ksoe.org/ENElement2TKMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2TKMaterialsControllerSoapPort), 'http://ksoe.org/ENElement2TKMaterialsController/action/ENElement2TKMaterialsController.%operationName%');


end.
