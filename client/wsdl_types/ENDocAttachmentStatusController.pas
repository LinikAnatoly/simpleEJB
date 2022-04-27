unit ENDocAttachmentStatusController;

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

  ENDocAttachmentStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENDocAttachmentStatusFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENDocAttachmentStatusFilter = class(ENDocAttachmentStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachmentStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDocAttachmentStatusShort = array of ENDocAttachmentStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachmentStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachmentStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachmentStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachmentStatusController/message/
  // soapAction: http://ksoe.org/ENDocAttachmentStatusController/action/ENDocAttachmentStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachmentStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachmentStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachmentStatusControllerSoapPort = interface(IInvokable)
  ['{E799C148-CC7D-462D-AA26-264053F79279}']
    function add(const aENDocAttachmentStatus: ENDocAttachmentStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachmentStatus: ENDocAttachmentStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachmentStatus; stdcall;
    function getList: ENDocAttachmentStatusShortList; stdcall;
    function getFilteredList(const aENDocAttachmentStatusFilter: ENDocAttachmentStatusFilter): ENDocAttachmentStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentStatusShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachmentStatusFilter: ENDocAttachmentStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachmentStatusFilter: ENDocAttachmentStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachmentStatusShort; stdcall;
  end;


implementation



  destructor ENDocAttachmentStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachmentStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentStatus');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentStatusRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentStatusFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentStatusShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachmentStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachmentStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachmentStatusControllerSoapPort), 'http://ksoe.org/ENDocAttachmentStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachmentStatusControllerSoapPort), 'http://ksoe.org/ENDocAttachmentStatusController/action/ENDocAttachmentStatusController.%operationName%');


end.
