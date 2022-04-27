unit ENEstimateItemStatusHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,ENEstimateItemStatusController 
   ,ENEstimateItem2TypeController 
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

  ENEstimateItemStatusHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemStatusHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemStatusHistory = class(TRemotable)
  private
    Fcode : Integer; 
    FisLast : Integer; 
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FstatusRef : ENEstimateItemStatusRef;
//???
    FtypeRef : ENEstimateItem2TypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  isLast : Integer read FisLast write FisLast; 
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property statusRef : ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
    property typeRef : ENEstimateItem2TypeRef read FtypeRef write FtypeRef; 
  end;
  
{
  ENEstimateItemStatusHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FisLast : Integer; 
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FstatusRef : ENEstimateItemStatusRef;
//???
    FtypeRef : ENEstimateItem2TypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  isLast : Integer read FisLast write FisLast; 
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property statusRef : ENEstimateItemStatusRef read FstatusRef write FstatusRef; 
    property typeRef : ENEstimateItem2TypeRef read FtypeRef write FtypeRef; 
  end;
}

  ENEstimateItemStatusHistoryFilter = class(ENEstimateItemStatusHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENEstimateItemStatusHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    FisLast : Integer; 
    FdateEdit : TXSDateTime;
    FestimateItemRefCode : Integer; 
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefDeliveryTime : Integer; 
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  isLast : Integer read FisLast write FisLast; 
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit; 
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode; 
    property statusRefName : WideString read FstatusRefName write FstatusRefName; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfENEstimateItemStatusHistoryShort = array of ENEstimateItemStatusHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemStatusHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemStatusHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemStatusHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemStatusHistoryController/message/
  // soapAction: http://ksoe.org/ENEstimateItemStatusHistoryController/action/ENEstimateItemStatusHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemStatusHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemStatusHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemStatusHistoryControllerSoapPort = interface(IInvokable)
  ['{1e4e1e4e-1e4e-1e4e-1e4e-1e4e1e4e1e4e}']
    function  add(const aENEstimateItemStatusHistory: ENEstimateItemStatusHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItemStatusHistory: ENEstimateItemStatusHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItemStatusHistory; stdcall;
    function  getList: ENEstimateItemStatusHistoryShortList; stdcall;
    function  getFilteredList(const aENEstimateItemStatusHistoryFilter: ENEstimateItemStatusHistoryFilter): ENEstimateItemStatusHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItemStatusHistoryFilter: ENEstimateItemStatusHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusHistoryShortList; stdcall;
  end; 


implementation

  destructor ENEstimateItemStatusHistory.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENEstimateItemStatusHistoryFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENEstimateItemStatusHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENEstimateItemStatusHistoryShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENEstimateItemStatusHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusHistory');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusHistoryRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusHistoryShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemStatusHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemStatusHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemStatusHistoryControllerSoapPort), 'http://ksoe.org/ENEstimateItemStatusHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemStatusHistoryControllerSoapPort), 'http://ksoe.org/ENEstimateItemStatusHistoryController/action/ENEstimateItemStatusHistoryController.%operationName%');


end.
