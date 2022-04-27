unit ENRouteBytController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
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

  ENRouteByt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRouteBytRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRouteByt = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fnumbergen : WideString;
    FrouteCode : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property  routeCode : Integer read FrouteCode write FrouteCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
  end;

{
  ENRouteBytFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fnumbergen : WideString;
    FrouteCode : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property  routeCode : Integer read FrouteCode write FrouteCode;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
  end;
}

  ENRouteBytFilter = class(ENRouteByt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRouteBytShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fnumbergen : WideString;
    FrouteCode : Integer;
    FelementCode : Integer;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property  routeCode : Integer read FrouteCode write FrouteCode;

    property elementCode : Integer read FelementCode write FelementCode;
  end;

  ArrayOfENRouteBytShort = array of ENRouteBytShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRouteBytShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRouteBytShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRouteBytShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRouteBytController/message/
  // soapAction: http://ksoe.org/ENRouteBytController/action/ENRouteBytController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRouteBytControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRouteBytController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRouteBytControllerSoapPort = interface(IInvokable)
  ['{461f461f-461f-461f-461f-461f461f461f}']
    function add(const aENRouteByt: ENRouteByt): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRouteByt: ENRouteByt); stdcall;
    function getObject(const anObjectCode: Integer): ENRouteByt; stdcall;
    function getList: ENRouteBytShortList; stdcall;
    function getFilteredList(const aENRouteBytFilter: ENRouteBytFilter): ENRouteBytShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytShortList; stdcall;
    function getScrollableFilteredList(const aENRouteBytFilter: ENRouteBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRouteBytFilter: ENRouteBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRouteBytShort; stdcall;
  end;


implementation

  destructor ENRouteByt.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{
  destructor ENRouteBytFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
}

  destructor ENRouteBytFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENRouteBytShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRouteByt, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteByt');
  RemClassRegistry.RegisterXSClass(ENRouteBytRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytRef');
  RemClassRegistry.RegisterXSClass(ENRouteBytFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytFilter');
  RemClassRegistry.RegisterXSClass(ENRouteBytShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytShort');
  RemClassRegistry.RegisterXSClass(ENRouteBytShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRouteBytShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRouteBytShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRouteBytControllerSoapPort), 'http://ksoe.org/ENRouteBytController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRouteBytControllerSoapPort), 'http://ksoe.org/ENRouteBytController/action/ENRouteBytController.%operationName%');


end.
