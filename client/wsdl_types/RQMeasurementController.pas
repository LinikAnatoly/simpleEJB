unit RQMeasurementController;

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

  RQMeasurement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMeasurementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMeasurement = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    FoutCode : Integer; 
    Fmodify_time : Int64;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property  outCode : Integer read FoutCode write FoutCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;

  RQMeasurementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    FoutCode : Integer; 
    Fmodify_time : Int64;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property  outCode : Integer read FoutCode write FoutCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;


  RQMeasurementShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    FoutCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property  outCode : Integer read FoutCode write FoutCode; 

  end;

  ArrayOfRQMeasurementShort = array of RQMeasurementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQMeasurementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQMeasurementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQMeasurementShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQMeasurementController/message/
  // soapAction: http://ksoe.org/RQMeasurementController/action/RQMeasurementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQMeasurementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQMeasurementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQMeasurementControllerSoapPort = interface(IInvokable)
  ['{1e251e25-1e25-1e25-1e25-1e251e251e25}']
    function  add(const aRQMeasurement: RQMeasurement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQMeasurement: RQMeasurement); stdcall;
    function  getObject(const anObjectCode: Integer): RQMeasurement; stdcall;
    function  getList: RQMeasurementShortList; stdcall;
    function  getFilteredList(const aRQMeasurementFilter: RQMeasurementFilter): RQMeasurementShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQMeasurementShortList; stdcall;
    function  getScrollableFilteredList(const aRQMeasurementFilter: RQMeasurementFilter; const aFromPosition: Integer; const aQuantity: Integer): RQMeasurementShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQMeasurementShortList; stdcall;
  end; 


implementation

  
  
  destructor RQMeasurementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQMeasurement, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMeasurement');
  RemClassRegistry.RegisterXSClass(RQMeasurementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMeasurementRef');
  RemClassRegistry.RegisterXSClass(RQMeasurementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMeasurementFilter');
  RemClassRegistry.RegisterXSClass(RQMeasurementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMeasurementShort');
  RemClassRegistry.RegisterXSClass(RQMeasurementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMeasurementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQMeasurementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQMeasurementShort');

  InvRegistry.RegisterInterface(TypeInfo(RQMeasurementControllerSoapPort), 'http://ksoe.org/RQMeasurementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQMeasurementControllerSoapPort), 'http://ksoe.org/RQMeasurementController/action/RQMeasurementController.%operationName%');


end.
