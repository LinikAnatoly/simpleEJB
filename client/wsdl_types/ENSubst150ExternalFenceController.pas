unit ENSubst150ExternalFenceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,TKMaterialsController
   ,ENHighVoltHardwareTypeController
   ,ENSubstation150Controller
   ,ENSubst150VRUZRUController
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

  ENSubst150ExternalFence            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150ExternalFenceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150ExternalFence = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
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
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref;
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;

{
  ENSubst150ExternalFenceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
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
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref;
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
}

  ENSubst150ExternalFenceFilter = class(ENSubst150ExternalFence)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150ExternalFenceShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FcurrentNominal : TXSDecimal;
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
    Fsubstation150RefCode : Integer;
    Fsubstation150RefName : WideString;
    Fsubstation150RefProjectPower : TXSDecimal;
    Fsubstation150RefOperativeService : WideString;
    Fsubstation150RefRepairService : WideString;
    Fsubstation150RefBuhName : WideString;
    Fsubstation150RefInvNumber : WideString;
    Fsubstation150RefSizCode : Integer;
    Fsubstation150RefMolCode : WideString;
    Fsubstation150RefMolName : WideString;
    Fsubstation150RefCoeffCategory : TXSDecimal;
    Fsubst150VruZruRefCode : Integer;
    Fsubst150VruZruRefNameDisp : WideString;
    Fsubst150VruZruRefName : WideString;
    Fsubst150VruZruRefInstallDate : TXSDate;
    Fsubst150VruZruRefCommentGen : WideString;
    Fsubst150VruZruRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property currentNominal : TXSDecimal read FcurrentNominal write FcurrentNominal;
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
    property substation150RefCode : Integer read Fsubstation150RefCode write Fsubstation150RefCode;
    property substation150RefName : WideString read Fsubstation150RefName write Fsubstation150RefName;
    property substation150RefProjectPower : TXSDecimal read Fsubstation150RefProjectPower write Fsubstation150RefProjectPower;
    property substation150RefOperativeService : WideString read Fsubstation150RefOperativeService write Fsubstation150RefOperativeService;
    property substation150RefRepairService : WideString read Fsubstation150RefRepairService write Fsubstation150RefRepairService;
    property substation150RefBuhName : WideString read Fsubstation150RefBuhName write Fsubstation150RefBuhName;
    property substation150RefInvNumber : WideString read Fsubstation150RefInvNumber write Fsubstation150RefInvNumber;
    property substation150RefSizCode : Integer read Fsubstation150RefSizCode write Fsubstation150RefSizCode;
    property substation150RefMolCode : WideString read Fsubstation150RefMolCode write Fsubstation150RefMolCode;
    property substation150RefMolName : WideString read Fsubstation150RefMolName write Fsubstation150RefMolName;
    property substation150RefCoeffCategory : TXSDecimal read Fsubstation150RefCoeffCategory write Fsubstation150RefCoeffCategory;
    property subst150VruZruRefCode : Integer read Fsubst150VruZruRefCode write Fsubst150VruZruRefCode;
    property subst150VruZruRefNameDisp : WideString read Fsubst150VruZruRefNameDisp write Fsubst150VruZruRefNameDisp;
    property subst150VruZruRefName : WideString read Fsubst150VruZruRefName write Fsubst150VruZruRefName;
    property subst150VruZruRefInstallDate : TXSDate read Fsubst150VruZruRefInstallDate write Fsubst150VruZruRefInstallDate;
    property subst150VruZruRefCommentGen : WideString read Fsubst150VruZruRefCommentGen write Fsubst150VruZruRefCommentGen;
    property subst150VruZruRefUserGen : WideString read Fsubst150VruZruRefUserGen write Fsubst150VruZruRefUserGen;
  end;

  ArrayOfENSubst150ExternalFenceShort = array of ENSubst150ExternalFenceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150ExternalFenceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150ExternalFenceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150ExternalFenceShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150ExternalFenceController/message/
  // soapAction: http://ksoe.org/ENSubst150ExternalFenceController/action/ENSubst150ExternalFenceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150ExternalFenceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150ExternalFenceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150ExternalFenceControllerSoapPort = interface(IInvokable)
  ['{56AD0CA3-0D26-45C1-AD53-433E5AFE7B58}']
    function add(const aENSubst150ExternalFence: ENSubst150ExternalFence): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150ExternalFence: ENSubst150ExternalFence); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150ExternalFence; stdcall;
    function getList: ENSubst150ExternalFenceShortList; stdcall;
    function getFilteredList(const aENSubst150ExternalFenceFilter: ENSubst150ExternalFenceFilter): ENSubst150ExternalFenceShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150ExternalFenceShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150ExternalFenceFilter: ENSubst150ExternalFenceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150ExternalFenceShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150ExternalFenceShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150ExternalFenceFilter: ENSubst150ExternalFenceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150ExternalFenceShort; stdcall;
  end;


implementation

  destructor ENSubst150ExternalFence.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150ExternalFenceFilter.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150ExternalFenceFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150ExternalFenceShort.Destroy;
  begin
    if Assigned(FcurrentNominal) then
      currentNominal.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fsubstation150RefProjectPower) then
      substation150RefProjectPower.Free;
    if Assigned(Fsubstation150RefCoeffCategory) then
      substation150RefCoeffCategory.Free;
    if Assigned(Fsubst150VruZruRefInstallDate) then
      subst150VruZruRefInstallDate.Free;
    inherited Destroy;
  end;

  destructor ENSubst150ExternalFenceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150ExternalFence, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150ExternalFence');
  RemClassRegistry.RegisterXSClass(ENSubst150ExternalFenceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150ExternalFenceRef');
  RemClassRegistry.RegisterXSClass(ENSubst150ExternalFenceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150ExternalFenceFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150ExternalFenceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150ExternalFenceShort');
  RemClassRegistry.RegisterXSClass(ENSubst150ExternalFenceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150ExternalFenceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150ExternalFenceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150ExternalFenceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150ExternalFenceControllerSoapPort), 'http://ksoe.org/ENSubst150ExternalFenceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150ExternalFenceControllerSoapPort), 'http://ksoe.org/ENSubst150ExternalFenceController/action/ENSubst150ExternalFenceController.%operationName%');


end.
