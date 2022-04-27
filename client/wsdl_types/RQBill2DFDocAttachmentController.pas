unit RQBill2DFDocAttachmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,DFDocAttachmentController
   ,RQBillController
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

  RQBill2DFDocAttachment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBill2DFDocAttachmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBill2DFDocAttachment = class(TRemotable)
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
    FbillRef : RQBillRef;
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
    property billRef : RQBillRef read FbillRef write FbillRef;
    property docRef : DFDocRef read FdocRef write FdocRef;
  end;

{
  RQBill2DFDocAttachmentFilter = class(TRemotable)
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
    FbillRef : RQBillRef;
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
    property billRef : RQBillRef read FbillRef write FbillRef;
    property docRef : DFDocRef read FdocRef write FdocRef;
  end;
}

  RQBill2DFDocAttachmentFilter = class(RQBill2DFDocAttachment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBill2DFDocAttachmentShort = class(TRemotable)
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
    FbillRefCode : Integer;
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FbillRefDeliveryDays : TXSDecimal;
    FbillRefVat : TXSDecimal;
    FbillRefContractNumber : WideString;
    FbillRefFinDocCode : WideString;
    FbillRefSumWithNds : TXSDecimal;
    FbillRefPersonalAccount : WideString;
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
    property billRefCode : Integer read FbillRefCode write FbillRefCode;
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc;
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject;
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen;
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen;
    property billRefDeliveryDays : TXSDecimal read FbillRefDeliveryDays write FbillRefDeliveryDays;
    property billRefVat : TXSDecimal read FbillRefVat write FbillRefVat;
    property billRefContractNumber : WideString read FbillRefContractNumber write FbillRefContractNumber;
    property billRefFinDocCode : WideString read FbillRefFinDocCode write FbillRefFinDocCode;
    property billRefSumWithNds : TXSDecimal read FbillRefSumWithNds write FbillRefSumWithNds;
    property billRefPersonalAccount : WideString read FbillRefPersonalAccount write FbillRefPersonalAccount;
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

  ArrayOfRQBill2DFDocAttachmentShort = array of RQBill2DFDocAttachmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBill2DFDocAttachmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBill2DFDocAttachmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBill2DFDocAttachmentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBill2DFDocAttachmentController/message/
  // soapAction: http://ksoe.org/RQBill2DFDocAttachmentController/action/RQBill2DFDocAttachmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBill2DFDocAttachmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBill2DFDocAttachmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBill2DFDocAttachmentControllerSoapPort = interface(IInvokable)
  ['{DDFA40BF-E623-48F3-8747-EBC8A4D10842}']
    function add(const aRQBill2DFDocAttachment: RQBill2DFDocAttachment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBill2DFDocAttachment: RQBill2DFDocAttachment); stdcall;
    function getObject(const anObjectCode: Integer): RQBill2DFDocAttachment; stdcall;
    function getList: RQBill2DFDocAttachmentShortList; stdcall;
    function getFilteredList(const aRQBill2DFDocAttachmentFilter: RQBill2DFDocAttachmentFilter): RQBill2DFDocAttachmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBill2DFDocAttachmentShortList; stdcall;
    function getScrollableFilteredList(const aRQBill2DFDocAttachmentFilter: RQBill2DFDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBill2DFDocAttachmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBill2DFDocAttachmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBill2DFDocAttachmentFilter: RQBill2DFDocAttachmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBill2DFDocAttachmentShort; stdcall;
  end;


implementation

  destructor RQBill2DFDocAttachment.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FdocRef) then
      docRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBill2DFDocAttachmentFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FdocRef) then
      docRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBill2DFDocAttachmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBill2DFDocAttachmentShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FbillRefDeliveryDays) then
      billRefDeliveryDays.Free;
    if Assigned(FbillRefVat) then
      billRefVat.Free;
    if Assigned(FbillRefSumWithNds) then
      billRefSumWithNds.Free;
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

  destructor RQBill2DFDocAttachmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBill2DFDocAttachment, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2DFDocAttachment');
  RemClassRegistry.RegisterXSClass(RQBill2DFDocAttachmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2DFDocAttachmentRef');
  RemClassRegistry.RegisterXSClass(RQBill2DFDocAttachmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2DFDocAttachmentFilter');
  RemClassRegistry.RegisterXSClass(RQBill2DFDocAttachmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2DFDocAttachmentShort');
  RemClassRegistry.RegisterXSClass(RQBill2DFDocAttachmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBill2DFDocAttachmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBill2DFDocAttachmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBill2DFDocAttachmentShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBill2DFDocAttachmentControllerSoapPort), 'http://ksoe.org/RQBill2DFDocAttachmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBill2DFDocAttachmentControllerSoapPort), 'http://ksoe.org/RQBill2DFDocAttachmentController/action/RQBill2DFDocAttachmentController.%operationName%');


end.
