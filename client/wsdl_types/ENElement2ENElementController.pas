unit ENElement2ENElementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENElement2ENElementTypeController
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

  ENElement2ENElement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ENElementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ENElement = class(TRemotable)
  private
    Fcode : Integer;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FtypeRef : ENElement2ENElementTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property elementInRef : ENElementRef read FelementInRef write FelementInRef;
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef;
    property typeRef : ENElement2ENElementTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENElement2ENElementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
//???
    FtypeRef : ENElement2ENElementTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property elementInRef : ENElementRef read FelementInRef write FelementInRef;
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef;
    property typeRef : ENElement2ENElementTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENElement2ENElementFilter = class(ENElement2ENElement)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2ENElementShort = class(TRemotable)
  private
    Fcode : Integer;
    FelementInRefCode : Integer;
    FelementOutRefCode : Integer;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;

    property elementInRefCode : Integer read FelementInRefCode write FelementInRefCode;
    property elementOutRefCode : Integer read FelementOutRefCode write FelementOutRefCode;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENElement2ENElementShort = array of ENElement2ENElementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2ENElementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2ENElementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2ENElementShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2ENElementController/message/
  // soapAction: http://ksoe.org/ENElement2ENElementController/action/ENElement2ENElementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2ENElementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2ENElementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2ENElementControllerSoapPort = interface(IInvokable)
  ['{3F4987A7-C708-4723-B66D-77A66B8DF9F6}']
    function add(const aENElement2ENElement: ENElement2ENElement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2ENElement: ENElement2ENElement); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2ENElement; stdcall;
    function getList: ENElement2ENElementShortList; stdcall;
    function getFilteredList(const aENElement2ENElementFilter: ENElement2ENElementFilter): ENElement2ENElementShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementShortList; stdcall;
    function getScrollableFilteredList(const aENElement2ENElementFilter: ENElement2ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ENElementShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2ENElementFilter: ENElement2ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2ENElementShort; stdcall;
  end;


implementation

  destructor ENElement2ENElement.Destroy;
  begin
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENElement2ENElementFilter.Destroy;
  begin
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENElement2ENElementFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENElement2ENElementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2ENElement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElement');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementRef');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementFilter');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementShort');
  RemClassRegistry.RegisterXSClass(ENElement2ENElementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ENElementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2ENElementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2ENElementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2ENElementControllerSoapPort), 'http://ksoe.org/ENElement2ENElementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2ENElementControllerSoapPort), 'http://ksoe.org/ENElement2ENElementController/action/ENElement2ENElementController.%operationName%');


end.
