unit ENAccumulatorsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,ENAccumulatorStatusController 
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

  ENAccumulators            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulators = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtypeName : WideString;
    Ffactory : WideString;
    FgarageNumber : WideString;
    FyearProduction : WideString;
    FserialNumber : WideString;
    FreceiptDate : TXSDate;
    Fmileage : TXSDecimal;
    FmileageAll : TXSDecimal;
    Fpotencial : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FinstallStatusRef : ENAccumulatorStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property typeName : WideString read FtypeName write FtypeName;
    property factory : WideString read Ffactory write Ffactory;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property yearProduction : WideString read FyearProduction write FyearProduction;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property receiptDate : TXSDate read FreceiptDate write FreceiptDate;
    property mileage : TXSDecimal read Fmileage write Fmileage; 
    property mileageAll : TXSDecimal read FmileageAll write FmileageAll; 
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property installStatusRef : ENAccumulatorStatusRef read FinstallStatusRef write FinstallStatusRef; 
  end;
  
{
  ENAccumulatorsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FtypeName : WideString;
    Ffactory : WideString;
    FgarageNumber : WideString;
    FyearProduction : WideString;
    FserialNumber : WideString;
    FreceiptDate : TXSDate;
    Fmileage : TXSDecimal;
    FmileageAll : TXSDecimal;
    Fpotencial : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FinstallStatusRef : ENAccumulatorStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property typeName : WideString read FtypeName write FtypeName;
    property factory : WideString read Ffactory write Ffactory;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property yearProduction : WideString read FyearProduction write FyearProduction;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property receiptDate : TXSDate read FreceiptDate write FreceiptDate;
    property mileage : TXSDecimal read Fmileage write Fmileage; 
    property mileageAll : TXSDecimal read FmileageAll write FmileageAll; 
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property installStatusRef : ENAccumulatorStatusRef read FinstallStatusRef write FinstallStatusRef; 
  end;
}

  ENAccumulatorsFilter = class(ENAccumulators)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAccumulatorsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FtypeName : WideString;
    Ffactory : WideString;
    FgarageNumber : WideString;
    FyearProduction : WideString;
    FserialNumber : WideString;
    FreceiptDate : TXSDate;	
    Fmileage : TXSDecimal;
    FmileageAll : TXSDecimal;
    Fpotencial : TXSDecimal;
    FmaterialRefCode : Integer; 
    FinstallStatusRefCode : Integer; 
    FinstallStatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property typeName : WideString read FtypeName write FtypeName;
    property factory : WideString read Ffactory write Ffactory;
    property garageNumber : WideString read FgarageNumber write FgarageNumber;
    property yearProduction : WideString read FyearProduction write FyearProduction;
    property serialNumber : WideString read FserialNumber write FserialNumber;
    property receiptDate : TXSDate read FreceiptDate write FreceiptDate;
    property mileage : TXSDecimal read Fmileage write Fmileage; 
    property mileageAll : TXSDecimal read FmileageAll write FmileageAll; 
    property potencial : TXSDecimal read Fpotencial write Fpotencial; 

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode; 
    property installStatusRefCode : Integer read FinstallStatusRefCode write FinstallStatusRefCode; 
    property installStatusRefName : WideString read FinstallStatusRefName write FinstallStatusRefName; 
  end;

  ArrayOfENAccumulatorsShort = array of ENAccumulatorsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAccumulatorsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAccumulatorsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAccumulatorsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAccumulatorsController/message/
  // soapAction: http://ksoe.org/ENAccumulatorsController/action/ENAccumulatorsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAccumulatorsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAccumulatorsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAccumulatorsControllerSoapPort = interface(IInvokable)
  ['{74e674e6-74e6-74e6-74e6-74e674e674e6}']
    function  add(const aENAccumulators: ENAccumulators): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAccumulators: ENAccumulators); stdcall;
    function  getObject(const anObjectCode: Integer): ENAccumulators; stdcall;
    function  getList: ENAccumulatorsShortList; stdcall;
    function  getFilteredList(const aENAccumulatorsFilter: ENAccumulatorsFilter): ENAccumulatorsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsShortList; stdcall;
    function  getScrollableFilteredList(const aENAccumulatorsFilter: ENAccumulatorsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAccumulatorsFilter: ENAccumulatorsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAccumulators.Destroy;
  begin
    if Assigned(FreceiptDate) then
      receiptDate.Free;
    if Assigned(Fmileage) then
      mileage.Free;
    if Assigned(FmileageAll) then
      mileageAll.Free;
    if Assigned(Fpotencial) then
      potencial.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FinstallStatusRef) then
      installStatusRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAccumulatorsFilter.Destroy;
  begin
    if Assigned(FreceiptDate) then
      receiptDate.Free;
    if Assigned(Fmileage) then
      mileage.Free;
    if Assigned(FmileageAll) then
      mileageAll.Free;
    if Assigned(Fpotencial) then
      potencial.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FinstallStatusRef) then
      installStatusRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAccumulatorsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAccumulatorsShort.Destroy;
  begin
    if Assigned(FreceiptDate) then
      receiptDate.Free;
    if Assigned(Fmileage) then
      mileage.Free;
    if Assigned(FmileageAll) then
      mileageAll.Free;
    if Assigned(Fpotencial) then
      potencial.Free;
    inherited Destroy;
  end; 
  
  destructor ENAccumulatorsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAccumulators, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulators');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsRef');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsFilter');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsShort');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAccumulatorsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAccumulatorsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAccumulatorsControllerSoapPort), 'http://ksoe.org/ENAccumulatorsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAccumulatorsControllerSoapPort), 'http://ksoe.org/ENAccumulatorsController/action/ENAccumulatorsController.%operationName%');


end.
