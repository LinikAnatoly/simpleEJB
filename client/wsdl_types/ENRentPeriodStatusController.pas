unit ENRentPeriodStatusController;

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

  ENRentPeriodStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRentPeriodStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRentPeriodStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENRentPeriodStatusFilter = class(TRemotable)
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

  ENRentPeriodStatusFilter = class(ENRentPeriodStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRentPeriodStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENRentPeriodStatusShort = array of ENRentPeriodStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRentPeriodStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRentPeriodStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRentPeriodStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRentPeriodStatusController/message/
  // soapAction: http://ksoe.org/ENRentPeriodStatusController/action/ENRentPeriodStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRentPeriodStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRentPeriodStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRentPeriodStatusControllerSoapPort = interface(IInvokable)
  ['{758F43AF-4C14-4570-AB65-A96B272E2153}']
    function add(const aENRentPeriodStatus: ENRentPeriodStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRentPeriodStatus: ENRentPeriodStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENRentPeriodStatus; stdcall;
    function getList: ENRentPeriodStatusShortList; stdcall;
    function getFilteredList(const aENRentPeriodStatusFilter: ENRentPeriodStatusFilter): ENRentPeriodStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriodStatusShortList; stdcall;
    function getScrollableFilteredList(const aENRentPeriodStatusFilter: ENRentPeriodStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriodStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRentPeriodStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRentPeriodStatusFilter: ENRentPeriodStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRentPeriodStatusShort; stdcall;
  end;


implementation



  destructor ENRentPeriodStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRentPeriodStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriodStatus');
  RemClassRegistry.RegisterXSClass(ENRentPeriodStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriodStatusRef');
  RemClassRegistry.RegisterXSClass(ENRentPeriodStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriodStatusFilter');
  RemClassRegistry.RegisterXSClass(ENRentPeriodStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriodStatusShort');
  RemClassRegistry.RegisterXSClass(ENRentPeriodStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRentPeriodStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRentPeriodStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRentPeriodStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRentPeriodStatusControllerSoapPort), 'http://ksoe.org/ENRentPeriodStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRentPeriodStatusControllerSoapPort), 'http://ksoe.org/ENRentPeriodStatusController/action/ENRentPeriodStatusController.%operationName%');


end.
