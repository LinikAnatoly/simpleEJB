unit ENAttachment2ServicesKindController;

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

  ENAttachment2ServicesKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAttachment2ServicesKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAttachment2ServicesKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENAttachment2ServicesKindFilter = class(TRemotable)
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

  ENAttachment2ServicesKindFilter = class(ENAttachment2ServicesKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAttachment2ServicesKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENAttachment2ServicesKindShort = array of ENAttachment2ServicesKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAttachment2ServicesKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAttachment2ServicesKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAttachment2ServicesKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAttachment2ServicesKindController/message/
  // soapAction: http://ksoe.org/ENAttachment2ServicesKindController/action/ENAttachment2ServicesKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAttachment2ServicesKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAttachment2ServicesKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAttachment2ServicesKindControllerSoapPort = interface(IInvokable)
  ['{42EF4642-E630-4EF3-8B44-7752D224D7D7}']
    function add(const aENAttachment2ServicesKind: ENAttachment2ServicesKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAttachment2ServicesKind: ENAttachment2ServicesKind); stdcall;
    function getObject(const anObjectCode: Integer): ENAttachment2ServicesKind; stdcall;
    function getList: ENAttachment2ServicesKindShortList; stdcall;
    function getFilteredList(const aENAttachment2ServicesKindFilter: ENAttachment2ServicesKindFilter): ENAttachment2ServicesKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAttachment2ServicesKindShortList; stdcall;
    function getScrollableFilteredList(const aENAttachment2ServicesKindFilter: ENAttachment2ServicesKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAttachment2ServicesKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAttachment2ServicesKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAttachment2ServicesKindFilter: ENAttachment2ServicesKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAttachment2ServicesKindShort; stdcall;
  end;


implementation



  destructor ENAttachment2ServicesKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAttachment2ServicesKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAttachment2ServicesKind');
  RemClassRegistry.RegisterXSClass(ENAttachment2ServicesKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAttachment2ServicesKindRef');
  RemClassRegistry.RegisterXSClass(ENAttachment2ServicesKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAttachment2ServicesKindFilter');
  RemClassRegistry.RegisterXSClass(ENAttachment2ServicesKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAttachment2ServicesKindShort');
  RemClassRegistry.RegisterXSClass(ENAttachment2ServicesKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAttachment2ServicesKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAttachment2ServicesKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAttachment2ServicesKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAttachment2ServicesKindControllerSoapPort), 'http://ksoe.org/ENAttachment2ServicesKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAttachment2ServicesKindControllerSoapPort), 'http://ksoe.org/ENAttachment2ServicesKindController/action/ENAttachment2ServicesKindController.%operationName%');


end.
