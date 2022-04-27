unit ENDocAttType2ActionController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentTypeController
   ,ENDocAttachmentActionController
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

  ENDocAttType2Action            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttType2ActionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttType2Action = class(TRemotable)
  private
    Fcode : Integer;
//???
    FtypeRef : ENDocAttachmentTypeRef;
//???
    FactionRef : ENDocAttachmentActionRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property typeRef : ENDocAttachmentTypeRef read FtypeRef write FtypeRef;
    property actionRef : ENDocAttachmentActionRef read FactionRef write FactionRef;
  end;

{
  ENDocAttType2ActionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FtypeRef : ENDocAttachmentTypeRef;
//???
    FactionRef : ENDocAttachmentActionRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property typeRef : ENDocAttachmentTypeRef read FtypeRef write FtypeRef;
    property actionRef : ENDocAttachmentActionRef read FactionRef write FactionRef;
  end;
}

  ENDocAttType2ActionFilter = class(ENDocAttType2Action)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttType2ActionShort = class(TRemotable)
  private
    Fcode : Integer;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FactionRefCode : Integer;
    FactionRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property actionRefCode : Integer read FactionRefCode write FactionRefCode;
    property actionRefName : WideString read FactionRefName write FactionRefName;
  end;

  ArrayOfENDocAttType2ActionShort = array of ENDocAttType2ActionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttType2ActionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttType2ActionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttType2ActionShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttType2ActionController/message/
  // soapAction: http://ksoe.org/ENDocAttType2ActionController/action/ENDocAttType2ActionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttType2ActionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttType2ActionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttType2ActionControllerSoapPort = interface(IInvokable)
  ['{8ABB493F-B7D6-4A8D-AD5B-0EEFE7820CE6}']
    function add(const aENDocAttType2Action: ENDocAttType2Action): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttType2Action: ENDocAttType2Action); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttType2Action; stdcall;
    function getList: ENDocAttType2ActionShortList; stdcall;
    function getFilteredList(const aENDocAttType2ActionFilter: ENDocAttType2ActionFilter): ENDocAttType2ActionShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttType2ActionShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttType2ActionFilter: ENDocAttType2ActionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttType2ActionShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttType2ActionShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttType2ActionFilter: ENDocAttType2ActionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttType2ActionShort; stdcall;
  end;


implementation

  destructor ENDocAttType2Action.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FactionRef) then
      actionRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttType2ActionFilter.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FactionRef) then
      actionRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttType2ActionFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENDocAttType2ActionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttType2Action, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttType2Action');
  RemClassRegistry.RegisterXSClass(ENDocAttType2ActionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttType2ActionRef');
  RemClassRegistry.RegisterXSClass(ENDocAttType2ActionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttType2ActionFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttType2ActionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttType2ActionShort');
  RemClassRegistry.RegisterXSClass(ENDocAttType2ActionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttType2ActionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttType2ActionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttType2ActionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttType2ActionControllerSoapPort), 'http://ksoe.org/ENDocAttType2ActionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttType2ActionControllerSoapPort), 'http://ksoe.org/ENDocAttType2ActionController/action/ENDocAttType2ActionController.%operationName%');


end.
