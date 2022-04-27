unit ENDistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDistanceTypeController 
   ,ENRoadTypeController 
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

  ENDistance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDistance = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FcommentGen : WideString;

    Fmodify_time : Int64;
//???
    FtypeRef : ENDistanceTypeRef;
//???
    FroadType : ENRoadType;
//???
    FtransportItemRef : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property commentGen : WideString read FcommentGen write FcommentGen;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENDistanceTypeRef read FtypeRef write FtypeRef; 
    property roadType : ENRoadType read FroadType write FroadType; 
    property transportItemRef : ENTransportItemRef read FtransportItemRef write FtransportItemRef; 
  end;

  ENDistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FcommentGen : WideString;

    Fmodify_time : Int64;
//???
    FtypeRef : ENDistanceTypeRef;
//???
    FroadType : ENRoadType;
//???
    FtransportItemRef : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property commentGen : WideString read FcommentGen write FcommentGen;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property typeRef : ENDistanceTypeRef read FtypeRef write FtypeRef; 
    property roadType : ENRoadType read FroadType write FroadType; 
    property transportItemRef : ENTransportItemRef read FtransportItemRef write FtransportItemRef; 
  end;


  ENDistanceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
    FroadTypeCode : Integer; 
    FroadTypeName : WideString;
    FtransportItemRefCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
    property roadTypeCode : Integer read FroadTypeCode write FroadTypeCode; 
    property roadTypeName : WideString read FroadTypeName write FroadTypeName; 
    property transportItemRefCode : Integer read FtransportItemRefCode write FtransportItemRefCode; //ENTransportItemRef read FtransportItemRefCode write FtransportItemRefCode; 
  end;

  ArrayOfENDistanceShort = array of ENDistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDistanceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDistanceController/message/
  // soapAction: http://ksoe.org/ENDistanceController/action/ENDistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDistanceControllerSoapPort = interface(IInvokable)
  ['{F66853CF-57B7-49F2-A514-399FC5B7411B}']
    function  add(const aENDistance: ENDistance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDistance: ENDistance); stdcall;
    function  getObject(const anObjectCode: Integer): ENDistance; stdcall;
    function  getList: ENDistanceShortList; stdcall;
    function  getFilteredList(const aENDistanceFilter: ENDistanceFilter): ENDistanceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDistanceShortList; stdcall;
    function  getScrollableFilteredList(const aENDistanceFilter: ENDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDistanceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDistanceShortList; stdcall;
  end; 


implementation

  destructor ENDistance.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FroadType) then
      roadType.Free;
    if Assigned(FtransportItemRef) then
      transportItemRef.Free;
    inherited Destroy;
  end;
  
  destructor ENDistanceFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FroadType) then
      roadType.Free;
    if Assigned(FtransportItemRef) then
      transportItemRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENDistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDistance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistance');
  RemClassRegistry.RegisterXSClass(ENDistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceRef');
  RemClassRegistry.RegisterXSClass(ENDistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceFilter');
  RemClassRegistry.RegisterXSClass(ENDistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceShort');
  RemClassRegistry.RegisterXSClass(ENDistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDistanceControllerSoapPort), 'http://ksoe.org/ENDistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDistanceControllerSoapPort), 'http://ksoe.org/ENDistanceController/action/ENDistanceController.%operationName%');


end.
