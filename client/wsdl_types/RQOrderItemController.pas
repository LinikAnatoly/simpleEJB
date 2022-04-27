unit RQOrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
	 ,TKMaterialsController
	 ,TKMeasurementController
	 ,RQOrgController
	 ,RQOrderController
	 ,RQDDSCodesController
	 ,RQOrderItemStatusController
	 ,ENEstimateItemController
	 ,ENDepartmentController
	 ,ENResponsiblesController
	 ,RQOrderItemTypePayController
   ,RQPurchaseItemController
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

  RQOrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameGenRQ : WideString;
    FmeasurementNameGenRQ : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    Fnds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FdeliveryTime : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FplannedDatePays : TXSDate;
    FplannedDateDelivery : TXSDate;
    FstatusReason : WideString;
    FpaymentValue : Integer;
    FisPaid : Integer;
    FspecificationCode : Integer;
    FagreeDocNum : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    Fmeasurement : TKMeasurement;
//???
    Forg : RQOrg;
//???
    ForderRef : RQOrderRef;
//???
    FddsCodes : RQDDSCodes;
//???
    FstatusRef : RQOrderItemStatusRef;
//???
		FbudgetRef : ENDepartmentRef;
//???
    FresponsiblesRef : ENResponsiblesRef;
		FdateRealiz : TXSDate;
		FtypePayRef : RQOrderItemTypePayRef;
    FpurchaseItemRef : RQPurchaseItemRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
	public
		destructor Destroy; override;
	published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameGenRQ : WideString read FmaterialNameGenRQ write FmaterialNameGenRQ;
    property measurementNameGenRQ : WideString read FmeasurementNameGenRQ write FmeasurementNameGenRQ;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property nds : TXSDecimal read Fnds write Fnds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  deliveryTime : Integer read FdeliveryTime write FdeliveryTime; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property plannedDatePays : TXSDate read FplannedDatePays write FplannedDatePays;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property statusReason : WideString read FstatusReason write FstatusReason;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property  isPaid : Integer read FisPaid write FisPaid;
    property specificationCode : Integer read FspecificationCode write FspecificationCode;
    property agreeDocNum : WideString read FagreeDocNum write FagreeDocNum;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement; 
    property org : RQOrg read Forg write Forg; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
    property ddsCodes : RQDDSCodes read FddsCodes write FddsCodes; 
    property statusRef : RQOrderItemStatusRef read FstatusRef write FstatusRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef; 
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef;
    property dateRealiz : TXSDate read FdateRealiz write FdateRealiz;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
  
{
  RQOrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameGenRQ : WideString;
    FmeasurementNameGenRQ : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    Fnds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FdeliveryTime : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FplannedDatePays : TXSDate;
    FplannedDateDelivery : TXSDate;
    FstatusReason : WideString;
    FpaymentValue : Integer;
    FisPaid : Integer;
    FspecificationCode : Integer;
    FagreeDocNum : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    Fmeasurement : TKMeasurement;
//???
    Forg : RQOrg;
//???
    ForderRef : RQOrderRef;
//???
    FddsCodes : RQDDSCodes;
//???
    FstatusRef : RQOrderItemStatusRef;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FresponsiblesRef : ENResponsiblesRef;
    FtypePayRef : RQOrderItemTypePayRef;
    FpurchaseItemRef : RQPurchaseItemRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameGenRQ : WideString read FmaterialNameGenRQ write FmaterialNameGenRQ;
    property measurementNameGenRQ : WideString read FmeasurementNameGenRQ write FmeasurementNameGenRQ;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property nds : TXSDecimal read Fnds write Fnds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  deliveryTime : Integer read FdeliveryTime write FdeliveryTime; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property plannedDatePays : TXSDate read FplannedDatePays write FplannedDatePays;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property statusReason : WideString read FstatusReason write FstatusReason;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property  isPaid : Integer read FisPaid write FisPaid;
    property  specificationCode : Integer read FspecificationCode write FspecificationCode;
    property agreeDocNum : WideString read FagreeDocNum write FagreeDocNum;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement; 
    property org : RQOrg read Forg write Forg; 
    property orderRef : RQOrderRef read ForderRef write ForderRef; 
    property ddsCodes : RQDDSCodes read FddsCodes write FddsCodes; 
    property statusRef : RQOrderItemStatusRef read FstatusRef write FstatusRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef; 
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef;
    property typePayRef : RQOrderItemTypePayRef read FtypePayRef write FtypePayRef;
    property purchaseItemRef : RQPurchaseItemRef read FpurchaseItemRef write FpurchaseItemRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  RQOrderItemFilter = class(RQOrderItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQOrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FmaterialNameGen : WideString;
    FmeasurementNameGen : WideString;
    FmaterialNameGenRQ : WideString;
    FmeasurementNameGenRQ : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    Fnds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FdeliveryTime : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;	
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FplannedDatePays : TXSDate;	
    FplannedDateDelivery : TXSDate;	
    FstatusReason : WideString;
    FpaymentValue : Integer;
    FisPaid : Integer;
    FspecificationCode : Integer;
    FagreeDocNum : WideString;
    FuserGen : WideString;
    FmaterialCode : Integer; 
    FmaterialName : WideString;
    FmaterialIdentId : WideString;
    FmeasurementCode : Integer; 
    FmeasurementName : WideString;
    ForgCode : Integer; 
    ForgId : Integer; 
    ForgCodeorg : WideString;
    ForgName : WideString;
    ForgUkr_name : WideString;
    ForgOkpo : WideString;
    ForgNalog_num : WideString;
    ForgSvidet_num : WideString;
    ForgAdr : WideString;
    ForgTel : WideString;
    ForgCountry : WideString;
    ForgRegion : WideString;
    ForgMinistry : WideString;
    ForgOwnership : Integer; 
    ForgType : WideString;
    ForgMaster_code : WideString;
    ForgDate_svidet : TXSDate;
    ForgLikv_date : TXSDate;
    ForgExcept_flag : WideString;
    ForgLikv_flag : WideString;
    ForgBudget_flag : WideString;
    ForgDate_nalogform : TXSDate;
    ForgId_nalogform : Integer; 
    ForgAdr_legal : WideString;
    ForgPrimechan : WideString;
    ForderRefCode : Integer; 
    ForderRefNumberDoc : WideString;
    ForderRefNumberProject : WideString;
    ForderRefOrderPeriod : TXSDate;
    ForderRefDateGen : TXSDate;
    ForderRefUserGen : WideString;
    FddsCodesCode : Integer; 
    FddsCodesName : WideString;
    FddsCodesTxtCode : WideString;
    FddsCodesIsInvest : Integer; 
    FddsCodesIsActual : Integer; 
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;

    Fbudget : WideString;

    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;

    FbudgetRefCFOCode : WideString;

////
    FaxMaterialsRefCode : Integer;
    FaxMaterialsRefName : WideString;
    FaxMaterialsRefName_al : WideString;
    FaxMaterialsRefForeign_link_code : WideString;
    FaxMaterialsRefMesure_text : WideString;
    FaxMaterialsRefStatus : WideString;
////
    FresponsiblesRefCode : Integer; 
    FresponsiblesRefFIO : WideString;
    FresponsiblesRefTabNumber : Integer; 
    FresponsiblesRefPosition : WideString;
    FresponsiblesRefDepName : WideString;
    FresponsiblesRefDepCode : WideString;
    FresponsiblesRefPhone : WideString;
    FtypePayRefCode : Integer;
    FtypePayRefName : WideString;
    FpurchaseItemRefCode : Integer;

    ForderRefTypeCode : Integer;
    ForderRefKindCode : Integer;
    ForderRefFormCode : Integer;
    ForderRefResourceCode : Integer;

    /////
    FapprovedCostStatusCode: Integer;
    Fidentid2010: WideString;
    Fidentid2015: WideString;
    /////
    FpurchaseInfoByOrderItem : WideString;
    FgeneralContractRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property materialNameGen : WideString read FmaterialNameGen write FmaterialNameGen;
    property measurementNameGen : WideString read FmeasurementNameGen write FmeasurementNameGen;
    property materialNameGenRQ : WideString read FmaterialNameGenRQ write FmaterialNameGenRQ;
    property measurementNameGenRQ : WideString read FmeasurementNameGenRQ write FmeasurementNameGenRQ;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property nds : TXSDecimal read Fnds write Fnds;
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds;
    property sumNds : TXSDecimal read FsumNds write FsumNds;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  deliveryTime : Integer read FdeliveryTime write FdeliveryTime;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property plannedDatePays : TXSDate read FplannedDatePays write FplannedDatePays;
    property plannedDateDelivery : TXSDate read FplannedDateDelivery write FplannedDateDelivery;
    property statusReason : WideString read FstatusReason write FstatusReason;
    property  paymentValue : Integer read FpaymentValue write FpaymentValue;
    property  isPaid : Integer read FisPaid write FisPaid;
    property specificationCode : Integer read FspecificationCode write FspecificationCode;
    property agreeDocNum : WideString read FagreeDocNum write FagreeDocNum;
    property userGen : WideString read FuserGen write FuserGen;

    property materialCode : Integer read FmaterialCode write FmaterialCode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property orgCode : Integer read ForgCode write ForgCode;
    property orgId : Integer read ForgId write ForgId;
    property orgCodeorg : WideString read ForgCodeorg write ForgCodeorg;
    property orgName : WideString read ForgName write ForgName;
    property orgUkr_name : WideString read ForgUkr_name write ForgUkr_name;
    property orgOkpo : WideString read ForgOkpo write ForgOkpo;
    property orgNalog_num : WideString read ForgNalog_num write ForgNalog_num;
    property orgSvidet_num : WideString read ForgSvidet_num write ForgSvidet_num;
    property orgAdr : WideString read ForgAdr write ForgAdr;
    property orgTel : WideString read ForgTel write ForgTel;
    property orgCountry : WideString read ForgCountry write ForgCountry;
    property orgRegion : WideString read ForgRegion write ForgRegion;
    property orgMinistry : WideString read ForgMinistry write ForgMinistry;
    property orgOwnership : Integer read ForgOwnership write ForgOwnership; 
    property orgType : WideString read ForgType write ForgType; 
    property orgMaster_code : WideString read ForgMaster_code write ForgMaster_code; 
    property orgDate_svidet : TXSDate read ForgDate_svidet write ForgDate_svidet; 
    property orgLikv_date : TXSDate read ForgLikv_date write ForgLikv_date; 
    property orgExcept_flag : WideString read ForgExcept_flag write ForgExcept_flag; 
    property orgLikv_flag : WideString read ForgLikv_flag write ForgLikv_flag; 
    property orgBudget_flag : WideString read ForgBudget_flag write ForgBudget_flag; 
    property orgDate_nalogform : TXSDate read ForgDate_nalogform write ForgDate_nalogform; 
    property orgId_nalogform : Integer read ForgId_nalogform write ForgId_nalogform; 
    property orgAdr_legal : WideString read ForgAdr_legal write ForgAdr_legal; 
    property orgPrimechan : WideString read ForgPrimechan write ForgPrimechan; 
    property orderRefCode : Integer read ForderRefCode write ForderRefCode; 
    property orderRefNumberDoc : WideString read ForderRefNumberDoc write ForderRefNumberDoc; 
    property orderRefNumberProject : WideString read ForderRefNumberProject write ForderRefNumberProject; 
    property orderRefOrderPeriod : TXSDate read ForderRefOrderPeriod write ForderRefOrderPeriod; 
    property orderRefDateGen : TXSDate read ForderRefDateGen write ForderRefDateGen; 
    property orderRefUserGen : WideString read ForderRefUserGen write ForderRefUserGen;

    property orderRefTypeCode : Integer read ForderRefTypeCode write ForderRefTypeCode;
    property orderRefKindCode : Integer read ForderRefKindCode write ForderRefKindCode;
    property orderRefFormCode : Integer read ForderRefFormCode write ForderRefFormCode;
    property orderRefResourceCode : Integer read ForderRefResourceCode write ForderRefResourceCode;

    property ddsCodesCode : Integer read FddsCodesCode write FddsCodesCode;
    property ddsCodesName : WideString read FddsCodesName write FddsCodesName; 
    property ddsCodesTxtCode : WideString read FddsCodesTxtCode write FddsCodesTxtCode; 
    property ddsCodesIsInvest : Integer read FddsCodesIsInvest write FddsCodesIsInvest; 
    property ddsCodesIsActual : Integer read FddsCodesIsActual write FddsCodesIsActual; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName;

    property materialIdentId : WideString read FmaterialIdentId write FmaterialIdentId;

    property budget : WideString read Fbudget write Fbudget;

    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart;
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal;

    property budgetRefCFOCode : WideString read FbudgetRefCFOCode write FbudgetRefCFOCode;

////
    property axMaterialsRefCode : Integer read FaxMaterialsRefCode write FaxMaterialsRefCode;
    property axMaterialsRefName : WideString read FaxMaterialsRefName write FaxMaterialsRefName;
    property axMaterialsRefName_al : WideString read FaxMaterialsRefName_al write FaxMaterialsRefName_al;
    property axMaterialsRefForeign_link_code : WideString read FaxMaterialsRefForeign_link_code write FaxMaterialsRefForeign_link_code;
    property axMaterialsRefMesure_text : WideString read FaxMaterialsRefMesure_text write FaxMaterialsRefMesure_text;
    property axMaterialsRefStatus : WideString read FaxMaterialsRefStatus write FaxMaterialsRefStatus;
////     
    property responsiblesRefCode : Integer read FresponsiblesRefCode write FresponsiblesRefCode; 
    property responsiblesRefFIO : WideString read FresponsiblesRefFIO write FresponsiblesRefFIO; 
    property responsiblesRefTabNumber : Integer read FresponsiblesRefTabNumber write FresponsiblesRefTabNumber; 
    property responsiblesRefPosition : WideString read FresponsiblesRefPosition write FresponsiblesRefPosition; 
    property responsiblesRefDepName : WideString read FresponsiblesRefDepName write FresponsiblesRefDepName; 
    property responsiblesRefDepCode : WideString read FresponsiblesRefDepCode write FresponsiblesRefDepCode; 
    property responsiblesRefPhone : WideString read FresponsiblesRefPhone write FresponsiblesRefPhone;
    property typePayRefCode : Integer read FtypePayRefCode write FtypePayRefCode;
    property typePayRefName : WideString read FtypePayRefName write FtypePayRefName;
    property purchaseItemRefCode : Integer read FpurchaseItemRefCode write FpurchaseItemRefCode;
    /////
    property identid2010 : WideString read Fidentid2010 write Fidentid2010;
    property identid2015 : WideString read Fidentid2015 write Fidentid2015;
    property approvedCostStatusCode: Integer read FapprovedCostStatusCode write FapprovedCostStatusCode;
    /////

    property purchaseInfoByOrderItem : WideString read FpurchaseInfoByOrderItem write FpurchaseInfoByOrderItem;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
  end;

  ArrayOfRQOrderItemShort = array of RQOrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItemController/message/
  // soapAction: http://ksoe.org/RQOrderItemController/action/RQOrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItemControllerSoapPort = interface(IInvokable)
  ['{81A3C485-EE5E-40DB-A974-B3127E381E12}']
    function  add(const aRQOrderItem: RQOrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItem: RQOrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItem; stdcall;
    function  getList: RQOrderItemShortList; stdcall;
    function  getFilteredList(const aRQOrderItemFilter: RQOrderItemFilter): RQOrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItemFilter: RQOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQOrderItemFilter: RQOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQOrderItemShort; stdcall;

    function  getGeneralList(const aRQOrderItemFilter: RQOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItemShortList; stdcall;

    function addWithEstimateList(const aRQOrderItem : RQOrderItem; estimateList : ArrayOfENEstimateItemShort) : Integer; stdcall;
    function addWithEstimateListForAutoOrder(const aRQOrderItem : RQOrderItem; estimateList : ArrayOfENEstimateItemShort) : Integer; stdcall;

    procedure addFromEstimate(const orderCode : Integer;  estimateCode : Integer); stdcall;

    procedure removeFromEstimate(const estimateCode : Integer; const orderCode : Integer); stdcall;
    procedure removeEstimateFromAutoOrder(const aRQOrderItem2ENEstimateItemCode: Integer); stdcall;
    procedure removeEstimateFromAVZOrder(const aRQOrderItem2ENEstimateItemCode: Integer); stdcall;

    //procedure removeFromRQOEByEstimate(const estimateCode : Integer; const rqOrderCode : Integer); stdcall;
    //procedure removeFromRQBudgetByEstimate(const estimateCode : Integer; const rqOrderCode : Integer); stdcall;
    //procedure removeFromRQDepartmentByEstimate(const estimateCode : Integer; const rqOrderCode : Integer); stdcall;
    procedure moveEstimate2Item(const rqOrderCode : Integer; const estimateCodes : ArrayOfInteger); stdcall;

    procedure changeStatus(const aRQOrderItem : RQOrderItem); stdcall;

    function getMeasurementForAX(const tkmeas: string; const axmeas: string) : string; stdcall;

    procedure saveWorkInMts(); stdcall;
    // SUPP-16773... 12.05.2014 +++ редактирование строки заявки на Услуги в статусе "В роботі у ВМТП"
    procedure saveWorkInMtsServices(); stdcall;

    procedure paid(const planPayItemSecondShortArr : ArrayOfRQOrderItemShort); stdcall;
    procedure nopaid(const planPayItemSecondShortArr : ArrayOfRQOrderItemShort); stdcall;

    procedure changeStatusOrderItem(const aRQOrderItem: RQOrderItem); stdcall; overload;

    {30.07.2021 SUPP-102605 Метод для массового изменения статусов строк заявки

      orderItemCodes  массив кодов строк статус которых нужно изменить
      aRQOrderItem    передаваемый объект у которого должно быть заполнены поля statusRef.code и statusReason
                      которые будут присвоены всем строкам заявкам с кодами из заданного массива
    }
    procedure changeStatusOrderItem(const aRQOrderItem: RQOrderItem; const orderItemCodes : ArrayOfInteger); stdcall; overload;

    procedure addMaterialToAVZOrder(const aRQOrderCode: Integer; const aMaterialCode : Integer; const Quantity : TXSDecimal; const budgetCode : Integer; const departmentCode: Integer); stdcall;

    function createOffer(const aOrderItemCodes: ArrayOfInteger; const aOrg2typePayCode: Integer): Integer; stdcall;

    procedure editDDSCode(const aRQOrderItem: RQOrderItem ); stdcall;
  end;


implementation

//uses
//	;

  destructor RQOrderItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FplannedDatePays) then
      plannedDatePays.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FddsCodes) then
      ddsCodes.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQOrderItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FplannedDatePays) then
      plannedDatePays.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(ForderRef) then
      orderRef.Free;
    if Assigned(FddsCodes) then
      ddsCodes.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    if Assigned(FtypePayRef) then
      typePayRef.Free;
    if Assigned(FpurchaseItemRef) then
      purchaseItemRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQOrderItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQOrderItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FplannedDatePays) then
      plannedDatePays.Free;
    if Assigned(FplannedDateDelivery) then
      plannedDateDelivery.Free;
    if Assigned(ForgDate_svidet) then
      orgDate_svidet.Free;
    if Assigned(ForgLikv_date) then
      orgLikv_date.Free;
    if Assigned(ForgDate_nalogform) then
      orgDate_nalogform.Free;
    if Assigned(ForderRefOrderPeriod) then
      orderRefOrderPeriod.Free;
    if Assigned(ForderRefDateGen) then
      orderRefDateGen.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem');
  RemClassRegistry.RegisterXSClass(RQOrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemRef');
  RemClassRegistry.RegisterXSClass(RQOrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemShort');
  RemClassRegistry.RegisterXSClass(RQOrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItemControllerSoapPort), 'http://ksoe.org/RQOrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItemControllerSoapPort), 'http://ksoe.org/RQOrderItemController/action/RQOrderItemController.%operationName%');


end.
