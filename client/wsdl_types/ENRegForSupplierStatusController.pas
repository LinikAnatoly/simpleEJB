unit ENRegForSupplierStatusController;

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

  ENRegForSupplierStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENRegForSupplierStatusFilter = class(TRemotable)
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

  ENRegForSupplierStatusFilter = class(ENRegForSupplierStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRegForSupplierStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENRegForSupplierStatusShort = array of ENRegForSupplierStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRegForSupplierStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRegForSupplierStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRegForSupplierStatusShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRegForSupplierStatusController/message/
  // soapAction: http://ksoe.org/ENRegForSupplierStatusController/action/ENRegForSupplierStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRegForSupplierStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRegForSupplierStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRegForSupplierStatusControllerSoapPort = interface(IInvokable)
  ['{08ACA524-D2DA-43B0-92CC-E86B0DD34163}']
    function add(const aENRegForSupplierStatus: ENRegForSupplierStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRegForSupplierStatus: ENRegForSupplierStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENRegForSupplierStatus; stdcall;
    function getList: ENRegForSupplierStatusShortList; stdcall;
    function getFilteredList(const aENRegForSupplierStatusFilter: ENRegForSupplierStatusFilter): ENRegForSupplierStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierStatusShortList; stdcall;
    function getScrollableFilteredList(const aENRegForSupplierStatusFilter: ENRegForSupplierStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRegForSupplierStatusFilter: ENRegForSupplierStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRegForSupplierStatusShort; stdcall;
  end;


implementation



  destructor ENRegForSupplierStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRegForSupplierStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierStatus');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierStatusRef');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierStatusFilter');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierStatusShort');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRegForSupplierStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRegForSupplierStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRegForSupplierStatusControllerSoapPort), 'http://ksoe.org/ENRegForSupplierStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRegForSupplierStatusControllerSoapPort), 'http://ksoe.org/ENRegForSupplierStatusController/action/ENRegForSupplierStatusController.%operationName%');


end.
