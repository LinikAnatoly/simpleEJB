unit ENStandController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENStandTypeController 
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

  ENStand            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStand = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmaterialType : ENStandType;
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
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property materialType : ENStandType read FmaterialType write FmaterialType; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENStandFilter = class(TRemotable)
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
    FmaterialRef : TKMaterialsRef;
//???
    FmaterialType : ENStandType;
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
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property materialType : ENStandType read FmaterialType write FmaterialType; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENStandFilter = class(ENStand)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENStandShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialTypeCode : Integer;
    FmaterialTypeName : WideString;
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
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialTypeCode : Integer read FmaterialTypeCode write FmaterialTypeCode;
    property materialTypeName : WideString read FmaterialTypeName write FmaterialTypeName;
    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen; 
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate; 
  end;

  ArrayOfENStandShort = array of ENStandShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENStandShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENStandShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENStandShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENStandController/message/
  // soapAction: http://ksoe.org/ENStandController/action/ENStandController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENStandControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENStandController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENStandControllerSoapPort = interface(IInvokable)
  ['{1f031f03-1f03-1f03-1f03-1f031f031f03}']
    function  add(const aENStand: ENStand): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENStand: ENStand); stdcall;
    function  getObject(const anObjectCode: Integer): ENStand; stdcall;
    function  getList: ENStandShortList; stdcall;
    function  getFilteredList(const aENStandFilter: ENStandFilter): ENStandShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENStandShortList; stdcall;
    function  getScrollableFilteredList(const aENStandFilter: ENStandFilter; const aFromPosition: Integer; const aQuantity: Integer): ENStandShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENStandShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENStandFilter: ENStandFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENStand.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmaterialType) then
      materialType.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENStandFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmaterialType) then
      materialType.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENStandFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENStandShort.Destroy;
  begin
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENStandShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENStand, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStand');
  RemClassRegistry.RegisterXSClass(ENStandRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandRef');
  RemClassRegistry.RegisterXSClass(ENStandFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandFilter');
  RemClassRegistry.RegisterXSClass(ENStandShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandShort');
  RemClassRegistry.RegisterXSClass(ENStandShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENStandShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENStandShort');

  InvRegistry.RegisterInterface(TypeInfo(ENStandControllerSoapPort), 'http://ksoe.org/ENStandController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENStandControllerSoapPort), 'http://ksoe.org/ENStandController/action/ENStandController.%operationName%');


end.
