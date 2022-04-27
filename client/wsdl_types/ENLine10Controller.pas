unit ENLine10Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,EPWorkerController
   //,EPVoltageNominalController
   ,ENElementController 
   ,ENBelongingController 
   ,ENOwnerController 
   ,ENHighVoltageSellController 
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

  ENLine10            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine10Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine10 = class(TRemotable)
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
    FlastRepairDate : TXSDate;
    FdateGen : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fworker : EPWorker;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
    Fsubstationcellrefcode:Integer;
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
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property worker : EPWorker read Fworker write Fworker; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef;
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell;
    property substationcellrefcode : Integer read Fsubstationcellrefcode write Fsubstationcellrefcode;

  end;
  
{
  ENLine10Filter = class(TRemotable)
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
    FlastRepairDate : TXSDate;
    FdateGen : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fworker : EPWorker;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
//???
    FhighVoltageSell : ENHighVoltageSellRef;
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
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property worker : EPWorker read Fworker write Fworker; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
    property highVoltageSell : ENHighVoltageSellRef read FhighVoltageSell write FhighVoltageSell; 
  end;
}

  ENLine10Filter = class(ENLine10)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLine10Short = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FrenRefName: WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FlastRepairDate : TXSDate;	
    FextentForest : TXSDecimal;
    FworkerCode : Integer; 
    FvoltagenominalCode : Integer; 
    FelementCode : Integer; 
    FbelongingRefCode : Integer; 
    FbelongingRefName : WideString;
    FownerRefCode : Integer; 
    FhighVoltageSellCode : Integer; 
    FhighVoltageSellName : WideString;
    FhighVoltageSellNumberGen : WideString;
    FvoltageNominalValue: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property renRefName: WideString read FrenRefName write FrenRefName;
    property buhName : WideString read FbuhName write FbuhName;
    property lineLength : TXSDecimal read FlineLength write FlineLength; 
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 

    property workerCode : Integer read FworkerCode write FworkerCode; //EPWorkerRef read FworkerCode write FworkerCode; 
    property voltagenominalCode : Integer read FvoltagenominalCode write FvoltagenominalCode; //EPVoltageNominalRef read FvoltagenominalCode write FvoltagenominalCode; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property belongingRefCode : Integer read FbelongingRefCode write FbelongingRefCode; 
    property belongingRefName : WideString read FbelongingRefName write FbelongingRefName; 
    property ownerRefCode : Integer read FownerRefCode write FownerRefCode; //ENOwnerRef read FownerRefCode write FownerRefCode; 
    property highVoltageSellCode : Integer read FhighVoltageSellCode write FhighVoltageSellCode; 
    property highVoltageSellName : WideString read FhighVoltageSellName write FhighVoltageSellName; 
    property highVoltageSellNumberGen : WideString read FhighVoltageSellNumberGen write FhighVoltageSellNumberGen;
    property voltageNominalValue: TXSDecimal read FvoltageNominalValue write FvoltageNominalValue;
  end;

  ArrayOfENLine10Short = array of ENLine10Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLine10ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLine10Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLine10Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLine10Controller/message/
  // soapAction: http://ksoe.org/ENLine10Controller/action/ENLine10Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLine10ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLine10Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLine10ControllerSoapPort = interface(IInvokable)
  ['{70852961-B9BB-4CA6-976E-8AEF573C35BE}']
    function  add(const aENLine10: ENLine10): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLine10: ENLine10); stdcall;
    function  getObject(const anObjectCode: Integer): ENLine10; stdcall;
    function  getList: ENLine10ShortList; stdcall;
    function  getFilteredList(const aENLine10Filter: ENLine10Filter): ENLine10ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLine10ShortList; stdcall;
    function  getScrollableFilteredList(const aENLine10Filter: ENLine10Filter; const aFromPosition: Integer; const aQuantity: Integer): ENLine10ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLine10ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLine10Filter: ENLine10Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLine10.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    inherited Destroy;
  end;

{  
  destructor ENLine10Filter.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FhighVoltageSell) then
      highVoltageSell.Free;
    inherited Destroy;
  end; 
}

  destructor ENLine10Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLine10Short.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    inherited Destroy;
  end; 
  
  destructor ENLine10ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLine10, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10');
  RemClassRegistry.RegisterXSClass(ENLine10Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10Ref');
  RemClassRegistry.RegisterXSClass(ENLine10Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10Filter');
  RemClassRegistry.RegisterXSClass(ENLine10Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10Short');
  RemClassRegistry.RegisterXSClass(ENLine10ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine10ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLine10Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLine10Short');

  InvRegistry.RegisterInterface(TypeInfo(ENLine10ControllerSoapPort), 'http://ksoe.org/ENLine10Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLine10ControllerSoapPort), 'http://ksoe.org/ENLine10Controller/action/ENLine10Controller.%operationName%');


end.
