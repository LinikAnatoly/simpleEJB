unit ENLine04Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,EPWorkerController 
   ,ENElementController 
   ,ENBelongingController 
   ,ENOwnerController 
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

  ENLine04            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine04Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine04 = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FnameProject : WideString;
    FnameBuilder : WideString;
    FmainCustomersData : WideString;
    FmoreData : WideString;
    FdateGen : TXSDate;
    FlastRepairDate : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fworker : EPWorker;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property nameProject : WideString read FnameProject write FnameProject;
    property nameBuilder : WideString read FnameBuilder write FnameBuilder;
    property mainCustomersData : WideString read FmainCustomersData write FmainCustomersData;
    property moreData : WideString read FmoreData write FmoreData;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property worker : EPWorker read Fworker write Fworker; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
  end;
  
{
  ENLine04Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FnameProject : WideString;
    FnameBuilder : WideString;
    FmainCustomersData : WideString;
    FmoreData : WideString;
    FdateGen : TXSDate;
    FlastRepairDate : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fworker : EPWorker;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property nameProject : WideString read FnameProject write FnameProject;
    property nameBuilder : WideString read FnameBuilder write FnameBuilder;
    property mainCustomersData : WideString read FmainCustomersData write FmainCustomersData;
    property moreData : WideString read FmoreData write FmoreData;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property worker : EPWorker read Fworker write Fworker; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
  end;
}

  ENLine04Filter = class(ENLine04)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLine04Short = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FlastRepairDate : TXSDate;	
    FextentForest : TXSDecimal;
    FworkerCode : Integer; 
    FelementCode : Integer; 
    FbelongingRefCode : Integer; 
    FbelongingRefName : WideString;
    FownerRefCode : Integer; 
    FownerRefName : WideString;
    FrenRefCode : Integer;
    FrenRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 

    property workerCode : Integer read FworkerCode write FworkerCode; //EPWorkerRef read FworkerCode write FworkerCode; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property belongingRefCode : Integer read FbelongingRefCode write FbelongingRefCode; 
    property belongingRefName : WideString read FbelongingRefName write FbelongingRefName; 
    property ownerRefCode : Integer read FownerRefCode write FownerRefCode; 
    property ownerRefName : WideString read FownerRefName write FownerRefName;
    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;     
  end;

  ArrayOfENLine04Short = array of ENLine04Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLine04ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLine04Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLine04Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLine04Controller/message/
  // soapAction: http://ksoe.org/ENLine04Controller/action/ENLine04Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLine04ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLine04Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLine04ControllerSoapPort = interface(IInvokable)
  ['{076F2EDA-E949-4406-AC76-F680DEDB181C}']
    function  add(const aENLine04: ENLine04): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLine04: ENLine04); stdcall;
    function  getObject(const anObjectCode: Integer): ENLine04; stdcall;
    function  getList: ENLine04ShortList; stdcall;
    function  getFilteredList(const aENLine04Filter: ENLine04Filter): ENLine04ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLine04ShortList; stdcall;
    function  getScrollableFilteredList(const aENLine04Filter: ENLine04Filter; const aFromPosition: Integer; const aQuantity: Integer): ENLine04ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLine04ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLine04Filter: ENLine04Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLine04.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENLine04Filter.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENLine04Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLine04Short.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENLine04ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLine04, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine04');
  RemClassRegistry.RegisterXSClass(ENLine04Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine04Ref');
  RemClassRegistry.RegisterXSClass(ENLine04Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine04Filter');
  RemClassRegistry.RegisterXSClass(ENLine04Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine04Short');
  RemClassRegistry.RegisterXSClass(ENLine04ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine04ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLine04Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLine04Short');

  InvRegistry.RegisterInterface(TypeInfo(ENLine04ControllerSoapPort), 'http://ksoe.org/ENLine04Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLine04ControllerSoapPort), 'http://ksoe.org/ENLine04Controller/action/ENLine04Controller.%operationName%');


end.
