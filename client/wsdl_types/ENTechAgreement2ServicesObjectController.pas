unit ENTechAgreement2ServicesObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesObjectController
   ,ENWarrantController
   ,ENServicesFromSideObjectController
   ,ENTechAgr2SOKindController
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

  ENTechAgreement2ServicesObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechAgreement2ServicesObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechAgreement2ServicesObject = class(TRemotable)
  private
    Fcode : Integer;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FpartnerOkpo : WideString;
    FbankName : WideString;
    FbankMfo : WideString;
    FbankRSchet : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FobjectName : WideString;
    FcostWorks : TXSDecimal;
    FcostWorksNDS : TXSDecimal;
    FbasisForAction : WideString;
    FactNumber : WideString;
    FactDate : TXSDate;
    FexecutorTaxType : WideString;
    Farea : TXSDecimal;
    FpartnerPosition : WideString;
    FpartnerFIO : WideString;
    FpartnerAddress : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
    FcontractTerm : TXSDate;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FagreementWarrantRef : ENWarrantRef;
//???
    FactWarrantRef : ENWarrantRef;
//???
    FservicesFromSideRef : ENServicesFromSideObjectRef;
//???
    FtechAgrKindRef : ENTechAgr2SOKindRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerOkpo : WideString read FpartnerOkpo write FpartnerOkpo;
    property bankName : WideString read FbankName write FbankName;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankRSchet : WideString read FbankRSchet write FbankRSchet;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectName : WideString read FobjectName write FobjectName;
    property costWorks : TXSDecimal read FcostWorks write FcostWorks;
    property costWorksNDS : TXSDecimal read FcostWorksNDS write FcostWorksNDS;
    property basisForAction : WideString read FbasisForAction write FbasisForAction;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDate read FactDate write FactDate;
    property executorTaxType : WideString read FexecutorTaxType write FexecutorTaxType;
    property area : TXSDecimal read Farea write Farea;
    property partnerPosition : WideString read FpartnerPosition write FpartnerPosition;
    property partnerFIO : WideString read FpartnerFIO write FpartnerFIO;
    property partnerAddress : WideString read FpartnerAddress write FpartnerAddress;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property contractTerm : TXSDate read FcontractTerm write FcontractTerm;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property agreementWarrantRef : ENWarrantRef read FagreementWarrantRef write FagreementWarrantRef;
    property actWarrantRef : ENWarrantRef read FactWarrantRef write FactWarrantRef;
    property servicesFromSideRef : ENServicesFromSideObjectRef read FservicesFromSideRef write FservicesFromSideRef;
    property techAgrKindRef : ENTechAgr2SOKindRef read FtechAgrKindRef write FtechAgrKindRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  ENTechAgreement2ServicesObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FpartnerOkpo : WideString;
    FbankName : WideString;
    FbankMfo : WideString;
    FbankRSchet : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FobjectName : WideString;
    FcostWorks : TXSDecimal;
    FcostWorksNDS : TXSDecimal;
    FbasisForAction : WideString;
    FactNumber : WideString;
    FactDate : TXSDate;
    FexecutorTaxType : WideString;
    Farea : TXSDecimal;
    FpartnerPosition : WideString;
    FpartnerFIO : WideString;
    FpartnerAddress : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FservicesObjectRef : ENServicesObjectRef;
//???
    FagreementWarrantRef : ENWarrantRef;
//???
    FactWarrantRef : ENWarrantRef;
//???
    FservicesFromSideRef : ENServicesFromSideObjectRef;
//???
    FtechAgrKindRef : ENTechAgr2SOKindRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerOkpo : WideString read FpartnerOkpo write FpartnerOkpo;
    property bankName : WideString read FbankName write FbankName;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankRSchet : WideString read FbankRSchet write FbankRSchet;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectName : WideString read FobjectName write FobjectName;
    property costWorks : TXSDecimal read FcostWorks write FcostWorks;
    property costWorksNDS : TXSDecimal read FcostWorksNDS write FcostWorksNDS;
    property basisForAction : WideString read FbasisForAction write FbasisForAction;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDate read FactDate write FactDate;
    property executorTaxType : WideString read FexecutorTaxType write FexecutorTaxType;
    property area : TXSDecimal read Farea write Farea;
    property partnerPosition : WideString read FpartnerPosition write FpartnerPosition;
    property partnerFIO : WideString read FpartnerFIO write FpartnerFIO;
    property partnerAddress : WideString read FpartnerAddress write FpartnerAddress;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property servicesObjectRef : ENServicesObjectRef read FservicesObjectRef write FservicesObjectRef;
    property agreementWarrantRef : ENWarrantRef read FagreementWarrantRef write FagreementWarrantRef;
    property actWarrantRef : ENWarrantRef read FactWarrantRef write FactWarrantRef;
    property servicesFromSideRef : ENServicesFromSideObjectRef read FservicesFromSideRef write FservicesFromSideRef;
    property techAgrKindRef : ENTechAgr2SOKindRef read FtechAgrKindRef write FtechAgrKindRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  ENTechAgreement2ServicesObjectFilter = class(ENTechAgreement2ServicesObject)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTechAgreement2ServicesObjectShort = class(TRemotable)
  private
    Fcode : Integer;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FpartnerOkpo : WideString;
    FbankName : WideString;
    FbankMfo : WideString;
    FbankRSchet : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FcommentGen : WideString;
    FobjectName : WideString;
    FcostWorks : TXSDecimal;
    FcostWorksNDS : TXSDecimal;
    FbasisForAction : WideString;
    FactNumber : WideString;
    FactDate : TXSDate;
    FexecutorTaxType : WideString;
    Farea : TXSDecimal;
    FpartnerPosition : WideString;
    FpartnerFIO : WideString;
    FpartnerAddress : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcontractTerm : TXSDate;
    FservicesObjectRefCode : Integer;
    FservicesObjectRefContractNumber : WideString;
    FservicesObjectRefContractDate : TXSDate;
    FservicesObjectRefName : WideString;
    FservicesObjectRefPartnerCode : WideString;
    FservicesObjectRefFinDocCode : WideString;
    FservicesObjectRefFinDocID : Integer;
    FservicesObjectRefCommentGen : WideString;
    FservicesObjectRefContractNumberServices : WideString;
    FservicesObjectRefContractDateServices : TXSDate;
    FservicesObjectRefContragentName : WideString;
    FservicesObjectRefContragentAddress : WideString;
    FservicesObjectRefContragentAddressWork : WideString;
    FservicesObjectRefContragentOkpo : WideString;
    FservicesObjectRefContragentBankAccount : WideString;
    FservicesObjectRefContragentBankName : WideString;
    FservicesObjectRefContragentBankMfo : WideString;
    FservicesObjectRefContragentBossName : WideString;
    FservicesObjectRefContragentPassport : WideString;
    FservicesObjectRefContractServicesSumma : TXSDecimal;
    FservicesObjectRefContractServicesPower : TXSDecimal;
    FservicesObjectRefCommentServicesGen : WideString;
    FservicesObjectRefContractServicesDistance : TXSDecimal;
    FservicesObjectRefContractServicesDay : TXSDecimal;
    FservicesObjectRefUserGen : WideString;
    FservicesObjectRefDateEdit : TXSDate;
    FservicesObjectRefWarrantDate : TXSDate;
    FservicesObjectRefWarrantNumber : WideString;
    FservicesObjectRefWarrantFIO : WideString;
    FservicesObjectRefRegionalType : Integer;
    FservicesObjectRefBasisType : TXSDecimal;
    FservicesObjectRefContragentPosition : WideString;
    FservicesObjectRefExecuteWorkDate : TXSDate;
    FservicesObjectRefTimeStart : TXSDateTime;
    FservicesObjectRefTimeFinal : TXSDateTime;
    FservicesObjectRefContragentPhoneNumber : WideString;
    FservicesObjectRefExecutorPhoneNumber : WideString;
    FservicesObjectRefContragentObjectWork : WideString;
    FservicesObjectRefIsNoPay : Integer;
    FservicesObjectRefIsCustomerMaterials : Integer;
    FservicesObjectRefPayDate : TXSDate;
    FservicesObjectRefFinPayFormCode : Integer;
    FservicesObjectRefFinPayFormName : WideString;
    FservicesObjectRefPartnerId : Integer;
    FservicesObjectRefPayDetail : WideString;
    FservicesObjectRefActTransferNumber : WideString;
    FservicesObjectRefActTransferDate : TXSDate;
    FservicesObjectRefResposible : WideString;
    FservicesObjectRefResposiblePosition : WideString;
    FservicesObjectRefResposibleTabNumber : WideString;
    FservicesObjectRefPrevContractStatus : Integer;
    FservicesObjectRefReconnectionTU : Integer;
    FservicesObjectRefPersonalAccountCode : Integer;
    FservicesObjectRefPersonalAccountNumber : WideString;
    FservicesObjectRefTabNumber : WideString;
    FservicesObjectRefCitiesList : WideString;
    FservicesObjectRefLineLength : TXSDecimal;
    FservicesObjectRefProjectCode : WideString;
    FservicesObjectRefCnPackCode : Integer;
    FservicesObjectRefDfPackCode : Integer;
    FservicesObjectRefCountersZoneType : Integer;
    FservicesObjectRefAxPartnerCode : WideString;
    FservicesObjectRefAxPartnerName : WideString;
    FservicesObjectRefAxContractNumber : WideString;
    FservicesObjectRefAxContractDate : TXSDate;
    FservicesObjectRefAxContractCode : WideString;
    FservicesObjectRefAxContractId : WideString;
    FservicesObjectRefAxContractCommentGen : WideString;
    FagreementWarrantRefCode : Integer;
    FagreementWarrantRefNumbergen : WideString;
    FagreementWarrantRefName : WideString;
    FagreementWarrantRefWarrantFIO : WideString;
    FagreementWarrantRefWarrantShortFIO : WideString;
    FagreementWarrantRefWarrantPosition : WideString;
    FagreementWarrantRefGenitiveFIO : WideString;
    FagreementWarrantRefGenitivePosition : WideString;
    FagreementWarrantRefPassport : WideString;
    FagreementWarrantRefAddress : WideString;
    FagreementWarrantRefPower : Integer;
    FagreementWarrantRefMaxSum : TXSDecimal;
    FactWarrantRefCode : Integer;
    FactWarrantRefNumbergen : WideString;
    FactWarrantRefName : WideString;
    FactWarrantRefWarrantFIO : WideString;
    FactWarrantRefWarrantShortFIO : WideString;
    FactWarrantRefWarrantPosition : WideString;
    FactWarrantRefGenitiveFIO : WideString;
    FactWarrantRefGenitivePosition : WideString;
    FactWarrantRefPassport : WideString;
    FactWarrantRefAddress : WideString;
    FactWarrantRefPower : Integer;
    FactWarrantRefMaxSum : TXSDecimal;
    FservicesFromSideRefCode : Integer;
    FservicesFromSideRefContractNumber : WideString;
    FservicesFromSideRefContractDate : TXSDate;
    FservicesFromSideRefName : WideString;
    FservicesFromSideRefPartnerCode : WideString;
    FservicesFromSideRefFinDocCode : WideString;
    FservicesFromSideRefFinDocID : Integer;
    FservicesFromSideRefCommentGen : WideString;
    FservicesFromSideRefUserGen : WideString;
    FservicesFromSideRefDateEdit : TXSDate;
    FtechAgrKindRefCode : Integer;
    FtechAgrKindRefName : WideString;
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
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property partnerOkpo : WideString read FpartnerOkpo write FpartnerOkpo;
    property bankName : WideString read FbankName write FbankName;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankRSchet : WideString read FbankRSchet write FbankRSchet;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property objectName : WideString read FobjectName write FobjectName;
    property costWorks : TXSDecimal read FcostWorks write FcostWorks;
    property costWorksNDS : TXSDecimal read FcostWorksNDS write FcostWorksNDS;
    property basisForAction : WideString read FbasisForAction write FbasisForAction;
    property actNumber : WideString read FactNumber write FactNumber;
    property actDate : TXSDate read FactDate write FactDate;
    property executorTaxType : WideString read FexecutorTaxType write FexecutorTaxType;
    property area : TXSDecimal read Farea write Farea;
    property partnerPosition : WideString read FpartnerPosition write FpartnerPosition;
    property partnerFIO : WideString read FpartnerFIO write FpartnerFIO;
    property partnerAddress : WideString read FpartnerAddress write FpartnerAddress;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property contractTerm : TXSDate read FcontractTerm write FcontractTerm;

    property servicesObjectRefCode : Integer read FservicesObjectRefCode write FservicesObjectRefCode;
    property servicesObjectRefContractNumber : WideString read FservicesObjectRefContractNumber write FservicesObjectRefContractNumber;
    property servicesObjectRefContractDate : TXSDate read FservicesObjectRefContractDate write FservicesObjectRefContractDate;
    property servicesObjectRefName : WideString read FservicesObjectRefName write FservicesObjectRefName;
    property servicesObjectRefPartnerCode : WideString read FservicesObjectRefPartnerCode write FservicesObjectRefPartnerCode;
    property servicesObjectRefFinDocCode : WideString read FservicesObjectRefFinDocCode write FservicesObjectRefFinDocCode;
    property servicesObjectRefFinDocID : Integer read FservicesObjectRefFinDocID write FservicesObjectRefFinDocID;
    property servicesObjectRefCommentGen : WideString read FservicesObjectRefCommentGen write FservicesObjectRefCommentGen;
    property servicesObjectRefContractNumberServices : WideString read FservicesObjectRefContractNumberServices write FservicesObjectRefContractNumberServices;
    property servicesObjectRefContractDateServices : TXSDate read FservicesObjectRefContractDateServices write FservicesObjectRefContractDateServices;
    property servicesObjectRefContragentName : WideString read FservicesObjectRefContragentName write FservicesObjectRefContragentName;
    property servicesObjectRefContragentAddress : WideString read FservicesObjectRefContragentAddress write FservicesObjectRefContragentAddress;
    property servicesObjectRefContragentAddressWork : WideString read FservicesObjectRefContragentAddressWork write FservicesObjectRefContragentAddressWork;
    property servicesObjectRefContragentOkpo : WideString read FservicesObjectRefContragentOkpo write FservicesObjectRefContragentOkpo;
    property servicesObjectRefContragentBankAccount : WideString read FservicesObjectRefContragentBankAccount write FservicesObjectRefContragentBankAccount;
    property servicesObjectRefContragentBankName : WideString read FservicesObjectRefContragentBankName write FservicesObjectRefContragentBankName;
    property servicesObjectRefContragentBankMfo : WideString read FservicesObjectRefContragentBankMfo write FservicesObjectRefContragentBankMfo;
    property servicesObjectRefContragentBossName : WideString read FservicesObjectRefContragentBossName write FservicesObjectRefContragentBossName;
    property servicesObjectRefContragentPassport : WideString read FservicesObjectRefContragentPassport write FservicesObjectRefContragentPassport;
    property servicesObjectRefContractServicesSumma : TXSDecimal read FservicesObjectRefContractServicesSumma write FservicesObjectRefContractServicesSumma;
    property servicesObjectRefContractServicesPower : TXSDecimal read FservicesObjectRefContractServicesPower write FservicesObjectRefContractServicesPower;
    property servicesObjectRefCommentServicesGen : WideString read FservicesObjectRefCommentServicesGen write FservicesObjectRefCommentServicesGen;
    property servicesObjectRefContractServicesDistance : TXSDecimal read FservicesObjectRefContractServicesDistance write FservicesObjectRefContractServicesDistance;
    property servicesObjectRefContractServicesDay : TXSDecimal read FservicesObjectRefContractServicesDay write FservicesObjectRefContractServicesDay;
    property servicesObjectRefUserGen : WideString read FservicesObjectRefUserGen write FservicesObjectRefUserGen;
    property servicesObjectRefDateEdit : TXSDate read FservicesObjectRefDateEdit write FservicesObjectRefDateEdit;
    property servicesObjectRefWarrantDate : TXSDate read FservicesObjectRefWarrantDate write FservicesObjectRefWarrantDate;
    property servicesObjectRefWarrantNumber : WideString read FservicesObjectRefWarrantNumber write FservicesObjectRefWarrantNumber;
    property servicesObjectRefWarrantFIO : WideString read FservicesObjectRefWarrantFIO write FservicesObjectRefWarrantFIO;
    property servicesObjectRefRegionalType : Integer read FservicesObjectRefRegionalType write FservicesObjectRefRegionalType;
    property servicesObjectRefBasisType : TXSDecimal read FservicesObjectRefBasisType write FservicesObjectRefBasisType;
    property servicesObjectRefContragentPosition : WideString read FservicesObjectRefContragentPosition write FservicesObjectRefContragentPosition;
    property servicesObjectRefExecuteWorkDate : TXSDate read FservicesObjectRefExecuteWorkDate write FservicesObjectRefExecuteWorkDate;
    property servicesObjectRefTimeStart : TXSDateTime read FservicesObjectRefTimeStart write FservicesObjectRefTimeStart;
    property servicesObjectRefTimeFinal : TXSDateTime read FservicesObjectRefTimeFinal write FservicesObjectRefTimeFinal;
    property servicesObjectRefContragentPhoneNumber : WideString read FservicesObjectRefContragentPhoneNumber write FservicesObjectRefContragentPhoneNumber;
    property servicesObjectRefExecutorPhoneNumber : WideString read FservicesObjectRefExecutorPhoneNumber write FservicesObjectRefExecutorPhoneNumber;
    property servicesObjectRefContragentObjectWork : WideString read FservicesObjectRefContragentObjectWork write FservicesObjectRefContragentObjectWork;
    property servicesObjectRefIsNoPay : Integer read FservicesObjectRefIsNoPay write FservicesObjectRefIsNoPay;
    property servicesObjectRefIsCustomerMaterials : Integer read FservicesObjectRefIsCustomerMaterials write FservicesObjectRefIsCustomerMaterials;
    property servicesObjectRefPayDate : TXSDate read FservicesObjectRefPayDate write FservicesObjectRefPayDate;
    property servicesObjectRefFinPayFormCode : Integer read FservicesObjectRefFinPayFormCode write FservicesObjectRefFinPayFormCode;
    property servicesObjectRefFinPayFormName : WideString read FservicesObjectRefFinPayFormName write FservicesObjectRefFinPayFormName;
    property servicesObjectRefPartnerId : Integer read FservicesObjectRefPartnerId write FservicesObjectRefPartnerId;
    property servicesObjectRefPayDetail : WideString read FservicesObjectRefPayDetail write FservicesObjectRefPayDetail;
    property servicesObjectRefActTransferNumber : WideString read FservicesObjectRefActTransferNumber write FservicesObjectRefActTransferNumber;
    property servicesObjectRefActTransferDate : TXSDate read FservicesObjectRefActTransferDate write FservicesObjectRefActTransferDate;
    property servicesObjectRefResposible : WideString read FservicesObjectRefResposible write FservicesObjectRefResposible;
    property servicesObjectRefResposiblePosition : WideString read FservicesObjectRefResposiblePosition write FservicesObjectRefResposiblePosition;
    property servicesObjectRefResposibleTabNumber : WideString read FservicesObjectRefResposibleTabNumber write FservicesObjectRefResposibleTabNumber;
    property servicesObjectRefPrevContractStatus : Integer read FservicesObjectRefPrevContractStatus write FservicesObjectRefPrevContractStatus;
    property servicesObjectRefReconnectionTU : Integer read FservicesObjectRefReconnectionTU write FservicesObjectRefReconnectionTU;
    property servicesObjectRefPersonalAccountCode : Integer read FservicesObjectRefPersonalAccountCode write FservicesObjectRefPersonalAccountCode;
    property servicesObjectRefPersonalAccountNumber : WideString read FservicesObjectRefPersonalAccountNumber write FservicesObjectRefPersonalAccountNumber;
    property servicesObjectRefTabNumber : WideString read FservicesObjectRefTabNumber write FservicesObjectRefTabNumber;
    property servicesObjectRefCitiesList : WideString read FservicesObjectRefCitiesList write FservicesObjectRefCitiesList;
    property servicesObjectRefLineLength : TXSDecimal read FservicesObjectRefLineLength write FservicesObjectRefLineLength;
    property servicesObjectRefProjectCode : WideString read FservicesObjectRefProjectCode write FservicesObjectRefProjectCode;
    property servicesObjectRefCnPackCode : Integer read FservicesObjectRefCnPackCode write FservicesObjectRefCnPackCode;
    property servicesObjectRefDfPackCode : Integer read FservicesObjectRefDfPackCode write FservicesObjectRefDfPackCode;
    property servicesObjectRefCountersZoneType : Integer read FservicesObjectRefCountersZoneType write FservicesObjectRefCountersZoneType;
    property servicesObjectRefAxPartnerCode : WideString read FservicesObjectRefAxPartnerCode write FservicesObjectRefAxPartnerCode;
    property servicesObjectRefAxPartnerName : WideString read FservicesObjectRefAxPartnerName write FservicesObjectRefAxPartnerName;
    property servicesObjectRefAxContractNumber : WideString read FservicesObjectRefAxContractNumber write FservicesObjectRefAxContractNumber;
    property servicesObjectRefAxContractDate : TXSDate read FservicesObjectRefAxContractDate write FservicesObjectRefAxContractDate;
    property servicesObjectRefAxContractCode : WideString read FservicesObjectRefAxContractCode write FservicesObjectRefAxContractCode;
    property servicesObjectRefAxContractId : WideString read FservicesObjectRefAxContractId write FservicesObjectRefAxContractId;
    property servicesObjectRefAxContractCommentGen : WideString read FservicesObjectRefAxContractCommentGen write FservicesObjectRefAxContractCommentGen;
    property agreementWarrantRefCode : Integer read FagreementWarrantRefCode write FagreementWarrantRefCode;
    property agreementWarrantRefNumbergen : WideString read FagreementWarrantRefNumbergen write FagreementWarrantRefNumbergen;
    property agreementWarrantRefName : WideString read FagreementWarrantRefName write FagreementWarrantRefName;
    property agreementWarrantRefWarrantFIO : WideString read FagreementWarrantRefWarrantFIO write FagreementWarrantRefWarrantFIO;
    property agreementWarrantRefWarrantShortFIO : WideString read FagreementWarrantRefWarrantShortFIO write FagreementWarrantRefWarrantShortFIO;
    property agreementWarrantRefWarrantPosition : WideString read FagreementWarrantRefWarrantPosition write FagreementWarrantRefWarrantPosition;
    property agreementWarrantRefGenitiveFIO : WideString read FagreementWarrantRefGenitiveFIO write FagreementWarrantRefGenitiveFIO;
    property agreementWarrantRefGenitivePosition : WideString read FagreementWarrantRefGenitivePosition write FagreementWarrantRefGenitivePosition;
    property agreementWarrantRefPassport : WideString read FagreementWarrantRefPassport write FagreementWarrantRefPassport;
    property agreementWarrantRefAddress : WideString read FagreementWarrantRefAddress write FagreementWarrantRefAddress;
    property agreementWarrantRefPower : Integer read FagreementWarrantRefPower write FagreementWarrantRefPower;
    property agreementWarrantRefMaxSum : TXSDecimal read FagreementWarrantRefMaxSum write FagreementWarrantRefMaxSum;
    property actWarrantRefCode : Integer read FactWarrantRefCode write FactWarrantRefCode;
    property actWarrantRefNumbergen : WideString read FactWarrantRefNumbergen write FactWarrantRefNumbergen;
    property actWarrantRefName : WideString read FactWarrantRefName write FactWarrantRefName;
    property actWarrantRefWarrantFIO : WideString read FactWarrantRefWarrantFIO write FactWarrantRefWarrantFIO;
    property actWarrantRefWarrantShortFIO : WideString read FactWarrantRefWarrantShortFIO write FactWarrantRefWarrantShortFIO;
    property actWarrantRefWarrantPosition : WideString read FactWarrantRefWarrantPosition write FactWarrantRefWarrantPosition;
    property actWarrantRefGenitiveFIO : WideString read FactWarrantRefGenitiveFIO write FactWarrantRefGenitiveFIO;
    property actWarrantRefGenitivePosition : WideString read FactWarrantRefGenitivePosition write FactWarrantRefGenitivePosition;
    property actWarrantRefPassport : WideString read FactWarrantRefPassport write FactWarrantRefPassport;
    property actWarrantRefAddress : WideString read FactWarrantRefAddress write FactWarrantRefAddress;
    property actWarrantRefPower : Integer read FactWarrantRefPower write FactWarrantRefPower;
    property actWarrantRefMaxSum : TXSDecimal read FactWarrantRefMaxSum write FactWarrantRefMaxSum;
    property servicesFromSideRefCode : Integer read FservicesFromSideRefCode write FservicesFromSideRefCode;
    property servicesFromSideRefContractNumber : WideString read FservicesFromSideRefContractNumber write FservicesFromSideRefContractNumber;
    property servicesFromSideRefContractDate : TXSDate read FservicesFromSideRefContractDate write FservicesFromSideRefContractDate;
    property servicesFromSideRefName : WideString read FservicesFromSideRefName write FservicesFromSideRefName;
    property servicesFromSideRefPartnerCode : WideString read FservicesFromSideRefPartnerCode write FservicesFromSideRefPartnerCode;
    property servicesFromSideRefFinDocCode : WideString read FservicesFromSideRefFinDocCode write FservicesFromSideRefFinDocCode;
    property servicesFromSideRefFinDocID : Integer read FservicesFromSideRefFinDocID write FservicesFromSideRefFinDocID;
    property servicesFromSideRefCommentGen : WideString read FservicesFromSideRefCommentGen write FservicesFromSideRefCommentGen;
    property servicesFromSideRefUserGen : WideString read FservicesFromSideRefUserGen write FservicesFromSideRefUserGen;
    property servicesFromSideRefDateEdit : TXSDate read FservicesFromSideRefDateEdit write FservicesFromSideRefDateEdit;
    property techAgrKindRefCode : Integer read FtechAgrKindRefCode write FtechAgrKindRefCode;
    property techAgrKindRefName : WideString read FtechAgrKindRefName write FtechAgrKindRefName;
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

  ArrayOfENTechAgreement2ServicesObjectShort = array of ENTechAgreement2ServicesObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechAgreement2ServicesObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechAgreement2ServicesObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechAgreement2ServicesObjectShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechAgreement2ServicesObjectController/message/
  // soapAction: http://ksoe.org/ENTechAgreement2ServicesObjectController/action/ENTechAgreement2ServicesObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechAgreement2ServicesObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechAgreement2ServicesObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechAgreement2ServicesObjectControllerSoapPort = interface(IInvokable)
  ['{A69C3A41-2F06-454F-ABAC-156ADBA41571}']
    function add(const aENTechAgreement2ServicesObject: ENTechAgreement2ServicesObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechAgreement2ServicesObject: ENTechAgreement2ServicesObject); stdcall;
    function getObject(const anObjectCode: Integer): ENTechAgreement2ServicesObject; stdcall;
    function getList: ENTechAgreement2ServicesObjectShortList; stdcall;
    function getFilteredList(const aENTechAgreement2ServicesObjectFilter: ENTechAgreement2ServicesObjectFilter): ENTechAgreement2ServicesObjectShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechAgreement2ServicesObjectShortList; stdcall;
    function getScrollableFilteredList(const aENTechAgreement2ServicesObjectFilter: ENTechAgreement2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechAgreement2ServicesObjectShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechAgreement2ServicesObjectShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTechAgreement2ServicesObjectFilter: ENTechAgreement2ServicesObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTechAgreement2ServicesObjectShort; stdcall;
  end;


implementation

  destructor ENTechAgreement2ServicesObject.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcostWorks) then
      costWorks.Free;
    if Assigned(FcostWorksNDS) then
      costWorksNDS.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(Farea) then
      area.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FagreementWarrantRef) then
      agreementWarrantRef.Free;
    if Assigned(FactWarrantRef) then
      actWarrantRef.Free;
    if Assigned(FservicesFromSideRef) then
      servicesFromSideRef.Free;
    if Assigned(FtechAgrKindRef) then
      techAgrKindRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTechAgreement2ServicesObjectFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcostWorks) then
      costWorks.Free;
    if Assigned(FcostWorksNDS) then
      costWorksNDS.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(Farea) then
      area.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRef) then
      servicesObjectRef.Free;
    if Assigned(FagreementWarrantRef) then
      agreementWarrantRef.Free;
    if Assigned(FactWarrantRef) then
      actWarrantRef.Free;
    if Assigned(FservicesFromSideRef) then
      servicesFromSideRef.Free;
    if Assigned(FtechAgrKindRef) then
      techAgrKindRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTechAgreement2ServicesObjectFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTechAgreement2ServicesObjectShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FcostWorks) then
      costWorks.Free;
    if Assigned(FcostWorksNDS) then
      costWorksNDS.Free;
    if Assigned(FactDate) then
      actDate.Free;
    if Assigned(Farea) then
      area.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FservicesObjectRefContractDate) then
      servicesObjectRefContractDate.Free;
    if Assigned(FservicesObjectRefContractDateServices) then
      servicesObjectRefContractDateServices.Free;
    if Assigned(FservicesObjectRefContractServicesSumma) then
      servicesObjectRefContractServicesSumma.Free;
    if Assigned(FservicesObjectRefContractServicesPower) then
      servicesObjectRefContractServicesPower.Free;
    if Assigned(FservicesObjectRefContractServicesDistance) then
      servicesObjectRefContractServicesDistance.Free;
    if Assigned(FservicesObjectRefContractServicesDay) then
      servicesObjectRefContractServicesDay.Free;
    if Assigned(FservicesObjectRefDateEdit) then
      servicesObjectRefDateEdit.Free;
    if Assigned(FservicesObjectRefWarrantDate) then
      servicesObjectRefWarrantDate.Free;
    if Assigned(FservicesObjectRefBasisType) then
      servicesObjectRefBasisType.Free;
    if Assigned(FservicesObjectRefExecuteWorkDate) then
      servicesObjectRefExecuteWorkDate.Free;
    if Assigned(FservicesObjectRefTimeStart) then
      servicesObjectRefTimeStart.Free;
    if Assigned(FservicesObjectRefTimeFinal) then
      servicesObjectRefTimeFinal.Free;
    if Assigned(FservicesObjectRefPayDate) then
      servicesObjectRefPayDate.Free;
    if Assigned(FservicesObjectRefActTransferDate) then
      servicesObjectRefActTransferDate.Free;
    if Assigned(FservicesObjectRefLineLength) then
      servicesObjectRefLineLength.Free;
    if Assigned(FservicesObjectRefAxContractDate) then
      servicesObjectRefAxContractDate.Free;
    if Assigned(FagreementWarrantRefMaxSum) then
      agreementWarrantRefMaxSum.Free;
    if Assigned(FactWarrantRefMaxSum) then
      actWarrantRefMaxSum.Free;
    if Assigned(FservicesFromSideRefContractDate) then
      servicesFromSideRefContractDate.Free;
    if Assigned(FservicesFromSideRefDateEdit) then
      servicesFromSideRefDateEdit.Free;
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

  destructor ENTechAgreement2ServicesObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechAgreement2ServicesObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgreement2ServicesObject');
  RemClassRegistry.RegisterXSClass(ENTechAgreement2ServicesObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgreement2ServicesObjectRef');
  RemClassRegistry.RegisterXSClass(ENTechAgreement2ServicesObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgreement2ServicesObjectFilter');
  RemClassRegistry.RegisterXSClass(ENTechAgreement2ServicesObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgreement2ServicesObjectShort');
  RemClassRegistry.RegisterXSClass(ENTechAgreement2ServicesObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechAgreement2ServicesObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechAgreement2ServicesObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechAgreement2ServicesObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechAgreement2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENTechAgreement2ServicesObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechAgreement2ServicesObjectControllerSoapPort), 'http://ksoe.org/ENTechAgreement2ServicesObjectController/action/ENTechAgreement2ServicesObjectController.%operationName%');


end.
