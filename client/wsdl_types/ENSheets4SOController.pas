unit ENSheets4SOController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSheets4SOTypeController
   ,ENDocAttachmentController
   ,ENServicesObjectController
   ,ENSheets4SOItemsTemplateController
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

  ENSheets4SO            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }
  ENSheets4SOItems            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }


  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SORef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SO = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FdateGen : TXSDate;
    Fdayscnt : Integer;
    FnextSheetDate : TXSDate;
    FisLast : Integer;
    Frecipient : WideString;
    FrecipientAddress : WideString;
    FpostCode : WideString;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FadditionalText : WideString;
    FisWithSignature : Integer;
    Fcommentgen : WideString;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    FwfPackCode : Integer;
//???
    Fsheet4sotype : ENSheets4SOTypeRef;
//???
    Fattachment : ENDocAttachmentRef;
//???
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dayscnt : Integer read Fdayscnt write Fdayscnt;
    property nextSheetDate : TXSDate read FnextSheetDate write FnextSheetDate;
    property isLast : Integer read FisLast write FisLast;
    property recipient : WideString read Frecipient write Frecipient;
    property recipientAddress : WideString read FrecipientAddress write FrecipientAddress;
    property postCode : WideString read FpostCode write FpostCode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property additionalText : WideString read FadditionalText write FadditionalText;
    property isWithSignature : Integer read FisWithSignature write FisWithSignature;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property wfPackCode : Integer read FwfPackCode write FwfPackCode;
    property sheet4sotype : ENSheets4SOTypeRef read Fsheet4sotype write Fsheet4sotype;
    property attachment : ENDocAttachmentRef read Fattachment write Fattachment;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;

{
  ENSheets4SOFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FdateGen : TXSDate;
    Fdayscnt : Integer;
    FnextSheetDate : TXSDate;
    FisLast : Integer;
    Frecipient : WideString;
    FrecipientAddress : WideString;
    FpostCode : WideString;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FadditionalText : WideString;
    FisWithSignature : Integer;
    Fcommentgen : WideString;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fsheet4sotype : ENSheets4SOTypeRef;
//???
    Fattachment : ENDocAttachmentRef;
//???
    Fservicesobject : ENServicesObjectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dayscnt : Integer read Fdayscnt write Fdayscnt;
    property nextSheetDate : TXSDate read FnextSheetDate write FnextSheetDate;
    property isLast : Integer read FisLast write FisLast;
    property recipient : WideString read Frecipient write Frecipient;
    property recipientAddress : WideString read FrecipientAddress write FrecipientAddress;
    property postCode : WideString read FpostCode write FpostCode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property additionalText : WideString read FadditionalText write FadditionalText;
    property isWithSignature : Integer read FisWithSignature write FisWithSignature;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property sheet4sotype : ENSheets4SOTypeRef read Fsheet4sotype write Fsheet4sotype;
    property attachment : ENDocAttachmentRef read Fattachment write Fattachment;
    property servicesobject : ENServicesObjectRef read Fservicesobject write Fservicesobject;
  end;
}

  ENSheets4SOFilter = class(ENSheets4SO)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSheets4SOShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fname : WideString;
    FdateGen : TXSDate;
    Fdayscnt : Integer;
    FnextSheetDate : TXSDate;
    FisLast : Integer;
    Frecipient : WideString;
    FrecipientAddress : WideString;
    FpostCode : WideString;
    FsignerPosition : WideString;
    FsignerFio : WideString;
    FexecutorFio : WideString;
    FexecutorPhone : WideString;
    FexecutorEmail : WideString;
    FadditionalText : WideString;
    FisWithSignature : Integer;
    Fcommentgen : WideString;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FwfPackCode : Integer;
    Fsheet4sotypeCode : Integer;
    Fsheet4sotypeName : WideString;
    Fsheet4sotypeNameForDfDoc : WideString;
    Fsheet4sotypeDfDocNumMask : WideString;
    Fsheet4sotypeDfDepartmentCode : Integer;
    Fsheet4sotypeExecutorFio : WideString;
    Fsheet4sotypeExecutorPhone : WideString;
    Fsheet4sotypeExecutorEmail : WideString;
    Fsheet4sotypeReportPath : WideString;
    Fsheet4sotypeReportFileName : WideString;
    Fsheet4sotypeReportType : WideString;
    Fsheet4sotypeCommentGen : WideString;
    FattachmentCode : Integer;
    FattachmentCommentGen : WideString;
    FattachmentFileLink : WideString;
    FattachmentFilesize : Int64;
    FattachmentUserAdd : WideString;
    FattachmentDateAdd : TXSDateTime;
    FattachmentUserGen : WideString;
    FattachmentDateEdit : TXSDateTime;
    FservicesobjectCode : Integer;
    FservicesobjectContractNumber : WideString;
    FservicesobjectContractDate : TXSDate;
    FservicesobjectName : WideString;
    FservicesobjectPartnerCode : WideString;
    FservicesobjectFinDocCode : WideString;
    FservicesobjectFinDocID : Integer;
    FservicesobjectCommentGen : WideString;
    FservicesobjectContractNumberServices : WideString;
    FservicesobjectContractDateServices : TXSDate;
    FservicesobjectContragentName : WideString;
    FservicesobjectContragentAddress : WideString;
    FservicesobjectContragentAddressWork : WideString;
    FservicesobjectContragentOkpo : WideString;
    FservicesobjectContragentBankAccount : WideString;
    FservicesobjectContragentBankName : WideString;
    FservicesobjectContragentBankMfo : WideString;
    FservicesobjectContragentBossName : WideString;
    FservicesobjectContragentPassport : WideString;
    FservicesobjectContractServicesSumma : TXSDecimal;
    FservicesobjectContractServicesSummaVAT : TXSDecimal;
    FservicesobjectContractServicesPower : TXSDecimal;
    FservicesobjectCommentServicesGen : WideString;
    FservicesobjectContractServicesDistance : TXSDecimal;
    FservicesobjectContractServicesDay : TXSDecimal;
    FservicesobjectUserGen : WideString;
    FservicesobjectDateEdit : TXSDate;
    FservicesobjectWarrantDate : TXSDate;
    FservicesobjectWarrantNumber : WideString;
    FservicesobjectWarrantFIO : WideString;
    FservicesobjectRegionalType : Integer;
    FservicesobjectBasisType : TXSDecimal;
    FservicesobjectContragentPosition : WideString;
    FservicesobjectExecuteWorkDate : TXSDate;
    FservicesobjectTimeStart : TXSDateTime;
    FservicesobjectTimeFinal : TXSDateTime;
    FservicesobjectContragentPhoneNumber : WideString;
    FservicesobjectExecutorPhoneNumber : WideString;
    FservicesobjectContragentObjectWork : WideString;
    FservicesobjectIsNoPay : Integer;
    FservicesobjectIsCustomerMaterials : Integer;
    FservicesobjectPayDate : TXSDate;
    FservicesobjectFinPayFormCode : Integer;
    FservicesobjectFinPayFormName : WideString;
    FservicesobjectPartnerId : Integer;
    FservicesobjectPayDetail : WideString;
    FservicesobjectActTransferNumber : WideString;
    FservicesobjectActTransferDate : TXSDate;
    FservicesobjectResposible : WideString;
    FservicesobjectResposiblePosition : WideString;
    FservicesobjectResposibleTabNumber : WideString;
    FservicesobjectPrevContractStatus : Integer;
    FservicesobjectReconnectionTU : Integer;
    FservicesobjectPersonalAccountCode : Integer;
    FservicesobjectPersonalAccountNumber : WideString;
    FservicesobjectTabNumber : WideString;
    FservicesobjectCitiesList : WideString;
    FservicesobjectLineLength : TXSDecimal;
    FservicesobjectProjectCode : WideString;
    FservicesobjectCnPackCode : Integer;
    FservicesobjectDfPackCode : Integer;
    FservicesobjectCountersZoneType : Integer;
    FservicesobjectAxPartnerCode : WideString;
    FservicesobjectAxPartnerName : WideString;
    FservicesobjectAxContractNumber : WideString;
    FservicesobjectAxContractDate : TXSDate;
    FservicesobjectAxContractCode : WideString;
    FservicesobjectAxContractId : WideString;
    FservicesobjectAxContractCommentGen : WideString;
    FservicesobjectProjAgreeSumma : TXSDecimal;
    FservicesobjectTopographySumma : TXSDecimal;
    FservicesobjectCreatedFromSite : Integer;
    FservicesobjectTerm : Integer;
    FservicesobjectRegulation : Integer;
    FservicesobjectBoundaryDateWork : TXSDate;
    FservicesobjectCountDayDelay : Integer;
    FservicesobjectFactDateWork : TXSDate;
    FservicesobjectCodeEIC : WideString;
    FservicesobjectPersonalAccountUid : WideString;
    FservicesobjectCustomerMailingAddress : WideString;
    FservicesobjectPowerGeneration : TXSDecimal;
    FservicesobjectPostCode : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  dayscnt : Integer read Fdayscnt write Fdayscnt;
    property nextSheetDate : TXSDate read FnextSheetDate write FnextSheetDate;
    property  isLast : Integer read FisLast write FisLast;
    property recipient : WideString read Frecipient write Frecipient;
    property recipientAddress : WideString read FrecipientAddress write FrecipientAddress;
    property postCode : WideString read FpostCode write FpostCode;
    property signerPosition : WideString read FsignerPosition write FsignerPosition;
    property signerFio : WideString read FsignerFio write FsignerFio;
    property executorFio : WideString read FexecutorFio write FexecutorFio;
    property executorPhone : WideString read FexecutorPhone write FexecutorPhone;
    property executorEmail : WideString read FexecutorEmail write FexecutorEmail;
    property additionalText : WideString read FadditionalText write FadditionalText;
    property  isWithSignature : Integer read FisWithSignature write FisWithSignature;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property  dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property  dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property  wfPackCode : Integer read FwfPackCode write FwfPackCode;

    property sheet4sotypeCode : Integer read Fsheet4sotypeCode write Fsheet4sotypeCode;
    property sheet4sotypeName : WideString read Fsheet4sotypeName write Fsheet4sotypeName;
    property sheet4sotypeNameForDfDoc : WideString read Fsheet4sotypeNameForDfDoc write Fsheet4sotypeNameForDfDoc;
    property sheet4sotypeDfDocNumMask : WideString read Fsheet4sotypeDfDocNumMask write Fsheet4sotypeDfDocNumMask;
    property sheet4sotypeDfDepartmentCode : Integer read Fsheet4sotypeDfDepartmentCode write Fsheet4sotypeDfDepartmentCode;
    property sheet4sotypeExecutorFio : WideString read Fsheet4sotypeExecutorFio write Fsheet4sotypeExecutorFio;
    property sheet4sotypeExecutorPhone : WideString read Fsheet4sotypeExecutorPhone write Fsheet4sotypeExecutorPhone;
    property sheet4sotypeExecutorEmail : WideString read Fsheet4sotypeExecutorEmail write Fsheet4sotypeExecutorEmail;
    property sheet4sotypeReportPath : WideString read Fsheet4sotypeReportPath write Fsheet4sotypeReportPath;
    property sheet4sotypeReportFileName : WideString read Fsheet4sotypeReportFileName write Fsheet4sotypeReportFileName;
    property sheet4sotypeReportType : WideString read Fsheet4sotypeReportType write Fsheet4sotypeReportType;
    property sheet4sotypeCommentGen : WideString read Fsheet4sotypeCommentGen write Fsheet4sotypeCommentGen;
    property attachmentCode : Integer read FattachmentCode write FattachmentCode;
    property attachmentCommentGen : WideString read FattachmentCommentGen write FattachmentCommentGen;
    property attachmentFileLink : WideString read FattachmentFileLink write FattachmentFileLink;
    property attachmentFilesize : Int64 read FattachmentFilesize write FattachmentFilesize;
    property attachmentUserAdd : WideString read FattachmentUserAdd write FattachmentUserAdd;
    property attachmentDateAdd : TXSDateTime read FattachmentDateAdd write FattachmentDateAdd;
    property attachmentUserGen : WideString read FattachmentUserGen write FattachmentUserGen;
    property attachmentDateEdit : TXSDateTime read FattachmentDateEdit write FattachmentDateEdit;
    property servicesobjectCode : Integer read FservicesobjectCode write FservicesobjectCode;
    property servicesobjectContractNumber : WideString read FservicesobjectContractNumber write FservicesobjectContractNumber;
    property servicesobjectContractDate : TXSDate read FservicesobjectContractDate write FservicesobjectContractDate;
    property servicesobjectName : WideString read FservicesobjectName write FservicesobjectName;
    property servicesobjectPartnerCode : WideString read FservicesobjectPartnerCode write FservicesobjectPartnerCode;
    property servicesobjectFinDocCode : WideString read FservicesobjectFinDocCode write FservicesobjectFinDocCode;
    property servicesobjectFinDocID : Integer read FservicesobjectFinDocID write FservicesobjectFinDocID;
    property servicesobjectCommentGen : WideString read FservicesobjectCommentGen write FservicesobjectCommentGen;
    property servicesobjectContractNumberServices : WideString read FservicesobjectContractNumberServices write FservicesobjectContractNumberServices;
    property servicesobjectContractDateServices : TXSDate read FservicesobjectContractDateServices write FservicesobjectContractDateServices;
    property servicesobjectContragentName : WideString read FservicesobjectContragentName write FservicesobjectContragentName;
    property servicesobjectContragentAddress : WideString read FservicesobjectContragentAddress write FservicesobjectContragentAddress;
    property servicesobjectContragentAddressWork : WideString read FservicesobjectContragentAddressWork write FservicesobjectContragentAddressWork;
    property servicesobjectContragentOkpo : WideString read FservicesobjectContragentOkpo write FservicesobjectContragentOkpo;
    property servicesobjectContragentBankAccount : WideString read FservicesobjectContragentBankAccount write FservicesobjectContragentBankAccount;
    property servicesobjectContragentBankName : WideString read FservicesobjectContragentBankName write FservicesobjectContragentBankName;
    property servicesobjectContragentBankMfo : WideString read FservicesobjectContragentBankMfo write FservicesobjectContragentBankMfo;
    property servicesobjectContragentBossName : WideString read FservicesobjectContragentBossName write FservicesobjectContragentBossName;
    property servicesobjectContragentPassport : WideString read FservicesobjectContragentPassport write FservicesobjectContragentPassport;
    property servicesobjectContractServicesSumma : TXSDecimal read FservicesobjectContractServicesSumma write FservicesobjectContractServicesSumma;
    property servicesobjectContractServicesSummaVAT : TXSDecimal read FservicesobjectContractServicesSummaVAT write FservicesobjectContractServicesSummaVAT;
    property servicesobjectContractServicesPower : TXSDecimal read FservicesobjectContractServicesPower write FservicesobjectContractServicesPower;
    property servicesobjectCommentServicesGen : WideString read FservicesobjectCommentServicesGen write FservicesobjectCommentServicesGen;
    property servicesobjectContractServicesDistance : TXSDecimal read FservicesobjectContractServicesDistance write FservicesobjectContractServicesDistance;
    property servicesobjectContractServicesDay : TXSDecimal read FservicesobjectContractServicesDay write FservicesobjectContractServicesDay;
    property servicesobjectUserGen : WideString read FservicesobjectUserGen write FservicesobjectUserGen;
    property servicesobjectDateEdit : TXSDate read FservicesobjectDateEdit write FservicesobjectDateEdit;
    property servicesobjectWarrantDate : TXSDate read FservicesobjectWarrantDate write FservicesobjectWarrantDate;
    property servicesobjectWarrantNumber : WideString read FservicesobjectWarrantNumber write FservicesobjectWarrantNumber;
    property servicesobjectWarrantFIO : WideString read FservicesobjectWarrantFIO write FservicesobjectWarrantFIO;
    property servicesobjectRegionalType : Integer read FservicesobjectRegionalType write FservicesobjectRegionalType;
    property servicesobjectBasisType : TXSDecimal read FservicesobjectBasisType write FservicesobjectBasisType;
    property servicesobjectContragentPosition : WideString read FservicesobjectContragentPosition write FservicesobjectContragentPosition;
    property servicesobjectExecuteWorkDate : TXSDate read FservicesobjectExecuteWorkDate write FservicesobjectExecuteWorkDate;
    property servicesobjectTimeStart : TXSDateTime read FservicesobjectTimeStart write FservicesobjectTimeStart;
    property servicesobjectTimeFinal : TXSDateTime read FservicesobjectTimeFinal write FservicesobjectTimeFinal;
    property servicesobjectContragentPhoneNumber : WideString read FservicesobjectContragentPhoneNumber write FservicesobjectContragentPhoneNumber;
    property servicesobjectExecutorPhoneNumber : WideString read FservicesobjectExecutorPhoneNumber write FservicesobjectExecutorPhoneNumber;
    property servicesobjectContragentObjectWork : WideString read FservicesobjectContragentObjectWork write FservicesobjectContragentObjectWork;
    property servicesobjectIsNoPay : Integer read FservicesobjectIsNoPay write FservicesobjectIsNoPay;
    property servicesobjectIsCustomerMaterials : Integer read FservicesobjectIsCustomerMaterials write FservicesobjectIsCustomerMaterials;
    property servicesobjectPayDate : TXSDate read FservicesobjectPayDate write FservicesobjectPayDate;
    property servicesobjectFinPayFormCode : Integer read FservicesobjectFinPayFormCode write FservicesobjectFinPayFormCode;
    property servicesobjectFinPayFormName : WideString read FservicesobjectFinPayFormName write FservicesobjectFinPayFormName;
    property servicesobjectPartnerId : Integer read FservicesobjectPartnerId write FservicesobjectPartnerId;
    property servicesobjectPayDetail : WideString read FservicesobjectPayDetail write FservicesobjectPayDetail;
    property servicesobjectActTransferNumber : WideString read FservicesobjectActTransferNumber write FservicesobjectActTransferNumber;
    property servicesobjectActTransferDate : TXSDate read FservicesobjectActTransferDate write FservicesobjectActTransferDate;
    property servicesobjectResposible : WideString read FservicesobjectResposible write FservicesobjectResposible;
    property servicesobjectResposiblePosition : WideString read FservicesobjectResposiblePosition write FservicesobjectResposiblePosition;
    property servicesobjectResposibleTabNumber : WideString read FservicesobjectResposibleTabNumber write FservicesobjectResposibleTabNumber;
    property servicesobjectPrevContractStatus : Integer read FservicesobjectPrevContractStatus write FservicesobjectPrevContractStatus;
    property servicesobjectReconnectionTU : Integer read FservicesobjectReconnectionTU write FservicesobjectReconnectionTU;
    property servicesobjectPersonalAccountCode : Integer read FservicesobjectPersonalAccountCode write FservicesobjectPersonalAccountCode;
    property servicesobjectPersonalAccountNumber : WideString read FservicesobjectPersonalAccountNumber write FservicesobjectPersonalAccountNumber;
    property servicesobjectTabNumber : WideString read FservicesobjectTabNumber write FservicesobjectTabNumber;
    property servicesobjectCitiesList : WideString read FservicesobjectCitiesList write FservicesobjectCitiesList;
    property servicesobjectLineLength : TXSDecimal read FservicesobjectLineLength write FservicesobjectLineLength;
    property servicesobjectProjectCode : WideString read FservicesobjectProjectCode write FservicesobjectProjectCode;
    property servicesobjectCnPackCode : Integer read FservicesobjectCnPackCode write FservicesobjectCnPackCode;
    property servicesobjectDfPackCode : Integer read FservicesobjectDfPackCode write FservicesobjectDfPackCode;
    property servicesobjectCountersZoneType : Integer read FservicesobjectCountersZoneType write FservicesobjectCountersZoneType;
    property servicesobjectAxPartnerCode : WideString read FservicesobjectAxPartnerCode write FservicesobjectAxPartnerCode;
    property servicesobjectAxPartnerName : WideString read FservicesobjectAxPartnerName write FservicesobjectAxPartnerName;
    property servicesobjectAxContractNumber : WideString read FservicesobjectAxContractNumber write FservicesobjectAxContractNumber;
    property servicesobjectAxContractDate : TXSDate read FservicesobjectAxContractDate write FservicesobjectAxContractDate;
    property servicesobjectAxContractCode : WideString read FservicesobjectAxContractCode write FservicesobjectAxContractCode;
    property servicesobjectAxContractId : WideString read FservicesobjectAxContractId write FservicesobjectAxContractId;
    property servicesobjectAxContractCommentGen : WideString read FservicesobjectAxContractCommentGen write FservicesobjectAxContractCommentGen;
    property servicesobjectProjAgreeSumma : TXSDecimal read FservicesobjectProjAgreeSumma write FservicesobjectProjAgreeSumma;
    property servicesobjectTopographySumma : TXSDecimal read FservicesobjectTopographySumma write FservicesobjectTopographySumma;
    property servicesobjectCreatedFromSite : Integer read FservicesobjectCreatedFromSite write FservicesobjectCreatedFromSite;
    property servicesobjectTerm : Integer read FservicesobjectTerm write FservicesobjectTerm;
    property servicesobjectRegulation : Integer read FservicesobjectRegulation write FservicesobjectRegulation;
    property servicesobjectBoundaryDateWork : TXSDate read FservicesobjectBoundaryDateWork write FservicesobjectBoundaryDateWork;
    property servicesobjectCountDayDelay : Integer read FservicesobjectCountDayDelay write FservicesobjectCountDayDelay;
    property servicesobjectFactDateWork : TXSDate read FservicesobjectFactDateWork write FservicesobjectFactDateWork;
    property servicesobjectCodeEIC : WideString read FservicesobjectCodeEIC write FservicesobjectCodeEIC;
    property servicesobjectPersonalAccountUid : WideString read FservicesobjectPersonalAccountUid write FservicesobjectPersonalAccountUid;
    property servicesobjectCustomerMailingAddress : WideString read FservicesobjectCustomerMailingAddress write FservicesobjectCustomerMailingAddress;
    property servicesobjectPowerGeneration : TXSDecimal read FservicesobjectPowerGeneration write FservicesobjectPowerGeneration;
    property servicesobjectPostCode : WideString read FservicesobjectPostCode write FservicesobjectPostCode;
  end;

  ENSheets4SOItems = class(TRemotable)
  private
    Fcode : Integer;
    FcontentValue : WideString;
    FadditionalContent : WideString;
//???
    Fsheet4soRef : ENSheets4SORef;
//???
    FsheetItemTemplateRef : ENSheets4SOItemsTemplateRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property contentValue : WideString read FcontentValue write FcontentValue;
    property additionalContent : WideString read FadditionalContent write FadditionalContent;
    property sheet4soRef : ENSheets4SORef read Fsheet4soRef write Fsheet4soRef;
    property sheetItemTemplateRef : ENSheets4SOItemsTemplateRef read FsheetItemTemplateRef write FsheetItemTemplateRef;
  end;

  ArrayOfENSheets4SOShort = array of ENSheets4SOShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfENSheets4SOItems = array of ENSheets4SOItems;

  ENSheets4SOShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSheets4SOShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSheets4SOShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSheets4SOItemsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  ENSheets4SOItemsFilter = class(ENSheets4SOItems)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSheets4SOItemsShort = class(TRemotable)
  private
    Fcode : Integer;
    FcontentValue : WideString;
    FadditionalContent : WideString;
    Fsheet4soRefCode : Integer;
    Fsheet4soRefNumbergen : WideString;
    Fsheet4soRefName : WideString;
    Fsheet4soRefDateGen : TXSDate;
    Fsheet4soRefDayscnt : Integer;
    Fsheet4soRefNextSheetDate : TXSDate;
    Fsheet4soRefIsLast : Integer;
    Fsheet4soRefRecipient : WideString;
    Fsheet4soRefRecipientAddress : WideString;
    Fsheet4soRefSignerPosition : WideString;
    Fsheet4soRefSignerFio : WideString;
    Fsheet4soRefExecutorFio : WideString;
    Fsheet4soRefExecutorPhone : WideString;
    Fsheet4soRefExecutorEmail : WideString;
    Fsheet4soRefAdditionalText : WideString;
    Fsheet4soRefIsWithSignature : Integer;
    Fsheet4soRefCommentgen : WideString;
    Fsheet4soRefDfDocCode : Integer;
    Fsheet4soRefDfDocTypeCode : Integer;
    Fsheet4soRefDfDocNumber : WideString;
    Fsheet4soRefDfDocDate : TXSDate;
    Fsheet4soRefUserGen : WideString;
    Fsheet4soRefDateEdit : TXSDate;
    Fsheet4soRefWfPackCode : Integer;
    FsheetItemTemplateRefCode : Integer;
    FsheetItemTemplateRefName : WideString;
    FsheetItemTemplateRefTemplateValue : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property contentValue : WideString read FcontentValue write FcontentValue;
    property additionalContent : WideString read FadditionalContent write FadditionalContent;

    property sheet4soRefCode : Integer read Fsheet4soRefCode write Fsheet4soRefCode;
    property sheet4soRefNumbergen : WideString read Fsheet4soRefNumbergen write Fsheet4soRefNumbergen;
    property sheet4soRefName : WideString read Fsheet4soRefName write Fsheet4soRefName;
    property sheet4soRefDateGen : TXSDate read Fsheet4soRefDateGen write Fsheet4soRefDateGen;
    property sheet4soRefDayscnt : Integer read Fsheet4soRefDayscnt write Fsheet4soRefDayscnt;
    property sheet4soRefNextSheetDate : TXSDate read Fsheet4soRefNextSheetDate write Fsheet4soRefNextSheetDate;
    property sheet4soRefIsLast : Integer read Fsheet4soRefIsLast write Fsheet4soRefIsLast;
    property sheet4soRefRecipient : WideString read Fsheet4soRefRecipient write Fsheet4soRefRecipient;
    property sheet4soRefRecipientAddress : WideString read Fsheet4soRefRecipientAddress write Fsheet4soRefRecipientAddress;
    property sheet4soRefSignerPosition : WideString read Fsheet4soRefSignerPosition write Fsheet4soRefSignerPosition;
    property sheet4soRefSignerFio : WideString read Fsheet4soRefSignerFio write Fsheet4soRefSignerFio;
    property sheet4soRefExecutorFio : WideString read Fsheet4soRefExecutorFio write Fsheet4soRefExecutorFio;
    property sheet4soRefExecutorPhone : WideString read Fsheet4soRefExecutorPhone write Fsheet4soRefExecutorPhone;
    property sheet4soRefExecutorEmail : WideString read Fsheet4soRefExecutorEmail write Fsheet4soRefExecutorEmail;
    property sheet4soRefAdditionalText : WideString read Fsheet4soRefAdditionalText write Fsheet4soRefAdditionalText;
    property sheet4soRefIsWithSignature : Integer read Fsheet4soRefIsWithSignature write Fsheet4soRefIsWithSignature;
    property sheet4soRefCommentgen : WideString read Fsheet4soRefCommentgen write Fsheet4soRefCommentgen;
    property sheet4soRefDfDocCode : Integer read Fsheet4soRefDfDocCode write Fsheet4soRefDfDocCode;
    property sheet4soRefDfDocTypeCode : Integer read Fsheet4soRefDfDocTypeCode write Fsheet4soRefDfDocTypeCode;
    property sheet4soRefDfDocNumber : WideString read Fsheet4soRefDfDocNumber write Fsheet4soRefDfDocNumber;
    property sheet4soRefDfDocDate : TXSDate read Fsheet4soRefDfDocDate write Fsheet4soRefDfDocDate;
    property sheet4soRefUserGen : WideString read Fsheet4soRefUserGen write Fsheet4soRefUserGen;
    property sheet4soRefDateEdit : TXSDate read Fsheet4soRefDateEdit write Fsheet4soRefDateEdit;
    property sheet4soRefWfPackCode : Integer read Fsheet4soRefWfPackCode write Fsheet4soRefWfPackCode;
    property sheetItemTemplateRefCode : Integer read FsheetItemTemplateRefCode write FsheetItemTemplateRefCode;
    property sheetItemTemplateRefName : WideString read FsheetItemTemplateRefName write FsheetItemTemplateRefName;
    property sheetItemTemplateRefTemplateValue : WideString read FsheetItemTemplateRefTemplateValue write FsheetItemTemplateRefTemplateValue;
  end;

  ArrayOfENSheets4SOItemsShort = array of ENSheets4SOItemsShort; // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSheets4SOItemsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSheets4SOItemsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSheets4SOItemsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSheets4SOController/message/
  // soapAction: http://ksoe.org/ENSheets4SOController/action/ENSheets4SOController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSheets4SOControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSheets4SOController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSheets4SOControllerSoapPort = interface(IInvokable)
  ['{76F7B237-171D-494A-A942-A8B93AB8B347}']
    procedure regenerateENSheets4SO(const aENSheets4SOCode: Integer); stdcall;
    function add(const aENSheets4SO: ENSheets4SO): Integer; stdcall; overload;
    function add(const aENSheets4SO: ENSheets4SO; const items: ArrayOfENSheets4SOItems): Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSheets4SO: ENSheets4SO); stdcall;
    function getObject(const anObjectCode: Integer): ENSheets4SO; stdcall;
    function getList: ENSheets4SOShortList; stdcall;
    function getFilteredList(const aENSheets4SOFilter: ENSheets4SOFilter): ENSheets4SOShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOShortList; stdcall;
    function getScrollableFilteredList(const aENSheets4SOFilter: ENSheets4SOFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSheets4SOFilter: ENSheets4SOFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSheets4SOShort; stdcall;
    function generateNextLandSheets(): Integer; overload; stdcall;
    function generateNextLandSheets(generationDate: TXSDate): Integer; overload; stdcall;
    function generateNextLandSheetsForToday(): Integer; stdcall;
    end;

  ENSheets4SOItemsControllerSoapPort = interface(IInvokable)
  ['{A1F25C12-C879-4D5F-9173-E7549DA9AAB9}']
    function add(const aENSheets4SOItems: ENSheets4SOItems): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSheets4SOItems: ENSheets4SOItems); stdcall;
    function getObject(const anObjectCode: Integer): ENSheets4SOItems; stdcall;
    function getList: ENSheets4SOItemsShortList; stdcall;
    function getFilteredList(const aENSheets4SOItemsFilter: ENSheets4SOItemsFilter): ENSheets4SOItemsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsShortList; stdcall;
    function getScrollableFilteredList(const aENSheets4SOItemsFilter: ENSheets4SOItemsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSheets4SOItemsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSheets4SOItemsFilter: ENSheets4SOItemsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSheets4SOItemsShort; stdcall;
  end;


implementation


  destructor ENSheets4SO.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FnextSheetDate) then
      nextSheetDate.Free;
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fsheet4sotype) then
      sheet4sotype.Free;
    if Assigned(Fattachment) then
      attachment.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;

{
  destructor ENSheets4SOFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FnextSheetDate) then
      nextSheetDate.Free;
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fsheet4sotype) then
      sheet4sotype.Free;
    if Assigned(Fattachment) then
      attachment.Free;
    if Assigned(Fservicesobject) then
      servicesobject.Free;
    inherited Destroy;
  end;
}

  destructor ENSheets4SOFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSheets4SOShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FnextSheetDate) then
      nextSheetDate.Free;
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FattachmentDateAdd) then
      attachmentDateAdd.Free;
    if Assigned(FattachmentDateEdit) then
      attachmentDateEdit.Free;
    if Assigned(FservicesobjectContractDate) then
      servicesobjectContractDate.Free;
    if Assigned(FservicesobjectContractDateServices) then
      servicesobjectContractDateServices.Free;
    if Assigned(FservicesobjectContractServicesSumma) then
      servicesobjectContractServicesSumma.Free;
    if Assigned(FservicesobjectContractServicesSummaVAT) then
      servicesobjectContractServicesSummaVAT.Free;
    if Assigned(FservicesobjectContractServicesPower) then
      servicesobjectContractServicesPower.Free;
    if Assigned(FservicesobjectContractServicesDistance) then
      servicesobjectContractServicesDistance.Free;
    if Assigned(FservicesobjectContractServicesDay) then
      servicesobjectContractServicesDay.Free;
    if Assigned(FservicesobjectDateEdit) then
      servicesobjectDateEdit.Free;
    if Assigned(FservicesobjectWarrantDate) then
      servicesobjectWarrantDate.Free;
    if Assigned(FservicesobjectBasisType) then
      servicesobjectBasisType.Free;
    if Assigned(FservicesobjectExecuteWorkDate) then
      servicesobjectExecuteWorkDate.Free;
    if Assigned(FservicesobjectTimeStart) then
      servicesobjectTimeStart.Free;
    if Assigned(FservicesobjectTimeFinal) then
      servicesobjectTimeFinal.Free;
    if Assigned(FservicesobjectPayDate) then
      servicesobjectPayDate.Free;
    if Assigned(FservicesobjectActTransferDate) then
      servicesobjectActTransferDate.Free;
    if Assigned(FservicesobjectLineLength) then
      servicesobjectLineLength.Free;
    if Assigned(FservicesobjectAxContractDate) then
      servicesobjectAxContractDate.Free;
    if Assigned(FservicesobjectProjAgreeSumma) then
      servicesobjectProjAgreeSumma.Free;
    if Assigned(FservicesobjectTopographySumma) then
      servicesobjectTopographySumma.Free;
    if Assigned(FservicesobjectBoundaryDateWork) then
      servicesobjectBoundaryDateWork.Free;
    if Assigned(FservicesobjectFactDateWork) then
      servicesobjectFactDateWork.Free;
    if Assigned(FservicesobjectPowerGeneration) then
      servicesobjectPowerGeneration.Free;
    inherited Destroy;
  end;

  destructor ENSheets4SOShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor ENSheets4SOItems.Destroy;
  begin
    if Assigned(Fsheet4soRef) then
      sheet4soRef.Free;
    if Assigned(FsheetItemTemplateRef) then
      sheetItemTemplateRef.Free;
    inherited Destroy;
  end;


  destructor ENSheets4SOItemsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSheets4SOItemsShort.Destroy;
  begin
    if Assigned(Fsheet4soRefDateGen) then
      sheet4soRefDateGen.Free;
    if Assigned(Fsheet4soRefNextSheetDate) then
      sheet4soRefNextSheetDate.Free;
    if Assigned(Fsheet4soRefDfDocDate) then
      sheet4soRefDfDocDate.Free;
    if Assigned(Fsheet4soRefDateEdit) then
      sheet4soRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENSheets4SOItemsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSheets4SO, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SO');
  RemClassRegistry.RegisterXSClass(ENSheets4SORef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SORef');
  RemClassRegistry.RegisterXSClass(ENSheets4SOFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOFilter');
  RemClassRegistry.RegisterXSClass(ENSheets4SOShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOShort');
  RemClassRegistry.RegisterXSClass(ENSheets4SOShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSheets4SOShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSheets4SOShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSheets4SOControllerSoapPort), 'http://ksoe.org/ENSheets4SOController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSheets4SOControllerSoapPort), 'http://ksoe.org/ENSheets4SOController/action/ENSheets4SOController.%operationName%');

  RemClassRegistry.RegisterXSClass(ENSheets4SOItems, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItems');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsRef');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsFilter');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsShort');
  RemClassRegistry.RegisterXSClass(ENSheets4SOItemsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSheets4SOItemsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSheets4SOItemsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSheets4SOItemsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSheets4SOItemsControllerSoapPort), 'http://ksoe.org/ENSheets4SOItemsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSheets4SOItemsControllerSoapPort), 'http://ksoe.org/ENSheets4SOItemsController/action/ENSheets4SOItemsController.%operationName%');



end.
