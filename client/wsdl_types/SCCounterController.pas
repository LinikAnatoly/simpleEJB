unit SCCounterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCCounterStatusController 
   ,ENEstimateItemController 
   ,SCCounterKindController
   , ENMetrologyCounterController
   , RQStorageZoneController
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

  SCCounter            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounter = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    FdateCheck : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer; 
    FcounterType : WideString;
    FinstallOrderNumber : WideString;
    Freading : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
    Fphasity : TXSDecimal;
//???
    FstatusRef : SCCounterStatusRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FkindRef : SCCounterKindRef;
//???
    FzoneRef : RQStorageZoneRef;
	Fisliquid :Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property dateCheck : TXSDate read FdateCheck write FdateCheck;
    property cost : TXSDecimal read Fcost write Fcost;
    property  scCode : Integer read FscCode write FscCode;
    property counterType : WideString read FcounterType write FcounterType;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property reading : WideString read Freading write Freading;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : SCCounterStatusRef read FstatusRef write FstatusRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property kindRef : SCCounterKindRef read FkindRef write FkindRef;
    property phasity : TXSDecimal read Fphasity write Fphasity;
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef;
	property isliquid : Integer read Fisliquid write Fisliquid;
  end;
  
{
  SCCounterFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    FdateCheck : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer; 
    FcounterType : WideString;
    FinstallOrderNumber : WideString;
    Freading : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FstatusRef : SCCounterStatusRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FkindRef : SCCounterKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property dateCheck : TXSDate read FdateCheck write FdateCheck;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  scCode : Integer read FscCode write FscCode; 
    property counterType : WideString read FcounterType write FcounterType;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property reading : WideString read Freading write Freading;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property statusRef : SCCounterStatusRef read FstatusRef write FstatusRef; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property kindRef : SCCounterKindRef read FkindRef write FkindRef; 
  end;
}

  SCCounterFilter = class(SCCounter)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCCounterShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FdateIn : TXSDate;	
    FdateBuild : TXSDate;	
    FdateCheck : TXSDate;	
    Fcost : TXSDecimal;
    FscCode : Integer; 
    FcounterType : WideString;
    FinstallOrderNumber : WideString;
    Freading : WideString;
    FdateEdit : TXSDateTime;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FestimateItemRefCode : Integer; 
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefDeliveryTime : Integer; 
    FestimateItemRefUseWorkTime : Integer; 
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FkindRefCode : Integer; 
    FkindRefName : WideString;
    FzoneRefCode : Integer;
    FzoneRefName : WideString;
    Fphasity : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property dateCheck : TXSDate read FdateCheck write FdateCheck;
    property cost : TXSDecimal read Fcost write Fcost; 
    property  scCode : Integer read FscCode write FscCode; 
    property counterType : WideString read FcounterType write FcounterType;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property reading : WideString read Freading write Freading;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime; 
    property estimateItemRefUseWorkTime : Integer read FestimateItemRefUseWorkTime write FestimateItemRefUseWorkTime; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode;
    property zoneRefName : WideString read FzoneRefName write FzoneRefName;
    property phasity : TXSDecimal read Fphasity write Fphasity;
  end;

  ArrayOfSCCounterShort = array of SCCounterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCCounterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCCounterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCCounterShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCCounterController/message/
  // soapAction: http://ksoe.org/SCCounterController/action/SCCounterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCCounterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCCounterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCCounterControllerSoapPort = interface(IInvokable)
  ['{1a501a50-1a50-1a50-1a50-1a501a501a50}']
    function  add(const aSCCounter: SCCounter): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCCounter: SCCounter); stdcall;
    function  getObject(const anObjectCode: Integer): SCCounter; stdcall;
    function  getList: SCCounterShortList; stdcall;
    function  getFilteredList(const aSCCounterFilter: SCCounterFilter): SCCounterShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCCounterShortList; stdcall;
    function  getScrollableFilteredList(const aSCCounterFilter: SCCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): SCCounterShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCCounterShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCCounterFilter: SCCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    procedure installCounter(const planCode : Integer; const kartaRefCode : Integer; const tabNumber : Integer; const counter : SCCounter ); stdcall;
    procedure  undoInstallCounter(const counter : SCCounter); stdcall;

    procedure unInstallCounter(const planCode : Integer; const kartaRefCode : Integer; const tabNumber : String;
      const counter : SCCounter; isPass : Integer); stdcall;
    procedure unInstallCounterManually(const planCode : Integer; const kartaRefCode : Integer; const tabNumber : String;
      const counter : SCCounter); stdcall;


    procedure addCountersForWriteOff(const counters : ArrayOfENMetrologyCounters); stdcall;
    procedure removeCountersForWriteOff(const codes : ArrayOfInteger); stdcall;

    procedure removeCountersForBilling(const codes : ArrayOfInteger); stdcall;
    procedure removeCounterUnmountedManually(const code : Integer); stdcall;

    function getCounterForServicesObject(const aQuantity: Integer): SCCounterShortList; stdcall; overload;
    function getCounterForServicesObject(const aQuantity: Integer; showForCanceled: Boolean): SCCounterShortList; stdcall; overload;
  end;


implementation

  destructor SCCounter.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdateCheck) then
      dateCheck.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCCounterFilter.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdateCheck) then
      dateCheck.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCCounterFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCCounterShort.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(FdateCheck) then
      dateCheck.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor SCCounterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCCounter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounter');
  RemClassRegistry.RegisterXSClass(SCCounterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterRef');
  RemClassRegistry.RegisterXSClass(SCCounterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterFilter');
  RemClassRegistry.RegisterXSClass(SCCounterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterShort');
  RemClassRegistry.RegisterXSClass(SCCounterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCCounterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCCounterShort');

  InvRegistry.RegisterInterface(TypeInfo(SCCounterControllerSoapPort), 'http://ksoe.org/SCCounterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCCounterControllerSoapPort), 'http://ksoe.org/SCCounterController/action/SCCounterController.%operationName%');


end.
