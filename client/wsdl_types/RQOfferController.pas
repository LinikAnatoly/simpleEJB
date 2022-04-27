unit RQOfferController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrderController
   ,RQOrg2TypePayController
   ,RQOfferStatusController
   ,ENResponsiblesController
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

  RQOffer            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOfferRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOffer = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    Femail : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    ForderRef : RQOrderRef;
//???
    ForgRef : RQOrg2TypePayRef;
//???
    FstatusRef : RQOfferStatusRef;
//???
    FresponsiblesRef : ENResponsiblesRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property email : WideString read Femail write Femail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
    property orgRef : RQOrg2TypePayRef read ForgRef write ForgRef;
    property statusRef : RQOfferStatusRef read FstatusRef write FstatusRef;
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef;
  end;

{
  RQOfferFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    Femail : WideString;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    ForderRef : RQOrderRef;
//???
    ForgRef : RQOrg2TypePayRef;
//???
    FstatusRef : RQOfferStatusRef;
//???
    FresponsiblesRef : ENResponsiblesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property email : WideString read Femail write Femail;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property orderRef : RQOrderRef read ForderRef write ForderRef;
    property orgRef : RQOrg2TypePayRef read ForgRef write ForgRef;
    property statusRef : RQOfferStatusRef read FstatusRef write FstatusRef;
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef;
  end;
}

  RQOfferFilter = class(RQOffer)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQOfferShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    Femail : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    ForderRefCode : Integer;
    ForderRefNumberDoc : WideString;
    ForderRefNumberProject : WideString;
    ForderRefOrderPeriod : TXSDate;
    ForderRefDateGen : TXSDate;
    ForderRefUserGen : WideString;
    ForgRefCode : Integer;
    ForgRefId : Integer;
    ForgRefCodeorg : WideString;
    ForgRefName : WideString;
    ForgRefOkpo : WideString;
    ForgRefEmail : WideString;
    ForgRefPaymentValue : Integer;
    ForgRefUserGen : WideString;
    ForgRefDateEdit : TXSDate;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FresponsiblesRefCode : Integer;
    FresponsiblesRefFIO : WideString;
    FresponsiblesRefTabNumber : Integer;
    FresponsiblesRefPosition : WideString;
    FresponsiblesRefDepName : WideString;
    FresponsiblesRefDepCode : WideString;
    FresponsiblesRefPhone : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property email : WideString read Femail write Femail;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property orderRefCode : Integer read ForderRefCode write ForderRefCode;
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc;
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject;
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod;
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen;
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen;
    property orgRefCode : Integer read ForgRefCode write ForgRefCode;
    property orgRefId : Integer read ForgRefId write ForgRefId;
    property orgRefCodeorg : WideString read ForgRefCodeorg write ForgRefCodeorg;
    property orgRefName : WideString read ForgRefName write ForgRefName;
    property orgRefOkpo : WideString read ForgRefOkpo write ForgRefOkpo;
    property orgRefEmail : WideString read ForgRefEmail write ForgRefEmail;
    property orgRefPaymentValue : Integer read ForgRefPaymentValue write ForgRefPaymentValue;
    property orgRefUserGen : WideString read ForgRefUserGen write ForgRefUserGen;
    property orgRefDateEdit : TXSDate read ForgRefDateEdit write ForgRefDateEdit;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property responsiblesRefCode : Integer read FresponsiblesRefCode write FresponsiblesRefCode;
    property responsiblesRefFIO : WideString read FresponsiblesRefFIO write FresponsiblesRefFIO;
    property responsiblesRefTabNumber : Integer read FresponsiblesRefTabNumber write FresponsiblesRefTabNumber;
    property responsiblesRefPosition : WideString read FresponsiblesRefPosition write FresponsiblesRefPosition;
    property responsiblesRefDepName : WideString read FresponsiblesRefDepName write FresponsiblesRefDepName;
    property responsiblesRefDepCode : WideString read FresponsiblesRefDepCode write FresponsiblesRefDepCode;
    property responsiblesRefPhone : WideString read FresponsiblesRefPhone write FresponsiblesRefPhone;
  end;

  ArrayOfRQOfferShort = array of RQOfferShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOfferShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOfferShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOfferShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOfferController/message/
  // soapAction: http://ksoe.org/RQOfferController/action/RQOfferController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOfferControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOfferController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOfferControllerSoapPort = interface(IInvokable)
  ['{4873A344-42F3-4875-AFC4-B67E4CAA601B}']
    function add(const aRQOffer: RQOffer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOffer: RQOffer); stdcall;
    function getObject(const anObjectCode: Integer): RQOffer; stdcall;
    function getList: RQOfferShortList; stdcall;
    function getFilteredList(const aRQOfferFilter: RQOfferFilter): RQOfferShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOfferShortList; stdcall;
    function getScrollableFilteredList(const aRQOfferFilter: RQOfferFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOfferShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOfferShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQOfferFilter: RQOfferFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOfferShort; stdcall;
  end;


implementation

  destructor RQOffer.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(ForgRef) then
      orgRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    inherited Destroy;
  end;

{
  destructor RQOfferFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(ForgRef) then
      orgRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    inherited Destroy;
  end;
}

  destructor RQOfferFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQOfferShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    if Assigned(ForgRefDateEdit) then
      orgRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQOfferShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOffer, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOffer');
  RemClassRegistry.RegisterXSClass(RQOfferRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferRef');
  RemClassRegistry.RegisterXSClass(RQOfferFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferFilter');
  RemClassRegistry.RegisterXSClass(RQOfferShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferShort');
  RemClassRegistry.RegisterXSClass(RQOfferShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOfferShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOfferShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOfferShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOfferControllerSoapPort), 'http://ksoe.org/RQOfferController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOfferControllerSoapPort), 'http://ksoe.org/RQOfferController/action/RQOfferController.%operationName%');


end.
