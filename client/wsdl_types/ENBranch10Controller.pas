unit ENBranch10Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPostController 
   ,ENElementController
   ,ENLine10Controller 
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

  ENBranch10            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch10Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch10 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbranchLength : TXSDecimal;
    FdispOffName : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpostOutRef : ENPostRef;
//???
    FelementPostOutRef : ENElementRef;
//???
    Felement : ENElement;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property branchLength : TXSDecimal read FbranchLength write FbranchLength; 
    property dispOffName : WideString read FdispOffName write FdispOffName;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postOutRef : ENPostRef read FpostOutRef write FpostOutRef; 
    property elementPostOutRef : ENElementRef read FelementPostOutRef write FelementPostOutRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
  
{
  ENBranch10Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbranchLength : TXSDecimal;
    FdispOffName : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FpostOutRef : ENPostRef;
//???
    FelementPostOutRef : ENElementRef;
//???
    Felement : ENElement;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property branchLength : TXSDecimal read FbranchLength write FbranchLength; 
    property dispOffName : WideString read FdispOffName write FdispOffName;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property postOutRef : ENPostRef read FpostOutRef write FpostOutRef; 
    property elementPostOutRef : ENElementRef read FelementPostOutRef write FelementPostOutRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
}

  ENBranch10Filter = class(ENBranch10)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBranch10Short = class(TRemotable)
  private
    Fcode : Integer;
    FName: String;
    FdispOffName: String;
    FbranchLength : TXSDecimal;
    FpostOutRefCode : Integer; 
    FpostOutRefName : WideString;
    FpostOutRefPostNumberGen : WideString;
    FpostOutRefLastRepairDate : TXSDate;
    FelementPostOutRefCode : Integer; 
    FelementCode : Integer; 
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer;
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name: String read Fname write Fname;
    property dispOffName: String read FdispOffName write FdispOffName;
    property branchLength : TXSDecimal read FbranchLength write FbranchLength;
    property postOutRefCode : Integer read FpostOutRefCode write FpostOutRefCode; 
    property postOutRefName : WideString read FpostOutRefName write FpostOutRefName; 
    property postOutRefPostNumberGen : WideString read FpostOutRefPostNumberGen write FpostOutRefPostNumberGen; 
    property postOutRefLastRepairDate : TXSDate read FpostOutRefLastRepairDate write FpostOutRefLastRepairDate; 
    property elementPostOutRefCode : Integer read FelementPostOutRefCode write FelementPostOutRefCode; //ENElementRef read FelementPostOutRefCode write FelementPostOutRefCode; 
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart;
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate;
  end;

  ArrayOfENBranch10Short = array of ENBranch10Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBranch10ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBranch10Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBranch10Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBranch10Controller/message/
  // soapAction: http://ksoe.org/ENBranch10Controller/action/ENBranch10Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBranch10ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBranch10Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBranch10ControllerSoapPort = interface(IInvokable)
  ['{7EAA0757-6BE4-4AB6-A4C1-50A95AE55075}']
    function  add(const aENBranch10: ENBranch10): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBranch10: ENBranch10); stdcall;
    function  getObject(const anObjectCode: Integer): ENBranch10; stdcall;
    function  getList: ENBranch10ShortList; stdcall;
    function  getFilteredList(const aENBranch10Filter: ENBranch10Filter): ENBranch10ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ShortList; stdcall;
    function  getScrollableFilteredList(const aENBranch10Filter: ENBranch10Filter; const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBranch10Filter: ENBranch10Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENBranch10.Destroy;
  begin
    if Assigned(FbranchLength) then
      branchLength.Free;
    if Assigned(FpostOutRef) then
      postOutRef.Free;
    if Assigned(FelementPostOutRef) then
      elementPostOutRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENBranch10Filter.Destroy;
  begin
    if Assigned(FbranchLength) then
      branchLength.Free;
    if Assigned(FpostOutRef) then
      postOutRef.Free;
    if Assigned(FelementPostOutRef) then
      elementPostOutRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENBranch10Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENBranch10Short.Destroy;
  begin
    if Assigned(FbranchLength) then
      branchLength.Free;
    if Assigned(FpostOutRefLastRepairDate) then
      postOutRefLastRepairDate.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENBranch10ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBranch10, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10');
  RemClassRegistry.RegisterXSClass(ENBranch10Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10Ref');
  RemClassRegistry.RegisterXSClass(ENBranch10Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10Filter');
  RemClassRegistry.RegisterXSClass(ENBranch10Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10Short');
  RemClassRegistry.RegisterXSClass(ENBranch10ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBranch10Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBranch10Short');

  InvRegistry.RegisterInterface(TypeInfo(ENBranch10ControllerSoapPort), 'http://ksoe.org/ENBranch10Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBranch10ControllerSoapPort), 'http://ksoe.org/ENBranch10Controller/action/ENBranch10Controller.%operationName%');


end.
