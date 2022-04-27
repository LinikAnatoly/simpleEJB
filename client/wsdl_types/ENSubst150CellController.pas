unit ENSubst150CellController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENVoltageClassController 
   ,ENSubstation150Controller 
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

  ENSubst150Cell            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150CellRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubst150Cell = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef; 
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef; 
  end;
  
{
  ENSubst150CellFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FvoltageClassRef : ENVoltageClassRef;
//???
    FsubstationRef : ENSubstation150Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property voltageClassRef : ENVoltageClassRef read FvoltageClassRef write FvoltageClassRef; 
    property substationRef : ENSubstation150Ref read FsubstationRef write FsubstationRef; 
  end;
}

  ENSubst150CellFilter = class(ENSubst150Cell)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENSubst150CellShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FfactoryNumber : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FvoltageClassRefCode : Integer; 
    FvoltageClassRefValue : TXSDecimal;
    FvoltageClassRefDescription : WideString;
    FsubstationRefCode : Integer; 
    FsubstationRefName : WideString;
    FsubstationRefProjectPower : TXSDecimal;
    FsubstationRefOperativeService : WideString;
    FsubstationRefRepairService : WideString;
    FsubstationRefBuhName : WideString;
    FsubstationRefInvNumber : WideString;
    FsubstationRefSizCode : Integer; 
    FsubstationRefMolCode : WideString;
    FsubstationRefMolName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property factoryNumber : WideString read FfactoryNumber write FfactoryNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property voltageClassRefCode : Integer read FvoltageClassRefCode write FvoltageClassRefCode; 
    property voltageClassRefValue : TXSDecimal read FvoltageClassRefValue write FvoltageClassRefValue; 
    property voltageClassRefDescription : WideString read FvoltageClassRefDescription write FvoltageClassRefDescription; 
    property substationRefCode : Integer read FsubstationRefCode write FsubstationRefCode; 
    property substationRefName : WideString read FsubstationRefName write FsubstationRefName; 
    property substationRefProjectPower : TXSDecimal read FsubstationRefProjectPower write FsubstationRefProjectPower; 
    property substationRefOperativeService : WideString read FsubstationRefOperativeService write FsubstationRefOperativeService; 
    property substationRefRepairService : WideString read FsubstationRefRepairService write FsubstationRefRepairService; 
    property substationRefBuhName : WideString read FsubstationRefBuhName write FsubstationRefBuhName; 
    property substationRefInvNumber : WideString read FsubstationRefInvNumber write FsubstationRefInvNumber; 
    property substationRefSizCode : Integer read FsubstationRefSizCode write FsubstationRefSizCode; 
    property substationRefMolCode : WideString read FsubstationRefMolCode write FsubstationRefMolCode; 
    property substationRefMolName : WideString read FsubstationRefMolName write FsubstationRefMolName; 
  end;

  ArrayOfENSubst150CellShort = array of ENSubst150CellShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubst150CellShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubst150CellShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubst150CellShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubst150CellController/message/
  // soapAction: http://ksoe.org/ENSubst150CellController/action/ENSubst150CellController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubst150CellControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubst150CellController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSubst150CellControllerSoapPort = interface(IInvokable)
  ['{63ef63ef-63ef-63ef-63ef-63ef63ef63ef}']
    function  add(const aENSubst150Cell: ENSubst150Cell): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubst150Cell: ENSubst150Cell); stdcall;
    function  getObject(const anObjectCode: Integer): ENSubst150Cell; stdcall;
    function  getList: ENSubst150CellShortList; stdcall;
    function  getFilteredList(const aENSubst150CellFilter: ENSubst150CellFilter): ENSubst150CellShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CellShortList; stdcall;
    function  getScrollableFilteredList(const aENSubst150CellFilter: ENSubst150CellFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CellShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubst150CellShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSubst150CellFilter: ENSubst150CellFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENSubst150Cell.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENSubst150CellFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FvoltageClassRef) then
      voltageClassRef.Free;
    if Assigned(FsubstationRef) then
      substationRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENSubst150CellFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENSubst150CellShort.Destroy;
  begin
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FvoltageClassRefValue) then
      voltageClassRefValue.Free;
    if Assigned(FsubstationRefProjectPower) then
      substationRefProjectPower.Free;
    inherited Destroy;
  end; 
  
  destructor ENSubst150CellShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubst150Cell, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150Cell');
  RemClassRegistry.RegisterXSClass(ENSubst150CellRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CellRef');
  RemClassRegistry.RegisterXSClass(ENSubst150CellFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CellFilter');
  RemClassRegistry.RegisterXSClass(ENSubst150CellShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CellShort');
  RemClassRegistry.RegisterXSClass(ENSubst150CellShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubst150CellShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubst150CellShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubst150CellShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSubst150CellControllerSoapPort), 'http://ksoe.org/ENSubst150CellController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubst150CellControllerSoapPort), 'http://ksoe.org/ENSubst150CellController/action/ENSubst150CellController.%operationName%');


end.
