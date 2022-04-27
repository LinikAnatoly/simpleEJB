unit RQPlanPayController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPayStatusController
   ,RQPlanPayKindController
   ,RQBillController
   ,RQBillItemController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQPlanPay            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPay = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdateCreateItem : TXSDateTime;
    Fmodify_time : Int64;
//???
    FstatusRef : RQPlanPayStatusRef;
    FkindRef : RQPlanPayKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property dateCreateItem : TXSDateTime read FdateCreateItem write FdateCreateItem;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQPlanPayStatusRef read FstatusRef write FstatusRef;
    property kindRef : RQPlanPayKindRef read FkindRef write FkindRef;
  end;

  IFobsXMLInfo = class(TRemotable)
  private
    Famount : Integer;
    FcorrSName : WideString;
    FdetailsOfPayment : WideString;
    FcorrAccountNo : WideString;
    FaccountNo : WideString;
    FcorrBankId : WideString;
    FcorrIdentifyCode : WideString;
    FdocumentNo : WideString;
    FdocumentDate : WideString;
    FourBankId : WideString;
    FbillNumber : WideString;
    FbillDate : WideString;
    FTypeFinanc : WideString;
    FBillCode : WideString;
    Fourokpo : WideString;

  public
    destructor Destroy; override;
  published
    property  amount : Integer read Famount write Famount;
    property corrSName : WideString read FcorrSName write FcorrSName;
    property detailsOfPayment : WideString read FdetailsOfPayment write FdetailsOfPayment;
    property corrAccountNo : WideString read FcorrAccountNo write FcorrAccountNo;
    property accountNo : WideString read FaccountNo write FaccountNo;
    property corrBankId : WideString read FcorrBankId write FcorrBankId;
    property corrIdentifyCode : WideString read FcorrIdentifyCode write FcorrIdentifyCode;
    property documentNo : WideString read FdocumentNo write FdocumentNo;
    property documentDate : WideString read FdocumentDate write FdocumentDate;
    property ourBankId : WideString read FourBankId write FourBankId;
    property billNumber : WideString read FbillNumber write FbillNumber;
    property billDate : WideString read FbillDate write FbillDate;
    property typeFinanc : WideString read FTypeFinanc write FTypeFinanc;
    property billCode : WideString read FBillCode write FBillCode;
    property ourokpo : WideString read Fourokpo write Fourokpo;

  end;

  ArrayOfIFobsXMLInfo = array of IFobsXMLInfo;

{
  RQPlanPayFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberDoc : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdateCreateItem : TXSDate;
    Fmodify_time : Int64;
//???
    FstatusRef : RQPlanPayStatusRef;
FkindRef : RQPlanPayKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property dateCreateItem : TXSDate read FdateCreateItem write FdateCreateItem ;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : RQPlanPayStatusRef read FstatusRef write FstatusRef;
 property kindRef : RQPlanPayKindRef read FkindRef write FkindRef;
  end;
}

  RQPlanPayFilter = class(RQPlanPay)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FdateGen : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdateCreateItem : TXSDateTime;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
    FkindRefTxtGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property dateCreateItem : TXSDateTime read FdateCreateItem write FdateCreateItem;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    property kindRefTxtGen : WideString read FkindRefTxtGen write FkindRefTxtGen;
  end;

  ArrayOfRQPlanPayShort = array of RQPlanPayShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayShort read Flist write Flist;
  end;

  IFobsXMLInfoList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfIFobsXMLInfo;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfIFobsXMLInfo read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayController/message/
  // soapAction: http://ksoe.org/RQPlanPayController/action/RQPlanPayController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayControllerSoapPort = interface(IInvokable)
  ['{1acd1acd-1acd-1acd-1acd-1acd1acd1acd}']
    function add(const aRQPlanPay: RQPlanPay; const budgCode : Integer ): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPay: RQPlanPay); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPay; stdcall;
    function getList: RQPlanPayShortList; stdcall;
    function getFilteredList(const aRQPlanPayFilter: RQPlanPayFilter): RQPlanPayShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayFilter: RQPlanPayFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayFilter: RQPlanPayFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayShort; stdcall;
    procedure GenerateItems(const planPayCode: Integer; const startDate: String; const orderItemCode: Integer ; const generateVariant : Integer); stdcall;
    function getListForIFobsXMLFile(const rqPlanPayCode: Integer): IFobsXMLInfoList; stdcall;
    function getListForIFobsXMLFileNotImportedFromProbank(const rqPlanPayCode: Integer): IFobsXMLInfoList; stdcall;
    procedure exportReestrPlatFromProbank(const rqPlanPayCode: Integer); stdcall;
    procedure makePayDocs(const rqPlanPayCode: Integer); stdcall;
    procedure removePayDocs(const rqPlanPayCode: Integer); stdcall;

    procedure created( planPayCode : Integer ); stdcall;
    procedure unCreated( planPayCode : Integer ); stdcall;
    procedure approve( planPayCode : Integer ); stdcall;
    procedure unApprove( planPayCode : Integer );stdcall;

    procedure GenerateItemsService(const planPayCode: Integer; const startDate: String; const orderItemCode: Integer ; const generateVariant : Integer); stdcall;

    function getCurrentSaldoKreditDebet(const planPayItemFirstCode: Integer): RQbill; stdcall;

    procedure EditDateGenRQPlanPay(const aRQPlanPay: RQPlanPay); stdcall;

    // SUPP-8816 проверка на переплату реестра
    function  checkReestrForOverPayment(const planPayCode: Integer): RQBillItemShortList; stdcall;
  end;


implementation

//uses ;

  destructor RQPlanPay.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
if Assigned(FdateCreateItem) then
      dateCreateItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPayFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
if Assigned(FdateCreateItem) then
      dateCreateItem.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPayFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPayShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
if Assigned(FdateCreateItem) then
      dateCreateItem.Free;
    inherited Destroy;
  end;

  destructor IFobsXMLInfo.Destroy;
  begin
    inherited Destroy;
  end;

  destructor IFobsXMLInfoList.Destroy;
  var
    I : Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor RQPlanPayShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPay, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPay');
  RemClassRegistry.RegisterXSClass(RQPlanPayRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayShort');
  RemClassRegistry.RegisterXSClass(IFobsXMLInfo, 'http://ksoe.org/EnergyproControllerService/type/', 'IFobsXMLInfo');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfIFobsXMLInfo), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfIFobsXMLInfo');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayControllerSoapPort), 'http://ksoe.org/RQPlanPayController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayControllerSoapPort), 'http://ksoe.org/RQPlanPayController/action/RQPlanPayController.%operationName%');


end.
