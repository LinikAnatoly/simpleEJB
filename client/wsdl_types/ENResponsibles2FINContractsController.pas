unit ENResponsibles2FINContractsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENResponsiblesController 
   ,FINContractsController 
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

  ENResponsibles2FINContracts            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsibles2FINContractsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsibles2FINContracts = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FresponsiblesRef : ENResponsiblesRef;
//???
    FfinContracts : FINContracts;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef; 
    property finContracts : FINContracts read FfinContracts write FfinContracts; 
  end;
  
{
  ENResponsibles2FINContractsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FresponsiblesRef : ENResponsiblesRef;
//???
    FfinContracts : FINContracts;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property responsiblesRef : ENResponsiblesRef read FresponsiblesRef write FresponsiblesRef; 
    property finContracts : FINContracts read FfinContracts write FfinContracts; 
  end;
}

  ENResponsibles2FINContractsFilter = class(ENResponsibles2FINContracts)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENResponsibles2FINContractsShort = class(TRemotable)
  private
    Fcode : Integer; 
    FresponsiblesRefCode : Integer; 
    FresponsiblesRefFIO : WideString;
    FresponsiblesRefTabNumber : Integer; 
    FresponsiblesRefPosition : WideString;
    FresponsiblesRefDepName : WideString;
    FresponsiblesRefDepCode : WideString;
    FresponsiblesRefPhone : WideString;
    FfinContractsCode : Integer; 
    FfinContractsContractNumber : WideString;
    FfinContractsContractDate : TXSDate;
    FfinContractsFinDocCode : WideString;
    FfinContractsFinDocID : Integer;
    FfinContractsOrgCode : Integer;
    FfinContractsOrgName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property responsiblesRefCode : Integer read FresponsiblesRefCode write FresponsiblesRefCode;
    property responsiblesRefFIO : WideString read FresponsiblesRefFIO write FresponsiblesRefFIO;
    property responsiblesRefTabNumber : Integer read FresponsiblesRefTabNumber write FresponsiblesRefTabNumber;
    property responsiblesRefPosition : WideString read FresponsiblesRefPosition write FresponsiblesRefPosition;
    property responsiblesRefDepName : WideString read FresponsiblesRefDepName write FresponsiblesRefDepName;
    property responsiblesRefDepCode : WideString read FresponsiblesRefDepCode write FresponsiblesRefDepCode;
    property responsiblesRefPhone : WideString read FresponsiblesRefPhone write FresponsiblesRefPhone;
    property finContractsCode : Integer read FfinContractsCode write FfinContractsCode;
    property finContractsContractNumber : WideString read FfinContractsContractNumber write FfinContractsContractNumber;
    property finContractsContractDate : TXSDate read FfinContractsContractDate write FfinContractsContractDate;
    property finContractsFinDocCode : WideString read FfinContractsFinDocCode write FfinContractsFinDocCode;
    property finContractsFinDocID : Integer read FfinContractsFinDocID write FfinContractsFinDocID;
    property finContractsOrgCode : Integer read FfinContractsOrgCode write FfinContractsOrgCode;
    property finContractsOrgName : WideString read FfinContractsOrgName write FfinContractsOrgName;
  end;

  ArrayOfENResponsibles2FINContractsShort = array of ENResponsibles2FINContractsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENResponsibles2FINContractsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENResponsibles2FINContractsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENResponsibles2FINContractsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENResponsibles2FINContractsController/message/
  // soapAction: http://ksoe.org/ENResponsibles2FINContractsController/action/ENResponsibles2FINContractsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENResponsibles2FINContractsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENResponsibles2FINContractsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENResponsibles2FINContractsControllerSoapPort = interface(IInvokable)
  ['{7ef17ef1-7ef1-7ef1-7ef1-7ef17ef17ef1}']
    function  add(const aENResponsibles2FINContracts: ENResponsibles2FINContracts): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENResponsibles2FINContracts: ENResponsibles2FINContracts); stdcall;
    function  getObject(const anObjectCode: Integer): ENResponsibles2FINContracts; stdcall;
    function  getList: ENResponsibles2FINContractsShortList; stdcall;
    function  getFilteredList(const aENResponsibles2FINContractsFilter: ENResponsibles2FINContractsFilter): ENResponsibles2FINContractsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENResponsibles2FINContractsShortList; stdcall;
    function  getScrollableFilteredList(const aENResponsibles2FINContractsFilter: ENResponsibles2FINContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENResponsibles2FINContractsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENResponsibles2FINContractsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENResponsibles2FINContractsFilter: ENResponsibles2FINContractsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENResponsibles2FINContracts.Destroy;
  begin
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    if Assigned(FfinContracts) then
      finContracts.Free;
    inherited Destroy;
  end;

{  
  destructor ENResponsibles2FINContractsFilter.Destroy;
  begin
    if Assigned(FresponsiblesRef) then
      responsiblesRef.Free;
    if Assigned(FfinContracts) then
      finContracts.Free;
    inherited Destroy;
  end; 
}

  destructor ENResponsibles2FINContractsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENResponsibles2FINContractsShort.Destroy;
  begin
    if Assigned(FfinContractsContractDate) then
      finContractsContractDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENResponsibles2FINContractsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENResponsibles2FINContracts, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles2FINContracts');
  RemClassRegistry.RegisterXSClass(ENResponsibles2FINContractsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles2FINContractsRef');
  RemClassRegistry.RegisterXSClass(ENResponsibles2FINContractsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles2FINContractsFilter');
  RemClassRegistry.RegisterXSClass(ENResponsibles2FINContractsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles2FINContractsShort');
  RemClassRegistry.RegisterXSClass(ENResponsibles2FINContractsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsibles2FINContractsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENResponsibles2FINContractsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENResponsibles2FINContractsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENResponsibles2FINContractsControllerSoapPort), 'http://ksoe.org/ENResponsibles2FINContractsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENResponsibles2FINContractsControllerSoapPort), 'http://ksoe.org/ENResponsibles2FINContractsController/action/ENResponsibles2FINContractsController.%operationName%');


end.
