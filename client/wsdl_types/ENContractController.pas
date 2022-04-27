unit ENContractController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQOrgController
   ,ENContractTypeController
   ,RQPurchaseItemTenderController
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

  ENContract            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContractRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContract = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcontractEndDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FcontractType : ENContractType;
//???
    FpurchaseItemTender : RQPurchaseItemTender;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property org : RQOrg read Forg write Forg;
    property contractType : ENContractType read FcontractType write FcontractType;
    property purchaseItemTender : RQPurchaseItemTender read FpurchaseItemTender write FpurchaseItemTender;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  ENContractFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcontractEndDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Forg : RQOrg;
//???
    FcontractType : ENContractType;
//???
    FpurchaseItemTender : RQPurchaseItemTender;
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
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property org : RQOrg read Forg write Forg;
    property contractType : ENContractType read FcontractType write FcontractType;
    property purchaseItemTender : RQPurchaseItemTender read FpurchaseItemTender write FpurchaseItemTender;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  ENContractFilter = class(ENContract)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENContractShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FcontractEndDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    ForgCode : Integer;
    ForgName : WideString;
    FcontractTypeCode : Integer;
    FcontractTypeName : WideString;
    FpurchaseItemTenderCode : Integer;
    FpurchaseItemTenderIdentid : WideString;
    FpurchaseItemTenderIdentid2 : WideString;
    FpurchaseItemTenderPurchaseName : WideString;
    FpurchaseItemTenderFinancingSource : WideString;
    FpurchaseItemTenderSumGenWithNds : TXSDecimal;
    FpurchaseItemTenderSumFactWithNds : TXSDecimal;
    FpurchaseItemTenderTentativeYearGen : Integer;
    FpurchaseItemTenderTentativeMonthGen : Integer;
    FpurchaseItemTenderCountSymbolForGroup : Integer;
    FpurchaseItemTenderCommentGen : WideString;
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
    property contractEndDate : TXSDate read FcontractEndDate write FcontractEndDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property orgCode : Integer read ForgCode write ForgCode; //RQOrgRef read ForgCode write ForgCode;
    property orgName : WideString read ForgName write ForgName;
    property contractTypeCode : Integer read FcontractTypeCode write FcontractTypeCode;
    property contractTypeName : WideString read FcontractTypeName write FcontractTypeName;
    property purchaseItemTenderCode : Integer read FpurchaseItemTenderCode write FpurchaseItemTenderCode;
    property purchaseItemTenderIdentid : WideString read FpurchaseItemTenderIdentid write FpurchaseItemTenderIdentid;
    property purchaseItemTenderIdentid2 : WideString read FpurchaseItemTenderIdentid2 write FpurchaseItemTenderIdentid2;
    property purchaseItemTenderPurchaseName : WideString read FpurchaseItemTenderPurchaseName write FpurchaseItemTenderPurchaseName;
    property purchaseItemTenderFinancingSource : WideString read FpurchaseItemTenderFinancingSource write FpurchaseItemTenderFinancingSource;
    property purchaseItemTenderSumGenWithNds : TXSDecimal read FpurchaseItemTenderSumGenWithNds write FpurchaseItemTenderSumGenWithNds;
    property purchaseItemTenderSumFactWithNds : TXSDecimal read FpurchaseItemTenderSumFactWithNds write FpurchaseItemTenderSumFactWithNds;
    property purchaseItemTenderTentativeYearGen : Integer read FpurchaseItemTenderTentativeYearGen write FpurchaseItemTenderTentativeYearGen;
    property purchaseItemTenderTentativeMonthGen : Integer read FpurchaseItemTenderTentativeMonthGen write FpurchaseItemTenderTentativeMonthGen;
    property purchaseItemTenderCountSymbolForGroup : Integer read FpurchaseItemTenderCountSymbolForGroup write FpurchaseItemTenderCountSymbolForGroup;
    property purchaseItemTenderCommentGen : WideString read FpurchaseItemTenderCommentGen write FpurchaseItemTenderCommentGen;
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

  ArrayOfENContractShort = array of ENContractShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContractShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContractShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContractShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContractController/message/
  // soapAction: http://ksoe.org/ENContractController/action/ENContractController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContractControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContractController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContractControllerSoapPort = interface(IInvokable)
  ['{19072063-9EC9-499C-8D5D-211D26215D14}']
    function add(const aENContract: ENContract): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContract: ENContract); stdcall;
    function getObject(const anObjectCode: Integer): ENContract; stdcall;
    function getList: ENContractShortList; stdcall;
    function getFilteredList(const aENContractFilter: ENContractFilter): ENContractShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContractShortList; stdcall;
    function getScrollableFilteredList(const aENContractFilter: ENContractFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContractShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContractShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENContractFilter: ENContractFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENContractShort; stdcall;
  end;


implementation

  destructor ENContract.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FcontractType) then
      contractType.Free;
    if Assigned(FpurchaseItemTender) then
      purchaseItemTender.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor ENContractFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FcontractType) then
      contractType.Free;
    if Assigned(FpurchaseItemTender) then
      purchaseItemTender.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor ENContractFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENContractShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcontractEndDate) then
      contractEndDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FpurchaseItemTenderSumGenWithNds) then
      purchaseItemTenderSumGenWithNds.Free;
    if Assigned(FpurchaseItemTenderSumFactWithNds) then
      purchaseItemTenderSumFactWithNds.Free;
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

  destructor ENContractShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContract, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContract');
  RemClassRegistry.RegisterXSClass(ENContractRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractRef');
  RemClassRegistry.RegisterXSClass(ENContractFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractFilter');
  RemClassRegistry.RegisterXSClass(ENContractShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractShort');
  RemClassRegistry.RegisterXSClass(ENContractShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContractShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContractShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContractShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContractControllerSoapPort), 'http://ksoe.org/ENContractController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContractControllerSoapPort), 'http://ksoe.org/ENContractController/action/ENContractController.%operationName%');


end.
