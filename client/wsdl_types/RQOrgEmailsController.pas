unit RQOrgEmailsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrg2TypePayController
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

  RQOrgEmails            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgEmailsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrgEmails = class(TRemotable)
  private
    Fcode : Integer;
    Femail : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    ForgRef : RQOrg2TypePayRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property email : WideString read Femail write Femail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property orgRef : RQOrg2TypePayRef read ForgRef write ForgRef;
  end;

{
  RQOrgEmailsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Femail : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    ForgRef : RQOrg2TypePayRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property email : WideString read Femail write Femail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property orgRef : RQOrg2TypePayRef read ForgRef write ForgRef;
  end;
}

  RQOrgEmailsFilter = class(RQOrgEmails)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOrgEmailsShort = class(TRemotable)
  private
    Fcode : Integer;
    Femail : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    ForgRefCode : Integer;
    ForgRefId : Integer;
    ForgRefCodeorg : WideString;
    ForgRefName : WideString;
    ForgRefOkpo : WideString;
    ForgRefEmail : WideString;
    ForgRefPaymentValue : Integer;
    ForgRefUserGen : WideString;
    ForgRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property email : WideString read Femail write Femail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property orgRefCode : Integer read ForgRefCode write ForgRefCode;
    property orgRefId : Integer read ForgRefId write ForgRefId;
    property orgRefCodeorg : WideString read ForgRefCodeorg write ForgRefCodeorg;
    property orgRefName : WideString read ForgRefName write ForgRefName;
    property orgRefOkpo : WideString read ForgRefOkpo write ForgRefOkpo;
    property orgRefEmail : WideString read ForgRefEmail write ForgRefEmail;
    property orgRefPaymentValue : Integer read ForgRefPaymentValue write ForgRefPaymentValue;
    property orgRefUserGen : WideString read ForgRefUserGen write ForgRefUserGen;
    property orgRefDateEdit : TXSDate read ForgRefDateEdit write ForgRefDateEdit;
  end;

  ArrayOfRQOrgEmailsShort = array of RQOrgEmailsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrgEmailsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrgEmailsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrgEmailsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrgEmailsController/message/
  // soapAction: http://ksoe.org/RQOrgEmailsController/action/RQOrgEmailsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrgEmailsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrgEmailsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrgEmailsControllerSoapPort = interface(IInvokable)
  ['{E5AB4D77-D739-4558-A9C3-9EA671C82343}']
    function add(const aRQOrgEmails: RQOrgEmails): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrgEmails: RQOrgEmails); stdcall;
    function getObject(const anObjectCode: Integer): RQOrgEmails; stdcall;
    function getList: RQOrgEmailsShortList; stdcall;
    function getFilteredList(const aRQOrgEmailsFilter: RQOrgEmailsFilter): RQOrgEmailsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrgEmailsShortList; stdcall;
    function getScrollableFilteredList(const aRQOrgEmailsFilter: RQOrgEmailsFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrgEmailsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrgEmailsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOrgEmailsFilter: RQOrgEmailsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrgEmailsShort; stdcall;
  end;


implementation

  destructor RQOrgEmails.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForgRef) then
      orgRef.Free;
    inherited Destroy;
  end;

{
  destructor RQOrgEmailsFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForgRef) then
      orgRef.Free;
    inherited Destroy;
  end;
}

  destructor RQOrgEmailsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOrgEmailsShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForgRefDateEdit) then
      orgRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQOrgEmailsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrgEmails, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgEmails');
  RemClassRegistry.RegisterXSClass(RQOrgEmailsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgEmailsRef');
  RemClassRegistry.RegisterXSClass(RQOrgEmailsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgEmailsFilter');
  RemClassRegistry.RegisterXSClass(RQOrgEmailsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgEmailsShort');
  RemClassRegistry.RegisterXSClass(RQOrgEmailsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrgEmailsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrgEmailsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrgEmailsShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrgEmailsControllerSoapPort), 'http://ksoe.org/RQOrgEmailsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrgEmailsControllerSoapPort), 'http://ksoe.org/RQOrgEmailsController/action/RQOrgEmailsController.%operationName%');


end.
