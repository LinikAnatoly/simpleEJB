unit ENServicesObjectKindFKController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
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

  ENServicesObjectKindFK            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectKindFKRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectKindFK = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENServicesObjectKindFKFilter = class(TRemotable)
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

  ENServicesObjectKindFKFilter = class(ENServicesObjectKindFK)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesObjectKindFKShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesObjectKindFKShort = array of ENServicesObjectKindFKShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesObjectKindFKShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesObjectKindFKShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesObjectKindFKShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesObjectKindFKController/message/
  // soapAction: http://ksoe.org/ENServicesObjectKindFKController/action/ENServicesObjectKindFKController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesObjectKindFKControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesObjectKindFKController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesObjectKindFKControllerSoapPort = interface(IInvokable)
  ['{4F485CF4-BD01-41F4-B410-10A40E60A215}']
    function add(const aENServicesObjectKindFK: ENServicesObjectKindFK): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesObjectKindFK: ENServicesObjectKindFK); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesObjectKindFK; stdcall;
    function getList: ENServicesObjectKindFKShortList; stdcall;
    function getFilteredList(const aENServicesObjectKindFKFilter: ENServicesObjectKindFKFilter): ENServicesObjectKindFKShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectKindFKShortList; stdcall;
    function getScrollableFilteredList(const aENServicesObjectKindFKFilter: ENServicesObjectKindFKFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectKindFKShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectKindFKShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesObjectKindFKFilter: ENServicesObjectKindFKFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesObjectKindFKShort; stdcall;
  end;


implementation



  destructor ENServicesObjectKindFKShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesObjectKindFK, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectKindFK');
  RemClassRegistry.RegisterXSClass(ENServicesObjectKindFKRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectKindFKRef');
  RemClassRegistry.RegisterXSClass(ENServicesObjectKindFKFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectKindFKFilter');
  RemClassRegistry.RegisterXSClass(ENServicesObjectKindFKShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectKindFKShort');
  RemClassRegistry.RegisterXSClass(ENServicesObjectKindFKShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectKindFKShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesObjectKindFKShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesObjectKindFKShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesObjectKindFKControllerSoapPort), 'http://ksoe.org/ENServicesObjectKindFKController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesObjectKindFKControllerSoapPort), 'http://ksoe.org/ENServicesObjectKindFKController/action/ENServicesObjectKindFKController.%operationName%');


end.
