unit ENSubst150DischargerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementController
  , TKMaterialsController
  , ENVoltageClassController
  , ENHighVoltHardwareTypeController
  , ENSubst150CellController
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

  ENSubst150Discharger            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150DischargerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150Discharger = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FcellRef : ENSubst150CellRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;

{
  ENSubst150DischargerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
//???
    FtypeRef : ENHighVoltHardwareTypeRef;
//???
    FcellRef : ENSubst150CellRef;
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
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property cellRef : ENSubst150CellRef read FcellRef write FcellRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;
}

  ENSubst150DischargerFilter = class(ENSubst150Discharger)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150DischargerShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementCode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FvoltageClassRefCode : Integer;
    FvoltageClassRefValue : TXSDecimal;
    FvoltageClassRefDescription : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FtypeRefIsObsolete : Integer;
    FcellRefCode : Integer;
    FcellRefName : WideString;
    FcellRefFactoryNumber : WideString;
    FcellRefCommentGen : WideString;
    FcellRefUserGen : WideString;
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
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property voltageClassRefCode : Integer read FvoltageClassRefCode write FvoltageClassRefCode;
    property voltageClassRefValue : TXSDecimal read FvoltageClassRefValue write FvoltageClassRefValue;
    property voltageClassRefDescription : WideString read FvoltageClassRefDescription write FvoltageClassRefDescription;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property typeRefIsObsolete : Integer read FtypeRefIsObsolete write FtypeRefIsObsolete;
    property cellRefCode : Integer read FcellRefCode write FcellRefCode;
    property cellRefName : WideString read FcellRefName write FcellRefName;
    property cellRefFactoryNumber : WideString read FcellRefFactoryNumber write FcellRefFactoryNumber;
    property cellRefCommentGen : WideString read FcellRefCommentGen write FcellRefCommentGen;
    property cellRefUserGen : WideString read FcellRefUserGen write FcellRefUserGen;
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

  ArrayOfENSubst150DischargerShort = array of ENSubst150DischargerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150DischargerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150DischargerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150DischargerShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150DischargerController/message/
  // soapAction: http://ksoe.org/ENSubst150DischargerController/action/ENSubst150DischargerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150DischargerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150DischargerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150DischargerControllerSoapPort = interface(IInvokable)
  ['{2944A5CF-E06F-4E03-A83C-B90E97F898BF}']
    function add(const aENSubst150Discharger: ENSubst150Discharger): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150Discharger: ENSubst150Discharger); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150Discharger; stdcall;
    function getList: ENSubst150DischargerShortList; stdcall;
    function getFilteredList(const aENSubst150DischargerFilter: ENSubst150DischargerFilter): ENSubst150DischargerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DischargerShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150DischargerFilter: ENSubst150DischargerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DischargerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150DischargerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150DischargerFilter: ENSubst150DischargerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150DischargerShort; stdcall;
  end;


implementation

  destructor ENSubst150Discharger.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150DischargerFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FcellRef) then
      cellRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150DischargerFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150DischargerShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FvoltageClassRefValue) then
      voltageClassRefValue.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    if Assigned(FsubstationRefConventUnit) then
      substationRefConventUnit.Free;
    inherited Destroy;
  end;

  destructor ENSubst150DischargerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150Discharger, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150Discharger');
  RemClassRegistry.RegisterXSClass(ENSubst150DischargerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DischargerRef');
  RemClassRegistry.RegisterXSClass(ENSubst150DischargerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DischargerFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150DischargerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DischargerShort');
  RemClassRegistry.RegisterXSClass(ENSubst150DischargerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150DischargerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150DischargerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150DischargerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150DischargerControllerSoapPort), 'http://ksoe.org/ENSubst150DischargerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150DischargerControllerSoapPort), 'http://ksoe.org/ENSubst150DischargerController/action/ENSubst150DischargerController.%operationName%');


end.
