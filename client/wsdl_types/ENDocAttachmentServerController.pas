unit ENDocAttachmentServerController;

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

  ENDocAttachmentServer            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentServerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentServer = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FserverIp : WideString;
    FuserName : WideString;
    FuserPass : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property serverIp : WideString read FserverIp write FserverIp;
    property userName : WideString read FuserName write FuserName;
    property userPass : WideString read FuserPass write FuserPass;
  end;

{
  ENDocAttachmentServerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FserverIp : WideString;
    FuserName : WideString;
    FuserPass : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property serverIp : WideString read FserverIp write FserverIp;
    property userName : WideString read FuserName write FuserName;
    property userPass : WideString read FuserPass write FuserPass;
  end;
}

  ENDocAttachmentServerFilter = class(ENDocAttachmentServer)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachmentServerShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FserverIp : WideString;
    FuserName : WideString;
    FuserPass : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property serverIp : WideString read FserverIp write FserverIp;
    property userName : WideString read FuserName write FuserName;
    property userPass : WideString read FuserPass write FuserPass;

  end;

  ArrayOfENDocAttachmentServerShort = array of ENDocAttachmentServerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachmentServerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachmentServerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachmentServerShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachmentServerController/message/
  // soapAction: http://ksoe.org/ENDocAttachmentServerController/action/ENDocAttachmentServerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachmentServerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachmentServerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachmentServerControllerSoapPort = interface(IInvokable)
  ['{CC7F90B8-2B9B-4718-A55E-4E743EBE9BD5}']
    function add(const aENDocAttachmentServer: ENDocAttachmentServer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachmentServer: ENDocAttachmentServer); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachmentServer; stdcall;
    function getList: ENDocAttachmentServerShortList; stdcall;
    function getFilteredList(const aENDocAttachmentServerFilter: ENDocAttachmentServerFilter): ENDocAttachmentServerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentServerShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachmentServerFilter: ENDocAttachmentServerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentServerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentServerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachmentServerFilter: ENDocAttachmentServerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachmentServerShort; stdcall;
  end;


implementation



  destructor ENDocAttachmentServerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachmentServer, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentServer');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentServerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentServerRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentServerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentServerFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentServerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentServerShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentServerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentServerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachmentServerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachmentServerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachmentServerControllerSoapPort), 'http://ksoe.org/ENDocAttachmentServerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachmentServerControllerSoapPort), 'http://ksoe.org/ENDocAttachmentServerController/action/ENDocAttachmentServerController.%operationName%');


end.
