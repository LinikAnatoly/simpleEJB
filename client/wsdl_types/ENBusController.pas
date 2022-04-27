unit ENBusController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENInsulatorTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENHighVoltageSellController 
   ,ENMarkBusController 
   ,ENLowVoltBoardController 
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

  ENBus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FinsulatornumberGen : TXSDecimal;
    Flength : TXSDecimal;
    FlocationScheme : WideString;
    Fmodify_time : Int64;
//???
    FinsulatorType : ENInsulatorType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatInsulatorRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    FmarkBus : ENMarkBus;
//???
    FlowVoltBoard : ENLowVoltBoard;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property insulatornumberGen : TXSDecimal read FinsulatornumberGen write FinsulatornumberGen; 
    property length : TXSDecimal read Flength write Flength; 
    property locationScheme : WideString read FlocationScheme write FlocationScheme;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property insulatorType : ENInsulatorType read FinsulatorType write FinsulatorType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matInsulatorRef : TKMaterialsRef read FmatInsulatorRef write FmatInsulatorRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property markBus : ENMarkBus read FmarkBus write FmarkBus; 
    property lowVoltBoard : ENLowVoltBoard read FlowVoltBoard write FlowVoltBoard;

  end;

{
  ENBusFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FinsulatornumberGen : TXSDecimal;
    Flength : TXSDecimal;
    FlocationScheme : WideString;
    Fmodify_time : Int64;
//???
    FinsulatorType : ENInsulatorType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatInsulatorRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    FmarkBus : ENMarkBus;
//???
    FlowVoltBoard : ENLowVoltBoard;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property insulatornumberGen : TXSDecimal read FinsulatornumberGen write FinsulatornumberGen; 
    property length : TXSDecimal read Flength write Flength; 
    property locationScheme : WideString read FlocationScheme write FlocationScheme;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property insulatorType : ENInsulatorType read FinsulatorType write FinsulatorType; 
    property element : ENElement read Felement write Felement;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property matInsulatorRef : TKMaterialsRef read FmatInsulatorRef write FmatInsulatorRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell;
    property markBus : ENMarkBus read FmarkBus write FmarkBus;
    property lowVoltBoard : ENLowVoltBoard read FlowVoltBoard write FlowVoltBoard;
  end;
}

  ENBusFilter = class(ENBus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FinsulatornumberGen : TXSDecimal;
    Flength : TXSDecimal;
    FlocationScheme : WideString;
    FinsulatorTypeCode : Integer; 
    FinsulatorTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmatInsulatorRefCode : Integer;
    FmatInsulatorRefName : WideString;
    FhighvoltageSellCode : Integer; 
    FhighvoltageSellName : WideString;
    FhighvoltageSellNumberGen : WideString;
    FmarkBusCode : Integer; 
    FmarkBusName : WideString;
    FmarkBusBusSection : TXSDecimal;
    FlowVoltBoardCode : Integer;
    FlowVoltBoardName : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property insulatornumberGen : TXSDecimal read FinsulatornumberGen write FinsulatornumberGen; 
    property length : TXSDecimal read Flength write Flength; 
    property locationScheme : WideString read FlocationScheme write FlocationScheme;

    property insulatorTypeCode : Integer read FinsulatorTypeCode write FinsulatorTypeCode; 
    property insulatorTypeName : WideString read FinsulatorTypeName write FinsulatorTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property matInsulatorRefCode : Integer read FmatInsulatorRefCode write FmatInsulatorRefCode; //TKMaterialsRef read FmatInsulatorRefCode write FmatInsulatorRefCode;
    property matInsulatorRefName : WideString read FmatInsulatorRefName write FmatInsulatorRefName;
    property highvoltageSellCode : Integer read FhighvoltageSellCode write FhighvoltageSellCode; 
    property highvoltageSellName : WideString read FhighvoltageSellName write FhighvoltageSellName; 
    property highvoltageSellNumberGen : WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen; 
    property markBusCode : Integer read FmarkBusCode write FmarkBusCode; 
    property markBusName : WideString read FmarkBusName write FmarkBusName; 
    property markBusBusSection : TXSDecimal read FmarkBusBusSection write FmarkBusBusSection; 
    property lowVoltBoardCode : Integer read FlowVoltBoardCode write FlowVoltBoardCode; 
    property lowVoltBoardName : WideString read FlowVoltBoardName write FlowVoltBoardName; 
  end;

  ArrayOfENBusShort = array of ENBusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBusController/message/
  // soapAction: http://ksoe.org/ENBusController/action/ENBusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBusControllerSoapPort = interface(IInvokable)
  ['{10571057-1057-1057-1057-105710571057}']
    function  add(const aENBus: ENBus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBus: ENBus); stdcall;
    function  getObject(const anObjectCode: Integer): ENBus; stdcall;
    function  getList: ENBusShortList; stdcall;
    function  getFilteredList(const aENBusFilter: ENBusFilter): ENBusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBusShortList; stdcall;
    function  getScrollableFilteredList(const aENBusFilter: ENBusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBusFilter: ENBusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENBus.Destroy;
  begin
    if Assigned(FinsulatornumberGen) then
      insulatornumberGen.Free;
    if Assigned(Flength) then
      length.Free;
    if Assigned(FinsulatorType) then
      insulatorType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatInsulatorRef) then
      matInsulatorRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(FmarkBus) then
      markBus.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
    inherited Destroy;
  end;

{  
  destructor ENBusFilter.Destroy;
  begin
    if Assigned(FinsulatornumberGen) then
      insulatornumberGen.Free;
    if Assigned(Flength) then
      length.Free;
    if Assigned(FinsulatorType) then
      insulatorType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatInsulatorRef) then
      matInsulatorRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(FmarkBus) then
      markBus.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
    inherited Destroy;
  end; 
}

  destructor ENBusFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENBusShort.Destroy;
  begin
    if Assigned(FinsulatornumberGen) then
      insulatornumberGen.Free;
    if Assigned(Flength) then
      length.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmarkBusBusSection) then
      markBusBusSection.Free;
    inherited Destroy;
  end; 
  
  destructor ENBusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBus');
  RemClassRegistry.RegisterXSClass(ENBusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBusRef');
  RemClassRegistry.RegisterXSClass(ENBusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBusFilter');
  RemClassRegistry.RegisterXSClass(ENBusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBusShort');
  RemClassRegistry.RegisterXSClass(ENBusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBusControllerSoapPort), 'http://ksoe.org/ENBusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBusControllerSoapPort), 'http://ksoe.org/ENBusController/action/ENBusController.%operationName%');


end.
