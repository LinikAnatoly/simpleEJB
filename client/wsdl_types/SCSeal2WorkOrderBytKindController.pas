unit SCSeal2WorkOrderBytKindController;

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

  SCSeal2WorkOrderBytKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSeal2WorkOrderBytKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSeal2WorkOrderBytKind = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  SCSeal2WorkOrderBytKindFilter = class(TRemotable)
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

  SCSeal2WorkOrderBytKindFilter = class(SCSeal2WorkOrderBytKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSeal2WorkOrderBytKindShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCSeal2WorkOrderBytKindShort = array of SCSeal2WorkOrderBytKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSeal2WorkOrderBytKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSeal2WorkOrderBytKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSeal2WorkOrderBytKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSeal2WorkOrderBytKindController/message/
  // soapAction: http://ksoe.org/SCSeal2WorkOrderBytKindController/action/SCSeal2WorkOrderBytKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSeal2WorkOrderBytKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSeal2WorkOrderBytKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSeal2WorkOrderBytKindControllerSoapPort = interface(IInvokable)
  ['{A6F6B601-9F9C-421F-8EB9-040DC91CF62B}']
    function add(const aSCSeal2WorkOrderBytKind: SCSeal2WorkOrderBytKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSeal2WorkOrderBytKind: SCSeal2WorkOrderBytKind); stdcall;
    function getObject(const anObjectCode: Integer): SCSeal2WorkOrderBytKind; stdcall;
    function getList: SCSeal2WorkOrderBytKindShortList; stdcall;
    function getFilteredList(const aSCSeal2WorkOrderBytKindFilter: SCSeal2WorkOrderBytKindFilter): SCSeal2WorkOrderBytKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSeal2WorkOrderBytKindShortList; stdcall;
    function getScrollableFilteredList(const aSCSeal2WorkOrderBytKindFilter: SCSeal2WorkOrderBytKindFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSeal2WorkOrderBytKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSeal2WorkOrderBytKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSeal2WorkOrderBytKindFilter: SCSeal2WorkOrderBytKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSeal2WorkOrderBytKindShort; stdcall;
  end;


implementation



  destructor SCSeal2WorkOrderBytKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSeal2WorkOrderBytKind, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2WorkOrderBytKind');
  RemClassRegistry.RegisterXSClass(SCSeal2WorkOrderBytKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2WorkOrderBytKindRef');
  RemClassRegistry.RegisterXSClass(SCSeal2WorkOrderBytKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2WorkOrderBytKindFilter');
  RemClassRegistry.RegisterXSClass(SCSeal2WorkOrderBytKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2WorkOrderBytKindShort');
  RemClassRegistry.RegisterXSClass(SCSeal2WorkOrderBytKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal2WorkOrderBytKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSeal2WorkOrderBytKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSeal2WorkOrderBytKindShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSeal2WorkOrderBytKindControllerSoapPort), 'http://ksoe.org/SCSeal2WorkOrderBytKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSeal2WorkOrderBytKindControllerSoapPort), 'http://ksoe.org/SCSeal2WorkOrderBytKindController/action/SCSeal2WorkOrderBytKindController.%operationName%');


end.
