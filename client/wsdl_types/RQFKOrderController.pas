unit RQFKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderKindController 
   ,RQFKOrderStatusController 
   ,RQOrgController 
   ,ENDepartmentController 
   ,TKTransportRealController 
   ,TKAccountingTypeController
   ,FKProvObjectController 
   ,RQStorageController
   ,RQFKOrderTypeController
   ,DFDocSignerController
   ,ENGeographicDepartmentController
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

  RQFKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FdateGen : TXSDate;
    FdateShipment : TXSDate;
    FmolOutCode : WideString;
    FmolOutName : WideString;
    FmolInCode : WideString;
    FmolInName : WideString;
    FexpeditorCode : WideString;
    FexpeditorName : WideString;
    FwarrantNumber : WideString;
    FwarrantDate : TXSDate;
    FwarrantFIO : WideString;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FndsPercent : Integer; 
    FpercentProfits : TXSDecimal;
    FcommentGen : WideString;
    Faccount : WideString;
    Fkod_podr : WideString;
    Fname_podr : WideString;
    FdateAdd : TXSDateTime;
    FuserAdd : WideString;
    FdateEdit : TXSDateTime;	
    FdatePosting : TXSDate;
    FisPalletized : Integer;
    FpalletNumber : WideString;
    FisByOrder : Integer;
    ForderInfo : WideString;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FdateDelivery : TXSDate;
    FisMaterialsSent : Integer;
    FcheckedByAccountant : TXSBoolean;
//???
    Fkind : RQFKOrderKind;
//???
    Fstatus : RQFKOrderStatus;
//???
    Forg : RQOrg;
//???
    Fdepartment : ENDepartment;
//???
    FtransportReal : TKTransportReal;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
//???
    FstorageRef : RQStorageRef;
//???
    FtypeRef : RQFKOrderType;
//???
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateShipment : TXSDate read FdateShipment write FdateShipment;
    property molOutCode : WideString read FmolOutCode write FmolOutCode;
    property molOutName : WideString read FmolOutName write FmolOutName;
    property molInCode : WideString read FmolInCode write FmolInCode;
    property molInName : WideString read FmolInName write FmolInName;
    property expeditorCode : WideString read FexpeditorCode write FexpeditorCode;
    property expeditorName : WideString read FexpeditorName write FexpeditorName;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property  ndsPercent : Integer read FndsPercent write FndsPercent; 
    property percentProfits : TXSDecimal read FpercentProfits write FpercentProfits; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property account : WideString read Faccount write Faccount;
    property kod_podr : WideString read Fkod_podr write Fkod_podr;
    property name_podr : WideString read Fname_podr write Fname_podr;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property isPalletized : Integer read FisPalletized write FisPalletized;
    property palletNumber : WideString read FpalletNumber write FpalletNumber;
    property  isByOrder : Integer read FisByOrder write FisByOrder;
    property orderInfo : WideString read ForderInfo write ForderInfo;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property dateDelivery : TXSDate read FdateDelivery write FdateDelivery;
    property kind : RQFKOrderKind read Fkind write Fkind; 
    property status : RQFKOrderStatus read Fstatus write Fstatus; 
    property org : RQOrg read Forg write Forg;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property transportReal : TKTransportReal read FtransportReal write FtransportReal; 
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef;
    property storageRef : RQStorageRef read FstorageRef write FstorageRef;
    property isMaterialsSent : Integer read FisMaterialsSent write FisMaterialsSent;
    property checkedByAccountant : TXSBoolean read FcheckedByAccountant write FcheckedByAccountant;
    property typeRef : RQFKOrderType read FtypeRef write FtypeRef;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
end;

  RQFKOrderFilter = class(RQFKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FdateGen : TXSDate;	
    FdateShipment : TXSDate;	
    FmolOutCode : WideString;
    FmolOutName : WideString;
    FmolInCode : WideString;
    FmolInName : WideString;
    FexpeditorCode : WideString;
    FexpeditorName : WideString;
    FwarrantNumber : WideString;
    FwarrantDate : TXSDate;	
    FwarrantFIO : WideString;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FndsPercent : Integer; 
    FpercentProfits : TXSDecimal;
    Faccount : WideString;
    Fkod_podr : WideString;
    Fname_podr : WideString;
    FdateAdd : TXSDateTime;
    FuserAdd : WideString;
    FdateEdit : TXSDateTime;
    FdatePosting : TXSDate;	
    FtotalWeight : TXSDecimal;
    FuserGen : WideString;
    FkindCode : Integer; 
    FkindName : WideString;
    FkindTxtGen : WideString;
    FstatusCode : Integer; 
    FstatusName : WideString;
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
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FtransportRealCode : Integer; 
    FtransportRealName : WideString;
    FtransportRealInvNumber : WideString;
    FtransportRealGosNumber : WideString;
    FaccountingTypeRefCode : Integer; 
    FaccountingTypeRefName : WideString;
    FstorageRefCode : Integer; 
    FstorageRefName : WideString;
    FstorageRefShortName : WideString;
    FstorageRefDescription : WideString;
    FstorageRefUserGen : WideString;
    FstorageRefDateEdit : TXSDateTime;
    FisPalletized : Integer;
    FpalletNumber : WideString;
    FisByOrder : Integer;
    ForderInfo : WideString;
    FdateDelivery : TXSDate;
    FisMaterialsSent : Integer;
    FcheckedByAccountant : TXSBoolean;
    FtypeRefCode: Integer;
    FtypeRefName : WideString;
    FgeoDepartmentRefCode : Integer;
    FgeoDepartmentRefName : WideString;
    FgeoDepartmentRefCommentgen : WideString;
    FgeoDepartmentRefUserAdd : WideString;
    FgeoDepartmentRefDateAdd : TXSDateTime;
    FgeoDepartmentRefUserGen : WideString;
    FgeoDepartmentRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateShipment : TXSDate read FdateShipment write FdateShipment;
    property molOutCode : WideString read FmolOutCode write FmolOutCode;
    property molOutName : WideString read FmolOutName write FmolOutName;
    property molInCode : WideString read FmolInCode write FmolInCode;
    property molInName : WideString read FmolInName write FmolInName;
    property expeditorCode : WideString read FexpeditorCode write FexpeditorCode;
    property expeditorName : WideString read FexpeditorName write FexpeditorName;
    property warrantNumber : WideString read FwarrantNumber write FwarrantNumber;
    property warrantDate : TXSDate read FwarrantDate write FwarrantDate;
    property warrantFIO : WideString read FwarrantFIO write FwarrantFIO;
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property  ndsPercent : Integer read FndsPercent write FndsPercent; 
    property percentProfits : TXSDecimal read FpercentProfits write FpercentProfits; 
    property account : WideString read Faccount write Faccount;
    property kod_podr : WideString read Fkod_podr write Fkod_podr;
    property name_podr : WideString read Fname_podr write Fname_podr;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property totalWeight : TXSDecimal read FtotalWeight write FtotalWeight;
    property userGen : WideString read FuserGen write FuserGen;

    property kindCode : Integer read FkindCode write FkindCode; 
    property kindName : WideString read FkindName write FkindName; 
    property kindTxtGen : WideString read FkindTxtGen write FkindTxtGen;
    property statusCode : Integer read FstatusCode write FstatusCode; 
    property statusName : WideString read FstatusName write FstatusName; 
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
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property transportRealCode : Integer read FtransportRealCode write FtransportRealCode; 
    property transportRealName : WideString read FtransportRealName write FtransportRealName; 
    property transportRealInvNumber : WideString read FtransportRealInvNumber write FtransportRealInvNumber; 
    property transportRealGosNumber : WideString read FtransportRealGosNumber write FtransportRealGosNumber; 
    property accountingTypeRefCode : Integer read FaccountingTypeRefCode write FaccountingTypeRefCode; 
    property accountingTypeRefName : WideString read FaccountingTypeRefName write FaccountingTypeRefName; 
    property storageRefCode : Integer read FstorageRefCode write FstorageRefCode; 
    property storageRefName : WideString read FstorageRefName write FstorageRefName; 
    property storageRefShortName : WideString read FstorageRefShortName write FstorageRefShortName; 
    property storageRefDescription : WideString read FstorageRefDescription write FstorageRefDescription; 
    property storageRefUserGen : WideString read FstorageRefUserGen write FstorageRefUserGen; 
    property storageRefDateEdit : TXSDateTime read FstorageRefDateEdit write FstorageRefDateEdit;
    property isPalletized : Integer read FisPalletized write FisPalletized;
    property palletNumber : WideString read FpalletNumber write FpalletNumber;
    property  isByOrder : Integer read FisByOrder write FisByOrder;
    property orderInfo : WideString read ForderInfo write ForderInfo;
    property dateDelivery : TXSDate read FdateDelivery write FdateDelivery;
    property checkedByAccountant : TXSBoolean read FcheckedByAccountant write FcheckedByAccountant;

    property isMaterialsSent : Integer read FisMaterialsSent write FisMaterialsSent;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property geoDepartmentRefCode : Integer read FgeoDepartmentRefCode write FgeoDepartmentRefCode;
    property geoDepartmentRefName : WideString read FgeoDepartmentRefName write FgeoDepartmentRefName;
    property geoDepartmentRefCommentgen : WideString read FgeoDepartmentRefCommentgen write FgeoDepartmentRefCommentgen;
    property geoDepartmentRefUserAdd : WideString read FgeoDepartmentRefUserAdd write FgeoDepartmentRefUserAdd;
    property geoDepartmentRefDateAdd : TXSDateTime read FgeoDepartmentRefDateAdd write FgeoDepartmentRefDateAdd;
    property geoDepartmentRefUserGen : WideString read FgeoDepartmentRefUserGen write FgeoDepartmentRefUserGen;
    property geoDepartmentRefDateEdit : TXSDateTime read FgeoDepartmentRefDateEdit write FgeoDepartmentRefDateEdit;
  end;

  ArrayOfRQFKOrderShort = array of RQFKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderController/message/
  // soapAction: http://ksoe.org/RQFKOrderController/action/RQFKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderControllerSoapPort = interface(IInvokable)
  ['{DF63148F-7F20-4F12-9927-78DFF5DAC83E}']
    function  add_no_using(const aRQFKOrder: RQFKOrder): Integer; stdcall;

    function  add(const aRQFKOrder: RQFKOrder): Integer; overload; stdcall;
    function  add(const aRQFKOrder: RQFKOrder; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    procedure remove(const anObjectCode: Integer); overload; stdcall;
    procedure remove(const anObjectCode: Integer; isAllocationList : Boolean; isAutoBindingVRTU : Boolean); overload; stdcall;

    procedure save(const aRQFKOrder: RQFKOrder); overload; stdcall;
    procedure save(const aRQFKOrder: RQFKOrder; const dfDocSigners: ArrayOfDFDocSigner); overload; stdcall;

    function  getObject(const anObjectCode: Integer): RQFKOrder; stdcall;
    function  getList: RQFKOrderShortList; stdcall;
    function  getFilteredList(const aRQFKOrderFilter: RQFKOrderFilter): RQFKOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderFilter: RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKOrderFilter: RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;


    function getPartyFromFKOrderByEstimateFromCurrentPlan(const estimateCode: Integer) : String ; stdcall;
    //function addFromInvoice(const aRQFKOrder: RQFKOrder; invoiceCode : Integer): Integer; stdcall;

    procedure createdPrihod(const rqfkCode : Integer); overload; stdcall;
    procedure movePrihodToFK_(const rqfkCode : Integer); stdcall;
    procedure createdPrihod(const rqfkCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure moveForWorkOnWarehouse(const rqfkCode : Integer); overload; stdcall;

    procedure unCreatedPrihod(const rqfkCode : Integer); overload; stdcall;
    procedure unCreatedPrihod(const rqfkCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure unMovePrihodToFK_(const rqfkCode : Integer); stdcall;
    procedure unMoveForWorkOnWarehouse(const rqfkCode : Integer); overload; stdcall;

    procedure unMoveByEcp(const rqfkCode : Integer); stdcall;

    function  addSklad2REM(const aRQFKOrder: RQFKOrder): Integer; overload; stdcall;
    function  addSklad2REM(const aRQFKOrder: RQFKOrder; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    function  addRem2MOL(const aRQFKOrder: RQFKOrder): Integer; stdcall;

    function addPrihod(const aRQFKOrder: RQFKOrder): Integer; overload; stdcall;
    function addPrihod(const aRQFKOrder: RQFKOrder; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    procedure movePrihodInFK(const rqfkCode : Integer); stdcall; overload;
    procedure movePrihodInFK(const rqfkCode : Integer; const isOS : Integer); stdcall; overload;  // для тупого изменения статуса если isOS = 1
    procedure moveRashodInFK(const rqfkCode : Integer); stdcall;

    procedure unMovePrihodInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodInFK(const rqfkCode : Integer); stdcall;

    function  addSCCounterMove(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveSCCounterMove(const aRQFKOrder: RQFKOrder); stdcall;
    procedure removeSCCounterMove(const rqfkCode : Integer); stdcall;

    procedure convertTranzit2Operative(estimateItemCode: Integer; dateStart, dateFinish: TXSDate; budgetCode, departmentCode: Integer; condition: String); stdcall;
    function createRQFKOrderForTranzit2Operative(molCode: String; molName: String; dateGen: TXSDate): Integer; stdcall;

    function  addOperative2Tranzit(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveRashodOperative2Tranzit(const aRQFKOrder: RQFKOrder); stdcall;
    procedure removeRashodOperative2Tranzit(const rqfkCode : Integer); stdcall; overload;
    procedure removeRashodOperative2Tranzit(const rqfkCode : Integer; isAllocationList : Boolean); stdcall; overload;
    procedure createdPrihodOperative2Tranzit(const rqfkCode : Integer); overload; stdcall;
    procedure unCreatedPrihodOperative2Tranzit(const rqfkCode : Integer); overload; stdcall;
    procedure createdPrihodOperative2Tranzit(const rqfkCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure unCreatedPrihodOperative2Tranzit(const rqfkCode : Integer; isAllocationList : Boolean); overload; stdcall;
    procedure moveRashodOperative2Tranzit(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodOperative2Tranzit(const rqfkCode : Integer); stdcall;

    function  addMeasurementChange(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveRashodMeasurementChange(const aRQFKOrder: RQFKOrder); stdcall;
    procedure removeRashodMeasurementChange(const rqfkCode : Integer); stdcall;
    procedure createdPrihodMeasurementChange(const rqfkCode : Integer); stdcall;
    procedure unCreatedPrihodMeasurementChange(const rqfkCode : Integer); stdcall;
    procedure moveRashodMeasurementChange(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodMeasurementChange(const rqfkCode : Integer); stdcall;


    function  addE2E(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveE2E(const aRQFKOrder: RQFKOrder); stdcall;
    procedure removeE2E(const rqfkCode : Integer); stdcall;
    procedure createdPrihodE2E(const rqfkCode : Integer); stdcall;
    procedure unCreatedPrihodE2E(const rqfkCode : Integer); stdcall;
    procedure moveRashodE2E(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodE2E(const rqfkCode : Integer); stdcall;

    procedure unMoveRashodInFKLoadMBP(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodInFKLoadMNMA(const rqfkCode : Integer); stdcall;

    function addLoadMBP(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    function addLoadMNMA(const aRQFKOrder: RQFKOrder): Integer; stdcall;

    procedure removeOrderLoadMBP(const rqfkCode : Integer); stdcall;
    procedure removeOrderLoadMNMA(const rqfkCode : Integer); stdcall;

    procedure saveOrderLoadMBP(const aRQFKOrder: RQFKOrder); stdcall;
    procedure saveOrderLoadMNMA(const aRQFKOrder: RQFKOrder); stdcall;

    procedure moveRashodInFKLoadMBP(const rqfkCode : Integer); stdcall;
    procedure moveRashodInFKLoadMNMA(const rqfkCode : Integer); stdcall;

    /////
    procedure unMoveRashodInFKMBP(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodInFKMNMA(const rqfkCode : Integer); stdcall;

    function addMBP(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    function addMNMA(const aRQFKOrder: RQFKOrder): Integer; stdcall;

    procedure removeOrderMBP(const rqfkCode : Integer); stdcall;
    procedure removeOrderMNMA(const rqfkCode : Integer); stdcall;

    procedure saveOrderMBP(const aRQFKOrder: RQFKOrder); stdcall;
    procedure saveOrderMNMA(const aRQFKOrder: RQFKOrder); stdcall;

    procedure moveRashodInFKMBP(const rqfkCode : Integer); stdcall;
    procedure moveRashodInFKMNMA(const rqfkCode : Integer); stdcall;

    function addOutMNMA(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure removeOrderOutMNMA(const rqfkCode : Integer); stdcall;
    procedure saveOrderOutMNMA(const aRQFKOrder: RQFKOrder); stdcall;
    procedure moveRashodOutInFKMNMA(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodOutInFKMNMA(const rqfkCode : Integer); stdcall;
    /////

    function addWhiteOffCounters(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure removeSCCounterWriteOff(const rqfkCode : Integer); stdcall;


    function addServicesFS(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveServicesFS(const aRQFKOrder: RQFKOrder); stdcall;
    procedure removeServicesFS(const rqfkCode : Integer); stdcall;
        procedure createActFromServicesFS(const rqfkCode : Integer; const cancelFinishedWorks : Boolean); stdcall; overload;
    procedure createActFromServicesFS(const rqfkCode : Integer); stdcall; overload;
    procedure unCreateActFromServicesFS(const rqfkCode : Integer); stdcall;

    function getFKOrderPostingsList(fkOrderCode: Integer): FKProvObjectShortList; stdcall; overload;
    function getFKOrderPostingsList(fkOrderCode: Integer; getPartIdFromThead : Boolean ): FKProvObjectShortList; stdcall; overload;
    function movePostingToFK(fkOrderCode: Integer; const isClient: Integer): FKProvResult; stdcall;
    procedure deletePostingFromFK(fkOrderCode: Integer; const isClient: Integer); stdcall;

    ///// 03.02.12
    function  addPrihodBufet(const aRQFKOrder: RQFKOrder): Integer; overload; stdcall;
    function  addPrihodBufet(const aRQFKOrder: RQFKOrder; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;
    procedure removePrihodBufet(const anObjectCode: Integer); stdcall;
    procedure movePrihodBufetInFK(const rqfkCode : Integer); stdcall;
    procedure unMovePrihodBufetInFK(const rqfkCode : Integer); stdcall;

    function  addRashodBufet(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure removeRashodBufet(const anObjectCode: Integer); stdcall;
    procedure moveRashodBufetInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodBufetInFK(const rqfkCode : Integer); stdcall;
    /////

    procedure changeDatePosting(const aRQFKOrder: RQFKOrder); stdcall;
    procedure changeDate(const aRQFKorder: RQFKOrder); stdcall;

    // 09.04.2012 +++ акты возврата товара
    function addRashodReturn(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure removeRashodReturn(const anObjectCode: Integer); stdcall;
    procedure moveRashodReturnInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodReturnInFK(const rqfkCode : Integer); stdcall;

    // 23.08.2012 Благодійна допомога
    function  addForGift(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveForGift(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeRashodGift(const anObjectCode: Integer); stdcall;
    procedure moveRashodGiftInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodGiftInFK(const rqfkCode : Integer); stdcall;

    function getListByTransportRoute(
      const aRQFKOrderFilter: RQFKOrderFilter;
      const anCondition: WideString;
      const anOrderBy: WideString;
      const aFromPosition: Integer;
      const aQuantity: Integer): RQFKOrderShortList; stdcall;

    function addForSale(const aRQFKOrder: RQFKOrder; const soCode: Integer): Integer; stdcall;
    function movePostingToFKForSale(fkOrderCode: Integer): FKProvResult; stdcall;

    procedure removeFromTransportRoutes(const fkOrderCode: Integer); stdcall;

    // Получение номера налоговой накладной
    function getFinTaxNumber(const taxDate: TXSDate) : String; stdcall;

    // Получение текущей бух. даты из ОС ФК
    function getCurrentBuhDate(): TXSDate; stdcall;

    /////
    // TEMP
    {
    procedure moveOSMovementToFK(const p_kod_inv: String;
                                 const p_new_kod_mol: String; const p_new_kod_podr: String;
                                 const p_new_kod_naklad: String;
                                 const p_new_dt_naklad: TXSDate;
                                 const p_new_primechan: String); stdcall;
    }

    // Ордера на ввод в эксплуатацию ОС
	  procedure moveOSExplToFK(const p_kod_inv: String;
      const p_kod_zatr: String; const p_kod_ist: String; const p_kod_subsch_b: String;
      const p_use_limit: Integer; const p_use_limit_n: Integer; const p_id_gr_nalog: Integer); stdcall; overload;

    function addOSExpl(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveOSExpl(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeOSExpl(const anObjectCode: Integer); stdcall;
    procedure moveOSExplToFK(const rqFKCode: Integer); stdcall; overload;
    procedure unMoveOSExplInFK(const rqFKCode: Integer); stdcall;
    /////

    // Ордера на внутреннее перемещение ОС
    function addOSMovement(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveOSMovement(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeOSMovement(const anObjectCode: Integer); stdcall;
    procedure moveOSMovementToFK(const rqFKCode: Integer); stdcall; overload;
    procedure unMoveOSMovementInFK(const rqFKCode: Integer); stdcall;
    /////

    function getOSCharacteristic(const aNum_un: Integer): String; stdcall;
    function getOSComment(const aNum_un: Integer): String; stdcall;

    procedure export2Bufet(const fkOrderCode:Integer); stdcall;

    procedure updateOSPodr(const aRQFKOrder: RQFKOrder); stdcall;

    // 23.08.2012 Переміщення на склад із зонами зберігання
    function  addForStorage(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveForStorage(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeRashodToStorage(const anObjectCode: Integer); overload; stdcall;
    procedure removeRashodToStorage(const anObjectCode: Integer; isAllocationList : Boolean); overload; stdcall;
    procedure moveRashodToStorageInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveRashodToStorageInFK(const rqfkCode : Integer); stdcall;

        // 04.04.2013 Переміщення між зонами зберігання
    function  addZoneChanging(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveZoneChanging(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeZoneChanging(const anObjectCode: Integer); stdcall;
    procedure moveZoneChangingInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveZoneChangingInFK(const rqfkCode : Integer); stdcall;

      // 24.09.2013 Переміщення палива
    function  addOutFuel(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveOutFuel(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeOutFuel(const anObjectCode: Integer); stdcall;
    procedure moveOutFuelInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveOutFuelInFK(const rqfkCode : Integer); stdcall;

    // NET-4400 Виведення матеріалів з аварійного запасу
    function  addAvarOut(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveAvarOut(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeAvarOut(const anObjectCode: Integer); stdcall;
    procedure moveAvarOutInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveAvarOutInFK(const rqfkCode : Integer); stdcall;

    // NET-4400 Введення матеріалів у аварійний запас
    function  addAvarIn(const aRQFKOrder: RQFKOrder): Integer; stdcall;
    procedure saveAvarIn(const aRQFKOrder: RQFKOrder) stdcall;
    procedure removeAvarIn(const anObjectCode: Integer); stdcall;
    procedure moveAvarInInFK(const rqfkCode : Integer); stdcall;
    procedure unMoveAvarInInFK(const rqfkCode : Integer); stdcall;

    function  getScrollableFilteredListNoSegr(const aRQFKOrderFilter: RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderShortList; stdcall;
    function  getObjectNoSegr(const anObjectCode: Integer): RQFKOrder; stdcall;
    //SUPP-30929
    procedure updateDateDelivery(const aRQFKOrder: RQFKOrder); stdcall;
    //NET-4451
    procedure updateIsSentMaterials(const aRQFKOrder: RQFKOrder); stdcall;

    procedure moveFromOperativeToTransitByMOLCode(const aDivCode: String); stdcall;
    // SUPP-68524 Взять или отменить ордер в работу/из работы на складе
    procedure moveOrUnmoveForWorkOnWarehouse(const fkOrderCode: Integer; const isMove : Boolean); stdcall;
	// SUPP-70367 Проставление или снятие признака "Проверено в бухгалтерии"
    procedure checkOrUncheckByAccountant(const fkOrderCode: Integer; const isChecked : Boolean); stdcall;

    function getReportsListForRQFKOrder(const aRQFKOrder: RQFKOrder): ArrayOfEPReportRequestEx; stdcall;
  end;


implementation

  destructor RQFKOrder.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateShipment) then
      dateShipment.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FpercentProfits) then
      percentProfits.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(Fkind) then
      kind.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FdateDelivery) then
      dateDelivery.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrderFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateShipment) then
      dateShipment.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FpercentProfits) then
      percentProfits.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(Fkind) then
      kind.Free;
    if Assigned(Fstatus) then
      status.Free;
    if Assigned(Forg) then
      org.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FtransportReal) then
      transportReal.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateShipment) then
      dateShipment.Free;
    if Assigned(FwarrantDate) then
      warrantDate.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FpercentProfits) then
      percentProfits.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(ForgDate_svidet) then
      orgDate_svidet.Free;
    if Assigned(ForgLikv_date) then
      orgLikv_date.Free;
    if Assigned(ForgDate_nalogform) then
      orgDate_nalogform.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FstorageRefDateEdit) then
      storageRefDateEdit.Free;
    if Assigned(FdateDelivery) then
      dateDelivery.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    if Assigned(FgeoDepartmentRefDateAdd) then
      geoDepartmentRefDateAdd.Free;
    if Assigned(FgeoDepartmentRefDateEdit) then
      geoDepartmentRefDateEdit.Free;
    inherited Destroy;
  end;
  
  destructor RQFKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder');
  RemClassRegistry.RegisterXSClass(RQFKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrderController/action/RQFKOrderController.%operationName%');




end.
