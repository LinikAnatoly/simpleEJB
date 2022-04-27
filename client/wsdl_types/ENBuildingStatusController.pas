unit ENBuildingStatusController;

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

  ENBuildingStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuildingStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuildingStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBuildingStatusFilter = class(TRemotable)
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

  ENBuildingStatusFilter = class(ENBuildingStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuildingStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBuildingStatusShort = array of ENBuildingStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuildingStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuildingStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuildingStatusShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuildingStatusController/message/
  // soapAction: http://ksoe.org/ENBuildingStatusController/action/ENBuildingStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuildingStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuildingStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuildingStatusControllerSoapPort = interface(IInvokable)
  ['{412EFC77-1BFD-4792-983C-BE86059BA21D}']
    function add(const aENBuildingStatus: ENBuildingStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuildingStatus: ENBuildingStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENBuildingStatus; stdcall;
    function getList: ENBuildingStatusShortList; stdcall;
    function getFilteredList(const aENBuildingStatusFilter: ENBuildingStatusFilter): ENBuildingStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuildingStatusShortList; stdcall;
    function getScrollableFilteredList(const aENBuildingStatusFilter: ENBuildingStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuildingStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuildingStatusFilter: ENBuildingStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuildingStatusShort; stdcall;
  end;


implementation



  destructor ENBuildingStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuildingStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingStatus');
  RemClassRegistry.RegisterXSClass(ENBuildingStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingStatusRef');
  RemClassRegistry.RegisterXSClass(ENBuildingStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingStatusFilter');
  RemClassRegistry.RegisterXSClass(ENBuildingStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingStatusShort');
  RemClassRegistry.RegisterXSClass(ENBuildingStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuildingStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuildingStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuildingStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuildingStatusControllerSoapPort), 'http://ksoe.org/ENBuildingStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuildingStatusControllerSoapPort), 'http://ksoe.org/ENBuildingStatusController/action/ENBuildingStatusController.%operationName%');


end.
