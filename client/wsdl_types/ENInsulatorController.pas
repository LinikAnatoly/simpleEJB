unit ENInsulatorController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENInsulatorTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENHighVoltageSellController 
   ,ENLine10Controller 
   ,ENPostController 
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

  ENInsulator            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInsulatorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInsulator = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fvoltage : TXSDecimal;
    FnumberGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FinsulatorType : ENInsulatorType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property voltage : TXSDecimal read Fvoltage write Fvoltage; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property insulatorType : ENInsulatorType read FinsulatorType write FinsulatorType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENInsulatorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fvoltage : TXSDecimal;
    FnumberGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FinsulatorType : ENInsulatorType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property voltage : TXSDecimal read Fvoltage write Fvoltage; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property insulatorType : ENInsulatorType read FinsulatorType write FinsulatorType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENInsulatorFilter = class(ENInsulator)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENInsulatorShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fvoltage : TXSDecimal;
    FnumberGen : TXSDecimal;
    FinsulatorTypeCode : Integer; 
    FinsulatorTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FhighvoltageSellCode : Integer;
    Fsubstation04Code: Integer;
    Fsubstation04Name: WideString;
    FhighvoltageSellName : WideString;
    FhighvoltageSellNumberGen : WideString;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    FpostRefCode : Integer; 
    FpostRefName : WideString;
    FpostRefPostNumberGen : WideString;
    FpostRefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property voltage : TXSDecimal read Fvoltage write Fvoltage; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 

    property insulatorTypeCode : Integer read FinsulatorTypeCode write FinsulatorTypeCode; 
    property insulatorTypeName : WideString read FinsulatorTypeName write FinsulatorTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property substation04Code: Integer read Fsubstation04Code write Fsubstation04Code;
    property substation04Name: WideString read Fsubstation04Name write Fsubstation04Name;
    property highvoltageSellCode : Integer read FhighvoltageSellCode write FhighvoltageSellCode;
    property highvoltageSellName : WideString read FhighvoltageSellName write FhighvoltageSellName;
    property highvoltageSellNumberGen : WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen; 
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate; 
  end;

  ArrayOfENInsulatorShort = array of ENInsulatorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInsulatorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInsulatorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInsulatorShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInsulatorController/message/
  // soapAction: http://ksoe.org/ENInsulatorController/action/ENInsulatorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInsulatorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInsulatorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInsulatorControllerSoapPort = interface(IInvokable)
  ['{70567056-7056-7056-7056-705670567056}']
    function  add(const aENInsulator: ENInsulator): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInsulator: ENInsulator); stdcall;
    function  getObject(const anObjectCode: Integer): ENInsulator; stdcall;
    function  getList: ENInsulatorShortList; stdcall;
    function  getFilteredList(const aENInsulatorFilter: ENInsulatorFilter): ENInsulatorShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorShortList; stdcall;
    function  getScrollableFilteredList(const aENInsulatorFilter: ENInsulatorFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInsulatorShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENInsulatorFilter: ENInsulatorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENInsulator.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FinsulatorType) then
      insulatorType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENInsulatorFilter.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FinsulatorType) then
      insulatorType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    inherited Destroy;
  end; 
}

  destructor ENInsulatorFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENInsulatorShort.Destroy;
  begin
    if Assigned(Fvoltage) then
      voltage.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENInsulatorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInsulator, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulator');
  RemClassRegistry.RegisterXSClass(ENInsulatorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorRef');
  RemClassRegistry.RegisterXSClass(ENInsulatorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorFilter');
  RemClassRegistry.RegisterXSClass(ENInsulatorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorShort');
  RemClassRegistry.RegisterXSClass(ENInsulatorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInsulatorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInsulatorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInsulatorShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInsulatorControllerSoapPort), 'http://ksoe.org/ENInsulatorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInsulatorControllerSoapPort), 'http://ksoe.org/ENInsulatorController/action/ENInsulatorController.%operationName%');


end.
