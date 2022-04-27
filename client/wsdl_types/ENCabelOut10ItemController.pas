unit ENCabelOut10ItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPostController 
   ,ENCabelOut10Controller 
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

  ENCabelOut10Item            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOut10ItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOut10Item = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fpost : ENPost;
//???
    FcabelOut10Ref : ENCabelOut10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property post : ENPost read Fpost write Fpost; 
    property cabelOut10Ref : ENCabelOut10Ref read FcabelOut10Ref write FcabelOut10Ref; 
  end;
  
{
  ENCabelOut10ItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fpost : ENPost;
//???
    FcabelOut10Ref : ENCabelOut10Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property post : ENPost read Fpost write Fpost; 
    property cabelOut10Ref : ENCabelOut10Ref read FcabelOut10Ref write FcabelOut10Ref; 
  end;
}

  ENCabelOut10ItemFilter = class(ENCabelOut10Item)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCabelOut10ItemShort = class(TRemotable)
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
    FcabelOut10RefCode: Integer;
    FcabelOut10RefCabelLength: TXSDecimal;
    FcabelOut10RefName: WideString;
    FcabelOut10RefMaterialRefCode: Integer;
    FcabelOut10RefMaterialRefName: WideString;
    FcabelOut10RefMaterialRefCost : TXSDecimal;
    FcabelOut10RefMaterialRefDeliveryDate : Integer;
    FcabelOut10RefMaterialRefNumkatalog : WideString;
    FcabelOut10RefMaterialRefIdentid : WideString;
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
    property cabelOut10RefCode : Integer read FcabelOut10RefCode write FcabelOut10RefCode;
    property cabelOut10RefCabelLength : TXSDecimal read FcabelOut10RefCabelLength write FcabelOut10RefCabelLength;
    property cabelOut10RefName: WideString read FcabelOut10RefName write FcabelOut10RefName;
    property cabelOut10RefMaterialRefCode: Integer read FcabelOut10RefMaterialRefCode write FcabelOut10RefMaterialRefCode;
    property cabelOut10RefMaterialRefName: WideString read FcabelOut10RefMaterialRefName write FcabelOut10RefMaterialRefName;
    property cabelOut10RefMaterialRefCost: TXSDecimal read FcabelOut10RefMaterialRefCost write FcabelOut10RefMaterialRefCost;
    property cabelOut10RefMaterialRefDeliveryDate: Integer read FcabelOut10RefMaterialRefDeliveryDate write FcabelOut10RefMaterialRefDeliveryDate;
    property cabelOut10RefMaterialRefNumkatalog: WideString read FcabelOut10RefMaterialRefNumkatalog write FcabelOut10RefMaterialRefNumkatalog;
    property cabelOut10RefMaterialRefIdentid: WideString read FcabelOut10RefMaterialRefIdentid write FcabelOut10RefMaterialRefIdentid;
  end;

  ArrayOfENCabelOut10ItemShort = array of ENCabelOut10ItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCabelOut10ItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCabelOut10ItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCabelOut10ItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCabelOut10ItemController/message/
  // soapAction: http://ksoe.org/ENCabelOut10ItemController/action/ENCabelOut10ItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCabelOut10ItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCabelOut10ItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCabelOut10ItemControllerSoapPort = interface(IInvokable)
  ['{1faa1faa-1faa-1faa-1faa-1faa1faa1faa}']
    function  add(const aENCabelOut10Item: ENCabelOut10Item): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCabelOut10Item: ENCabelOut10Item); stdcall;
    function  getObject(const anObjectCode: Integer): ENCabelOut10Item; stdcall;
    function  getList: ENCabelOut10ItemShortList; stdcall;
    function  getFilteredList(const aENCabelOut10ItemFilter: ENCabelOut10ItemFilter): ENCabelOut10ItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ItemShortList; stdcall;
    function  getScrollableFilteredList(const aENCabelOut10ItemFilter: ENCabelOut10ItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCabelOut10ItemFilter: ENCabelOut10ItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENCabelOut10Item.Destroy;
  begin
    if Assigned(Fpost) then
      post.Free;
    if Assigned(FcabelOut10Ref) then
      cabelOut10Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENCabelOut10ItemFilter.Destroy;
  begin
    if Assigned(Fpost) then
      post.Free;
    if Assigned(FcabelOut10Ref) then
      cabelOut10Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENCabelOut10ItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENCabelOut10ItemShort.Destroy;
  begin
    if Assigned(FpostLastRepairDate) then
      postLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENCabelOut10ItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCabelOut10Item, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10Item');
  RemClassRegistry.RegisterXSClass(ENCabelOut10ItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10ItemRef');
  RemClassRegistry.RegisterXSClass(ENCabelOut10ItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10ItemFilter');
  RemClassRegistry.RegisterXSClass(ENCabelOut10ItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10ItemShort');
  RemClassRegistry.RegisterXSClass(ENCabelOut10ItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10ItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCabelOut10ItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCabelOut10ItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCabelOut10ItemControllerSoapPort), 'http://ksoe.org/ENCabelOut10ItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCabelOut10ItemControllerSoapPort), 'http://ksoe.org/ENCabelOut10ItemController/action/ENCabelOut10ItemController.%operationName%');


end.
