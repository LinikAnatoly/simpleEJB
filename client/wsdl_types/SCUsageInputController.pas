unit SCUsageInputController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,SCUsageInputStatusController
   ,DFDocSignerController
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

  SCUsageInput            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInput = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberInt : Integer;
    FdateGen : TXSDate;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FmolCode : WideString;
    FmolName : WideString;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;
    Fiszku : Integer;
    Fisprinted : Integer;
    FmolCodeCounter : WideString;
    FmolNameCounter : WideString;
    FautoCreated : Integer;
    FisDocsReceived : Integer;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    FstatusRef : SCUsageInputStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  numberInt : Integer read FnumberInt write FnumberInt;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  iszku : Integer read Fiszku write Fiszku;
    property  isprinted : Integer read Fisprinted write Fisprinted;
    property molCodeCounter : WideString read FmolCodeCounter write FmolCodeCounter;
    property molNameCounter : WideString read FmolNameCounter write FmolNameCounter;
    property  autoCreated : Integer read FautoCreated write FautoCreated;
    property isDocsReceived : Integer read FisDocsReceived write FisDocsReceived;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property statusRef : SCUsageInputStatusRef read FstatusRef write FstatusRef;
  end;

{
  SCUsageInputFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberInt : Integer;
    FdateGen : TXSDate;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FmolCode : WideString;
    FmolName : WideString;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;
    Fiszku : Integer;
    Fisprinted : Integer;
    FmolCodeCounter : WideString;
    FmolNameCounter : WideString;
    FautoCreated : Integer;
    FisDocsReceived : Integer;
    FuserGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    FstatusRef : SCUsageInputStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberInt : Integer read FnumberInt write FnumberInt;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property iszku : Integer read Fiszku write Fiszku;
    property isprinted : Integer read Fisprinted write Fisprinted;
    property molCodeCounter : WideString read FmolCodeCounter write FmolCodeCounter;
    property molNameCounter : WideString read FmolNameCounter write FmolNameCounter;
    property autoCreated : Integer read FautoCreated write FautoCreated;
    property isDocsReceived : Integer read FisDocsReceived write FisDocsReceived;
    property userGen : WideString read FuserGen write FuserGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property statusRef : SCUsageInputStatusRef read FstatusRef write FstatusRef;
  end;
}

  SCUsageInputFilter = class(SCUsageInput)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCUsageInputShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FdateGen : TXSDate;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FmolCode : WideString;
    FmolName : WideString;
    FdateEdit : TXSDateTime;
    FmolCodeCounter : WideString;
    FmolNameCounter : WideString;
    FisDocsReceived : Integer;
    FuserGen : WideString;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer;
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FdepartmentHrmorganizationid : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property molCodeCounter : WideString read FmolCodeCounter write FmolCodeCounter;
    property molNameCounter : WideString read FmolNameCounter write FmolNameCounter;
    property  isDocsReceived : Integer read FisDocsReceived write FisDocsReceived;
    property userGen : WideString read FuserGen write FuserGen;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode;
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans;
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884;
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884;
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884;
    property departmentHrmorganizationid : WideString read FdepartmentHrmorganizationid write FdepartmentHrmorganizationid;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfSCUsageInputShort = array of SCUsageInputShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputController/message/
  // soapAction: http://ksoe.org/SCUsageInputController/action/SCUsageInputController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputControllerSoapPort = interface(IInvokable)
  ['{12B1D141-99F9-4C42-8F9B-BA36FDE8D5F8}']
    function add(const aSCUsageInput: SCUsageInput): Integer; overload; stdcall;
    function add(const aSCUsageInput: SCUsageInput; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;

    procedure save(const aSCUsageInput: SCUsageInput); overload; stdcall;
    procedure save(const aSCUsageInput: SCUsageInput; const dfDocSigners: ArrayOfDFDocSigner); overload; stdcall;

    function getObject(const anObjectCode: Integer): SCUsageInput; stdcall;
    function getList: SCUsageInputShortList; stdcall;
    function getFilteredList(const aSCUsageInputFilter: SCUsageInputFilter): SCUsageInputShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputShortList; stdcall;
    function getScrollableFilteredList(const aSCUsageInputFilter: SCUsageInputFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCUsageInputFilter: SCUsageInputFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCUsageInputShort; stdcall;

    ///////////////
    procedure fillUsageInput(const aCode: Integer); stdcall;
    procedure undoFillUsageInput(const aCode: Integer); stdcall;
    procedure undoFillUsageInputZKU(const aCode: Integer); stdcall;
    procedure processInSC(const aCode: Integer); stdcall;

    procedure cancelProcessInSC(const aCode: Integer); stdcall;
    procedure cancelProcessInSCByEcp(const aCode: Integer); stdcall;

    procedure fillUsageInputZKU(const aCode: Integer); stdcall;
    procedure processInSCZKU(const aCode: Integer); stdcall;

    procedure cancelProcessInSCZKU(const aCode: Integer); stdcall;
    procedure cancelProcessInSCZKUByEcp(const aCode: Integer); stdcall;

    procedure isPrint(const aCode: Integer); stdcall;

    procedure setIsDocsReceived(const aCode: Integer; const isDocsReceived: Integer); stdcall;
  end;


implementation

  destructor SCUsageInput.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor SCUsageInputFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor SCUsageInputFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor SCUsageInputShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end;

  destructor SCUsageInputShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInput, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInput');
  RemClassRegistry.RegisterXSClass(SCUsageInputRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputControllerSoapPort), 'http://ksoe.org/SCUsageInputController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputControllerSoapPort), 'http://ksoe.org/SCUsageInputController/action/SCUsageInputController.%operationName%');


end.
