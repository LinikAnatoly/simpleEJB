unit ENReportAdditionZbytMetrologyController;

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

  ENReportAdditionZbytMetrology            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReportAdditionZbytMetrologyRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENReportAdditionZbytMetrology = class(TRemotable)
  private
    Fcode : Integer;
    FworkCode : WideString;
    Fname : WideString;
    FisServices : Integer;
    FzbytOrmetrology : WideString;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property workCode : WideString read FworkCode write FworkCode;
    property name : WideString read Fname write Fname;
    property isServices : Integer read FisServices write FisServices;
    property zbytOrmetrology : WideString read FzbytOrmetrology write FzbytOrmetrology;
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
  end;

{
  ENReportAdditionZbytMetrologyFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FworkCode : WideString;
    Fname : WideString;
    FisServices : Integer;
    FzbytOrmetrology : WideString;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property workCode : WideString read FworkCode write FworkCode;
    property name : WideString read Fname write Fname;
    property isServices : Integer read FisServices write FisServices;
    property zbytOrmetrology : WideString read FzbytOrmetrology write FzbytOrmetrology;
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
  end;
}

  ENReportAdditionZbytMetrologyFilter = class(ENReportAdditionZbytMetrology)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENReportAdditionZbytMetrologyShort = class(TRemotable)
  private
    Fcode : Integer;
    FworkCode : WideString;
    Fname : WideString;
    FisServices : Integer;
    FzbytOrmetrology : WideString;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property workCode : WideString read FworkCode write FworkCode;
    property name : WideString read Fname write Fname;
    property  isServices : Integer read FisServices write FisServices;
    property zbytOrmetrology : WideString read FzbytOrmetrology write FzbytOrmetrology;
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;

  end;

  ArrayOfENReportAdditionZbytMetrologyShort = array of ENReportAdditionZbytMetrologyShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENReportAdditionZbytMetrologyShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENReportAdditionZbytMetrologyShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENReportAdditionZbytMetrologyShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENReportAdditionZbytMetrologyController/message/
  // soapAction: http://ksoe.org/ENReportAdditionZbytMetrologyController/action/ENReportAdditionZbytMetrologyController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENReportAdditionZbytMetrologyControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENReportAdditionZbytMetrologyController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENReportAdditionZbytMetrologyControllerSoapPort = interface(IInvokable)
  ['{5120BCE8-EC5B-4FE9-BB8E-DC621AECFBB1}']
    function add(const aENReportAdditionZbytMetrology: ENReportAdditionZbytMetrology): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENReportAdditionZbytMetrology: ENReportAdditionZbytMetrology); stdcall;
    function getObject(const anObjectCode: Integer): ENReportAdditionZbytMetrology; stdcall;
    function getList: ENReportAdditionZbytMetrologyShortList; stdcall;
    function getFilteredList(const aENReportAdditionZbytMetrologyFilter: ENReportAdditionZbytMetrologyFilter): ENReportAdditionZbytMetrologyShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENReportAdditionZbytMetrologyShortList; stdcall;
    function getScrollableFilteredList(const aENReportAdditionZbytMetrologyFilter: ENReportAdditionZbytMetrologyFilter; const aFromPosition: Integer; const aQuantity: Integer): ENReportAdditionZbytMetrologyShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENReportAdditionZbytMetrologyShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENReportAdditionZbytMetrologyFilter: ENReportAdditionZbytMetrologyFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENReportAdditionZbytMetrologyShort; stdcall;
  end;


implementation

  destructor ENReportAdditionZbytMetrology.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    inherited Destroy;
  end;

{
  destructor ENReportAdditionZbytMetrologyFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    inherited Destroy;
  end;
}

  destructor ENReportAdditionZbytMetrologyFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENReportAdditionZbytMetrologyShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    inherited Destroy;
  end;

  destructor ENReportAdditionZbytMetrologyShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENReportAdditionZbytMetrology, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReportAdditionZbytMetrology');
  RemClassRegistry.RegisterXSClass(ENReportAdditionZbytMetrologyRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReportAdditionZbytMetrologyRef');
  RemClassRegistry.RegisterXSClass(ENReportAdditionZbytMetrologyFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReportAdditionZbytMetrologyFilter');
  RemClassRegistry.RegisterXSClass(ENReportAdditionZbytMetrologyShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReportAdditionZbytMetrologyShort');
  RemClassRegistry.RegisterXSClass(ENReportAdditionZbytMetrologyShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENReportAdditionZbytMetrologyShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENReportAdditionZbytMetrologyShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENReportAdditionZbytMetrologyShort');

  InvRegistry.RegisterInterface(TypeInfo(ENReportAdditionZbytMetrologyControllerSoapPort), 'http://ksoe.org/ENReportAdditionZbytMetrologyController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENReportAdditionZbytMetrologyControllerSoapPort), 'http://ksoe.org/ENReportAdditionZbytMetrologyController/action/ENReportAdditionZbytMetrologyController.%operationName%');


end.
