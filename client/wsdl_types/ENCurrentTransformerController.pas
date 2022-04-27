unit ENCurrentTransformerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController,
  EnergyProController2, ENCurrentTransformerTypeController, ENElementController,
  TKMaterialsController, ENHighVoltageSellController, ENTransformerController;

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

  ENCurrentTransformer            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCurrentTransformerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCurrentTransformer = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FaccruracyClass : TXSDecimal;
    FnumberGen : TXSDecimal;
    FcoefTransformation : TXSDecimal;
    FsecondaryWindingsNumber : TXSDecimal;
    Fmodify_time : Int64;
//???
    FcurrentTransformerType : ENCurrentTransformerType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property accruracyClass : TXSDecimal read FaccruracyClass write FaccruracyClass; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 
    property coefTransformation : TXSDecimal read FcoefTransformation write FcoefTransformation; 
    property secondaryWindingsNumber : TXSDecimal read FsecondaryWindingsNumber write FsecondaryWindingsNumber; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property currentTransformerType : ENCurrentTransformerType read FcurrentTransformerType write FcurrentTransformerType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
  end;
  
{
  ENCurrentTransformerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FaccruracyClass : TXSDecimal;
    FnumberGen : TXSDecimal;
    FcoefTransformation : TXSDecimal;
    FsecondaryWindingsNumber : TXSDecimal;
    Fmodify_time : Int64;
//???
    FcurrentTransformerType : ENCurrentTransformerType;
//???
    Felement : ENElement;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FhighvoltageSell : ENHighVoltageSell;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property accruracyClass : TXSDecimal read FaccruracyClass write FaccruracyClass; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 
    property coefTransformation : TXSDecimal read FcoefTransformation write FcoefTransformation; 
    property secondaryWindingsNumber : TXSDecimal read FsecondaryWindingsNumber write FsecondaryWindingsNumber; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property currentTransformerType : ENCurrentTransformerType read FcurrentTransformerType write FcurrentTransformerType; 
    property element : ENElement read Felement write Felement; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property highvoltageSell : ENHighVoltageSell read FhighvoltageSell write FhighvoltageSell; 
  end;
}

  ENCurrentTransformerFilter = class(ENCurrentTransformer)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCurrentTransformerShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FaccruracyClass : TXSDecimal;
    FnumberGen : TXSDecimal;
    FcoefTransformation : TXSDecimal;
    FsecondaryWindingsNumber : TXSDecimal;
    FcurrentTransformerTypeCode : Integer; 
    FcurrentTransformerTypeName : WideString;
    FelementCode : Integer; 
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FhighvoltageSellCode : Integer; 
    FhighvoltageSellName : WideString;
    FhighvoltageSellNumberGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property accruracyClass : TXSDecimal read FaccruracyClass write FaccruracyClass; 
    property numberGen : TXSDecimal read FnumberGen write FnumberGen; 
    property coefTransformation : TXSDecimal read FcoefTransformation write FcoefTransformation; 
    property secondaryWindingsNumber : TXSDecimal read FsecondaryWindingsNumber write FsecondaryWindingsNumber; 

    property currentTransformerTypeCode : Integer read FcurrentTransformerTypeCode write FcurrentTransformerTypeCode; 
    property currentTransformerTypeName : WideString read FcurrentTransformerTypeName write FcurrentTransformerTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property highvoltageSellCode : Integer read FhighvoltageSellCode write FhighvoltageSellCode; 
    property highvoltageSellName : WideString read FhighvoltageSellName write FhighvoltageSellName; 
    property highvoltageSellNumberGen : WideString read FhighvoltageSellNumberGen write FhighvoltageSellNumberGen; 
  end;

  ArrayOfENCurrentTransformerShort = array of ENCurrentTransformerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCurrentTransformerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCurrentTransformerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCurrentTransformerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCurrentTransformerController/message/
  // soapAction: http://ksoe.org/ENCurrentTransformerController/action/ENCurrentTransformerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCurrentTransformerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCurrentTransformerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCurrentTransformerControllerSoapPort = interface(IInvokable)
  ['{86D430D8-C88D-491F-B11F-7F9DA76AD919}']
    function  add(const aENCurrentTransformer: ENCurrentTransformer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCurrentTransformer: ENCurrentTransformer); stdcall;
    function  getObject(const anObjectCode: Integer): ENCurrentTransformer; stdcall;
    function  getList: ENCurrentTransformerShortList; stdcall;
    function  getFilteredList(const aENCurrentTransformerFilter: ENCurrentTransformerFilter): ENCurrentTransformerShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerShortList; stdcall;
    function  getScrollableFilteredList(const aENCurrentTransformerFilter: ENCurrentTransformerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCurrentTransformerShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCurrentTransformerFilter: ENCurrentTransformerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENCurrentTransformer.Destroy;
  begin
    if Assigned(FaccruracyClass) then
      accruracyClass.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FcoefTransformation) then
      coefTransformation.Free;
    if Assigned(FsecondaryWindingsNumber) then
      secondaryWindingsNumber.Free;
    if Assigned(FcurrentTransformerType) then
      currentTransformerType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    inherited Destroy;
  end;

{  
  destructor ENCurrentTransformerFilter.Destroy;
  begin
    if Assigned(FaccruracyClass) then
      accruracyClass.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FcoefTransformation) then
      coefTransformation.Free;
    if Assigned(FsecondaryWindingsNumber) then
      secondaryWindingsNumber.Free;
    if Assigned(FcurrentTransformerType) then
      currentTransformerType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FhighvoltageSell) then
      highvoltageSell.Free;
    inherited Destroy;
  end; 
}

  destructor ENCurrentTransformerFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENCurrentTransformerShort.Destroy;
  begin
    if Assigned(FaccruracyClass) then
      accruracyClass.Free;
    if Assigned(FnumberGen) then
      numberGen.Free;
    if Assigned(FcoefTransformation) then
      coefTransformation.Free;
    if Assigned(FsecondaryWindingsNumber) then
      secondaryWindingsNumber.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end; 
  
  destructor ENCurrentTransformerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCurrentTransformer, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformer');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerRef');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerFilter');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerShort');
  RemClassRegistry.RegisterXSClass(ENCurrentTransformerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCurrentTransformerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCurrentTransformerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCurrentTransformerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCurrentTransformerControllerSoapPort), 'http://ksoe.org/ENCurrentTransformerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCurrentTransformerControllerSoapPort), 'http://ksoe.org/ENCurrentTransformerController/action/ENCurrentTransformerController.%operationName%');


end.
