unit ENCabelOut10Controller;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENCabelOutType10Controller 
   ,TKMaterialsController 
   ,ENCabelMuftaTypeController 
   ,ENElementController 
   ,ENLine10Controller 
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

  ENCabelOut10            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOut10Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOut10 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FcabelLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtypeRef : ENCabelOutType10Ref;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmuftaRef : ENCabelMuftaTypeRef;
//???
    Felement : ENElement;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property cabelLength : TXSDecimal read FcabelLength write FcabelLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENCabelOutType10Ref read FtypeRef write FtypeRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property muftaRef : ENCabelMuftaTypeRef read FmuftaRef write FmuftaRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
  
{
  ENCabelOut10Filter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FcabelLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtypeRef : ENCabelOutType10Ref;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FmuftaRef : ENCabelMuftaTypeRef;
//???
    Felement : ENElement;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property cabelLength : TXSDecimal read FcabelLength write FcabelLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENCabelOutType10Ref read FtypeRef write FtypeRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property muftaRef : ENCabelMuftaTypeRef read FmuftaRef write FmuftaRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
}

  ENCabelOut10Filter = class(ENCabelOut10)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCabelOut10Short = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FcabelLength: TXSDecimal;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmuftaRefCode : Integer; 
    FmuftaRefName : WideString;
    FelementCode : Integer; 
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property cabelLength: TXSDecimal read FcabelLength write FcabelLength;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property muftaRefCode : Integer read FmuftaRefCode write FmuftaRefCode;
    property muftaRefName : WideString read FmuftaRefName write FmuftaRefName; 
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength;
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate;
  end;

  ArrayOfENCabelOut10Short = array of ENCabelOut10Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCabelOut10ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCabelOut10Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCabelOut10Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCabelOut10Controller/message/
  // soapAction: http://ksoe.org/ENCabelOut10Controller/action/ENCabelOut10Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCabelOut10ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCabelOut10Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCabelOut10ControllerSoapPort = interface(IInvokable)
  ['{10bf10bf-10bf-10bf-10bf-10bf10bf10bf}']
    function  add(const aENCabelOut10: ENCabelOut10): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCabelOut10: ENCabelOut10); stdcall;
    function  getObject(const anObjectCode: Integer): ENCabelOut10; stdcall;
    function  getList: ENCabelOut10ShortList; stdcall;
    function  getFilteredList(const aENCabelOut10Filter: ENCabelOut10Filter): ENCabelOut10ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ShortList; stdcall;
    function  getScrollableFilteredList(const aENCabelOut10Filter: ENCabelOut10Filter; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOut10ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCabelOut10Filter: ENCabelOut10Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENCabelOut10.Destroy;
  begin
    if Assigned(FcabelLength) then
      cabelLength.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmuftaRef) then
      muftaRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENCabelOut10Filter.Destroy;
  begin
    if Assigned(FcabelLength) then
      cabelLength.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FmuftaRef) then
      muftaRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENCabelOut10Filter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENCabelOut10Short.Destroy;
  begin
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENCabelOut10ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCabelOut10, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10');
  RemClassRegistry.RegisterXSClass(ENCabelOut10Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10Ref');
  RemClassRegistry.RegisterXSClass(ENCabelOut10Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10Filter');
  RemClassRegistry.RegisterXSClass(ENCabelOut10Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10Short');
  RemClassRegistry.RegisterXSClass(ENCabelOut10ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOut10ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCabelOut10Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCabelOut10Short');

  InvRegistry.RegisterInterface(TypeInfo(ENCabelOut10ControllerSoapPort), 'http://ksoe.org/ENCabelOut10Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCabelOut10ControllerSoapPort), 'http://ksoe.org/ENCabelOut10Controller/action/ENCabelOut10Controller.%operationName%');


end.
