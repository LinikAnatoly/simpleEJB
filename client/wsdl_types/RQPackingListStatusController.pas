unit RQPackingListStatusController;

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

  RQPackingListStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPackingListStatusFilter = class(TRemotable)
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

  RQPackingListStatusFilter = class(RQPackingListStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingListStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPackingListStatusShort = array of RQPackingListStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingListStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingListStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingListStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingListStatusController/message/
  // soapAction: http://ksoe.org/RQPackingListStatusController/action/RQPackingListStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingListStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingListStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingListStatusControllerSoapPort = interface(IInvokable)
  ['{16291629-1629-1629-1629-162916291629}']
    function add(const aRQPackingListStatus: RQPackingListStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPackingListStatus: RQPackingListStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQPackingListStatus; stdcall;
    function getList: RQPackingListStatusShortList; stdcall;
    function getFilteredList(const aRQPackingListStatusFilter: RQPackingListStatusFilter): RQPackingListStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingListStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingListStatusFilter: RQPackingListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingListStatusFilter: RQPackingListStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingListStatusShort; stdcall;
  end;


implementation



  destructor RQPackingListStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingListStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListStatus');
  RemClassRegistry.RegisterXSClass(RQPackingListStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListStatusRef');
  RemClassRegistry.RegisterXSClass(RQPackingListStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListStatusFilter');
  RemClassRegistry.RegisterXSClass(RQPackingListStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListStatusShort');
  RemClassRegistry.RegisterXSClass(RQPackingListStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingListStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingListStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingListStatusControllerSoapPort), 'http://ksoe.org/RQPackingListStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingListStatusControllerSoapPort), 'http://ksoe.org/RQPackingListStatusController/action/RQPackingListStatusController.%operationName%');


end.
