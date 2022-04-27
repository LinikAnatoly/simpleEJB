unit ENSITFeatureHistoryController;

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

  ENSITFeatureHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeatureHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeatureHistory = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fnewvalue : WideString;
    Foldvalue : WideString;
    Fdategen : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property newvalue : WideString read Fnewvalue write Fnewvalue;
    property oldvalue : WideString read Foldvalue write Foldvalue;
    property dategen : TXSDate read Fdategen write Fdategen;
  end;

  ENSITFeatureHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fnewvalue : WideString;
    Foldvalue : WideString;
    Fdategen : TXSDate;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property newvalue : WideString read Fnewvalue write Fnewvalue;
    property oldvalue : WideString read Foldvalue write Foldvalue;
    property dategen : TXSDate read Fdategen write Fdategen;
  end;


  ENSITFeatureHistoryShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fnewvalue : WideString;
    Foldvalue : WideString;
    Fdategen : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property newvalue : WideString read Fnewvalue write Fnewvalue;
    property oldvalue : WideString read Foldvalue write Foldvalue;
    property dategen : TXSDate read Fdategen write Fdategen;

  end;

  ArrayOfENSITFeatureHistoryShort = array of ENSITFeatureHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITFeatureHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITFeatureHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITFeatureHistoryShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITFeatureHistoryController/message/
  // soapAction: http://ksoe.org/ENSITFeatureHistoryController/action/ENSITFeatureHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITFeatureHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITFeatureHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITFeatureHistoryControllerSoapPort = interface(IInvokable)
  ['{13d913d9-13d9-13d9-13d9-13d913d913d9}']
    function  add(const aENSITFeatureHistory: ENSITFeatureHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITFeatureHistory: ENSITFeatureHistory); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITFeatureHistory; stdcall;
    function  getList: ENSITFeatureHistoryShortList; stdcall;
    function  getFilteredList(const aENSITFeatureHistoryFilter: ENSITFeatureHistoryFilter): ENSITFeatureHistoryShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureHistoryShortList; stdcall;
    function  getScrollableFilteredList(const aENSITFeatureHistoryFilter: ENSITFeatureHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureHistoryShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureHistoryShortList; stdcall;
  end; 


implementation

  destructor ENSITFeatureHistory.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    inherited Destroy;
  end;
  
  destructor ENSITFeatureHistoryFilter.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureHistoryShort.Destroy;
  begin
    if Assigned(Fdategen) then
      dategen.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITFeatureHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureHistory');
  RemClassRegistry.RegisterXSClass(ENSITFeatureHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureHistoryRef');
  RemClassRegistry.RegisterXSClass(ENSITFeatureHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENSITFeatureHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureHistoryShort');
  RemClassRegistry.RegisterXSClass(ENSITFeatureHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITFeatureHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITFeatureHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITFeatureHistoryControllerSoapPort), 'http://ksoe.org/ENSITFeatureHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITFeatureHistoryControllerSoapPort), 'http://ksoe.org/ENSITFeatureHistoryController/action/ENSITFeatureHistoryController.%operationName%');


end.
