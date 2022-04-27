unit RQPlanPayStatusController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQPlanPayStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPlanPayStatusFilter = class(TRemotable)
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

  RQPlanPayStatusFilter = class(RQPlanPayStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPlanPayStatusShort = array of RQPlanPayStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayStatusController/message/
  // soapAction: http://ksoe.org/RQPlanPayStatusController/action/RQPlanPayStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayStatusControllerSoapPort = interface(IInvokable)
  ['{e443e443-e443-e443-e443-e443e443e443}']
    function add(const aRQPlanPayStatus: RQPlanPayStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayStatus: RQPlanPayStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayStatus; stdcall;
    function getList: RQPlanPayStatusShortList; stdcall;
    function getFilteredList(const aRQPlanPayStatusFilter: RQPlanPayStatusFilter): RQPlanPayStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayStatusFilter: RQPlanPayStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayStatusFilter: RQPlanPayStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayStatusShort; stdcall;
  end;


implementation



  destructor RQPlanPayStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayStatus');
  RemClassRegistry.RegisterXSClass(RQPlanPayStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayStatusRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayStatusFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayStatusShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayStatusControllerSoapPort), 'http://ksoe.org/RQPlanPayStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayStatusControllerSoapPort), 'http://ksoe.org/RQPlanPayStatusController/action/RQPlanPayStatusController.%operationName%');


end.
