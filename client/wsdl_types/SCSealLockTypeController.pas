unit SCSealLockTypeController;

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

  SCSealLockType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealLockTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealLockType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  SCSealLockTypeFilter = class(TRemotable)
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

  SCSealLockTypeFilter = class(SCSealLockType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSealLockTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCSealLockTypeShort = array of SCSealLockTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSealLockTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSealLockTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSealLockTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSealLockTypeController/message/
  // soapAction: http://ksoe.org/SCSealLockTypeController/action/SCSealLockTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSealLockTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSealLockTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSealLockTypeControllerSoapPort = interface(IInvokable)
  ['{38EE1886-BCE0-496C-B820-5E196AC3450E}']
    function add(const aSCSealLockType: SCSealLockType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSealLockType: SCSealLockType); stdcall;
    function getObject(const anObjectCode: Integer): SCSealLockType; stdcall;
    function getList: SCSealLockTypeShortList; stdcall;
    function getFilteredList(const aSCSealLockTypeFilter: SCSealLockTypeFilter): SCSealLockTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSealLockTypeShortList; stdcall;
    function getScrollableFilteredList(const aSCSealLockTypeFilter: SCSealLockTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSealLockTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSealLockTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSealLockTypeFilter: SCSealLockTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSealLockTypeShort; stdcall;
  end;


implementation



  destructor SCSealLockTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSealLockType, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealLockType');
  RemClassRegistry.RegisterXSClass(SCSealLockTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealLockTypeRef');
  RemClassRegistry.RegisterXSClass(SCSealLockTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealLockTypeFilter');
  RemClassRegistry.RegisterXSClass(SCSealLockTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealLockTypeShort');
  RemClassRegistry.RegisterXSClass(SCSealLockTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealLockTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSealLockTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSealLockTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSealLockTypeControllerSoapPort), 'http://ksoe.org/SCSealLockTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSealLockTypeControllerSoapPort), 'http://ksoe.org/SCSealLockTypeController/action/SCSealLockTypeController.%operationName%');


end.
