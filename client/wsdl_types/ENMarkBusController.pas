unit ENMarkBusController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENMarkBus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMarkBusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMarkBus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbusSection : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property busSection : TXSDecimal read FbusSection write FbusSection; 
  end;
  
{
  ENMarkBusFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbusSection : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property busSection : TXSDecimal read FbusSection write FbusSection; 
  end;
}

  ENMarkBusFilter = class(ENMarkBus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMarkBusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbusSection : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property busSection : TXSDecimal read FbusSection write FbusSection; 

  end;

  ArrayOfENMarkBusShort = array of ENMarkBusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMarkBusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMarkBusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMarkBusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMarkBusController/message/
  // soapAction: http://ksoe.org/ENMarkBusController/action/ENMarkBusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMarkBusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMarkBusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMarkBusControllerSoapPort = interface(IInvokable)
  ['{3b0d3b0d-3b0d-3b0d-3b0d-3b0d3b0d3b0d}']
    function  add(const aENMarkBus: ENMarkBus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMarkBus: ENMarkBus); stdcall;
    function  getObject(const anObjectCode: Integer): ENMarkBus; stdcall;
    function  getList: ENMarkBusShortList; stdcall;
    function  getFilteredList(const aENMarkBusFilter: ENMarkBusFilter): ENMarkBusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMarkBusShortList; stdcall;
    function  getScrollableFilteredList(const aENMarkBusFilter: ENMarkBusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMarkBusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMarkBusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMarkBusFilter: ENMarkBusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENMarkBus.Destroy;
  begin
    if Assigned(FbusSection) then
      busSection.Free;
    inherited Destroy;
  end;

{  
  destructor ENMarkBusFilter.Destroy;
  begin
    if Assigned(FbusSection) then
      busSection.Free;
    inherited Destroy;
  end; 
}

  destructor ENMarkBusFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENMarkBusShort.Destroy;
  begin
    if Assigned(FbusSection) then
      busSection.Free;
    inherited Destroy;
  end; 
  
  destructor ENMarkBusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMarkBus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkBus');
  RemClassRegistry.RegisterXSClass(ENMarkBusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkBusRef');
  RemClassRegistry.RegisterXSClass(ENMarkBusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkBusFilter');
  RemClassRegistry.RegisterXSClass(ENMarkBusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkBusShort');
  RemClassRegistry.RegisterXSClass(ENMarkBusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMarkBusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMarkBusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMarkBusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMarkBusControllerSoapPort), 'http://ksoe.org/ENMarkBusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMarkBusControllerSoapPort), 'http://ksoe.org/ENMarkBusController/action/ENMarkBusController.%operationName%');


end.
