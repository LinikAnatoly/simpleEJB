unit ENRegForSupplierTypeController;

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

  ENRegForSupplierType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;

{
  ENRegForSupplierTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
  end;
}

  ENRegForSupplierTypeFilter = class(ENRegForSupplierType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRegForSupplierTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fdescription : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;

  end;

  ArrayOfENRegForSupplierTypeShort = array of ENRegForSupplierTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRegForSupplierTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRegForSupplierTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRegForSupplierTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRegForSupplierTypeController/message/
  // soapAction: http://ksoe.org/ENRegForSupplierTypeController/action/ENRegForSupplierTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRegForSupplierTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRegForSupplierTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRegForSupplierTypeControllerSoapPort = interface(IInvokable)
  ['{DDCB1FF3-B135-40DE-8EE0-22DBC1FD6DD5}']
    function add(const aENRegForSupplierType: ENRegForSupplierType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRegForSupplierType: ENRegForSupplierType); stdcall;
    function getObject(const anObjectCode: Integer): ENRegForSupplierType; stdcall;
    function getList: ENRegForSupplierTypeShortList; stdcall;
    function getFilteredList(const aENRegForSupplierTypeFilter: ENRegForSupplierTypeFilter): ENRegForSupplierTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierTypeShortList; stdcall;
    function getScrollableFilteredList(const aENRegForSupplierTypeFilter: ENRegForSupplierTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRegForSupplierTypeFilter: ENRegForSupplierTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRegForSupplierTypeShort; stdcall;
  end;


implementation



  destructor ENRegForSupplierTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRegForSupplierType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierType');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierTypeRef');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierTypeFilter');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierTypeShort');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRegForSupplierTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRegForSupplierTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRegForSupplierTypeControllerSoapPort), 'http://ksoe.org/ENRegForSupplierTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRegForSupplierTypeControllerSoapPort), 'http://ksoe.org/ENRegForSupplierTypeController/action/ENRegForSupplierTypeController.%operationName%');


end.
