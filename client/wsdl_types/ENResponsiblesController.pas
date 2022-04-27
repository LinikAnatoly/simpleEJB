unit ENResponsiblesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENResponsiblesKindController
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

  ENResponsibles            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsiblesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsibles = class(TRemotable)
  private
    Fcode : Integer;
    FFIO : WideString;
    FtabNumber : WideString;
    Fposition : WideString;
    FdepName : WideString;
    FdepCode : WideString;
    Fphone : WideString;
//???
    FkindRef : ENResponsiblesKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property position : WideString read Fposition write Fposition;
    property depName : WideString read FdepName write FdepName;
    property depCode : WideString read FdepCode write FdepCode;
    property phone : WideString read Fphone write Fphone;
    property kindRef : ENResponsiblesKindRef read FkindRef write FkindRef;
  end;

{
  ENResponsiblesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FFIO : WideString;
    FtabNumber : WideString;
    Fposition : WideString;
    FdepName : WideString;
    FdepCode : WideString;
    Fphone : WideString;
//???
    FkindRef : ENResponsiblesKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property position : WideString read Fposition write Fposition;
    property depName : WideString read FdepName write FdepName;
    property depCode : WideString read FdepCode write FdepCode;
    property phone : WideString read Fphone write Fphone;
    property kindRef : ENResponsiblesKindRef read FkindRef write FkindRef;
  end;
}

  ENResponsiblesFilter = class(ENResponsibles)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENResponsiblesShort = class(TRemotable)
  private
    Fcode : Integer;
    FFIO : WideString;
    FtabNumber : WideString;
    Fposition : WideString;
    FdepName : WideString;
    FdepCode : WideString;
    Fphone : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property FIO : WideString read FFIO write FFIO;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property position : WideString read Fposition write Fposition;
    property depName : WideString read FdepName write FdepName;
    property depCode : WideString read FdepCode write FdepCode;
    property phone : WideString read Fphone write Fphone;

    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
  end;

  ArrayOfENResponsiblesShort = array of ENResponsiblesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENResponsiblesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENResponsiblesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENResponsiblesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENResponsiblesController/message/
  // soapAction: http://ksoe.org/ENResponsiblesController/action/ENResponsiblesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENResponsiblesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENResponsiblesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENResponsiblesControllerSoapPort = interface(IInvokable)
  ['{7522C82B-8AAC-463E-A465-2BCEF332BA5E}']
    function add(const aENResponsibles: ENResponsibles): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENResponsibles: ENResponsibles); stdcall;
    function getObject(const anObjectCode: Integer): ENResponsibles; stdcall;
    function getList: ENResponsiblesShortList; stdcall;
    function getFilteredList(const aENResponsiblesFilter: ENResponsiblesFilter): ENResponsiblesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesShortList; stdcall;
    function getScrollableFilteredList(const aENResponsiblesFilter: ENResponsiblesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENResponsiblesFilter: ENResponsiblesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENResponsiblesShort; stdcall;
  end;


implementation

  destructor ENResponsibles.Destroy;
  begin
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{
  destructor ENResponsiblesFilter.Destroy;
  begin
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;
}

  destructor ENResponsiblesFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENResponsiblesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENResponsibles, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles');
  RemClassRegistry.RegisterXSClass(ENResponsiblesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesRef');
  RemClassRegistry.RegisterXSClass(ENResponsiblesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesFilter');
  RemClassRegistry.RegisterXSClass(ENResponsiblesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesShort');
  RemClassRegistry.RegisterXSClass(ENResponsiblesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENResponsiblesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENResponsiblesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENResponsiblesControllerSoapPort), 'http://ksoe.org/ENResponsiblesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENResponsiblesControllerSoapPort), 'http://ksoe.org/ENResponsiblesController/action/ENResponsiblesController.%operationName%');


end.
