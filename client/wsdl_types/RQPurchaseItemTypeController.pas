unit RQPurchaseItemTypeController;

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

  RQPurchaseItemType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPurchaseItemType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQPurchaseItemTypeFilter = class(TRemotable)
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

  RQPurchaseItemTypeFilter = class(RQPurchaseItemType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPurchaseItemTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQPurchaseItemTypeShort = array of RQPurchaseItemTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPurchaseItemTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPurchaseItemTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPurchaseItemTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPurchaseItemTypeController/message/
  // soapAction: http://ksoe.org/RQPurchaseItemTypeController/action/RQPurchaseItemTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPurchaseItemTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPurchaseItemTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPurchaseItemTypeControllerSoapPort = interface(IInvokable)
  ['{F0635B5C-ECB3-4662-82E7-CFC1501D1852}']
    function add(const aRQPurchaseItemType: RQPurchaseItemType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPurchaseItemType: RQPurchaseItemType); stdcall;
    function getObject(const anObjectCode: Integer): RQPurchaseItemType; stdcall;
    function getList: RQPurchaseItemTypeShortList; stdcall;
    function getFilteredList(const aRQPurchaseItemTypeFilter: RQPurchaseItemTypeFilter): RQPurchaseItemTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQPurchaseItemTypeFilter: RQPurchaseItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPurchaseItemTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPurchaseItemTypeFilter: RQPurchaseItemTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPurchaseItemTypeShort; stdcall;
  end;


implementation



  destructor RQPurchaseItemTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPurchaseItemType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemType');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTypeRef');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTypeFilter');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTypeShort');
  RemClassRegistry.RegisterXSClass(RQPurchaseItemTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPurchaseItemTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPurchaseItemTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPurchaseItemTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPurchaseItemTypeControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPurchaseItemTypeControllerSoapPort), 'http://ksoe.org/RQPurchaseItemTypeController/action/RQPurchaseItemTypeController.%operationName%');


end.
