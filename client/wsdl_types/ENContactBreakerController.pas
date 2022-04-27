unit ENContactBreakerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENContactBreakerTypeController 
   ,TKMaterialsController 
   ,ENElementController 
   ,ENBranchController 
   ,ENLowVoltBoardController 
   ,ENPanelController 
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

  ENContactBreaker            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContactBreakerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENContactBreaker = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fcurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FcontactBreakerType : ENContactBreakerType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    Fbranch : ENBranchRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property current : TXSDecimal read Fcurrent write Fcurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property contactBreakerType : ENContactBreakerType read FcontactBreakerType write FcontactBreakerType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property branch : ENBranchRef read Fbranch write Fbranch; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
  
{
  ENContactBreakerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fcurrent : TXSDecimal;
    Fmodify_time : Int64;
//???
    FcontactBreakerType : ENContactBreakerType;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Felement : ENElement;
//???
    Fbranch : ENBranchRef;
//???
    FlvbRef : ENLowVoltBoardRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property current : TXSDecimal read Fcurrent write Fcurrent; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property contactBreakerType : ENContactBreakerType read FcontactBreakerType write FcontactBreakerType; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property element : ENElement read Felement write Felement; 
    property branch : ENBranchRef read Fbranch write Fbranch; 
    property lvbRef : ENLowVoltBoardRef read FlvbRef write FlvbRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
}

  ENContactBreakerFilter = class(ENContactBreaker)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENContactBreakerShort = class(TRemotable)
  private
    Fcode: Integer;
    Fname : WideString;
    Fcurrent: TXSDecimal;
    FcontactBreakerTypeCode: Integer;
    FcontactBreakerTypeName: WideString;
    FmaterialRefCode: Integer;
    FmaterialRefName: WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FelementCode: Integer;
    FbranchCode: Integer;
    FbranchName: WideString;
    FbranchBasicConsumer: WideString;
    FbranchNumberGen: WideString;
    FbranchCurrentAdmis : TXSDecimal;
    FpanelCode : Integer;
    FpanelName: WideString;
    FlvbRefCode : Integer; 
    FlvbRefName : WideString;
    FtransformerCode: Integer;
    FtransformerInvNumber: WideString;
    FtransformerName: WideString;
    FtransformerNominalPower: TXSDecimal;
  public
    destructor Destroy; override;
  published
    property code: Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property current: TXSDecimal read Fcurrent write Fcurrent;
    property contactBreakerTypeCode: Integer read FcontactBreakerTypeCode write FcontactBreakerTypeCode;
    property contactBreakerTypeName: WideString read FcontactBreakerTypeName write FcontactBreakerTypeName;
    property materialRefCode: Integer read FmaterialRefCode write FmaterialRefCode; //TKMaterialsRef read FmaterialRefCode write FmaterialRefCode;
    property materialRefName: WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property elementCode: Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode;
    property branchCode: Integer read FbranchCode write FbranchCode;
    property branchName: WideString read FbranchName write FbranchName;
    property branchBasicConsumer: WideString read FbranchBasicConsumer write FbranchBasicConsumer;
    property branchNumberGen: WideString read FbranchNumberGen write FbranchNumberGen;
    property branchCurrentAdmis : TXSDecimal read FbranchCurrentAdmis write FbranchCurrentAdmis; 
    property panelCode : Integer read FpanelCode write FpanelCode; 
    property panelName: WideString read FpanelName write FpanelName;
    property lvbRefCode : Integer read FlvbRefCode write FlvbRefCode; 
    property lvbRefName : WideString read FlvbRefName write FlvbRefName;
    property transformerCode: Integer read FtransformerCode write FtransformerCode;
    property transformerInvNumber: WideString read FtransformerInvNumber write FtransformerInvNumber;
    property transformerName: WideString read FtransformerName write FtransformerName;
    property transformerNominalPower: TXSDecimal read FtransformerNominalPower write FtransformerNominalPower;
  end;

  ArrayOfENContactBreakerShort = array of ENContactBreakerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENContactBreakerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENContactBreakerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENContactBreakerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENContactBreakerController/message/
  // soapAction: http://ksoe.org/ENContactBreakerController/action/ENContactBreakerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENContactBreakerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENContactBreakerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENContactBreakerControllerSoapPort = interface(IInvokable)
  ['{6cd66cd6-6cd6-6cd6-6cd6-6cd66cd66cd6}']
    function  add(const aENContactBreaker: ENContactBreaker): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENContactBreaker: ENContactBreaker); stdcall;
    function  getObject(const anObjectCode: Integer): ENContactBreaker; stdcall;
    function  getList: ENContactBreakerShortList; stdcall;
    function  getFilteredList(const aENContactBreakerFilter: ENContactBreakerFilter): ENContactBreakerShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerShortList; stdcall;
    function  getScrollableFilteredList(const aENContactBreakerFilter: ENContactBreakerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENContactBreakerShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENContactBreakerFilter: ENContactBreakerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
  end; 


implementation

  destructor ENContactBreaker.Destroy;
  begin
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FcontactBreakerType) then
      contactBreakerType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end;

{  
  destructor ENContactBreakerFilter.Destroy;
  begin
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FcontactBreakerType) then
      contactBreakerType.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fbranch) then
      branch.Free;
    if Assigned(FlvbRef) then
      lvbRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end; 
}

  destructor ENContactBreakerFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENContactBreakerShort.Destroy;
  begin
    if Assigned(Fcurrent) then
      current.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FbranchCurrentAdmis) then
      branchCurrentAdmis.Free;
    inherited Destroy;
  end; 
  
  destructor ENContactBreakerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENContactBreaker, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreaker');
  RemClassRegistry.RegisterXSClass(ENContactBreakerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerRef');
  RemClassRegistry.RegisterXSClass(ENContactBreakerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerFilter');
  RemClassRegistry.RegisterXSClass(ENContactBreakerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerShort');
  RemClassRegistry.RegisterXSClass(ENContactBreakerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENContactBreakerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENContactBreakerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENContactBreakerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENContactBreakerControllerSoapPort), 'http://ksoe.org/ENContactBreakerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENContactBreakerControllerSoapPort), 'http://ksoe.org/ENContactBreakerController/action/ENContactBreakerController.%operationName%');


end.
