unit ENPanelController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENMarkBusController 
   ,TKMaterialsController 
   ,ENPanelTypeController 
   ,ENArresterTypeController 
   ,ENElementController 
   ,ENLowVoltBoardController 
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

  ENPanel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPanelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPanel = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
//???
    FmarkBus : ENMarkBus;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatBusRef : TKMaterialsRef;
//???
    FmatArresterRef : TKMaterialsRef;
//???
    FpanelType : ENPanelType;
//???
    FarresterType : ENArresterType;
//???
    Felement : ENElement;
//???
    FlowVoltBoard : ENLowVoltBoardRef;
//???
    Ftransformer : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property markBus : ENMarkBus read FmarkBus write FmarkBus; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matBusRef : TKMaterialsRef read FmatBusRef write FmatBusRef; 
    property matArresterRef : TKMaterialsRef read FmatArresterRef write FmatArresterRef; 
    property panelType : ENPanelType read FpanelType write FpanelType; 
    property arresterType : ENArresterType read FarresterType write FarresterType; 
    property element : ENElement read Felement write Felement; 
    property lowVoltBoard : ENLowVoltBoardRef read FlowVoltBoard write FlowVoltBoard; 
    property transformer : ENTransformerRef read Ftransformer write Ftransformer; 
  end;
  
{
  ENPanelFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
//???
    FmarkBus : ENMarkBus;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatBusRef : TKMaterialsRef;
//???
    FmatArresterRef : TKMaterialsRef;
//???
    FpanelType : ENPanelType;
//???
    FarresterType : ENArresterType;
//???
    Felement : ENElement;
//???
    FlowVoltBoard : ENLowVoltBoardRef;
//???
    Ftransformer : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property markBus : ENMarkBus read FmarkBus write FmarkBus; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matBusRef : TKMaterialsRef read FmatBusRef write FmatBusRef; 
    property matArresterRef : TKMaterialsRef read FmatArresterRef write FmatArresterRef; 
    property panelType : ENPanelType read FpanelType write FpanelType; 
    property arresterType : ENArresterType read FarresterType write FarresterType; 
    property element : ENElement read Felement write Felement; 
    property lowVoltBoard : ENLowVoltBoardRef read FlowVoltBoard write FlowVoltBoard; 
    property transformer : ENTransformerRef read Ftransformer write Ftransformer; 
  end;
}

  ENPanelFilter = class(ENPanel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPanelShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FmarkBusCode : Integer; 
    FmarkBusName : WideString;
    FmarkBusBusSection : TXSDecimal;
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmatBusRefCode : Integer; 
    FmatBusRefName : WideString;
    FmatBusRefCost : TXSDecimal;
    FmatBusRefDeliveryDate : Integer; 
    FmatBusRefNumkatalog : WideString;
    FmatBusRefIdentid : WideString;
    FmatArresterRefCode : Integer;
    FmatArresterRefName : WideString;
    FmatArresterRefCost : TXSDecimal;
    FmatArresterRefDeliveryDate : Integer; 
    FmatArresterRefNumkatalog : WideString;
    FmatArresterRefIdentid : WideString;
    FpanelTypeCode : Integer; 
    FpanelTypeName : WideString;
    FarresterTypeCode : Integer; 
    FarresterTypeName : WideString;
    FelementCode : Integer; 
    FlowVoltBoardCode : Integer; 
    FlowVoltBoardName : WideString;
    FbranchNumberGen: WideString;
    FpanelName: WideString;
    FtransformerCode : Integer; 
    FtransformerInvNumber : WideString;
    FtransformerName : WideString;
    FtransformerBuhName : WideString;
    FtransformerNominalPower : TXSDecimal;
    FtransformerHighVoltage : TXSDecimal;
    FtransformerLowVoltage : TXSDecimal;
    FtransformerHighCurrent : TXSDecimal;
    FtransformerLowCurrent : TXSDecimal;
    FtransformerUkz : TXSDecimal;
    FtransformerManufacturingdPlant : WideString;
    FtransformerSerialNumber : WideString;
    FtransformerManufactureYear : TXSDate;
    FtransformerInstallDate : TXSDate;
    FtransformerRemovalDate : TXSDate;
    FtransformerConnectGroup : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property markBusCode : Integer read FmarkBusCode write FmarkBusCode; 
    property markBusName : WideString read FmarkBusName write FmarkBusName; 
    property markBusBusSection : TXSDecimal read FmarkBusBusSection write FmarkBusBusSection; 
    property materialRefCode: Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName: WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost: TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate: Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog: WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid: WideString read FmaterialRefIdentid write FmaterialRefIdentid;

    property matBusRefCode : Integer read FmatBusRefCode write FmatBusRefCode; //TKMaterialsRef read FmatBusRefCode write FmatBusRefCode; 
    property matBusRefName : WideString read FmatBusRefName write FmatBusRefName;
    property matBusRefCost : TXSDecimal read FmatBusRefCost write FmatBusRefCost; 
    property matBusRefDeliveryDate : Integer read FmatBusRefDeliveryDate write FmatBusRefDeliveryDate; 
    property matBusRefNumkatalog : WideString read FmatBusRefNumkatalog write FmatBusRefNumkatalog; 
    property matBusRefIdentid : WideString read FmatBusRefIdentid write FmatBusRefIdentid; 
    property matArresterRefCode : Integer read FmatArresterRefCode write FmatArresterRefCode; //TKMaterialsRef read FmatArresterRefCode write FmatArresterRefCode;     
    property matArresterRefName : WideString read FmatArresterRefName write FmatArresterRefName;
    property matArresterRefCost : TXSDecimal read FmatArresterRefCost write FmatArresterRefCost; 
    property matArresterRefDeliveryDate : Integer read FmatArresterRefDeliveryDate write FmatArresterRefDeliveryDate; 
    property matArresterRefNumkatalog : WideString read FmatArresterRefNumkatalog write FmatArresterRefNumkatalog; 
    property matArresterRefIdentid : WideString read FmatArresterRefIdentid write FmatArresterRefIdentid; 

    property panelTypeCode : Integer read FpanelTypeCode write FpanelTypeCode; 
    property panelTypeName : WideString read FpanelTypeName write FpanelTypeName; 
    property arresterTypeCode : Integer read FarresterTypeCode write FarresterTypeCode; 
    property arresterTypeName : WideString read FarresterTypeName write FarresterTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property lowVoltBoardCode : Integer read FlowVoltBoardCode write FlowVoltBoardCode; 
    property lowVoltBoardName : WideString read FlowVoltBoardName write FlowVoltBoardName;
    property branchNumberGen: WideString read FbranchNumberGen write FbranchNumberGen;
    property panelName: WideString read FpanelName write FpanelName; 
    property transformerCode : Integer read FtransformerCode write FtransformerCode; 
    property transformerInvNumber : WideString read FtransformerInvNumber write FtransformerInvNumber; 
    property transformerName : WideString read FtransformerName write FtransformerName; 
    property transformerBuhName : WideString read FtransformerBuhName write FtransformerBuhName; 
    property transformerNominalPower : TXSDecimal read FtransformerNominalPower write FtransformerNominalPower; 
    property transformerHighVoltage : TXSDecimal read FtransformerHighVoltage write FtransformerHighVoltage; 
    property transformerLowVoltage : TXSDecimal read FtransformerLowVoltage write FtransformerLowVoltage; 
    property transformerHighCurrent : TXSDecimal read FtransformerHighCurrent write FtransformerHighCurrent; 
    property transformerLowCurrent : TXSDecimal read FtransformerLowCurrent write FtransformerLowCurrent; 
    property transformerUkz : TXSDecimal read FtransformerUkz write FtransformerUkz; 
    property transformerManufacturingdPlant : WideString read FtransformerManufacturingdPlant write FtransformerManufacturingdPlant; 
    property transformerSerialNumber : WideString read FtransformerSerialNumber write FtransformerSerialNumber; 
    property transformerManufactureYear : TXSDate read FtransformerManufactureYear write FtransformerManufactureYear; 
    property transformerInstallDate : TXSDate read FtransformerInstallDate write FtransformerInstallDate; 
    property transformerRemovalDate : TXSDate read FtransformerRemovalDate write FtransformerRemovalDate; 
    property transformerConnectGroup : WideString read FtransformerConnectGroup write FtransformerConnectGroup;
  end;

  ArrayOfENPanelShort = array of ENPanelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPanelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPanelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPanelShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPanelController/message/
  // soapAction: http://ksoe.org/ENPanelController/action/ENPanelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPanelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPanelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPanelControllerSoapPort = interface(IInvokable)
  ['{ed95ed95-ed95-ed95-ed95-ed95ed95ed95}']
    function  add(const aENPanel: ENPanel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPanel: ENPanel); stdcall;
    function  getObject(const anObjectCode: Integer): ENPanel; stdcall;
    function  getList: ENPanelShortList; stdcall;
    function  getFilteredList(const aENPanelFilter: ENPanelFilter): ENPanelShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPanelShortList; stdcall;
    function  getScrollableFilteredList(const aENPanelFilter: ENPanelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPanelShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPanelShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPanelFilter: ENPanelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPanel.Destroy;
  begin
    if Assigned(FmarkBus) then
      markBus.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatBusRef) then
      matBusRef.Free;
    if Assigned(FmatArresterRef) then
      matArresterRef.Free;
    if Assigned(FpanelType) then
      panelType.Free;
    if Assigned(FarresterType) then
      arresterType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
    if Assigned(Ftransformer) then
      transformer.Free;
    inherited Destroy;
  end;

{  
  destructor ENPanelFilter.Destroy;
  begin
    if Assigned(FmarkBus) then
      markBus.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatBusRef) then
      matBusRef.Free;
    if Assigned(FmatArresterRef) then
      matArresterRef.Free;
    if Assigned(FpanelType) then
      panelType.Free;
    if Assigned(FarresterType) then
      arresterType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
    if Assigned(Ftransformer) then
      transformer.Free;
    inherited Destroy;
  end; 
}

  destructor ENPanelFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPanelShort.Destroy;
  begin
    if Assigned(FmarkBusBusSection) then
      markBusBusSection.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmatBusRefCost) then
      matBusRefCost.Free;
    if Assigned(FmatArresterRefCost) then
      matArresterRefCost.Free;
    if Assigned(FtransformerNominalPower) then
      transformerNominalPower.Free;
    if Assigned(FtransformerHighVoltage) then
      transformerHighVoltage.Free;
    if Assigned(FtransformerLowVoltage) then
      transformerLowVoltage.Free;
    if Assigned(FtransformerHighCurrent) then
      transformerHighCurrent.Free;
    if Assigned(FtransformerLowCurrent) then
      transformerLowCurrent.Free;
    if Assigned(FtransformerUkz) then
      transformerUkz.Free;
    if Assigned(FtransformerManufactureYear) then
      transformerManufactureYear.Free;
    if Assigned(FtransformerInstallDate) then
      transformerInstallDate.Free;
    if Assigned(FtransformerRemovalDate) then
      transformerRemovalDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENPanelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPanel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanel');
  RemClassRegistry.RegisterXSClass(ENPanelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelRef');
  RemClassRegistry.RegisterXSClass(ENPanelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelFilter');
  RemClassRegistry.RegisterXSClass(ENPanelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelShort');
  RemClassRegistry.RegisterXSClass(ENPanelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPanelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPanelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPanelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPanelControllerSoapPort), 'http://ksoe.org/ENPanelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPanelControllerSoapPort), 'http://ksoe.org/ENPanelController/action/ENPanelController.%operationName%');


end.
