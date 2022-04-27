unit ENPlanWorkItem2TKKoefController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKTechCardSourceKoefController 
   ,ENPlanWorkItemController 
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

  ENPlanWorkItem2TKKoef            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2TKKoefRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem2TKKoef = class(TRemotable)
  private
    Fcode : Integer; 
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FsourceKoef : TKTechCardSourceKoef;
//???
    FplanWorkItemRef : ENPlanWorkItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property sourceKoef : TKTechCardSourceKoef read FsourceKoef write FsourceKoef; 
    property planWorkItemRef : ENPlanWorkItemRef read FplanWorkItemRef write FplanWorkItemRef; 
  end;

  ENPlanWorkItem2TKKoefFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FsourceKoef : TKTechCardSourceKoef;
//???
    FplanWorkItemRef : ENPlanWorkItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property sourceKoef : TKTechCardSourceKoef read FsourceKoef write FsourceKoef; 
    property planWorkItemRef : ENPlanWorkItemRef read FplanWorkItemRef write FplanWorkItemRef; 
  end;


  ENPlanWorkItem2TKKoefShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsourceKoefCode : Integer; 
    FsourceKoefNum : WideString;
    FsourceKoefName : WideString;
    FsourceKoefKoef : TXSDecimal;
    FplanWorkItemRefCode : Integer; 
    FplanWorkItemRefCountGen : TXSDecimal;
    FplanWorkItemRefTimeGen : TXSDecimal;
    FplanWorkItemRefUserGen : WideString;
    FplanWorkItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property sourceKoefCode : Integer read FsourceKoefCode write FsourceKoefCode; 
    property sourceKoefNum : WideString read FsourceKoefNum write FsourceKoefNum; 
    property sourceKoefName : WideString read FsourceKoefName write FsourceKoefName; 
    property sourceKoefKoef : TXSDecimal read FsourceKoefKoef write FsourceKoefKoef; 
    property planWorkItemRefCode : Integer read FplanWorkItemRefCode write FplanWorkItemRefCode; 
    property planWorkItemRefCountGen : TXSDecimal read FplanWorkItemRefCountGen write FplanWorkItemRefCountGen; 
    property planWorkItemRefTimeGen : TXSDecimal read FplanWorkItemRefTimeGen write FplanWorkItemRefTimeGen; 
    property planWorkItemRefUserGen : WideString read FplanWorkItemRefUserGen write FplanWorkItemRefUserGen; 
    property planWorkItemRefDateEdit : TXSDate read FplanWorkItemRefDateEdit write FplanWorkItemRefDateEdit; 
  end;

  ArrayOfENPlanWorkItem2TKKoefShort = array of ENPlanWorkItem2TKKoefShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItem2TKKoefShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItem2TKKoefShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItem2TKKoefShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkItem2TKKoefController/message/
  // soapAction: http://ksoe.org/ENPlanWorkItem2TKKoefController/action/ENPlanWorkItem2TKKoefController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkItem2TKKoefControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkItem2TKKoefController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItem2TKKoefControllerSoapPort = interface(IInvokable)
  ['{a030a030-a030-a030-a030-a030a030a030}']
    function  add(const aENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoef): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoef); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkItem2TKKoef; stdcall;
    function  getList: ENPlanWorkItem2TKKoefShortList; stdcall;
    function  getFilteredList(const aENPlanWorkItem2TKKoefFilter: ENPlanWorkItem2TKKoefFilter): ENPlanWorkItem2TKKoefShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2TKKoefShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkItem2TKKoefFilter: ENPlanWorkItem2TKKoefFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2TKKoefShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItem2TKKoefShortList; stdcall;
  end; 


implementation

  destructor ENPlanWorkItem2TKKoef.Destroy;
  begin
    if Assigned(FsourceKoef) then
      sourceKoef.Free;
    if Assigned(FplanWorkItemRef) then
      planWorkItemRef.Free;
    inherited Destroy;
  end;
  
  destructor ENPlanWorkItem2TKKoefFilter.Destroy;
  begin
    if Assigned(FsourceKoef) then
      sourceKoef.Free;
    if Assigned(FplanWorkItemRef) then
      planWorkItemRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWorkItem2TKKoefShort.Destroy;
  begin
    if Assigned(FsourceKoefKoef) then
      sourceKoefKoef.Free;
    if Assigned(FplanWorkItemRefCountGen) then
      planWorkItemRefCountGen.Free;
    if Assigned(FplanWorkItemRefTimeGen) then
      planWorkItemRefTimeGen.Free;
    if Assigned(FplanWorkItemRefDateEdit) then
      planWorkItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENPlanWorkItem2TKKoefShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2TKKoef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2TKKoef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2TKKoefRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2TKKoefRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2TKKoefFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2TKKoefFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2TKKoefShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2TKKoefShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItem2TKKoefShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem2TKKoefShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItem2TKKoefShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItem2TKKoefShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkItem2TKKoefControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2TKKoefController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkItem2TKKoefControllerSoapPort), 'http://ksoe.org/ENPlanWorkItem2TKKoefController/action/ENPlanWorkItem2TKKoefController.%operationName%');


end.
