unit ENSheets4SOTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSignerController
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

  ENSheets4SOType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SOTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SOType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FnameForDfDoc : WideString;
    FdfDocNumMask : WideString;
    FdfDepartmentCode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FreportPath : WideString;
    FreportFileName : WideString;
    FreportType : WideString;
    FcommentGen : WideString;
//???
    FsignerRef : ENSignerRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property nameForDfDoc : WideString read FnameForDfDoc write FnameForDfDoc;
    property dfDocNumMask : WideString read FdfDocNumMask write FdfDocNumMask;
    property dfDepartmentCode : Integer read FdfDepartmentCode write FdfDepartmentCode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property reportPath : WideString read FreportPath write FreportPath;
    property reportFileName : WideString read FreportFileName write FreportFileName;
    property reportType : WideString read FreportType write FreportType;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property signerRef : ENSignerRef read FsignerRef write FsignerRef;
  end;

{
  ENSheets4SOTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FnameForDfDoc : WideString;
    FdfDocNumMask : WideString;
    FdfDepartmentCode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FreportPath : WideString;
    FreportFileName : WideString;
    FreportType : WideString;
    FcommentGen : WideString;
//???
    FsignerRef : ENSignerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property nameForDfDoc : WideString read FnameForDfDoc write FnameForDfDoc;
    property dfDocNumMask : WideString read FdfDocNumMask write FdfDocNumMask;
    property dfDepartmentCode : Integer read FdfDepartmentCode write FdfDepartmentCode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property reportPath : WideString read FreportPath write FreportPath;
    property reportFileName : WideString read FreportFileName write FreportFileName;
    property reportType : WideString read FreportType write FreportType;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property signerRef : ENSignerRef read FsignerRef write FsignerRef;
  end;
}

  ENSheets4SOTypeFilter = class(ENSheets4SOType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSheets4SOTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FnameForDfDoc : WideString;
    FdfDocNumMask : WideString;
    FdfDepartmentCode : Integer;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FreportPath : WideString;
    FreportFileName : WideString;
    FreportType : WideString;
    FcommentGen : WideString;
    FsignerRefCode : Integer;
    FsignerRefSignerPosition : WideString;
    FsignerRefSignerFio : WideString;
    FsignerRefSignatureImagePath : WideString;
    FsignerRefCommentGen : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property nameForDfDoc : WideString read FnameForDfDoc write FnameForDfDoc;
    property dfDocNumMask : WideString read FdfDocNumMask write FdfDocNumMask;
    property  dfDepartmentCode : Integer read FdfDepartmentCode write FdfDepartmentCode;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property reportPath : WideString read FreportPath write FreportPath;
    property reportFileName : WideString read FreportFileName write FreportFileName;
    property reportType : WideString read FreportType write FreportType;
    property commentGen : WideString read FcommentGen write FcommentGen;

    property signerRefCode : Integer read FsignerRefCode write FsignerRefCode;
    property signerRefSignerPosition : WideString read FsignerRefSignerPosition write FsignerRefSignerPosition;
    property signerRefSignerFio : WideString read FsignerRefSignerFio write FsignerRefSignerFio;
    property signerRefSignatureImagePath : WideString read FsignerRefSignatureImagePath write FsignerRefSignatureImagePath;
    property signerRefCommentGen : WideString read FsignerRefCommentGen write FsignerRefCommentGen;
  end;

  ArrayOfENSheets4SOTypeShort = array of ENSheets4SOTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSheets4SOTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSheets4SOTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSheets4SOTypeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSheets4SOTypeController/message/
  // soapAction: http://ksoe.org/ENSheets4SOTypeController/action/ENSheets4SOTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSheets4SOTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSheets4SOTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSheets4SOTypeControllerSoapPort = interface(IInvokable)
  ['{CDF74C4E-354C-4C22-ADBE-F5696821C23F}']
    function add(const aENSheets4SOType: ENSheets4SOType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSheets4SOType: ENSheets4SOType); stdcall;
    function getObject(const anObjectCode: Integer): ENSheets4SOType; stdcall;
    function getList: ENSheets4SOTypeShortList; stdcall;
    function getFilteredList(const aENSheets4SOTypeFilter: ENSheets4SOTypeFilter): ENSheets4SOTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOTypeShortList; stdcall;
    function getScrollableFilteredList(const aENSheets4SOTypeFilter: ENSheets4SOTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSheets4SOTypeFilter: ENSheets4SOTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSheets4SOTypeShort; stdcall;
  end;


implementation

  destructor ENSheets4SOType.Destroy;
  begin
    if Assigned(FsignerRef) then
      signerRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSheets4SOTypeFilter.Destroy;
  begin
    if Assigned(FsignerRef) then
      signerRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSheets4SOTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENSheets4SOTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSheets4SOType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOType');
  RemClassRegistry.RegisterXSClass(ENSheets4SOTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOTypeRef');
  RemClassRegistry.RegisterXSClass(ENSheets4SOTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSheets4SOTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOTypeShort');
  RemClassRegistry.RegisterXSClass(ENSheets4SOTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSheets4SOTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSheets4SOTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSheets4SOTypeControllerSoapPort), 'http://ksoe.org/ENSheets4SOTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSheets4SOTypeControllerSoapPort), 'http://ksoe.org/ENSheets4SOTypeController/action/ENSheets4SOTypeController.%operationName%');


end.
