unit ENBuilding2ActTypeWorkController;

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

  ENBuilding2ActTypeWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ActTypeWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBuilding2ActTypeWork = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBuilding2ActTypeWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;
}

  ENBuilding2ActTypeWorkFilter = class(ENBuilding2ActTypeWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBuilding2ActTypeWorkShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBuilding2ActTypeWorkShort = array of ENBuilding2ActTypeWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBuilding2ActTypeWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBuilding2ActTypeWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBuilding2ActTypeWorkShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBuilding2ActTypeWorkController/message/
  // soapAction: http://ksoe.org/ENBuilding2ActTypeWorkController/action/ENBuilding2ActTypeWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBuilding2ActTypeWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBuilding2ActTypeWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBuilding2ActTypeWorkControllerSoapPort = interface(IInvokable)
  ['{C91CF01D-C56D-44C7-AD69-1BDD79891CBB}']
    function add(const aENBuilding2ActTypeWork: ENBuilding2ActTypeWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBuilding2ActTypeWork: ENBuilding2ActTypeWork); stdcall;
    function getObject(const anObjectCode: Integer): ENBuilding2ActTypeWork; stdcall;
    function getList: ENBuilding2ActTypeWorkShortList; stdcall;
    function getFilteredList(const aENBuilding2ActTypeWorkFilter: ENBuilding2ActTypeWorkFilter): ENBuilding2ActTypeWorkShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ActTypeWorkShortList; stdcall;
    function getScrollableFilteredList(const aENBuilding2ActTypeWorkFilter: ENBuilding2ActTypeWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ActTypeWorkShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBuilding2ActTypeWorkShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBuilding2ActTypeWorkFilter: ENBuilding2ActTypeWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBuilding2ActTypeWorkShort; stdcall;
  end;


implementation



  destructor ENBuilding2ActTypeWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBuilding2ActTypeWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ActTypeWork');
  RemClassRegistry.RegisterXSClass(ENBuilding2ActTypeWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ActTypeWorkRef');
  RemClassRegistry.RegisterXSClass(ENBuilding2ActTypeWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ActTypeWorkFilter');
  RemClassRegistry.RegisterXSClass(ENBuilding2ActTypeWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ActTypeWorkShort');
  RemClassRegistry.RegisterXSClass(ENBuilding2ActTypeWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBuilding2ActTypeWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBuilding2ActTypeWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBuilding2ActTypeWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBuilding2ActTypeWorkControllerSoapPort), 'http://ksoe.org/ENBuilding2ActTypeWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBuilding2ActTypeWorkControllerSoapPort), 'http://ksoe.org/ENBuilding2ActTypeWorkController/action/ENBuilding2ActTypeWorkController.%operationName%');


end.
