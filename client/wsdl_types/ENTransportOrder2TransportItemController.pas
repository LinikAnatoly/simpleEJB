unit ENTransportOrder2TransportItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportOrderController 
   ,ENTransportItemController 
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

  ENTransportOrder2TransportItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrder2TransportItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrder2TransportItem = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtransportOrder : ENTransportOrderRef;
//???
    FtransportItem : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property transportOrder : ENTransportOrderRef read FtransportOrder write FtransportOrder; 
    property transportItem : ENTransportItemRef read FtransportItem write FtransportItem; 
  end;
  
{
  ENTransportOrder2TransportItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtransportOrder : ENTransportOrderRef;
//???
    FtransportItem : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property transportOrder : ENTransportOrderRef read FtransportOrder write FtransportOrder; 
    property transportItem : ENTransportItemRef read FtransportItem write FtransportItem; 
  end;
}

  ENTransportOrder2TransportItemFilter = class(ENTransportOrder2TransportItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportOrder2TransportItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtransportOrderCode : Integer; 
    FtransportOrderTimeStart : TXSDateTime;	
    FtransportOrderTimeFinal : TXSDateTime;	
    FtransportOrderDateStart : TXSDateTime;	
    FtransportOrderDateFinal : TXSDateTime;	
    FtransportOrderDateEdit : TXSDateTime;	
    FtransportOrderUserGen : WideString;
    FtransportItemCode : Integer; 
    FtransportItemCountWorkGen : TXSDecimal;
    FtransportItemCountWorkFact : TXSDecimal;
    FtransportItemPrice : TXSDecimal;
    FtransportItemCost : TXSDecimal;
    FtransportItemUserGen : WideString;
    FtransportItemDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property transportOrderCode : Integer read FtransportOrderCode write FtransportOrderCode; 
    property transportOrderTimeStart : TXSDateTime read FtransportOrderTimeStart write FtransportOrderTimeStart; 
    property transportOrderTimeFinal : TXSDateTime read FtransportOrderTimeFinal write FtransportOrderTimeFinal; 
    property transportOrderDateStart : TXSDateTime read FtransportOrderDateStart write FtransportOrderDateStart; 
    property transportOrderDateFinal : TXSDateTime read FtransportOrderDateFinal write FtransportOrderDateFinal; 
    property transportOrderDateEdit : TXSDateTime read FtransportOrderDateEdit write FtransportOrderDateEdit; 
    property transportOrderUserGen : WideString read FtransportOrderUserGen write FtransportOrderUserGen; 
    property transportItemCode : Integer read FtransportItemCode write FtransportItemCode; 
    property transportItemCountWorkGen : TXSDecimal read FtransportItemCountWorkGen write FtransportItemCountWorkGen; 
    property transportItemCountWorkFact : TXSDecimal read FtransportItemCountWorkFact write FtransportItemCountWorkFact; 
    property transportItemPrice : TXSDecimal read FtransportItemPrice write FtransportItemPrice; 
    property transportItemCost : TXSDecimal read FtransportItemCost write FtransportItemCost; 
    property transportItemUserGen : WideString read FtransportItemUserGen write FtransportItemUserGen; 
    property transportItemDateEdit : TXSDate read FtransportItemDateEdit write FtransportItemDateEdit; 
  end;

  ArrayOfENTransportOrder2TransportItemShort = array of ENTransportOrder2TransportItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportOrder2TransportItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportOrder2TransportItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportOrder2TransportItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportOrder2TransportItemController/message/
  // soapAction: http://ksoe.org/ENTransportOrder2TransportItemController/action/ENTransportOrder2TransportItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportOrder2TransportItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportOrder2TransportItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportOrder2TransportItemControllerSoapPort = interface(IInvokable)
  ['{71d771d7-71d7-71d7-71d7-71d771d771d7}']
    function  add(const aENTransportOrder2TransportItem: ENTransportOrder2TransportItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportOrder2TransportItem: ENTransportOrder2TransportItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportOrder2TransportItem; stdcall;
    function  getList: ENTransportOrder2TransportItemShortList; stdcall;
    function  getFilteredList(const aENTransportOrder2TransportItemFilter: ENTransportOrder2TransportItemFilter): ENTransportOrder2TransportItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TransportItemShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportOrder2TransportItemFilter: ENTransportOrder2TransportItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TransportItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TransportItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportOrder2TransportItemFilter: ENTransportOrder2TransportItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportOrder2TransportItem.Destroy;
  begin
    if Assigned(FtransportOrder) then
      transportOrder.Free;
    if Assigned(FtransportItem) then
      transportItem.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportOrder2TransportItemFilter.Destroy;
  begin
    if Assigned(FtransportOrder) then
      transportOrder.Free;
    if Assigned(FtransportItem) then
      transportItem.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportOrder2TransportItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportOrder2TransportItemShort.Destroy;
  begin
    if Assigned(FtransportOrderTimeStart) then
      transportOrderTimeStart.Free;
    if Assigned(FtransportOrderTimeFinal) then
      transportOrderTimeFinal.Free;
    if Assigned(FtransportOrderDateStart) then
      transportOrderDateStart.Free;
    if Assigned(FtransportOrderDateFinal) then
      transportOrderDateFinal.Free;
    if Assigned(FtransportOrderDateEdit) then
      transportOrderDateEdit.Free;
    if Assigned(FtransportItemCountWorkGen) then
      transportItemCountWorkGen.Free;
    if Assigned(FtransportItemCountWorkFact) then
      transportItemCountWorkFact.Free;
    if Assigned(FtransportItemPrice) then
      transportItemPrice.Free;
    if Assigned(FtransportItemCost) then
      transportItemCost.Free;
    if Assigned(FtransportItemDateEdit) then
      transportItemDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportOrder2TransportItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportOrder2TransportItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TransportItem');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TransportItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TransportItemRef');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TransportItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TransportItemFilter');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TransportItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TransportItemShort');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TransportItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TransportItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportOrder2TransportItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportOrder2TransportItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportOrder2TransportItemControllerSoapPort), 'http://ksoe.org/ENTransportOrder2TransportItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportOrder2TransportItemControllerSoapPort), 'http://ksoe.org/ENTransportOrder2TransportItemController/action/ENTransportOrder2TransportItemController.%operationName%');


end.
