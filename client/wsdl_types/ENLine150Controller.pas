unit ENLine150Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   //,EPVoltageNominalController 
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

  ENLine150            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine150Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLine150 = class(TRemotable)
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
    FmoreData : WideString;
    FchainsLength : TXSDecimal;
    Fchains2Length : TXSDecimal;
    FlastRepairDate : TXSDate;
    FdateGen : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
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
    property moreData : WideString read FmoreData write FmoreData;
    property chainsLength : TXSDecimal read FchainsLength write FchainsLength; 
    property chains2Length : TXSDecimal read Fchains2Length write Fchains2Length; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
  end;
  
{
  ENLine150Filter = class(TRemotable)
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
    FmoreData : WideString;
    FchainsLength : TXSDecimal;
    Fchains2Length : TXSDecimal;
    FlastRepairDate : TXSDate;
    FdateGen : TXSDate;
    FextentForest : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fvoltagenominal : EPVoltageNominal;
//???
    Felement : ENElement;
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
    property moreData : WideString read FmoreData write FmoreData;
    property chainsLength : TXSDecimal read FchainsLength write FchainsLength; 
    property chains2Length : TXSDecimal read Fchains2Length write Fchains2Length; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property voltagenominal : EPVoltageNominal read Fvoltagenominal write Fvoltagenominal; 
    property element : ENElement read Felement write Felement; 
  end;
}

  ENLine150Filter = class(ENLine150)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLine150Short = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    FbuhName : WideString;
    FlineLength : TXSDecimal;
    FyearBuild : Integer; 
    FyearWorkingStart : Integer; 
    FchainsLength : TXSDecimal;
    Fchains2Length : TXSDecimal;
    FlastRepairDate : TXSDate;	
    FextentForest : TXSDecimal;
    FvoltagenominalCode : Integer; 
    FvoltagenominalValue : WideString;
    FelementCode : Integer; 
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
    property chainsLength : TXSDecimal read FchainsLength write FchainsLength; 
    property chains2Length : TXSDecimal read Fchains2Length write Fchains2Length; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property extentForest : TXSDecimal read FextentForest write FextentForest; 
    property voltagenominalCode : Integer read FvoltagenominalCode write FvoltagenominalCode; 
    property voltagenominalValue : WideString read FvoltagenominalValue write FvoltagenominalValue; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENLine150Short = array of ENLine150Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLine150ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLine150Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLine150Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLine150Controller/message/
  // soapAction: http://ksoe.org/ENLine150Controller/action/ENLine150Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLine150ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLine150Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLine150ControllerSoapPort = interface(IInvokable)
  ['{c135c135-c135-c135-c135-c135c135c135}']
    function  add(const aENLine150: ENLine150): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLine150: ENLine150); stdcall;
    function  getObject(const anObjectCode: Integer): ENLine150; stdcall;
    function  getList: ENLine150ShortList; stdcall;
    function  getFilteredList(const aENLine150Filter: ENLine150Filter): ENLine150ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLine150ShortList; stdcall;
    function  getScrollableFilteredList(const aENLine150Filter: ENLine150Filter; const aFromPosition: Integer; const aQuantity: Integer): ENLine150ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLine150ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLine150Filter: ENLine150Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLine150.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FchainsLength) then
      chainsLength.Free;
    if Assigned(Fchains2Length) then
      chains2Length.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;

{  
  destructor ENLine150Filter.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FchainsLength) then
      chainsLength.Free;
    if Assigned(Fchains2Length) then
      chains2Length.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    if Assigned(Fvoltagenominal) then
      voltagenominal.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
}

  destructor ENLine150Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLine150Short.Destroy;
  begin
    if Assigned(FlineLength) then
      lineLength.Free;
    if Assigned(FchainsLength) then
      chainsLength.Free;
    if Assigned(Fchains2Length) then
      chains2Length.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FextentForest) then
      extentForest.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENLine150ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLine150, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine150');
  RemClassRegistry.RegisterXSClass(ENLine150Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine150Ref');
  RemClassRegistry.RegisterXSClass(ENLine150Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine150Filter');
  RemClassRegistry.RegisterXSClass(ENLine150Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine150Short');
  RemClassRegistry.RegisterXSClass(ENLine150ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLine150ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLine150Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLine150Short');

  InvRegistry.RegisterInterface(TypeInfo(ENLine150ControllerSoapPort), 'http://ksoe.org/ENLine150Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLine150ControllerSoapPort), 'http://ksoe.org/ENLine150Controller/action/ENLine150Controller.%operationName%');


end.
