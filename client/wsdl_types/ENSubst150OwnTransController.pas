unit ENSubst150OwnTransController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENElementController
  , TKMaterialsController
  , ENVoltageClassController
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

  ENSubst150OwnTrans            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150OwnTransRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150OwnTrans = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fpower : TXSDecimal;
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
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property power : TXSDecimal read Fpower write Fpower;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;

{
  ENSubst150OwnTransFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fpower : TXSDecimal;
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
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property power : TXSDecimal read Fpower write Fpower;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef;
    property typeRef : ENHighVoltHardwareTypeRef read FtypeRef write FtypeRef;
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef;
  end;
}

  ENSubst150OwnTransFilter = class(ENSubst150OwnTrans)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150OwnTransShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    Fpower : TXSDecimal;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property power : TXSDecimal read Fpower write Fpower;
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
  end;

  ArrayOfENSubst150OwnTransShort = array of ENSubst150OwnTransShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150OwnTransShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150OwnTransShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150OwnTransShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150OwnTransController/message/
  // soapAction: http://ksoe.org/ENSubst150OwnTransController/action/ENSubst150OwnTransController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150OwnTransControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150OwnTransController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150OwnTransControllerSoapPort = interface(IInvokable)
  ['{B00CE3CC-F67A-4299-8233-BEA54ECCDBD8}']
    function add(const aENSubst150OwnTrans: ENSubst150OwnTrans): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150OwnTrans: ENSubst150OwnTrans); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150OwnTrans; stdcall;
    function getList: ENSubst150OwnTransShortList; stdcall;
    function getFilteredList(const aENSubst150OwnTransFilter: ENSubst150OwnTransFilter): ENSubst150OwnTransShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150OwnTransShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150OwnTransFilter: ENSubst150OwnTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150OwnTransShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150OwnTransShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150OwnTransFilter: ENSubst150OwnTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150OwnTransShort; stdcall;
  end;


implementation

  destructor ENSubst150OwnTrans.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
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
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSubst150OwnTransFilter.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
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
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSubst150OwnTransFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150OwnTransShort.Destroy;
  begin
    if Assigned(Fpower) then
      power.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FvoltageClassRefValue) then
      voltageClassRefValue.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    inherited Destroy;
  end;

  destructor ENSubst150OwnTransShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150OwnTrans, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150OwnTrans');
  RemClassRegistry.RegisterXSClass(ENSubst150OwnTransRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150OwnTransRef');
  RemClassRegistry.RegisterXSClass(ENSubst150OwnTransFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150OwnTransFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150OwnTransShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150OwnTransShort');
  RemClassRegistry.RegisterXSClass(ENSubst150OwnTransShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150OwnTransShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150OwnTransShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150OwnTransShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150OwnTransControllerSoapPort), 'http://ksoe.org/ENSubst150OwnTransController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150OwnTransControllerSoapPort), 'http://ksoe.org/ENSubst150OwnTransController/action/ENSubst150OwnTransController.%operationName%');


end.
