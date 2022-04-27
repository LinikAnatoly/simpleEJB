unit ENFiderGuageController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSubstation04Controller 
   ,ENTransformerController 
   ,ENBranchController 
   ,ENAntsapfPositionController 
   //,EPWorkerController 
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

  ENFiderGuage            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFiderGuageRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFiderGuage = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcurrentPhaseYellow : TXSDecimal;
    FcurrentPhaseGreen : TXSDecimal;
    FcurrentPhaseRed : TXSDecimal;
    FtensionPhaseYellow : TXSDecimal;
    FtensionPhaseGreen : TXSDecimal;
    FtensionPhaseRed : TXSDecimal;
    FdateGuage : TXSDateTime;
    FisGenSwitchDev : Integer; 
//???
    Fsubstation04 : ENSubstation04Ref;
//???
    Ftransformer : ENTransformerRef;
//???
    FbranchRef : ENBranchRef;
//???
    Fworker : EPWorker;
//???
    FancapfPosRef : ENAntsapfPositionRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property currentPhaseYellow : TXSDecimal read FcurrentPhaseYellow write FcurrentPhaseYellow; 
    property currentPhaseGreen : TXSDecimal read FcurrentPhaseGreen write FcurrentPhaseGreen; 
    property currentPhaseRed : TXSDecimal read FcurrentPhaseRed write FcurrentPhaseRed; 
    property tensionPhaseYellow : TXSDecimal read FtensionPhaseYellow write FtensionPhaseYellow; 
    property tensionPhaseGreen : TXSDecimal read FtensionPhaseGreen write FtensionPhaseGreen; 
    property tensionPhaseRed : TXSDecimal read FtensionPhaseRed write FtensionPhaseRed; 
    property dateGuage : TXSDateTime read FdateGuage write FdateGuage;
    property isGenSwitchDev : Integer read FisGenSwitchDev write FisGenSwitchDev;
    property substation04 : ENSubstation04Ref read Fsubstation04 write Fsubstation04; 
    property transformer : ENTransformerRef read Ftransformer write Ftransformer; 
    property branchRef : ENBranchRef read FbranchRef write FbranchRef; 
    property worker : EPWorker read Fworker write Fworker; 
    property ancapfPosRef : ENAntsapfPositionRef read FancapfPosRef write FancapfPosRef;
  end;
  
{
  ENFiderGuageFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcurrentPhaseYellow : TXSDecimal;
    FcurrentPhaseGreen : TXSDecimal;
    FcurrentPhaseRed : TXSDecimal;
    FtensionPhaseYellow : TXSDecimal;
    FtensionPhaseGreen : TXSDecimal;
    FtensionPhaseRed : TXSDecimal;
    FdateGuage : TXSDateTime;
    FisGenSwitchDev : Integer; 
//???
    Fsubstation04 : ENSubstation04Ref;
//???
    Ftransformer : ENTransformerRef;
//???
    FbranchRef : ENBranchRef;
//???
    Fworker : EPWorker;
//???
    FancapfPosRef : ENAntsapfPositionRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property currentPhaseYellow : TXSDecimal read FcurrentPhaseYellow write FcurrentPhaseYellow; 
    property currentPhaseGreen : TXSDecimal read FcurrentPhaseGreen write FcurrentPhaseGreen; 
    property currentPhaseRed : TXSDecimal read FcurrentPhaseRed write FcurrentPhaseRed; 
    property tensionPhaseYellow : TXSDecimal read FtensionPhaseYellow write FtensionPhaseYellow; 
    property tensionPhaseGreen : TXSDecimal read FtensionPhaseGreen write FtensionPhaseGreen; 
    property tensionPhaseRed : TXSDecimal read FtensionPhaseRed write FtensionPhaseRed; 
    property dateGuage : TXSDateTime read FdateGuage write FdateGuage;
    property  isGenSwitchDev : Integer read FisGenSwitchDev write FisGenSwitchDev; 
    property substation04 : ENSubstation04Ref read Fsubstation04 write Fsubstation04; 
    property transformer : ENTransformerRef read Ftransformer write Ftransformer; 
    property branchRef : ENBranchRef read FbranchRef write FbranchRef; 
    property worker : EPWorker read Fworker write Fworker; 
    property ancapfPosRef : ENAntsapfPositionRef read FancapfPosRef write FancapfPosRef; 
  end;
}

  ENFiderGuageFilter = class(ENFiderGuage)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENFiderGuageShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcurrentPhaseYellow : TXSDecimal;
    FcurrentPhaseGreen : TXSDecimal;
    FcurrentPhaseRed : TXSDecimal;
    FtensionPhaseYellow : TXSDecimal;
    FtensionPhaseGreen : TXSDecimal;
    FtensionPhaseRed : TXSDecimal;
    FdateGuage: TXSDateTime;
    Fsubstation04Code : Integer; 
    Fsubstation04Name : WideString;
    Fsubstation04BuhName : WideString;
    Fsubstation04InvNumber : WideString;
    Fsubstation04NominalPower : TXSDecimal;
    Fsubstation04LastRepairDate : TXSDate;
    Fsubstation04SizCode : Integer; 
    Fsubstation04Address : WideString;
    Fsubstation04YearBuild : Integer; 
    Fsubstation04YearWorkingStart : Integer; 
    Fsubstation04ChambersQuantity : Integer; 
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
    FbranchRefCode : Integer; 
    FbranchRefName : WideString;
    FbranchRefBasicConsumer : WideString;
    FbranchRefNumberGen : WideString;
    FbranchRefCurrentAdmis : TXSDecimal;
    FworkerCode : Integer;
    FworkerSurname: WideString;
    FworkerName: WideString;
    FworkerPatronimic: WideString;
    FpanelName: WideString;
    FancapfPosRefCode : Integer; 
    FancapfPosRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property currentPhaseYellow : TXSDecimal read FcurrentPhaseYellow write FcurrentPhaseYellow; 
    property currentPhaseGreen : TXSDecimal read FcurrentPhaseGreen write FcurrentPhaseGreen; 
    property currentPhaseRed : TXSDecimal read FcurrentPhaseRed write FcurrentPhaseRed; 
    property tensionPhaseYellow : TXSDecimal read FtensionPhaseYellow write FtensionPhaseYellow; 
    property tensionPhaseGreen : TXSDecimal read FtensionPhaseGreen write FtensionPhaseGreen; 
    property tensionPhaseRed : TXSDecimal read FtensionPhaseRed write FtensionPhaseRed; 
    property dateGuage: TXSDateTime read FdateGuage write FdateGuage;
    property substation04Code : Integer read Fsubstation04Code write Fsubstation04Code; 
    property substation04Name : WideString read Fsubstation04Name write Fsubstation04Name; 
    property substation04BuhName : WideString read Fsubstation04BuhName write Fsubstation04BuhName; 
    property substation04InvNumber : WideString read Fsubstation04InvNumber write Fsubstation04InvNumber; 
    property substation04NominalPower : TXSDecimal read Fsubstation04NominalPower write Fsubstation04NominalPower; 
    property substation04LastRepairDate : TXSDate read Fsubstation04LastRepairDate write Fsubstation04LastRepairDate; 
    property substation04SizCode : Integer read Fsubstation04SizCode write Fsubstation04SizCode; 
    property substation04Address : WideString read Fsubstation04Address write Fsubstation04Address; 
    property substation04YearBuild : Integer read Fsubstation04YearBuild write Fsubstation04YearBuild; 
    property substation04YearWorkingStart : Integer read Fsubstation04YearWorkingStart write Fsubstation04YearWorkingStart; 
    property substation04ChambersQuantity : Integer read Fsubstation04ChambersQuantity write Fsubstation04ChambersQuantity; 
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
    property branchRefCode : Integer read FbranchRefCode write FbranchRefCode; 
    property branchRefName : WideString read FbranchRefName write FbranchRefName; 
    property branchRefBasicConsumer : WideString read FbranchRefBasicConsumer write FbranchRefBasicConsumer; 
    property branchRefNumberGen : WideString read FbranchRefNumberGen write FbranchRefNumberGen; 
    property branchRefCurrentAdmis : TXSDecimal read FbranchRefCurrentAdmis write FbranchRefCurrentAdmis;
    property workerCode: Integer read FworkerCode write FworkerCode;
    property workerSurname: WideString read FworkerSurname write FworkerSurname;
    property workerName: WideString read FworkerName write FworkerName;
    property workerPatronimic: WideString read FworkerPatronimic write FworkerPatronimic;
    property panelName: WideString read FpanelName write FpanelName;
    property ancapfPosRefCode : Integer read FancapfPosRefCode write FancapfPosRefCode; 
    property ancapfPosRefName : WideString read FancapfPosRefName write FancapfPosRefName;
  end;

  ArrayOfENFiderGuageShort = array of ENFiderGuageShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFiderGuageShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFiderGuageShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFiderGuageShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFiderGuageController/message/
  // soapAction: http://ksoe.org/ENFiderGuageController/action/ENFiderGuageController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFiderGuageControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFiderGuageController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFiderGuageControllerSoapPort = interface(IInvokable)
  ['{c203c203-c203-c203-c203-c203c203c203}']
    function  add(const aENFiderGuage: ENFiderGuage): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFiderGuage: ENFiderGuage); stdcall;
    function  saveWithPermission(const aENFiderGuage: ENFiderGuage): Boolean; stdcall;
    function  getObject(const anObjectCode: Integer): ENFiderGuage; stdcall;
    function  getList: ENFiderGuageShortList; stdcall;
    function  getFilteredList(const aENFiderGuageFilter: ENFiderGuageFilter): ENFiderGuageShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFiderGuageShortList; stdcall;
    function  getScrollableFilteredList(const aENFiderGuageFilter: ENFiderGuageFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFiderGuageShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFiderGuageShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENFiderGuageFilter: ENFiderGuageFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENFiderGuage.Destroy;
  begin
    if Assigned(FcurrentPhaseYellow) then
      currentPhaseYellow.Free;
    if Assigned(FcurrentPhaseGreen) then
      currentPhaseGreen.Free;
    if Assigned(FcurrentPhaseRed) then
      currentPhaseRed.Free;
    if Assigned(FtensionPhaseYellow) then
      tensionPhaseYellow.Free;
    if Assigned(FtensionPhaseGreen) then
      tensionPhaseGreen.Free;
    if Assigned(FtensionPhaseRed) then
      tensionPhaseRed.Free;
    if Assigned(FdateGuage) then
      dateGuage.Free;
    if Assigned(Fsubstation04) then
      substation04.Free;
    if Assigned(Ftransformer) then
      transformer.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FancapfPosRef) then
      ancapfPosRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENFiderGuageFilter.Destroy;
  begin
    if Assigned(FcurrentPhaseYellow) then
      currentPhaseYellow.Free;
    if Assigned(FcurrentPhaseGreen) then
      currentPhaseGreen.Free;
    if Assigned(FcurrentPhaseRed) then
      currentPhaseRed.Free;
    if Assigned(FtensionPhaseYellow) then
      tensionPhaseYellow.Free;
    if Assigned(FtensionPhaseGreen) then
      tensionPhaseGreen.Free;
    if Assigned(FtensionPhaseRed) then
      tensionPhaseRed.Free;
    if Assigned(FdateGuage) then
      dateGuage.Free;
    if Assigned(Fsubstation04) then
      substation04.Free;
    if Assigned(Ftransformer) then
      transformer.Free;
    if Assigned(FbranchRef) then
      branchRef.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(FancapfPosRef) then
      ancapfPosRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENFiderGuageFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENFiderGuageShort.Destroy;
  begin
    if Assigned(FcurrentPhaseYellow) then
      currentPhaseYellow.Free;
    if Assigned(FcurrentPhaseGreen) then
      currentPhaseGreen.Free;
    if Assigned(FcurrentPhaseRed) then
      currentPhaseRed.Free;
    if Assigned(FtensionPhaseYellow) then
      tensionPhaseYellow.Free;
    if Assigned(FtensionPhaseGreen) then
      tensionPhaseGreen.Free;
    if Assigned(FtensionPhaseRed) then
      tensionPhaseRed.Free;
    if Assigned(Fsubstation04NominalPower) then
      substation04NominalPower.Free;
    if Assigned(Fsubstation04LastRepairDate) then
      substation04LastRepairDate.Free;
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
    if Assigned(FbranchRefCurrentAdmis) then
      branchRefCurrentAdmis.Free;
    inherited Destroy;
  end; 
  
  destructor ENFiderGuageShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFiderGuage, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFiderGuage');
  RemClassRegistry.RegisterXSClass(ENFiderGuageRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFiderGuageRef');
  RemClassRegistry.RegisterXSClass(ENFiderGuageFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFiderGuageFilter');
  RemClassRegistry.RegisterXSClass(ENFiderGuageShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFiderGuageShort');
  RemClassRegistry.RegisterXSClass(ENFiderGuageShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFiderGuageShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFiderGuageShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFiderGuageShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFiderGuageControllerSoapPort), 'http://ksoe.org/ENFiderGuageController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFiderGuageControllerSoapPort), 'http://ksoe.org/ENFiderGuageController/action/ENFiderGuageController.%operationName%');


end.
