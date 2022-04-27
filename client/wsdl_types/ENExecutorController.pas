unit ENExecutorController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSheets4SOTypeController
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

  ENExecutor            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENExecutorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENExecutor = class(TRemotable)
  private
    Fcode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FcommentGen : WideString;
//???
    FsheetTypeRef : ENSheets4SOTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property sheetTypeRef : ENSheets4SOTypeRef read FsheetTypeRef write FsheetTypeRef;
  end;

{
  ENExecutorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FcommentGen : WideString;
//???
    FsheetTypeRef : ENSheets4SOTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property sheetTypeRef : ENSheets4SOTypeRef read FsheetTypeRef write FsheetTypeRef;
  end;
}

  ENExecutorFilter = class(ENExecutor)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENExecutorShort = class(TRemotable)
  private
    Fcode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FcommentGen : WideString;
    FsheetTypeRefCode : Integer;
    FsheetTypeRefName : WideString;
    FsheetTypeRefNameForDfDoc : WideString;
    FsheetTypeRefDfDocNumMask : WideString;
    FsheetTypeRefDfDepartmentCode : Integer;
    FsheetTypeRefExecutorFio : WideString;
    FsheetTypeRefExecutorPhone : WideString;
    FsheetTypeRefExecutorEmail : WideString;
    FsheetTypeRefReportPath : WideString;
    FsheetTypeRefReportFileName : WideString;
    FsheetTypeRefReportType : WideString;
    FsheetTypeRefCommentGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property commentGen : WideString read FcommentGen write FcommentGen;

    property sheetTypeRefCode : Integer read FsheetTypeRefCode write FsheetTypeRefCode;
    property sheetTypeRefName : WideString read FsheetTypeRefName write FsheetTypeRefName;
    property sheetTypeRefNameForDfDoc : WideString read FsheetTypeRefNameForDfDoc write FsheetTypeRefNameForDfDoc;
    property sheetTypeRefDfDocNumMask : WideString read FsheetTypeRefDfDocNumMask write FsheetTypeRefDfDocNumMask;
    property sheetTypeRefDfDepartmentCode : Integer read FsheetTypeRefDfDepartmentCode write FsheetTypeRefDfDepartmentCode;
    property sheetTypeRefExecutorFio : WideString read FsheetTypeRefExecutorFio write FsheetTypeRefExecutorFio;
    property sheetTypeRefExecutorPhone : WideString read FsheetTypeRefExecutorPhone write FsheetTypeRefExecutorPhone;
    property sheetTypeRefExecutorEmail : WideString read FsheetTypeRefExecutorEmail write FsheetTypeRefExecutorEmail;
    property sheetTypeRefReportPath : WideString read FsheetTypeRefReportPath write FsheetTypeRefReportPath;
    property sheetTypeRefReportFileName : WideString read FsheetTypeRefReportFileName write FsheetTypeRefReportFileName;
    property sheetTypeRefReportType : WideString read FsheetTypeRefReportType write FsheetTypeRefReportType;
    property sheetTypeRefCommentGen : WideString read FsheetTypeRefCommentGen write FsheetTypeRefCommentGen;
  end;

  ArrayOfENExecutorShort = array of ENExecutorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENExecutorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENExecutorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENExecutorShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENExecutorController/message/
  // soapAction: http://ksoe.org/ENExecutorController/action/ENExecutorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENExecutorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENExecutorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENExecutorControllerSoapPort = interface(IInvokable)
  ['{7787E94C-7685-42B6-AA07-A5658DB4905F}']
    function add(const aENExecutor: ENExecutor): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENExecutor: ENExecutor); stdcall;
    function getObject(const anObjectCode: Integer): ENExecutor; stdcall;
    function getList: ENExecutorShortList; stdcall;
    function getFilteredList(const aENExecutorFilter: ENExecutorFilter): ENExecutorShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENExecutorShortList; stdcall;
    function getScrollableFilteredList(const aENExecutorFilter: ENExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer): ENExecutorShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENExecutorShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENExecutorFilter: ENExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENExecutorShort; stdcall;
  end;


implementation

  destructor ENExecutor.Destroy;
  begin
    if Assigned(FsheetTypeRef) then
      sheetTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENExecutorFilter.Destroy;
  begin
    if Assigned(FsheetTypeRef) then
      sheetTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENExecutorFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENExecutorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENExecutor, 'http://ksoe.org/EnergyproControllerService/type/', 'ENExecutor');
  RemClassRegistry.RegisterXSClass(ENExecutorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENExecutorRef');
  RemClassRegistry.RegisterXSClass(ENExecutorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENExecutorFilter');
  RemClassRegistry.RegisterXSClass(ENExecutorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENExecutorShort');
  RemClassRegistry.RegisterXSClass(ENExecutorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENExecutorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENExecutorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENExecutorShort');

  InvRegistry.RegisterInterface(TypeInfo(ENExecutorControllerSoapPort), 'http://ksoe.org/ENExecutorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENExecutorControllerSoapPort), 'http://ksoe.org/ENExecutorController/action/ENExecutorController.%operationName%');


end.
