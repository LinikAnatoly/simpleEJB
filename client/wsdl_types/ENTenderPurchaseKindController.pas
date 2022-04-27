unit ENTenderPurchaseKindController;

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

  ENTenderPurchaseKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTenderPurchaseKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTenderPurchaseKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENTenderPurchaseKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FName : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property Name : WideString read FName write FName;
  end;
}

  ENTenderPurchaseKindFilter = class(ENTenderPurchaseKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTenderPurchaseKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTenderPurchaseKindShort = array of ENTenderPurchaseKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTenderPurchaseKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTenderPurchaseKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTenderPurchaseKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTenderPurchaseKindController/message/
  // soapAction: http://ksoe.org/ENTenderPurchaseKindController/action/ENTenderPurchaseKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTenderPurchaseKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTenderPurchaseKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTenderPurchaseKindControllerSoapPort = interface(IInvokable)
  ['{7e147e14-7e14-7e14-7e14-7e147e147e14}']
    function add(const aENTenderPurchaseKind: ENTenderPurchaseKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTenderPurchaseKind: ENTenderPurchaseKind); stdcall;
    function getObject(const anObjectCode: Integer): ENTenderPurchaseKind; stdcall;
    function getList: ENTenderPurchaseKindShortList; stdcall;
    function getFilteredList(const aENTenderPurchaseKindFilter: ENTenderPurchaseKindFilter): ENTenderPurchaseKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTenderPurchaseKindShortList; stdcall;
    function getScrollableFilteredList(const aENTenderPurchaseKindFilter: ENTenderPurchaseKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTenderPurchaseKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTenderPurchaseKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTenderPurchaseKindFilter: ENTenderPurchaseKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTenderPurchaseKindShort; stdcall;
  end;


implementation



  destructor ENTenderPurchaseKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTenderPurchaseKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTenderPurchaseKind');
  RemClassRegistry.RegisterXSClass(ENTenderPurchaseKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTenderPurchaseKindRef');
  RemClassRegistry.RegisterXSClass(ENTenderPurchaseKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTenderPurchaseKindFilter');
  RemClassRegistry.RegisterXSClass(ENTenderPurchaseKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTenderPurchaseKindShort');
  RemClassRegistry.RegisterXSClass(ENTenderPurchaseKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTenderPurchaseKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTenderPurchaseKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTenderPurchaseKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTenderPurchaseKindControllerSoapPort), 'http://ksoe.org/ENTenderPurchaseKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTenderPurchaseKindControllerSoapPort), 'http://ksoe.org/ENTenderPurchaseKindController/action/ENTenderPurchaseKindController.%operationName%');


end.

