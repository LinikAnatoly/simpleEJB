unit ENActIncomeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActIncomeStatusController
   ,ENGeneralContractsController
   ,FKProvObjectController
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

  ENActIncome            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncome = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fdategen : TXSDate;
    FactDateStart : TXSDate;
    FactDateEnd : TXSDate;
    FcommentGen : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fpartnername : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENActIncomeStatusRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dategen : TXSDate read Fdategen write Fdategen;
    property actDateStart : TXSDate read FactDateStart write FactDateStart;
    property actDateEnd : TXSDate read FactDateEnd write FactDateEnd;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnername : WideString read Fpartnername write Fpartnername;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENActIncomeStatusRef read FstatusRef write FstatusRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;

{
  ENActIncomeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnumbergen : WideString;
    Fdategen : TXSDate;
    FactDateStart : TXSDate;
    FactDateEnd : TXSDate;
    FcommentGen : WideString;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fpartnername : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENActIncomeStatusRef;
//???
    FgeneralContractRef : ENGeneralContractsRef;
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
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnername : WideString read Fpartnername write Fpartnername;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENActIncomeStatusRef read FstatusRef write FstatusRef;
    property generalContractRef : ENGeneralContractsRef read FgeneralContractRef write FgeneralContractRef;
  end;
}

  ENActIncomeFilter = class(ENActIncome)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncomeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnumbergen : WideString;
    Fdategen : TXSDate;
    FactDateStart : TXSDate;
    FactDateEnd : TXSDate;
    FcontractNumber : WideString;
    FcontractDate : TXSDate;
    Fpartnername : WideString;
    FpartnerCode : WideString;
    FfinDocCode : WideString;
    FfinDocID : Integer;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FgeneralContractRefCode : Integer;
    FgeneralContractRefFinDocID : Integer;
    FgeneralContractRefFinDocCode : WideString;
    FgeneralContractRefContractNumber : WideString;
    FgeneralContractRefContractDate : TXSDate;
    FgeneralContractRefCommentGen : WideString;
    FgeneralContractRefPartnerId : Integer;
    FgeneralContractRefPartnerCode : WideString;
    FgeneralContractRefPartnerName : WideString;
    FgeneralContractRefContractRegDate : TXSDate;
    FgeneralContractRefContractStartDate : TXSDate;
    FgeneralContractRefContractEndDate : TXSDate;
    FgeneralContractRefAxContractId : WideString;
    FgeneralContractRefAxContractCode : WideString;
    FgeneralContractRefAxContractNumber : WideString;
    FgeneralContractRefAxContractAccount : WideString;
    FgeneralContractRefAxContractDate : TXSDate;
    FgeneralContractRefAxContractCommentGen : WideString;
    FgeneralContractRefAxContractGroupCode : WideString;
    FgeneralContractRefAxPartnerCode : WideString;
    FgeneralContractRefAxPartnerName : WideString;
    FgeneralContractRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property dategen : TXSDate read Fdategen write Fdategen;
    property actDateStart : TXSDate read FactDateStart write FactDateStart;
    property actDateEnd : TXSDate read FactDateEnd write FactDateEnd;
    property contractNumber : WideString read FcontractNumber write FcontractNumber;
    property contractDate : TXSDate read FcontractDate write FcontractDate;
    property partnername : WideString read Fpartnername write Fpartnername;
    property partnerCode : WideString read FpartnerCode write FpartnerCode;
    property finDocCode : WideString read FfinDocCode write FfinDocCode;
    property  finDocID : Integer read FfinDocID write FfinDocID;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property generalContractRefCode : Integer read FgeneralContractRefCode write FgeneralContractRefCode;
    property generalContractRefFinDocID : Integer read FgeneralContractRefFinDocID write FgeneralContractRefFinDocID;
    property generalContractRefFinDocCode : WideString read FgeneralContractRefFinDocCode write FgeneralContractRefFinDocCode;
    property generalContractRefContractNumber : WideString read FgeneralContractRefContractNumber write FgeneralContractRefContractNumber;
    property generalContractRefContractDate : TXSDate read FgeneralContractRefContractDate write FgeneralContractRefContractDate;
    property generalContractRefCommentGen : WideString read FgeneralContractRefCommentGen write FgeneralContractRefCommentGen;
    property generalContractRefPartnerId : Integer read FgeneralContractRefPartnerId write FgeneralContractRefPartnerId;
    property generalContractRefPartnerCode : WideString read FgeneralContractRefPartnerCode write FgeneralContractRefPartnerCode;
    property generalContractRefPartnerName : WideString read FgeneralContractRefPartnerName write FgeneralContractRefPartnerName;
    property generalContractRefContractRegDate : TXSDate read FgeneralContractRefContractRegDate write FgeneralContractRefContractRegDate;
    property generalContractRefContractStartDate : TXSDate read FgeneralContractRefContractStartDate write FgeneralContractRefContractStartDate;
    property generalContractRefContractEndDate : TXSDate read FgeneralContractRefContractEndDate write FgeneralContractRefContractEndDate;
    property generalContractRefAxContractId : WideString read FgeneralContractRefAxContractId write FgeneralContractRefAxContractId;
    property generalContractRefAxContractCode : WideString read FgeneralContractRefAxContractCode write FgeneralContractRefAxContractCode;
    property generalContractRefAxContractNumber : WideString read FgeneralContractRefAxContractNumber write FgeneralContractRefAxContractNumber;
    property generalContractRefAxContractAccount : WideString read FgeneralContractRefAxContractAccount write FgeneralContractRefAxContractAccount;
    property generalContractRefAxContractDate : TXSDate read FgeneralContractRefAxContractDate write FgeneralContractRefAxContractDate;
    property generalContractRefAxContractCommentGen : WideString read FgeneralContractRefAxContractCommentGen write FgeneralContractRefAxContractCommentGen;
    property generalContractRefAxContractGroupCode : WideString read FgeneralContractRefAxContractGroupCode write FgeneralContractRefAxContractGroupCode;
    property generalContractRefAxPartnerCode : WideString read FgeneralContractRefAxPartnerCode write FgeneralContractRefAxPartnerCode;
    property generalContractRefAxPartnerName : WideString read FgeneralContractRefAxPartnerName write FgeneralContractRefAxPartnerName;
    property generalContractRefUserGen : WideString read FgeneralContractRefUserGen write FgeneralContractRefUserGen;
  end;

  ArrayOfENActIncomeShort = array of ENActIncomeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomeController/message/
  // soapAction: http://ksoe.org/ENActIncomeController/action/ENActIncomeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomeControllerSoapPort = interface(IInvokable)
  ['{E39783BF-44A8-4FDB-A9CF-816F6A139C28}']
    function  add(const aENActIncome: ENActIncome): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncome: ENActIncome); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncome; stdcall;
    function getList: ENActIncomeShortList; stdcall;
    function getFilteredList(const aENActIncomeFilter: ENActIncomeFilter): ENActIncomeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeShortList; stdcall;
    function getScrollableFilteredList(const aENActIncomeFilter: ENActIncomeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncomeFilter: ENActIncomeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomeShort; stdcall;

    function close(const anObjectCode: Integer; const isClient: Integer; const datePosting : TXSDate): FKProvResult; stdcall; overload;
    procedure unClose(const anObjectCode: Integer; const isClient: Integer); stdcall;
    procedure signatured(const anObjectCode: Integer); stdcall;
    procedure unSignatured(const anObjectCode: Integer); stdcall;

    function getPostingsList(const aENActIncomeCode: Integer): FKProvObjectShortList; stdcall;
  end;


implementation

  destructor ENActIncome.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActIncomeFilter.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FgeneralContractRef) then
      generalContractRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActIncomeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActIncomeShort.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FactDateStart) then
      actDateStart.Free;
    if Assigned(FactDateEnd) then
      actDateEnd.Free;
    if Assigned(FcontractDate) then
      contractDate.Free;
    if Assigned(FgeneralContractRefContractDate) then
      generalContractRefContractDate.Free;
    if Assigned(FgeneralContractRefContractRegDate) then
      generalContractRefContractRegDate.Free;
    if Assigned(FgeneralContractRefContractStartDate) then
      generalContractRefContractStartDate.Free;
    if Assigned(FgeneralContractRefContractEndDate) then
      generalContractRefContractEndDate.Free;
    if Assigned(FgeneralContractRefAxContractDate) then
      generalContractRefAxContractDate.Free;
    inherited Destroy;
  end;

  destructor ENActIncomeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncome, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome');
  RemClassRegistry.RegisterXSClass(ENActIncomeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeRef');
  RemClassRegistry.RegisterXSClass(ENActIncomeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeShort');
  RemClassRegistry.RegisterXSClass(ENActIncomeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomeControllerSoapPort), 'http://ksoe.org/ENActIncomeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomeControllerSoapPort), 'http://ksoe.org/ENActIncomeController/action/ENActIncomeController.%operationName%');


end.
