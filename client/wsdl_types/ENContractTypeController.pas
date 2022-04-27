unit ENContractTypeController;

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

  ENContractType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContractTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContractType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENContractTypeFilter = class(TRemotable)
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

  ENContractTypeFilter = class(ENContractType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENContractTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENContractTypeShort = array of ENContractTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContractTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContractTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContractTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContractTypeController/message/
  // soapAction: http://ksoe.org/ENContractTypeController/action/ENContractTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContractTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContractTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContractTypeControllerSoapPort = interface(IInvokable)
  ['{3734E329-8E0F-4E65-BFB6-DAF292918EEF}']
    function add(const aENContractType: ENContractType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContractType: ENContractType); stdcall;
    function getObject(const anObjectCode: Integer): ENContractType; stdcall;
    function getList: ENContractTypeShortList; stdcall;
    function getFilteredList(const aENContractTypeFilter: ENContractTypeFilter): ENContractTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContractTypeShortList; stdcall;
    function getScrollableFilteredList(const aENContractTypeFilter: ENContractTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContractTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContractTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENContractTypeFilter: ENContractTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENContractTypeShort; stdcall;
  end;


implementation



  destructor ENContractTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContractType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractType');
  RemClassRegistry.RegisterXSClass(ENContractTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractTypeRef');
  RemClassRegistry.RegisterXSClass(ENContractTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractTypeFilter');
  RemClassRegistry.RegisterXSClass(ENContractTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractTypeShort');
  RemClassRegistry.RegisterXSClass(ENContractTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContractTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContractTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContractTypeControllerSoapPort), 'http://ksoe.org/ENContractTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContractTypeControllerSoapPort), 'http://ksoe.org/ENContractTypeController/action/ENContractTypeController.%operationName%');


end.
