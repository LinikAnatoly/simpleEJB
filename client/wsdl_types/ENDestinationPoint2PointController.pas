unit ENDestinationPoint2PointController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENElementController
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

  ENDestinationPoint2Point            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationPoint2PointRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDestinationPoint2Point = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef;

  end;
  
{
  ENDestinationPoint2PointFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fdistance : TXSDecimal;
//???
    FelementInRef : ENElementRef;
//???
    FelementOutRef : ENElementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property elementInRef : ENElementRef read FelementInRef write FelementInRef; 
    property elementOutRef : ENElementRef read FelementOutRef write FelementOutRef; 
  end;
}

  ENDestinationPoint2PointFilter = class(ENDestinationPoint2Point)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENDestinationPoint2PointShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fdistance : TXSDecimal;
    FelementInRefCode : Integer; 
    FelementOutRefCode : Integer;
    Felin_name : String;
    Felin_type : String;
    Felin_ren : String;
    Felout_name : String;
    Felout_type : String;
    Felout_ren : String;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property distance : TXSDecimal read Fdistance write Fdistance; 

    property elementInRefCode : Integer read FelementInRefCode write FelementInRefCode; 
    property elementOutRefCode : Integer read FelementOutRefCode write FelementOutRefCode;
    property elin_name : String read Felin_name write Felin_name;
    property elin_type : String read Felin_type write Felin_type;
    property elin_ren : String read Felin_ren write Felin_ren;
    property elout_name : String read Felout_name write Felout_name;
    property elout_type : String read Felout_type write Felout_type;
    property elout_ren : String read Felout_ren write Felout_ren;

  end;

  ArrayOfENDestinationPoint2PointShort = array of ENDestinationPoint2PointShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDestinationPoint2PointShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDestinationPoint2PointShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDestinationPoint2PointShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDestinationPoint2PointController/message/
  // soapAction: http://ksoe.org/ENDestinationPoint2PointController/action/ENDestinationPoint2PointController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDestinationPoint2PointControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDestinationPoint2PointController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDestinationPoint2PointControllerSoapPort = interface(IInvokable)
  ['{ed3fed3f-ed3f-ed3f-ed3f-ed3fed3fed3f}']
    function  add(const aENDestinationPoint2Point: ENDestinationPoint2Point): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDestinationPoint2Point: ENDestinationPoint2Point); stdcall;
    function  getObject(const anObjectCode: Integer): ENDestinationPoint2Point; stdcall;
    function  getList: ENDestinationPoint2PointShortList; stdcall;
    function  getFilteredList(const aENDestinationPoint2PointFilter: ENDestinationPoint2PointFilter): ENDestinationPoint2PointShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPoint2PointShortList; stdcall;
    function  getScrollableFilteredList(const aENDestinationPoint2PointFilter: ENDestinationPoint2PointFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPoint2PointShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDestinationPoint2PointShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENDestinationPoint2PointFilter: ENDestinationPoint2PointFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENDestinationPoint2Point.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENDestinationPoint2PointFilter.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(FelementInRef) then
      elementInRef.Free;
    if Assigned(FelementOutRef) then
      elementOutRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENDestinationPoint2PointFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENDestinationPoint2PointShort.Destroy;
  begin
    if Assigned(Fdistance) then
      distance.Free;
    inherited Destroy;
  end; 
  
  destructor ENDestinationPoint2PointShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDestinationPoint2Point, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint2Point');
  RemClassRegistry.RegisterXSClass(ENDestinationPoint2PointRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint2PointRef');
  RemClassRegistry.RegisterXSClass(ENDestinationPoint2PointFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint2PointFilter');
  RemClassRegistry.RegisterXSClass(ENDestinationPoint2PointShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint2PointShort');
  RemClassRegistry.RegisterXSClass(ENDestinationPoint2PointShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDestinationPoint2PointShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDestinationPoint2PointShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDestinationPoint2PointShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDestinationPoint2PointControllerSoapPort), 'http://ksoe.org/ENDestinationPoint2PointController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDestinationPoint2PointControllerSoapPort), 'http://ksoe.org/ENDestinationPoint2PointController/action/ENDestinationPoint2PointController.%operationName%');


end.
