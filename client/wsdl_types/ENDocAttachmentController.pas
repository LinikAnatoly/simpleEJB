unit ENDocAttachmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentStatusController
   ,ENDocAttachmentServerController
   ,ENDocAttachmentTypeController
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

  ENDocAttachment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FfileLink : WideString;
    Ffilesize : Int64;
    FsigningStatus : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fstatus : ENDocAttachmentStatusRef;
//???
    FparentRef : ENDocAttachmentRef;
//???
    FserverRef : ENDocAttachmentServerRef;
//???
    FtypeRef : ENDocAttachmentTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property fileLink : WideString read FfileLink write FfileLink;
    property filesize : Int64 read Ffilesize write Ffilesize;
    property signingStatus : Integer read FsigningStatus write FsigningStatus;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property status : ENDocAttachmentStatusRef read Fstatus write Fstatus;
    property parentRef : ENDocAttachmentRef read FparentRef write FparentRef;
    property serverRef : ENDocAttachmentServerRef read FserverRef write FserverRef;
    property typeRef : ENDocAttachmentTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENDocAttachmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcommentGen : WideString;
    FfileLink : WideString;
    Ffilesize : Int64;
    FsigningStatus : Integer;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    Fstatus : ENDocAttachmentStatus;
//???
    FparentRef : ENDocAttachmentRef;
//???
    FserverRef : ENDocAttachmentServerRef;
    FtypeRef : ENDocAttachmentTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property fileLink : WideString read FfileLink write FfileLink;
    property filesize : Int64 read Ffilesize write Ffilesize;
    property signingStatus : Integer read FsigningStatus write FsigningStatus;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property status : ENDocAttachmentStatus read Fstatus write Fstatus;
    property parentRef : ENDocAttachmentRef read FparentRef write FparentRef;
    property serverRef : ENDocAttachmentServerRef read FserverRef write FserverRef;
    property typeRef : ENDocAttachmentTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENDocAttachmentFilter = class(ENDocAttachment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FfileLink : WideString;
    Ffilesize : Int64;
    FsigningStatus : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstatusCode : Integer;
    FstatusName : WideString;
    FparentRefCode : Integer;
    FparentRefCommentGen : WideString;
    FparentRefFileLink : WideString;
    FparentRefFilesize : Int64;
    FparentRefSigningStatus : Integer;
    FparentRefUserAdd : WideString;
    FparentRefDateAdd : TXSDateTime;
    FparentRefUserGen : WideString;
    FparentRefDateEdit : TXSDateTime;
    FserverRefCode : Integer;
    FserverRefName : WideString;
    FserverRefServerIp : WideString;
    FserverRefUserName : WideString;
    FserverRefUserPass : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property fileLink : WideString read FfileLink write FfileLink;
    property filesize : Int64 read Ffilesize write Ffilesize;
    property  signingStatus : Integer read FsigningStatus write FsigningStatus;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property statusCode : Integer read FstatusCode write FstatusCode;
    property statusName : WideString read FstatusName write FstatusName;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefCommentGen : WideString read FparentRefCommentGen write FparentRefCommentGen;
    property parentRefFileLink : WideString read FparentRefFileLink write FparentRefFileLink;
    property parentRefFilesize : Int64 read FparentRefFilesize write FparentRefFilesize;
    property parentRefSigningStatus : Integer read FparentRefSigningStatus write FparentRefSigningStatus;
    property parentRefUserAdd : WideString read FparentRefUserAdd write FparentRefUserAdd;
    property parentRefDateAdd : TXSDateTime read FparentRefDateAdd write FparentRefDateAdd;
    property parentRefUserGen : WideString read FparentRefUserGen write FparentRefUserGen;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
    property serverRefCode : Integer read FserverRefCode write FserverRefCode;
    property serverRefName : WideString read FserverRefName write FserverRefName;
    property serverRefServerIp : WideString read FserverRefServerIp write FserverRefServerIp;
    property serverRefUserName : WideString read FserverRefUserName write FserverRefUserName;
    property serverRefUserPass : WideString read FserverRefUserPass write FserverRefUserPass;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENDocAttachmentShort = array of ENDocAttachmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachmentShort read Flist write Flist;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachmentController/message/
  // soapAction: http://ksoe.org/ENDocAttachmentController/action/ENDocAttachmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //

  ArrayOfByte = array of Byte;

  ENDocAttachmentControllerSoapPort = interface(IInvokable)
  ['{3C44FC55-D30B-49C3-9E5E-3A1FBD9B936A}']
    function add(const aENDocAttachment: ENDocAttachment): Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment; const aFile: ArrayOfByte;  const fileName: WideString;  const dirToCreate: WideString) : Integer; stdcall; overload;

    procedure remove(const anObjectCode: Integer); stdcall; overload;
    procedure remove(const anObjectCode: Integer; const wfPackCode: Integer); stdcall; overload;

    procedure save(const aENDocAttachment: ENDocAttachment); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment; stdcall;
    function getList: ENDocAttachmentShortList; stdcall;
    function getFilteredList(const aENDocAttachmentFilter: ENDocAttachmentFilter): ENDocAttachmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachmentFilter: ENDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentShortList; stdcall;
    function getScrollableFilteredListRestricted(const servicesObjectCode: Integer;
                                                 const aENDocAttachmentFilter: ENDocAttachmentFilter;
                                                 const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachmentFilter: ENDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachmentShort; stdcall;

    function readObject(const anObjectCode: Integer): WideString; stdcall;
  end;


implementation

  destructor ENDocAttachment.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FserverRef) then
      serverRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachmentFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FserverRef) then
      serverRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachmentShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentRefDateAdd) then
      parentRefDateAdd.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENDocAttachmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachmentControllerSoapPort), 'http://ksoe.org/ENDocAttachmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachmentControllerSoapPort), 'http://ksoe.org/ENDocAttachmentController/action/ENDocAttachmentController.%operationName%');


end.
