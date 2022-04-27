unit ENWorkOrderBytStatusController;

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

  ENWorkOrderBytStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENWorkOrderBytStatusFilter = class(TRemotable)
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

  ENWorkOrderBytStatusFilter = class(ENWorkOrderBytStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWorkOrderBytStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENWorkOrderBytStatusShort = array of ENWorkOrderBytStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderBytStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderBytStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderBytStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderBytStatusController/message/
  // soapAction: http://ksoe.org/ENWorkOrderBytStatusController/action/ENWorkOrderBytStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderBytStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderBytStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderBytStatusControllerSoapPort = interface(IInvokable)
  ['{68697098-2A31-499F-9125-0FCAFD4BFCAE}']
    function add(const aENWorkOrderBytStatus: ENWorkOrderBytStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrderBytStatus: ENWorkOrderBytStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENWorkOrderBytStatus; stdcall;
    function getList: ENWorkOrderBytStatusShortList; stdcall;
    function getFilteredList(const aENWorkOrderBytStatusFilter: ENWorkOrderBytStatusFilter): ENWorkOrderBytStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytStatusShortList; stdcall;
    function getScrollableFilteredList(const aENWorkOrderBytStatusFilter: ENWorkOrderBytStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderBytStatusFilter: ENWorkOrderBytStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWorkOrderBytStatusShort; stdcall;
  end;


implementation



  destructor ENWorkOrderBytStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderBytStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytStatus');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytStatusRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytStatusFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytStatusShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderBytStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderBytStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderBytStatusControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderBytStatusControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytStatusController/action/ENWorkOrderBytStatusController.%operationName%');


end.
