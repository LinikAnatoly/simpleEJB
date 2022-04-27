unit SCSealStatusController;

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

  SCSealStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  SCSealStatusFilter = class(TRemotable)
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

  SCSealStatusFilter = class(SCSealStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSealStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCSealStatusShort = array of SCSealStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSealStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSealStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSealStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSealStatusController/message/
  // soapAction: http://ksoe.org/SCSealStatusController/action/SCSealStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSealStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSealStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSealStatusControllerSoapPort = interface(IInvokable)
  ['{283ECFD0-3E24-478B-8C38-5067BE3CD6CF}']
    function add(const aSCSealStatus: SCSealStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSealStatus: SCSealStatus); stdcall;
    function getObject(const anObjectCode: Integer): SCSealStatus; stdcall;
    function getList: SCSealStatusShortList; stdcall;
    function getFilteredList(const aSCSealStatusFilter: SCSealStatusFilter): SCSealStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSealStatusShortList; stdcall;
    function getScrollableFilteredList(const aSCSealStatusFilter: SCSealStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSealStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSealStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSealStatusFilter: SCSealStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSealStatusShort; stdcall;
  end;


implementation



  destructor SCSealStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSealStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealStatus');
  RemClassRegistry.RegisterXSClass(SCSealStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealStatusRef');
  RemClassRegistry.RegisterXSClass(SCSealStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealStatusFilter');
  RemClassRegistry.RegisterXSClass(SCSealStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealStatusShort');
  RemClassRegistry.RegisterXSClass(SCSealStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSealStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSealStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSealStatusControllerSoapPort), 'http://ksoe.org/SCSealStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSealStatusControllerSoapPort), 'http://ksoe.org/SCSealStatusController/action/SCSealStatusController.%operationName%');


end.
