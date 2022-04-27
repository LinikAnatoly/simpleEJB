unit ENDocAttachmentActionController;

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

  ENDocAttachmentAction            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentActionRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentAction = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENDocAttachmentActionFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENDocAttachmentActionFilter = class(ENDocAttachmentAction)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachmentActionShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDocAttachmentActionShort = array of ENDocAttachmentActionShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachmentActionShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachmentActionShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachmentActionShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachmentActionController/message/
  // soapAction: http://ksoe.org/ENDocAttachmentActionController/action/ENDocAttachmentActionController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachmentActionControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachmentActionController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachmentActionControllerSoapPort = interface(IInvokable)
  ['{0D9FE7F5-EF1D-4354-9861-9FB5098941E6}']
    function add(const aENDocAttachmentAction: ENDocAttachmentAction): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachmentAction: ENDocAttachmentAction); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachmentAction; stdcall;
    function getList: ENDocAttachmentActionShortList; stdcall;
    function getFilteredList(const aENDocAttachmentActionFilter: ENDocAttachmentActionFilter): ENDocAttachmentActionShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentActionShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachmentActionFilter: ENDocAttachmentActionFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentActionShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentActionShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachmentActionFilter: ENDocAttachmentActionFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachmentActionShort; stdcall;
  end;


implementation



  destructor ENDocAttachmentActionShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachmentAction, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentAction');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentActionRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentActionRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentActionFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentActionFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentActionShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentActionShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentActionShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentActionShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachmentActionShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachmentActionShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachmentActionControllerSoapPort), 'http://ksoe.org/ENDocAttachmentActionController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachmentActionControllerSoapPort), 'http://ksoe.org/ENDocAttachmentActionController/action/ENDocAttachmentActionController.%operationName%');


end.
