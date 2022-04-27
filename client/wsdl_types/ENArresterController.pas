unit ENArresterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENArresterTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENArresterSiteController 
   ,ENHighVoltageSellController 
   ,ENLowVoltBoardController 
   ,ENSubst150VRUZRUController
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

  ENArrester            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArresterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArrester = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
//???
    FarresterType : ENArresterType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FarresterSite : ENArresterSite;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    FlowVoltBoard : ENLowVoltBoard;
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property arresterType : ENArresterType read FarresterType write FarresterType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property arresterSite : ENArresterSite read FarresterSite write FarresterSite; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property lowVoltBoard : ENLowVoltBoard read FlowVoltBoard write FlowVoltBoard; 
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
  
{
  ENArresterFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
//???
    FarresterType : ENArresterType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FarresterSite : ENArresterSite;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    FlowVoltBoard : ENLowVoltBoard;
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property arresterType : ENArresterType read FarresterType write FarresterType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property arresterSite : ENArresterSite read FarresterSite write FarresterSite; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property lowVoltBoard : ENLowVoltBoard read FlowVoltBoard write FlowVoltBoard; 
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
}

  ENArresterFilter = class(ENArrester)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENArresterShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FarresterTypeCode : Integer; 
    FarresterTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FarresterSiteCode : Integer; 
    FarresterSiteName : WideString;
    Fsubstation04Code: Integer;
    Fsubstation04Name: WideString;
    FhighvoltageSellCode : Integer;
    FhighvoltageSellName : WideString;
    FhighvoltageSellNumberGen : WideString;
    FlowVoltBoardCode : Integer; 
    FlowVoltBoardName : WideString;
Fsubst150VruZruRefCode : Integer;
    Fsubst150VruZruRefNameDisp : WideString;
    Fsubst150VruZruRefName : WideString;
    Fsubst150VruZruRefInstallDate : TXSDate;
    Fsubst150VruZruRefCommentGen : WideString;
    Fsubst150VruZruRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property arresterTypeCode : Integer read FarresterTypeCode write FarresterTypeCode; 
    property arresterTypeName : WideString read FarresterTypeName write FarresterTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property arresterSiteCode : Integer read FarresterSiteCode write FarresterSiteCode; 
    property arresterSiteName : WideString read FarresterSiteName write FarresterSiteName; 
    property substation04Code: Integer read Fsubstation04Code write Fsubstation04Code;
    property substation04Name: WideString read Fsubstation04Name write Fsubstation04Name;
    property highvoltageSellCode : Integer read FhighvoltageSellCode write FhighvoltageSellCode;
    property highvoltageSellName : WideString read FhighvoltageSellName write FhighvoltageSellName; 
    property highvoltageSellNumberGen : WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen; 
    property lowVoltBoardCode : Integer read FlowVoltBoardCode write FlowVoltBoardCode; 
    property lowVoltBoardName : WideString read FlowVoltBoardName write FlowVoltBoardName; 
 property subst150VruZruRefCode : Integer read Fsubst150VruZruRefCode write Fsubst150VruZruRefCode;
    property subst150VruZruRefNameDisp : WideString read Fsubst150VruZruRefNameDisp write Fsubst150VruZruRefNameDisp;
    property subst150VruZruRefName : WideString read Fsubst150VruZruRefName write Fsubst150VruZruRefName;
    property subst150VruZruRefInstallDate : TXSDate read Fsubst150VruZruRefInstallDate write Fsubst150VruZruRefInstallDate;
    property subst150VruZruRefCommentGen : WideString read Fsubst150VruZruRefCommentGen write Fsubst150VruZruRefCommentGen;
    property subst150VruZruRefUserGen : WideString read Fsubst150VruZruRefUserGen write Fsubst150VruZruRefUserGen;
  end;

  ArrayOfENArresterShort = array of ENArresterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENArresterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENArresterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENArresterShort read Flist write Flist;
  end;

  //ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENArresterController/message/
  // soapAction: http://ksoe.org/ENArresterController/action/ENArresterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENArresterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENArresterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENArresterControllerSoapPort = interface(IInvokable)
  ['{17c417c4-17c4-17c4-17c4-17c417c417c4}']
    function  add(const aENArrester: ENArrester): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENArrester: ENArrester); stdcall;
    function  getObject(const anObjectCode: Integer): ENArrester; stdcall;
    function  getList: ENArresterShortList; stdcall;
    function  getFilteredList(const aENArresterFilter: ENArresterFilter): ENArresterShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENArresterShortList; stdcall;
    function  getScrollableFilteredList(const aENArresterFilter: ENArresterFilter; const aFromPosition: Integer; const aQuantity: Integer): ENArresterShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENArresterShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENArresterFilter: ENArresterFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENArrester.Destroy;
  begin
    if Assigned(FarresterType) then
      arresterType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FarresterSite) then
      arresterSite.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
 if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENArresterFilter.Destroy;
  begin
    if Assigned(FarresterType) then
      arresterType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FarresterSite) then
      arresterSite.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(FlowVoltBoard) then
      lowVoltBoard.Free;
if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENArresterFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENArresterShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
 if Assigned(Fsubst150VruZruRefInstallDate) then
      subst150VruZruRefInstallDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENArresterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENArrester, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArrester');
  RemClassRegistry.RegisterXSClass(ENArresterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterRef');
  RemClassRegistry.RegisterXSClass(ENArresterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterFilter');
  RemClassRegistry.RegisterXSClass(ENArresterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterShort');
  RemClassRegistry.RegisterXSClass(ENArresterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENArresterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENArresterShort');

  InvRegistry.RegisterInterface(TypeInfo(ENArresterControllerSoapPort), 'http://ksoe.org/ENArresterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENArresterControllerSoapPort), 'http://ksoe.org/ENArresterController/action/ENArresterController.%operationName%');


end.
