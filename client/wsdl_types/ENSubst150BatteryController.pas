unit ENSubst150BatteryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementController
  , TKMaterialsController
  , ENHighVoltHardwareTypeController
  , ENSubstation150Controller
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

  ENSubst150Battery            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150BatteryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150Battery = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fvoltage : TXSDecimal;
    Fcapacity : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FchargerTypeRef : ENHighVoltHardwareTypeRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property voltage : TXSDecimal read Fvoltage write Fvoltage;
    property capacity : TXSDecimal read Fcapacity write Fcapacity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property chargerTypeRef : ENHighVoltHardwareTypeRef read FchargerTypeRef write FchargerTypeRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;

{
  ENSubst150BatteryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fvoltage : TXSDecimal;
    Fcapacity : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FchargerTypeRef : ENHighVoltHardwareTypeRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property voltage : TXSDecimal read Fvoltage write Fvoltage;
    property capacity : TXSDecimal read Fcapacity write Fcapacity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property chargerTypeRef : ENHighVoltHardwareTypeRef read FchargerTypeRef write FchargerTypeRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;
}

  ENSubst150BatteryFilter = class(ENSubst150Battery)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150BatteryShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fvoltage : TXSDecimal;
    Fcapacity : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementCode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FtypeRefIsObsolete : Integer;
    FchargerTypeRefCode : Integer;
    FchargerTypeRefName : WideString;
    FchargerTypeRefIsObsolete : Integer;
    FsubstationRefCode : Integer;
    FsubstationRefName : WideString;
    FsubstationRefProjectPower : TXSDecimal;
    FsubstationRefOperativeService : WideString;
    FsubstationRefRepairService : WideString;
    FsubstationRefBuhName : WideString;
    FsubstationRefInvNumber : WideString;
    FsubstationRefSizCode : Integer;
    FsubstationRefMolCode : WideString;
    FsubstationRefMolName : WideString;
    FsubstationRefConventUnit : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property voltage : TXSDecimal read Fvoltage write Fvoltage;
    property capacity : TXSDecimal read Fcapacity write Fcapacity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property typeRefIsObsolete : Integer read FtypeRefIsObsolete write FtypeRefIsObsolete;
    property chargerTypeRefCode : Integer read FchargerTypeRefCode write FchargerTypeRefCode;
    property chargerTypeRefName : WideString read FchargerTypeRefName write FchargerTypeRefName;
    property chargerTypeRefIsObsolete : Integer read FchargerTypeRefIsObsolete write FchargerTypeRefIsObsolete;
    property substationRefCode : Integer read FsubstationRefCode write FsubstationRefCode;
    property substationRefName : WideString read FsubstationRefName write FsubstationRefName;
    property substationRefProjectPower : TXSDecimal read FsubstationRefProjectPower write FsubstationRefProjectPower;
    property substationRefOperativeService : WideString read FsubstationRefOperativeService write FsubstationRefOperativeService;
    property substationRefRepairService : WideString read FsubstationRefRepairService write FsubstationRefRepairService;
    property substationRefBuhName : WideString read FsubstationRefBuhName write FsubstationRefBuhName;
    property substationRefInvNumber : WideString read FsubstationRefInvNumber write FsubstationRefInvNumber;
    property substationRefSizCode : Integer read FsubstationRefSizCode write FsubstationRefSizCode;
    property substationRefMolCode : WideString read FsubstationRefMolCode write FsubstationRefMolCode;
    property substationRefMolName : WideString read FsubstationRefMolName write FsubstationRefMolName;
    property substationRefConventUnit : TXSDecimal read FsubstationRefConventUnit write FsubstationRefConventUnit;
  end;

  ArrayOfENSubst150BatteryShort = array of ENSubst150BatteryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150BatteryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150BatteryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150BatteryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150BatteryController/message/
  // soapAction: http://ksoe.org/ENSubst150BatteryController/action/ENSubst150BatteryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150BatteryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150BatteryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150BatteryControllerSoapPort = interface(IInvokable)
  ['{416EAAB9-05CC-4609-BE30-B21BB3F72E75}']
    function add(const aENSubst150Battery: ENSubst150Battery): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150Battery: ENSubst150Battery); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150Battery; stdcall;
    function getList: ENSubst150BatteryShortList; stdcall;
    function getFilteredList(const aENSubst150BatteryFilter: ENSubst150BatteryFilter): ENSubst150BatteryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150BatteryShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150BatteryFilter: ENSubst150BatteryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150BatteryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150BatteryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150BatteryFilter: ENSubst150BatteryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150BatteryShort; stdcall;
  end;


implementation

  destructor ENSubst150Battery.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(Fcapacity) then
      capacity.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FchargerTypeRef) then
      chargerTypeRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150BatteryFilter.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(Fcapacity) then
      capacity.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FchargerTypeRef) then
      chargerTypeRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150BatteryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150BatteryShort.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(Fcapacity) then
      capacity.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    if Assigned(FsubstationRefConventUnit) then
      substationRefConventUnit.Free;
    inherited Destroy;
  end;

  destructor ENSubst150BatteryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150Battery, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150Battery');
  RemClassRegistry.RegisterXSClass(ENSubst150BatteryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150BatteryRef');
  RemClassRegistry.RegisterXSClass(ENSubst150BatteryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150BatteryFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150BatteryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150BatteryShort');
  RemClassRegistry.RegisterXSClass(ENSubst150BatteryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150BatteryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150BatteryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150BatteryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150BatteryControllerSoapPort), 'http://ksoe.org/ENSubst150BatteryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150BatteryControllerSoapPort), 'http://ksoe.org/ENSubst150BatteryController/action/ENSubst150BatteryController.%operationName%');


end.
