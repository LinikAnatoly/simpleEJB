unit FINChargeHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,FINChargeTypeController 
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

  FINChargeHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINChargeHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINChargeHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FchargePercent : TXSDecimal;
    Fdategen : TXSDate;
//???
    FchargeRef : FINChargeTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent; 
    property dategen : TXSDate read Fdategen write Fdategen;
    property chargeRef : FINChargeTypeRef read FchargeRef write FchargeRef; 
  end;
  
{
  FINChargeHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FchargePercent : TXSDecimal;
    Fdategen : TXSDate;
//???
    FchargeRef : FINChargeTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent; 
    property dategen : TXSDate read Fdategen write Fdategen;
    property chargeRef : FINChargeTypeRef read FchargeRef write FchargeRef; 
  end;
}

  FINChargeHistoryFilter = class(FINChargeHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  FINChargeHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FchargePercent : TXSDecimal;
    Fdategen : TXSDate;	
    FchargeRefCode : Integer; 
    FchargeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property chargePercent : TXSDecimal read FchargePercent write FchargePercent; 
    property dategen : TXSDate read Fdategen write Fdategen;

    property chargeRefCode : Integer read FchargeRefCode write FchargeRefCode; 
    property chargeRefName : WideString read FchargeRefName write FchargeRefName; 
  end;

  ArrayOfFINChargeHistoryShort = array of FINChargeHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINChargeHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINChargeHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINChargeHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINChargeHistoryController/message/
  // soapAction: http://ksoe.org/FINChargeHistoryController/action/FINChargeHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINChargeHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINChargeHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINChargeHistoryControllerSoapPort = interface(IInvokable)
  ['{13421342-1342-1342-1342-134213421342}']
    function  add(const aFINChargeHistory: FINChargeHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINChargeHistory: FINChargeHistory); stdcall;
    function  getObject(const anObjectCode: Integer): FINChargeHistory; stdcall;
    function  getList: FINChargeHistoryShortList; stdcall;
    function  getFilteredList(const aFINChargeHistoryFilter: FINChargeHistoryFilter): FINChargeHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINChargeHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aFINChargeHistoryFilter: FINChargeHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): FINChargeHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINChargeHistoryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aFINChargeHistoryFilter: FINChargeHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor FINChargeHistory.Destroy;
  begin
    if Assigned(FchargePercent) then
      chargePercent.Free;
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FchargeRef) then
      chargeRef.Free;
    inherited Destroy;
  end;

{  
  destructor FINChargeHistoryFilter.Destroy;
  begin
    if Assigned(FchargePercent) then
      chargePercent.Free;
    if Assigned(Fdategen) then
      dategen.Free;
    if Assigned(FchargeRef) then
      chargeRef.Free;
    inherited Destroy;
  end; 
}

  destructor FINChargeHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor FINChargeHistoryShort.Destroy;
  begin
    if Assigned(FchargePercent) then
      chargePercent.Free;
    if Assigned(Fdategen) then
      dategen.Free;
    inherited Destroy;
  end; 
  
  destructor FINChargeHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINChargeHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeHistory');
  RemClassRegistry.RegisterXSClass(FINChargeHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeHistoryRef');
  RemClassRegistry.RegisterXSClass(FINChargeHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeHistoryFilter');
  RemClassRegistry.RegisterXSClass(FINChargeHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeHistoryShort');
  RemClassRegistry.RegisterXSClass(FINChargeHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINChargeHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINChargeHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(FINChargeHistoryControllerSoapPort), 'http://ksoe.org/FINChargeHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINChargeHistoryControllerSoapPort), 'http://ksoe.org/FINChargeHistoryController/action/FINChargeHistoryController.%operationName%');


end.
