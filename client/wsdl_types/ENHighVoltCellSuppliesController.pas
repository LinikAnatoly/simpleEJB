unit ENHighVoltCellSuppliesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSubstation04Controller 
   ,ENHighVoltageSellController 
   ,ENLine10Controller 
   ,ENLineCableController 
   ,ENElementController
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

  ENHighVoltCellSupplies            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltCellSuppliesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENHighVoltCellSupplies = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FlineCableRef : ENLineCableRef;
//???
    Fs04ElementRef : ENElementRef;
//???
    FcellElementRef : ENElementRef;
//???
    FpowerElementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property s04ElementRef : ENElementRef read Fs04ElementRef write Fs04ElementRef; 
    property cellElementRef : ENElementRef read FcellElementRef write FcellElementRef; 
    property powerElementRef : ENElementRef read FpowerElementRef write FpowerElementRef; 
  end;
  
{
  ENHighVoltCellSuppliesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
//???
    Fsubstation04Ref : ENSubstation04Ref;
//???
    FhighVoltCellRef : ENHighVoltageSellRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FlineCableRef : ENLineCableRef;
//???
    Fs04ElementRef : ENElementRef;
//???
    FcellElementRef : ENElementRef;
//???
    FpowerElementRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property substation04Ref : ENSubstation04Ref read Fsubstation04Ref write Fsubstation04Ref; 
    property highVoltCellRef : ENHighVoltageSellRef read FhighVoltCellRef write FhighVoltCellRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property s04ElementRef : ENElementRef read Fs04ElementRef write Fs04ElementRef; 
    property cellElementRef : ENElementRef read FcellElementRef write FcellElementRef; 
    property powerElementRef : ENElementRef read FpowerElementRef write FpowerElementRef; 
  end;
}

  ENHighVoltCellSuppliesFilter = class(ENHighVoltCellSupplies)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENHighVoltCellSuppliesShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fsubstation04RefCode : Integer; 
    Fsubstation04RefName : WideString;
    Fsubstation04RefBuhName : WideString;
    Fsubstation04RefInvNumber : WideString;
    Fsubstation04RefNominalPower : TXSDecimal;
    Fsubstation04RefLastRepairDate : TXSDate;
    Fsubstation04RefSizCode : Integer; 
    Fsubstation04RefAddress : WideString;
    Fsubstation04RefYearBuild : Integer; 
    Fsubstation04RefYearWorkingStart : Integer; 
    Fsubstation04RefChambersQuantity : Integer; 
    FhighVoltCellRefCode : Integer; 
    FhighVoltCellRefName : WideString;
    FhighVoltCellRefNumberGen : WideString;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    FlineCableRefCode : Integer; 
    FlineCableRefInvNumber : WideString;
    FlineCableRefName : WideString;
    FlineCableRefBuhName : WideString;
    FlineCableRefLineLength : TXSDecimal;
    FlineCableRefYearBuild : Integer; 
    FlineCableRefYearWorkingStart : Integer; 
    FlineCableRefLastRepairDate : TXSDate;
    Fs04ElementRefCode : Integer; 
    FcellElementRefCode : Integer; 
    FpowerElementRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

    property substation04RefCode : Integer read Fsubstation04RefCode write Fsubstation04RefCode; 
    property substation04RefName : WideString read Fsubstation04RefName write Fsubstation04RefName; 
    property substation04RefBuhName : WideString read Fsubstation04RefBuhName write Fsubstation04RefBuhName; 
    property substation04RefInvNumber : WideString read Fsubstation04RefInvNumber write Fsubstation04RefInvNumber; 
    property substation04RefNominalPower : TXSDecimal read Fsubstation04RefNominalPower write Fsubstation04RefNominalPower; 
    property substation04RefLastRepairDate : TXSDate read Fsubstation04RefLastRepairDate write Fsubstation04RefLastRepairDate; 
    property substation04RefSizCode : Integer read Fsubstation04RefSizCode write Fsubstation04RefSizCode; 
    property substation04RefAddress : WideString read Fsubstation04RefAddress write Fsubstation04RefAddress; 
    property substation04RefYearBuild : Integer read Fsubstation04RefYearBuild write Fsubstation04RefYearBuild; 
    property substation04RefYearWorkingStart : Integer read Fsubstation04RefYearWorkingStart write Fsubstation04RefYearWorkingStart; 
    property substation04RefChambersQuantity : Integer read Fsubstation04RefChambersQuantity write Fsubstation04RefChambersQuantity; 
    property highVoltCellRefCode : Integer read FhighVoltCellRefCode write FhighVoltCellRefCode; 
    property highVoltCellRefName : WideString read FhighVoltCellRefName write FhighVoltCellRefName; 
    property highVoltCellRefNumberGen : WideString read FhighVoltCellRefNumberGen write FhighVoltCellRefNumberGen; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property lineCableRefCode : Integer read FlineCableRefCode write FlineCableRefCode; 
    property lineCableRefInvNumber : WideString read FlineCableRefInvNumber write FlineCableRefInvNumber; 
    property lineCableRefName : WideString read FlineCableRefName write FlineCableRefName; 
    property lineCableRefBuhName : WideString read FlineCableRefBuhName write FlineCableRefBuhName; 
    property lineCableRefLineLength : TXSDecimal read FlineCableRefLineLength write FlineCableRefLineLength; 
    property lineCableRefYearBuild : Integer read FlineCableRefYearBuild write FlineCableRefYearBuild; 
    property lineCableRefYearWorkingStart : Integer read FlineCableRefYearWorkingStart write FlineCableRefYearWorkingStart; 
    property lineCableRefLastRepairDate : TXSDate read FlineCableRefLastRepairDate write FlineCableRefLastRepairDate; 
    property s04ElementRefCode : Integer read Fs04ElementRefCode write Fs04ElementRefCode; //ENElementRef read Fs04ElementRefCode write Fs04ElementRefCode; 
    property cellElementRefCode : Integer read FcellElementRefCode write FcellElementRefCode; //ENElementRef read FcellElementRefCode write FcellElementRefCode; 
    property powerElementRefCode : Integer read FpowerElementRefCode write FpowerElementRefCode; //ENElementRef read FpowerElementRefCode write FpowerElementRefCode; 
  end;

  ArrayOfENHighVoltCellSuppliesShort = array of ENHighVoltCellSuppliesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENHighVoltCellSuppliesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENHighVoltCellSuppliesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENHighVoltCellSuppliesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENHighVoltCellSuppliesController/message/
  // soapAction: http://ksoe.org/ENHighVoltCellSuppliesController/action/ENHighVoltCellSuppliesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENHighVoltCellSuppliesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENHighVoltCellSuppliesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENHighVoltCellSuppliesControllerSoapPort = interface(IInvokable)
  ['{167c167c-167c-167c-167c-167c167c167c}']
    function  add(const aENHighVoltCellSupplies: ENHighVoltCellSupplies): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENHighVoltCellSupplies: ENHighVoltCellSupplies); stdcall;
    function  getObject(const anObjectCode: Integer): ENHighVoltCellSupplies; stdcall;
    function  getList: ENHighVoltCellSuppliesShortList; stdcall;
    function  getFilteredList(const aENHighVoltCellSuppliesFilter: ENHighVoltCellSuppliesFilter): ENHighVoltCellSuppliesShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltCellSuppliesShortList; stdcall;
    function  getScrollableFilteredList(const aENHighVoltCellSuppliesFilter: ENHighVoltCellSuppliesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltCellSuppliesShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENHighVoltCellSuppliesShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENHighVoltCellSuppliesFilter: ENHighVoltCellSuppliesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENHighVoltCellSupplies.Destroy;
  begin
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(Fs04ElementRef) then
      s04ElementRef.Free;
    if Assigned(FcellElementRef) then
      cellElementRef.Free;
    if Assigned(FpowerElementRef) then
      powerElementRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENHighVoltCellSuppliesFilter.Destroy;
  begin
    if Assigned(Fsubstation04Ref) then
      substation04Ref.Free;
    if Assigned(FhighVoltCellRef) then
      highVoltCellRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(Fs04ElementRef) then
      s04ElementRef.Free;
    if Assigned(FcellElementRef) then
      cellElementRef.Free;
    if Assigned(FpowerElementRef) then
      powerElementRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENHighVoltCellSuppliesFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENHighVoltCellSuppliesShort.Destroy;
  begin
    if Assigned(Fsubstation04RefNominalPower) then
      substation04RefNominalPower.Free;
    if Assigned(Fsubstation04RefLastRepairDate) then
      substation04RefLastRepairDate.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(FlineCableRefLineLength) then
      lineCableRefLineLength.Free;
    if Assigned(FlineCableRefLastRepairDate) then
      lineCableRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENHighVoltCellSuppliesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENHighVoltCellSupplies, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltCellSupplies');
  RemClassRegistry.RegisterXSClass(ENHighVoltCellSuppliesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltCellSuppliesRef');
  RemClassRegistry.RegisterXSClass(ENHighVoltCellSuppliesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltCellSuppliesFilter');
  RemClassRegistry.RegisterXSClass(ENHighVoltCellSuppliesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltCellSuppliesShort');
  RemClassRegistry.RegisterXSClass(ENHighVoltCellSuppliesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENHighVoltCellSuppliesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENHighVoltCellSuppliesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENHighVoltCellSuppliesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENHighVoltCellSuppliesControllerSoapPort), 'http://ksoe.org/ENHighVoltCellSuppliesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENHighVoltCellSuppliesControllerSoapPort), 'http://ksoe.org/ENHighVoltCellSuppliesController/action/ENHighVoltCellSuppliesController.%operationName%');


end.
