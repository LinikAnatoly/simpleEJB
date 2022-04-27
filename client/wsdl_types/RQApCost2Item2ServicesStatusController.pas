unit RQApCost2Item2ServicesStatusController;

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

  RQApCost2Item2ServicesStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApCost2Item2ServicesStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApCost2Item2ServicesStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQApCost2Item2ServicesStatusFilter = class(TRemotable)
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

  RQApCost2Item2ServicesStatusFilter = class(RQApCost2Item2ServicesStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQApCost2Item2ServicesStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQApCost2Item2ServicesStatusShort = array of RQApCost2Item2ServicesStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQApCost2Item2ServicesStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQApCost2Item2ServicesStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQApCost2Item2ServicesStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQApCost2Item2ServicesStatusController/message/
  // soapAction: http://ksoe.org/RQApCost2Item2ServicesStatusController/action/RQApCost2Item2ServicesStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQApCost2Item2ServicesStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQApCost2Item2ServicesStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQApCost2Item2ServicesStatusControllerSoapPort = interface(IInvokable)
  ['{C514B971-39A3-44BE-A37E-47057F8326ED}']
    function add(const aRQApCost2Item2ServicesStatus: RQApCost2Item2ServicesStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQApCost2Item2ServicesStatus: RQApCost2Item2ServicesStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQApCost2Item2ServicesStatus; stdcall;
    function getList: RQApCost2Item2ServicesStatusShortList; stdcall;
    function getFilteredList(const aRQApCost2Item2ServicesStatusFilter: RQApCost2Item2ServicesStatusFilter): RQApCost2Item2ServicesStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQApCost2Item2ServicesStatusFilter: RQApCost2Item2ServicesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQApCost2Item2ServicesStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQApCost2Item2ServicesStatusFilter: RQApCost2Item2ServicesStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQApCost2Item2ServicesStatusShort; stdcall;
  end;


implementation



  destructor RQApCost2Item2ServicesStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesStatus');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesStatusRef');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesStatusFilter');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesStatusShort');
  RemClassRegistry.RegisterXSClass(RQApCost2Item2ServicesStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApCost2Item2ServicesStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQApCost2Item2ServicesStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQApCost2Item2ServicesStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQApCost2Item2ServicesStatusControllerSoapPort), 'http://ksoe.org/RQApCost2Item2ServicesStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQApCost2Item2ServicesStatusControllerSoapPort), 'http://ksoe.org/RQApCost2Item2ServicesStatusController/action/RQApCost2Item2ServicesStatusController.%operationName%');


end.
