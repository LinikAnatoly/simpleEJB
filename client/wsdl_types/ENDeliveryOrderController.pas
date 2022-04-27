unit ENDeliveryOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportItemController 
   //,ENTransportItemController 
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

  ENDeliveryOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDeliveryOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FtransportInRef : ENTransportItemRef;
//???
    FtransportOut : ENTransportItem;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportInRef : ENTransportItemRef read FtransportInRef write FtransportInRef; 
    property transportOut : ENTransportItem read FtransportOut write FtransportOut; 
  end;

  ENDeliveryOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FtransportInRef : ENTransportItemRef;
//???
    FtransportOut : ENTransportItem;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportInRef : ENTransportItemRef read FtransportInRef write FtransportInRef; 
    property transportOut : ENTransportItem read FtransportOut write FtransportOut; 
  end;


  ENDeliveryOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtransportInRefCode : Integer; 
    FtransportOutCode : Integer;
    FoutGosNomer : WideString;
    FoutName : WideString;
    FoutDriverName : WideString;
    FoutObject : WideString;
    FoutInvNumber : WideString;
    FoutDistance : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property transportInRefCode : Integer read FtransportInRefCode write FtransportInRefCode; //ENTransportItemRef read FtransportInRefCode write FtransportInRefCode;
    property transportOutCode : Integer read FtransportOutCode write FtransportOutCode; //ENTransportItemRef read FtransportOutCode write FtransportOutCode;
    property outGosNomer: WideString read FoutGosNomer write FoutGosNomer;
    property outName: WideString read FoutName write FoutName;
    property outDriverName: WideString read FoutDriverName write FoutDriverName;
    property outObject: WideString read FoutObject write FoutObject;
    property outInvNumber: WideString read FoutInvNumber write FoutInvNumber;
    property outDistance: TXSDecimal read FoutDistance write FoutDistance;
  end;

  ArrayOfENDeliveryOrderShort = array of ENDeliveryOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDeliveryOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDeliveryOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDeliveryOrderShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDeliveryOrderController/message/
  // soapAction: http://ksoe.org/ENDeliveryOrderController/action/ENDeliveryOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDeliveryOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDeliveryOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDeliveryOrderControllerSoapPort = interface(IInvokable)
  ['{f2f5f2f5-f2f5-f2f5-f2f5-f2f5f2f5f2f5}']
    function  add(const aENDeliveryOrder: ENDeliveryOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDeliveryOrder: ENDeliveryOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENDeliveryOrder; stdcall;
    function  getList: ENDeliveryOrderShortList; stdcall;
    function  getFilteredList(const aENDeliveryOrderFilter: ENDeliveryOrderFilter): ENDeliveryOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENDeliveryOrderFilter: ENDeliveryOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDeliveryOrderShortList; stdcall;
  end; 


implementation

  destructor ENDeliveryOrder.Destroy;
  begin
    if Assigned(FtransportInRef) then
      transportInRef.Free;
    if Assigned(FtransportOut) then
      transportOut.Free;
    inherited Destroy;
  end;
  
  destructor ENDeliveryOrderFilter.Destroy;
  begin
    if Assigned(FtransportInRef) then
      transportInRef.Free;
    if Assigned(FtransportOut) then
      transportOut.Free;
    inherited Destroy;
  end;
  
  destructor ENDeliveryOrderShort.Destroy;
  begin
    if Assigned(FoutDistance) then
      outDistance.Free;
    inherited Destroy;
  end;

  destructor ENDeliveryOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDeliveryOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryOrder');
  RemClassRegistry.RegisterXSClass(ENDeliveryOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryOrderRef');
  RemClassRegistry.RegisterXSClass(ENDeliveryOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryOrderFilter');
  RemClassRegistry.RegisterXSClass(ENDeliveryOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryOrderShort');
  RemClassRegistry.RegisterXSClass(ENDeliveryOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDeliveryOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDeliveryOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDeliveryOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDeliveryOrderControllerSoapPort), 'http://ksoe.org/ENDeliveryOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDeliveryOrderControllerSoapPort), 'http://ksoe.org/ENDeliveryOrderController/action/ENDeliveryOrderController.%operationName%');


end.
