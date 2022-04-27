unit ENLoadSwitchController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLoadSwitchTypeController 
   ,ENLoadSwitchDriveTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENHighVoltageSellController 
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

  ENLoadSwitch            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitchRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLoadSwitch = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FloadswitchType : ENLoadSwitchType;
//???
    FloadswitchdriveType : ENLoadSwitchDriveType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatDriveRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property loadswitchType : ENLoadSwitchType read FloadswitchType write FloadswitchType; 
    property loadswitchdriveType : ENLoadSwitchDriveType read FloadswitchdriveType write FloadswitchdriveType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matDriveRef : TKMaterialsRef read FmatDriveRef write FmatDriveRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
  
{
  ENLoadSwitchFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FloadswitchType : ENLoadSwitchType;
//???
    FloadswitchdriveType : ENLoadSwitchDriveType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatDriveRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
    Fsubst150VruZruRef : ENSubst150VRUZRURef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property loadswitchType : ENLoadSwitchType read FloadswitchType write FloadswitchType; 
    property loadswitchdriveType : ENLoadSwitchDriveType read FloadswitchdriveType write FloadswitchdriveType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matDriveRef : TKMaterialsRef read FmatDriveRef write FmatDriveRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property subst150VruZruRef : ENSubst150VRUZRURef read Fsubst150VruZruRef write Fsubst150VruZruRef;
  end;
}

  ENLoadSwitchFilter = class(ENLoadSwitch)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLoadSwitchShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    FloadswitchTypeCode : Integer; 
    FloadswitchTypeName : WideString;
    FloadswitchdriveTypeCode : Integer; 
    FloadswitchdriveTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmatDriveRefCode : Integer;
    FmatDriveRefName : WideString;
    FhighvoltageSellCode : Integer; 
    FhighvoltageSellName : WideString;
    FhighvoltageSellNumberGen : WideString;
    Fsubstation04Code: Integer;
    Fsubstation04Name: WideString;
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
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 

    property loadswitchTypeCode : Integer read FloadswitchTypeCode write FloadswitchTypeCode; 
    property loadswitchTypeName : WideString read FloadswitchTypeName write FloadswitchTypeName; 
    property loadswitchdriveTypeCode : Integer read FloadswitchdriveTypeCode write FloadswitchdriveTypeCode; 
    property loadswitchdriveTypeName : WideString read FloadswitchdriveTypeName write FloadswitchdriveTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property matDriveRefCode : Integer read FmatDriveRefCode write FmatDriveRefCode; //TKMaterialsRef read FmatDriveRefCode write FmatDriveRefCode; 
    property matDriveRefName : WideString read FmatDriveRefName write FmatDriveRefName;
    property highvoltageSellCode : Integer read FhighvoltageSellCode write FhighvoltageSellCode; 
    property highvoltageSellName : WideString read FhighvoltageSellName write FhighvoltageSellName; 
    property highvoltageSellNumberGen : WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen;
    property substation04Code: Integer read Fsubstation04Code write Fsubstation04Code;
    property substation04Name: WideString read Fsubstation04Name write Fsubstation04Name; 
    property subst150VruZruRefCode : Integer read Fsubst150VruZruRefCode write Fsubst150VruZruRefCode;
    property subst150VruZruRefNameDisp : WideString read Fsubst150VruZruRefNameDisp write Fsubst150VruZruRefNameDisp;
    property subst150VruZruRefName : WideString read Fsubst150VruZruRefName write Fsubst150VruZruRefName;
    property subst150VruZruRefInstallDate : TXSDate read Fsubst150VruZruRefInstallDate write Fsubst150VruZruRefInstallDate;
    property subst150VruZruRefCommentGen : WideString read Fsubst150VruZruRefCommentGen write Fsubst150VruZruRefCommentGen;
    property subst150VruZruRefUserGen : WideString read Fsubst150VruZruRefUserGen write Fsubst150VruZruRefUserGen;
  end;

  ArrayOfENLoadSwitchShort = array of ENLoadSwitchShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLoadSwitchShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLoadSwitchShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLoadSwitchShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLoadSwitchController/message/
  // soapAction: http://ksoe.org/ENLoadSwitchController/action/ENLoadSwitchController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLoadSwitchControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLoadSwitchController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLoadSwitchControllerSoapPort = interface(IInvokable)
  ['{894f894f-894f-894f-894f-894f894f894f}']
    function  add(const aENLoadSwitch: ENLoadSwitch): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLoadSwitch: ENLoadSwitch); stdcall;
    function  getObject(const anObjectCode: Integer): ENLoadSwitch; stdcall;
    function  getList: ENLoadSwitchShortList; stdcall;
    function  getFilteredList(const aENLoadSwitchFilter: ENLoadSwitchFilter): ENLoadSwitchShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchShortList; stdcall;
    function  getScrollableFilteredList(const aENLoadSwitchFilter: ENLoadSwitchFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLoadSwitchShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLoadSwitchFilter: ENLoadSwitchFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLoadSwitch.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
    if Assigned(FloadswitchType) then
      loadswitchType.Free;
    if Assigned(FloadswitchdriveType) then
      loadswitchdriveType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatDriveRef) then
      matDriveRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENLoadSwitchFilter.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
    if Assigned(FloadswitchType) then
      loadswitchType.Free;
    if Assigned(FloadswitchdriveType) then
      loadswitchdriveType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatDriveRef) then
      matDriveRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
if Assigned(Fsubst150VruZruRef) then
      subst150VruZruRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENLoadSwitchFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLoadSwitchShort.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
if Assigned(Fsubst150VruZruRefInstallDate) then
      subst150VruZruRefInstallDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENLoadSwitchShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLoadSwitch, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitch');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchRef');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchFilter');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchShort');
  RemClassRegistry.RegisterXSClass(ENLoadSwitchShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLoadSwitchShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLoadSwitchShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLoadSwitchShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLoadSwitchControllerSoapPort), 'http://ksoe.org/ENLoadSwitchController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLoadSwitchControllerSoapPort), 'http://ksoe.org/ENLoadSwitchController/action/ENLoadSwitchController.%operationName%');


end.
