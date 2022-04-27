unit RQFKOrder2FinServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQFKOrderController
   ,RQFKBankingServicesTypeController
   ,ENDepartmentController
   ,RQFKBSDescriptionController
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

  RQFKOrder2FinServices            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FinServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FinServices = class(TRemotable)
  private
    Fcode : Integer;
    FisTax : Integer;
    FisOverLimit : Integer;
    Fkau_table_id_1476 : Integer;
    Fkau_1476 : WideString;
    Fname_1476 : WideString;
    FtaxInvoiceNumber : WideString;
    FtaxInvoiceDateGen : TXSDate;
    FtaxBookId : Integer;
    FtaxBook : WideString;
    FtaxBookSymb : WideString;
    FcostItemId : Integer;
    FcostItem : WideString;
    FtaxRateId : Integer;
    FtaxRateName : WideString;
    FtaxRate : Integer;
    FaccountingGroupId : Integer;
    FaccountingGroup : WideString;
    FcommentGen : WideString;
    FisTransferTax : Integer;
    FtradeDocTypeCode : Integer;
    FtradeDocTypeName : WideString;
    FisRefinementTax : Integer;
    Fkau_table_id_2494 : Integer;
    Fkau_2494 : WideString;
    Fname_2494 : WideString;
    FassetNumAX : WideString;
    FassetDescriptionAX : WideString;
    FpurposeNumAX : WideString;
    FpurposeDescriptionAX : WideString;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkBankingServicesTypeRef : RQFKBankingServicesTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FdescriptionRef : RQFKBSDescriptionRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  isTax : Integer read FisTax write FisTax;
    property  isOverLimit : Integer read FisOverLimit write FisOverLimit;
    property  kau_table_id_1476 : Integer read Fkau_table_id_1476 write Fkau_table_id_1476;
    property kau_1476 : WideString read Fkau_1476 write Fkau_1476;
    property name_1476 : WideString read Fname_1476 write Fname_1476;
    property taxInvoiceNumber : WideString read FtaxInvoiceNumber write FtaxInvoiceNumber;
    property taxInvoiceDateGen : TXSDate read FtaxInvoiceDateGen write FtaxInvoiceDateGen;
    property  taxBookId : Integer read FtaxBookId write FtaxBookId;
    property taxBook : WideString read FtaxBook write FtaxBook;
    property taxBookSymb : WideString read FtaxBookSymb write FtaxBookSymb;
    property  costItemId : Integer read FcostItemId write FcostItemId;
    property costItem : WideString read FcostItem write FcostItem;
    property  taxRateId : Integer read FtaxRateId write FtaxRateId;
    property taxRateName : WideString read FtaxRateName write FtaxRateName;
    property  taxRate : Integer read FtaxRate write FtaxRate;
    property  accountingGroupId : Integer read FaccountingGroupId write FaccountingGroupId;
    property accountingGroup : WideString read FaccountingGroup write FaccountingGroup;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  isTransferTax : Integer read FisTransferTax write FisTransferTax;
    property  tradeDocTypeCode : Integer read FtradeDocTypeCode write FtradeDocTypeCode;
    property tradeDocTypeName : WideString read FtradeDocTypeName write FtradeDocTypeName;
    property  isRefinementTax : Integer read FisRefinementTax write FisRefinementTax;
    property  kau_table_id_2494 : Integer read Fkau_table_id_2494 write Fkau_table_id_2494;
    property kau_2494 : WideString read Fkau_2494 write Fkau_2494;
    property name_2494 : WideString read Fname_2494 write Fname_2494;
    property assetNumAX : WideString read FassetNumAX write FassetNumAX;
    property assetDescriptionAX : WideString read FassetDescriptionAX write FassetDescriptionAX;
    property purposeNumAX : WideString read FpurposeNumAX write FpurposeNumAX;
    property purposeDescriptionAX : WideString read FpurposeDescriptionAX write FpurposeDescriptionAX;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property fkBankingServicesTypeRef : RQFKBankingServicesTypeRef read FfkBankingServicesTypeRef write FfkBankingServicesTypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property descriptionRef : RQFKBSDescriptionRef read FdescriptionRef write FdescriptionRef;
  end;

{
  RQFKOrder2FinServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FisTax : Integer;
    FisOverLimit : Integer;
    Fkau_table_id_1476 : Integer;
    Fkau_1476 : WideString;
    Fname_1476 : WideString;
    FtaxInvoiceNumber : WideString;
    FtaxInvoiceDateGen : TXSDate;
    FtaxBookId : Integer;
    FtaxBook : WideString;
    FtaxBookSymb : WideString;
    FcostItemId : Integer;
    FcostItem : WideString;
    FtaxRateId : Integer;
    FtaxRateName : WideString;
    FtaxRate : Integer;
    FaccountingGroupId : Integer;
    FaccountingGroup : WideString;
    FcommentGen : WideString;
    FisTransferTax : Integer;
    FtradeDocTypeCode : Integer;
    FtradeDocTypeName : WideString;
    FisRefinementTax : Integer;
    Fkau_table_id_2494 : Integer;
    Fkau_2494 : WideString;
    Fname_2494 : WideString;
    FassetNumAX : WideString;
    FassetDescriptionAX : WideString;
    FpurposeNumAX : WideString;
    FpurposeDescriptionAX : WideString;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkBankingServicesTypeRef : RQFKBankingServicesTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FdescriptionRef : RQFKBSDescriptionRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  isTax : Integer read FisTax write FisTax;
    property  isOverLimit : Integer read FisOverLimit write FisOverLimit;
    property  kau_table_id_1476 : Integer read Fkau_table_id_1476 write Fkau_table_id_1476;
    property kau_1476 : WideString read Fkau_1476 write Fkau_1476;
    property name_1476 : WideString read Fname_1476 write Fname_1476;
    property taxInvoiceNumber : WideString read FtaxInvoiceNumber write FtaxInvoiceNumber;
    property taxInvoiceDateGen : TXSDate read FtaxInvoiceDateGen write FtaxInvoiceDateGen;
    property  taxBookId : Integer read FtaxBookId write FtaxBookId;
    property taxBook : WideString read FtaxBook write FtaxBook;
    property taxBookSymb : WideString read FtaxBookSymb write FtaxBookSymb;
    property  costItemId : Integer read FcostItemId write FcostItemId;
    property costItem : WideString read FcostItem write FcostItem;
    property  taxRateId : Integer read FtaxRateId write FtaxRateId;
    property taxRateName : WideString read FtaxRateName write FtaxRateName;
    property  taxRate : Integer read FtaxRate write FtaxRate;
    property  accountingGroupId : Integer read FaccountingGroupId write FaccountingGroupId;
    property accountingGroup : WideString read FaccountingGroup write FaccountingGroup;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  isTransferTax : Integer read FisTransferTax write FisTransferTax;
    property  tradeDocTypeCode : Integer read FtradeDocTypeCode write FtradeDocTypeCode;
    property tradeDocTypeName : WideString read FtradeDocTypeName write FtradeDocTypeName;
    property  isRefinementTax : Integer read FisRefinementTax write FisRefinementTax;
    property  kau_table_id_2494 : Integer read Fkau_table_id_2494 write Fkau_table_id_2494;
    property kau_2494 : WideString read Fkau_2494 write Fkau_2494;
    property name_2494 : WideString read Fname_2494 write Fname_2494;
    property assetNumAX : WideString read FassetNumAX write FassetNumAX;
    property assetDescriptionAX : WideString read FassetDescriptionAX write FassetDescriptionAX;
    property purposeNumAX : WideString read FpurposeNumAX write FpurposeNumAX;
    property purposeDescriptionAX : WideString read FpurposeDescriptionAX write FpurposeDescriptionAX;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property fkBankingServicesTypeRef : RQFKBankingServicesTypeRef read FfkBankingServicesTypeRef write FfkBankingServicesTypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property descriptionRef : RQFKBSDescriptionRef read FdescriptionRef write FdescriptionRef;
  end;
}

  RQFKOrder2FinServicesFilter = class(RQFKOrder2FinServices)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrder2FinServicesShort = class(TRemotable)
  private
    Fcode : Integer;
    FisTax : Integer;
    FisOverLimit : Integer;
    Fkau_table_id_1476 : Integer;
    Fkau_1476 : WideString;
    Fname_1476 : WideString;
    FtaxInvoiceNumber : WideString;
    FtaxInvoiceDateGen : TXSDate;
    FtaxBookId : Integer;
    FtaxBook : WideString;
    FtaxBookSymb : WideString;
    FcostItemId : Integer;
    FcostItem : WideString;
    FtaxRateId : Integer;
    FtaxRateName : WideString;
    FtaxRate : Integer;
    FaccountingGroupId : Integer;
    FaccountingGroup : WideString;
    FcommentGen : WideString;
    FisTransferTax : Integer;
    FtradeDocTypeCode : Integer;
    FtradeDocTypeName : WideString;
    FisRefinementTax : Integer;
    Fkau_table_id_2494 : Integer;
    Fkau_2494 : WideString;
    Fname_2494 : WideString;
    FassetNumAX : WideString;
    FassetDescriptionAX : WideString;
    FpurposeNumAX : WideString;
    FpurposeDescriptionAX : WideString;
    FfkOrderRefCode : Integer;
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefDateShipment : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer;
    FfkOrderRefPercentProfits : TXSDecimal;
    FfkOrderRefAccount : WideString;
    FfkOrderRefKod_podr : WideString;
    FfkOrderRefName_podr : WideString;
    FfkOrderRefIsMaterialsSent : Integer;
    FfkOrderRefDateAdd : TXSDateTime;
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;
    FfkOrderRefDatePosting : TXSDate;
    FfkOrderRefUserGen : WideString;
    FfkOrderRefPalletNumber : WideString;
    FfkOrderRefIsByOrder : Integer;
    FfkOrderRefOrderInfo : WideString;
    FfkOrderRefDateDelivery : TXSDate;
    FfkBankingServicesTypeRefCode : Integer;
    FfkBankingServicesTypeRefName : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdescriptionRefCode : Integer;
    FdescriptionRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  isTax : Integer read FisTax write FisTax;
    property  isOverLimit : Integer read FisOverLimit write FisOverLimit;
    property  kau_table_id_1476 : Integer read Fkau_table_id_1476 write Fkau_table_id_1476;
    property kau_1476 : WideString read Fkau_1476 write Fkau_1476;
    property name_1476 : WideString read Fname_1476 write Fname_1476;
    property taxInvoiceNumber : WideString read FtaxInvoiceNumber write FtaxInvoiceNumber;
    property taxInvoiceDateGen : TXSDate read FtaxInvoiceDateGen write FtaxInvoiceDateGen;
    property  taxBookId : Integer read FtaxBookId write FtaxBookId;
    property taxBook : WideString read FtaxBook write FtaxBook;
    property taxBookSymb : WideString read FtaxBookSymb write FtaxBookSymb;
    property  costItemId : Integer read FcostItemId write FcostItemId;
    property costItem : WideString read FcostItem write FcostItem;
    property  taxRateId : Integer read FtaxRateId write FtaxRateId;
    property taxRateName : WideString read FtaxRateName write FtaxRateName;
    property  taxRate : Integer read FtaxRate write FtaxRate;
    property  accountingGroupId : Integer read FaccountingGroupId write FaccountingGroupId;
    property accountingGroup : WideString read FaccountingGroup write FaccountingGroup;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  isTransferTax : Integer read FisTransferTax write FisTransferTax;
    property  tradeDocTypeCode : Integer read FtradeDocTypeCode write FtradeDocTypeCode;
    property tradeDocTypeName : WideString read FtradeDocTypeName write FtradeDocTypeName;
    property  isRefinementTax : Integer read FisRefinementTax write FisRefinementTax;
    property  kau_table_id_2494 : Integer read Fkau_table_id_2494 write Fkau_table_id_2494;
    property kau_2494 : WideString read Fkau_2494 write Fkau_2494;
    property name_2494 : WideString read Fname_2494 write Fname_2494;
    property assetNumAX : WideString read FassetNumAX write FassetNumAX;
    property assetDescriptionAX : WideString read FassetDescriptionAX write FassetDescriptionAX;
    property purposeNumAX : WideString read FpurposeNumAX write FpurposeNumAX;
    property purposeDescriptionAX : WideString read FpurposeDescriptionAX write FpurposeDescriptionAX;

    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode;
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc;
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen;
    property fkOrderRefDateShipment : TXSDate read FfkOrderRefDateShipment write FfkOrderRefDateShipment;
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode;
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName;
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode;
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName;
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode;
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName;
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber;
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate;
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO;
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds;
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds;
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent;
    property fkOrderRefPercentProfits : TXSDecimal read FfkOrderRefPercentProfits write FfkOrderRefPercentProfits;
    property fkOrderRefAccount : WideString read FfkOrderRefAccount write FfkOrderRefAccount;
    property fkOrderRefKod_podr : WideString read FfkOrderRefKod_podr write FfkOrderRefKod_podr;
    property fkOrderRefName_podr : WideString read FfkOrderRefName_podr write FfkOrderRefName_podr;
    property fkOrderRefIsMaterialsSent : Integer read FfkOrderRefIsMaterialsSent write FfkOrderRefIsMaterialsSent;
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd;
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd;
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit;
    property fkOrderRefDatePosting : TXSDate read FfkOrderRefDatePosting write FfkOrderRefDatePosting;
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen;
    property fkOrderRefPalletNumber : WideString read FfkOrderRefPalletNumber write FfkOrderRefPalletNumber;
    property fkOrderRefIsByOrder : Integer read FfkOrderRefIsByOrder write FfkOrderRefIsByOrder;
    property fkOrderRefOrderInfo : WideString read FfkOrderRefOrderInfo write FfkOrderRefOrderInfo;
    property fkOrderRefDateDelivery : TXSDate read FfkOrderRefDateDelivery write FfkOrderRefDateDelivery;
    property fkBankingServicesTypeRefCode : Integer read FfkBankingServicesTypeRefCode write FfkBankingServicesTypeRefCode;
    property fkBankingServicesTypeRefName : WideString read FfkBankingServicesTypeRefName write FfkBankingServicesTypeRefName;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property descriptionRefCode : Integer read FdescriptionRefCode write FdescriptionRefCode;
    property descriptionRefName : WideString read FdescriptionRefName write FdescriptionRefName;
  end;

  ArrayOfRQFKOrder2FinServicesShort = array of RQFKOrder2FinServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2FinServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2FinServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2FinServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2FinServicesController/message/
  // soapAction: http://ksoe.org/RQFKOrder2FinServicesController/action/RQFKOrder2FinServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2FinServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2FinServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2FinServicesControllerSoapPort = interface(IInvokable)
  ['{D90AA8FF-36B6-487B-A06F-89D0212C9EDA}']
    function add(const aRQFKOrder2FinServices: RQFKOrder2FinServices): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2FinServices: RQFKOrder2FinServices); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrder2FinServices; stdcall;
    function getList: RQFKOrder2FinServicesShortList; stdcall;
    function getFilteredList(const aRQFKOrder2FinServicesFilter: RQFKOrder2FinServicesFilter): RQFKOrder2FinServicesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FinServicesShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrder2FinServicesFilter: RQFKOrder2FinServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FinServicesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FinServicesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrder2FinServicesFilter: RQFKOrder2FinServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrder2FinServicesShort; stdcall;
  end;


implementation

  destructor RQFKOrder2FinServices.Destroy;
  begin
    if Assigned(FtaxInvoiceDateGen) then
      taxInvoiceDateGen.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkBankingServicesTypeRef) then
      fkBankingServicesTypeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FdescriptionRef) then
      descriptionRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrder2FinServicesFilter.Destroy;
  begin
    if Assigned(FtaxInvoiceDateGen) then
      taxInvoiceDateGen.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkBankingServicesTypeRef) then
      fkBankingServicesTypeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FdescriptionRef) then
      descriptionRef.Free;
    inherited Destroy;
  end;
}

  destructor RQFKOrder2FinServicesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQFKOrder2FinServicesShort.Destroy;
  begin
    if Assigned(FtaxInvoiceDateGen) then
      taxInvoiceDateGen.Free;
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefDateShipment) then
      fkOrderRefDateShipment.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    if Assigned(FfkOrderRefPercentProfits) then
      fkOrderRefPercentProfits.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    if Assigned(FfkOrderRefDatePosting) then
      fkOrderRefDatePosting.Free;
    if Assigned(FfkOrderRefDateDelivery) then
      fkOrderRefDateDelivery.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor RQFKOrder2FinServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2FinServices, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FinServices');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FinServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FinServicesRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FinServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FinServicesFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FinServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FinServicesShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FinServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FinServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2FinServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2FinServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2FinServicesControllerSoapPort), 'http://ksoe.org/RQFKOrder2FinServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2FinServicesControllerSoapPort), 'http://ksoe.org/RQFKOrder2FinServicesController/action/RQFKOrder2FinServicesController.%operationName%');


end.
