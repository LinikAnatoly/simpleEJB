unit ENPostController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController 
   ,ENPostTypeController 
   ,TKMaterialsController 
   ,ENGroundTypeController 
   ,ENLine04Controller 
   ,ENLine10Controller 
   ,ENLine150Controller 
   ,AddressController 
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

  ENPost            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPostRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPost = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FpostNumberGen : WideString;
    FyearSetup : Integer; 
    FwoodenLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FlastRepairDate : TXSDate;
//???
    Felement : ENElement;
//???
    FpostTtype : ENPostType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fground : ENGroundType;
//???
    Fline04Ref : ENLine04Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property postNumberGen : WideString read FpostNumberGen write FpostNumberGen;
    property  yearSetup : Integer read FyearSetup write FyearSetup; 
    property woodenLength : TXSDecimal read FwoodenLength write FwoodenLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property element : ENElement read Felement write Felement; 
    property postTtype : ENPostType read FpostTtype write FpostTtype; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property ground : ENGroundType read Fground write Fground; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref;
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;
  
{
  ENPostFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FpostNumberGen : WideString;
    FyearSetup : Integer; 
    FwoodenLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FlastRepairDate : TXSDate;
//???
    Felement : ENElement;
//???
    FpostTtype : ENPostType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fground : ENGroundType;
//???
    Fline04Ref : ENLine04Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    FaddressRef : AddressRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property postNumberGen : WideString read FpostNumberGen write FpostNumberGen;
    property  yearSetup : Integer read FyearSetup write FyearSetup; 
    property woodenLength : TXSDecimal read FwoodenLength write FwoodenLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property element : ENElement read Felement write Felement; 
    property postTtype : ENPostType read FpostTtype write FpostTtype; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property ground : ENGroundType read Fground write Fground; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref; 
    property addressRef : AddressRef read FaddressRef write FaddressRef; 
  end;
}

  ENPostFilter = class(ENPost)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPostShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FpostNumberGen : WideString;
    FlastRepairDate : TXSDate;
    FelementCode : Integer;
    FpostTtypeCode : Integer;
    FpostTtypeName : WideString;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FgroundCode : Integer;
    FgroundName : WideString;
    Fline04RefCode : Integer;
    Fline04RefInvNumber : WideString;
    Fline04RefName : WideString;
    Fline04RefBuhName : WideString;
    Fline04RefLineLength : TXSDecimal;
    Fline04RefYearBuild : Integer;
    Fline04RefYearWorkingStart : Integer;
    Fline04RefLastRepairDate : TXSDate;
    Fline10RefCode : Integer;
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer;
    Fline10RefYearWorkingStart : Integer;
    Fline10RefLastRepairDate : TXSDate;
    Fline150RefCode : Integer;
    Fline150RefInvNumber : WideString;
    Fline150RefName : WideString;
    Fline150RefBuhName : WideString;
    Fline150RefLineLength : TXSDecimal;
    Fline150RefYearBuild : Integer;
    Fline150RefYearWorkingStart : Integer;
    Fline150RefChainsLength : TXSDecimal;
    Fline150RefChains2Length : TXSDecimal;
    Fline150RefLastRepairDate : TXSDate;
    FyearSetup: Integer;
    FwoodenLength: TXSDecimal;
    FaddressRefCode : Integer;
    FlocationHouse: String;
    FprovinceCode: Integer;
    FprovinceName: String;
    FregionCode: Integer;
    FregionName: String;
    FcityCode: Integer;
    FcityName: String;
    FcityTypeCode: Integer;
    FcityTypeName: String;
    FdistrictCode: Integer;
    FdistrictName: String;
    FstreetCode: Integer;
    FstreetName: String;
    FstreetTypeCode: Integer;
    FstreetTypeName: String;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property postNumberGen : WideString read FpostNumberGen write FpostNumberGen;
    property lastRepairDate : TXSDate read FlastRepairDate write FlastRepairDate;
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode;
    property postTtypeCode : Integer read FpostTtypeCode write FpostTtypeCode;
    property postTtypeName : WideString read FpostTtypeName write FpostTtypeName;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property groundCode : Integer read FgroundCode write FgroundCode;
    property groundName : WideString read FgroundName write FgroundName;
    property line04RefCode : Integer read Fline04RefCode write Fline04RefCode;
    property line04RefInvNumber : WideString read Fline04RefInvNumber write Fline04RefInvNumber; 
    property line04RefName : WideString read Fline04RefName write Fline04RefName; 
    property line04RefBuhName : WideString read Fline04RefBuhName write Fline04RefBuhName; 
    property line04RefLineLength : TXSDecimal read Fline04RefLineLength write Fline04RefLineLength; 
    property line04RefYearBuild : Integer read Fline04RefYearBuild write Fline04RefYearBuild; 
    property line04RefYearWorkingStart : Integer read Fline04RefYearWorkingStart write Fline04RefYearWorkingStart; 
    property line04RefLastRepairDate : TXSDate read Fline04RefLastRepairDate write Fline04RefLastRepairDate; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property line150RefCode : Integer read Fline150RefCode write Fline150RefCode; 
    property line150RefInvNumber : WideString read Fline150RefInvNumber write Fline150RefInvNumber; 
    property line150RefName : WideString read Fline150RefName write Fline150RefName; 
    property line150RefBuhName : WideString read Fline150RefBuhName write Fline150RefBuhName; 
    property line150RefLineLength : TXSDecimal read Fline150RefLineLength write Fline150RefLineLength;
    property line150RefYearBuild : Integer read Fline150RefYearBuild write Fline150RefYearBuild;
    property line150RefYearWorkingStart : Integer read Fline150RefYearWorkingStart write Fline150RefYearWorkingStart;
    property line150RefChainsLength : TXSDecimal read Fline150RefChainsLength write Fline150RefChainsLength;
    property line150RefChains2Length : TXSDecimal read Fline150RefChains2Length write Fline150RefChains2Length;
    property line150RefLastRepairDate : TXSDate read Fline150RefLastRepairDate write Fline150RefLastRepairDate;
    property yearSetup: Integer read FyearSetup write FyearSetup;
    property woodenLength: TXSDecimal read FwoodenLength write FwoodenLength;
    property addressRefCode : Integer read FaddressRefCode write FaddressRefCode; //AddressRef read FaddressRefCode write FaddressRefCode;
    property locationHouse: String read FlocationHouse write FlocationHouse;
    property provinceCode: Integer read FprovinceCode write FprovinceCode;
    property provinceName: String read FprovinceName write FprovinceName;
    property regionCode: Integer read FregionCode write FregionCode;
    property regionName: String read FregionName write FregionName;
    property cityCode: Integer read FcityCode write FcityCode;
    property cityName: String read FcityName write FcityName;
    property cityTypeCode: Integer read FcityTypeCode write FcityTypeCode;
    property cityTypeName: String read FcityTypeName write FcityTypeName;
    property districtCode: Integer read FdistrictCode write FdistrictCode;
    property districtName: String read FdistrictName write FdistrictName;
    property streetCode: Integer read FstreetCode write FstreetCode;
    property streetName: String read FstreetName write FstreetName;
    property streetTypeCode: Integer read FstreetTypeCode write FstreetTypeCode;
    property streetTypeName: String read FstreetTypeName write FstreetTypeName;
  end;

  ArrayOfENPostShort = array of ENPostShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPostShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPostShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPostShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPostController/message/
  // soapAction: http://ksoe.org/ENPostController/action/ENPostController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPostControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPostController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPostControllerSoapPort = interface(IInvokable)
  ['{9bbb9bbb-9bbb-9bbb-9bbb-9bbb9bbb9bbb}']
    function  add(const aENPost: ENPost): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPost: ENPost); stdcall;
    function  getObject(const anObjectCode: Integer): ENPost; stdcall;
    function  getList: ENPostShortList; stdcall;
    function  getFilteredList(const aENPostFilter: ENPostFilter): ENPostShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPostShortList; stdcall;
    function  getScrollableFilteredList(const aENPostFilter: ENPostFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPostShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPostShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPostFilter: ENPostFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENPost.Destroy;
  begin
    if Assigned(FwoodenLength) then
      woodenLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fground) then
      ground.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENPostFilter.Destroy;
  begin
    if Assigned(FwoodenLength) then
      woodenLength.Free;
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fground) then
      ground.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(FaddressRef) then
      addressRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENPostFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENPostShort.Destroy;
  begin
    if Assigned(FlastRepairDate) then
      lastRepairDate.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fline04RefLineLength) then
      line04RefLineLength.Free;
    if Assigned(Fline04RefLastRepairDate) then
      line04RefLastRepairDate.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fline150RefLineLength) then
      line150RefLineLength.Free;
    if Assigned(Fline150RefChainsLength) then
      line150RefChainsLength.Free;
    if Assigned(Fline150RefChains2Length) then
      line150RefChains2Length.Free;
    if Assigned(Fline150RefLastRepairDate) then
      line150RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENPostShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPost, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost');
  RemClassRegistry.RegisterXSClass(ENPostRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostRef');
  RemClassRegistry.RegisterXSClass(ENPostFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostFilter');
  RemClassRegistry.RegisterXSClass(ENPostShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostShort');
  RemClassRegistry.RegisterXSClass(ENPostShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPostShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPostShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPostControllerSoapPort), 'http://ksoe.org/ENPostController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPostControllerSoapPort), 'http://ksoe.org/ENPostController/action/ENPostController.%operationName%');


end.
