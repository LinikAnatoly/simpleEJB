unit ENAutoTiresController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,ENDepartmentController 
   ,ENTiresInstallStatusController 
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

  ENAutoTires            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }
  ENAutoTiresInstallInfo = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTires = class(TRemotable)
  private
    Fcode : Integer; 
    FtypeName : WideString;
    FgarageNumber : WideString;
    FserialNumber : WideString;
    Ffactory : WideString;
    Fpotencial : TXSDecimal;
    FdistanceAll : TXSDecimal;
    Fnominal : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FinstallStatusRef : ENTiresInstallStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property typeName : WideString read FtypeName write FtypeName;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property factory : WideString read Ffactory write Ffactory;
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 
    property distanceAll : TXSDecimal read FdistanceAll write FdistanceAll; 
    property nominal : WideString read Fnominal write Fnominal;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
    property installStatusRef : ENTiresInstallStatusRef read FinstallStatusRef write FinstallStatusRef;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresInstallInfo = class(TRemotable)
  private
    FinvNumber : WideString;
    FgosNumber : WideString;
    FtransportMark : WideString;
    FinstallPlaces : WideString;
//  public
//    destructor Destroy; override;
  published
    property invNumber : WideString read FinvNumber write FinvNumber;
    property gosNumber : WideString read FgosNumber write FgosNumber;
    property transportMark : WideString read FtransportMark write FtransportMark;
    property installPlaces : WideString read FinstallPlaces write FinstallPlaces;
  end;

{
  ENAutoTiresFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FtypeName : WideString;
    FgarageNumber : WideString;
    FserialNumber : WideString;
    Ffactory : WideString;
    Fpotencial : TXSDecimal;
    FdistanceAll : TXSDecimal;
    Fnominal : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FinstallStatusRef : ENTiresInstallStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property typeName : WideString read FtypeName write FtypeName;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property factory : WideString read Ffactory write Ffactory;
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 
    property distanceAll : TXSDecimal read FdistanceAll write FdistanceAll; 
    property nominal : WideString read Fnominal write Fnominal;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
    property installStatusRef : ENTiresInstallStatusRef read FinstallStatusRef write FinstallStatusRef; 
  end;
}

  ENAutoTiresFilter = class(ENAutoTires)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAutoTiresShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtypeName : WideString;
    FgarageNumber : WideString;
    FserialNumber : WideString;
    Ffactory : WideString;
    Fpotencial : TXSDecimal;
    FdistanceAll : TXSDecimal;
    Fnominal : WideString;
    FmaterialRefCode : Integer; 
    FdepartmentRefCode : Integer; 
    FinstallStatusRefCode : Integer; 
    FinstallStatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property typeName : WideString read FtypeName write FtypeName;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property factory : WideString read Ffactory write Ffactory;
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 
    property distanceAll : TXSDecimal read FdistanceAll write FdistanceAll; 
    property nominal : WideString read Fnominal write Fnominal;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode; 
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; //ENDepartmentRef read FdepartmentRefCode write FdepartmentRefCode; 
    property installStatusRefCode : Integer read FinstallStatusRefCode write FinstallStatusRefCode; 
    property installStatusRefName : WideString read FinstallStatusRefName write FinstallStatusRefName; 
  end;

  ArrayOfENAutoTiresShort = array of ENAutoTiresShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAutoTiresShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAutoTiresShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAutoTiresShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAutoTiresController/message/
  // soapAction: http://ksoe.org/ENAutoTiresController/action/ENAutoTiresController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAutoTiresControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAutoTiresController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAutoTiresControllerSoapPort = interface(IInvokable)
  ['{e2fbe2fb-e2fb-e2fb-e2fb-e2fbe2fbe2fb}']
    function  add(const aENAutoTires: ENAutoTires): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAutoTires: ENAutoTires); stdcall;
    function  getObject(const anObjectCode: Integer): ENAutoTires; stdcall;
    function  getList: ENAutoTiresShortList; stdcall;
    function  getFilteredList(const aENAutoTiresFilter: ENAutoTiresFilter): ENAutoTiresShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresShortList; stdcall;
    function  getScrollableFilteredList(const aENAutoTiresFilter: ENAutoTiresFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAutoTiresFilter: ENAutoTiresFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function  getInstallInfo(const tiresCode: Integer): ENAutoTiresInstallInfo; stdcall;
  end; 


implementation

  destructor ENAutoTires.Destroy;
  begin
    if Assigned(Fpotencial) then
      potencial.Free;
    if Assigned(FdistanceAll) then
      distanceAll.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FinstallStatusRef) then
      installStatusRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAutoTiresFilter.Destroy;
  begin
    if Assigned(Fpotencial) then
      potencial.Free;
    if Assigned(FdistanceAll) then
      distanceAll.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FinstallStatusRef) then
      installStatusRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAutoTiresFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAutoTiresShort.Destroy;
  begin
    if Assigned(Fpotencial) then
      potencial.Free;
    if Assigned(FdistanceAll) then
      distanceAll.Free;
    inherited Destroy;
  end; 
  
  destructor ENAutoTiresShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAutoTires, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTires');
  RemClassRegistry.RegisterXSClass(ENAutoTiresRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresRef');
  RemClassRegistry.RegisterXSClass(ENAutoTiresFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresFilter');
  RemClassRegistry.RegisterXSClass(ENAutoTiresShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresShort');
  RemClassRegistry.RegisterXSClass(ENAutoTiresShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAutoTiresShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAutoTiresShort');

  RemClassRegistry.RegisterXSClass(ENAutoTiresInstallInfo, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresInstallInfo');

  InvRegistry.RegisterInterface(TypeInfo(ENAutoTiresControllerSoapPort), 'http://ksoe.org/ENAutoTiresController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAutoTiresControllerSoapPort), 'http://ksoe.org/ENAutoTiresController/action/ENAutoTiresController.%operationName%');


end.
