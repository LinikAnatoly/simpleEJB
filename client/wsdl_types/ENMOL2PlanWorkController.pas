unit ENMOL2PlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
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

  ENMOL2PlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMOL2PlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMOL2PlanWork = class(TRemotable)
  private
    Fcode : Integer; 
    FmolName : WideString;
    FmolCode : WideString;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;

  ENMOL2PlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FmolName : WideString;
    FmolCode : WideString;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;


  ENMOL2PlanWorkShort = class(TRemotable)
  private
    Fcode : Integer; 
    FmolName : WideString;
    FmolCode : WideString;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property molName : WideString read FmolName write FmolName;
    property molCode : WideString read FmolCode write FmolCode;

    property planRefCode : Integer read FplanRefCode write FplanRefCode; 
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen; 
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart; 
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal; 
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen; 
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen; 
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen; 
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit; 
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber; 
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder; 
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber; 
  end;

  ArrayOfENMOL2PlanWorkShort = array of ENMOL2PlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMOL2PlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMOL2PlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMOL2PlanWorkShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMOL2PlanWorkController/message/
  // soapAction: http://ksoe.org/ENMOL2PlanWorkController/action/ENMOL2PlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMOL2PlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMOL2PlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMOL2PlanWorkControllerSoapPort = interface(IInvokable)
  ['{86BF3178-C982-485A-9ABA-AA477A132EAA}']
    function  add(const aENMOL2PlanWork: ENMOL2PlanWork): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMOL2PlanWork: ENMOL2PlanWork); stdcall;
    function  getObject(const anObjectCode: Integer): ENMOL2PlanWork; stdcall;
    function  getList: ENMOL2PlanWorkShortList; stdcall;
    function  getFilteredList(const aENMOL2PlanWorkFilter: ENMOL2PlanWorkFilter): ENMOL2PlanWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMOL2PlanWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENMOL2PlanWorkFilter: ENMOL2PlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMOL2PlanWorkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMOL2PlanWorkShortList; stdcall;
  end; 


implementation

  destructor ENMOL2PlanWork.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
  
  destructor ENMOL2PlanWorkFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENMOL2PlanWorkShort.Destroy;
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
    inherited Destroy;
  end; 
  
  destructor ENMOL2PlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMOL2PlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOL2PlanWork');
  RemClassRegistry.RegisterXSClass(ENMOL2PlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOL2PlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENMOL2PlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOL2PlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENMOL2PlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOL2PlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENMOL2PlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMOL2PlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMOL2PlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMOL2PlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMOL2PlanWorkControllerSoapPort), 'http://ksoe.org/ENMOL2PlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMOL2PlanWorkControllerSoapPort), 'http://ksoe.org/ENMOL2PlanWorkController/action/ENMOL2PlanWorkController.%operationName%');


end.
