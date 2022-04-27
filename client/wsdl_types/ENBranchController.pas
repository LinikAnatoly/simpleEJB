unit ENBranchController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENBranchTypeController 
   ,ENElementController 
   ,TKMaterialsController 
   ,ENLine04Controller 
   ,ENLineCableController 
   ,ENConsumerCategoryController 
   ,ENBelongingController 
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

  ENBranch            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranchRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranch = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbasicConsumer : WideString;
    Fmodify_time : Int64;
    FnumberGen : WideString;
    FcurrentAdmis : TXSDecimal;
//???
    FbranchTypeRef : ENBranchTypeRef;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fline04Ref : ENLine04Ref;
//???
    FlineCableRef : ENLineCableRef;
//???
    FconsumerCategoryRef : ENConsumerCategoryRef;
//???
    FbelongingRef : ENBelongingRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property basicConsumer : WideString read FbasicConsumer write FbasicConsumer;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property currentAdmis : TXSDecimal read FcurrentAdmis write FcurrentAdmis; 
    property branchTypeRef : ENBranchTypeRef read FbranchTypeRef write FbranchTypeRef; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property consumerCategoryRef : ENConsumerCategoryRef read FconsumerCategoryRef write FconsumerCategoryRef; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
  
{
  ENBranchFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbasicConsumer : WideString;
    Fmodify_time : Int64;
    FnumberGen : WideString;
    FcurrentAdmis : TXSDecimal;
//???
    FbranchTypeRef : ENBranchTypeRef;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    Fline04Ref : ENLine04Ref;
//???
    FlineCableRef : ENLineCableRef;
//???
    FconsumerCategoryRef : ENConsumerCategoryRef;
//???
    FbelongingRef : ENBelongingRef;
//???
    Fpanel : ENPanelRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property basicConsumer : WideString read FbasicConsumer write FbasicConsumer;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property currentAdmis : TXSDecimal read FcurrentAdmis write FcurrentAdmis; 
    property branchTypeRef : ENBranchTypeRef read FbranchTypeRef write FbranchTypeRef; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property consumerCategoryRef : ENConsumerCategoryRef read FconsumerCategoryRef write FconsumerCategoryRef; 
    property belongingRef : ENBelongingRef read FbelongingRef write FbelongingRef; 
    property panel : ENPanelRef read Fpanel write Fpanel; 
  end;
}

  ENBranchFilter = class(ENBranch)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBranchShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbasicConsumer : WideString;
    FnumberGen : WideString;
    FcurrentAdmis : TXSDecimal;
    FbranchTypeRefCode : Integer; 
    FbranchTypeRefName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    Fline04RefCode : Integer; 
    Fline04RefInvNumber : WideString;
    Fline04RefName : WideString;
    Fline04RefBuhName : WideString;
    Fline04RefLineLength : TXSDecimal;
    Fline04RefYearBuild : Integer; 
    Fline04RefYearWorkingStart : Integer; 
    Fline04RefLastRepairDate : TXSDate;
    FlineCableRefCode : Integer; 
    FlineCableRefInvNumber : WideString;
    FlineCableRefName : WideString;
    FlineCableRefBuhName : WideString;
    FlineCableRefLineLength : TXSDecimal;
    FlineCableRefYearBuild : Integer; 
    FlineCableRefYearWorkingStart : Integer; 
    FlineCableRefLastRepairDate : TXSDate;
    FconsumerCategoryRefCode : Integer; 
    FconsumerCategoryRefName : WideString;
    FbelongingRefCode : Integer; 
    FbelongingRefName : WideString;
    FpanelCode : Integer; 
    FpanelName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property basicConsumer : WideString read FbasicConsumer write FbasicConsumer;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property currentAdmis : TXSDecimal read FcurrentAdmis write FcurrentAdmis; 

    property branchTypeRefCode : Integer read FbranchTypeRefCode write FbranchTypeRefCode; 
    property branchTypeRefName : WideString read FbranchTypeRefName write FbranchTypeRefName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property line04RefCode : Integer read Fline04RefCode write Fline04RefCode; 
    property line04RefInvNumber : WideString read Fline04RefInvNumber write Fline04RefInvNumber; 
    property line04RefName : WideString read Fline04RefName write Fline04RefName; 
    property line04RefBuhName : WideString read Fline04RefBuhName write Fline04RefBuhName; 
    property line04RefLineLength : TXSDecimal read Fline04RefLineLength write Fline04RefLineLength; 
    property line04RefYearBuild : Integer read Fline04RefYearBuild write Fline04RefYearBuild; 
    property line04RefYearWorkingStart : Integer read Fline04RefYearWorkingStart write Fline04RefYearWorkingStart; 
    property line04RefLastRepairDate : TXSDate read Fline04RefLastRepairDate write Fline04RefLastRepairDate; 
    property lineCableRefCode : Integer read FlineCableRefCode write FlineCableRefCode; 
    property lineCableRefInvNumber : WideString read FlineCableRefInvNumber write FlineCableRefInvNumber; 
    property lineCableRefName : WideString read FlineCableRefName write FlineCableRefName; 
    property lineCableRefBuhName : WideString read FlineCableRefBuhName write FlineCableRefBuhName; 
    property lineCableRefLineLength : TXSDecimal read FlineCableRefLineLength write FlineCableRefLineLength; 
    property lineCableRefYearBuild : Integer read FlineCableRefYearBuild write FlineCableRefYearBuild; 
    property lineCableRefYearWorkingStart : Integer read FlineCableRefYearWorkingStart write FlineCableRefYearWorkingStart; 
    property lineCableRefLastRepairDate : TXSDate read FlineCableRefLastRepairDate write FlineCableRefLastRepairDate; 
    property consumerCategoryRefCode : Integer read FconsumerCategoryRefCode write FconsumerCategoryRefCode; 
    property consumerCategoryRefName : WideString read FconsumerCategoryRefName write FconsumerCategoryRefName; 
    property belongingRefCode : Integer read FbelongingRefCode write FbelongingRefCode; 
    property belongingRefName : WideString read FbelongingRefName write FbelongingRefName; 
    property panelCode : Integer read FpanelCode write FpanelCode; 
    property panelName : WideString read FpanelName write FpanelName; 
  end;

  ArrayOfENBranchShort = array of ENBranchShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBranchShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBranchShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBranchShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBranchController/message/
  // soapAction: http://ksoe.org/ENBranchController/action/ENBranchController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBranchControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBranchController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBranchControllerSoapPort = interface(IInvokable)
  ['{f181f181-f181-f181-f181-f181f181f181}']
    function  add(const aENBranch: ENBranch): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBranch: ENBranch); stdcall;
    function  getObject(const anObjectCode: Integer): ENBranch; stdcall;
    function  getList: ENBranchShortList; stdcall;
    function  getFilteredList(const aENBranchFilter: ENBranchFilter): ENBranchShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBranchShortList; stdcall;
    function  getScrollableFilteredList(const aENBranchFilter: ENBranchFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBranchShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBranchShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBranchFilter: ENBranchFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENBranch.Destroy;
  begin
    if Assigned(FcurrentAdmis) then
      currentAdmis.Free;
    if Assigned(FbranchTypeRef) then
      branchTypeRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(FconsumerCategoryRef) then
      consumerCategoryRef.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end;

{  
  destructor ENBranchFilter.Destroy;
  begin
    if Assigned(FcurrentAdmis) then
      currentAdmis.Free;
    if Assigned(FbranchTypeRef) then
      branchTypeRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(FconsumerCategoryRef) then
      consumerCategoryRef.Free;
    if Assigned(FbelongingRef) then
      belongingRef.Free;
    if Assigned(Fpanel) then
      panel.Free;
    inherited Destroy;
  end; 
}

  destructor ENBranchFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENBranchShort.Destroy;
  begin
    if Assigned(FcurrentAdmis) then
      currentAdmis.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(Fline04RefLineLength) then
      line04RefLineLength.Free;
    if Assigned(Fline04RefLastRepairDate) then
      line04RefLastRepairDate.Free;
    if Assigned(FlineCableRefLineLength) then
      lineCableRefLineLength.Free;
    if Assigned(FlineCableRefLastRepairDate) then
      lineCableRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENBranchShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBranch, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranch');
  RemClassRegistry.RegisterXSClass(ENBranchRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchRef');
  RemClassRegistry.RegisterXSClass(ENBranchFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchFilter');
  RemClassRegistry.RegisterXSClass(ENBranchShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchShort');
  RemClassRegistry.RegisterXSClass(ENBranchShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBranchShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBranchShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBranchControllerSoapPort), 'http://ksoe.org/ENBranchController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBranchControllerSoapPort), 'http://ksoe.org/ENBranchController/action/ENBranchController.%operationName%');


end.
