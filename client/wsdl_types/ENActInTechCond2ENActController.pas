unit ENActInTechCond2ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENActIncomeTechConditionsController 
   ,ENActController 
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

  ENActInTechCond2ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActInTechCond2ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActInTechCond2ENAct = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
//???
    FactIncomeRef : ENActIncomeTechConditionsRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property actIncomeRef : ENActIncomeTechConditionsRef read FactIncomeRef write FactIncomeRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
  
{
  ENActInTechCond2ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
//???
    FactIncomeRef : ENActIncomeTechConditionsRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property actIncomeRef : ENActIncomeTechConditionsRef read FactIncomeRef write FactIncomeRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
}

  ENActInTechCond2ENActFilter = class(ENActInTechCond2ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENActInTechCond2ENActShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    FactIncomeRefCode : Integer; 
    FactIncomeRefNumbergen : WideString;
    FactIncomeRefDategen : TXSDate;
    FactIncomeRefActDateStart : TXSDate;
    FactIncomeRefActDateEnd : TXSDate;
    FactIncomeRefSummaGen : TXSDecimal;
    FactIncomeRefSummaVat : TXSDecimal;
    FactRefCode : Integer; 
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer; 
    FactRefFinDocMechanicCode : Integer; 
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 

    property actIncomeRefCode : Integer read FactIncomeRefCode write FactIncomeRefCode; 
    property actIncomeRefNumbergen : WideString read FactIncomeRefNumbergen write FactIncomeRefNumbergen; 
    property actIncomeRefDategen : TXSDate read FactIncomeRefDategen write FactIncomeRefDategen; 
    property actIncomeRefActDateStart : TXSDate read FactIncomeRefActDateStart write FactIncomeRefActDateStart; 
    property actIncomeRefActDateEnd : TXSDate read FactIncomeRefActDateEnd write FactIncomeRefActDateEnd; 
    property actIncomeRefSummaGen : TXSDecimal read FactIncomeRefSummaGen write FactIncomeRefSummaGen; 
    property actIncomeRefSummaVat : TXSDecimal read FactIncomeRefSummaVat write FactIncomeRefSummaVat; 
    property actRefCode : Integer read FactRefCode write FactRefCode; 
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen; 
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen; 
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode; 
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode; 
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName; 
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName; 
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber; 
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen; 
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit; 
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct; 
  end;

  ArrayOfENActInTechCond2ENActShort = array of ENActInTechCond2ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActInTechCond2ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActInTechCond2ENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActInTechCond2ENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActInTechCond2ENActController/message/
  // soapAction: http://ksoe.org/ENActInTechCond2ENActController/action/ENActInTechCond2ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActInTechCond2ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActInTechCond2ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActInTechCond2ENActControllerSoapPort = interface(IInvokable)
  ['{d0bed0be-d0be-d0be-d0be-d0bed0bed0be}']
    function  add(const aENActInTechCond2ENAct: ENActInTechCond2ENAct): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActInTechCond2ENAct: ENActInTechCond2ENAct); stdcall;
    function  getObject(const anObjectCode: Integer): ENActInTechCond2ENAct; stdcall;
    function  getList: ENActInTechCond2ENActShortList; stdcall;
    function  getFilteredList(const aENActInTechCond2ENActFilter: ENActInTechCond2ENActFilter): ENActInTechCond2ENActShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActInTechCond2ENActShortList; stdcall;
    function  getScrollableFilteredList(const aENActInTechCond2ENActFilter: ENActInTechCond2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActInTechCond2ENActShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActInTechCond2ENActShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENActInTechCond2ENActFilter: ENActInTechCond2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENActInTechCond2ENAct.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENActInTechCond2ENActFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENActInTechCond2ENActFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENActInTechCond2ENActShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRefDategen) then
      actIncomeRefDategen.Free;
    if Assigned(FactIncomeRefActDateStart) then
      actIncomeRefActDateStart.Free;
    if Assigned(FactIncomeRefActDateEnd) then
      actIncomeRefActDateEnd.Free;
    if Assigned(FactIncomeRefSummaGen) then
      actIncomeRefSummaGen.Free;
    if Assigned(FactIncomeRefSummaVat) then
      actIncomeRefSummaVat.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end; 
  
  destructor ENActInTechCond2ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActInTechCond2ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInTechCond2ENAct');
  RemClassRegistry.RegisterXSClass(ENActInTechCond2ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInTechCond2ENActRef');
  RemClassRegistry.RegisterXSClass(ENActInTechCond2ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInTechCond2ENActFilter');
  RemClassRegistry.RegisterXSClass(ENActInTechCond2ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInTechCond2ENActShort');
  RemClassRegistry.RegisterXSClass(ENActInTechCond2ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActInTechCond2ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActInTechCond2ENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActInTechCond2ENActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActInTechCond2ENActControllerSoapPort), 'http://ksoe.org/ENActInTechCond2ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActInTechCond2ENActControllerSoapPort), 'http://ksoe.org/ENActInTechCond2ENActController/action/ENActInTechCond2ENActController.%operationName%');


end.
