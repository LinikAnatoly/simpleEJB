unit RQOrderItemTypePayController;

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

  RQOrderItemTypePay            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItemTypePayRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItemTypePay = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQOrderItemTypePayFilter = class(TRemotable)
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

  RQOrderItemTypePayFilter = class(RQOrderItemTypePay)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrderItemTypePayShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderItemTypePayShort = array of RQOrderItemTypePayShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItemTypePayShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItemTypePayShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItemTypePayShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItemTypePayController/message/
  // soapAction: http://ksoe.org/RQOrderItemTypePayController/action/RQOrderItemTypePayController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItemTypePayControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItemTypePayController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItemTypePayControllerSoapPort = interface(IInvokable)
  ['{287b287b-287b-287b-287b-287b287b287b}']
    function add(const aRQOrderItemTypePay: RQOrderItemTypePay): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItemTypePay: RQOrderItemTypePay); stdcall;
    function getObject(const anObjectCode: Integer): RQOrderItemTypePay; stdcall;
    function getList: RQOrderItemTypePayShortList; stdcall;
    function getFilteredList(const aRQOrderItemTypePayFilter: RQOrderItemTypePayFilter): RQOrderItemTypePayShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemTypePayShortList; stdcall;
    function getScrollableFilteredList(const aRQOrderItemTypePayFilter: RQOrderItemTypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemTypePayShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemTypePayShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrderItemTypePayFilter: RQOrderItemTypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrderItemTypePayShort; stdcall;
  end;


implementation



  destructor RQOrderItemTypePayShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItemTypePay, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemTypePay');
  RemClassRegistry.RegisterXSClass(RQOrderItemTypePayRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemTypePayRef');
  RemClassRegistry.RegisterXSClass(RQOrderItemTypePayFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemTypePayFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItemTypePayShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemTypePayShort');
  RemClassRegistry.RegisterXSClass(RQOrderItemTypePayShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemTypePayShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItemTypePayShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItemTypePayShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItemTypePayControllerSoapPort), 'http://ksoe.org/RQOrderItemTypePayController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItemTypePayControllerSoapPort), 'http://ksoe.org/RQOrderItemTypePayController/action/RQOrderItemTypePayController.%operationName%');


end.
