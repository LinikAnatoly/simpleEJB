unit SCSealTypeController;

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

  SCSealType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  SCSealTypeFilter = class(TRemotable)
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

  SCSealTypeFilter = class(SCSealType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSealTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCSealTypeShort = array of SCSealTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSealTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSealTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSealTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSealTypeController/message/
  // soapAction: http://ksoe.org/SCSealTypeController/action/SCSealTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSealTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSealTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSealTypeControllerSoapPort = interface(IInvokable)
  ['{5C2AB141-C357-43F1-A8BB-7518E05C0003}']
    function add(const aSCSealType: SCSealType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSealType: SCSealType); stdcall;
    function getObject(const anObjectCode: Integer): SCSealType; stdcall;
    function getList: SCSealTypeShortList; stdcall;
    function getFilteredList(const aSCSealTypeFilter: SCSealTypeFilter): SCSealTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSealTypeShortList; stdcall;
    function getScrollableFilteredList(const aSCSealTypeFilter: SCSealTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSealTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSealTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSealTypeFilter: SCSealTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSealTypeShort; stdcall;
  end;


implementation



  destructor SCSealTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSealType, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealType');
  RemClassRegistry.RegisterXSClass(SCSealTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealTypeRef');
  RemClassRegistry.RegisterXSClass(SCSealTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealTypeFilter');
  RemClassRegistry.RegisterXSClass(SCSealTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealTypeShort');
  RemClassRegistry.RegisterXSClass(SCSealTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSealTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSealTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSealTypeControllerSoapPort), 'http://ksoe.org/SCSealTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSealTypeControllerSoapPort), 'http://ksoe.org/SCSealTypeController/action/SCSealTypeController.%operationName%');


end.
