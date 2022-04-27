unit RQApprovedCostStatusController;

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

  RQApprovedCostStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApprovedCostStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApprovedCostStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQApprovedCostStatusFilter = class(TRemotable)
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

  RQApprovedCostStatusFilter = class(RQApprovedCostStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQApprovedCostStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQApprovedCostStatusShort = array of RQApprovedCostStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQApprovedCostStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQApprovedCostStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQApprovedCostStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQApprovedCostStatusController/message/
  // soapAction: http://ksoe.org/RQApprovedCostStatusController/action/RQApprovedCostStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQApprovedCostStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQApprovedCostStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQApprovedCostStatusControllerSoapPort = interface(IInvokable)
  ['{1D2A9B10-5A35-4F1E-99F4-3DD32B478104}']
    function add(const aRQApprovedCostStatus: RQApprovedCostStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQApprovedCostStatus: RQApprovedCostStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQApprovedCostStatus; stdcall;
    function getList: RQApprovedCostStatusShortList; stdcall;
    function getFilteredList(const aRQApprovedCostStatusFilter: RQApprovedCostStatusFilter): RQApprovedCostStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQApprovedCostStatusFilter: RQApprovedCostStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQApprovedCostStatusFilter: RQApprovedCostStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQApprovedCostStatusShort; stdcall;
  end;


implementation



  destructor RQApprovedCostStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQApprovedCostStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostStatus');
  RemClassRegistry.RegisterXSClass(RQApprovedCostStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostStatusRef');
  RemClassRegistry.RegisterXSClass(RQApprovedCostStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostStatusFilter');
  RemClassRegistry.RegisterXSClass(RQApprovedCostStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostStatusShort');
  RemClassRegistry.RegisterXSClass(RQApprovedCostStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQApprovedCostStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQApprovedCostStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQApprovedCostStatusControllerSoapPort), 'http://ksoe.org/RQApprovedCostStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQApprovedCostStatusControllerSoapPort), 'http://ksoe.org/RQApprovedCostStatusController/action/RQApprovedCostStatusController.%operationName%');


end.
