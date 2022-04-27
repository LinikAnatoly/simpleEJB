unit ENConnectionWorkTypeController;

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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENConnectionWorkType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionWorkTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionWorkType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionWorkTypeFilter = class(TRemotable)
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

  ENConnectionWorkTypeFilter = class(ENConnectionWorkType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionWorkTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionWorkTypeShort = array of ENConnectionWorkTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionWorkTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionWorkTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionWorkTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionWorkTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionWorkTypeController/action/ENConnectionWorkTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionWorkTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionWorkTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionWorkTypeControllerSoapPort = interface(IInvokable)
  ['{725147E5-2252-40CF-8F77-F67EF2A6A5BF}']
    function add(const aENConnectionWorkType: ENConnectionWorkType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionWorkType: ENConnectionWorkType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionWorkType; stdcall;
    function getList: ENConnectionWorkTypeShortList; stdcall;
    function getFilteredList(const aENConnectionWorkTypeFilter: ENConnectionWorkTypeFilter): ENConnectionWorkTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionWorkTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionWorkTypeFilter: ENConnectionWorkTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionWorkTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionWorkTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionWorkTypeFilter: ENConnectionWorkTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionWorkTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionWorkTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionWorkType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionWorkType');
  RemClassRegistry.RegisterXSClass(ENConnectionWorkTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionWorkTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionWorkTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionWorkTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionWorkTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionWorkTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionWorkTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionWorkTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionWorkTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionWorkTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionWorkTypeControllerSoapPort), 'http://ksoe.org/ENConnectionWorkTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionWorkTypeControllerSoapPort), 'http://ksoe.org/ENConnectionWorkTypeController/action/ENConnectionWorkTypeController.%operationName%');


end.
