unit ENIPItemStatusController;

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

  ENIPItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItemStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENIPItemStatusFilter = class(TRemotable)
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

  ENIPItemStatusFilter = class(ENIPItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPItemStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIPItemStatusShort = array of ENIPItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPItemStatusController/message/
  // soapAction: http://ksoe.org/ENIPItemStatusController/action/ENIPItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPItemStatusControllerSoapPort = interface(IInvokable)
  ['{c74fc74f-c74f-c74f-c74f-c74fc74fc74f}']
    function add(const aENIPItemStatus: ENIPItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPItemStatus: ENIPItemStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENIPItemStatus; stdcall;
    function getList: ENIPItemStatusShortList; stdcall;
    function getFilteredList(const aENIPItemStatusFilter: ENIPItemStatusFilter): ENIPItemStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPItemStatusShortList; stdcall;
    function getScrollableFilteredList(const aENIPItemStatusFilter: ENIPItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPItemStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPItemStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPItemStatusFilter: ENIPItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPItemStatusShort; stdcall;
  end;


implementation



  destructor ENIPItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemStatus');
  RemClassRegistry.RegisterXSClass(ENIPItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemStatusRef');
  RemClassRegistry.RegisterXSClass(ENIPItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemStatusFilter');
  RemClassRegistry.RegisterXSClass(ENIPItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemStatusShort');
  RemClassRegistry.RegisterXSClass(ENIPItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPItemStatusControllerSoapPort), 'http://ksoe.org/ENIPItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPItemStatusControllerSoapPort), 'http://ksoe.org/ENIPItemStatusController/action/ENIPItemStatusController.%operationName%');


end.
