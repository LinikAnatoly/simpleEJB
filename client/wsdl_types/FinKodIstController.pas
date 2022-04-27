unit FinKodIstController;

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

  FinKodIst            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FinKodIstRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FinKodIst = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fvalue : Integer;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  value : Integer read Fvalue write Fvalue;
  end;

{
  FinKodIstFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fvalue : Integer;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  value : Integer read Fvalue write Fvalue;
  end;
}

  FinKodIstFilter = class(FinKodIst)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FinKodIstShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fvalue : Integer;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  value : Integer read Fvalue write Fvalue;
  end;

  ArrayOfFinKodIstShort = array of FinKodIstShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FinKodIstShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFinKodIstShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFinKodIstShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FinKodIstController/message/
  // soapAction: http://ksoe.org/FinKodIstController/action/FinKodIstController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FinKodIstControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FinKodIstController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FinKodIstControllerSoapPort = interface(IInvokable)
  ['{54e954e9-54e9-54e9-54e9-54e954e954e9}']
    function add(const aFinKodIst: FinKodIst): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFinKodIst: FinKodIst); stdcall;
    function getObject(const anObjectCode: Integer): FinKodIst; stdcall;
    function getList: FinKodIstShortList; stdcall;
    function getFilteredList(const aFinKodIstFilter: FinKodIstFilter): FinKodIstShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FinKodIstShortList; stdcall;
    function getScrollableFilteredList(const aFinKodIstFilter: FinKodIstFilter; const aFromPosition: Integer; const aQuantity: Integer): FinKodIstShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FinKodIstShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFinKodIstFilter: FinKodIstFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FinKodIstShort; stdcall;
  end;


implementation



  destructor FinKodIstShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FinKodIst, 'http://ksoe.org/EnergyproControllerService/type/', 'FinKodIst');
  RemClassRegistry.RegisterXSClass(FinKodIstRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FinKodIstRef');
  RemClassRegistry.RegisterXSClass(FinKodIstFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FinKodIstFilter');
  RemClassRegistry.RegisterXSClass(FinKodIstShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FinKodIstShort');
  RemClassRegistry.RegisterXSClass(FinKodIstShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FinKodIstShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFinKodIstShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFinKodIstShort');

  InvRegistry.RegisterInterface(TypeInfo(FinKodIstControllerSoapPort), 'http://ksoe.org/FinKodIstController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FinKodIstControllerSoapPort), 'http://ksoe.org/FinKodIstController/action/FinKodIstController.%operationName%');


end.
