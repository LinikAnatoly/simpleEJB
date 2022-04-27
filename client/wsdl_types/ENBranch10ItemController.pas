unit ENBranch10ItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPostController 
   ,ENBranch10Controller 
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

  ENBranch10Item            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch10ItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch10Item = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fpost : ENPost;
//???
    Fbranch10Ref : ENBranch10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property post : ENPost read Fpost write Fpost; 
    property branch10Ref : ENBranch10Ref read Fbranch10Ref write Fbranch10Ref; 
  end;
  
{
  ENBranch10ItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fpost : ENPost;
//???
    Fbranch10Ref : ENBranch10Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property post : ENPost read Fpost write Fpost; 
    property branch10Ref : ENBranch10Ref read Fbranch10Ref write Fbranch10Ref; 
  end;
}

  ENBranch10ItemFilter = class(ENBranch10Item)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBranch10ItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FpostCode: Integer;
    FpostName: WideString;
    FpostPostNumberGen: WideString;
    FpostLastRepairDate : TXSDate;
    FpostYearSetup: Integer;
    FpostWoodenLength: TXSDecimal;
    FpostTypeCode: Integer;
    FpostTypeName: WideString;
    FpostGroundCode: Integer;
    FpostGroundName: WideString;
    FpostElementCode: Integer;
    FpostMaterialRefCode: Integer;
    FpostMaterialRefName: WideString;
    FpostMaterialRefCost : TXSDecimal;
    FpostMaterialRefDeliveryDate : Integer;
    FpostMaterialRefNumkatalog : WideString;
    FpostMaterialRefIdentid : WideString;
    Fline10RefCode: Integer;
    Fline10RefInvNumber: WideString;
    Fline10RefName: WideString;
    Fline10RefBuhName: WideString;
    Fline10RefLineLength: TXSDecimal;
    Fline10RefYearBuild: Integer;
    Fline10RefYearWorkingStart: Integer;
    Fline10RefLastRepairDate: TXSDate;
    Fbranch10RefCode: Integer;
    Fbranch10RefBranchLength: TXSDecimal;
    Fbranch10RefName: WideString;
  public
    destructor Destroy; override;
  published
    property code: Integer read Fcode write Fcode;
    property postCode: Integer read FpostCode write FpostCode;
    property postName: WideString read FpostName write FpostName;
    property postPostNumberGen: WideString read FpostPostNumberGen write FpostPostNumberGen;
    property postLastRepairDate: TXSDate read FpostLastRepairDate write FpostLastRepairDate;
    property postYearSetup: Integer read FpostYearSetup write FpostYearSetup;
    property postWoodenLength: TXSDecimal read FpostWoodenLength write FpostWoodenLength;
    property postTypeCode: Integer read FpostTypeCode write FpostTypeCode;
    property postTypeName: WideString read FpostTypeName write FpostTypeName;
    property postGroundCode: Integer read FpostGroundCode write FpostGroundCode;
    property postGroundName: WideString read FpostGroundName write FpostGroundName;
    property postElementCode: Integer read FpostElementCode write FpostElementCode;
    property postMaterialRefCode: Integer read FpostMaterialRefCode write FpostMaterialRefCode;
    property postMaterialRefName: WideString read FpostMaterialRefName write FpostMaterialRefName;
    property postMaterialRefCost: TXSDecimal read FpostMaterialRefCost write FpostMaterialRefCost;
    property postMaterialRefDeliveryDate: Integer read FpostMaterialRefDeliveryDate write FpostMaterialRefDeliveryDate;
    property postMaterialRefNumkatalog: WideString read FpostMaterialRefNumkatalog write FpostMaterialRefNumkatalog;
    property postMaterialRefIdentid: WideString read FpostMaterialRefIdentid write FpostMaterialRefIdentid;
    property line10RefCode: Integer read Fline10RefCode write Fline10RefCode;
    property line10RefInvNumber: WideString read Fline10RefInvNumber write Fline10RefInvNumber;
    property line10RefName: WideString read Fline10RefName write Fline10RefName;
    property line10RefBuhName: WideString read Fline10RefBuhName write Fline10RefBuhName;
    property line10RefLineLength: TXSDecimal read Fline10RefLineLength write Fline10RefLineLength;
    property line10RefYearBuild: Integer read Fline10RefYearBuild write Fline10RefYearBuild;
    property line10RefYearWorkingStart: Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart;
    property line10RefLastRepairDate: TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate;
    property branch10RefCode : Integer read Fbranch10RefCode write Fbranch10RefCode;
    property branch10RefBranchLength : TXSDecimal read Fbranch10RefBranchLength write Fbranch10RefBranchLength;
    property branch10RefName: WideString read Fbranch10RefName write Fbranch10RefName;
  end;

  ArrayOfENBranch10ItemShort = array of ENBranch10ItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBranch10ItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBranch10ItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBranch10ItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBranch10ItemController/message/
  // soapAction: http://ksoe.org/ENBranch10ItemController/action/ENBranch10ItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBranch10ItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBranch10ItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBranch10ItemControllerSoapPort = interface(IInvokable)
  ['{10fc10fc-10fc-10fc-10fc-10fc10fc10fc}']
    function  add(const aENBranch10Item: ENBranch10Item): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBranch10Item: ENBranch10Item); stdcall;
    function  getObject(const anObjectCode: Integer): ENBranch10Item; stdcall;
    function  getList: ENBranch10ItemShortList; stdcall;
    function  getFilteredList(const aENBranch10ItemFilter: ENBranch10ItemFilter): ENBranch10ItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ItemShortList; stdcall;
    function  getScrollableFilteredList(const aENBranch10ItemFilter: ENBranch10ItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBranch10ItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBranch10ItemFilter: ENBranch10ItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENBranch10Item.Destroy;
  begin
    if Assigned(Fpost) then
      post.Free;
    if Assigned(Fbranch10Ref) then
      branch10Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENBranch10ItemFilter.Destroy;
  begin
    if Assigned(Fpost) then
      post.Free;
    if Assigned(Fbranch10Ref) then
      branch10Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENBranch10ItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENBranch10ItemShort.Destroy;
  begin
    if Assigned(FpostLastRepairDate) then
      postLastRepairDate.Free;
    if Assigned(Fbranch10RefBranchLength) then
      branch10RefBranchLength.Free;
    inherited Destroy;
  end; 
  
  destructor ENBranch10ItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBranch10Item, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10Item');
  RemClassRegistry.RegisterXSClass(ENBranch10ItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10ItemRef');
  RemClassRegistry.RegisterXSClass(ENBranch10ItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10ItemFilter');
  RemClassRegistry.RegisterXSClass(ENBranch10ItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10ItemShort');
  RemClassRegistry.RegisterXSClass(ENBranch10ItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch10ItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBranch10ItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBranch10ItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBranch10ItemControllerSoapPort), 'http://ksoe.org/ENBranch10ItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBranch10ItemControllerSoapPort), 'http://ksoe.org/ENBranch10ItemController/action/ENBranch10ItemController.%operationName%');


end.
