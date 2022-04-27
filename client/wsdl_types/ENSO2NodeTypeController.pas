unit ENSO2NodeTypeController;

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

  ENSO2NodeType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2NodeTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSO2NodeType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENSO2NodeTypeFilter = class(TRemotable)
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

  ENSO2NodeTypeFilter = class(ENSO2NodeType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSO2NodeTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENSO2NodeTypeShort = array of ENSO2NodeTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSO2NodeTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSO2NodeTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSO2NodeTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSO2NodeTypeController/message/
  // soapAction: http://ksoe.org/ENSO2NodeTypeController/action/ENSO2NodeTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSO2NodeTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSO2NodeTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSO2NodeTypeControllerSoapPort = interface(IInvokable)
  ['{6D965A0B-E106-4ABC-B1D1-151DF5D1CBB4}']
    function add(const aENSO2NodeType: ENSO2NodeType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSO2NodeType: ENSO2NodeType); stdcall;
    function getObject(const anObjectCode: Integer): ENSO2NodeType; stdcall;
    function getList: ENSO2NodeTypeShortList; stdcall;
    function getFilteredList(const aENSO2NodeTypeFilter: ENSO2NodeTypeFilter): ENSO2NodeTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeTypeShortList; stdcall;
    function getScrollableFilteredList(const aENSO2NodeTypeFilter: ENSO2NodeTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSO2NodeTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSO2NodeTypeFilter: ENSO2NodeTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSO2NodeTypeShort; stdcall;
  end;


implementation



  destructor ENSO2NodeTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSO2NodeType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeType');
  RemClassRegistry.RegisterXSClass(ENSO2NodeTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeTypeRef');
  RemClassRegistry.RegisterXSClass(ENSO2NodeTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSO2NodeTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeTypeShort');
  RemClassRegistry.RegisterXSClass(ENSO2NodeTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSO2NodeTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSO2NodeTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSO2NodeTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSO2NodeTypeControllerSoapPort), 'http://ksoe.org/ENSO2NodeTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSO2NodeTypeControllerSoapPort), 'http://ksoe.org/ENSO2NodeTypeController/action/ENSO2NodeTypeController.%operationName%');


end.
