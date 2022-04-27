unit FINWorkerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,FINWorkerKindController
   ,FINChargeTypeController
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

  FINWorker            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINWorkerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINWorker = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtabNumber : WideString;
    FpositionName : WideString;
    FpositionCode : Integer;
    FdepartmentName : WideString;
    FdepartmentCode : WideString;
    FpriceGen : TXSDecimal;
    Fcategor : Integer;
    FfinCode : Integer;
    FisSentAssignment : Integer;
    FchargePercent : TXSDecimal;
    FcategorId : Integer;
    FcategorName : WideString;
    FworkTimeId : WideString;
    Fdomain_info : WideString;
    FpositionId : WideString;
    Fmodify_time : Int64;
//???
    FkindRef : FINWorkerKindRef;
//???
    FchargeRef : FINChargeTypeRef;
    FIdentityCardCode_RU : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionName : WideString read FpositionName write FpositionName;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentCode : WideString read FdepartmentCode write FdepartmentCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property  categor : Integer read Fcategor write Fcategor;
    property  finCode : Integer read FfinCode write FfinCode;
    property  isSentAssignment : Integer read FisSentAssignment write FisSentAssignment;
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent;
    property  categorId : Integer read FcategorId write FcategorId;
    property categorName : WideString read FcategorName write FcategorName;
    property workTimeId : WideString read FworkTimeId write FworkTimeId;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property positionId : WideString read FpositionId write FpositionId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property kindRef : FINWorkerKindRef read FkindRef write FkindRef;
    property chargeRef : FINChargeTypeRef read FchargeRef write FchargeRef;
    property IdentityCardCode_RU : WideString read FIdentityCardCode_RU write FIdentityCardCode_RU;
  end;

{
  FINWorkerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FtabNumber : WideString;
    FpositionName : WideString;
    FpositionCode : Integer;
    FdepartmentName : WideString;
    FdepartmentCode : WideString;
    FpriceGen : TXSDecimal;
    Fcategor : Integer;
    FfinCode : Integer;
    FisSentAssignment : Integer;
    FchargePercent : TXSDecimal;
    FcategorId : Integer;
    FcategorName : WideString;
    FworkTimeId : WideString;
    Fdomain_info : WideString;
    FpositionId : WideString;
    Fmodify_time : Int64;
//???
    FkindRef : FINWorkerKindRef;
//???
    FchargeRef : FINChargeTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionName : WideString read FpositionName write FpositionName;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentCode : WideString read FdepartmentCode write FdepartmentCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property  categor : Integer read Fcategor write Fcategor;
    property  finCode : Integer read FfinCode write FfinCode;
    property  isSentAssignment : Integer read FisSentAssignment write FisSentAssignment;
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent;
    property  categorId : Integer read FcategorId write FcategorId;
    property categorName : WideString read FcategorName write FcategorName;
    property workTimeId : WideString read FworkTimeId write FworkTimeId;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property positionId : WideString read FpositionId write FpositionId;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property kindRef : FINWorkerKindRef read FkindRef write FkindRef;
    property chargeRef : FINChargeTypeRef read FchargeRef write FchargeRef;
  end;
}

  FINWorkerFilter = class(FINWorker)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINWorkerShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtabNumber : WideString;
    FpositionName : WideString;
    FpositionCode : Integer;
    FdepartmentName : WideString;
    FdepartmentCode : WideString;
    FpriceGen : TXSDecimal;
    Fcategor : Integer;
    FfinCode : Integer;
    FisSentAssignment : Integer;
    FchargePercent : TXSDecimal;
    FcategorId : Integer;
    FcategorName : WideString;
    FworkTimeId : WideString;
    FpositionId : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
    FchargeRefCode : Integer;
    FchargeRefName : WideString;
    Fdoljnostid : Integer;
    Fcehid : Integer;
    ///// SUPP-16692 Часы загрузки работника по планам на заданную дату
    FworkLoad : TXSDecimal;
    /////
    FidentityCardCode_RU : WideString;
    FidentityCardSeries_RU: WideString;
    FidentityCardNumber_RU : WideString;
	  FidentityCardIssueDate_RU : WideString;
	  FidentityCardIssueBy_RU : WideString;
	  FnameAlias: WideString;
	  FlastName: WideString;
	  FfirstName: WideString;
	  FmiddleName: WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionName : WideString read FpositionName write FpositionName;
    property  positionCode : Integer read FpositionCode write FpositionCode;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentCode : WideString read FdepartmentCode write FdepartmentCode;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property  categor : Integer read Fcategor write Fcategor;
    property  finCode : Integer read FfinCode write FfinCode;
    property  isSentAssignment : Integer read FisSentAssignment write FisSentAssignment;
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent;
    property  categorId : Integer read FcategorId write FcategorId;
    property categorName : WideString read FcategorName write FcategorName;
    property workTimeId : WideString read FworkTimeId write FworkTimeId;
    property positionId : WideString read FpositionId write FpositionId;

    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    property chargeRefCode : Integer read FchargeRefCode write FchargeRefCode;
    property chargeRefName : WideString read FchargeRefName write FchargeRefName;
    property doljnostid : Integer read Fdoljnostid write Fdoljnostid;
    property cehid : Integer read Fcehid write Fcehid;
    ///// SUPP-16692 Часы загрузки работника по планам на заданную дату
    property workLoad : TXSDecimal read FworkLoad write FworkLoad;
    /////
    property identityCardCode_RU : WideString read FidentityCardCode_RU write FidentityCardCode_RU;
    property identityCardSeries_RU: WideString read FidentityCardSeries_RU write FidentityCardSeries_RU;
    property identityCardNumber_RU : WideString read FidentityCardNumber_RU write FidentityCardNumber_RU;
	  property identityCardIssueDate_RU : WideString read FidentityCardIssueDate_RU write FidentityCardIssueDate_RU;
	  property identityCardIssueBy_RU : WideString read FidentityCardIssueBy_RU write FidentityCardIssueBy_RU;
	  property nameAlias: WideString read FnameAlias write FnameAlias;
	  property lastName: WideString read FlastName write FlastName;
	  property firstName: WideString read FfirstName write FfirstName;
	  property middleName: WideString read FmiddleName write FmiddleName;
  end;

  ArrayOfFINWorkerShort = array of FINWorkerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINWorkerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINWorkerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINWorkerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINWorkerController/message/
  // soapAction: http://ksoe.org/FINWorkerController/action/FINWorkerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINWorkerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINWorkerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINWorkerControllerSoapPort = interface(IInvokable)
  ['{2F7DFCA5-5D2D-40C9-BC65-F14DCF32C4A2}']
    function add(const aFINWorker: FINWorker): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINWorker: FINWorker); stdcall;
    function getObject(const anObjectCode: Integer): FINWorker; stdcall;
    function getList: FINWorkerShortList; stdcall;
    function getFilteredList(const aFINWorkerFilter: FINWorkerFilter): FINWorkerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINWorkerShortList; stdcall;
    function getScrollableFilteredList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINWorkerShort; stdcall;

    function getWorkerList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerShortList; stdcall; overload;
    function getWorkerList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer; const dateGet : TXSDate): FINWorkerShortList; stdcall; overload;
    function getWorkerList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer; const aIsShowCEO: Boolean): FINWorkerShortList; stdcall; overload;
    function getWorkerList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer; const dateGet : TXSDate; const aIsShowCEO : Boolean): FINWorkerShortList; stdcall; overload;
    function getFINWorkerListWithWorkLoad(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer; const dateGet : TXSDate; const aIsShowCEO : Boolean): FINWorkerShortList; stdcall; overload;
    function getFINWorkerByTechCondResponsibleList(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer): FINWorkerShortList; stdcall;
    function getWorkerListForReport(const aFINWorkerFilter: FINWorkerFilter; const aFromPosition: Integer; const aQuantity: Integer; const aIsShowCEO: Boolean): FINWorkerShortList; stdcall; overload;
    function getFINWorkerListForENWarrant(const aFINWorkerFilter: FINWorkerFilter): FINWorkerShortList; stdcall; overload;

  end;


implementation

  destructor FINWorker.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FchargePercent) then
      chargePercent.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FchargeRef) then
      chargeRef.Free;
    inherited Destroy;
  end;

{
  destructor FINWorkerFilter.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FchargePercent) then
      chargePercent.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(FchargeRef) then
      chargeRef.Free;
    inherited Destroy;
  end;
}

  destructor FINWorkerFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FINWorkerShort.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FchargePercent) then
      chargePercent.Free;
    inherited Destroy;
  end;

  destructor FINWorkerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINWorker, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorker');
  RemClassRegistry.RegisterXSClass(FINWorkerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerRef');
  RemClassRegistry.RegisterXSClass(FINWorkerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerFilter');
  RemClassRegistry.RegisterXSClass(FINWorkerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerShort');
  RemClassRegistry.RegisterXSClass(FINWorkerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINWorkerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINWorkerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINWorkerShort');

  InvRegistry.RegisterInterface(TypeInfo(FINWorkerControllerSoapPort), 'http://ksoe.org/FINWorkerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINWorkerControllerSoapPort), 'http://ksoe.org/FINWorkerController/action/FINWorkerController.%operationName%');


end.
