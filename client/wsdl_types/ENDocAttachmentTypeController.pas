unit ENDocAttachmentTypeController;

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

  ENDocAttachmentType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENDocAttachmentTypeFilter = class(TRemotable)
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

  ENDocAttachmentTypeFilter = class(ENDocAttachmentType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachmentTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDocAttachmentTypeShort = array of ENDocAttachmentTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachmentTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachmentTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachmentTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachmentTypeController/message/
  // soapAction: http://ksoe.org/ENDocAttachmentTypeController/action/ENDocAttachmentTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachmentTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachmentTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachmentTypeControllerSoapPort = interface(IInvokable)
  ['{71BB95A4-6420-40B9-A62E-6660B1D14F44}']
    function add(const aENDocAttachmentType: ENDocAttachmentType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachmentType: ENDocAttachmentType); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachmentType; stdcall;
    function getList: ENDocAttachmentTypeShortList; stdcall;
    function getFilteredList(const aENDocAttachmentTypeFilter: ENDocAttachmentTypeFilter): ENDocAttachmentTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentTypeShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachmentTypeFilter: ENDocAttachmentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachmentTypeFilter: ENDocAttachmentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachmentTypeShort; stdcall;
  end;


implementation



  destructor ENDocAttachmentTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachmentType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentType');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentTypeRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentTypeFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentTypeShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachmentTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachmentTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachmentTypeControllerSoapPort), 'http://ksoe.org/ENDocAttachmentTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachmentTypeControllerSoapPort), 'http://ksoe.org/ENDocAttachmentTypeController/action/ENDocAttachmentTypeController.%operationName%');


end.
