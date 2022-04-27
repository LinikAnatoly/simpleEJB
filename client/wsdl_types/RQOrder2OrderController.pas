unit RQOrder2OrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQOrderController 
   //,RQOrderController 
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

  RQOrder2Order            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2OrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrder2Order = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    ForderIn : RQOrder;
//???
    ForderOut : RQOrder;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property orderIn : RQOrder read ForderIn write ForderIn; 
    property orderOut : RQOrder read ForderOut write ForderOut; 
  end;

  RQOrder2OrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    ForderIn : RQOrder;
//???
    ForderOut : RQOrder;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property orderIn : RQOrder read ForderIn write ForderIn; 
    property orderOut : RQOrder read ForderOut write ForderOut; 
  end;


  RQOrder2OrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    ForderInCode : Integer; 
    ForderInNumberDoc : WideString;
    ForderInNumberProject : WideString;
    ForderInOrderPeriod : TXSDate;
    ForderInDateGen : TXSDate;
    ForderInUserGen : WideString;
    ForderOutCode : Integer; 
    ForderOutNumberDoc : WideString;
    ForderOutNumberProject : WideString;
    ForderOutOrderPeriod : TXSDate;
    ForderOutDateGen : TXSDate;
    ForderOutUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property orderInCode : Integer read ForderInCode write ForderInCode; 
    property orderInNumberDoc : WideString read ForderInNumberDoc write ForderInNumberDoc; 
    property orderInNumberProject : WideString read ForderInNumberProject write ForderInNumberProject; 
    property orderInOrderPeriod : TXSDate read ForderInOrderPeriod write ForderInOrderPeriod; 
    property orderInDateGen : TXSDate read ForderInDateGen write ForderInDateGen; 
    property orderInUserGen : WideString read ForderInUserGen write ForderInUserGen; 
    property orderOutCode : Integer read ForderOutCode write ForderOutCode; 
    property orderOutNumberDoc : WideString read ForderOutNumberDoc write ForderOutNumberDoc; 
    property orderOutNumberProject : WideString read ForderOutNumberProject write ForderOutNumberProject; 
    property orderOutOrderPeriod : TXSDate read ForderOutOrderPeriod write ForderOutOrderPeriod; 
    property orderOutDateGen : TXSDate read ForderOutDateGen write ForderOutDateGen; 
    property orderOutUserGen : WideString read ForderOutUserGen write ForderOutUserGen; 
  end;

  ArrayOfRQOrder2OrderShort = array of RQOrder2OrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrder2OrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrder2OrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrder2OrderShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrder2OrderController/message/
  // soapAction: http://ksoe.org/RQOrder2OrderController/action/RQOrder2OrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrder2OrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrder2OrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrder2OrderControllerSoapPort = interface(IInvokable)
  ['{13e613e6-13e6-13e6-13e6-13e613e613e6}']
    function  add(const aRQOrder2Order: RQOrder2Order): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrder2Order: RQOrder2Order); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrder2Order; stdcall;
    function  getList: RQOrder2OrderShortList; stdcall;
    function  getFilteredList(const aRQOrder2OrderFilter: RQOrder2OrderFilter): RQOrder2OrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrder2OrderFilter: RQOrder2OrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrder2OrderShortList; stdcall;
  end; 


implementation

  destructor RQOrder2Order.Destroy;
  begin
    if Assigned(ForderIn) then
      orderIn.Free;
    if Assigned(ForderOut) then
      orderOut.Free;
    inherited Destroy;
  end;
  
  destructor RQOrder2OrderFilter.Destroy;
  begin
    if Assigned(ForderIn) then
      orderIn.Free;
    if Assigned(ForderOut) then
      orderOut.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2OrderShort.Destroy;
  begin
    if Assigned(ForderInOrderPeriod) then
      orderInOrderPeriod.Free;
    if Assigned(ForderInDateGen) then
      orderInDateGen.Free;
    if Assigned(ForderOutOrderPeriod) then
      orderOutOrderPeriod.Free;
    if Assigned(ForderOutDateGen) then
      orderOutDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrder2OrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrder2Order, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2Order');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderRef');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderFilter');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderShort');
  RemClassRegistry.RegisterXSClass(RQOrder2OrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrder2OrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrder2OrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrder2OrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrder2OrderControllerSoapPort), 'http://ksoe.org/RQOrder2OrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrder2OrderControllerSoapPort), 'http://ksoe.org/RQOrder2OrderController/action/RQOrder2OrderController.%operationName%');


end.
