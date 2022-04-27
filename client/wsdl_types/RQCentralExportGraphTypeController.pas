unit RQCentralExportGraphTypeController;

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

  RQCentralExportGraphType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraphTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraphType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  RQCentralExportGraphTypeFilter = class(TRemotable)
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

  RQCentralExportGraphTypeFilter = class(RQCentralExportGraphType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQCentralExportGraphTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQCentralExportGraphTypeShort = array of RQCentralExportGraphTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQCentralExportGraphTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQCentralExportGraphTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQCentralExportGraphTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQCentralExportGraphTypeController/message/
  // soapAction: http://ksoe.org/RQCentralExportGraphTypeController/action/RQCentralExportGraphTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQCentralExportGraphTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQCentralExportGraphTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQCentralExportGraphTypeControllerSoapPort = interface(IInvokable)
  ['{7E099AF7-6FCB-4309-89D6-D9CE78CCAEC2}']
    function add(const aRQCentralExportGraphType: RQCentralExportGraphType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQCentralExportGraphType: RQCentralExportGraphType); stdcall;
    function getObject(const anObjectCode: Integer): RQCentralExportGraphType; stdcall;
    function getList: RQCentralExportGraphTypeShortList; stdcall;
    function getFilteredList(const aRQCentralExportGraphTypeFilter: RQCentralExportGraphTypeFilter): RQCentralExportGraphTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphTypeShortList; stdcall;
    function getScrollableFilteredList(const aRQCentralExportGraphTypeFilter: RQCentralExportGraphTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQCentralExportGraphTypeFilter: RQCentralExportGraphTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQCentralExportGraphTypeShort; stdcall;
  end;


implementation



  destructor RQCentralExportGraphTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQCentralExportGraphType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphType');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphTypeRef');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphTypeFilter');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphTypeShort');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQCentralExportGraphTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQCentralExportGraphTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQCentralExportGraphTypeControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQCentralExportGraphTypeControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphTypeController/action/RQCentralExportGraphTypeController.%operationName%');


end.
