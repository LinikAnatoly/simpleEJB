unit ENSizMaterials2TKMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementController
  , TKMaterialsController
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

  ENSizMaterials2TKMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSizMaterials2TKMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSizMaterials2TKMaterials = class(TRemotable)
  private
    Fcode : Integer;
    FuserEdit : WideString;
    FdateEdit : TXSDateTime;
//???
    FelementRef : ENElementRef;
//???
    FsizMaterialsRef : TKMaterialsRef;
//???
    FtkMaterialsRef : TKMaterialsRef;
//???
    FparentRef : ENSizMaterials2TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property sizMaterialsRef : TKMaterialsRef read FsizMaterialsRef write FsizMaterialsRef;
    property tkMaterialsRef : TKMaterialsRef read FtkMaterialsRef write FtkMaterialsRef;
    property parentRef : ENSizMaterials2TKMaterialsRef read FparentRef write FparentRef;
  end;

{
  ENSizMaterials2TKMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserEdit : WideString;
    FdateEdit : TXSDateTime;
//???
    FelementRef : ENElementRef;
//???
    FsizMaterialsRef : TKMaterialsRef;
//???
    FtkMaterialsRef : TKMaterialsRef;
//???
    FparentRef : ENSizMaterials2TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property sizMaterialsRef : TKMaterialsRef read FsizMaterialsRef write FsizMaterialsRef;
    property tkMaterialsRef : TKMaterialsRef read FtkMaterialsRef write FtkMaterialsRef;
    property parentRef : ENSizMaterials2TKMaterialsRef read FparentRef write FparentRef;
  end;
}

  ENSizMaterials2TKMaterialsFilter = class(ENSizMaterials2TKMaterials)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSizMaterials2TKMaterialsShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserEdit : WideString;
    FdateEdit : TXSDateTime;
    FelementRefCode : Integer;
    FsizMaterialsRefCode : Integer;
    FsizMaterialsRefName : WideString;
    FsizMaterialsRefCost : TXSDecimal;
    FsizMaterialsRefDeliveryDate : Integer;
    FsizMaterialsRefNumkatalog : WideString;
    FsizMaterialsRefIdentid : WideString;
    FtkMaterialsRefCode : Integer;
    FtkMaterialsRefName : WideString;
    FtkMaterialsRefCost : TXSDecimal;
    FtkMaterialsRefDeliveryDate : Integer;
    FtkMaterialsRefNumkatalog : WideString;
    FtkMaterialsRefIdentid : WideString;
    FparentRefCode : Integer;
    FparentRefUserEdit : WideString;
    FparentRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property sizMaterialsRefCode : Integer read FsizMaterialsRefCode write FsizMaterialsRefCode;
    property sizMaterialsRefName : WideString read FsizMaterialsRefName write FsizMaterialsRefName;
    property sizMaterialsRefCost : TXSDecimal read FsizMaterialsRefCost write FsizMaterialsRefCost;
    property sizMaterialsRefDeliveryDate : Integer read FsizMaterialsRefDeliveryDate write FsizMaterialsRefDeliveryDate;
    property sizMaterialsRefNumkatalog : WideString read FsizMaterialsRefNumkatalog write FsizMaterialsRefNumkatalog;
    property sizMaterialsRefIdentid : WideString read FsizMaterialsRefIdentid write FsizMaterialsRefIdentid;
    property tkMaterialsRefCode : Integer read FtkMaterialsRefCode write FtkMaterialsRefCode;
    property tkMaterialsRefName : WideString read FtkMaterialsRefName write FtkMaterialsRefName;
    property tkMaterialsRefCost : TXSDecimal read FtkMaterialsRefCost write FtkMaterialsRefCost;
    property tkMaterialsRefDeliveryDate : Integer read FtkMaterialsRefDeliveryDate write FtkMaterialsRefDeliveryDate;
    property tkMaterialsRefNumkatalog : WideString read FtkMaterialsRefNumkatalog write FtkMaterialsRefNumkatalog;
    property tkMaterialsRefIdentid : WideString read FtkMaterialsRefIdentid write FtkMaterialsRefIdentid;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefUserEdit : WideString read FparentRefUserEdit write FparentRefUserEdit;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
  end;

  ArrayOfENSizMaterials2TKMaterialsShort = array of ENSizMaterials2TKMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSizMaterials2TKMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSizMaterials2TKMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSizMaterials2TKMaterialsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSizMaterials2TKMaterialsController/message/
  // soapAction: http://ksoe.org/ENSizMaterials2TKMaterialsController/action/ENSizMaterials2TKMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSizMaterials2TKMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSizMaterials2TKMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSizMaterials2TKMaterialsControllerSoapPort = interface(IInvokable)
  ['{E8CEF3B0-CA5D-4EB4-B22B-F751FCCEBD48}']
    function add(const aENSizMaterials2TKMaterials: ENSizMaterials2TKMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSizMaterials2TKMaterials: ENSizMaterials2TKMaterials); stdcall;
    function getObject(const anObjectCode: Integer): ENSizMaterials2TKMaterials; stdcall;
    function getList: ENSizMaterials2TKMaterialsShortList; stdcall;
    function getFilteredList(const aENSizMaterials2TKMaterialsFilter: ENSizMaterials2TKMaterialsFilter): ENSizMaterials2TKMaterialsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSizMaterials2TKMaterialsShortList; stdcall;
    function getScrollableFilteredList(const aENSizMaterials2TKMaterialsFilter: ENSizMaterials2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSizMaterials2TKMaterialsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSizMaterials2TKMaterialsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSizMaterials2TKMaterialsFilter: ENSizMaterials2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSizMaterials2TKMaterialsShort; stdcall;
  end;


implementation

  destructor ENSizMaterials2TKMaterials.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FsizMaterialsRef) then
      sizMaterialsRef.Free;
    if Assigned(FtkMaterialsRef) then
      tkMaterialsRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSizMaterials2TKMaterialsFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FsizMaterialsRef) then
      sizMaterialsRef.Free;
    if Assigned(FtkMaterialsRef) then
      tkMaterialsRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSizMaterials2TKMaterialsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSizMaterials2TKMaterialsShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsizMaterialsRefCost) then
      sizMaterialsRefCost.Free;
    if Assigned(FtkMaterialsRefCost) then
      tkMaterialsRefCost.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSizMaterials2TKMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSizMaterials2TKMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizMaterials2TKMaterials');
  RemClassRegistry.RegisterXSClass(ENSizMaterials2TKMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizMaterials2TKMaterialsRef');
  RemClassRegistry.RegisterXSClass(ENSizMaterials2TKMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizMaterials2TKMaterialsFilter');
  RemClassRegistry.RegisterXSClass(ENSizMaterials2TKMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizMaterials2TKMaterialsShort');
  RemClassRegistry.RegisterXSClass(ENSizMaterials2TKMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSizMaterials2TKMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSizMaterials2TKMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSizMaterials2TKMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSizMaterials2TKMaterialsControllerSoapPort), 'http://ksoe.org/ENSizMaterials2TKMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSizMaterials2TKMaterialsControllerSoapPort), 'http://ksoe.org/ENSizMaterials2TKMaterialsController/action/ENSizMaterials2TKMaterialsController.%operationName%');


end.
