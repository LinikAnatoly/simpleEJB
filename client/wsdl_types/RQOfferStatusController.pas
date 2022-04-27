unit RQOfferStatusController;

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

  RQOfferStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQOfferStatusFilter = class(TRemotable)
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

  RQOfferStatusFilter = class(RQOfferStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOfferStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOfferStatusShort = array of RQOfferStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOfferStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOfferStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOfferStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOfferStatusController/message/
  // soapAction: http://ksoe.org/RQOfferStatusController/action/RQOfferStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOfferStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOfferStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOfferStatusControllerSoapPort = interface(IInvokable)
  ['{85951879-9712-45F9-ABB1-1AF6ED836117}']
    function add(const aRQOfferStatus: RQOfferStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOfferStatus: RQOfferStatus); stdcall;
    function getObject(const anObjectCode: Integer): RQOfferStatus; stdcall;
    function getList: RQOfferStatusShortList; stdcall;
    function getFilteredList(const aRQOfferStatusFilter: RQOfferStatusFilter): RQOfferStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOfferStatusShortList; stdcall;
    function getScrollableFilteredList(const aRQOfferStatusFilter: RQOfferStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOfferStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOfferStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOfferStatusFilter: RQOfferStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOfferStatusShort; stdcall;
  end;


implementation



  destructor RQOfferStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOfferStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferStatus');
  RemClassRegistry.RegisterXSClass(RQOfferStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferStatusRef');
  RemClassRegistry.RegisterXSClass(RQOfferStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferStatusFilter');
  RemClassRegistry.RegisterXSClass(RQOfferStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferStatusShort');
  RemClassRegistry.RegisterXSClass(RQOfferStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOfferStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOfferStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOfferStatusControllerSoapPort), 'http://ksoe.org/RQOfferStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOfferStatusControllerSoapPort), 'http://ksoe.org/RQOfferStatusController/action/RQOfferStatusController.%operationName%');


end.
