unit ENPlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkStatusController
   ,ENElementController 
   ,ENPlanWorkTypeController 
   ,ENPlanWorkKindController 
   //,EPRenController
   ,FINExecutorController
   ,ENPlanWorkStateController 
   ,ENDepartmentController 
   ,ENPlanWorkFormController
   ,ENPlanWorkSourceController
   ,RQDDSCodesController
   ,ENInvestProgramGroupsController
   ,TKTechCardController
   ,ENIPImplementationTypeController
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

  ENPlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork = class(TRemotable)
  private
    Fcode : Integer; 
//    FdateGen : TXSDate;
    FdateGen : TXSDateTime;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer;
    FyearOriginal : Integer; 
    FmonthOriginal : Integer; 
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdistanceAlong : TXSDecimal;
    FdistanceTo : TXSDecimal;
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;
    FpriConnectionNumber : WideString;
    FdateEndPriConnection : TXSDate;
    FinvestWorksAmount : TXSDecimal;
    FinvestWorksDescription : WideString;
    FinvestDateStartWork : TXSDateTime;
    FinvestWorkMeasCode : Integer;
    FservicesFSideFinId : Integer;
    FservicesFSideCnNum : WideString;
    FtotalTimeHours : TXSDecimal;
    FtotalTimeDays : TXSDecimal;
    FinvestItemNumber : WideString;
    FcauseDisconnection : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fstatus : ENPlanWorkStatus;
//???
    FelementRef : ENElementRef;
//???
    FtypeRef : ENPlanWorkTypeRef;
//???
    Fkind : ENPlanWorkKind;
//???
    FrenRef : EPRenRef;
//???
    FfinExecutor : FINExecutor;
//???
    FstateRef : ENPlanWorkStateRef;
//???
    FformRef : ENPlanWorkFormRef;
//???
    FsourceRef : ENPlanWorkSourceRef;
//???
    FddsCodes : RQDDSCodes;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FresponsibilityRef : ENDepartmentRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FinvgroupRef : ENInvestProgramGroupsRef;
//???
    FipImplementTypeRef : ENIPImplementationTypeRef;

    FpartnerCode :  WideString;
    FfinDocCode :  WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property yearGen : Integer read FyearGen write FyearGen;
    property monthGen : Integer read FmonthGen write FmonthGen;
    property yearOriginal : Integer read FyearOriginal write FyearOriginal;
    property monthOriginal : Integer read FmonthOriginal write FmonthOriginal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property distanceAlong : TXSDecimal read FdistanceAlong write FdistanceAlong; 
    property distanceTo : TXSDecimal read FdistanceTo write FdistanceTo; 
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property priConnectionNumber : WideString read FpriConnectionNumber write FpriConnectionNumber;
    property dateEndPriConnection : TXSDate read FdateEndPriConnection write FdateEndPriConnection;
    property investWorksAmount : TXSDecimal read FinvestWorksAmount write FinvestWorksAmount;
    property investWorksDescription : WideString read FinvestWorksDescription write FinvestWorksDescription;
    property investDateStartWork : TXSDateTime read FinvestDateStartWork write FinvestDateStartWork;
    property investWorkMeasCode : Integer read FinvestWorkMeasCode write FinvestWorkMeasCode;
    property servicesFSideFinId : Integer read FservicesFSideFinId write FservicesFSideFinId;
    property servicesFSideCnNum : WideString read FservicesFSideCnNum write FservicesFSideCnNum;
    property totalTimeHours : TXSDecimal read FtotalTimeHours write FtotalTimeHours;
    property totalTimeDays : TXSDecimal read FtotalTimeDays write FtotalTimeDays;
    property investItemNumber : WideString read FinvestItemNumber write FinvestItemNumber;
    property  causeDisconnection : Integer read FcauseDisconnection write FcauseDisconnection;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property status : ENPlanWorkStatus read Fstatus write Fstatus;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property typeRef : ENPlanWorkTypeRef read FtypeRef write FtypeRef;
    property kind : ENPlanWorkKind read Fkind write Fkind;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property finExecutor : FINExecutor read FfinExecutor write FfinExecutor;
    property stateRef : ENPlanWorkStateRef read FstateRef write FstateRef;
    property formRef : ENPlanWorkFormRef read FformRef write FformRef;
    property sourceRef : ENPlanWorkSourceRef read FsourceRef write FsourceRef;
    property ddsCodes : RQDDSCodes read FddsCodes write FddsCodes;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
    property responsibilityRef : ENDepartmentRef read FresponsibilityRef write FresponsibilityRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property invgroupRef : ENInvestProgramGroupsRef read FinvgroupRef write FinvgroupRef;
    property ipImplementTypeRef : ENIPImplementationTypeRef read FipImplementTypeRef write FipImplementTypeRef;

    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode :  WideString read FfinDocCode  write FfinDocCode;
  end;

  BufetOrderShort = class(TRemotable)
  private
   FnumberDoc : WideString;
   FdateGen: TXSDateTime;
   Fsum : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property sum : TXSDecimal read Fsum write Fsum;
  end;

  ArrayOfBufetOrderShort = array of BufetOrderShort;

  BufetOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfBufetOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfBufetOrderShort read Flist write Flist;
  end;

  ENPlanWorkFilter = class(ENPlanWork)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWorkShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDateTime;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer;
    FyearOriginal : Integer;
    FmonthOriginal : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;
    FpriConnectionNumber : WideString;
    FdateEndPriConnection : TXSDate;
    FinvestWorksDescription : WideString;
    FinvestDateStartWork : TXSDateTime;
    FinvestWorkMeasCode : Integer;
    FservicesFSideFinId : Integer; 
    FservicesFSideCnNum : WideString;
    FtotalTimeHours : TXSDecimal;
    FtotalTimeDays : TXSDecimal;
    FstatusCode : Integer; 
    FstatusName : WideString;
    FelementRefCode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FtypeRefShortName : WideString;
    FkindCode : Integer; 
    FobjectName : WideString;
    FkindName : WideString;
    FrenRefCode : Integer; 
    FrenRefName : WideString;
    FfinExecutorCode : Integer; 
    FfinExecutorName : WideString;
    FfinExecutorFinCode : Integer; 
    FfinExecutorFinTypeName : WideString;
    FfinExecutorFinTypeCode : Integer; 
    FfinExecutorFinKindName : WideString;
    FfinExecutorFinKindCode : Integer; 
    FfinExecutorFinCehName : WideString;
    FfinExecutorFinCehCode : Integer; 
    FstateRefCode : Integer; 
    FstateRefName : WideString;
    FstateRefShortName : WideString;

    FformRefCode : Integer; 
    FformRefName : WideString;

    FbudgetRefCode : Integer; 
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FresponsibilityRefCode : Integer; 
    FresponsibilityRefShortName : WideString;
    FresponsibilityRefDateStart : TXSDate;
    FresponsibilityRefDateFinal : TXSDate;
    FdepartmentRefCode : Integer; 
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FinvNumber : WideString;

    FsourceRefCode : Integer;
    FsourceRefName : WideString;
    FactInfo : WideString;

    FinvgroupRefCode : Integer;
    FinvgroupRefName : WideString;
    FinvestItemNumber : WideString;
    FipImplementTypeRefCode : Integer;
    FipImplementTypeRefName : WideString;

    FactRefCode : Integer;
    FactRefNumber : WideString;
    FcauseDisconnection : Integer;
    FplanedSum :   TXSDecimal;
    FhumanHours: TXSDecimal;
    FpercentManningWithMaterials : WideString;
    FpercentManningWithTransport : WideString;

    Finfo_oz2 : WideString;
    Finfo_oz1 : WideString;
    Finfo_dfdocdecree: WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property yearGen : Integer read FyearGen write FyearGen;
    property monthGen : Integer read FmonthGen write FmonthGen;
    property yearOriginal : Integer read FyearOriginal write FyearOriginal;
    property monthOriginal : Integer read FmonthOriginal write FmonthOriginal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property priConnectionNumber : WideString read FpriConnectionNumber write FpriConnectionNumber;
    property dateEndPriConnection : TXSDate read FdateEndPriConnection write FdateEndPriConnection;
    property investWorksDescription : WideString read FinvestWorksDescription write FinvestWorksDescription;
    property investDateStartWork : TXSDateTime read FinvestDateStartWork write FinvestDateStartWork;
    property  investWorkMeasCode : Integer read FinvestWorkMeasCode write FinvestWorkMeasCode;
    property servicesFSideFinId : Integer read FservicesFSideFinId write FservicesFSideFinId; 
    property servicesFSideCnNum : WideString read FservicesFSideCnNum write FservicesFSideCnNum;
    property totalTimeHours : TXSDecimal read FtotalTimeHours write FtotalTimeHours;
    property totalTimeDays : TXSDecimal read FtotalTimeDays write FtotalTimeDays;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property statusName : WideString read FstatusName write FstatusName; 
    property elementRefCode : Integer read FelementRefCode write FelementRefCode; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property typeRefShortName : WideString read FtypeRefShortName write FtypeRefShortName; 
    property objectName : WideString read FobjectName write FobjectName;
    property kindCode : Integer read FkindCode write FkindCode; 
    property kindName : WideString read FkindName write FkindName; 
    property renRefCode : Integer read FrenRefCode write FrenRefCode; 
    property renRefName : WideString read FrenRefName write FrenRefName; 
    property finExecutorCode : Integer read FfinExecutorCode write FfinExecutorCode; 
    property finExecutorName : WideString read FfinExecutorName write FfinExecutorName; 
    property finExecutorFinCode : Integer read FfinExecutorFinCode write FfinExecutorFinCode; 
    property finExecutorFinTypeName : WideString read FfinExecutorFinTypeName write FfinExecutorFinTypeName; 
    property finExecutorFinTypeCode : Integer read FfinExecutorFinTypeCode write FfinExecutorFinTypeCode; 
    property finExecutorFinKindName : WideString read FfinExecutorFinKindName write FfinExecutorFinKindName; 
    property finExecutorFinKindCode : Integer read FfinExecutorFinKindCode write FfinExecutorFinKindCode; 
    property finExecutorFinCehName : WideString read FfinExecutorFinCehName write FfinExecutorFinCehName; 
    property finExecutorFinCehCode : Integer read FfinExecutorFinCehCode write FfinExecutorFinCehCode; 
    property stateRefCode : Integer read FstateRefCode write FstateRefCode; 
    property stateRefName : WideString read FstateRefName write FstateRefName; 
    property stateRefShortName : WideString read FstateRefShortName write FstateRefShortName; 
    property formRefCode : Integer read FformRefCode write FformRefCode; 
    property formRefName : WideString read FformRefName write FformRefName; 
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode; 
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName; 
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart; 
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal; 
    property responsibilityRefCode : Integer read FresponsibilityRefCode write FresponsibilityRefCode; 
    property responsibilityRefShortName : WideString read FresponsibilityRefShortName write FresponsibilityRefShortName; 
    property responsibilityRefDateStart : TXSDate read FresponsibilityRefDateStart write FresponsibilityRefDateStart; 
    property responsibilityRefDateFinal : TXSDate read FresponsibilityRefDateFinal write FresponsibilityRefDateFinal; 
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart; 
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal; 
    property invNumber : WideString read FinvNumber write FinvNumber;

    property sourceRefCode : Integer read FsourceRefCode write FsourceRefCode; 
    property sourceRefName : WideString read FsourceRefName write FsourceRefName;

    property actInfo : WideString read FactInfo write FactInfo;

    property invgroupRefCode : Integer read FinvgroupRefCode write FinvgroupRefCode;
    property invgroupRefName : WideString read FinvgroupRefName write FinvgroupRefName;
    property investItemNumber : WideString read FinvestItemNumber write FinvestItemNumber;
    property ipImplementTypeRefCode : Integer read FipImplementTypeRefCode write FipImplementTypeRefCode;
    property ipImplementTypeRefName : WideString read FipImplementTypeRefName write FipImplementTypeRefName;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumber : WideString read FactRefNumber write FactRefNumber;

    property causeDisconnection : Integer read   FcauseDisconnection write FcauseDisconnection;
    property planedSum : TXSDecimal read FplanedSum write FplanedSum;
    property humanHours : TXSDecimal read FhumanHours write FhumanHours;
    property percentManningWithMaterials : WideString read FpercentManningWithMaterials write FpercentManningWithMaterials;
    property percentManningWithTransport : WideString read FpercentManningWithTransport write FpercentManningWithTransport;

    property info_oz2 : WideString read Finfo_oz2 Write Finfo_oz2;
    property info_oz1 : WideString read Finfo_oz1 Write Finfo_oz1;
    property info_dfdocdecree : WideString read Finfo_dfdocdecree Write Finfo_dfdocdecree;
  end;



  ENPlanWorkBillingShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDateTime;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FyearGen : Integer; 
    FmonthGen : Integer;
    FyearOriginal : Integer; 
    FmonthOriginal : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FworkOrderNumber : WideString;
    FdateWorkOrder : TXSDate;
    FpriConnectionNumber : WideString;
    FservicesFSideFinId : Integer; 
    FservicesFSideCnNum : WideString;
    FstatusCode : Integer; 
    FstatusName : WideString;
    FelementRefCode : Integer; 
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FtypeRefShortName : WideString;
    FkindCode : Integer; 
    FobjectName : WideString;
    FkindName : WideString;
    FrenRefCode : Integer; 
    FrenRefName : WideString;
    FfinExecutorCode : Integer; 
    FfinExecutorName : WideString;
    FfinExecutorFinCode : Integer; 
    FfinExecutorFinTypeName : WideString;
    FfinExecutorFinTypeCode : Integer; 
    FfinExecutorFinKindName : WideString;
    FfinExecutorFinKindCode : Integer; 
    FfinExecutorFinCehName : WideString;
    FfinExecutorFinCehCode : Integer; 
    FstateRefCode : Integer; 
    FstateRefName : WideString;
    FstateRefShortName : WideString;

    FformRefCode : Integer; 
    FformRefName : WideString;

    FbudgetRefCode : Integer; 
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FresponsibilityRefCode : Integer; 
    FresponsibilityRefShortName : WideString;
    FresponsibilityRefDateStart : TXSDate;
    FresponsibilityRefDateFinal : TXSDate;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FinvNumber : WideString;

    FsourceRefCode : Integer;
    FsourceRefName : WideString;

    FdateCounterInst: TXSDate;
    FdateCounterCheck: TXSDate;
    FcounterType: WideString;




  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateGen : TXSDateTime read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property yearGen : Integer read FyearGen write FyearGen;
    property monthGen : Integer read FmonthGen write FmonthGen;
    property yearOriginal : Integer read FyearOriginal write FyearOriginal;
    property monthOriginal : Integer read FmonthOriginal write FmonthOriginal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateWorkOrder : TXSDate read FdateWorkOrder write FdateWorkOrder;
    property priConnectionNumber : WideString read FpriConnectionNumber write FpriConnectionNumber;
    property servicesFSideFinId : Integer read FservicesFSideFinId write FservicesFSideFinId; 
    property servicesFSideCnNum : WideString read FservicesFSideCnNum write FservicesFSideCnNum;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property statusName : WideString read FstatusName write FstatusName; 
    property elementRefCode : Integer read FelementRefCode write FelementRefCode; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property typeRefShortName : WideString read FtypeRefShortName write FtypeRefShortName; 
    property objectName : WideString read FobjectName write FobjectName;
    property kindCode : Integer read FkindCode write FkindCode; 
    property kindName : WideString read FkindName write FkindName; 
    property renRefCode : Integer read FrenRefCode write FrenRefCode; 
    property renRefName : WideString read FrenRefName write FrenRefName; 
    property finExecutorCode : Integer read FfinExecutorCode write FfinExecutorCode; 
    property finExecutorName : WideString read FfinExecutorName write FfinExecutorName; 
    property finExecutorFinCode : Integer read FfinExecutorFinCode write FfinExecutorFinCode; 
    property finExecutorFinTypeName : WideString read FfinExecutorFinTypeName write FfinExecutorFinTypeName; 
    property finExecutorFinTypeCode : Integer read FfinExecutorFinTypeCode write FfinExecutorFinTypeCode; 
    property finExecutorFinKindName : WideString read FfinExecutorFinKindName write FfinExecutorFinKindName; 
    property finExecutorFinKindCode : Integer read FfinExecutorFinKindCode write FfinExecutorFinKindCode; 
    property finExecutorFinCehName : WideString read FfinExecutorFinCehName write FfinExecutorFinCehName; 
    property finExecutorFinCehCode : Integer read FfinExecutorFinCehCode write FfinExecutorFinCehCode; 
    property stateRefCode : Integer read FstateRefCode write FstateRefCode; 
    property stateRefName : WideString read FstateRefName write FstateRefName; 
    property stateRefShortName : WideString read FstateRefShortName write FstateRefShortName; 
    property formRefCode : Integer read FformRefCode write FformRefCode; 
    property formRefName : WideString read FformRefName write FformRefName; 
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode; 
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName; 
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart; 
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal; 
    property responsibilityRefCode : Integer read FresponsibilityRefCode write FresponsibilityRefCode; 
    property responsibilityRefShortName : WideString read FresponsibilityRefShortName write FresponsibilityRefShortName; 
    property responsibilityRefDateStart : TXSDate read FresponsibilityRefDateStart write FresponsibilityRefDateStart; 
    property responsibilityRefDateFinal : TXSDate read FresponsibilityRefDateFinal write FresponsibilityRefDateFinal; 
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName; 
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart; 
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property invNumber : WideString read FinvNumber write FinvNumber;

    property sourceRefCode : Integer read FsourceRefCode write FsourceRefCode;
    property sourceRefName : WideString read FsourceRefName write FsourceRefName;

    property dateCounterInst : TXSDate read FdateCounterInst write FdateCounterInst;
    property dateCounterCheck : TXSDate read FdateCounterCheck write FdateCounterCheck;
    property counterType : WideString read FcounterType write FcounterType;



  end;


  ArrayOfENPlanWorkShort = array of ENPlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfENPlanWorkBillingShort = array of ENPlanWorkBillingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkShort read Flist write Flist;
  end;

  ENPlanWorkBillingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkBillingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkBillingShort read Flist write Flist;
  end;

////////////////////////////////////////////////////////////////////////////////
  ENMaterialsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FelementCode : Integer;
    FelementName : WideString;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FparentRefCode : Integer;
    FparentRefName : WideString;
    Fcost : TXSDecimal;
    FdeliveryDate : Integer;
    FsumCost : TXSDecimal;
    FcountFact : TXSDecimal;
    FpurchaseItemRefCode : Integer;
  public
    destructor Destroy; override;    
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

    property elementCode : Integer read FelementCode write FelementCode;
    property elementName : WideString read FelementName write FelementName;
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property cost : TXSDecimal read Fcost write Fcost;
    property deliveryDate : Integer read FdeliveryDate write FdeliveryDate ;
    property sumCost : TXSDecimal read FsumCost write FsumCost;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property purchaseItemRefCode : Integer read FpurchaseItemRefCode write FpurchaseItemRefCode;
  end;

  ArrayOfENMaterialsShort = array of ENMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMaterialsShort read Flist write Flist;
  end;

////////////////////////////////////////////////////////////////////////////////


   ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkController/message/
  // soapAction: http://ksoe.org/ENPlanWorkController/action/ENPlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDate;
    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FkartaRefCode : Integer;
    FkartaRefName : WideString;
    FkartaNum : WideString;
    FmeasurementUnit : WideString;
    Fmeter : WideString;
    FnormOfTime : TXSDecimal;
    FsourceName : WideString;

    FtimeGen : TXSDecimal;
    FcostServicesFS : TXSDecimal;
    FcommentGen : WideString;
    Fkoef : TXSDecimal;
    FstatusName : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen;
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen;
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit;
    property kartaRefCode : Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;
    property normOfTime : TXSDecimal read FnormOfTime write FnormOfTime;
    property measurementUnit : WideString read FmeasurementUnit write FmeasurementUnit;
    property meter : WideString read Fmeter write Fmeter;
    property sourceName : WideString read FsourceName write FsourceName;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costServicesFS : TXSDecimal read FcostServicesFS write FcostServicesFS;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property koef : TXSDecimal read Fkoef write Fkoef;
    property statusName : WideString read FstatusName write FstatusName;
  end;

  ArrayOfENPlanWorkItemShort = array of ENPlanWorkItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }




  ENPlanWorkControllerSoapPort = interface(IInvokable)
  ['{71D41B3C-8BA0-4F3F-9661-0311349BCCE6}']
    function  add(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork: ENPlanWork); overload; stdcall;
    procedure save(const aENPlanWork: ENPlanWork;
      const isFromWorkOrderByt: Boolean;
      const isFromBilling: Boolean;
      const isOnlyRebinding: Boolean); overload; stdcall;
    procedure saveAttributes(const aENPlanWork: ENPlanWork); overload; stdcall;
    procedure saveAttributes(const aENPlanWork: ENPlanWork; const forAllPlan: Boolean); overload; stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWork; stdcall;
    function  getList: ENPlanWorkShortList; stdcall;
    function  getFilteredList(const aENPlanWorkFilter: ENPlanWorkFilter): ENPlanWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;
    function  getScrollableBillingFilteredList(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkBillingShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;

    function  getScrollableFilteredListForMetrologyCounters(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;
    function  getScrollableFilteredListForEnergosbyt(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;

    procedure  generateEsentialByPlan(planCode : Integer) ; stdcall;
    procedure  generateEsentialByPlanItem(planItemCode : Integer) ; stdcall;
    procedure  cancelEsentialByPlan(planCode : Integer) ; stdcall;
    procedure  cancelEsentialByPlanItem(planItemCode : Integer) ; stdcall;

    function closePlanWork(planCode : Integer) : Integer; stdcall; overload;
    function closePlanWork(planCode: Integer; planWorkItemArr: ArrayOfENPlanWorkItemShort): Integer; stdcall; overload;

    function  closePlanWorkBilling(planCode : Integer) : Integer; stdcall;
    function  closePlanWorkWithDate(planCode : Integer; newPlanDate : TXSDate) : Integer; stdcall;

    function  closePlanWorkForByt(planCode : Integer; molCode, molName : WideString; executor : FINExecutor; newPlanDate : TXSDate;
                                  masterCode : WideString; masterName : WideString; mechanicCode : WideString; mechanicName : WideString) : Integer; stdcall;

    function  closePlanWorkWithParams(planCode : Integer; newPlanDate, timeStart, timeFinal : TXSDate;
                                  masterCode, masterName, mechanicCode, mechanicName : WideString; planWorkItemArr: ArrayOfENPlanWorkItemShort) : Integer; stdcall; overload;

    function  closePlanWorkWithParams(planCode : Integer; newPlanDate, timeStart, timeFinal : TXSDate;
                                  masterCode, masterName, mechanicCode, mechanicName : WideString) : Integer; stdcall; overload;

    function  closePlanWorkWithParams(planCode : Integer; newPlanDate : TXSDate; masterCode, masterName, mechanicCode, mechanicName : WideString;
                                   planWorkItemArr: ArrayOfENPlanWorkItemShort) : Integer; stdcall; overload;

    function  closePlanWorkWithParams(planCode : Integer; newPlanDate : TXSDate; masterCode, masterName, mechanicCode, mechanicName : WideString) : Integer; stdcall; overload;

    procedure  closePlanWorkBySRS(planCode : Integer) ; stdcall;
    procedure  closePlanWorkBySVES(planCode : Integer) ; stdcall;
    procedure  closePlanWorkBySPS(planCode : Integer) ; stdcall;

    procedure  openPlanWork(planCode : Integer) ; stdcall;

    function  addBySRS(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure removeBySRS_(const anObjectCode: Integer); stdcall;
    procedure saveBySRS(const aENPlanWork: ENPlanWork); stdcall;

    function  addBySVES(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure removeBySVES(const anObjectCode: Integer); stdcall;
    procedure saveBySVES(const aENPlanWork: ENPlanWork); stdcall;

    function  addBySPS(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure removeBySPS(const anObjectCode: Integer); stdcall;
    procedure saveBySPS(const aENPlanWork: ENPlanWork); stdcall;
	
    function  addByByt(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure removeByByt(const anObjectCode: Integer); stdcall;
    procedure saveByByt(const aENPlanWork: ENPlanWork); stdcall;

    function  addByProm(const aENPlanWork: ENPlanWork): Integer; stdcall;
    procedure removeByProm(const anObjectCode: Integer); stdcall;
    procedure saveByProm(const aENPlanWork: ENPlanWork); stdcall;

    function getPlanCodesHistoryUp(const aPlanWorkCode : Integer):WideString; stdcall;
    function getPlanCodesHistoryDown(const aPlanWorkCode : Integer):WideString; stdcall;

    function  addByRZA(const aENPlanWork: ENPlanWork): Integer; stdcall;
    //procedure removeByRZA(const anObjectCode: Integer); stdcall;
    //procedure saveByRZA(const aENPlanWork: ENPlanWork); stdcall;

    function addBySDTU(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addByTransport(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addByBuilder(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addByMetrology(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByMetrologyCounters(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByMetrologyDevices(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addBySIT(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addByIzolation(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function addByPreproductionObject(const aENPlanWork: ENPlanWork): Integer; stdcall;

    //procedure removeBySDTU(const anObjectCode: Integer); stdcall;
    //procedure saveBySDTU(const aENPlanWork: ENPlanWork); stdcall;

    function addByParent(const aENPlanWork: ENPlanWork; const ParentPlanCode: Integer): Integer; stdcall;
    procedure bind2parentPlan(const planCode: Integer; const parentPlan: Integer; const correctionReasonCode: Integer); stdcall;

    procedure preConfirm(const aPlanWorkCode : Integer ); stdcall;
    procedure confirm(const aPlanWorkCode : Integer ); stdcall;
    procedure undoConfirm(const aPlanWorkCode : Integer ); stdcall;

    function getMaterialsFromPlans(const aENPlanWorkFilter: ENPlanWorkFilter; const tkMaterialCode : Integer): ENMaterialsShortList; overload; stdcall;
    function getMaterialsFromPlans(const aENPlanWorkFilter: ENPlanWorkFilter; const materialCondition : WideString; const tkMaterialCode : Integer): ENMaterialsShortList; overload; stdcall;
    function getServicesFromPlans(const aENPlanWorkFilter: ENPlanWorkFilter; const tkMaterialCode : Integer): ENMaterialsShortList; overload; stdcall;

    procedure editPreConfirm(const aPlanWorkCode : Integer)  stdcall;

    procedure saveAddInfo(const aENPlanWork: ENPlanWork); stdcall;


    procedure getPlanStatusFromCN(const aPlanCode : Integer); stdcall;

    function addByPurchasesObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByPurchasesNoObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByTransformerObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByOperativeObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByServicesObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByTrucking(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByMetrologySubstation(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByEB(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByWritingNoObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addBySiz(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByEquipment(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByEquipmentRepair(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByPVZ(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByServicesFromSideObject(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByGift(const aENPlanWork: ENPlanWork): Integer; stdcall;
    function addByAVR16(const aENPlanWork: ENPlanWork): Integer; stdcall;

    procedure finishPlanWork(planCode: Integer); stdcall;

    procedure undoFinishPlanWork(planCode: Integer); stdcall;

    function addByWritingOffProtection(const aENPlanWork: ENPlanWork): Integer; stdcall;

    function getFilteredCodeArray(const aENPlanWorkFilter: ENPlanWorkFilter): ArrayOfInteger; stdcall;

    procedure recalcTotalTime(const aPlanCode: Integer); stdcall;

    function addPlanByTechConditions(const aENPlanWork: ENPlanWork; const techCondServicesCode: Integer): Integer; stdcall;

    function getTechConditionsPlanList(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;
    procedure saveComment(const aENPlanWorkCode: Integer; const comment: WideString); stdcall;

    function copyPlanForTemplate(const aPlanCode: Integer; const aNewPlan: ENPlanWork): Integer; stdcall;
    procedure changeInvestDescription(const aENPlanWorkCode: Integer; const description: WideString); stdcall;
    procedure changeInvestAmount(const aENPlanWorkCode: Integer; const investWorksAmount: TXSDecimal); stdcall;
    procedure changeInvestStartDate(const aENPlanWorkCode: Integer; const investWorksStartDate: TXSDateTime); stdcall;
    procedure changeInvestMeasurement(const aENPlanWorkCode: Integer; const investWorkMeasCode: Integer); stdcall;

    procedure saveAddInfoExecutorDepartment(const aENPlanWork: ENPlanWork); stdcall;
    function getBufetOrderList(const aDate:TXSDate;const aType:Integer):BufetOrderShortList; stdcall;
    function getBufetOrderMaterialList(const aDate:TXSDate):BufetOrderShortList; stdcall;
    function getBufetPlanMenuOrderList(const aDate:TXSDate;const aType:Integer):BufetOrderShortList; stdcall;
    procedure import2Bufet(const aENPlanWorkCode: Integer;const numberDoc: WideString;const typeCode:Integer); stdcall;
    procedure importOrderBufet(const aENPlanWorkCode: Integer;const numberDoc: WideString); stdcall;
    procedure export2BufetVtrati(const aPlanCode: Integer); stdcall;

    // ENPlanWork. Общий (упрощенный) Список планов  
    function getPlanWorkGeneralList(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;
    procedure addPlan2TechConditions(const aENPlanWork: ENPlanWork; const techCondServicesCode: Integer); stdcall;
    procedure removePlanFromTechConditions(const aENPlanWork: ENPlanWork; const techCondServicesCode: Integer); stdcall;

    // Копирование плана для договора на присоединение
    function copyPlanPriconnections(const planCode: Integer; monthGen: Integer; yearGen: Integer;
        soCode: Integer; elementCode: Integer): Integer; stdcall;
    // изменение раздела и пункта ИП на плане
    procedure updateInvestProgramData(const enplanworkcode: Integer; invgroupcode :Integer ; edtInvestItemNumber : String); stdcall;

    procedure changeObjectForCallCenterAVRPlan(const aENPlanWork: ENPlanWork); stdcall;
    procedure editENIPImplementationType(const objPlanCode: Integer; const ipImplementationTypeCode: Integer ); stdcall;
    function  getScrollableFilteredListIPitem2plan(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;

    procedure setCauseDisconnectionOn(const planCode: Integer ); stdcall;
	  procedure setCauseDisconnectionOff(const planCode: Integer ); stdcall;
    procedure checkCauseDisconnectionOn(const aENPlanWork: ENPlanWork); stdcall;

    // Возвращает код месячного плана по коду любого плана
    function getMonthPlanCodeByAnyPlanCode(const planCode : Integer; const isException : Boolean): Integer; stdcall;

	  // Создание плана на услуги по договору на тех.надзор к договору на присоединение
    function creatingPlanForServicesByTechAgreement(const finDocID : Integer; const techCondServicesCode: Integer) : Integer; stdcall;

    // Изменение объекта планирования
    procedure changeObjectOfPlanning(const aENPlanWork: ENPlanWork); stdcall;
    // Изменение типа акта
    procedure changePlanState(const aENPlanWork: ENPlanWork); stdcall;
    // Изменение вида работ
    procedure changePlanWorkForm(const aENPlanWork: ENPlanWork); stdcall;

    procedure changePlanDateForByt(const aPlanCode: Integer; const aNewDate: TXSDate); stdcall;

    function  addPlanByShiftLinesServices(const aENPlanWork: ENPlanWork; const servicesObjectCode: Integer):Integer; stdcall;
    procedure addPlan2ShiftLineServices(const aENPlanWork: ENPlanWork; const servicesObjectCode: Integer); stdcall;

    procedure recalcPlanworkItemAndHumenItemsByPlanItemCode(planworkItemCode: Integer); stdcall;

    function addPlanByTechConditionsAndServicesFromSide(const aENPlanWork: ENPlanWork; const techCondServicesCode: Integer; const servicesFromSide: Integer): Integer; stdcall;

    function isPlanForRepairRequest(const aENPlanWork: ENPlanWork): Boolean; stdcall;

    function  getScrollableFilteredListServicesFromSide(const aENPlanWorkFilter: ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkShortList; stdcall;

    procedure removePlan2Rent(const aENPlanWork: ENPlanWork; const servicesObjectCode: Integer); stdcall;

  end;


implementation

  destructor ENPlanWork.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdistanceAlong) then
      distanceAlong.Free;
    if Assigned(FdistanceTo) then
      distanceTo.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FdateEndPriConnection) then
      dateEndPriConnection.Free;
    if Assigned(FinvestWorksAmount) then
      investWorksAmount.Free;
    if Assigned(FinvestDateStartWork) then
      investDateStartWork.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(Fkind) then
      kind.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FfinExecutor) then
      finExecutor.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    if Assigned(FformRef) then
      formRef.Free;
    if Assigned(FsourceRef) then
      sourceRef.Free;
    if Assigned(FddsCodes) then
      ddsCodes.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FresponsibilityRef) then
      responsibilityRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FinvgroupRef) then
      invgroupRef.Free;
    if Assigned(FipImplementTypeRef) then
      ipImplementTypeRef.Free;
    inherited Destroy;
  end;


  destructor BufetOrderShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(Fsum) then
      sum.Free;
    inherited Destroy;
  end;


 destructor BufetOrderShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;


{
  destructor ENPlanWorkFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdistanceAlong) then
      distanceAlong.Free;
    if Assigned(FdistanceTo) then
      distanceTo.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FdateEndPriConnection) then
      dateEndPriConnection.Free;
    if Assigned(FinvestWorksAmount) then
      investWorksAmount.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(Fkind) then
      kind.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FfinExecutor) then
      finExecutor.Free;
    if Assigned(FstateRef) then
      stateRef.Free;
    if Assigned(FformRef) then
      formRef.Free;
    if Assigned(FsourceRef) then
      sourceRef.Free;
    if Assigned(FddsCodes) then
      ddsCodes.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FresponsibilityRef) then
      responsibilityRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FinvgroupRef) then
      invgroupRef.Free;
    if Assigned(FipImplementTypeRef) then
      ipImplementTypeRef.Free;
    inherited Destroy;
  end;
}
  
  destructor ENPlanWorkFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWorkShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FdateEndPriConnection) then
      dateEndPriConnection.Free;
    if Assigned(FtotalTimeHours) then
      totalTimeHours.Free;
    if Assigned(FtotalTimeDays) then
      totalTimeDays.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    if Assigned(FresponsibilityRefDateStart) then
      responsibilityRefDateStart.Free;
    if Assigned(FresponsibilityRefDateFinal) then
      responsibilityRefDateFinal.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end; 

  destructor ENPlanWorkBillingShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateWorkOrder) then
      dateWorkOrder.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    if Assigned(FresponsibilityRefDateStart) then
      responsibilityRefDateStart.Free;
    if Assigned(FresponsibilityRefDateFinal) then
      responsibilityRefDateFinal.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;


  destructor ENPlanWorkShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor ENPlanWorkBillingShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;


  destructor ENPlanWorkItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FnormOfTime) then
      normOfTime.Free;
    if Assigned(FcostServicesFS) then
      costServicesFS.Free;
    if Assigned(Fkoef) then
      koef.Free;

    inherited Destroy;
  end;


///////////////////////////
  destructor ENMaterialsShort.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FsumCost) then
      sumCost.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    inherited Destroy;
  end;

  destructor ENMaterialsShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;
///////////////////////////

initialization

  RemClassRegistry.RegisterXSClass(ENPlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork');
  RemClassRegistry.RegisterXSClass(ENPlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkShort');

  RemClassRegistry.RegisterXSClass(ENPlanWorkBillingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkBillingShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkBillingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkBillingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkBillingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkBillingShort');

  RemClassRegistry.RegisterXSClass(BufetOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'BufetOrderShort');
  RemClassRegistry.RegisterXSClass(BufetOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'BufetOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfBufetOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfBufetOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENPlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENPlanWorkController/action/ENPlanWorkController.%operationName%');

  RemClassRegistry.RegisterXSClass(ENPlanWorkItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemShort');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItemShort');

end.
