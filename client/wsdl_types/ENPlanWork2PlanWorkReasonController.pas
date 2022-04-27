unit ENPlanWork2PlanWorkReasonController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
   ,ENPlanWorkReasonController 
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

  ENPlanWork2PlanWorkReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2PlanWorkReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWork2PlanWorkReason = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanWorkReasonRef : ENPlanWorkReasonRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planWorkReasonRef : ENPlanWorkReasonRef read FplanWorkReasonRef write FplanWorkReasonRef; 
  end;
  
{
  ENPlanWork2PlanWorkReasonFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FplanWorkReasonRef : ENPlanWorkReasonRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property planWorkReasonRef : ENPlanWorkReasonRef read FplanWorkReasonRef write FplanWorkReasonRef; 
  end;
}

  ENPlanWork2PlanWorkReasonFilter = class(ENPlanWork2PlanWorkReason)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPlanWork2PlanWorkReasonShort = class(TRemotable)
  private
    Fcode : Integer; 
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefYearOriginal : Integer; 
    FplanRefMonthOriginal : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanWorkReasonRefCode : Integer; 
    FplanWorkReasonRefDateGen : TXSDate;
    FplanWorkReasonRefNumberGen : WideString;
    FplanWorkReasonRefName : WideString;
    FplanWorkReasonRefDateEdit : TXSDateTime;	
    FplanWorkReasonRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal; 
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
    property planWorkReasonRefCode : Integer read FplanWorkReasonRefCode write FplanWorkReasonRefCode; 
    property planWorkReasonRefDateGen : TXSDate read FplanWorkReasonRefDateGen write FplanWorkReasonRefDateGen; 
    property planWorkReasonRefNumberGen : WideString read FplanWorkReasonRefNumberGen write FplanWorkReasonRefNumberGen; 
    property planWorkReasonRefName : WideString read FplanWorkReasonRefName write FplanWorkReasonRefName; 
    property planWorkReasonRefDateEdit : TXSDateTime read FplanWorkReasonRefDateEdit write FplanWorkReasonRefDateEdit; 
    property planWorkReasonRefUserGen : WideString read FplanWorkReasonRefUserGen write FplanWorkReasonRefUserGen; 
  end;

  ArrayOfENPlanWork2PlanWorkReasonShort = array of ENPlanWork2PlanWorkReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWork2PlanWorkReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWork2PlanWorkReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWork2PlanWorkReasonShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWork2PlanWorkReasonController/message/
  // soapAction: http://ksoe.org/ENPlanWork2PlanWorkReasonController/action/ENPlanWork2PlanWorkReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWork2PlanWorkReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWork2PlanWorkReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWork2PlanWorkReasonControllerSoapPort = interface(IInvokable)
  ['{2A079408-4D4D-4061-8486-4D9AACDD1C48}']
    function  add(const aENPlanWork2PlanWorkReason: ENPlanWork2PlanWorkReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWork2PlanWorkReason: ENPlanWork2PlanWorkReason); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWork2PlanWorkReason; stdcall;
    function  getList: ENPlanWork2PlanWorkReasonShortList; stdcall;
    function  getFilteredList(const aENPlanWork2PlanWorkReasonFilter: ENPlanWork2PlanWorkReasonFilter): ENPlanWork2PlanWorkReasonShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2PlanWorkReasonShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWork2PlanWorkReasonFilter: ENPlanWork2PlanWorkReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2PlanWorkReasonShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWork2PlanWorkReasonShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPlanWork2PlanWorkReasonFilter: ENPlanWork2PlanWorkReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPlanWork2PlanWorkReason.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanWorkReasonRef) then
      planWorkReasonRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPlanWork2PlanWorkReasonFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FplanWorkReasonRef) then
      planWorkReasonRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPlanWork2PlanWorkReasonFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPlanWork2PlanWorkReasonShort.Destroy;
  begin
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FplanWorkReasonRefDateGen) then
      planWorkReasonRefDateGen.Free;
    if Assigned(FplanWorkReasonRefDateEdit) then
      planWorkReasonRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWork2PlanWorkReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWork2PlanWorkReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2PlanWorkReason');
  RemClassRegistry.RegisterXSClass(ENPlanWork2PlanWorkReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2PlanWorkReasonRef');
  RemClassRegistry.RegisterXSClass(ENPlanWork2PlanWorkReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2PlanWorkReasonFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWork2PlanWorkReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2PlanWorkReasonShort');
  RemClassRegistry.RegisterXSClass(ENPlanWork2PlanWorkReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWork2PlanWorkReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWork2PlanWorkReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWork2PlanWorkReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWork2PlanWorkReasonControllerSoapPort), 'http://ksoe.org/ENPlanWork2PlanWorkReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWork2PlanWorkReasonControllerSoapPort), 'http://ksoe.org/ENPlanWork2PlanWorkReasonController/action/ENPlanWork2PlanWorkReasonController.%operationName%');


end.
