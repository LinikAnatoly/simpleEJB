unit ENBonusListItemStatusController;

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

  ENBonusListItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListItemStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENBonusListItemStatusFilter = class(TRemotable)
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

  ENBonusListItemStatusFilter = class(ENBonusListItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBonusListItemStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBonusListItemStatusShort = array of ENBonusListItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBonusListItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBonusListItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBonusListItemStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBonusListItemStatusController/message/
  // soapAction: http://ksoe.org/ENBonusListItemStatusController/action/ENBonusListItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBonusListItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBonusListItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBonusListItemStatusControllerSoapPort = interface(IInvokable)
  ['{071B12A6-0572-4DD6-A824-78AB7F025B20}']
    function add(const aENBonusListItemStatus: ENBonusListItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBonusListItemStatus: ENBonusListItemStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENBonusListItemStatus; stdcall;
    function getList: ENBonusListItemStatusShortList; stdcall;
    function getFilteredList(const aENBonusListItemStatusFilter: ENBonusListItemStatusFilter): ENBonusListItemStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemStatusShortList; stdcall;
    function getScrollableFilteredList(const aENBonusListItemStatusFilter: ENBonusListItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBonusListItemStatusFilter: ENBonusListItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBonusListItemStatusShort; stdcall;
  end;


implementation



  destructor ENBonusListItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBonusListItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemStatus');
  RemClassRegistry.RegisterXSClass(ENBonusListItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemStatusRef');
  RemClassRegistry.RegisterXSClass(ENBonusListItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemStatusFilter');
  RemClassRegistry.RegisterXSClass(ENBonusListItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemStatusShort');
  RemClassRegistry.RegisterXSClass(ENBonusListItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBonusListItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBonusListItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBonusListItemStatusControllerSoapPort), 'http://ksoe.org/ENBonusListItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBonusListItemStatusControllerSoapPort), 'http://ksoe.org/ENBonusListItemStatusController/action/ENBonusListItemStatusController.%operationName%');


end.
