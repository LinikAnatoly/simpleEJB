unit ENLine10SuppliesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLine10Controller 
   ,ENSubstation150Controller 
   ,ENElementController
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

  ENLine10Supplies            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine10SuppliesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine10Supplies = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fline10ElementRef : ENElementRef;
//???
    Fstation150ElementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref; 
    property line10ElementRef : ENElementRef read Fline10ElementRef write Fline10ElementRef; 
    property station150ElementRef : ENElementRef read Fstation150ElementRef write Fstation150ElementRef; 
  end;
  
{
  ENLine10SuppliesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fsubstation150Ref : ENSubstation150Ref;
//???
    Fline10ElementRef : ENElementRef;
//???
    Fstation150ElementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property substation150Ref : ENSubstation150Ref read Fsubstation150Ref write Fsubstation150Ref; 
    property line10ElementRef : ENElementRef read Fline10ElementRef write Fline10ElementRef; 
    property station150ElementRef : ENElementRef read Fstation150ElementRef write Fstation150ElementRef; 
  end;
}

  ENLine10SuppliesFilter = class(ENLine10Supplies)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLine10SuppliesShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    Fsubstation150RefCode : Integer; 
    Fsubstation150RefName : WideString;
    Fsubstation150RefProjectPower : TXSDecimal;
    Fsubstation150RefOperativeService : WideString;
    Fsubstation150RefRepairService : WideString;
    Fsubstation150RefBuhName : WideString;
    Fsubstation150RefInvNumber : WideString;
    Fsubstation150RefSizCode : Integer; 
    Fsubstation150RefMolCode : WideString;
    Fsubstation150RefMolName : WideString;
    Fline10ElementRefCode : Integer; 
    Fstation150ElementRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property substation150RefCode : Integer read Fsubstation150RefCode write Fsubstation150RefCode; 
    property substation150RefName : WideString read Fsubstation150RefName write Fsubstation150RefName; 
    property substation150RefProjectPower : TXSDecimal read Fsubstation150RefProjectPower write Fsubstation150RefProjectPower; 
    property substation150RefOperativeService : WideString read Fsubstation150RefOperativeService write Fsubstation150RefOperativeService; 
    property substation150RefRepairService : WideString read Fsubstation150RefRepairService write Fsubstation150RefRepairService; 
    property substation150RefBuhName : WideString read Fsubstation150RefBuhName write Fsubstation150RefBuhName; 
    property substation150RefInvNumber : WideString read Fsubstation150RefInvNumber write Fsubstation150RefInvNumber; 
    property substation150RefSizCode : Integer read Fsubstation150RefSizCode write Fsubstation150RefSizCode; 
    property substation150RefMolCode : WideString read Fsubstation150RefMolCode write Fsubstation150RefMolCode; 
    property substation150RefMolName : WideString read Fsubstation150RefMolName write Fsubstation150RefMolName; 
    property line10ElementRefCode : Integer read Fline10ElementRefCode write Fline10ElementRefCode; //ENElementRef read Fline10ElementRefCode write Fline10ElementRefCode; 
    property station150ElementRefCode : Integer read Fstation150ElementRefCode write Fstation150ElementRefCode; //ENElementRef read Fstation150ElementRefCode write Fstation150ElementRefCode; 
  end;

  ArrayOfENLine10SuppliesShort = array of ENLine10SuppliesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLine10SuppliesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLine10SuppliesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLine10SuppliesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLine10SuppliesController/message/
  // soapAction: http://ksoe.org/ENLine10SuppliesController/action/ENLine10SuppliesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLine10SuppliesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLine10SuppliesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLine10SuppliesControllerSoapPort = interface(IInvokable)
  ['{dd1ddd1d-dd1d-dd1d-dd1d-dd1ddd1ddd1d}']
    function  add(const aENLine10Supplies: ENLine10Supplies): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLine10Supplies: ENLine10Supplies); stdcall;
    function  getObject(const anObjectCode: Integer): ENLine10Supplies; stdcall;
    function  getList: ENLine10SuppliesShortList; stdcall;
    function  getFilteredList(const aENLine10SuppliesFilter: ENLine10SuppliesFilter): ENLine10SuppliesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLine10SuppliesShortList; stdcall;
    function  getScrollableFilteredList(const aENLine10SuppliesFilter: ENLine10SuppliesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLine10SuppliesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLine10SuppliesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLine10SuppliesFilter: ENLine10SuppliesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLine10Supplies.Destroy;
  begin
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fline10ElementRef) then
      line10ElementRef.Free;
    if Assigned(Fstation150ElementRef) then
      station150ElementRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENLine10SuppliesFilter.Destroy;
  begin
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fsubstation150Ref) then
      substation150Ref.Free;
    if Assigned(Fline10ElementRef) then
      line10ElementRef.Free;
    if Assigned(Fstation150ElementRef) then
      station150ElementRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENLine10SuppliesFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLine10SuppliesShort.Destroy;
  begin
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fsubstation150RefProjectPower) then
      substation150RefProjectPower.Free;
    inherited Destroy;
  end; 
  
  destructor ENLine10SuppliesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLine10Supplies, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10Supplies');
  RemClassRegistry.RegisterXSClass(ENLine10SuppliesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10SuppliesRef');
  RemClassRegistry.RegisterXSClass(ENLine10SuppliesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10SuppliesFilter');
  RemClassRegistry.RegisterXSClass(ENLine10SuppliesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10SuppliesShort');
  RemClassRegistry.RegisterXSClass(ENLine10SuppliesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10SuppliesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLine10SuppliesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLine10SuppliesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLine10SuppliesControllerSoapPort), 'http://ksoe.org/ENLine10SuppliesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLine10SuppliesControllerSoapPort), 'http://ksoe.org/ENLine10SuppliesController/action/ENLine10SuppliesController.%operationName%');


end.
