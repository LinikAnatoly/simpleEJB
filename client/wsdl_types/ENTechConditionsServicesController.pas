unit ENTechConditionsServicesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,ENDepartmentController 
   ,ENWarrantController 
   ,ENTechConditionsServicesStatusController 
   ,ENTechConditionsServicesTypeController 
   ,ENTechContragentFormController 
   ,ENTechCondResponsiblesController 
   ,CNSubsystemTypeController
   ,ENTechContragentTypeController 
   ,ENConnectionKindController 
   ,ENConnectionTariffEntryController
   ,CNPackController
   ,CNTechTermsController
   ,ENConnectionCalcTypeController
   ,ENLine04Controller 
   ,ENLineCableController 
   ,ENTransformerController 
   ,ENSubstation04Controller 
   ,ENLine10Controller
   ,ENSubstation150Controller
   ,ENLine150Controller
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENTechConditionsServices            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServicesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsServices = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FfinCommentGen : WideString;
    FtySummaGen : TXSDecimal;
    FtySummaVat : TXSDecimal;
    FtyServicesSumma : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FcnPackCode : Integer;
    FexecutionTerm : WideString;
    FbuildersArea : Integer; 
    FbaseStation : Integer; 
    FsmallArchFrm : Integer; 
    FcontractDateFinal : TXSDate;
    FisSea : Integer;
    FisDisconnectionNeeded : Integer;
    FisUse2Tariffs : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    Fdepartment : ENDepartment;
//???
    FwarrantRef : ENWarrantRef;
//???
    FtechCondServicesStatus : ENTechConditionsServicesStatus;
//???
    FtechCondServicesType : ENTechConditionsServicesType;
//???
    FcontragentForm : ENTechContragentForm;
//???
    FtechCondResponsiblesRef : ENTechCondResponsiblesRef;
//???
    FcnSubsystemTypeRef : CNSubsystemTypeRef;
//???
    FcontragentTypeRef : ENTechContragentTypeRef;
//???
    FconnectionKindRef : ENConnectionKindRef;
//???
    FtariffEntryRef : ENConnectionTariffEntryRef;
//???
    FcalcTypeRef : ENConnectionCalcTypeRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
//???
    FairLine04Ref : ENLine04Ref;
//???
    FcableLine04Ref : ENLineCableRef;
//???
    FtrRef : ENTransformerRef;
//???
    Fs04Ref : ENSubstation04Ref;
//???
    FairLine10Ref : ENLine10Ref;
//???
    FcableLine10Ref : ENLineCableRef;
//???
    Fs35Ref : ENSubstation150Ref;
//???
    FairLine150Ref : ENLine150Ref;
//???
    FcableLine150Ref : ENLineCableRef;
//???
    Fs150Ref : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property finCommentGen : WideString read FfinCommentGen write FfinCommentGen;
    property tySummaGen : TXSDecimal read FtySummaGen write FtySummaGen; 
    property tySummaVat : TXSDecimal read FtySummaVat write FtySummaVat; 
    property tyServicesSumma : TXSDecimal read FtyServicesSumma write FtyServicesSumma; 
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower; 
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property cnPackCode : Integer read FcnPackCode write FcnPackCode;
    property executionTerm : WideString read FexecutionTerm write FexecutionTerm;
    property  buildersArea : Integer read FbuildersArea write FbuildersArea; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 
    property  smallArchFrm : Integer read FsmallArchFrm write FsmallArchFrm;
    property contractDateFinal : TXSDate read FcontractDateFinal write FcontractDateFinal;
    property  isSea : Integer read FisSea write FisSea;
    property  isDisconnectionNeeded : Integer read FisDisconnectionNeeded write FisDisconnectionNeeded;
    property  isUse2Tariffs : Integer read FisUse2Tariffs write FisUse2Tariffs;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement;
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
    property techCondServicesStatus : ENTechConditionsServicesStatus read FtechCondServicesStatus write FtechCondServicesStatus; 
    property techCondServicesType : ENTechConditionsServicesType read FtechCondServicesType write FtechCondServicesType;
    property contragentForm : ENTechContragentForm read FcontragentForm write FcontragentForm; 
    property techCondResponsiblesRef : ENTechCondResponsiblesRef read FtechCondResponsiblesRef write FtechCondResponsiblesRef;
    property cnSubsystemTypeRef : CNSubsystemTypeRef read FcnSubsystemTypeRef write FcnSubsystemTypeRef; 
    property contragentTypeRef : ENTechContragentTypeRef read FcontragentTypeRef write FcontragentTypeRef; 
    property connectionKindRef : ENConnectionKindRef read FconnectionKindRef write FconnectionKindRef; 
    property tariffEntryRef : ENConnectionTariffEntryRef read FtariffEntryRef write FtariffEntryRef; 
    property calcTypeRef : ENConnectionCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property airLine04Ref : ENLine04Ref read FairLine04Ref write FairLine04Ref; 
    property cableLine04Ref : ENLineCableRef read FcableLine04Ref write FcableLine04Ref; 
    property trRef : ENTransformerRef read FtrRef write FtrRef; 
    property s04Ref : ENSubstation04Ref read Fs04Ref write Fs04Ref; 
    property airLine10Ref : ENLine10Ref read FairLine10Ref write FairLine10Ref; 
    property cableLine10Ref : ENLineCableRef read FcableLine10Ref write FcableLine10Ref; 
    property s35Ref : ENSubstation150Ref read Fs35Ref write Fs35Ref; 
    property airLine150Ref : ENLine150Ref read FairLine150Ref write FairLine150Ref; 
    property cableLine150Ref : ENLineCableRef read FcableLine150Ref write FcableLine150Ref; 
    property s150Ref : ENSubstation150Ref read Fs150Ref write Fs150Ref; 
  end;
  
{
  ENTechConditionsServicesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FfinCommentGen : WideString;
    FtySummaGen : TXSDecimal;
    FtySummaVat : TXSDecimal;
    FtyServicesSumma : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FcnPackCode : Integer;
    FexecutionTerm : WideString;
    FbuildersArea : Integer; 
    FbaseStation : Integer; 
    FsmallArchFrm : Integer; 
    FcontractDateFinal : TXSDate;
    FisSea : Integer;
    FisDisconnectionNeeded : Integer;
    FisUse2Tariffs : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    Fdepartment : ENDepartment;
//???
    FwarrantRef : ENWarrantRef;
//???
    FtechCondServicesStatus : ENTechConditionsServicesStatus;
//???
    FtechCondServicesType : ENTechConditionsServicesType;
//???
    FcontragentForm : ENTechContragentForm;
//???
    FtechCondResponsiblesRef : ENTechCondResponsiblesRef;
//???
    FcnSubsystemTypeRef : CNSubsystemTypeRef;
//???
    FcontragentTypeRef : ENTechContragentTypeRef;
//???
    FconnectionKindRef : ENConnectionKindRef;
//???
    FtariffEntryRef : ENConnectionTariffEntryRef;
//???
    FcalcTypeRef : ENConnectionCalcTypeRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
//???
    FairLine04Ref : ENLine04Ref;
//???
    FcableLine04Ref : ENLineCableRef;
//???
    FtrRef : ENTransformerRef;
//???
    Fs04Ref : ENSubstation04Ref;
//???
    FairLine10Ref : ENLine10Ref;
//???
    FcableLine10Ref : ENLineCableRef;
//???
    Fs35Ref : ENSubstation150Ref;
//???
    FairLine150Ref : ENLine150Ref;
//???
    FcableLine150Ref : ENLineCableRef;
//???
    Fs150Ref : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property finCommentGen : WideString read FfinCommentGen write FfinCommentGen;
    property tySummaGen : TXSDecimal read FtySummaGen write FtySummaGen; 
    property tySummaVat : TXSDecimal read FtySummaVat write FtySummaVat; 
    property tyServicesSumma : TXSDecimal read FtyServicesSumma write FtyServicesSumma; 
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower; 
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property cnPackCode : Integer read FcnPackCode write FcnPackCode;
    property executionTerm : WideString read FexecutionTerm write FexecutionTerm;
    property  buildersArea : Integer read FbuildersArea write FbuildersArea; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 
    property  smallArchFrm : Integer read FsmallArchFrm write FsmallArchFrm; 
    property contractDateFinal : TXSDate read FcontractDateFinal write FcontractDateFinal;
    property  isSea : Integer read FisSea write FisSea;
    property  isDisconnectionNeeded : Integer read FisDisconnectionNeeded write FisDisconnectionNeeded;
    property  isUse2Tariffs : Integer read FisUse2Tariffs write FisUse2Tariffs;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef; 
    property techCondServicesStatus : ENTechConditionsServicesStatus read FtechCondServicesStatus write FtechCondServicesStatus; 
    property techCondServicesType : ENTechConditionsServicesType read FtechCondServicesType write FtechCondServicesType; 
    property contragentForm : ENTechContragentForm read FcontragentForm write FcontragentForm; 
    property techCondResponsiblesRef : ENTechCondResponsiblesRef read FtechCondResponsiblesRef write FtechCondResponsiblesRef; 
    property cnSubsystemTypeRef : CNSubsystemTypeRef read FcnSubsystemTypeRef write FcnSubsystemTypeRef; 
    property contragentTypeRef : ENTechContragentTypeRef read FcontragentTypeRef write FcontragentTypeRef; 
    property connectionKindRef : ENConnectionKindRef read FconnectionKindRef write FconnectionKindRef; 
    property tariffEntryRef : ENConnectionTariffEntryRef read FtariffEntryRef write FtariffEntryRef; 
    property calcTypeRef : ENConnectionCalcTypeRef read FcalcTypeRef write FcalcTypeRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
    property airLine04Ref : ENLine04Ref read FairLine04Ref write FairLine04Ref; 
    property cableLine04Ref : ENLineCableRef read FcableLine04Ref write FcableLine04Ref; 
    property trRef : ENTransformerRef read FtrRef write FtrRef; 
    property s04Ref : ENSubstation04Ref read Fs04Ref write Fs04Ref; 
    property airLine10Ref : ENLine10Ref read FairLine10Ref write FairLine10Ref; 
    property cableLine10Ref : ENLineCableRef read FcableLine10Ref write FcableLine10Ref; 
    property s35Ref : ENSubstation150Ref read Fs35Ref write Fs35Ref; 
    property airLine150Ref : ENLine150Ref read FairLine150Ref write FairLine150Ref; 
    property cableLine150Ref : ENLineCableRef read FcableLine150Ref write FcableLine150Ref; 
    property s150Ref : ENSubstation150Ref read Fs150Ref write Fs150Ref; 
  end;
}

  ENTechConditionsServicesFilter = class(ENTechConditionsServices)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechConditionsServicesShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcontractNumber : WideString;
    FcontractDate : TXSDate;	
    FfinContractNumber : WideString;
    FfinContractDate : TXSDate;	
    FpartnerName : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer; 
    FfinCommentGen : WideString;
    FtySummaGen : TXSDecimal;
    FtySummaVat : TXSDecimal;
    FtyServicesSumma : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FcommentServicesGen : WideString;

    FcontragentName : WideString;
    FcontragentOkpo : WideString;

    FuserGen : WideString;
    FdateEdit : TXSDate;	
    FcnPackCode : Integer;
    FexecutionTerm : WideString;
    FbuildersArea : Integer; 
    FcontractDateFinal : TXSDate;
    FisSea : Integer;
    FisUse2Tariffs : Integer;
    FelementCode : Integer;
    FbaseStation : Integer; 
    FsmallArchFrm : Integer;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer; 
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer; 
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FwarrantRefCode : Integer; 
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer; 
    FwarrantRefMaxSum : TXSDecimal;
    FtechCondServicesStatusCode : Integer; 
    FtechCondServicesStatusName : WideString;
    FtechCondServicesTypeCode : Integer; 
    FtechCondServicesTypeName : WideString;
    FcontragentFormCode : Integer; 
    FcontragentFormName : WideString;
    FtechCondResponsiblesRefCode : Integer; 
    FtechCondResponsiblesRefResponsibleFIO : WideString;
    FtechCondResponsiblesRefResponsibleTabNumber : Integer; 
    FtechCondResponsiblesRefResponsiblePosition : WideString;
    FtechCondResponsiblesRefResponsibleDepName : WideString;
    FtechCondResponsiblesRefResponsibleDepCode : WideString;
    FtechCondResponsiblesRefResponsiblePhone : WideString;
    FtechCondResponsiblesRefPower : Integer;
    FcnSubsystemTypeRefCode : Integer;
    FcnSubsystemTypeRefName : WideString;
    FdateEndPriconnection : TXSDate;
    FcontragentTypeRefCode : Integer; 
    FcontragentTypeRefName : WideString;
    FconnectionKindRefCode : Integer; 
    FconnectionKindRefName : WideString;
    FtariffEntryRefCode : Integer; 
    FtariffEntryRefValue : TXSDecimal;
    FtariffEntryRefStartDate : TXSDate;
    FtariffEntryRefUserGen : WideString;
    FcalcTypeRefCode : Integer;
    FcalcTypeRefName : WideString;
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
    FairLine04RefCode : Integer;
    FairLine04RefInvNumber : WideString;
    FairLine04RefName : WideString;

    FcableLine04RefCode : Integer;
    FtrRefCode : Integer;

    Fs04RefCode : Integer;
    Fs04RefInvNumber : WideString;
    Fs04RefName : WideString;

    FairLine10RefCode : Integer;
    FairLine10RefInvNumber : WideString;
    FairLine10RefName : WideString;

    FcableLine10RefCode : Integer;

    Fs35RefCode : Integer;
    Fs35RefInvNumber : WideString;
    Fs35RefName : WideString;

    FairLine150RefCode : Integer; 
    FcableLine150RefCode : Integer; 
    Fs150RefCode : Integer;
    FisDisconnectionNeeded : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property finContractNumber : WideString read FfinContractNumber write FfinContractNumber;
    property finContractDate : TXSDate read FfinContractDate write FfinContractDate;
    property partnerName : WideString read FpartnerName write FpartnerName;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID; 
    property finCommentGen : WideString read FfinCommentGen write FfinCommentGen;
    property tySummaGen : TXSDecimal read FtySummaGen write FtySummaGen; 
    property tySummaVat : TXSDecimal read FtySummaVat write FtySummaVat; 
    property tyServicesSumma : TXSDecimal read FtyServicesSumma write FtyServicesSumma; 
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower; 
    property commentServicesGen : WideString read FcommentServicesGen write FcommentServicesGen;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentOkpo : WideString read FcontragentOkpo write FcontragentOkpo;

    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property cnPackCode : Integer read FcnPackCode write FcnPackCode;
    property executionTerm : WideString read FexecutionTerm write FexecutionTerm;
    property  buildersArea : Integer read FbuildersArea write FbuildersArea; 
    property  baseStation : Integer read FbaseStation write FbaseStation; 
    property  smallArchFrm : Integer read FsmallArchFrm write FsmallArchFrm; 
    property contractDateFinal : TXSDate read FcontractDateFinal write FcontractDateFinal;
    property  isSea : Integer read FisSea write FisSea;
    property  isUse2Tariffs : Integer read FisUse2Tariffs write FisUse2Tariffs;

    property elementCode : Integer read FelementCode write FelementCode; 
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode; 
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans; 
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884; 
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884; 
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884; 
    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode; 
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen; 
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName; 
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO; 
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO; 
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition; 
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO; 
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition; 
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport; 
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress; 
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower; 
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum; 
    property techCondServicesStatusCode : Integer read FtechCondServicesStatusCode write FtechCondServicesStatusCode; 
    property techCondServicesStatusName : WideString read FtechCondServicesStatusName write FtechCondServicesStatusName; 
    property techCondServicesTypeCode : Integer read FtechCondServicesTypeCode write FtechCondServicesTypeCode; 
    property techCondServicesTypeName : WideString read FtechCondServicesTypeName write FtechCondServicesTypeName; 
    property contragentFormCode : Integer read FcontragentFormCode write FcontragentFormCode; 
    property contragentFormName : WideString read FcontragentFormName write FcontragentFormName; 
    property techCondResponsiblesRefCode : Integer read FtechCondResponsiblesRefCode write FtechCondResponsiblesRefCode; 
    property techCondResponsiblesRefResponsibleFIO : WideString read FtechCondResponsiblesRefResponsibleFIO write FtechCondResponsiblesRefResponsibleFIO; 
    property techCondResponsiblesRefResponsibleTabNumber : Integer read FtechCondResponsiblesRefResponsibleTabNumber write FtechCondResponsiblesRefResponsibleTabNumber; 
    property techCondResponsiblesRefResponsiblePosition : WideString read FtechCondResponsiblesRefResponsiblePosition write FtechCondResponsiblesRefResponsiblePosition; 
    property techCondResponsiblesRefResponsibleDepName : WideString read FtechCondResponsiblesRefResponsibleDepName write FtechCondResponsiblesRefResponsibleDepName; 
    property techCondResponsiblesRefResponsibleDepCode : WideString read FtechCondResponsiblesRefResponsibleDepCode write FtechCondResponsiblesRefResponsibleDepCode;
    property techCondResponsiblesRefResponsiblePhone : WideString read FtechCondResponsiblesRefResponsiblePhone write FtechCondResponsiblesRefResponsiblePhone; 
    property techCondResponsiblesRefPower : Integer read FtechCondResponsiblesRefPower write FtechCondResponsiblesRefPower;
    property cnSubsystemTypeRefCode : Integer read FcnSubsystemTypeRefCode write FcnSubsystemTypeRefCode; 
    property cnSubsystemTypeRefName : WideString read FcnSubsystemTypeRefName write FcnSubsystemTypeRefName;
    property dateEndPriconnection : TXSDate read FdateEndPriconnection write FdateEndPriconnection;
    property contragentTypeRefCode : Integer read FcontragentTypeRefCode write FcontragentTypeRefCode; 
    property contragentTypeRefName : WideString read FcontragentTypeRefName write FcontragentTypeRefName; 
    property connectionKindRefCode : Integer read FconnectionKindRefCode write FconnectionKindRefCode; 
    property connectionKindRefName : WideString read FconnectionKindRefName write FconnectionKindRefName; 
    property tariffEntryRefCode : Integer read FtariffEntryRefCode write FtariffEntryRefCode; 
    property tariffEntryRefValue : TXSDecimal read FtariffEntryRefValue write FtariffEntryRefValue; 
    property tariffEntryRefStartDate : TXSDate read FtariffEntryRefStartDate write FtariffEntryRefStartDate; 
    property tariffEntryRefUserGen : WideString read FtariffEntryRefUserGen write FtariffEntryRefUserGen; 
    property calcTypeRefCode : Integer read FcalcTypeRefCode write FcalcTypeRefCode;
    property calcTypeRefName : WideString read FcalcTypeRefName write FcalcTypeRefName;
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
    property airLine04RefCode : Integer read FairLine04RefCode write FairLine04RefCode; //ENLine04Ref read FairLine04RefCode write FairLine04RefCode;
    property airLine04RefInvNumber : WideString read FairLine04RefInvNumber write FairLine04RefInvNumber;
    property airLine04RefName : WideString read FairLine04RefName write FairLine04RefName;

    property cableLine04RefCode : Integer read FcableLine04RefCode write FcableLine04RefCode; //ENLineCableRef read FcableLine04RefCode write FcableLine04RefCode;

    property trRefCode : Integer read FtrRefCode write FtrRefCode; //ENTransformerRef read FtrRefCode write FtrRefCode;

    property s04RefCode : Integer read Fs04RefCode write Fs04RefCode; //ENSubstation04Ref read Fs04RefCode write Fs04RefCode;
    property s04RefInvNumber : WideString read Fs04RefInvNumber write Fs04RefInvNumber;
    property s04RefName : WideString read Fs04RefName write Fs04RefName;

    property airLine10RefCode : Integer read FairLine10RefCode write FairLine10RefCode; //ENLine10Ref read FairLine10RefCode write FairLine10RefCode;
    property airLine10RefInvNumber : WideString read FairLine10RefInvNumber write FairLine10RefInvNumber;
    property airLine10RefName : WideString read FairLine10RefName write FairLine10RefName;

    property cableLine10RefCode : Integer read FcableLine10RefCode write FcableLine10RefCode; //ENLineCableRef read FcableLine10RefCode write FcableLine10RefCode;

    property s35RefCode : Integer read Fs35RefCode write Fs35RefCode; //ENSubstation150Ref read Fs35RefCode write Fs35RefCode;
    property s35RefInvNumber : WideString read Fs35RefInvNumber write Fs35RefInvNumber;
    property s35RefName : WideString read Fs35RefName write Fs35RefName;

    property airLine150RefCode : Integer read FairLine150RefCode write FairLine150RefCode; //ENLine150Ref read FairLine150RefCode write FairLine150RefCode;
    property cableLine150RefCode : Integer read FcableLine150RefCode write FcableLine150RefCode; //ENLineCableRef read FcableLine150RefCode write FcableLine150RefCode;
    property s150RefCode : Integer read Fs150RefCode write Fs150RefCode; //ENSubstation150Ref read Fs150RefCode write Fs150RefCode;
    property isDisconnectionNeeded : Integer read FisDisconnectionNeeded write FisDisconnectionNeeded;

  end;

  ArrayOfENTechConditionsServicesShort = array of ENTechConditionsServicesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechConditionsServicesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechConditionsServicesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechConditionsServicesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechConditionsServicesController/message/
  // soapAction: http://ksoe.org/ENTechConditionsServicesController/action/ENTechConditionsServicesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechConditionsServicesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechConditionsServicesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechConditionsServicesControllerSoapPort = interface(IInvokable)
  ['{B054522B-E597-41DA-87DD-C7333978DB6D}']
    function  add(const aENTechConditionsServices: ENTechConditionsServices): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechConditionsServices: ENTechConditionsServices); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechConditionsServices; stdcall;
    function  getList: ENTechConditionsServicesShortList; stdcall;
    function  getFilteredList(const aENTechConditionsServicesFilter: ENTechConditionsServicesFilter): ENTechConditionsServicesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesShortList; stdcall;
    function  getScrollableFilteredList(const aENTechConditionsServicesFilter: ENTechConditionsServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsServicesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechConditionsServicesFilter: ENTechConditionsServicesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getShortObject(const anObjectCode: Integer): ENTechConditionsServicesShort; stdcall;

    function  getActsListByCnPackCode(const cnPackCode: Integer): String; stdcall; overload;
    function  getActsListByCnPackCode(const cnPackCode: Integer; const cnSubsystemCode: Integer): String; stdcall; overload;

    procedure signed(const code : Integer); stdcall;
    procedure unSigned(const code : Integer); stdcall;
    procedure completed(const code : Integer); stdcall;
    procedure unCompleted(const code : Integer); stdcall;

    // procedure bind2CNPack(objectCode: Integer; cnPackCode: Integer); stdcall;
    procedure bind2CNPack(const objectCode: Integer; const cnPackCode: Integer; const cnSubsystemCode: Integer); stdcall;

    function getResponsiblePerson(const aPower: TXSDecimal; const aDepartmentCode: Integer): ENTechCondResponsibles; stdcall; overload;
    function getResponsiblePerson(const aENTechConditionsServices: ENTechConditionsServices): ENTechCondResponsibles; stdcall; overload;

    // создание договора о присоединении по пакету из EnergyWorkflow
    function addTechConditionsServicesByCNPack(soCode: Integer; pack: CNPack; techTerms: CNTechTerms) : Integer; stdcall;
  end;



implementation

  destructor ENTechConditionsServices.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FtySummaGen) then
      tySummaGen.Free;
    if Assigned(FtySummaVat) then
      tySummaVat.Free;
    if Assigned(FtyServicesSumma) then
      tyServicesSumma.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcontractDateFinal) then
      contractDateFinal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FtechCondServicesStatus) then
      techCondServicesStatus.Free;
    if Assigned(FtechCondServicesType) then
      techCondServicesType.Free;
    if Assigned(FcontragentForm) then
      contragentForm.Free;
    if Assigned(FtechCondResponsiblesRef) then
      techCondResponsiblesRef.Free;
    if Assigned(FcnSubsystemTypeRef) then
      cnSubsystemTypeRef.Free;
    if Assigned(FcontragentTypeRef) then
      contragentTypeRef.Free;
    if Assigned(FconnectionKindRef) then
      connectionKindRef.Free;
    if Assigned(FtariffEntryRef) then
      tariffEntryRef.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    if Assigned(FairLine04Ref) then
      airLine04Ref.Free;
    if Assigned(FcableLine04Ref) then
      cableLine04Ref.Free;
    if Assigned(FtrRef) then
      trRef.Free;
    if Assigned(Fs04Ref) then
      s04Ref.Free;
    if Assigned(FairLine10Ref) then
      airLine10Ref.Free;
    if Assigned(FcableLine10Ref) then
      cableLine10Ref.Free;
    if Assigned(Fs35Ref) then
      s35Ref.Free;
    if Assigned(FairLine150Ref) then
      airLine150Ref.Free;
    if Assigned(FcableLine150Ref) then
      cableLine150Ref.Free;
    if Assigned(Fs150Ref) then
      s150Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENTechConditionsServicesFilter.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FtySummaGen) then
      tySummaGen.Free;
    if Assigned(FtySummaVat) then
      tySummaVat.Free;
    if Assigned(FtyServicesSumma) then
      tyServicesSumma.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcontractDateFinal) then
      contractDateFinal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FtechCondServicesStatus) then
      techCondServicesStatus.Free;
    if Assigned(FtechCondServicesType) then
      techCondServicesType.Free;
    if Assigned(FcontragentForm) then
      contragentForm.Free;
    if Assigned(FtechCondResponsiblesRef) then
      techCondResponsiblesRef.Free;
    if Assigned(FcnSubsystemTypeRef) then
      cnSubsystemTypeRef.Free;
    if Assigned(FcontragentTypeRef) then
      contragentTypeRef.Free;
    if Assigned(FconnectionKindRef) then
      connectionKindRef.Free;
    if Assigned(FtariffEntryRef) then
      tariffEntryRef.Free;
    if Assigned(FcalcTypeRef) then
      calcTypeRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    if Assigned(FairLine04Ref) then
      airLine04Ref.Free;
    if Assigned(FcableLine04Ref) then
      cableLine04Ref.Free;
    if Assigned(FtrRef) then
      trRef.Free;
    if Assigned(Fs04Ref) then
      s04Ref.Free;
    if Assigned(FairLine10Ref) then
      airLine10Ref.Free;
    if Assigned(FcableLine10Ref) then
      cableLine10Ref.Free;
    if Assigned(Fs35Ref) then
      s35Ref.Free;
    if Assigned(FairLine150Ref) then
      airLine150Ref.Free;
    if Assigned(FcableLine150Ref) then
      cableLine150Ref.Free;
    if Assigned(Fs150Ref) then
      s150Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENTechConditionsServicesFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTechConditionsServicesShort.Destroy;
  begin
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FfinContractDate) then
      finContractDate.Free;
    if Assigned(FtySummaGen) then
      tySummaGen.Free;
    if Assigned(FtySummaVat) then
      tySummaVat.Free;
    if Assigned(FtyServicesSumma) then
      tyServicesSumma.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcontractDateFinal) then
      contractDateFinal.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    if Assigned(FdateEndPriconnection) then
      dateEndPriconnection.Free;
    if Assigned(FtariffEntryRefValue) then
      tariffEntryRefValue.Free;
    if Assigned(FtariffEntryRefStartDate) then
      tariffEntryRefStartDate.Free;
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
  
  destructor ENTechConditionsServicesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechConditionsServices, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServices');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesRef');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesFilter');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesShort');
  RemClassRegistry.RegisterXSClass(ENTechConditionsServicesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsServicesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechConditionsServicesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechConditionsServicesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechConditionsServicesControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechConditionsServicesControllerSoapPort), 'http://ksoe.org/ENTechConditionsServicesController/action/ENTechConditionsServicesController.%operationName%');


end.
