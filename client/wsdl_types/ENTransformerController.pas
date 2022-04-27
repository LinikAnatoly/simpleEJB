unit ENTransformerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTransformerTypeController
   ,ENSubstation04Controller
   ,ENElementController
   ,TKMaterialsController
   ,ENAntsapfController
   ,ENTransformerDefectController
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

  ENTransformer            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransformer = class(TRemotable)
  private
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FnominalPower : TXSDecimal;
    Fdomain_info : WideString;
    FhighVoltage : TXSDecimal;
    FlowVoltage : TXSDecimal;
    FhighCurrent : TXSDecimal;
    FlowCurrent : TXSDecimal;
    Fukz : TXSDecimal;
    FmanufacturingdPlant : WideString;
    FserialNumber : WideString;
    FmanufactureYear : TXSDate;
    FinstallDate : TXSDate;
    FremovalDate : TXSDate;
    Fmodify_time : Int64;
    FconnectGroup : WideString;
    Fdpxx : TXSDecimal;
    Fixx : TXSDecimal;
    Fdpkz : TXSDecimal;
    FdefectDescription : WideString;
    FdefectDate : TXSDate;
//???
    FtransformerType : ENTransformerType;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FantsapfRef : ENAntsapfRef;
//???
    FdefectRef : ENTransformerDefectRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property highVoltage : TXSDecimal read FhighVoltage write FhighVoltage;
    property lowVoltage : TXSDecimal read FlowVoltage write FlowVoltage;
    property highCurrent : TXSDecimal read FhighCurrent write FhighCurrent;
    property lowCurrent : TXSDecimal read FlowCurrent write FlowCurrent;
    property ukz : TXSDecimal read Fukz write Fukz;
    property manufacturingdPlant : WideString read FmanufacturingdPlant write FmanufacturingdPlant;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property manufactureYear : TXSDate read FmanufactureYear write FmanufactureYear;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property removalDate : TXSDate read FremovalDate write FremovalDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property connectGroup : WideString read FconnectGroup write FconnectGroup;
    property dpxx : TXSDecimal read Fdpxx write Fdpxx;
    property ixx : TXSDecimal read Fixx write Fixx;
    property dpkz : TXSDecimal read Fdpkz write Fdpkz;
    property defectDescription : WideString read FdefectDescription write FdefectDescription;
    property defectDate : TXSDate read FdefectDate write FdefectDate;
    property transformerType : ENTransformerType read FtransformerType write FtransformerType;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property antsapfRef : ENAntsapfRef read FantsapfRef write FantsapfRef;
    property defectRef : ENTransformerDefectRef read FdefectRef write FdefectRef;
  end;

{
  ENTransformerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FnominalPower : TXSDecimal;
    Fdomain_info : WideString;
    FhighVoltage : TXSDecimal;
    FlowVoltage : TXSDecimal;
    FhighCurrent : TXSDecimal;
    FlowCurrent : TXSDecimal;
    Fukz : TXSDecimal;
    FmanufacturingdPlant : WideString;
    FserialNumber : WideString;
    FmanufactureYear : TXSDate;
    FinstallDate : TXSDate;
    FremovalDate : TXSDate;
    Fmodify_time : Int64;
    FconnectGroup : WideString;
    Fdpxx : TXSDecimal;
    Fixx : TXSDecimal;
    Fdpkz : TXSDecimal;
    FdefectDescription : WideString;
    FdefectDate : TXSDate;
//???
    FtransformerType : ENTransformerType;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FantsapfRef : ENAntsapfRef;
//???
    FdefectRef : ENTransformerDefectRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property highVoltage : TXSDecimal read FhighVoltage write FhighVoltage;
    property lowVoltage : TXSDecimal read FlowVoltage write FlowVoltage;
    property highCurrent : TXSDecimal read FhighCurrent write FhighCurrent;
    property lowCurrent : TXSDecimal read FlowCurrent write FlowCurrent;
    property ukz : TXSDecimal read Fukz write Fukz;
    property manufacturingdPlant : WideString read FmanufacturingdPlant write FmanufacturingdPlant;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property manufactureYear : TXSDate read FmanufactureYear write FmanufactureYear;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property removalDate : TXSDate read FremovalDate write FremovalDate;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property connectGroup : WideString read FconnectGroup write FconnectGroup;
    property dpxx : TXSDecimal read Fdpxx write Fdpxx;
    property ixx : TXSDecimal read Fixx write Fixx;
    property dpkz : TXSDecimal read Fdpkz write Fdpkz;
    property defectDescription : WideString read FdefectDescription write FdefectDescription;
    property defectDate : TXSDate read FdefectDate write FdefectDate;
    property transformerType : ENTransformerType read FtransformerType write FtransformerType;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref;
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property antsapfRef : ENAntsapfRef read FantsapfRef write FantsapfRef;
    property defectRef : ENTransformerDefectRef read FdefectRef write FdefectRef;
  end;
}

  ENTransformerFilter = class(ENTransformer)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTransformerShort = class(TRemotable)
  private
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FnominalPower : TXSDecimal;
    FhighVoltage : TXSDecimal;
    FlowVoltage : TXSDecimal;
    FhighCurrent : TXSDecimal;
    FlowCurrent : TXSDecimal;
    Fukz : TXSDecimal;
    FmanufacturingdPlant : WideString;
    FserialNumber : WideString;
    FmanufactureYear : TXSDate;
    FinstallDate : TXSDate;
    FremovalDate : TXSDate;
    FconnectGroup : WideString;
    Fdpxx : TXSDecimal;
    Fixx : TXSDecimal;
    Fdpkz : TXSDecimal;
    FdefectDescription : WideString;
    FdefectDate : TXSDate;
    FtransformerTypeCode : Integer;
    FtransformerTypeName : WideString;
    Fsubstation04RefCode : Integer;
    Fsubstation04RefName : WideString;
    Fsubstation04RefBuhName : WideString;
    Fsubstation04RefInvNumber : WideString;
    Fsubstation04RefNominalPower : TXSDecimal;
    Fsubstation04RefLastRepairDate : TXSDate;
    Fsubstation04RefSizCode : Integer;
    Fsubstation04RefAddress : WideString;
    Fsubstation04RefYearBuild : Integer;
    Fsubstation04RefYearWorkingStart : Integer;
    Fsubstation04RefChambersQuantity : Integer;
    Fsubstation04RefPeriodInspect : Integer;
    FelementCode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FantsapfRefCode : Integer;
    FantsapfRefName : WideString;
    FdefectRefCode : Integer;
    FdefectRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower;
    property highVoltage : TXSDecimal read FhighVoltage write FhighVoltage;
    property lowVoltage : TXSDecimal read FlowVoltage write FlowVoltage;
    property highCurrent : TXSDecimal read FhighCurrent write FhighCurrent;
    property lowCurrent : TXSDecimal read FlowCurrent write FlowCurrent;
    property ukz : TXSDecimal read Fukz write Fukz;
    property manufacturingdPlant : WideString read FmanufacturingdPlant write FmanufacturingdPlant;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property manufactureYear : TXSDate read FmanufactureYear write FmanufactureYear;
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property removalDate : TXSDate read FremovalDate write FremovalDate;
    property connectGroup : WideString read FconnectGroup write FconnectGroup;
    property dpxx : TXSDecimal read Fdpxx write Fdpxx;
    property ixx : TXSDecimal read Fixx write Fixx;
    property dpkz : TXSDecimal read Fdpkz write Fdpkz;
    property defectDescription : WideString read FdefectDescription write FdefectDescription;
    property defectDate : TXSDate read FdefectDate write FdefectDate;

    property transformerTypeCode : Integer read FtransformerTypeCode write FtransformerTypeCode;
    property transformerTypeName : WideString read FtransformerTypeName write FtransformerTypeName;
    property substation04RefCode : Integer read Fsubstation04RefCode write Fsubstation04RefCode;
    property substation04RefName : WideString read Fsubstation04RefName write Fsubstation04RefName;
    property substation04RefBuhName : WideString read Fsubstation04RefBuhName write Fsubstation04RefBuhName;
    property substation04RefInvNumber : WideString read Fsubstation04RefInvNumber write Fsubstation04RefInvNumber;
    property substation04RefNominalPower : TXSDecimal read Fsubstation04RefNominalPower write Fsubstation04RefNominalPower;
    property substation04RefLastRepairDate : TXSDate read Fsubstation04RefLastRepairDate write Fsubstation04RefLastRepairDate;
    property substation04RefSizCode : Integer read Fsubstation04RefSizCode write Fsubstation04RefSizCode;
    property substation04RefAddress : WideString read Fsubstation04RefAddress write Fsubstation04RefAddress;
    property substation04RefYearBuild : Integer read Fsubstation04RefYearBuild write Fsubstation04RefYearBuild;
    property substation04RefYearWorkingStart : Integer read Fsubstation04RefYearWorkingStart write Fsubstation04RefYearWorkingStart;
    property substation04RefChambersQuantity : Integer read Fsubstation04RefChambersQuantity write Fsubstation04RefChambersQuantity;
    property substation04RefPeriodInspect : Integer read Fsubstation04RefPeriodInspect write Fsubstation04RefPeriodInspect;
    property elementCode : Integer read FelementCode write FelementCode;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property antsapfRefCode : Integer read FantsapfRefCode write FantsapfRefCode;
    property antsapfRefName : WideString read FantsapfRefName write FantsapfRefName;
    property defectRefCode : Integer read FdefectRefCode write FdefectRefCode;
    property defectRefName : WideString read FdefectRefName write FdefectRefName;
  end;

  ArrayOfENTransformerShort = array of ENTransformerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransformerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransformerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransformerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransformerController/message/
  // soapAction: http://ksoe.org/ENTransformerController/action/ENTransformerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransformerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransformerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransformerControllerSoapPort = interface(IInvokable)
  ['{1afd1afd-1afd-1afd-1afd-1afd1afd1afd}']
    function add(const aENTransformer: ENTransformer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransformer: ENTransformer); stdcall;
    function getObject(const anObjectCode: Integer): ENTransformer; stdcall;
    function getList: ENTransformerShortList; stdcall;
    function getFilteredList(const aENTransformerFilter: ENTransformerFilter): ENTransformerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransformerShortList; stdcall;
    function getScrollableFilteredList(const aENTransformerFilter: ENTransformerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransformerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTransformerFilter: ENTransformerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTransformerShort; stdcall;
  end;


implementation

  destructor ENTransformer.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FhighVoltage) then
      highVoltage.Free;
    if Assigned(FlowVoltage) then
      lowVoltage.Free;
    if Assigned(FhighCurrent) then
      highCurrent.Free;
    if Assigned(FlowCurrent) then
      lowCurrent.Free;
    if Assigned(Fukz) then
      ukz.Free;
    if Assigned(FmanufactureYear) then
      manufactureYear.Free;
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FremovalDate) then
      removalDate.Free;
    if Assigned(Fdpxx) then
      dpxx.Free;
    if Assigned(Fixx) then
      ixx.Free;
    if Assigned(Fdpkz) then
      dpkz.Free;
    if Assigned(FdefectDate) then
      defectDate.Free;
    if Assigned(FtransformerType) then
      transformerType.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FantsapfRef) then
      antsapfRef.Free;
    if Assigned(FdefectRef) then
      defectRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTransformerFilter.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FhighVoltage) then
      highVoltage.Free;
    if Assigned(FlowVoltage) then
      lowVoltage.Free;
    if Assigned(FhighCurrent) then
      highCurrent.Free;
    if Assigned(FlowCurrent) then
      lowCurrent.Free;
    if Assigned(Fukz) then
      ukz.Free;
    if Assigned(FmanufactureYear) then
      manufactureYear.Free;
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FremovalDate) then
      removalDate.Free;
    if Assigned(Fdpxx) then
      dpxx.Free;
    if Assigned(Fixx) then
      ixx.Free;
    if Assigned(Fdpkz) then
      dpkz.Free;
    if Assigned(FdefectDate) then
      defectDate.Free;
    if Assigned(FtransformerType) then
      transformerType.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FantsapfRef) then
      antsapfRef.Free;
    if Assigned(FdefectRef) then
      defectRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTransformerFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTransformerShort.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FhighVoltage) then
      highVoltage.Free;
    if Assigned(FlowVoltage) then
      lowVoltage.Free;
    if Assigned(FhighCurrent) then
      highCurrent.Free;
    if Assigned(FlowCurrent) then
      lowCurrent.Free;
    if Assigned(Fukz) then
      ukz.Free;
    if Assigned(FmanufactureYear) then
      manufactureYear.Free;
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FremovalDate) then
      removalDate.Free;
    if Assigned(Fdpxx) then
      dpxx.Free;
    if Assigned(Fixx) then
      ixx.Free;
    if Assigned(Fdpkz) then
      dpkz.Free;
    if Assigned(FdefectDate) then
      defectDate.Free;
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENTransformerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransformer, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformer');
  RemClassRegistry.RegisterXSClass(ENTransformerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerRef');
  RemClassRegistry.RegisterXSClass(ENTransformerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerFilter');
  RemClassRegistry.RegisterXSClass(ENTransformerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerShort');
  RemClassRegistry.RegisterXSClass(ENTransformerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransformerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransformerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransformerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransformerControllerSoapPort), 'http://ksoe.org/ENTransformerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransformerControllerSoapPort), 'http://ksoe.org/ENTransformerController/action/ENTransformerController.%operationName%');


end.
