unit ENMethodExecuteWorkController;

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

  ENMethodExecuteWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMethodExecuteWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMethodExecuteWork = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENMethodExecuteWorkFilter = class(TRemotable)
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

  ENMethodExecuteWorkFilter = class(ENMethodExecuteWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMethodExecuteWorkShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMethodExecuteWorkShort = array of ENMethodExecuteWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMethodExecuteWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMethodExecuteWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMethodExecuteWorkShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMethodExecuteWorkController/message/
  // soapAction: http://ksoe.org/ENMethodExecuteWorkController/action/ENMethodExecuteWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMethodExecuteWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMethodExecuteWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMethodExecuteWorkControllerSoapPort = interface(IInvokable)
  ['{13f913f9-13f9-13f9-13f9-13f913f913f9}']
    function add(const aENMethodExecuteWork: ENMethodExecuteWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMethodExecuteWork: ENMethodExecuteWork); stdcall;
    function getObject(const anObjectCode: Integer): ENMethodExecuteWork; stdcall;
    function getList: ENMethodExecuteWorkShortList; stdcall;
    function getFilteredList(const aENMethodExecuteWorkFilter: ENMethodExecuteWorkFilter): ENMethodExecuteWorkShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMethodExecuteWorkShortList; stdcall;
    function getScrollableFilteredList(const aENMethodExecuteWorkFilter: ENMethodExecuteWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMethodExecuteWorkShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMethodExecuteWorkShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMethodExecuteWorkFilter: ENMethodExecuteWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMethodExecuteWorkShort; stdcall;
  end;


implementation



  destructor ENMethodExecuteWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMethodExecuteWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMethodExecuteWork');
  RemClassRegistry.RegisterXSClass(ENMethodExecuteWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMethodExecuteWorkRef');
  RemClassRegistry.RegisterXSClass(ENMethodExecuteWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMethodExecuteWorkFilter');
  RemClassRegistry.RegisterXSClass(ENMethodExecuteWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMethodExecuteWorkShort');
  RemClassRegistry.RegisterXSClass(ENMethodExecuteWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMethodExecuteWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMethodExecuteWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMethodExecuteWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMethodExecuteWorkControllerSoapPort), 'http://ksoe.org/ENMethodExecuteWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMethodExecuteWorkControllerSoapPort), 'http://ksoe.org/ENMethodExecuteWorkController/action/ENMethodExecuteWorkController.%operationName%');


end.
