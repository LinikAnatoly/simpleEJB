unit ENHookController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,ENHookTypeController 
   ,TKMaterialsController 
   ,ENPostController 
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

  ENHook            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHookRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHook = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FhookType : ENHookType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FpostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property hookType : ENHookType read FhookType write FhookType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENHookFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FhookType : ENHookType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FpostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property element : ENElement read Felement write Felement; 
    property hookType : ENHookType read FhookType write FhookType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENHookFilter = class(ENHook)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENHookShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FelementCode : Integer; 
    FhookTypeCode : Integer; 
    FhookTypeName : WideString;
    FmaterialRefCode : Integer; 
	FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FpostRefCode : Integer; 
    FpostRefName : WideString;
    FpostRefPostNumberGen : WideString;
    FpostRefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property hookTypeCode : Integer read FhookTypeCode write FhookTypeCode; 
    property hookTypeName : WideString read FhookTypeName write FhookTypeName; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode; 
	property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen; 
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate; 
  end;

  ArrayOfENHookShort = array of ENHookShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHookShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHookShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHookShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHookController/message/
  // soapAction: http://ksoe.org/ENHookController/action/ENHookController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHookControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHookController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHookControllerSoapPort = interface(IInvokable)
  ['{29db29db-29db-29db-29db-29db29db29db}']
    function  add(const aENHook: ENHook): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHook: ENHook); stdcall;
    function  getObject(const anObjectCode: Integer): ENHook; stdcall;
    function  getList: ENHookShortList; stdcall;
    function  getFilteredList(const aENHookFilter: ENHookFilter): ENHookShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHookShortList; stdcall;
    function  getScrollableFilteredList(const aENHookFilter: ENHookFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHookShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHookShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENHookFilter: ENHookFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENHook.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FhookType) then
      hookType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENHookFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FhookType) then
      hookType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENHookFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENHookShort.Destroy;
  begin
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENHookShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHook, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHook');
  RemClassRegistry.RegisterXSClass(ENHookRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookRef');
  RemClassRegistry.RegisterXSClass(ENHookFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookFilter');
  RemClassRegistry.RegisterXSClass(ENHookShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookShort');
  RemClassRegistry.RegisterXSClass(ENHookShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHookShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHookShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHookShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHookControllerSoapPort), 'http://ksoe.org/ENHookController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHookControllerSoapPort), 'http://ksoe.org/ENHookController/action/ENHookController.%operationName%');


end.
