unit ENSubstation04Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,EPWorkerController
   ,ENElementController
   ,ENBelongingController 
   ,ENOwnerController 
   ,ENSubstationTypeController 
   ,AddressController 
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

  ENSubstation04            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstation04Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSubstation04 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FnominalPower : TXSDecimal;
    FlastRepairDate : TXSDate;
    FsizCode : Integer; 
    FpaintSquare : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    Faddress : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FnameProject : WideString;
    FnameBuilder : WideString;
    FchambersQuantity : Integer; 
    FadditionalData : WideString;
    FperiodInspect : Integer; 
//Сотрудник
    Fworker : EPWorker;
//Элемент
    Felement : ENElement;
//Кем обслуживается подстанция?
    FbelongingRef : ENBelongingRef;
//На чьём баллансе числится подстанция?
    FownerRef : ENOwnerRef;
//Тип подстанции
    FsubstationType : ENSubstationType;
//Ссылка на таблицы адресной подсистемы
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property sizCode : Integer read FsizCode write FsizCode; 
    property paintSquare : TXSDecimal read FpaintSquare write FpaintSquare;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property address : WideString read Faddress write Faddress;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property nameProject : WideString read FnameProject write FnameProject;
    property nameBuilder : WideString read FnameBuilder write FnameBuilder;
    property  chambersQuantity : Integer read FchambersQuantity write FchambersQuantity; 
    property additionalData : WideString read FadditionalData write FadditionalData;
    property  periodInspect : Integer read FperiodInspect write FperiodInspect; 
    property worker : EPWorker read Fworker write Fworker; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
    property substationType : ENSubstationType read FsubstationType write FsubstationType; 
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;

{
  ENSubstation04Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FnominalPower : TXSDecimal;
    FlastRepairDate : TXSDate;
    FsizCode : Integer;
    FpaintSquare : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    Faddress : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FnameProject : WideString;
    FnameBuilder : WideString;
    FchambersQuantity : Integer; 
    FadditionalData : WideString;
    FperiodInspect : Integer; 
//???
    Fworker : EPWorker;
//???
    Felement : ENElement;
//???
    FbelongingRef : ENBelongingRef;
//???
    FownerRef : ENOwnerRef;
//???
    FsubstationType : ENSubstationType;
//???
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property sizCode : Integer read FsizCode write FsizCode; 
    property paintSquare : TXSDecimal read FpaintSquare write FpaintSquare;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property address : WideString read Faddress write Faddress;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property nameProject : WideString read FnameProject write FnameProject;
    property nameBuilder : WideString read FnameBuilder write FnameBuilder;
    property  chambersQuantity : Integer read FchambersQuantity write FchambersQuantity; 
    property additionalData : WideString read FadditionalData write FadditionalData;
    property  periodInspect : Integer read FperiodInspect write FperiodInspect; 
    property worker : EPWorker read Fworker write Fworker; 
    property element : ENElement read Felement write Felement; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property ownerRef : ENOwnerRef read FownerRef write FownerRef; 
    property substationType : ENSubstationType read FsubstationType write FsubstationType; 
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;
}

  ENSubstation04Filter = class(ENSubstation04)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSubstation04Short = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FnominalPower : TXSDecimal;
    FlastRepairDate : TXSDate;
    FsizCode : Integer; 
    FpaintSquare : TXSDecimal;
    Faddress : WideString;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FchambersQuantity : Integer;
    FperiodInspect : Integer; 
    FworkerCode : Integer;
    FelementCode : Integer; 
    FbelongingRefCode : Integer; 
    FbelongingRefName : WideString;
    FownerRefCode : Integer; 
    FownerRefName : WideString;
    FsubstationTypeCode : Integer; 
    FsubstationTypeName : WideString;
    FrenRefCode : Integer;
    FrenRefName : WideString;
    FaddressRefCode : Integer;
    FfiderGaugeFullness: Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property nominalPower : TXSDecimal read FnominalPower write FnominalPower; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property sizCode : Integer read FsizCode write FsizCode; 
    property paintSquare : TXSDecimal read FpaintSquare write FpaintSquare;
    property address : WideString read Faddress write Faddress;
    property  yearBuild : Integer read FyearBuild write FyearBuild; 
    property  yearWorkingStart : Integer read FyearWorkingStart write FyearWorkingStart; 
    property  chambersQuantity : Integer read FchambersQuantity write FchambersQuantity;
    property  periodInspect : Integer read FperiodInspect write FperiodInspect; 

    property workerCode : Integer read FworkerCode write FworkerCode; //EPWorkerRef read FworkerCode write FworkerCode;
    property elementCode : Integer read FelementCode write FelementCode; 
    property belongingRefCode : Integer read FbelongingRefCode write FbelongingRefCode; 
    property belongingRefName : WideString read FbelongingRefName write FbelongingRefName; 
    property ownerRefCode : Integer read FownerRefCode write FownerRefCode; 
    property ownerRefName : WideString read FownerRefName write FownerRefName; 
    property substationTypeCode : Integer read FsubstationTypeCode write FsubstationTypeCode; 
    property substationTypeName : WideString read FsubstationTypeName write FsubstationTypeName;
    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;
    property addressRefCode : Integer read FaddressRefCode write FaddressRefCode; //AddressRef read FaddressRefCode write FaddressRefCode;
    property fiderGaugeFullness: Integer read FfiderGaugeFullness write FfiderGaugeFullness;
  end;

  ArrayOfENSubstation04Short = array of ENSubstation04Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSubstation04ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSubstation04Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSubstation04Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSubstation04Controller/message/
  // soapAction: http://ksoe.org/ENSubstation04Controller/action/ENSubstation04Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSubstation04ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSubstation04Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //

  ENSubstation04ControllerSoapPort = interface(IInvokable)
  ['{F366F632-1F4E-474B-9703-93F3E66766DB}']
    function  add(const aENSubstation04: ENSubstation04): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSubstation04: ENSubstation04); stdcall;
    function  getObject(const anObjectCode: Integer): ENSubstation04; stdcall;
    function  getList: ENSubstation04ShortList; stdcall;
    function  getFilteredList(const aENSubstation04Filter: ENSubstation04Filter): ENSubstation04ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSubstation04ShortList; stdcall;
    function  getScrollableFilteredList(const aENSubstation04Filter: ENSubstation04Filter; const aFromPosition: Integer; const aQuantity: Integer): ENSubstation04ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSubstation04ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSubstation04Filter: ENSubstation04Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function getSubstationUnionList(const aENSubstation04Filter : ENSubstation04Filter;
             const aFromPosition : Integer;
             const aQuantity : Integer) : ENSubstation04ShortList; stdcall;
  end;


implementation

  destructor ENSubstation04.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FpaintSquare) then
      paintSquare.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FsubstationType) then
      substationType.Free;
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end;
  
{
  destructor ENSubstation04Filter.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FpaintSquare) then
      paintSquare.Free;
    if Assigned(Fworker) then
      worker.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(FownerRef) then
      ownerRef.Free;
    if Assigned(FsubstationType) then
      substationType.Free;
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENSubstation04Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENSubstation04Short.Destroy;
  begin
    if Assigned(FnominalPower) then
      nominalPower.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FpaintSquare) then
      paintSquare.Free;
    inherited Destroy;
  end; 
  
  destructor ENSubstation04ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSubstation04, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation04');
  RemClassRegistry.RegisterXSClass(ENSubstation04Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation04Ref');
  RemClassRegistry.RegisterXSClass(ENSubstation04Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation04Filter');
  RemClassRegistry.RegisterXSClass(ENSubstation04Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation04Short');
  RemClassRegistry.RegisterXSClass(ENSubstation04ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSubstation04ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSubstation04Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSubstation04Short');

  InvRegistry.RegisterInterface(TypeInfo(ENSubstation04ControllerSoapPort), 'http://ksoe.org/ENSubstation04Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSubstation04ControllerSoapPort), 'http://ksoe.org/ENSubstation04Controller/action/ENSubstation04Controller.%operationName%');


end.
