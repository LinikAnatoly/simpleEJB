unit ENIPFinancingController;

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

  ENIPFinancing            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPFinancingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPFinancing = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENIPFinancingFilter = class(TRemotable)
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

  ENIPFinancingFilter = class(ENIPFinancing)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPFinancingShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENIPFinancingShort = array of ENIPFinancingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPFinancingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPFinancingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPFinancingShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPFinancingController/message/
  // soapAction: http://ksoe.org/ENIPFinancingController/action/ENIPFinancingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPFinancingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPFinancingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPFinancingControllerSoapPort = interface(IInvokable)
  ['{8ce08ce0-8ce0-8ce0-8ce0-8ce08ce08ce0}']
    function add(const aENIPFinancing: ENIPFinancing): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPFinancing: ENIPFinancing); stdcall;
    function getObject(const anObjectCode: Integer): ENIPFinancing; stdcall;
    function getList: ENIPFinancingShortList; stdcall;
    function getFilteredList(const aENIPFinancingFilter: ENIPFinancingFilter): ENIPFinancingShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPFinancingShortList; stdcall;
    function getScrollableFilteredList(const aENIPFinancingFilter: ENIPFinancingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPFinancingShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPFinancingShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPFinancingFilter: ENIPFinancingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPFinancingShort; stdcall;
  end;


implementation



  destructor ENIPFinancingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPFinancing, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFinancing');
  RemClassRegistry.RegisterXSClass(ENIPFinancingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFinancingRef');
  RemClassRegistry.RegisterXSClass(ENIPFinancingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFinancingFilter');
  RemClassRegistry.RegisterXSClass(ENIPFinancingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFinancingShort');
  RemClassRegistry.RegisterXSClass(ENIPFinancingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFinancingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPFinancingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPFinancingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPFinancingControllerSoapPort), 'http://ksoe.org/ENIPFinancingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPFinancingControllerSoapPort), 'http://ksoe.org/ENIPFinancingController/action/ENIPFinancingController.%operationName%');


end.
