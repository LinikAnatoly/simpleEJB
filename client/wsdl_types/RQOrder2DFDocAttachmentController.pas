unit RQOrder2DFDocAttachmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,DFDocAttachmentController
   ,RQOrderController
   ,DFDocController
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

  RQOrder2DFDocAttachment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2DFDocAttachmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2DFDocAttachment = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FdocAttachmentRef : DFDocAttachmentRef;
//???
    ForderRef : RQOrderRef;
//???
    FdocRef : DFDocRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property docAttachmentRef : DFDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
    property docRef : DFDocRef read FdocRef write FdocRef;
  end;

{
  RQOrder2DFDocAttachmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FdocAttachmentRef : DFDocAttachmentRef;
//???
    ForderRef : RQOrderRef;
//???
    FdocRef : DFDocRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property docAttachmentRef : DFDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
    property docRef : DFDocRef read FdocRef write FdocRef;
  end;
}

  RQOrder2DFDocAttachmentFilter = class(RQOrder2DFDocAttachment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrder2DFDocAttachmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefVersion : Integer;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
    ForderRefCode : Integer;
    ForderRefNumberDoc : WideString;
    ForderRefNumberProject : WideString;
    ForderRefOrderPeriod : TXSDate;
    ForderRefDateGen : TXSDate;
    ForderRefUserGen : WideString;
    FdocRefCode : Integer;
    FdocRefName : WideString;
    FdocRefDocNum : WideString;
    FdocRefDateRegistration : TXSDate;
    FdocRefCustomerName : WideString;
    FdocRefCustomerAddress : WideString;
    FdocRefCustomerPhone : WideString;
    FdocRefDescription : WideString;
    FdocRefPlanedDateEndWork : TXSDateTime;
    FdocRefDateEndWork : TXSDateTime;
    FdocRefInitiatorTabnumber : WideString;
    FdocRefInitiatorFIO : WideString;
    FdocRefInitiatorPodrName : WideString;
    FdocRefSignerTabnumber : WideString;
    FdocRefSignerFIO : WideString;
    FdocRefSignerPostInfo : WideString;
    FdocRefDesignatedTabnumber : WideString;
    FdocRefDesignatedFIO : WideString;
    FdocRefDesignatedPostInfo : WideString;
    FdocRefUserAdd : WideString;
    FdocRefDateAdd : TXSDateTime;
    FdocRefUserGen : WideString;
    FdocRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefVersion : Integer read FdocAttachmentRefVersion write FdocAttachmentRefVersion;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
    property orderRefCode : Integer read ForderRefCode write ForderRefCode;
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc;
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject;
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod;
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen;
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen;
    property docRefCode : Integer read FdocRefCode write FdocRefCode;
    property docRefName : WideString read FdocRefName write FdocRefName;
    property docRefDocNum : WideString read FdocRefDocNum write FdocRefDocNum;
    property docRefDateRegistration : TXSDate read FdocRefDateRegistration write FdocRefDateRegistration;
    property docRefCustomerName : WideString read FdocRefCustomerName write FdocRefCustomerName;
    property docRefCustomerAddress : WideString read FdocRefCustomerAddress write FdocRefCustomerAddress;
    property docRefCustomerPhone : WideString read FdocRefCustomerPhone write FdocRefCustomerPhone;
    property docRefDescription : WideString read FdocRefDescription write FdocRefDescription;
    property docRefPlanedDateEndWork : TXSDateTime read FdocRefPlanedDateEndWork write FdocRefPlanedDateEndWork;
    property docRefDateEndWork : TXSDateTime read FdocRefDateEndWork write FdocRefDateEndWork;
    property docRefInitiatorTabnumber : WideString read FdocRefInitiatorTabnumber write FdocRefInitiatorTabnumber;
    property docRefInitiatorFIO : WideString read FdocRefInitiatorFIO write FdocRefInitiatorFIO;
    property docRefInitiatorPodrName : WideString read FdocRefInitiatorPodrName write FdocRefInitiatorPodrName;
    property docRefSignerTabnumber : WideString read FdocRefSignerTabnumber write FdocRefSignerTabnumber;
    property docRefSignerFIO : WideString read FdocRefSignerFIO write FdocRefSignerFIO;
    property docRefSignerPostInfo : WideString read FdocRefSignerPostInfo write FdocRefSignerPostInfo;
    property docRefDesignatedTabnumber : WideString read FdocRefDesignatedTabnumber write FdocRefDesignatedTabnumber;
    property docRefDesignatedFIO : WideString read FdocRefDesignatedFIO write FdocRefDesignatedFIO;
    property docRefDesignatedPostInfo : WideString read FdocRefDesignatedPostInfo write FdocRefDesignatedPostInfo;
    property docRefUserAdd : WideString read FdocRefUserAdd write FdocRefUserAdd;
    property docRefDateAdd : TXSDateTime read FdocRefDateAdd write FdocRefDateAdd;
    property docRefUserGen : WideString read FdocRefUserGen write FdocRefUserGen;
    property docRefDateEdit : TXSDateTime read FdocRefDateEdit write FdocRefDateEdit;
  end;

  ArrayOfRQOrder2DFDocAttachmentShort = array of RQOrder2DFDocAttachmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2DFDocAttachmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2DFDocAttachmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2DFDocAttachmentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2DFDocAttachmentController/message/
  // soapAction: http://ksoe.org/RQOrder2DFDocAttachmentController/action/RQOrder2DFDocAttachmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2DFDocAttachmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2DFDocAttachmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2DFDocAttachmentControllerSoapPort = interface(IInvokable)
  ['{A1B6361F-F168-4A74-AAEF-D78E44D7E123}']
    function add(const aRQOrder2DFDocAttachment: RQOrder2DFDocAttachment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2DFDocAttachment: RQOrder2DFDocAttachment); stdcall;
    function getObject(const anObjectCode: Integer): RQOrder2DFDocAttachment; stdcall;
    function getList: RQOrder2DFDocAttachmentShortList; stdcall;
    function getFilteredList(const aRQOrder2DFDocAttachmentFilter: RQOrder2DFDocAttachmentFilter): RQOrder2DFDocAttachmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2DFDocAttachmentShortList; stdcall;
    function getScrollableFilteredList(const aRQOrder2DFDocAttachmentFilter: RQOrder2DFDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2DFDocAttachmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2DFDocAttachmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrder2DFDocAttachmentFilter: RQOrder2DFDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrder2DFDocAttachmentShort; stdcall;
  end;


implementation

  destructor RQOrder2DFDocAttachment.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FdocRef) then
      docRef.Free;
    inherited Destroy;
  end;

{
  destructor RQOrder2DFDocAttachmentFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FdocRef) then
      docRef.Free;
    inherited Destroy;
  end;
}

  destructor RQOrder2DFDocAttachmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOrder2DFDocAttachmentShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    if Assigned(FdocRefDateRegistration) then
      docRefDateRegistration.Free;
    if Assigned(FdocRefPlanedDateEndWork) then
      docRefPlanedDateEndWork.Free;
    if Assigned(FdocRefDateEndWork) then
      docRefDateEndWork.Free;
    if Assigned(FdocRefDateAdd) then
      docRefDateAdd.Free;
    if Assigned(FdocRefDateEdit) then
      docRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQOrder2DFDocAttachmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2DFDocAttachment, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2DFDocAttachment');
  RemClassRegistry.RegisterXSClass(RQOrder2DFDocAttachmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2DFDocAttachmentRef');
  RemClassRegistry.RegisterXSClass(RQOrder2DFDocAttachmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2DFDocAttachmentFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2DFDocAttachmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2DFDocAttachmentShort');
  RemClassRegistry.RegisterXSClass(RQOrder2DFDocAttachmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2DFDocAttachmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2DFDocAttachmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2DFDocAttachmentShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2DFDocAttachmentControllerSoapPort), 'http://ksoe.org/RQOrder2DFDocAttachmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2DFDocAttachmentControllerSoapPort), 'http://ksoe.org/RQOrder2DFDocAttachmentController/action/RQOrder2DFDocAttachmentController.%operationName%');


end.
