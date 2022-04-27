unit ENAct2ENPlanWorkController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENActController 
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

  ENAct2ENPlanWork            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2ENPlanWorkRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2ENPlanWork = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
//???
    Fplan : ENPlanWork;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property actRef : ENActRef read FactRef write FactRef; 
    property plan : ENPlanWork read Fplan write Fplan; 
  end;

  ENAct2ENPlanWorkFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
//???
    Fplan : ENPlanWork;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property actRef : ENActRef read FactRef write FactRef; 
    property plan : ENPlanWork read Fplan write Fplan; 
  end;


  ENAct2ENPlanWorkShort = class(TRemotable)
  private
    Fcode : Integer; 
    FactRefCode : Integer; 
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolName : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FplanCode : Integer; 
    FplanDateGen : TXSDate;
    FplanDateStart : TXSDate;
    FplanDateFinal : TXSDate;
    FplanYearGen : Integer; 
    FplanMonthGen : Integer; 
    FplanUserGen : WideString;
    FplanDateEdit : TXSDate;
    FtypeCode : Integer;
    FtypeName : WideString;
    FkindCode : Integer;
    FkindName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 

    property actRefCode : Integer read FactRefCode write FactRefCode; 
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen; 
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen; 
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit; 
    property planCode : Integer read FplanCode write FplanCode; 
    property planDateGen : TXSDate read FplanDateGen write FplanDateGen; 
    property planDateStart : TXSDate read FplanDateStart write FplanDateStart; 
    property planDateFinal : TXSDate read FplanDateFinal write FplanDateFinal;
    property planYearGen : Integer read FplanYearGen write FplanYearGen;
    property planMonthGen : Integer read FplanMonthGen write FplanMonthGen; 
    property planUserGen : WideString read FplanUserGen write FplanUserGen; 
    property planDateEdit : TXSDate read FplanDateEdit write FplanDateEdit;
    property kindCode : Integer read FkindCode write FkindCode;
    property typeCode : Integer read FkindCode write FkindCode;
    property kindName : WideString read FkindName write FkindName;
    property typeName : WideString read FtypeName write FtypeName;
  end;

  ArrayOfENAct2ENPlanWorkShort = array of ENAct2ENPlanWorkShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2ENPlanWorkShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2ENPlanWorkShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2ENPlanWorkShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2ENPlanWorkController/message/
  // soapAction: http://ksoe.org/ENAct2ENPlanWorkController/action/ENAct2ENPlanWorkController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2ENPlanWorkControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2ENPlanWorkController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2ENPlanWorkControllerSoapPort = interface(IInvokable)
  ['{E5F9212F-CE73-476D-9085-53042429F40F}']
    function  add(const aENAct2ENPlanWork: ENAct2ENPlanWork; const isClient: Integer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer; const isClient: Integer); stdcall;
    procedure save(const aENAct2ENPlanWork: ENAct2ENPlanWork); stdcall;
    function  getObject(const anObjectCode: Integer): ENAct2ENPlanWork; stdcall;
    function  getList: ENAct2ENPlanWorkShortList; stdcall;
    function  getFilteredList(const aENAct2ENPlanWorkFilter: ENAct2ENPlanWorkFilter): ENAct2ENPlanWorkShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2ENPlanWorkShortList; stdcall;
    function  getScrollableFilteredList(const aENAct2ENPlanWorkFilter: ENAct2ENPlanWorkFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2ENPlanWorkShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2ENPlanWorkShortList; stdcall;

    procedure changeActType(const actCode: Integer; const actType: Integer); stdcall;
  end; 


implementation

  destructor ENAct2ENPlanWork.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(Fplan) then
      plan.Free;
    inherited Destroy;
  end;
  
  destructor ENAct2ENPlanWorkFilter.Destroy;
  begin
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(Fplan) then
      plan.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENAct2ENPlanWorkShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2ENPlanWork, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ENPlanWork');
  RemClassRegistry.RegisterXSClass(ENAct2ENPlanWorkRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ENPlanWorkRef');
  RemClassRegistry.RegisterXSClass(ENAct2ENPlanWorkFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ENPlanWorkFilter');
  RemClassRegistry.RegisterXSClass(ENAct2ENPlanWorkShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ENPlanWorkShort');
  RemClassRegistry.RegisterXSClass(ENAct2ENPlanWorkShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ENPlanWorkShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2ENPlanWorkShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2ENPlanWorkShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENAct2ENPlanWorkController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2ENPlanWorkControllerSoapPort), 'http://ksoe.org/ENAct2ENPlanWorkController/action/ENAct2ENPlanWorkController.%operationName%');


end.
