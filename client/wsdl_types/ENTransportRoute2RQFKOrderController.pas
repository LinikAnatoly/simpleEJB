unit ENTransportRoute2RQFKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderController 
   ,ENTransportRouteController 
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

  ENTransportRoute2RQFKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRoute2RQFKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRoute2RQFKOrder = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
  
{
  ENTransportRoute2RQFKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FtransportRouteRef : ENTransportRouteRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property transportRouteRef : ENTransportRouteRef read FtransportRouteRef write FtransportRouteRef; 
  end;
}

  ENTransportRoute2RQFKOrderFilter = class(ENTransportRoute2RQFKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRoute2RQFKOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefDateShipment : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer; 
    FfkOrderRefDateAdd : TXSDateTime;	
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;	
    FfkOrderRefUserGen : WideString;
    FtransportRouteRefCode : Integer; 
    FtransportRouteRefDistance : TXSDecimal;
    FtransportRouteRefWeight : TXSDecimal;
    FtransportRouteRefDateEdit : TXSDateTime;	
    FtransportRouteRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefDateShipment : TXSDate read FfkOrderRefDateShipment write FfkOrderRefDateShipment; 
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode; 
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName; 
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode; 
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName; 
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode; 
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds; 
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds; 
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent; 
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd; 
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd; 
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
    property transportRouteRefCode : Integer read FtransportRouteRefCode write FtransportRouteRefCode; 
    property transportRouteRefDistance : TXSDecimal read FtransportRouteRefDistance write FtransportRouteRefDistance; 
    property transportRouteRefWeight : TXSDecimal read FtransportRouteRefWeight write FtransportRouteRefWeight; 
    property transportRouteRefDateEdit : TXSDateTime read FtransportRouteRefDateEdit write FtransportRouteRefDateEdit; 
    property transportRouteRefUserGen : WideString read FtransportRouteRefUserGen write FtransportRouteRefUserGen; 
  end;

  ArrayOfENTransportRoute2RQFKOrderShort = array of ENTransportRoute2RQFKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRoute2RQFKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRoute2RQFKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRoute2RQFKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRoute2RQFKOrderController/message/
  // soapAction: http://ksoe.org/ENTransportRoute2RQFKOrderController/action/ENTransportRoute2RQFKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRoute2RQFKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRoute2RQFKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRoute2RQFKOrderControllerSoapPort = interface(IInvokable)
  ['{ef96ef96-ef96-ef96-ef96-ef96ef96ef96}']
    function  add(const aENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRoute2RQFKOrder: ENTransportRoute2RQFKOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportRoute2RQFKOrder; stdcall;
    function  getList: ENTransportRoute2RQFKOrderShortList; stdcall;
    function  getFilteredList(const aENTransportRoute2RQFKOrderFilter: ENTransportRoute2RQFKOrderFilter): ENTransportRoute2RQFKOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQFKOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRoute2RQFKOrderFilter: ENTransportRoute2RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQFKOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRoute2RQFKOrderShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRoute2RQFKOrderFilter: ENTransportRoute2RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportRoute2RQFKOrder.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRoute2RQFKOrderFilter.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FtransportRouteRef) then
      transportRouteRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRoute2RQFKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRoute2RQFKOrderShort.Destroy;
  begin
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefDateShipment) then
      fkOrderRefDateShipment.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    if Assigned(FtransportRouteRefDistance) then
      transportRouteRefDistance.Free;
    if Assigned(FtransportRouteRefWeight) then
      transportRouteRefWeight.Free;
    if Assigned(FtransportRouteRefDateEdit) then
      transportRouteRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportRoute2RQFKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQFKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQFKOrder');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQFKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQFKOrderRef');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQFKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQFKOrderFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQFKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQFKOrderShort');
  RemClassRegistry.RegisterXSClass(ENTransportRoute2RQFKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRoute2RQFKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRoute2RQFKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRoute2RQFKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRoute2RQFKOrderControllerSoapPort), 'http://ksoe.org/ENTransportRoute2RQFKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRoute2RQFKOrderControllerSoapPort), 'http://ksoe.org/ENTransportRoute2RQFKOrderController/action/ENTransportRoute2RQFKOrderController.%operationName%');


end.
