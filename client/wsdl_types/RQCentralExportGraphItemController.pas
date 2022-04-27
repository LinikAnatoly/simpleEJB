unit RQCentralExportGraphItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQCentralExportGraphController
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

  RQCentralExportGraphItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraphItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraphItem = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
//???
    FcentralExportGraph : RQCentralExportGraphRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property centralExportGraph : RQCentralExportGraphRef read FcentralExportGraph write FcentralExportGraph;
  end;

{
  RQCentralExportGraphItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
//???
    FcentralExportGraph : RQCentralExportGraphRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property centralExportGraph : RQCentralExportGraphRef read FcentralExportGraph write FcentralExportGraph;
  end;
}

  RQCentralExportGraphItemFilter = class(RQCentralExportGraphItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQCentralExportGraphItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FcentralExportGraphCode : Integer;
    FcentralExportGraphMonthGen : Integer;
    FcentralExportGraphYearGen : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;

    property centralExportGraphCode : Integer read FcentralExportGraphCode write FcentralExportGraphCode;
    property centralExportGraphMonthGen : Integer read FcentralExportGraphMonthGen write FcentralExportGraphMonthGen;
    property centralExportGraphYearGen : Integer read FcentralExportGraphYearGen write FcentralExportGraphYearGen;
  end;

  ArrayOfRQCentralExportGraphItemShort = array of RQCentralExportGraphItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQCentralExportGraphItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQCentralExportGraphItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQCentralExportGraphItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQCentralExportGraphItemController/message/
  // soapAction: http://ksoe.org/RQCentralExportGraphItemController/action/RQCentralExportGraphItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQCentralExportGraphItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQCentralExportGraphItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQCentralExportGraphItemControllerSoapPort = interface(IInvokable)
  ['{547A3B00-BF67-439D-AECF-9FB5A7E0F564}']
    function add(const aRQCentralExportGraphItem: RQCentralExportGraphItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQCentralExportGraphItem: RQCentralExportGraphItem); stdcall;
    function getObject(const anObjectCode: Integer): RQCentralExportGraphItem; stdcall;
    function getList: RQCentralExportGraphItemShortList; stdcall;
    function getFilteredList(const aRQCentralExportGraphItemFilter: RQCentralExportGraphItemFilter): RQCentralExportGraphItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphItemShortList; stdcall;
    function getScrollableFilteredList(const aRQCentralExportGraphItemFilter: RQCentralExportGraphItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQCentralExportGraphItemFilter: RQCentralExportGraphItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQCentralExportGraphItemShort; stdcall;
  end;


implementation

  destructor RQCentralExportGraphItem.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcentralExportGraph) then
      centralExportGraph.Free;
    inherited Destroy;
  end;

{
  destructor RQCentralExportGraphItemFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcentralExportGraph) then
      centralExportGraph.Free;
    inherited Destroy;
  end;
}

  destructor RQCentralExportGraphItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQCentralExportGraphItemShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    inherited Destroy;
  end;

  destructor RQCentralExportGraphItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQCentralExportGraphItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphItem');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphItemRef');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphItemFilter');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphItemShort');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQCentralExportGraphItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQCentralExportGraphItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQCentralExportGraphItemControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQCentralExportGraphItemControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphItemController/action/RQCentralExportGraphItemController.%operationName%');


end.


