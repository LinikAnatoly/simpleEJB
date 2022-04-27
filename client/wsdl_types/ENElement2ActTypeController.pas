unit ENElement2ActTypeController;

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

  ENElement2ActType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ActTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENElement2ActType = class(TRemotable)
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
  ENElement2ActTypeFilter = class(TRemotable)
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

  ENElement2ActTypeFilter = class(ENElement2ActType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENElement2ActTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENElement2ActTypeShort = array of ENElement2ActTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENElement2ActTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENElement2ActTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENElement2ActTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENElement2ActTypeController/message/
  // soapAction: http://ksoe.org/ENElement2ActTypeController/action/ENElement2ActTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENElement2ActTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENElement2ActTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENElement2ActTypeControllerSoapPort = interface(IInvokable)
  ['{1FC96F9B-E8D3-41E8-B15A-8343E8187825}']
    function add(const aENElement2ActType: ENElement2ActType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENElement2ActType: ENElement2ActType); stdcall;
    function getObject(const anObjectCode: Integer): ENElement2ActType; stdcall;
    function getList: ENElement2ActTypeShortList; stdcall;
    function getFilteredList(const aENElement2ActTypeFilter: ENElement2ActTypeFilter): ENElement2ActTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActTypeShortList; stdcall;
    function getScrollableFilteredList(const aENElement2ActTypeFilter: ENElement2ActTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENElement2ActTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENElement2ActTypeFilter: ENElement2ActTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENElement2ActTypeShort; stdcall;
  end;


implementation



  destructor ENElement2ActTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENElement2ActType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActType');
  RemClassRegistry.RegisterXSClass(ENElement2ActTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActTypeRef');
  RemClassRegistry.RegisterXSClass(ENElement2ActTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActTypeFilter');
  RemClassRegistry.RegisterXSClass(ENElement2ActTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActTypeShort');
  RemClassRegistry.RegisterXSClass(ENElement2ActTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENElement2ActTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENElement2ActTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENElement2ActTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENElement2ActTypeControllerSoapPort), 'http://ksoe.org/ENElement2ActTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENElement2ActTypeControllerSoapPort), 'http://ksoe.org/ENElement2ActTypeController/action/ENElement2ActTypeController.%operationName%');


end.
