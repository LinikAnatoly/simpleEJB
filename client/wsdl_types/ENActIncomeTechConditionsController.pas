unit ENActIncomeTechConditionsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTechConditionsServicesController 
   ,ENActIncomeStatusController 
   ,ENWarrantController
   ,DFDocSignerController
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

  ENActIncomeTechConditions            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeTechConditionsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeTechConditions = class(TRemotable)
  private
    Fcode : Integer; 
    Fnumbergen : WideString;
    Fdategen : TXSDate;
    FactDateStart : TXSDate;
    FactDateEnd : TXSDate;
    FsummaGen : TXSDecimal;
    FsummaVat : TXSDecimal;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtechCondServicesRef : ENTechConditionsServicesRef;
//???
    FstatusRef : ENActIncomeStatusRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dategen : TXSDate read Fdategen write Fdategen;
    property actDateStart : TXSDate read FactDateStart write FactDateStart;
    property actDateEnd : TXSDate read FactDateEnd write FactDateEnd;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property summaVat : TXSDecimal read FsummaVat write FsummaVat; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property techCondServicesRef : ENTechConditionsServicesRef read FtechCondServicesRef write FtechCondServicesRef; 
    property statusRef : ENActIncomeStatusRef read FstatusRef write FstatusRef; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;
  
{
  ENActIncomeTechConditionsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fnumbergen : WideString;
    Fdategen : TXSDate;
    FactDateStart : TXSDate;
    FactDateEnd : TXSDate;
    FsummaGen : TXSDecimal;
    FsummaVat : TXSDecimal;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FtechCondServicesRef : ENTechConditionsServicesRef;
//???
    FstatusRef : ENActIncomeStatusRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dategen : TXSDate read Fdategen write Fdategen;
    property actDateStart : TXSDate read FactDateStart write FactDateStart;
    property actDateEnd : TXSDate read FactDateEnd write FactDateEnd;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property summaVat : TXSDecimal read FsummaVat write FsummaVat; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property techCondServicesRef : ENTechConditionsServicesRef read FtechCondServicesRef write FtechCondServicesRef; 
    property statusRef : ENActIncomeStatusRef read FstatusRef write FstatusRef; 
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;
}

  ENActIncomeTechConditionsFilter = class(ENActIncomeTechConditions)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENActIncomeTechConditionsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fnumbergen : WideString;
    Fdategen : TXSDate;	
    FactDateStart : TXSDate;	
    FactDateEnd : TXSDate;	
    FsummaGen : TXSDecimal;
    FsummaVat : TXSDecimal;
    FtechCondServicesRefCode : Integer; 
    FtechCondServicesRefContractNumber : WideString;
    FtechCondServicesRefContractDate : TXSDate;
    FtechCondServicesRefFinContractNumber : WideString;
    FtechCondServicesRefFinContractDate : TXSDate;
    FtechCondServicesRefPartnerName : WideString;
    FtechCondServicesRefPartnerCode : WideString;
    FtechCondServicesRefFinDocCode : WideString;
    FtechCondServicesRefFinDocID : Integer; 
    FtechCondServicesRefFinCommentGen : WideString;
    FtechCondServicesRefContragentName : WideString;
    FtechCondServicesRefContragentAddress : WideString;
    FtechCondServicesRefContragentAddressWork : WideString;
    FtechCondServicesRefContragentPosition : WideString;
    FtechCondServicesRefContragentOkpo : WideString;
    FtechCondServicesRefContragentBankAccount : WideString;
    FtechCondServicesRefContragentBankName : WideString;
    FtechCondServicesRefContragentBankMfo : WideString;
    FtechCondServicesRefContragentBossName : WideString;
    FtechCondServicesRefContragentPassport : WideString;
    FtechCondServicesRefTySummaGen : TXSDecimal;
    FtechCondServicesRefTySummaVat : TXSDecimal;
    FtechCondServicesRefTyServicesSumma : TXSDecimal;
    FtechCondServicesRefTyServicesPower : TXSDecimal;
    FtechCondServicesRefCommentServicesGen : WideString;
    FtechCondServicesRefUserGen : WideString;
    FtechCondServicesRefDateEdit : TXSDate;
    FtechCondServicesRefWarrantDate : TXSDate;
    FtechCondServicesRefWarrantNumber : WideString;
    FtechCondServicesRefWarrantFIO : WideString;
    FtechCondServicesRefWarrantPassport : WideString;
    FtechCondServicesRefWarrantAddress : WideString;
    FtechCondServicesRefCnPackCode : Integer; 
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FwarrantRefCode : Integer;
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer;
    FwarrantRefMaxSum : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dategen : TXSDate read Fdategen write Fdategen;
    property actDateStart : TXSDate read FactDateStart write FactDateStart;
    property actDateEnd : TXSDate read FactDateEnd write FactDateEnd;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property summaVat : TXSDecimal read FsummaVat write FsummaVat; 

    property techCondServicesRefCode : Integer read FtechCondServicesRefCode write FtechCondServicesRefCode; 
    property techCondServicesRefContractNumber : WideString read FtechCondServicesRefContractNumber write FtechCondServicesRefContractNumber; 
    property techCondServicesRefContractDate : TXSDate read FtechCondServicesRefContractDate write FtechCondServicesRefContractDate; 
    property techCondServicesRefFinContractNumber : WideString read FtechCondServicesRefFinContractNumber write FtechCondServicesRefFinContractNumber; 
    property techCondServicesRefFinContractDate : TXSDate read FtechCondServicesRefFinContractDate write FtechCondServicesRefFinContractDate; 
    property techCondServicesRefPartnerName : WideString read FtechCondServicesRefPartnerName write FtechCondServicesRefPartnerName; 
    property techCondServicesRefPartnerCode : WideString read FtechCondServicesRefPartnerCode write FtechCondServicesRefPartnerCode; 
    property techCondServicesRefFinDocCode : WideString read FtechCondServicesRefFinDocCode write FtechCondServicesRefFinDocCode; 
    property techCondServicesRefFinDocID : Integer read FtechCondServicesRefFinDocID write FtechCondServicesRefFinDocID; 
    property techCondServicesRefFinCommentGen : WideString read FtechCondServicesRefFinCommentGen write FtechCondServicesRefFinCommentGen; 
    property techCondServicesRefContragentName : WideString read FtechCondServicesRefContragentName write FtechCondServicesRefContragentName; 
    property techCondServicesRefContragentAddress : WideString read FtechCondServicesRefContragentAddress write FtechCondServicesRefContragentAddress; 
    property techCondServicesRefContragentAddressWork : WideString read FtechCondServicesRefContragentAddressWork write FtechCondServicesRefContragentAddressWork; 
    property techCondServicesRefContragentPosition : WideString read FtechCondServicesRefContragentPosition write FtechCondServicesRefContragentPosition; 
    property techCondServicesRefContragentOkpo : WideString read FtechCondServicesRefContragentOkpo write FtechCondServicesRefContragentOkpo; 
    property techCondServicesRefContragentBankAccount : WideString read FtechCondServicesRefContragentBankAccount write FtechCondServicesRefContragentBankAccount; 
    property techCondServicesRefContragentBankName : WideString read FtechCondServicesRefContragentBankName write FtechCondServicesRefContragentBankName; 
    property techCondServicesRefContragentBankMfo : WideString read FtechCondServicesRefContragentBankMfo write FtechCondServicesRefContragentBankMfo; 
    property techCondServicesRefContragentBossName : WideString read FtechCondServicesRefContragentBossName write FtechCondServicesRefContragentBossName; 
    property techCondServicesRefContragentPassport : WideString read FtechCondServicesRefContragentPassport write FtechCondServicesRefContragentPassport; 
    property techCondServicesRefTySummaGen : TXSDecimal read FtechCondServicesRefTySummaGen write FtechCondServicesRefTySummaGen; 
    property techCondServicesRefTySummaVat : TXSDecimal read FtechCondServicesRefTySummaVat write FtechCondServicesRefTySummaVat; 
    property techCondServicesRefTyServicesSumma : TXSDecimal read FtechCondServicesRefTyServicesSumma write FtechCondServicesRefTyServicesSumma; 
    property techCondServicesRefTyServicesPower : TXSDecimal read FtechCondServicesRefTyServicesPower write FtechCondServicesRefTyServicesPower; 
    property techCondServicesRefCommentServicesGen : WideString read FtechCondServicesRefCommentServicesGen write FtechCondServicesRefCommentServicesGen; 
    property techCondServicesRefUserGen : WideString read FtechCondServicesRefUserGen write FtechCondServicesRefUserGen; 
    property techCondServicesRefDateEdit : TXSDate read FtechCondServicesRefDateEdit write FtechCondServicesRefDateEdit; 
    property techCondServicesRefWarrantDate : TXSDate read FtechCondServicesRefWarrantDate write FtechCondServicesRefWarrantDate; 
    property techCondServicesRefWarrantNumber : WideString read FtechCondServicesRefWarrantNumber write FtechCondServicesRefWarrantNumber; 
    property techCondServicesRefWarrantFIO : WideString read FtechCondServicesRefWarrantFIO write FtechCondServicesRefWarrantFIO; 
    property techCondServicesRefWarrantPassport : WideString read FtechCondServicesRefWarrantPassport write FtechCondServicesRefWarrantPassport; 
    property techCondServicesRefWarrantAddress : WideString read FtechCondServicesRefWarrantAddress write FtechCondServicesRefWarrantAddress; 
    property techCondServicesRefCnPackCode : Integer read FtechCondServicesRefCnPackCode write FtechCondServicesRefCnPackCode; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode;
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen;
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName;
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO;
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO;
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition;
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO;
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition;
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport;
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress;
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower;
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum;
  end;

  ArrayOfENActIncomeTechConditionsShort = array of ENActIncomeTechConditionsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomeTechConditionsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomeTechConditionsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomeTechConditionsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomeTechConditionsController/message/
  // soapAction: http://ksoe.org/ENActIncomeTechConditionsController/action/ENActIncomeTechConditionsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomeTechConditionsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomeTechConditionsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomeTechConditionsControllerSoapPort = interface(IInvokable)
  ['{89971FEA-009C-4A6F-B3EA-111258E7DB83}']
    function  add(const aENActIncomeTechConditions: ENActIncomeTechConditions): Integer; overload; stdcall;
    function  add(const aENActIncomeTechConditions: ENActIncomeTechConditions; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;

    procedure save(const aENActIncomeTechConditions: ENActIncomeTechConditions); overload; stdcall;
    procedure save(const aENActIncomeTechConditions: ENActIncomeTechConditions; const dfDocSigners: ArrayOfDFDocSigner); overload; stdcall;

    function  getObject(const anObjectCode: Integer): ENActIncomeTechConditions; stdcall;
    function  getList: ENActIncomeTechConditionsShortList; stdcall;
    function  getFilteredList(const aENActIncomeTechConditionsFilter: ENActIncomeTechConditionsFilter): ENActIncomeTechConditionsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTechConditionsShortList; stdcall;
    function  getScrollableFilteredList(const aENActIncomeTechConditionsFilter: ENActIncomeTechConditionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTechConditionsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeTechConditionsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENActIncomeTechConditionsFilter: ENActIncomeTechConditionsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomeTechConditionsShort; stdcall;
   
    procedure closeTech(const anObjectCode: Integer); stdcall;
    procedure unCloseTech(const anObjectCode: Integer); stdcall;
    procedure signaturedTech(const anObjectCode: Integer); stdcall;
    procedure unSignaturedTech(const anObjectCode: Integer); stdcall;


  end; 


implementation

  destructor ENActIncomeTechConditions.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaVat) then
      summaVat.Free;
    if Assigned(FtechCondServicesRef) then
      techCondServicesRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENActIncomeTechConditionsFilter.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaVat) then
      summaVat.Free;
    if Assigned(FtechCondServicesRef) then
      techCondServicesRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENActIncomeTechConditionsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENActIncomeTechConditionsShort.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaVat) then
      summaVat.Free;
    if Assigned(FtechCondServicesRefContractDate) then
      techCondServicesRefContractDate.Free;
    if Assigned(FtechCondServicesRefFinContractDate) then
      techCondServicesRefFinContractDate.Free;
    if Assigned(FtechCondServicesRefTySummaGen) then
      techCondServicesRefTySummaGen.Free;
    if Assigned(FtechCondServicesRefTySummaVat) then
      techCondServicesRefTySummaVat.Free;
    if Assigned(FtechCondServicesRefTyServicesSumma) then
      techCondServicesRefTyServicesSumma.Free;
    if Assigned(FtechCondServicesRefTyServicesPower) then
      techCondServicesRefTyServicesPower.Free;
    if Assigned(FtechCondServicesRefDateEdit) then
      techCondServicesRefDateEdit.Free;
    if Assigned(FtechCondServicesRefWarrantDate) then
      techCondServicesRefWarrantDate.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    inherited Destroy;
  end; 
  
  destructor ENActIncomeTechConditionsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomeTechConditions, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTechConditions');
  RemClassRegistry.RegisterXSClass(ENActIncomeTechConditionsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTechConditionsRef');
  RemClassRegistry.RegisterXSClass(ENActIncomeTechConditionsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTechConditionsFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomeTechConditionsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTechConditionsShort');
  RemClassRegistry.RegisterXSClass(ENActIncomeTechConditionsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeTechConditionsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomeTechConditionsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomeTechConditionsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomeTechConditionsControllerSoapPort), 'http://ksoe.org/ENActIncomeTechConditionsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomeTechConditionsControllerSoapPort), 'http://ksoe.org/ENActIncomeTechConditionsController/action/ENActIncomeTechConditionsController.%operationName%');


end.
