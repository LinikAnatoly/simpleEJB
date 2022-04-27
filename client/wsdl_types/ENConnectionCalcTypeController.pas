unit ENConnectionCalcTypeController;

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

  ENConnectionCalcType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionCalcTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionCalcType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENConnectionCalcTypeFilter = class(TRemotable)
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

  ENConnectionCalcTypeFilter = class(ENConnectionCalcType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionCalcTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionCalcTypeShort = array of ENConnectionCalcTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionCalcTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionCalcTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionCalcTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionCalcTypeController/message/
  // soapAction: http://ksoe.org/ENConnectionCalcTypeController/action/ENConnectionCalcTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionCalcTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionCalcTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionCalcTypeControllerSoapPort = interface(IInvokable)
  ['{9D4786EA-910F-4A1B-9B7A-AB9254BA95B1}']
    function add(const aENConnectionCalcType: ENConnectionCalcType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionCalcType: ENConnectionCalcType); stdcall;
    function getObject(const anObjectCode: Integer): ENConnectionCalcType; stdcall;
    function getList: ENConnectionCalcTypeShortList; stdcall;
    function getFilteredList(const aENConnectionCalcTypeFilter: ENConnectionCalcTypeFilter): ENConnectionCalcTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCalcTypeShortList; stdcall;
    function getScrollableFilteredList(const aENConnectionCalcTypeFilter: ENConnectionCalcTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCalcTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionCalcTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENConnectionCalcTypeFilter: ENConnectionCalcTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENConnectionCalcTypeShort; stdcall;
  end;


implementation



  destructor ENConnectionCalcTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionCalcType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCalcType');
  RemClassRegistry.RegisterXSClass(ENConnectionCalcTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCalcTypeRef');
  RemClassRegistry.RegisterXSClass(ENConnectionCalcTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCalcTypeFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionCalcTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCalcTypeShort');
  RemClassRegistry.RegisterXSClass(ENConnectionCalcTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionCalcTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionCalcTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionCalcTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionCalcTypeControllerSoapPort), 'http://ksoe.org/ENConnectionCalcTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionCalcTypeControllerSoapPort), 'http://ksoe.org/ENConnectionCalcTypeController/action/ENConnectionCalcTypeController.%operationName%');


end.
