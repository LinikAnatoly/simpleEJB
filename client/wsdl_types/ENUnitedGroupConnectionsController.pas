unit ENUnitedGroupConnectionsController;

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

  ENUnitedGroupConnections            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENUnitedGroupConnectionsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENUnitedGroupConnections = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;

{
  ENUnitedGroupConnectionsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;
}

  ENUnitedGroupConnectionsFilter = class(ENUnitedGroupConnections)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENUnitedGroupConnectionsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;

  end;

  ArrayOfENUnitedGroupConnectionsShort = array of ENUnitedGroupConnectionsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENUnitedGroupConnectionsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENUnitedGroupConnectionsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENUnitedGroupConnectionsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENUnitedGroupConnectionsController/message/
  // soapAction: http://ksoe.org/ENUnitedGroupConnectionsController/action/ENUnitedGroupConnectionsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENUnitedGroupConnectionsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENUnitedGroupConnectionsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENUnitedGroupConnectionsControllerSoapPort = interface(IInvokable)
  ['{9FB3C133-7245-4AE2-BEF5-E3CFC59C0D43}']
    function add(const aENUnitedGroupConnections: ENUnitedGroupConnections): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENUnitedGroupConnections: ENUnitedGroupConnections); stdcall;
    function getObject(const anObjectCode: Integer): ENUnitedGroupConnections; stdcall;
    function getList: ENUnitedGroupConnectionsShortList; stdcall;
    function getFilteredList(const aENUnitedGroupConnectionsFilter: ENUnitedGroupConnectionsFilter): ENUnitedGroupConnectionsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroupConnectionsShortList; stdcall;
    function getScrollableFilteredList(const aENUnitedGroupConnectionsFilter: ENUnitedGroupConnectionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroupConnectionsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENUnitedGroupConnectionsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENUnitedGroupConnectionsFilter: ENUnitedGroupConnectionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENUnitedGroupConnectionsShort; stdcall;
  end;


implementation



  destructor ENUnitedGroupConnectionsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENUnitedGroupConnections, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroupConnections');
  RemClassRegistry.RegisterXSClass(ENUnitedGroupConnectionsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroupConnectionsRef');
  RemClassRegistry.RegisterXSClass(ENUnitedGroupConnectionsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroupConnectionsFilter');
  RemClassRegistry.RegisterXSClass(ENUnitedGroupConnectionsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroupConnectionsShort');
  RemClassRegistry.RegisterXSClass(ENUnitedGroupConnectionsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENUnitedGroupConnectionsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENUnitedGroupConnectionsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENUnitedGroupConnectionsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENUnitedGroupConnectionsControllerSoapPort), 'http://ksoe.org/ENUnitedGroupConnectionsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENUnitedGroupConnectionsControllerSoapPort), 'http://ksoe.org/ENUnitedGroupConnectionsController/action/ENUnitedGroupConnectionsController.%operationName%');


end.
