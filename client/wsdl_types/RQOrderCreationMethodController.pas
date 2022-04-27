unit RQOrderCreationMethodController;

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

  RQOrderCreationMethod            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderCreationMethodRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderCreationMethod = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQOrderCreationMethodFilter = class(TRemotable)
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

  RQOrderCreationMethodFilter = class(RQOrderCreationMethod)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrderCreationMethodShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderCreationMethodShort = array of RQOrderCreationMethodShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderCreationMethodShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderCreationMethodShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderCreationMethodShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderCreationMethodController/message/
  // soapAction: http://ksoe.org/RQOrderCreationMethodController/action/RQOrderCreationMethodController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderCreationMethodControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderCreationMethodController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderCreationMethodControllerSoapPort = interface(IInvokable)
  ['{774A2404-5317-46F2-8E85-8F4C0D3FC003}']
    function add(const aRQOrderCreationMethod: RQOrderCreationMethod): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderCreationMethod: RQOrderCreationMethod); stdcall;
    function getObject(const anObjectCode: Integer): RQOrderCreationMethod; stdcall;
    function getList: RQOrderCreationMethodShortList; stdcall;
    function getFilteredList(const aRQOrderCreationMethodFilter: RQOrderCreationMethodFilter): RQOrderCreationMethodShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderCreationMethodShortList; stdcall;
    function getScrollableFilteredList(const aRQOrderCreationMethodFilter: RQOrderCreationMethodFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderCreationMethodShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderCreationMethodShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrderCreationMethodFilter: RQOrderCreationMethodFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrderCreationMethodShort; stdcall;
  end;


implementation



  destructor RQOrderCreationMethodShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderCreationMethod, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderCreationMethod');
  RemClassRegistry.RegisterXSClass(RQOrderCreationMethodRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderCreationMethodRef');
  RemClassRegistry.RegisterXSClass(RQOrderCreationMethodFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderCreationMethodFilter');
  RemClassRegistry.RegisterXSClass(RQOrderCreationMethodShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderCreationMethodShort');
  RemClassRegistry.RegisterXSClass(RQOrderCreationMethodShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderCreationMethodShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderCreationMethodShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderCreationMethodShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderCreationMethodControllerSoapPort), 'http://ksoe.org/RQOrderCreationMethodController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderCreationMethodControllerSoapPort), 'http://ksoe.org/RQOrderCreationMethodController/action/RQOrderCreationMethodController.%operationName%');


end.
