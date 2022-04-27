unit RQAllocationListStatusController;

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

  RQAllocationListStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQAllocationListStatusFilter = class(TRemotable)
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

  RQAllocationListStatusFilter = class(RQAllocationListStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQAllocationListStatusShort = array of RQAllocationListStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListStatusController/message/
  // soapAction: http://ksoe.org/RQAllocationListStatusController/action/RQAllocationListStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListStatusControllerSoapPort = interface(IInvokable)
  ['{482019C3-38DF-4AF1-AC75-5AE1A22B6314}']
    function add(const aRQAllocationListStatus: RQAllocationListStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationListStatus: RQAllocationListStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationListStatus; stdcall;
    function getList: RQAllocationListStatusShortList; stdcall;
    function getFilteredList(const aRQAllocationListStatusFilter: RQAllocationListStatusFilter): RQAllocationListStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListStatusFilter: RQAllocationListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListStatusFilter: RQAllocationListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListStatusShort; stdcall;
  end;


implementation



  destructor RQAllocationListStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationListStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListStatus');
  RemClassRegistry.RegisterXSClass(RQAllocationListStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListStatusRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListStatusFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListStatusShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListStatusControllerSoapPort), 'http://ksoe.org/RQAllocationListStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListStatusControllerSoapPort), 'http://ksoe.org/RQAllocationListStatusController/action/RQAllocationListStatusController.%operationName%');


end.
