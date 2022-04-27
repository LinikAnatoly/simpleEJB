unit ENIPStatusController;

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

  ENIPStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENIPStatusFilter = class(TRemotable)
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

  ENIPStatusFilter = class(ENIPStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIPStatusShort = array of ENIPStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPStatusController/message/
  // soapAction: http://ksoe.org/ENIPStatusController/action/ENIPStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPStatusControllerSoapPort = interface(IInvokable)
  ['{b00eb00e-b00e-b00e-b00e-b00eb00eb00e}']
    function add(const aENIPStatus: ENIPStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPStatus: ENIPStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENIPStatus; stdcall;
    function getList: ENIPStatusShortList; stdcall;
    function getFilteredList(const aENIPStatusFilter: ENIPStatusFilter): ENIPStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPStatusShortList; stdcall;
    function getScrollableFilteredList(const aENIPStatusFilter: ENIPStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPStatusFilter: ENIPStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPStatusShort; stdcall;
  end;


implementation



  destructor ENIPStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPStatus');
  RemClassRegistry.RegisterXSClass(ENIPStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPStatusRef');
  RemClassRegistry.RegisterXSClass(ENIPStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPStatusFilter');
  RemClassRegistry.RegisterXSClass(ENIPStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPStatusShort');
  RemClassRegistry.RegisterXSClass(ENIPStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPStatusControllerSoapPort), 'http://ksoe.org/ENIPStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPStatusControllerSoapPort), 'http://ksoe.org/ENIPStatusController/action/ENIPStatusController.%operationName%');


end.
