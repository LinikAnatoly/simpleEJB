unit ENSubst150PowerTransController;

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

  ENSubst150PowerTrans            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150PowerTransRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150PowerTrans = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FvoltageVN : TXSDecimal;
    FvoltageSN : TXSDecimal;
    FvoltageNN : TXSDecimal;
    FcurrentVN : TXSDecimal;
    FcurrentSN : TXSDecimal;
    FcurrentNN : TXSDecimal;
    FpowerVN : TXSDecimal;
    FpowerSN : TXSDecimal;
    FpowerNN : TXSDecimal;
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
    property voltageVN : TXSDecimal read FvoltageVN write FvoltageVN;
    property voltageSN : TXSDecimal read FvoltageSN write FvoltageSN;
    property voltageNN : TXSDecimal read FvoltageNN write FvoltageNN;
    property currentVN : TXSDecimal read FcurrentVN write FcurrentVN;
    property currentSN : TXSDecimal read FcurrentSN write FcurrentSN;
    property currentNN : TXSDecimal read FcurrentNN write FcurrentNN;
    property powerVN : TXSDecimal read FpowerVN write FpowerVN;
    property powerSN : TXSDecimal read FpowerSN write FpowerSN;
    property powerNN : TXSDecimal read FpowerNN write FpowerNN;
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
  ENSubst150PowerTransFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FvoltageVN : TXSDecimal;
    FvoltageSN : TXSDecimal;
    FvoltageNN : TXSDecimal;
    FcurrentVN : TXSDecimal;
    FcurrentSN : TXSDecimal;
    FcurrentNN : TXSDecimal;
    FpowerVN : TXSDecimal;
    FpowerSN : TXSDecimal;
    FpowerNN : TXSDecimal;
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
    property voltageVN : TXSDecimal read FvoltageVN write FvoltageVN;
    property voltageSN : TXSDecimal read FvoltageSN write FvoltageSN;
    property voltageNN : TXSDecimal read FvoltageNN write FvoltageNN;
    property currentVN : TXSDecimal read FcurrentVN write FcurrentVN;
    property currentSN : TXSDecimal read FcurrentSN write FcurrentSN;
    property currentNN : TXSDecimal read FcurrentNN write FcurrentNN;
    property powerVN : TXSDecimal read FpowerVN write FpowerVN;
    property powerSN : TXSDecimal read FpowerSN write FpowerSN;
    property powerNN : TXSDecimal read FpowerNN write FpowerNN;
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

  ENSubst150PowerTransFilter = class(ENSubst150PowerTrans)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubst150PowerTransShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FfactoryNumber : WideString;
    FvoltageVN : TXSDecimal;
    FvoltageSN : TXSDecimal;
    FvoltageNN : TXSDecimal;
    FcurrentVN : TXSDecimal;
    FcurrentSN : TXSDecimal;
    FcurrentNN : TXSDecimal;
    FpowerVN : TXSDecimal;
    FpowerSN : TXSDecimal;
    FpowerNN : TXSDecimal;
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
    property voltageVN : TXSDecimal read FvoltageVN write FvoltageVN;
    property voltageSN : TXSDecimal read FvoltageSN write FvoltageSN;
    property voltageNN : TXSDecimal read FvoltageNN write FvoltageNN;
    property currentVN : TXSDecimal read FcurrentVN write FcurrentVN;
    property currentSN : TXSDecimal read FcurrentSN write FcurrentSN;
    property currentNN : TXSDecimal read FcurrentNN write FcurrentNN;
    property powerVN : TXSDecimal read FpowerVN write FpowerVN;
    property powerSN : TXSDecimal read FpowerSN write FpowerSN;
    property powerNN : TXSDecimal read FpowerNN write FpowerNN;
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

  ArrayOfENSubst150PowerTransShort = array of ENSubst150PowerTransShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150PowerTransShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150PowerTransShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150PowerTransShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150PowerTransController/message/
  // soapAction: http://ksoe.org/ENSubst150PowerTransController/action/ENSubst150PowerTransController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150PowerTransControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150PowerTransController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150PowerTransControllerSoapPort = interface(IInvokable)
  ['{E34FC1AD-64E6-4A07-97B9-A4470EFD757D}']
    function add(const aENSubst150PowerTrans: ENSubst150PowerTrans): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150PowerTrans: ENSubst150PowerTrans); stdcall;
    function getObject(const anObjectCode: Integer): ENSubst150PowerTrans; stdcall;
    function getList: ENSubst150PowerTransShortList; stdcall;
    function getFilteredList(const aENSubst150PowerTransFilter: ENSubst150PowerTransFilter): ENSubst150PowerTransShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150PowerTransShortList; stdcall;
    function getScrollableFilteredList(const aENSubst150PowerTransFilter: ENSubst150PowerTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150PowerTransShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150PowerTransShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubst150PowerTransFilter: ENSubst150PowerTransFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubst150PowerTransShort; stdcall;
  end;


implementation

  destructor ENSubst150PowerTrans.Destroy;
  begin
    if Assigned(FvoltageVN) then
      voltageVN.Free;
    if Assigned(FvoltageSN) then
      voltageSN.Free;
    if Assigned(FvoltageNN) then
      voltageNN.Free;
    if Assigned(FcurrentVN) then
      currentVN.Free;
    if Assigned(FcurrentSN) then
      currentSN.Free;
    if Assigned(FcurrentNN) then
      currentNN.Free;
    if Assigned(FpowerVN) then
      powerVN.Free;
    if Assigned(FpowerSN) then
      powerSN.Free;
    if Assigned(FpowerNN) then
      powerNN.Free;
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
  destructor ENSubst150PowerTransFilter.Destroy;
  begin
    if Assigned(FvoltageVN) then
      voltageVN.Free;
    if Assigned(FvoltageSN) then
      voltageSN.Free;
    if Assigned(FvoltageNN) then
      voltageNN.Free;
    if Assigned(FcurrentVN) then
      currentVN.Free;
    if Assigned(FcurrentSN) then
      currentSN.Free;
    if Assigned(FcurrentNN) then
      currentNN.Free;
    if Assigned(FpowerVN) then
      powerVN.Free;
    if Assigned(FpowerSN) then
      powerSN.Free;
    if Assigned(FpowerNN) then
      powerNN.Free;
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

  destructor ENSubst150PowerTransFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubst150PowerTransShort.Destroy;
  begin
    if Assigned(FvoltageVN) then
      voltageVN.Free;
    if Assigned(FvoltageSN) then
      voltageSN.Free;
    if Assigned(FvoltageNN) then
      voltageNN.Free;
    if Assigned(FcurrentVN) then
      currentVN.Free;
    if Assigned(FcurrentSN) then
      currentSN.Free;
    if Assigned(FcurrentNN) then
      currentNN.Free;
    if Assigned(FpowerVN) then
      powerVN.Free;
    if Assigned(FpowerSN) then
      powerSN.Free;
    if Assigned(FpowerNN) then
      powerNN.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FvoltageClassRefValue) then
      voltageClassRefValue.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    inherited Destroy;
  end;

  destructor ENSubst150PowerTransShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150PowerTrans, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150PowerTrans');
  RemClassRegistry.RegisterXSClass(ENSubst150PowerTransRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150PowerTransRef');
  RemClassRegistry.RegisterXSClass(ENSubst150PowerTransFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150PowerTransFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150PowerTransShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150PowerTransShort');
  RemClassRegistry.RegisterXSClass(ENSubst150PowerTransShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150PowerTransShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150PowerTransShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150PowerTransShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150PowerTransControllerSoapPort), 'http://ksoe.org/ENSubst150PowerTransController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150PowerTransControllerSoapPort), 'http://ksoe.org/ENSubst150PowerTransController/action/ENSubst150PowerTransController.%operationName%');


end.
