unit RQOfferItemStatusController;

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

  RQOfferItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferItemStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQOfferItemStatusFilter = class(TRemotable)
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

  RQOfferItemStatusFilter = class(RQOfferItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOfferItemStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOfferItemStatusShort = array of RQOfferItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOfferItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOfferItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOfferItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOfferItemStatusController/message/
  // soapAction: http://ksoe.org/RQOfferItemStatusController/action/RQOfferItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOfferItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOfferItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOfferItemStatusControllerSoapPort = interface(IInvokable)
  ['{0B08C83C-C854-4B39-BA1C-D5A07C138FC9}']
    function add(const aRQOfferItemStatus: RQOfferItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOfferItemStatus: RQOfferItemStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQOfferItemStatus; stdcall;
    function getList: RQOfferItemStatusShortList; stdcall;
    function getFilteredList(const aRQOfferItemStatusFilter: RQOfferItemStatusFilter): RQOfferItemStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQOfferItemStatusFilter: RQOfferItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOfferItemStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOfferItemStatusFilter: RQOfferItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOfferItemStatusShort; stdcall;
  end;


implementation



  destructor RQOfferItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOfferItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemStatus');
  RemClassRegistry.RegisterXSClass(RQOfferItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQOfferItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOfferItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQOfferItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOfferItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOfferItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOfferItemStatusControllerSoapPort), 'http://ksoe.org/RQOfferItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOfferItemStatusControllerSoapPort), 'http://ksoe.org/RQOfferItemStatusController/action/RQOfferItemStatusController.%operationName%');


end.
