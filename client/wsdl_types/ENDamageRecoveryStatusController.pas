unit ENDamageRecoveryStatusController;

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

  ENDamageRecoveryStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecoveryStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecoveryStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENDamageRecoveryStatusFilter = class(TRemotable)
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

  ENDamageRecoveryStatusFilter = class(ENDamageRecoveryStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDamageRecoveryStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDamageRecoveryStatusShort = array of ENDamageRecoveryStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDamageRecoveryStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDamageRecoveryStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDamageRecoveryStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDamageRecoveryStatusController/message/
  // soapAction: http://ksoe.org/ENDamageRecoveryStatusController/action/ENDamageRecoveryStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDamageRecoveryStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDamageRecoveryStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDamageRecoveryStatusControllerSoapPort = interface(IInvokable)
  ['{6fd36fd3-6fd3-6fd3-6fd3-6fd36fd36fd3}']
    function add(const aENDamageRecoveryStatus: ENDamageRecoveryStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDamageRecoveryStatus: ENDamageRecoveryStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENDamageRecoveryStatus; stdcall;
    function getList: ENDamageRecoveryStatusShortList; stdcall;
    function getFilteredList(const aENDamageRecoveryStatusFilter: ENDamageRecoveryStatusFilter): ENDamageRecoveryStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryStatusShortList; stdcall;
    function getScrollableFilteredList(const aENDamageRecoveryStatusFilter: ENDamageRecoveryStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDamageRecoveryStatusFilter: ENDamageRecoveryStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDamageRecoveryStatusShort; stdcall;
  end;


implementation



  destructor ENDamageRecoveryStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDamageRecoveryStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryStatus');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryStatusRef');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryStatusFilter');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryStatusShort');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDamageRecoveryStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDamageRecoveryStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDamageRecoveryStatusControllerSoapPort), 'http://ksoe.org/ENDamageRecoveryStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDamageRecoveryStatusControllerSoapPort), 'http://ksoe.org/ENDamageRecoveryStatusController/action/ENDamageRecoveryStatusController.%operationName%');


end.
