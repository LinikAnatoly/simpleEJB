unit ENLowVoltBoardController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLowVoltBoardTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENSubstation04Controller 
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

  ENLowVoltBoard            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLowVoltBoardRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLowVoltBoard = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
//???
    FlowVoltBoardTypeRef : ENLowVoltBoardTypeRef;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property lowVoltBoardTypeRef : ENLowVoltBoardTypeRef read FlowVoltBoardTypeRef write FlowVoltBoardTypeRef; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
  end;
  
{
  ENLowVoltBoardFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
//???
    FlowVoltBoardTypeRef : ENLowVoltBoardTypeRef;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FtransformerRef : ENTransformerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property lowVoltBoardTypeRef : ENLowVoltBoardTypeRef read FlowVoltBoardTypeRef write FlowVoltBoardTypeRef; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property transformerRef : ENTransformerRef read FtransformerRef write FtransformerRef; 
  end;
}

  ENLowVoltBoardFilter = class(ENLowVoltBoard)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLowVoltBoardShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FlowVoltBoardTypeRefCode : Integer; 
    FlowVoltBoardTypeRefName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
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

    property lowVoltBoardTypeRefCode : Integer read FlowVoltBoardTypeRefCode write FlowVoltBoardTypeRefCode; 
    property lowVoltBoardTypeRefName : WideString read FlowVoltBoardTypeRefName write FlowVoltBoardTypeRefName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
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

  ArrayOfENLowVoltBoardShort = array of ENLowVoltBoardShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLowVoltBoardShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLowVoltBoardShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLowVoltBoardShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLowVoltBoardController/message/
  // soapAction: http://ksoe.org/ENLowVoltBoardController/action/ENLowVoltBoardController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLowVoltBoardControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLowVoltBoardController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLowVoltBoardControllerSoapPort = interface(IInvokable)
  ['{f538f538-f538-f538-f538-f538f538f538}']
    function  add(const aENLowVoltBoard: ENLowVoltBoard): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLowVoltBoard: ENLowVoltBoard); stdcall;
    function  getObject(const anObjectCode: Integer): ENLowVoltBoard; stdcall;
    function  getList: ENLowVoltBoardShortList; stdcall;
    function  getFilteredList(const aENLowVoltBoardFilter: ENLowVoltBoardFilter): ENLowVoltBoardShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardShortList; stdcall;
    function  getScrollableFilteredList(const aENLowVoltBoardFilter: ENLowVoltBoardFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLowVoltBoardFilter: ENLowVoltBoardFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLowVoltBoard.Destroy;
  begin
    if Assigned(FlowVoltBoardTypeRef) then
      lowVoltBoardTypeRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENLowVoltBoardFilter.Destroy;
  begin
    if Assigned(FlowVoltBoardTypeRef) then
      lowVoltBoardTypeRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FtransformerRef) then
      transformerRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENLowVoltBoardFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLowVoltBoardShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
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
  
  destructor ENLowVoltBoardShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLowVoltBoard, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoard');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardRef');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardFilter');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardShort');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLowVoltBoardShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLowVoltBoardShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLowVoltBoardControllerSoapPort), 'http://ksoe.org/ENLowVoltBoardController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLowVoltBoardControllerSoapPort), 'http://ksoe.org/ENLowVoltBoardController/action/ENLowVoltBoardController.%operationName%');


end.
