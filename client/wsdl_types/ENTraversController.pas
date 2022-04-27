unit ENTraversController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,ENTraversTypeController 
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

  ENTravers            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTraversRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravers = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Felement : ENElement;
//???
    FtraversType : ENTraversType;
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
    property traversType : ENTraversType read FtraversType write FtraversType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
  
{
  ENTraversFilter = class(TRemotable)
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
    FtraversType : ENTraversType;
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
    property traversType : ENTraversType read FtraversType write FtraversType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
  end;
}

  ENTraversFilter = class(ENTravers)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTraversShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FelementCode : Integer; 
    FtraversTypeCode : Integer; 
    FtraversTypeName : WideString;
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
    property traversTypeCode : Integer read FtraversTypeCode write FtraversTypeCode; 
    property traversTypeName : WideString read FtraversTypeName write FtraversTypeName; 
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

  ArrayOfENTraversShort = array of ENTraversShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTraversShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTraversShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTraversShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTraversController/message/
  // soapAction: http://ksoe.org/ENTraversController/action/ENTraversController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTraversControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTraversController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTraversControllerSoapPort = interface(IInvokable)
  ['{1cc51cc5-1cc5-1cc5-1cc5-1cc51cc51cc5}']
    function  add(const aENTravers: ENTravers): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravers: ENTravers); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravers; stdcall;
    function  getList: ENTraversShortList; stdcall;
    function  getFilteredList(const aENTraversFilter: ENTraversFilter): ENTraversShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTraversShortList; stdcall;
    function  getScrollableFilteredList(const aENTraversFilter: ENTraversFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTraversShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTraversShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTraversFilter: ENTraversFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTravers.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtraversType) then
      traversType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTraversFilter.Destroy;
  begin
    if Assigned(Felement) then
      element.Free;
    if Assigned(FtraversType) then
      traversType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTraversFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTraversShort.Destroy;
  begin
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENTraversShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravers, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravers');
  RemClassRegistry.RegisterXSClass(ENTraversRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversRef');
  RemClassRegistry.RegisterXSClass(ENTraversFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversFilter');
  RemClassRegistry.RegisterXSClass(ENTraversShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversShort');
  RemClassRegistry.RegisterXSClass(ENTraversShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTraversShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTraversShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTraversShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTraversControllerSoapPort), 'http://ksoe.org/ENTraversController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTraversControllerSoapPort), 'http://ksoe.org/ENTraversController/action/ENTraversController.%operationName%');


end.
