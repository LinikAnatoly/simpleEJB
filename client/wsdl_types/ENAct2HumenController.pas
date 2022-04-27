unit ENAct2HumenController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENHumenItemKindController 
   ,ENActController 
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

  ENAct2Humen            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2HumenRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2Humen = class(TRemotable)
  private
    Fcode : Integer; 
    ForederNum : Integer; 
    FtabNumber : WideString;
    Ffio : WideString;
    Fsalary : TXSDecimal;
    FtimeMonth : TXSDecimal;
    FsalaryHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FtimeObjectWork : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpaysWork : TXSDecimal;
    Fmodify_time : Int64;
//???
    FhumenKindRef : ENHumenItemKindRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  orederNum : Integer read ForederNum write ForederNum; 
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property salary : TXSDecimal read Fsalary write Fsalary; 
    property timeMonth : TXSDecimal read FtimeMonth write FtimeMonth; 
    property salaryHours : TXSDecimal read FsalaryHours write FsalaryHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property timeObjectWork : TXSDecimal read FtimeObjectWork write FtimeObjectWork; 
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact; 
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property humenKindRef : ENHumenItemKindRef read FhumenKindRef write FhumenKindRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
  
{
  ENAct2HumenFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    ForederNum : Integer; 
    FtabNumber : WideString;
    Ffio : WideString;
    Fsalary : TXSDecimal;
    FtimeMonth : TXSDecimal;
    FsalaryHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FtimeObjectWork : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpaysWork : TXSDecimal;
    Fmodify_time : Int64;
//???
    FhumenKindRef : ENHumenItemKindRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  orederNum : Integer read ForederNum write ForederNum; 
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property salary : TXSDecimal read Fsalary write Fsalary; 
    property timeMonth : TXSDecimal read FtimeMonth write FtimeMonth; 
    property salaryHours : TXSDecimal read FsalaryHours write FsalaryHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property timeObjectWork : TXSDecimal read FtimeObjectWork write FtimeObjectWork; 
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact; 
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property humenKindRef : ENHumenItemKindRef read FhumenKindRef write FhumenKindRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
}

  ENAct2HumenFilter = class(ENAct2Humen)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAct2HumenShort = class(TRemotable)
  private
    Fcode : Integer; 
    ForederNum : Integer; 
    FtabNumber : WideString;
    Ffio : WideString;
    Fsalary : TXSDecimal;
    FtimeMonth : TXSDecimal;
    FsalaryHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FtimeObjectWork : TXSDecimal;
    FtimeWorkFact : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FpaysWork : TXSDecimal;
    FhumenKindRefCode : Integer; 
    FhumenKindRefName : WideString;
    FactRefCode : Integer; 
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer; 
    FactRefFinDocMechanicCode : Integer; 
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  orederNum : Integer read ForederNum write ForederNum; 
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property fio : WideString read Ffio write Ffio;
    property salary : TXSDecimal read Fsalary write Fsalary; 
    property timeMonth : TXSDecimal read FtimeMonth write FtimeMonth; 
    property salaryHours : TXSDecimal read FsalaryHours write FsalaryHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property timeObjectWork : TXSDecimal read FtimeObjectWork write FtimeObjectWork; 
    property timeWorkFact : TXSDecimal read FtimeWorkFact write FtimeWorkFact; 
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 

    property humenKindRefCode : Integer read FhumenKindRefCode write FhumenKindRefCode; 
    property humenKindRefName : WideString read FhumenKindRefName write FhumenKindRefName; 
    property actRefCode : Integer read FactRefCode write FactRefCode; 
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen; 
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen; 
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode; 
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode; 
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName; 
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName; 
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber; 
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen; 
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit; 
  end;

  ArrayOfENAct2HumenShort = array of ENAct2HumenShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2HumenShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2HumenShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2HumenShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2HumenController/message/
  // soapAction: http://ksoe.org/ENAct2HumenController/action/ENAct2HumenController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2HumenControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2HumenController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2HumenControllerSoapPort = interface(IInvokable)
  ['{CCDE857C-DBB9-4209-BB5D-4C46FF07295A}']
    function  add(const aENAct2Humen: ENAct2Humen): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2Humen: ENAct2Humen); stdcall;
    function  getObject(const anObjectCode: Integer): ENAct2Humen; stdcall;
    function  getList: ENAct2HumenShortList; stdcall;
    function  getFilteredList(const aENAct2HumenFilter: ENAct2HumenFilter): ENAct2HumenShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2HumenShortList; stdcall;
    function  getScrollableFilteredList(const aENAct2HumenFilter: ENAct2HumenFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2HumenShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2HumenShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAct2HumenFilter: ENAct2HumenFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAct2Humen.Destroy;
  begin
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FtimeMonth) then
      timeMonth.Free;
    if Assigned(FsalaryHours) then
      salaryHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FtimeObjectWork) then
      timeObjectWork.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FhumenKindRef) then
      humenKindRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAct2HumenFilter.Destroy;
  begin
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FtimeMonth) then
      timeMonth.Free;
    if Assigned(FsalaryHours) then
      salaryHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FtimeObjectWork) then
      timeObjectWork.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FhumenKindRef) then
      humenKindRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAct2HumenFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAct2HumenShort.Destroy;
  begin
    if Assigned(Fsalary) then
      salary.Free;
    if Assigned(FtimeMonth) then
      timeMonth.Free;
    if Assigned(FsalaryHours) then
      salaryHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FtimeObjectWork) then
      timeObjectWork.Free;
    if Assigned(FtimeWorkFact) then
      timeWorkFact.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENAct2HumenShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2Humen, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2Humen');
  RemClassRegistry.RegisterXSClass(ENAct2HumenRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2HumenRef');
  RemClassRegistry.RegisterXSClass(ENAct2HumenFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2HumenFilter');
  RemClassRegistry.RegisterXSClass(ENAct2HumenShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2HumenShort');
  RemClassRegistry.RegisterXSClass(ENAct2HumenShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2HumenShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2HumenShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2HumenShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2HumenControllerSoapPort), 'http://ksoe.org/ENAct2HumenController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2HumenControllerSoapPort), 'http://ksoe.org/ENAct2HumenController/action/ENAct2HumenController.%operationName%');


end.
