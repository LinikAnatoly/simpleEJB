unit ENAccumulatorsHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENAccumulatorsController 
   ,TKTransportRealController 
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

  ENAccumulatorsHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorsHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorsHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fdistance : TXSDecimal;
    FreplacementReason : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FaccumulatorsRef : ENAccumulatorsRef;
//???
    FtransportRealRef : TKTransportRealRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property replacementReason : WideString read FreplacementReason write FreplacementReason;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property accumulatorsRef : ENAccumulatorsRef read FaccumulatorsRef write FaccumulatorsRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
  end;
  
{
  ENAccumulatorsHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinstallDate : TXSDate;
    FuninstallDate : TXSDate;
    Fdistance : TXSDecimal;
    FreplacementReason : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FaccumulatorsRef : ENAccumulatorsRef;
//???
    FtransportRealRef : TKTransportRealRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property replacementReason : WideString read FreplacementReason write FreplacementReason;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property accumulatorsRef : ENAccumulatorsRef read FaccumulatorsRef write FaccumulatorsRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
  end;
}

  ENAccumulatorsHistoryFilter = class(ENAccumulatorsHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAccumulatorsHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinstallDate : TXSDate;	
    FuninstallDate : TXSDate;	
    Fdistance : TXSDecimal;
    FreplacementReason : WideString;
    FaccumulatorsRefCode : Integer; 
    FaccumulatorsRefName : WideString;
    FaccumulatorsRefTypeName : WideString;
    FaccumulatorsRefFactory : WideString;
    FaccumulatorsRefGarageNumber : WideString;
    FaccumulatorsRefYearProduction : WideString;
    FaccumulatorsRefSerialNumber : WideString;
    FaccumulatorsRefReceiptDate : TXSDate;
    FaccumulatorsRefMileage : TXSDecimal;
    FaccumulatorsRefMileageAll : TXSDecimal;
    FaccumulatorsRefPotencial : TXSDecimal;
    FtransportRealRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property installDate : TXSDate read FinstallDate write FinstallDate;
    property uninstallDate : TXSDate read FuninstallDate write FuninstallDate;
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property replacementReason : WideString read FreplacementReason write FreplacementReason;

    property accumulatorsRefCode : Integer read FaccumulatorsRefCode write FaccumulatorsRefCode; 
    property accumulatorsRefName : WideString read FaccumulatorsRefName write FaccumulatorsRefName; 
    property accumulatorsRefTypeName : WideString read FaccumulatorsRefTypeName write FaccumulatorsRefTypeName; 
    property accumulatorsRefFactory : WideString read FaccumulatorsRefFactory write FaccumulatorsRefFactory; 
    property accumulatorsRefGarageNumber : WideString read FaccumulatorsRefGarageNumber write FaccumulatorsRefGarageNumber; 
    property accumulatorsRefYearProduction : WideString read FaccumulatorsRefYearProduction write FaccumulatorsRefYearProduction; 
    property accumulatorsRefSerialNumber : WideString read FaccumulatorsRefSerialNumber write FaccumulatorsRefSerialNumber; 
    property accumulatorsRefReceiptDate : TXSDate read FaccumulatorsRefReceiptDate write FaccumulatorsRefReceiptDate; 
    property accumulatorsRefMileage : TXSDecimal read FaccumulatorsRefMileage write FaccumulatorsRefMileage; 
    property accumulatorsRefMileageAll : TXSDecimal read FaccumulatorsRefMileageAll write FaccumulatorsRefMileageAll; 
    property accumulatorsRefPotencial : TXSDecimal read FaccumulatorsRefPotencial write FaccumulatorsRefPotencial; 
    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode; //TKTransportRealRef read FtransportRealRefCode write FtransportRealRefCode; 
  end;

  ArrayOfENAccumulatorsHistoryShort = array of ENAccumulatorsHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAccumulatorsHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAccumulatorsHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAccumulatorsHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAccumulatorsHistoryController/message/
  // soapAction: http://ksoe.org/ENAccumulatorsHistoryController/action/ENAccumulatorsHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAccumulatorsHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAccumulatorsHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAccumulatorsHistoryControllerSoapPort = interface(IInvokable)
  ['{15a015a0-15a0-15a0-15a0-15a015a015a0}']
    function  add(const aENAccumulatorsHistory: ENAccumulatorsHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAccumulatorsHistory: ENAccumulatorsHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENAccumulatorsHistory; stdcall;
    function  getList: ENAccumulatorsHistoryShortList; stdcall;
    function  getFilteredList(const aENAccumulatorsHistoryFilter: ENAccumulatorsHistoryFilter): ENAccumulatorsHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENAccumulatorsHistoryFilter: ENAccumulatorsHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsHistoryShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAccumulatorsHistoryFilter: ENAccumulatorsHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAccumulatorsHistory.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FaccumulatorsRef) then
      accumulatorsRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAccumulatorsHistoryFilter.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FaccumulatorsRef) then
      accumulatorsRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAccumulatorsHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAccumulatorsHistoryShort.Destroy;
  begin
    if Assigned(FinstallDate) then
      installDate.Free;
    if Assigned(FuninstallDate) then
      uninstallDate.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FaccumulatorsRefReceiptDate) then
      accumulatorsRefReceiptDate.Free;
    if Assigned(FaccumulatorsRefMileage) then
      accumulatorsRefMileage.Free;
    if Assigned(FaccumulatorsRefMileageAll) then
      accumulatorsRefMileageAll.Free;
    if Assigned(FaccumulatorsRefPotencial) then
      accumulatorsRefPotencial.Free;
    inherited Destroy;
  end; 
  
  destructor ENAccumulatorsHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAccumulatorsHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsHistory');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsHistoryRef');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsHistoryShort');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAccumulatorsHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAccumulatorsHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAccumulatorsHistoryControllerSoapPort), 'http://ksoe.org/ENAccumulatorsHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAccumulatorsHistoryControllerSoapPort), 'http://ksoe.org/ENAccumulatorsHistoryController/action/ENAccumulatorsHistoryController.%operationName%');


end.
