unit ENConnectionTariffTypeController;

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

  ENConnectionTariffType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariffTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariffType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionTariffTypeFilter = class(TRemotable)
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

  ENConnectionTariffTypeFilter = class(ENConnectionTariffType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionTariffTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionTariffTypeShort = array of ENConnectionTariffTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionTariffTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionTariffTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionTariffTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionTariffTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionTariffTypeController/action/ENConnectionTariffTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionTariffTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionTariffTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionTariffTypeControllerSoapPort = interface(IInvokable)
  ['{DDA9A289-704B-4193-B29D-0274B4EBC185}']
    function add(const aENConnectionTariffType: ENConnectionTariffType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionTariffType: ENConnectionTariffType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionTariffType; stdcall;
    function getList: ENConnectionTariffTypeShortList; stdcall;
    function getFilteredList(const aENConnectionTariffTypeFilter: ENConnectionTariffTypeFilter): ENConnectionTariffTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionTariffTypeFilter: ENConnectionTariffTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionTariffTypeFilter: ENConnectionTariffTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionTariffTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionTariffTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionTariffType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffType');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionTariffTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionTariffTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionTariffTypeControllerSoapPort), 'http://ksoe.org/ENConnectionTariffTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionTariffTypeControllerSoapPort), 'http://ksoe.org/ENConnectionTariffTypeController/action/ENConnectionTariffTypeController.%operationName%');


end.
