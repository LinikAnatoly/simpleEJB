unit RQContract2TypePayController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrderItemTypePayController
   ,RQOrg2TypePayController
   ,ENGeneralContractsController
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

  RQContract2TypePay            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContract2TypePayRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContract2TypePay = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FpartnerID : Integer;
    FpaymentValue : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FtypePayRef : RQOrderItemTypePayRef;
//???
    Forg2TypePayRef : RQOrg2TypePayRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  partnerID : Integer read FpartnerID write FpartnerID;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property org2TypePayRef : RQOrg2TypePayRef read Forg2TypePayRef write Forg2TypePayRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  RQContract2TypePayFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FpartnerID : Integer;
    FpaymentValue : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FtypePayRef : RQOrderItemTypePayRef;
//???
    Forg2TypePayRef : RQOrg2TypePayRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  partnerID : Integer read FpartnerID write FpartnerID;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property org2TypePayRef : RQOrg2TypePayRef read Forg2TypePayRef write Forg2TypePayRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  RQContract2TypePayFilter = class(RQContract2TypePay)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQContract2TypePayShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FpartnerID : Integer;
    FpaymentValue : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FtypePayRefCode : Integer;
    FtypePayRefName : WideString;
    Forg2TypePayRefCode : Integer;
    Forg2TypePayRefId : Integer;
    Forg2TypePayRefCodeorg : WideString;
    Forg2TypePayRefName : WideString;
    Forg2TypePayRefOkpo : WideString;
    Forg2TypePayRefEmail : WideString;
    Forg2TypePayRefPaymentValue : Integer;
    Forg2TypePayRefUserGen : WideString;
    Forg2TypePayRefDateEdit : TXSDate;
    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property  partnerID : Integer read FpartnerID write FpartnerID;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property typePayRefCode : Integer read FtypePayRefCode write FtypePayRefCode;
    property typePayRefName : WideString read FtypePayRefName write FtypePayRefName;
    property org2TypePayRefCode : Integer read Forg2TypePayRefCode write Forg2TypePayRefCode;
    property org2TypePayRefId : Integer read Forg2TypePayRefId write Forg2TypePayRefId;
    property org2TypePayRefCodeorg : WideString read Forg2TypePayRefCodeorg write Forg2TypePayRefCodeorg;
    property org2TypePayRefName : WideString read Forg2TypePayRefName write Forg2TypePayRefName;
    property org2TypePayRefOkpo : WideString read Forg2TypePayRefOkpo write Forg2TypePayRefOkpo;
    property org2TypePayRefEmail : WideString read Forg2TypePayRefEmail write Forg2TypePayRefEmail;
    property org2TypePayRefPaymentValue : Integer read Forg2TypePayRefPaymentValue write Forg2TypePayRefPaymentValue;
    property org2TypePayRefUserGen : WideString read Forg2TypePayRefUserGen write Forg2TypePayRefUserGen;
    property org2TypePayRefDateEdit : TXSDate read Forg2TypePayRefDateEdit write Forg2TypePayRefDateEdit;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;
  end;

  ArrayOfRQContract2TypePayShort = array of RQContract2TypePayShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQContract2TypePayShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQContract2TypePayShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQContract2TypePayShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQContract2TypePayController/message/
  // soapAction: http://ksoe.org/RQContract2TypePayController/action/RQContract2TypePayController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQContract2TypePayControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQContract2TypePayController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQContract2TypePayControllerSoapPort = interface(IInvokable)
  ['{CCC49678-6BEF-4DAD-A699-C26AE2AD992A}']
    function add(const aRQContract2TypePay: RQContract2TypePay): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQContract2TypePay: RQContract2TypePay); stdcall;
    function getObject(const anObjectCode: Integer): RQContract2TypePay; stdcall;
    function getList: RQContract2TypePayShortList; stdcall;
    function getFilteredList(const aRQContract2TypePayFilter: RQContract2TypePayFilter): RQContract2TypePayShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQContract2TypePayShortList; stdcall;
    function getScrollableFilteredList(const aRQContract2TypePayFilter: RQContract2TypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): RQContract2TypePayShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQContract2TypePayShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQContract2TypePayFilter: RQContract2TypePayFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQContract2TypePayShort; stdcall;
  end;


implementation

  destructor RQContract2TypePay.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(Forg2TypePayRef) then
      org2TypePayRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor RQContract2TypePayFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(Forg2TypePayRef) then
      org2TypePayRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor RQContract2TypePayFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQContract2TypePayShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Forg2TypePayRefDateEdit) then
      org2TypePayRefDateEdit.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor RQContract2TypePayShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQContract2TypePay, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContract2TypePay');
  RemClassRegistry.RegisterXSClass(RQContract2TypePayRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContract2TypePayRef');
  RemClassRegistry.RegisterXSClass(RQContract2TypePayFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContract2TypePayFilter');
  RemClassRegistry.RegisterXSClass(RQContract2TypePayShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContract2TypePayShort');
  RemClassRegistry.RegisterXSClass(RQContract2TypePayShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContract2TypePayShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQContract2TypePayShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQContract2TypePayShort');

  InvRegistry.RegisterInterface(TypeInfo(RQContract2TypePayControllerSoapPort), 'http://ksoe.org/RQContract2TypePayController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQContract2TypePayControllerSoapPort), 'http://ksoe.org/RQContract2TypePayController/action/RQContract2TypePayController.%operationName%');


end.
