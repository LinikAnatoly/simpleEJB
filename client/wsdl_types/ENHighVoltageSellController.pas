unit ENHighVoltageSellController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENHighVoltageSellTypeController 
   ,TKMaterialsController 
   ,ENElementController 
   ,ENTransformerController 
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

  ENHighVoltageSell            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltageSellRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltageSell = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FnumberGen : WideString;
    Fmodify_time : Int64;
//???
    FhighvoltageType : ENHighVoltageSellType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    FtransformerRef : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property highvoltageType : ENHighVoltageSellType read FhighvoltageType write FhighvoltageType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
  end;
  
{
  ENHighVoltageSellFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FnumberGen : WideString;
    Fmodify_time : Int64;
//???
    FhighvoltageType : ENHighVoltageSellType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    FtransformerRef : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property highvoltageType : ENHighVoltageSellType read FhighvoltageType write FhighvoltageType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
  end;
}

  ENHighVoltageSellFilter = class(ENHighVoltageSell)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENHighVoltageSellShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FnumberGen : WideString;
    FhighvoltageTypeCode : Integer; 
    FhighvoltageTypeName : WideString;
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FelementCode : Integer; 
    FtransformerRefCode : Integer; 
    FtransformerRefInvNumber : WideString;
    FtransformerRefName : WideString;
    FtransformerRefBuhName : WideString;
    FtransformerRefNominalPower : TXSDecimal;
    FtransformerRefHighVoltage : TXSDecimal;
    FtransformerRefLowVoltage : TXSDecimal;
    FtransformerRefHighCurrent : TXSDecimal;
    FtransformerRefLowCurrent : TXSDecimal;
    FtransformerRefUkz : TXSDecimal;
    FtransformerRefManufacturingdPlant : WideString;
    FtransformerRefSerialNumber : WideString;
    FtransformerRefManufactureYear : TXSDate;
    FtransformerRefInstallDate : TXSDate;
    FtransformerRefRemovalDate : TXSDate;
    FtransformerRefConnectGroup : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numberGen : WideString read FnumberGen write FnumberGen;

    property highvoltageTypeCode : Integer read FhighvoltageTypeCode write FhighvoltageTypeCode; 
    property highvoltageTypeName : WideString read FhighvoltageTypeName write FhighvoltageTypeName; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property transformerRefCode : Integer read FtransformerRefCode write FtransformerRefCode; 
    property transformerRefInvNumber : WideString read FtransformerRefInvNumber write FtransformerRefInvNumber; 
    property transformerRefName : WideString read FtransformerRefName write FtransformerRefName; 
    property transformerRefBuhName : WideString read FtransformerRefBuhName write FtransformerRefBuhName; 
    property transformerRefNominalPower : TXSDecimal read FtransformerRefNominalPower write FtransformerRefNominalPower; 
    property transformerRefHighVoltage : TXSDecimal read FtransformerRefHighVoltage write FtransformerRefHighVoltage; 
    property transformerRefLowVoltage : TXSDecimal read FtransformerRefLowVoltage write FtransformerRefLowVoltage; 
    property transformerRefHighCurrent : TXSDecimal read FtransformerRefHighCurrent write FtransformerRefHighCurrent; 
    property transformerRefLowCurrent : TXSDecimal read FtransformerRefLowCurrent write FtransformerRefLowCurrent; 
    property transformerRefUkz : TXSDecimal read FtransformerRefUkz write FtransformerRefUkz; 
    property transformerRefManufacturingdPlant : WideString read FtransformerRefManufacturingdPlant write FtransformerRefManufacturingdPlant; 
    property transformerRefSerialNumber : WideString read FtransformerRefSerialNumber write FtransformerRefSerialNumber; 
    property transformerRefManufactureYear : TXSDate read FtransformerRefManufactureYear write FtransformerRefManufactureYear; 
    property transformerRefInstallDate : TXSDate read FtransformerRefInstallDate write FtransformerRefInstallDate; 
    property transformerRefRemovalDate : TXSDate read FtransformerRefRemovalDate write FtransformerRefRemovalDate; 
    property transformerRefConnectGroup : WideString read FtransformerRefConnectGroup write FtransformerRefConnectGroup; 
  end;

  ArrayOfENHighVoltageSellShort = array of ENHighVoltageSellShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHighVoltageSellShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHighVoltageSellShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHighVoltageSellShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHighVoltageSellController/message/
  // soapAction: http://ksoe.org/ENHighVoltageSellController/action/ENHighVoltageSellController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHighVoltageSellControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHighVoltageSellController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHighVoltageSellControllerSoapPort = interface(IInvokable)
  ['{8dbd8dbd-8dbd-8dbd-8dbd-8dbd8dbd8dbd}']
    function  add(const aENHighVoltageSell: ENHighVoltageSell): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHighVoltageSell: ENHighVoltageSell); stdcall;
    function  getObject(const anObjectCode: Integer): ENHighVoltageSell; stdcall;
    function  getList: ENHighVoltageSellShortList; stdcall;
    function  getFilteredList(const aENHighVoltageSellFilter: ENHighVoltageSellFilter): ENHighVoltageSellShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellShortList; stdcall;
    function  getScrollableFilteredList(const aENHighVoltageSellFilter: ENHighVoltageSellFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltageSellShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENHighVoltageSellFilter: ENHighVoltageSellFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENHighVoltageSell.Destroy;
  begin
    if Assigned(FhighvoltageType) then
      highvoltageType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENHighVoltageSellFilter.Destroy;
  begin
    if Assigned(FhighvoltageType) then
      highvoltageType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENHighVoltageSellFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENHighVoltageSellShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FtransformerRefNominalPower) then
      transformerRefNominalPower.Free;
    if Assigned(FtransformerRefHighVoltage) then
      transformerRefHighVoltage.Free;
    if Assigned(FtransformerRefLowVoltage) then
      transformerRefLowVoltage.Free;
    if Assigned(FtransformerRefHighCurrent) then
      transformerRefHighCurrent.Free;
    if Assigned(FtransformerRefLowCurrent) then
      transformerRefLowCurrent.Free;
    if Assigned(FtransformerRefUkz) then
      transformerRefUkz.Free;
    if Assigned(FtransformerRefManufactureYear) then
      transformerRefManufactureYear.Free;
    if Assigned(FtransformerRefInstallDate) then
      transformerRefInstallDate.Free;
    if Assigned(FtransformerRefRemovalDate) then
      transformerRefRemovalDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENHighVoltageSellShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHighVoltageSell, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSell');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellRef');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellFilter');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellShort');
  RemClassRegistry.RegisterXSClass(ENHighVoltageSellShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltageSellShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHighVoltageSellShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHighVoltageSellShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHighVoltageSellControllerSoapPort), 'http://ksoe.org/ENHighVoltageSellController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHighVoltageSellControllerSoapPort), 'http://ksoe.org/ENHighVoltageSellController/action/ENHighVoltageSellController.%operationName%');


end.
