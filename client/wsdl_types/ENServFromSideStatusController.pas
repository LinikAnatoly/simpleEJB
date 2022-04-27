unit ENServFromSideStatusController;

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

  ENServFromSideStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServFromSideStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServFromSideStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENServFromSideStatusFilter = class(TRemotable)
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

  ENServFromSideStatusFilter = class(ENServFromSideStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServFromSideStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServFromSideStatusShort = array of ENServFromSideStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServFromSideStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServFromSideStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServFromSideStatusShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServFromSideStatusController/message/
  // soapAction: http://ksoe.org/ENServFromSideStatusController/action/ENServFromSideStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServFromSideStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServFromSideStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServFromSideStatusControllerSoapPort = interface(IInvokable)
  ['{9A79771E-7AD4-4CCC-9DE4-129200675BC1}']
    function add(const aENServFromSideStatus: ENServFromSideStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServFromSideStatus: ENServFromSideStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENServFromSideStatus; stdcall;
    function getList: ENServFromSideStatusShortList; stdcall;
    function getFilteredList(const aENServFromSideStatusFilter: ENServFromSideStatusFilter): ENServFromSideStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServFromSideStatusShortList; stdcall;
    function getScrollableFilteredList(const aENServFromSideStatusFilter: ENServFromSideStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServFromSideStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServFromSideStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServFromSideStatusFilter: ENServFromSideStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServFromSideStatusShort; stdcall;
  end;


implementation



  destructor ENServFromSideStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServFromSideStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSideStatus');
  RemClassRegistry.RegisterXSClass(ENServFromSideStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSideStatusRef');
  RemClassRegistry.RegisterXSClass(ENServFromSideStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSideStatusFilter');
  RemClassRegistry.RegisterXSClass(ENServFromSideStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSideStatusShort');
  RemClassRegistry.RegisterXSClass(ENServFromSideStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServFromSideStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServFromSideStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServFromSideStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServFromSideStatusControllerSoapPort), 'http://ksoe.org/ENServFromSideStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServFromSideStatusControllerSoapPort), 'http://ksoe.org/ENServFromSideStatusController/action/ENServFromSideStatusController.%operationName%');


end.
