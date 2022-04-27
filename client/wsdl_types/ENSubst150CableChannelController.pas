unit ENSubst150CableChannelController;

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

  ENSubst150CableChannel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150CableChannelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150CableChannel = class(TRemotable)
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
  ENSubst150CableChannelFilter = class(TRemotable)
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

  ENSubst150CableChannelFilter = class(ENSubst150CableChannel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150CableChannelShort = class(TRemotable)
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

  ArrayOfENSubst150CableChannelShort = array of ENSubst150CableChannelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150CableChannelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150CableChannelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150CableChannelShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150CableChannelController/message/
  // soapAction: http://ksoe.org/ENSubst150CableChannelController/action/ENSubst150CableChannelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150CableChannelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150CableChannelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150CableChannelControllerSoapPort = interface(IInvokable)
  ['{8A1F0B23-118E-4CEB-A3FA-27CAF7EF29CF}']
    function add(const aENSubst150CableChannel: ENSubst150CableChannel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150CableChannel: ENSubst150CableChannel); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150CableChannel; stdcall;
    function getList: ENSubst150CableChannelShortList; stdcall;
    function getFilteredList(const aENSubst150CableChannelFilter: ENSubst150CableChannelFilter): ENSubst150CableChannelShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CableChannelShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150CableChannelFilter: ENSubst150CableChannelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CableChannelShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CableChannelShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150CableChannelFilter: ENSubst150CableChannelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150CableChannelShort; stdcall;
  end;


implementation

  destructor ENSubst150CableChannel.Destroy;
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
  destructor ENSubst150CableChannelFilter.Destroy;
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

  destructor ENSubst150CableChannelFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150CableChannelShort.Destroy;
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

  destructor ENSubst150CableChannelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150CableChannel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CableChannel');
  RemClassRegistry.RegisterXSClass(ENSubst150CableChannelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CableChannelRef');
  RemClassRegistry.RegisterXSClass(ENSubst150CableChannelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CableChannelFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150CableChannelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CableChannelShort');
  RemClassRegistry.RegisterXSClass(ENSubst150CableChannelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CableChannelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150CableChannelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150CableChannelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150CableChannelControllerSoapPort), 'http://ksoe.org/ENSubst150CableChannelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150CableChannelControllerSoapPort), 'http://ksoe.org/ENSubst150CableChannelController/action/ENSubst150CableChannelController.%operationName%');


end.
