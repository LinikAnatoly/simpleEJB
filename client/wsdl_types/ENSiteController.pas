unit ENSiteController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENSite            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSiteRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSite = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fsiteaddress : WideString;
    Fsitephone : WideString;
    Fmodify_time : Int64;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property siteaddress : WideString read Fsiteaddress write Fsiteaddress;
    property sitephone : WideString read Fsitephone write Fsitephone;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENSiteFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fsiteaddress : WideString;
    Fsitephone : WideString;
    Fmodify_time : Int64;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property siteaddress : WideString read Fsiteaddress write Fsiteaddress;
    property sitephone : WideString read Fsitephone write Fsitephone;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENSiteFilter = class(ENSite)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSiteShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fsiteaddress : WideString;
    Fsitephone : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property siteaddress : WideString read Fsiteaddress write Fsiteaddress;
    property sitephone : WideString read Fsitephone write Fsitephone;

  end;

  ArrayOfENSiteShort = array of ENSiteShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSiteShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSiteShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSiteShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSiteController/message/
  // soapAction: http://ksoe.org/ENSiteController/action/ENSiteController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSiteControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSiteController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSiteControllerSoapPort = interface(IInvokable)
  ['{1ad91ad9-1ad9-1ad9-1ad9-1ad91ad91ad9}']
    function add(const aENSite: ENSite): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSite: ENSite); stdcall;
    function getObject(const anObjectCode: Integer): ENSite; stdcall;
    function getList: ENSiteShortList; stdcall;
    function getFilteredList(const aENSiteFilter: ENSiteFilter): ENSiteShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSiteShortList; stdcall;
    function getScrollableFilteredList(const aENSiteFilter: ENSiteFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSiteShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSiteShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSiteFilter: ENSiteFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSiteShort; stdcall;
  end;


implementation



  destructor ENSiteShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSite, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSite');
  RemClassRegistry.RegisterXSClass(ENSiteRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSiteRef');
  RemClassRegistry.RegisterXSClass(ENSiteFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSiteFilter');
  RemClassRegistry.RegisterXSClass(ENSiteShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSiteShort');
  RemClassRegistry.RegisterXSClass(ENSiteShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSiteShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSiteShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSiteShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSiteControllerSoapPort), 'http://ksoe.org/ENSiteController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSiteControllerSoapPort), 'http://ksoe.org/ENSiteController/action/ENSiteController.%operationName%');


end.
