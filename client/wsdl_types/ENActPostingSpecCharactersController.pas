unit ENActPostingSpecCharactersController;

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

  ENActPostingSpecCharacters            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingSpecCharactersRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingSpecCharacters = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
  end;

{
  ENActPostingSpecCharactersFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
  end;
}

  ENActPostingSpecCharactersFilter = class(ENActPostingSpecCharacters)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActPostingSpecCharactersShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;

  end;

  ArrayOfENActPostingSpecCharactersShort = array of ENActPostingSpecCharactersShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActPostingSpecCharactersShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActPostingSpecCharactersShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActPostingSpecCharactersShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActPostingSpecCharactersController/message/
  // soapAction: http://ksoe.org/ENActPostingSpecCharactersController/action/ENActPostingSpecCharactersController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActPostingSpecCharactersControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActPostingSpecCharactersController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActPostingSpecCharactersControllerSoapPort = interface(IInvokable)
  ['{B4EDAA1F-8624-4409-8B0A-42157E6FD276}']
    function add(const aENActPostingSpecCharacters: ENActPostingSpecCharacters): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActPostingSpecCharacters: ENActPostingSpecCharacters); stdcall;
    function getObject(const anObjectCode: Integer): ENActPostingSpecCharacters; stdcall;
    function getList: ENActPostingSpecCharactersShortList; stdcall;
    function getFilteredList(const aENActPostingSpecCharactersFilter: ENActPostingSpecCharactersFilter): ENActPostingSpecCharactersShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActPostingSpecCharactersShortList; stdcall;
    function getScrollableFilteredList(const aENActPostingSpecCharactersFilter: ENActPostingSpecCharactersFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingSpecCharactersShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingSpecCharactersShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActPostingSpecCharactersFilter: ENActPostingSpecCharactersFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActPostingSpecCharactersShort; stdcall;
  end;


implementation



  destructor ENActPostingSpecCharactersShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActPostingSpecCharacters, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingSpecCharacters');
  RemClassRegistry.RegisterXSClass(ENActPostingSpecCharactersRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingSpecCharactersRef');
  RemClassRegistry.RegisterXSClass(ENActPostingSpecCharactersFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingSpecCharactersFilter');
  RemClassRegistry.RegisterXSClass(ENActPostingSpecCharactersShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingSpecCharactersShort');
  RemClassRegistry.RegisterXSClass(ENActPostingSpecCharactersShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingSpecCharactersShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActPostingSpecCharactersShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActPostingSpecCharactersShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActPostingSpecCharactersControllerSoapPort), 'http://ksoe.org/ENActPostingSpecCharactersController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActPostingSpecCharactersControllerSoapPort), 'http://ksoe.org/ENActPostingSpecCharactersController/action/ENActPostingSpecCharactersController.%operationName%');


end.
