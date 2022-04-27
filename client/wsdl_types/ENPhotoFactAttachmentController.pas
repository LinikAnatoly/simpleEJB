unit ENPhotoFactAttachmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   ,ENDocAttachmentController
   ,ENPhotoFactController
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

  ENPhotoFactAttachment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPhotoFactAttachmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPhotoFactAttachment = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FphotoFactRef : ENPhotoFactRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property photoFactRef : ENPhotoFactRef read FphotoFactRef write FphotoFactRef;
  end;

{
  ENPhotoFactAttachmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FphotoFactRef : ENPhotoFactRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property photoFactRef : ENPhotoFactRef read FphotoFactRef write FphotoFactRef;
  end;
}

  ENPhotoFactAttachmentFilter = class(ENPhotoFactAttachment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPhotoFactAttachmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
    FphotoFactRefCode : Integer;
    FphotoFactRefDescription : WideString;
    FphotoFactRefDateFact : TXSDateTime;
    FphotoFactRefActNumber : WideString;
    FphotoFactRefPersonalAccount : WideString;
    FphotoFactRefPersonalAccountUid : WideString;
    FphotoFactRefCustomerFIO : WideString;
    FphotoFactRefDateAdd : TXSDateTime;
    FphotoFactRefDateEdit : TXSDateTime;
    FphotoFactRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
    property photoFactRefCode : Integer read FphotoFactRefCode write FphotoFactRefCode;
    property photoFactRefDescription : WideString read FphotoFactRefDescription write FphotoFactRefDescription;
    property photoFactRefDateFact : TXSDateTime read FphotoFactRefDateFact write FphotoFactRefDateFact;
    property photoFactRefActNumber : WideString read FphotoFactRefActNumber write FphotoFactRefActNumber;
    property photoFactRefPersonalAccount : WideString read FphotoFactRefPersonalAccount write FphotoFactRefPersonalAccount;
    property photoFactRefPersonalAccountUid : WideString read FphotoFactRefPersonalAccountUid write FphotoFactRefPersonalAccountUid;
    property photoFactRefCustomerFIO : WideString read FphotoFactRefCustomerFIO write FphotoFactRefCustomerFIO;
    property photoFactRefDateAdd : TXSDateTime read FphotoFactRefDateAdd write FphotoFactRefDateAdd;
    property photoFactRefDateEdit : TXSDateTime read FphotoFactRefDateEdit write FphotoFactRefDateEdit;
    property photoFactRefUserGen : WideString read FphotoFactRefUserGen write FphotoFactRefUserGen;
  end;

  ArrayOfENPhotoFactAttachmentShort = array of ENPhotoFactAttachmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPhotoFactAttachmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPhotoFactAttachmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPhotoFactAttachmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPhotoFactAttachmentController/message/
  // soapAction: http://ksoe.org/ENPhotoFactAttachmentController/action/ENPhotoFactAttachmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPhotoFactAttachmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPhotoFactAttachmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPhotoFactAttachmentControllerSoapPort = interface(IInvokable)
  ['{FC5CB972-91A0-423F-87B6-983B2AF3C403}']
    function add(const aENPhotoFactAttachment: ENPhotoFactAttachment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPhotoFactAttachment: ENPhotoFactAttachment); stdcall;
    function getObject(const anObjectCode: Integer): ENPhotoFactAttachment; stdcall;
    function getList: ENPhotoFactAttachmentShortList; stdcall;
    function getFilteredList(const aENPhotoFactAttachmentFilter: ENPhotoFactAttachmentFilter): ENPhotoFactAttachmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactAttachmentShortList; stdcall;
    function getScrollableFilteredList(const aENPhotoFactAttachmentFilter: ENPhotoFactAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactAttachmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactAttachmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPhotoFactAttachmentFilter: ENPhotoFactAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPhotoFactAttachmentShort; stdcall;
  end;


implementation

  destructor ENPhotoFactAttachment.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FphotoFactRef) then
      photoFactRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPhotoFactAttachmentFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FphotoFactRef) then
      photoFactRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPhotoFactAttachmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPhotoFactAttachmentShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    if Assigned(FphotoFactRefDateFact) then
      photoFactRefDateFact.Free;
    if Assigned(FphotoFactRefDateAdd) then
      photoFactRefDateAdd.Free;
    if Assigned(FphotoFactRefDateEdit) then
      photoFactRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPhotoFactAttachmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPhotoFactAttachment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactAttachment');
  RemClassRegistry.RegisterXSClass(ENPhotoFactAttachmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactAttachmentRef');
  RemClassRegistry.RegisterXSClass(ENPhotoFactAttachmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactAttachmentFilter');
  RemClassRegistry.RegisterXSClass(ENPhotoFactAttachmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactAttachmentShort');
  RemClassRegistry.RegisterXSClass(ENPhotoFactAttachmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactAttachmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPhotoFactAttachmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPhotoFactAttachmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPhotoFactAttachmentControllerSoapPort), 'http://ksoe.org/ENPhotoFactAttachmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPhotoFactAttachmentControllerSoapPort), 'http://ksoe.org/ENPhotoFactAttachmentController/action/ENPhotoFactAttachmentController.%operationName%');


end.
