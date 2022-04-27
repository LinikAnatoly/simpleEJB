unit ENDisconnectorController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDisconnectorTypeController 
   ,ENDisconnectorDriveTypeController 
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

  ENDisconnector            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnectorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDisconnector = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FdisconnectorType : ENDisconnectorType;
//???
    FdisconnectordriveType : ENDisconnectorDriveType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatDriveRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property disconnectorType : ENDisconnectorType read FdisconnectorType write FdisconnectorType; 
    property disconnectordriveType : ENDisconnectorDriveType read FdisconnectordriveType write FdisconnectordriveType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matDriveRef : TKMaterialsRef read FmatDriveRef write FmatDriveRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENDisconnectorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FdisconnectorType : ENDisconnectorType;
//???
    FdisconnectordriveType : ENDisconnectorDriveType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmatDriveRef : TKMaterialsRef;
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
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property disconnectorType : ENDisconnectorType read FdisconnectorType write FdisconnectorType; 
    property disconnectordriveType : ENDisconnectorDriveType read FdisconnectordriveType write FdisconnectordriveType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property matDriveRef : TKMaterialsRef read FmatDriveRef write FmatDriveRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENDisconnectorFilter = class(ENDisconnector)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDisconnectorShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FratedVoltage : TXSDecimal;
    FratedCurrent : TXSDecimal;
    FdisconnectorTypeCode : Integer; 
    FdisconnectorTypeName : WideString;
    FdisconnectordriveTypeCode : Integer; 
    FdisconnectordriveTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmatDriveRefCode : Integer;
    FmatDriveRefName : WideString;
    Fsubstation04Code: Integer;
    Fsubstation04Name: WideString;
    FhighvoltageSellCode : Integer;
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
    property ratedVoltage : TXSDecimal read FratedVoltage write FratedVoltage; 
    property ratedCurrent : TXSDecimal read FratedCurrent write FratedCurrent; 

    property disconnectorTypeCode : Integer read FdisconnectorTypeCode write FdisconnectorTypeCode; 
    property disconnectorTypeName : WideString read FdisconnectorTypeName write FdisconnectorTypeName; 
    property disconnectordriveTypeCode : Integer read FdisconnectordriveTypeCode write FdisconnectordriveTypeCode; 
    property disconnectordriveTypeName : WideString read FdisconnectordriveTypeName write FdisconnectordriveTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property matDriveRefCode : Integer read FmatDriveRefCode write FmatDriveRefCode; //TKMaterialsRef read FmatDriveRefCode write FmatDriveRefCode; 
    property matDriveRefName : WideString read FmatDriveRefName write FmatDriveRefName;
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

  ArrayOfENDisconnectorShort = array of ENDisconnectorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDisconnectorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDisconnectorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDisconnectorShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDisconnectorController/message/
  // soapAction: http://ksoe.org/ENDisconnectorController/action/ENDisconnectorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDisconnectorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDisconnectorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDisconnectorControllerSoapPort = interface(IInvokable)
  ['{16981698-1698-1698-1698-169816981698}']
    function  add(const aENDisconnector: ENDisconnector): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDisconnector: ENDisconnector); stdcall;
    function  getObject(const anObjectCode: Integer): ENDisconnector; stdcall;
    function  getList: ENDisconnectorShortList; stdcall;
    function  getFilteredList(const aENDisconnectorFilter: ENDisconnectorFilter): ENDisconnectorShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorShortList; stdcall;
    function  getScrollableFilteredList(const aENDisconnectorFilter: ENDisconnectorFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDisconnectorShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDisconnectorFilter: ENDisconnectorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENDisconnector.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
    if Assigned(FdisconnectorType) then
      disconnectorType.Free;
    if Assigned(FdisconnectordriveType) then
      disconnectordriveType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatDriveRef) then
      matDriveRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENDisconnectorFilter.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
    if Assigned(FdisconnectorType) then
      disconnectorType.Free;
    if Assigned(FdisconnectordriveType) then
      disconnectordriveType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmatDriveRef) then
      matDriveRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENDisconnectorFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENDisconnectorShort.Destroy;
  begin
    if Assigned(FratedVoltage) then
      ratedVoltage.Free;
    if Assigned(FratedCurrent) then
      ratedCurrent.Free;
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
  
  destructor ENDisconnectorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDisconnector, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnector');
  RemClassRegistry.RegisterXSClass(ENDisconnectorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorRef');
  RemClassRegistry.RegisterXSClass(ENDisconnectorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorFilter');
  RemClassRegistry.RegisterXSClass(ENDisconnectorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorShort');
  RemClassRegistry.RegisterXSClass(ENDisconnectorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDisconnectorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDisconnectorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDisconnectorShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDisconnectorControllerSoapPort), 'http://ksoe.org/ENDisconnectorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDisconnectorControllerSoapPort), 'http://ksoe.org/ENDisconnectorController/action/ENDisconnectorController.%operationName%');


end.
