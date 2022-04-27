unit ENWiresController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,ENWiresCutController 
   ,ENWiresFasteningController 
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

  ENWires            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWiresRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWires = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberGen : WideString;
    FcountWires : Integer; 
    FwireLength : TXSDecimal;
    FexternOrg : WideString;
    FisCabel : Integer; 
    FisRadio : Integer; 
    FisIllumination : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmatWireRef : TKMaterialsRef;
//???
    FcutRef : ENWiresCutRef;
//???
    FfasteningRef : ENWiresFasteningRef;
//???
    Felement : ENElement;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  countWires : Integer read FcountWires write FcountWires; 
    property wireLength : TXSDecimal read FwireLength write FwireLength; 
    property externOrg : WideString read FexternOrg write FexternOrg;
    property  isCabel : Integer read FisCabel write FisCabel; 
    property  isRadio : Integer read FisRadio write FisRadio; 
    property  isIllumination : Integer read FisIllumination write FisIllumination; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property matWireRef : TKMaterialsRef read FmatWireRef write FmatWireRef; 
    property cutRef : ENWiresCutRef read FcutRef write FcutRef; 
    property fasteningRef : ENWiresFasteningRef read FfasteningRef write FfasteningRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
  
{
  ENWiresFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberGen : WideString;
    FcountWires : Integer; 
    FwireLength : TXSDecimal;
    FexternOrg : WideString;
    FisCabel : Integer; 
    FisRadio : Integer; 
    FisIllumination : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FmatWireRef : TKMaterialsRef;
//???
    FcutRef : ENWiresCutRef;
//???
    FfasteningRef : ENWiresFasteningRef;
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
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  countWires : Integer read FcountWires write FcountWires; 
    property wireLength : TXSDecimal read FwireLength write FwireLength; 
    property externOrg : WideString read FexternOrg write FexternOrg;
    property  isCabel : Integer read FisCabel write FisCabel; 
    property  isRadio : Integer read FisRadio write FisRadio; 
    property  isIllumination : Integer read FisIllumination write FisIllumination; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property matWireRef : TKMaterialsRef read FmatWireRef write FmatWireRef; 
    property cutRef : ENWiresCutRef read FcutRef write FcutRef; 
    property fasteningRef : ENWiresFasteningRef read FfasteningRef write FfasteningRef; 
    property element : ENElement read Felement write Felement; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
  end;
}

  ENWiresFilter = class(ENWires)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENWiresShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberGen : WideString;
    FcountWires : Integer; 
    FwireLength : TXSDecimal;
    FexternOrg : WideString;
    FisCabel : Integer; 
    FmatWireRefCode : Integer; 
    FmatWireRefName : WideString;
    FmatWireRefCost : TXSDecimal;
    FmatWireRefDeliveryDate : Integer; 
    FmatWireRefNumkatalog : WideString;
    FmatWireRefIdentid : WideString;
    FcutRefCode : Integer; 
    FcutRefWiresCut : TXSDecimal;
    FfasteningRefCode : Integer; 
    FfasteningRefName : WideString;
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
    property  code : Integer read Fcode write Fcode; 
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  countWires : Integer read FcountWires write FcountWires; 
    property wireLength : TXSDecimal read FwireLength write FwireLength; 
    property externOrg : WideString read FexternOrg write FexternOrg;
    property  isCabel : Integer read FisCabel write FisCabel;
    property matWireRefCode : Integer read FmatWireRefCode write FmatWireRefCode; 
    property matWireRefName : WideString read FmatWireRefName write FmatWireRefName; 
    property matWireRefCost : TXSDecimal read FmatWireRefCost write FmatWireRefCost; 
    property matWireRefDeliveryDate : Integer read FmatWireRefDeliveryDate write FmatWireRefDeliveryDate; 
    property matWireRefNumkatalog : WideString read FmatWireRefNumkatalog write FmatWireRefNumkatalog; 
    property matWireRefIdentid : WideString read FmatWireRefIdentid write FmatWireRefIdentid; 
    property cutRefCode : Integer read FcutRefCode write FcutRefCode; 
    property cutRefWiresCut : TXSDecimal read FcutRefWiresCut write FcutRefWiresCut; 
    property fasteningRefCode : Integer read FfasteningRefCode write FfasteningRefCode; 
    property fasteningRefName : WideString read FfasteningRefName write FfasteningRefName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
  end;

  ArrayOfENWiresShort = array of ENWiresShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWiresShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWiresShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWiresShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWiresController/message/
  // soapAction: http://ksoe.org/ENWiresController/action/ENWiresController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWiresControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWiresController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWiresControllerSoapPort = interface(IInvokable)
  ['{15f815f8-15f8-15f8-15f8-15f815f815f8}']
    function  add(const aENWires: ENWires): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWires: ENWires); stdcall;
    function  getObject(const anObjectCode: Integer): ENWires; stdcall;
    function  getList: ENWiresShortList; stdcall;
    function  getFilteredList(const aENWiresFilter: ENWiresFilter): ENWiresShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWiresShortList; stdcall;
    function  getScrollableFilteredList(const aENWiresFilter: ENWiresFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWiresShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWiresShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENWiresFilter: ENWiresFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENWires.Destroy;
  begin
    if Assigned(FwireLength) then
      wireLength.Free;
    if Assigned(FmatWireRef) then
      matWireRef.Free;
    if Assigned(FcutRef) then
      cutRef.Free;
    if Assigned(FfasteningRef) then
      fasteningRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end;

{  
  destructor ENWiresFilter.Destroy;
  begin
    if Assigned(FwireLength) then
      wireLength.Free;
    if Assigned(FmatWireRef) then
      matWireRef.Free;
    if Assigned(FcutRef) then
      cutRef.Free;
    if Assigned(FfasteningRef) then
      fasteningRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end; 
}

  destructor ENWiresFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENWiresShort.Destroy;
  begin
    if Assigned(FwireLength) then
      wireLength.Free;
    if Assigned(FmatWireRefCost) then
      matWireRefCost.Free;
    if Assigned(FcutRefWiresCut) then
      cutRefWiresCut.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENWiresShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWires, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWires');
  RemClassRegistry.RegisterXSClass(ENWiresRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresRef');
  RemClassRegistry.RegisterXSClass(ENWiresFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresFilter');
  RemClassRegistry.RegisterXSClass(ENWiresShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresShort');
  RemClassRegistry.RegisterXSClass(ENWiresShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWiresShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWiresShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWiresShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWiresControllerSoapPort), 'http://ksoe.org/ENWiresController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWiresControllerSoapPort), 'http://ksoe.org/ENWiresController/action/ENWiresController.%operationName%');


end.
