unit ENMeasurDeviceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENMeasurDeviceTypeController 
   ,ENScaleController 
   ,TKMaterialsController 
   ,ENBranchController 
   ,ENHighVoltageSellController 
   ,ENElementController 
   ,ENLowVoltBoardController 
   ,ENPanelController 
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

  ENMeasurDevice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDeviceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMeasurDevice = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FworkNumber : WideString;
    Fmodify_time : Int64;
//???
    FmeasurDeviceType : ENMeasurDeviceType;
//???
    Fscale : ENScale;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fbranch : ENBranch;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    Felement : ENElement;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property workNumber : WideString read FworkNumber write FworkNumber;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property measurDeviceType : ENMeasurDeviceType read FmeasurDeviceType write FmeasurDeviceType; 
    property scale : ENScale read Fscale write Fscale; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property branch : ENBranch read Fbranch write Fbranch; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property element : ENElement read Felement write Felement; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
  
{
  ENMeasurDeviceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FworkNumber : WideString;
    Fmodify_time : Int64;
//???
    FmeasurDeviceType : ENMeasurDeviceType;
//???
    Fscale : ENScale;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fbranch : ENBranch;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    Felement : ENElement;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property workNumber : WideString read FworkNumber write FworkNumber;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property measurDeviceType : ENMeasurDeviceType read FmeasurDeviceType write FmeasurDeviceType; 
    property scale : ENScale read Fscale write Fscale; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property branch : ENBranch read Fbranch write Fbranch; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property element : ENElement read Felement write Felement; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
}

  ENMeasurDeviceFilter = class(ENMeasurDevice)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMeasurDeviceShort = class(TRemotable)
  private
    Fcode: Integer; 
    Fname: WideString;
    FworkNumber: WideString;
    FmeasurDeviceTypeCode: Integer; 
    FmeasurDeviceTypeName: WideString;
    FscaleCode: Integer; 
    FscaleName: WideString;
    FmaterialRefCode: Integer;
    FmaterialRefName: WideString;
    FmaterialRefCost: TXSDecimal;
    FmaterialRefDeliveryDate: Integer;
    FmaterialRefNumkatalog: WideString;
    FmaterialRefIdentid: WideString;
    FbranchCode: Integer; 
    FbranchName: WideString;
    FbranchBasicConsumer: WideString;
    FbranchCurrentAdmis : TXSDecimal;
    FhighvoltageSellCode: Integer; 
    FhighvoltageSellName: WideString;
    FhighvoltageSellNumberGen: WideString;
    FelementCode: Integer;
    FbranchNumberGen: WideString;
    FpanelCode : Integer;
    FpanelName: WideString;
    FlvbRefCode : Integer; 
    FlvbRefName : WideString;
    FtransformerCode: Integer;
    FtransformerInvNumber: WideString;
    FtransformerName: WideString;
    FtransformerNominalPower: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property code: Integer read Fcode write Fcode;
    property name: WideString read Fname write Fname;
    property workNumber: WideString read FworkNumber write FworkNumber;
    property measurDeviceTypeCode: Integer read FmeasurDeviceTypeCode write FmeasurDeviceTypeCode;
    property measurDeviceTypeName: WideString read FmeasurDeviceTypeName write FmeasurDeviceTypeName;
    property scaleCode: Integer read FscaleCode write FscaleCode;
    property scaleName: WideString read FscaleName write FscaleName;
    property materialRefCode: Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName: WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost: TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate: Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog: WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid: WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property branchCode: Integer read FbranchCode write FbranchCode;
    property branchName: WideString read FbranchName write FbranchName;
    property branchBasicConsumer: WideString read FbranchBasicConsumer write FbranchBasicConsumer;
    property branchCurrentAdmis : TXSDecimal read FbranchCurrentAdmis write FbranchCurrentAdmis; 
    property highvoltageSellCode: Integer read FhighvoltageSellCode write FhighvoltageSellCode;
    property highvoltageSellName: WideString read FhighvoltageSellName write FhighvoltageSellName;
    property highvoltageSellNumberGen: WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen;
    property elementCode: Integer read FelementCode write FelementCode;
    property branchNumberGen: WideString read FbranchNumberGen write FbranchNumberGen;
    property panelCode : Integer read FpanelCode write FpanelCode; 
    property panelName: WideString read FpanelName write FpanelName;
    property lvbRefCode : Integer read FlvbRefCode write FlvbRefCode; 
    property lvbRefName : WideString read FlvbRefName write FlvbRefName;
    property transformerCode: Integer read FtransformerCode write FtransformerCode;
    property transformerInvNumber: WideString read FtransformerInvNumber write FtransformerInvNumber;
    property transformerName: WideString read FtransformerName write FtransformerName;
    property transformerNominalPower: TXSDecimal read FtransformerNominalPower write FtransformerNominalPower;
  end;

  ArrayOfENMeasurDeviceShort = array of ENMeasurDeviceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMeasurDeviceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMeasurDeviceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMeasurDeviceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMeasurDeviceController/message/
  // soapAction: http://ksoe.org/ENMeasurDeviceController/action/ENMeasurDeviceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMeasurDeviceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMeasurDeviceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMeasurDeviceControllerSoapPort = interface(IInvokable)
  ['{360e360e-360e-360e-360e-360e360e360e}']
    function  add(const aENMeasurDevice: ENMeasurDevice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMeasurDevice: ENMeasurDevice); stdcall;
    function  getObject(const anObjectCode: Integer): ENMeasurDevice; stdcall;
    function  getList: ENMeasurDeviceShortList; stdcall;
    function  getFilteredList(const aENMeasurDeviceFilter: ENMeasurDeviceFilter): ENMeasurDeviceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceShortList; stdcall;
    function  getScrollableFilteredList(const aENMeasurDeviceFilter: ENMeasurDeviceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMeasurDeviceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMeasurDeviceFilter: ENMeasurDeviceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENMeasurDevice.Destroy;
  begin
    if Assigned(FmeasurDeviceType) then
      measurDeviceType.Free;
    if Assigned(Fscale) then
      scale.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end;

{  
  destructor ENMeasurDeviceFilter.Destroy;
  begin
    if Assigned(FmeasurDeviceType) then
      measurDeviceType.Free;
    if Assigned(Fscale) then
      scale.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end; 
}

  destructor ENMeasurDeviceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENMeasurDeviceShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FbranchCurrentAdmis) then
      branchCurrentAdmis.Free;
    inherited Destroy;
  end; 
  
  destructor ENMeasurDeviceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMeasurDevice, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDevice');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceRef');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceFilter');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceShort');
  RemClassRegistry.RegisterXSClass(ENMeasurDeviceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMeasurDeviceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMeasurDeviceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMeasurDeviceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMeasurDeviceControllerSoapPort), 'http://ksoe.org/ENMeasurDeviceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMeasurDeviceControllerSoapPort), 'http://ksoe.org/ENMeasurDeviceController/action/ENMeasurDeviceController.%operationName%');


end.
