unit ENDocAttachment2ENElementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentController
   ,ENElementController
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

  ENDocAttachment2ENElement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENElementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENElement = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;

{
  ENDocAttachment2ENElementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FelementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
  end;
}

  ENDocAttachment2ENElementFilter = class(ENDocAttachment2ENElement)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachment2ENElementShort = class(TRemotable)
  private
    Fcode : Integer;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefFilesize : Int64;
    FdocAttachmentRefSigningStatus : Integer;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
    FelementRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefFilesize : Int64 read FdocAttachmentRefFilesize write FdocAttachmentRefFilesize;
    property docAttachmentRefSigningStatus : Integer read FdocAttachmentRefSigningStatus write FdocAttachmentRefSigningStatus;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
  end;

  ArrayOfENDocAttachment2ENElementShort = array of ENDocAttachment2ENElementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachment2ENElementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachment2ENElementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachment2ENElementShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachment2ENElementController/message/
  // soapAction: http://ksoe.org/ENDocAttachment2ENElementController/action/ENDocAttachment2ENElementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachment2ENElementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachment2ENElementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachment2ENElementControllerSoapPort = interface(IInvokable)
  ['{290D5557-C73C-49BE-A961-0C9542E99F26}']
    function add(const aENDocAttachment2ENElement: ENDocAttachment2ENElement): Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment; const aFile: ArrayOfByte; const fileName: WideString; const elementCode: Integer) : Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachment2ENElement: ENDocAttachment2ENElement); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment2ENElement; stdcall;
    function getList: ENDocAttachment2ENElementShortList; stdcall;
    function getFilteredList(const aENDocAttachment2ENElementFilter: ENDocAttachment2ENElementFilter): ENDocAttachment2ENElementShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENElementShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachment2ENElementFilter: ENDocAttachment2ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENElementShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENElementShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachment2ENElementFilter: ENDocAttachment2ENElementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachment2ENElementShort; stdcall;
  end;


implementation

  destructor ENDocAttachment2ENElement.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachment2ENElementFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachment2ENElementFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENElementShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENElementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENElement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENElement');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENElementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENElementRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENElementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENElementFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENElementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENElementShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENElementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENElementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachment2ENElementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachment2ENElementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachment2ENElementControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENElementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachment2ENElementControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENElementController/action/ENDocAttachment2ENElementController.%operationName%');


end.
