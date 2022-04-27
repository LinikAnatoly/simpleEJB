unit ENActIncome2ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENActIncomeController 
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

  ENActIncome2ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncome2ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncome2ENAct = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FactIncomeRef : ENActIncomeRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property actIncomeRef : ENActIncomeRef read FactIncomeRef write FactIncomeRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
  
{
  ENActIncome2ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FactIncomeRef : ENActIncomeRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property actIncomeRef : ENActIncomeRef read FactIncomeRef write FactIncomeRef; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;
}

  ENActIncome2ENActFilter = class(ENActIncome2ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENActIncome2ENActShort = class(TRemotable)
  private
    Fcode : Integer; 
    FactIncomeRefCode : Integer; 
    FactIncomeRefNumbergen : WideString;
    FactIncomeRefDategen : TXSDate;
    FactIncomeRefContractNumber : WideString;
    FactIncomeRefContractDate : TXSDate;
    FactIncomeRefPartnername : WideString;
    FactIncomeRefPartnerCode : WideString;
    FactIncomeRefFinDocCode : WideString;
    FactIncomeRefFinDocID : Integer; 
    FactRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property actIncomeRefCode : Integer read FactIncomeRefCode write FactIncomeRefCode; 
    property actIncomeRefNumbergen : WideString read FactIncomeRefNumbergen write FactIncomeRefNumbergen; 
    property actIncomeRefDategen : TXSDate read FactIncomeRefDategen write FactIncomeRefDategen; 
    property actIncomeRefContractNumber : WideString read FactIncomeRefContractNumber write FactIncomeRefContractNumber; 
    property actIncomeRefContractDate : TXSDate read FactIncomeRefContractDate write FactIncomeRefContractDate; 
    property actIncomeRefPartnername : WideString read FactIncomeRefPartnername write FactIncomeRefPartnername; 
    property actIncomeRefPartnerCode : WideString read FactIncomeRefPartnerCode write FactIncomeRefPartnerCode; 
    property actIncomeRefFinDocCode : WideString read FactIncomeRefFinDocCode write FactIncomeRefFinDocCode; 
    property actIncomeRefFinDocID : Integer read FactIncomeRefFinDocID write FactIncomeRefFinDocID; 
    property actRefCode : Integer read FactRefCode write FactRefCode; //ENActRef read FactRefCode write FactRefCode; 
  end;

  ArrayOfENActIncome2ENActShort = array of ENActIncome2ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncome2ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncome2ENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncome2ENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncome2ENActController/message/
  // soapAction: http://ksoe.org/ENActIncome2ENActController/action/ENActIncome2ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncome2ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncome2ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncome2ENActControllerSoapPort = interface(IInvokable)
  ['{19781978-1978-1978-1978-197819781978}']
    function  add(const aENActIncome2ENAct: ENActIncome2ENAct): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncome2ENAct: ENActIncome2ENAct); stdcall;
    function  getObject(const anObjectCode: Integer): ENActIncome2ENAct; stdcall;
    function  getList: ENActIncome2ENActShortList; stdcall;
    function  getFilteredList(const aENActIncome2ENActFilter: ENActIncome2ENActFilter): ENActIncome2ENActShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ENActShortList; stdcall;
    function  getScrollableFilteredList(const aENActIncome2ENActFilter: ENActIncome2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ENActShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ENActShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENActIncome2ENActFilter: ENActIncome2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENActIncome2ENAct.Destroy;
  begin
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENActIncome2ENActFilter.Destroy;
  begin
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENActIncome2ENActFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENActIncome2ENActShort.Destroy;
  begin
    if Assigned(FactIncomeRefDategen) then
      actIncomeRefDategen.Free;
    if Assigned(FactIncomeRefContractDate) then
      actIncomeRefContractDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENActIncome2ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncome2ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ENAct');
  RemClassRegistry.RegisterXSClass(ENActIncome2ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ENActRef');
  RemClassRegistry.RegisterXSClass(ENActIncome2ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ENActFilter');
  RemClassRegistry.RegisterXSClass(ENActIncome2ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ENActShort');
  RemClassRegistry.RegisterXSClass(ENActIncome2ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncome2ENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncome2ENActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncome2ENActControllerSoapPort), 'http://ksoe.org/ENActIncome2ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncome2ENActControllerSoapPort), 'http://ksoe.org/ENActIncome2ENActController/action/ENActIncome2ENActController.%operationName%');


end.
