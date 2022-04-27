unit ENSafetyPrecautionsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSubstation04Controller 
   ,ENHighVoltageSellController 
   ,ENLockTypeController 
   ,TKMaterialsController 
   ,ENFencingController 
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

  ENSafetyPrecautions            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSafetyPrecautionsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSafetyPrecautions = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
//???
    FlockType : ENLockType;
//???
    FmatLockRef : TKMaterialsRef;
//???
    Ffencing : ENFencing;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell; 
    property lockType : ENLockType read FlockType write FlockType; 
    property matLockRef : TKMaterialsRef read FmatLockRef write FmatLockRef; 
    property fencing : ENFencing read Ffencing write Ffencing; 
  end;
  
{
  ENSafetyPrecautionsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
//???
    FlockType : ENLockType;
//???
    FmatLockRef : TKMaterialsRef;
//???
    Ffencing : ENFencing;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell; 
    property lockType : ENLockType read FlockType write FlockType; 
    property matLockRef : TKMaterialsRef read FmatLockRef write FmatLockRef; 
    property fencing : ENFencing read Ffencing write Ffencing; 
  end;
}

  ENSafetyPrecautionsFilter = class(ENSafetyPrecautions)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENSafetyPrecautionsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
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
    FhighVoltageSellCode : Integer; 
    FhighVoltageSellName : WideString;
    FhighVoltageSellNumberGen : WideString;
    FlockTypeCode : Integer; 
    FlockTypeName : WideString;
    FmatLockRefCode : Integer;
    FmatLockRefName : WideString; 
    FfencingCode : Integer;
    FfencingName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

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
    property highVoltageSellCode : Integer read FhighVoltageSellCode write FhighVoltageSellCode; 
    property highVoltageSellName : WideString read FhighVoltageSellName write FhighVoltageSellName; 
    property highVoltageSellNumberGen : WideString read FhighVoltageSellNumberGen write FhighVoltageSellNumberGen; 
    property lockTypeCode : Integer read FlockTypeCode write FlockTypeCode; 
    property lockTypeName : WideString read FlockTypeName write FlockTypeName; 
    property matLockRefCode : Integer read FmatLockRefCode write FmatLockRefCode; //TKMaterialsRef read FmatLockRefCode write FmatLockRefCode;
    property matLockRefName : WideString read FmatLockRefName write FmatLockRefName;
    property fencingCode : Integer read FfencingCode write FfencingCode; 
    property fencingName : WideString read FfencingName write FfencingName; 
  end;

  ArrayOfENSafetyPrecautionsShort = array of ENSafetyPrecautionsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSafetyPrecautionsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSafetyPrecautionsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSafetyPrecautionsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSafetyPrecautionsController/message/
  // soapAction: http://ksoe.org/ENSafetyPrecautionsController/action/ENSafetyPrecautionsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSafetyPrecautionsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSafetyPrecautionsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSafetyPrecautionsControllerSoapPort = interface(IInvokable)
  ['{14fa14fa-14fa-14fa-14fa-14fa14fa14fa}']
    function  add(const aENSafetyPrecautions: ENSafetyPrecautions): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSafetyPrecautions: ENSafetyPrecautions); stdcall;
    function  getObject(const anObjectCode: Integer): ENSafetyPrecautions; stdcall;
    function  getList: ENSafetyPrecautionsShortList; stdcall;
    function  getFilteredList(const aENSafetyPrecautionsFilter: ENSafetyPrecautionsFilter): ENSafetyPrecautionsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSafetyPrecautionsShortList; stdcall;
    function  getScrollableFilteredList(const aENSafetyPrecautionsFilter: ENSafetyPrecautionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSafetyPrecautionsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSafetyPrecautionsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSafetyPrecautionsFilter: ENSafetyPrecautionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENSafetyPrecautions.Destroy;
  begin
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    if Assigned(FlockType) then
      lockType.Free;
    if Assigned(FmatLockRef) then
      matLockRef.Free;
    if Assigned(Ffencing) then
      fencing.Free;
    inherited Destroy;
  end;

{  
  destructor ENSafetyPrecautionsFilter.Destroy;
  begin
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    if Assigned(FlockType) then
      lockType.Free;
    if Assigned(FmatLockRef) then
      matLockRef.Free;
    if Assigned(Ffencing) then
      fencing.Free;
    inherited Destroy;
  end; 
}

  destructor ENSafetyPrecautionsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENSafetyPrecautionsShort.Destroy;
  begin
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENSafetyPrecautionsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSafetyPrecautions, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSafetyPrecautions');
  RemClassRegistry.RegisterXSClass(ENSafetyPrecautionsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSafetyPrecautionsRef');
  RemClassRegistry.RegisterXSClass(ENSafetyPrecautionsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSafetyPrecautionsFilter');
  RemClassRegistry.RegisterXSClass(ENSafetyPrecautionsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSafetyPrecautionsShort');
  RemClassRegistry.RegisterXSClass(ENSafetyPrecautionsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSafetyPrecautionsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSafetyPrecautionsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSafetyPrecautionsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSafetyPrecautionsControllerSoapPort), 'http://ksoe.org/ENSafetyPrecautionsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSafetyPrecautionsControllerSoapPort), 'http://ksoe.org/ENSafetyPrecautionsController/action/ENSafetyPrecautionsController.%operationName%');


end.
