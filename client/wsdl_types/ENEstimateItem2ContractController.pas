unit ENEstimateItem2ContractController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENEstimateItemController
   ,RQOrgController
   ,RQPurchaseItem2EstimateItemController
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

  ENEstimateItem2Contract            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2ContractRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2Contract = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FestimateItem : ENEstimateItem;
//???
    Forg : RQOrg;
//???
    FrqPurchItm2Estimate : RQPurchaseItem2EstimateItem;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem;
    property org : RQOrg read Forg write Forg;
    property rqPurchItm2Estimate : RQPurchaseItem2EstimateItem read FrqPurchItm2Estimate write FrqPurchItm2Estimate;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  ENEstimateItem2ContractFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountFact : TXSDecimal;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FestimateItem : ENEstimateItem;
//???
    Forg : RQOrg;
//???
    FrqPurchItm2Estimate : RQPurchaseItem2EstimateItem;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property estimateItem : ENEstimateItem read FestimateItem write FestimateItem;
    property org : RQOrg read Forg write Forg;
    property rqPurchItm2Estimate : RQPurchaseItem2EstimateItem read FrqPurchItm2Estimate write FrqPurchItm2Estimate;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  ENEstimateItem2ContractFilter = class(ENEstimateItem2Contract)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateItem2ContractShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FestimateItemCode : Integer;
    FestimateItemCountGen : TXSDecimal;
    FestimateItemCountFact : TXSDecimal;
    FestimateItemPrice : TXSDecimal;
    FestimateItemCost : TXSDecimal;
    FestimateItemIsUseVAT : Integer;
    FestimateItemDeliveryTime : Integer;
    FestimateItemUseWorkTime : Integer;
    FestimateItemUserGen : WideString;
    FestimateItemDateEdit : TXSDate;
    ForgCode : Integer;
    FrqPurchItm2EstimateCode : Integer;
    FrqPurchItm2EstimateCountGen : TXSDecimal;
    FrqPurchItm2EstimateCountPurchase : TXSDecimal;
    FrqPurchItm2EstimateStatusComment : WideString;
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
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property estimateItemCode : Integer read FestimateItemCode write FestimateItemCode;
    property estimateItemCountGen : TXSDecimal read FestimateItemCountGen write FestimateItemCountGen;
    property estimateItemCountFact : TXSDecimal read FestimateItemCountFact write FestimateItemCountFact;
    property estimateItemPrice : TXSDecimal read FestimateItemPrice write FestimateItemPrice;
    property estimateItemCost : TXSDecimal read FestimateItemCost write FestimateItemCost;
    property estimateItemIsUseVAT : Integer read FestimateItemIsUseVAT write FestimateItemIsUseVAT;
    property estimateItemDeliveryTime : Integer read FestimateItemDeliveryTime write FestimateItemDeliveryTime;
    property estimateItemUseWorkTime : Integer read FestimateItemUseWorkTime write FestimateItemUseWorkTime;
    property estimateItemUserGen : WideString read FestimateItemUserGen write FestimateItemUserGen;
    property estimateItemDateEdit : TXSDate read FestimateItemDateEdit write FestimateItemDateEdit;
    property orgCode : Integer read ForgCode write ForgCode; //RQOrgRef read ForgCode write ForgCode;
    property rqPurchItm2EstimateCode : Integer read FrqPurchItm2EstimateCode write FrqPurchItm2EstimateCode;
    property rqPurchItm2EstimateCountGen : TXSDecimal read FrqPurchItm2EstimateCountGen write FrqPurchItm2EstimateCountGen;
    property rqPurchItm2EstimateCountPurchase : TXSDecimal read FrqPurchItm2EstimateCountPurchase write FrqPurchItm2EstimateCountPurchase;
    property rqPurchItm2EstimateStatusComment : WideString read FrqPurchItm2EstimateStatusComment write FrqPurchItm2EstimateStatusComment;
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

  ArrayOfENEstimateItem2ContractShort = array of ENEstimateItem2ContractShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItem2ContractShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItem2ContractShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItem2ContractShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItem2ContractController/message/
  // soapAction: http://ksoe.org/ENEstimateItem2ContractController/action/ENEstimateItem2ContractController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItem2ContractControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItem2ContractController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItem2ContractControllerSoapPort = interface(IInvokable)
  ['{23FEAF2E-E149-4ED6-8F1B-2FABE599331C}']
    function add(const aENEstimateItem2Contract: ENEstimateItem2Contract): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItem2Contract: ENEstimateItem2Contract); stdcall;
    function getObject(const anObjectCode: Integer): ENEstimateItem2Contract; stdcall;
    function getList: ENEstimateItem2ContractShortList; stdcall;
    function getFilteredList(const aENEstimateItem2ContractFilter: ENEstimateItem2ContractFilter): ENEstimateItem2ContractShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ContractShortList; stdcall;
    function getScrollableFilteredList(const aENEstimateItem2ContractFilter: ENEstimateItem2ContractFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ContractShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2ContractShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENEstimateItem2ContractFilter: ENEstimateItem2ContractFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENEstimateItem2ContractShort; stdcall;

    function addWithEstimateList(const aENEstimateItem2Contract: ENEstimateItem2Contract; estimateList: ArrayOfENEstimateItemShort): Integer; stdcall;
    procedure removeByEstimateCode(const aENEstimateItem2Contract: Integer); stdcall;
    function getRestCountByContract(const aFinDocCode: String; const aMaterialCode: Integer): TXSDecimal; stdcall;
  end;


implementation

  destructor ENEstimateItem2Contract.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FrqPurchItm2Estimate) then
      rqPurchItm2Estimate.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor ENEstimateItem2ContractFilter.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItem) then
      estimateItem.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(FrqPurchItm2Estimate) then
      rqPurchItm2Estimate.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor ENEstimateItem2ContractFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENEstimateItem2ContractShort.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItemCountGen) then
      estimateItemCountGen.Free;
    if Assigned(FestimateItemCountFact) then
      estimateItemCountFact.Free;
    if Assigned(FestimateItemPrice) then
      estimateItemPrice.Free;
    if Assigned(FestimateItemCost) then
      estimateItemCost.Free;
    if Assigned(FestimateItemDateEdit) then
      estimateItemDateEdit.Free;
    if Assigned(FrqPurchItm2EstimateCountGen) then
      rqPurchItm2EstimateCountGen.Free;
    if Assigned(FrqPurchItm2EstimateCountPurchase) then
      rqPurchItm2EstimateCountPurchase.Free;
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

  destructor ENEstimateItem2ContractShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItem2Contract, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2Contract');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ContractRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ContractRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ContractFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ContractFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ContractShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ContractShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2ContractShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2ContractShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItem2ContractShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItem2ContractShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItem2ContractControllerSoapPort), 'http://ksoe.org/ENEstimateItem2ContractController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItem2ContractControllerSoapPort), 'http://ksoe.org/ENEstimateItem2ContractController/action/ENEstimateItem2ContractController.%operationName%');


end.
