unit ENMetrologyDeviceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENMetrologyDeviceTypeController 
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

  ENMetrologyDevice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyDeviceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMetrologyDevice = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FinvNumber : WideString;
    FbuhName : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdeviceType : ENMetrologyDeviceType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buhName : WideString read FbuhName write FbuhName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property deviceType : ENMetrologyDeviceType read FdeviceType write FdeviceType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENMetrologyDeviceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FinvNumber : WideString;
    FbuhName : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FdeviceType : ENMetrologyDeviceType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buhName : WideString read FbuhName write FbuhName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property deviceType : ENMetrologyDeviceType read FdeviceType write FdeviceType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENMetrologyDeviceShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuildNumber : WideString;
    FinvNumber : WideString;
    FbuhName : WideString;
    FdeviceTypeCode : Integer; 
    FdeviceTypeName : WideString;
    FelementCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property buhName : WideString read FbuhName write FbuhName;

    property deviceTypeCode : Integer read FdeviceTypeCode write FdeviceTypeCode; 
    property deviceTypeName : WideString read FdeviceTypeName write FdeviceTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENMetrologyDeviceShort = array of ENMetrologyDeviceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMetrologyDeviceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMetrologyDeviceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMetrologyDeviceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMetrologyDeviceController/message/
  // soapAction: http://ksoe.org/ENMetrologyDeviceController/action/ENMetrologyDeviceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMetrologyDeviceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMetrologyDeviceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMetrologyDeviceControllerSoapPort = interface(IInvokable)
  ['{127a127a-127a-127a-127a-127a127a127a}']
    function  add(const aENMetrologyDevice: ENMetrologyDevice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMetrologyDevice: ENMetrologyDevice); stdcall;
    function  getObject(const anObjectCode: Integer): ENMetrologyDevice; stdcall;
    function  getList: ENMetrologyDeviceShortList; stdcall;
    function  getFilteredList(const aENMetrologyDeviceFilter: ENMetrologyDeviceFilter): ENMetrologyDeviceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceShortList; stdcall;
    function  getScrollableFilteredList(const aENMetrologyDeviceFilter: ENMetrologyDeviceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMetrologyDeviceShortList; stdcall;
  end; 


implementation

  destructor ENMetrologyDevice.Destroy;
  begin
    if Assigned(FdeviceType) then
      deviceType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENMetrologyDeviceFilter.Destroy;
  begin
    if Assigned(FdeviceType) then
      deviceType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENMetrologyDeviceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMetrologyDevice, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDevice');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceRef');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceFilter');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceShort');
  RemClassRegistry.RegisterXSClass(ENMetrologyDeviceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMetrologyDeviceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMetrologyDeviceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMetrologyDeviceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMetrologyDeviceControllerSoapPort), 'http://ksoe.org/ENMetrologyDeviceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMetrologyDeviceControllerSoapPort), 'http://ksoe.org/ENMetrologyDeviceController/action/ENMetrologyDeviceController.%operationName%');


end.
