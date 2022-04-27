unit ENSubstation150Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
  , ENElementController
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

  ENSubstation150            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstation150Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstation150 = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FprojectPower : TXSDecimal;
    FoperativeService : WideString;
    FrepairService : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FkruSerial : WideString;
    FoperativeIConst : TXSDecimal;
    FoperativeIVar : TXSDecimal;
    Fbattery : WideString;
    FORU : WideString;
    FOPUType : WideString;
    FOPUMaterial : WideString;
    FOPUCount : TXSDecimal;
    FZRUBuildingType : WideString;
    FZRUBuildingMaterial : WideString;
    FZRUBasementType : WideString;
    FZRUBasementMaterial : WideString;
    FZRUCount : TXSDecimal;
    FbasementTransformersType : WideString;
    FbasementTransformersMaterial : WideString;
    FbasementTransformersCount : TXSDecimal;
    FsquareInFence : TXSDecimal;
    FwaterHole : TXSDecimal;
    FwaterNet : TXSDecimal;
    FcanalizationSink : TXSDecimal;
    FcanalizationLocal : TXSDecimal;
    FoilStoreData : WideString;
    FoilChannelData : WideString;
    FoilCatcherData : WideString;
    FrevisionDeviceData : WideString;
    FplumbingData : WideString;
    FcanalizationData : WideString;
    FheatingData : WideString;
    FfencingData : WideString;
    FconnectionData : WideString;
    FseparatorData : WideString;
    FshorCircuitData : WideString;
    FloadingData : WideString;
    FarchCoilData : WideString;
    FsizCode : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    Fenlinecode : Integer;
    FcoeffCategory : TXSDecimal;
    FsafetyPerformance : ArrayOfInteger;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltage : EPVoltageNominal;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property projectPower : TXSDecimal read FprojectPower write FprojectPower;
    property operativeService : WideString read FoperativeService write FoperativeService;
    property repairService : WideString read FrepairService write FrepairService;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property kruSerial : WideString read FkruSerial write FkruSerial;
    property operativeIConst : TXSDecimal read FoperativeIConst write FoperativeIConst;
    property operativeIVar : TXSDecimal read FoperativeIVar write FoperativeIVar;
    property battery : WideString read Fbattery write Fbattery;
    property ORU : WideString read FORU write FORU;
    property OPUType : WideString read FOPUType write FOPUType;
    property OPUMaterial : WideString read FOPUMaterial write FOPUMaterial;
    property OPUCount : TXSDecimal read FOPUCount write FOPUCount;
    property ZRUBuildingType : WideString read FZRUBuildingType write FZRUBuildingType;
    property ZRUBuildingMaterial : WideString read FZRUBuildingMaterial write FZRUBuildingMaterial;
    property ZRUBasementType : WideString read FZRUBasementType write FZRUBasementType;
    property ZRUBasementMaterial : WideString read FZRUBasementMaterial write FZRUBasementMaterial;
    property ZRUCount : TXSDecimal read FZRUCount write FZRUCount;
    property basementTransformersType : WideString read FbasementTransformersType write FbasementTransformersType;
    property basementTransformersMaterial : WideString read FbasementTransformersMaterial write FbasementTransformersMaterial;
    property basementTransformersCount : TXSDecimal read FbasementTransformersCount write FbasementTransformersCount;
    property squareInFence : TXSDecimal read FsquareInFence write FsquareInFence;
    property waterHole : TXSDecimal read FwaterHole write FwaterHole;
    property waterNet : TXSDecimal read FwaterNet write FwaterNet;
    property canalizationSink : TXSDecimal read FcanalizationSink write FcanalizationSink;
    property canalizationLocal : TXSDecimal read FcanalizationLocal write FcanalizationLocal;
    property oilStoreData : WideString read FoilStoreData write FoilStoreData;
    property oilChannelData : WideString read FoilChannelData write FoilChannelData;
    property oilCatcherData : WideString read FoilCatcherData write FoilCatcherData;
    property revisionDeviceData : WideString read FrevisionDeviceData write FrevisionDeviceData;
    property plumbingData : WideString read FplumbingData write FplumbingData;
    property canalizationData : WideString read FcanalizationData write FcanalizationData;
    property heatingData : WideString read FheatingData write FheatingData;
    property fencingData : WideString read FfencingData write FfencingData;
    property connectionData : WideString read FconnectionData write FconnectionData;
    property separatorData : WideString read FseparatorData write FseparatorData;
    property shorCircuitData : WideString read FshorCircuitData write FshorCircuitData;
    property loadingData : WideString read FloadingData write FloadingData;
    property archCoilData : WideString read FarchCoilData write FarchCoilData;
    property sizCode : Integer read FsizCode write FsizCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property enlinecode : Integer read Fenlinecode write Fenlinecode;
    property coeffCategory : TXSDecimal read FcoeffCategory write FcoeffCategory;
    property safetyPerformance : ArrayOfInteger read FsafetyPerformance write FsafetyPerformance;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voltage : EPVoltageNominal read Fvoltage write Fvoltage;
    property element : ENElement read Felement write Felement;
  end;

{
  ENSubstation150Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FprojectPower : TXSDecimal;
    FoperativeService : WideString;
    FrepairService : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FkruSerial : WideString;
    FoperativeIConst : TXSDecimal;
    FoperativeIVar : TXSDecimal;
    Fbattery : WideString;
    FORU : WideString;
    FOPUType : WideString;
    FOPUMaterial : WideString;
    FOPUCount : TXSDecimal;
    FZRUBuildingType : WideString;
    FZRUBuildingMaterial : WideString;
    FZRUBasementType : WideString;
    FZRUBasementMaterial : WideString;
    FZRUCount : TXSDecimal;
    FbasementTransformersType : WideString;
    FbasementTransformersMaterial : WideString;
    FbasementTransformersCount : TXSDecimal;
    FsquareInFence : TXSDecimal;
    FwaterHole : TXSDecimal;
    FwaterNet : TXSDecimal;
    FcanalizationSink : TXSDecimal;
    FcanalizationLocal : TXSDecimal;
    FoilStoreData : WideString;
    FoilChannelData : WideString;
    FoilCatcherData : WideString;
    FrevisionDeviceData : WideString;
    FplumbingData : WideString;
    FcanalizationData : WideString;
    FheatingData : WideString;
    FfencingData : WideString;
    FconnectionData : WideString;
    FseparatorData : WideString;
    FshorCircuitData : WideString;
    FloadingData : WideString;
    FarchCoilData : WideString;
    FsizCode : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    Fenlinecode : Integer;
    FcoeffCategory : TXSDecimal;
    FsafetyPerformance : ArrayOfInteger;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltage : EPVoltageNominal;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property projectPower : TXSDecimal read FprojectPower write FprojectPower;
    property operativeService : WideString read FoperativeService write FoperativeService;
    property repairService : WideString read FrepairService write FrepairService;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property kruSerial : WideString read FkruSerial write FkruSerial;
    property operativeIConst : TXSDecimal read FoperativeIConst write FoperativeIConst;
    property operativeIVar : TXSDecimal read FoperativeIVar write FoperativeIVar;
    property battery : WideString read Fbattery write Fbattery;
    property ORU : WideString read FORU write FORU;
    property OPUType : WideString read FOPUType write FOPUType;
    property OPUMaterial : WideString read FOPUMaterial write FOPUMaterial;
    property OPUCount : TXSDecimal read FOPUCount write FOPUCount;
    property ZRUBuildingType : WideString read FZRUBuildingType write FZRUBuildingType;
    property ZRUBuildingMaterial : WideString read FZRUBuildingMaterial write FZRUBuildingMaterial;
    property ZRUBasementType : WideString read FZRUBasementType write FZRUBasementType;
    property ZRUBasementMaterial : WideString read FZRUBasementMaterial write FZRUBasementMaterial;
    property ZRUCount : TXSDecimal read FZRUCount write FZRUCount;
    property basementTransformersType : WideString read FbasementTransformersType write FbasementTransformersType;
    property basementTransformersMaterial : WideString read FbasementTransformersMaterial write FbasementTransformersMaterial;
    property basementTransformersCount : TXSDecimal read FbasementTransformersCount write FbasementTransformersCount;
    property squareInFence : TXSDecimal read FsquareInFence write FsquareInFence;
    property waterHole : TXSDecimal read FwaterHole write FwaterHole;
    property waterNet : TXSDecimal read FwaterNet write FwaterNet;
    property canalizationSink : TXSDecimal read FcanalizationSink write FcanalizationSink;
    property canalizationLocal : TXSDecimal read FcanalizationLocal write FcanalizationLocal;
    property oilStoreData : WideString read FoilStoreData write FoilStoreData;
    property oilChannelData : WideString read FoilChannelData write FoilChannelData;
    property oilCatcherData : WideString read FoilCatcherData write FoilCatcherData;
    property revisionDeviceData : WideString read FrevisionDeviceData write FrevisionDeviceData;
    property plumbingData : WideString read FplumbingData write FplumbingData;
    property canalizationData : WideString read FcanalizationData write FcanalizationData;
    property heatingData : WideString read FheatingData write FheatingData;
    property fencingData : WideString read FfencingData write FfencingData;
    property connectionData : WideString read FconnectionData write FconnectionData;
    property separatorData : WideString read FseparatorData write FseparatorData;
    property shorCircuitData : WideString read FshorCircuitData write FshorCircuitData;
    property loadingData : WideString read FloadingData write FloadingData;
    property archCoilData : WideString read FarchCoilData write FarchCoilData;
    property sizCode : Integer read FsizCode write FsizCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property enlinecode : Integer read Fenlinecode write Fenlinecode;
    property coeffCategory : TXSDecimal read FcoeffCategory write FcoeffCategory;
    property safetyPerformance : ArrayOfInteger read FsafetyPerformance write FsafetyPerformance;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voltage : EPVoltageNominal read Fvoltage write Fvoltage;
    property element : ENElement read Felement write Felement;
  end;
}

  ENSubstation150Filter = class(ENSubstation150)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubstation150Short = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FprojectPower : TXSDecimal;
    FoperativeService : WideString;
    FrepairService : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FsizCode : Integer;
    FmolCode : WideString;
    FmolName : WideString;
    FcoeffCategory : TXSDecimal;
    FvoltageCode : Integer;
    FvoltageValue : WideString;
    FelementCode : Integer;
    FtransformerCnt: Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property projectPower : TXSDecimal read FprojectPower write FprojectPower;
    property operativeService : WideString read FoperativeService write FoperativeService;
    property repairService : WideString read FrepairService write FrepairService;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property  sizCode : Integer read FsizCode write FsizCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property coeffCategory : TXSDecimal read FcoeffCategory write FcoeffCategory;
    property voltageCode : Integer read FvoltageCode write FvoltageCode;
    property voltageValue : WideString read FvoltageValue write FvoltageValue;
    property elementCode : Integer read FelementCode write FelementCode;
    property transformerCnt: Integer read FtransformerCnt write FtransformerCnt;
  end;

  ArrayOfENSubstation150Short = array of ENSubstation150Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubstation150ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubstation150Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubstation150Short read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubstation150Controller/message/
  // soapAction: http://ksoe.org/ENSubstation150Controller/action/ENSubstation150Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubstation150ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubstation150Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubstation150ControllerSoapPort = interface(IInvokable)
  ['{4286A9F2-6D2D-437A-8DD7-09B1CBD5B9C1}']
    function add(const aENSubstation150: ENSubstation150): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubstation150: ENSubstation150); stdcall;
    function getObject(const anObjectCode: Integer): ENSubstation150; stdcall;
    function getList: ENSubstation150ShortList; stdcall;
    function getFilteredList(const aENSubstation150Filter: ENSubstation150Filter): ENSubstation150ShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubstation150ShortList; stdcall;
    function getScrollableFilteredList(const aENSubstation150Filter: ENSubstation150Filter; const aFromPosition: Integer; const aQuantity: Integer): ENSubstation150ShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubstation150ShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSubstation150Filter: ENSubstation150Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSubstation150Short; stdcall;
  end;


implementation

  destructor ENSubstation150.Destroy;
  begin
    if Assigned(FprojectPower) then
      projectPower.Free;
    if Assigned(FoperativeIConst) then
      operativeIConst.Free;
    if Assigned(FoperativeIVar) then
      operativeIVar.Free;
    if Assigned(FOPUCount) then
      OPUCount.Free;
    if Assigned(FZRUCount) then
      ZRUCount.Free;
    if Assigned(FbasementTransformersCount) then
      basementTransformersCount.Free;
    if Assigned(FsquareInFence) then
      squareInFence.Free;
    if Assigned(FwaterHole) then
      waterHole.Free;
    if Assigned(FwaterNet) then
      waterNet.Free;
    if Assigned(FcanalizationSink) then
      canalizationSink.Free;
    if Assigned(FcanalizationLocal) then
      canalizationLocal.Free;
    if Assigned(FcoeffCategory) then
      coeffCategory.Free;
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{
  destructor ENSubstation150Filter.Destroy;
  begin
    if Assigned(FprojectPower) then
      projectPower.Free;
    if Assigned(FoperativeIConst) then
      operativeIConst.Free;
    if Assigned(FoperativeIVar) then
      operativeIVar.Free;
    if Assigned(FOPUCount) then
      OPUCount.Free;
    if Assigned(FZRUCount) then
      ZRUCount.Free;
    if Assigned(FbasementTransformersCount) then
      basementTransformersCount.Free;
    if Assigned(FsquareInFence) then
      squareInFence.Free;
    if Assigned(FwaterHole) then
      waterHole.Free;
    if Assigned(FwaterNet) then
      waterNet.Free;
    if Assigned(FcanalizationSink) then
      canalizationSink.Free;
    if Assigned(FcanalizationLocal) then
      canalizationLocal.Free;
    if Assigned(FcoeffCategory) then
      coeffCategory.Free;
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
}

  destructor ENSubstation150Filter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSubstation150Short.Destroy;
  begin
    if Assigned(FprojectPower) then
      projectPower.Free;
    if Assigned(FcoeffCategory) then
      coeffCategory.Free;
    inherited Destroy;
  end;

  destructor ENSubstation150ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubstation150, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation150');
  RemClassRegistry.RegisterXSClass(ENSubstation150Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation150Ref');
  RemClassRegistry.RegisterXSClass(ENSubstation150Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation150Filter');
  RemClassRegistry.RegisterXSClass(ENSubstation150Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation150Short');
  RemClassRegistry.RegisterXSClass(ENSubstation150ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation150ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubstation150Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubstation150Short');

  InvRegistry.RegisterInterface(TypeInfo(ENSubstation150ControllerSoapPort), 'http://ksoe.org/ENSubstation150Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubstation150ControllerSoapPort), 'http://ksoe.org/ENSubstation150Controller/action/ENSubstation150Controller.%operationName%');


end.
