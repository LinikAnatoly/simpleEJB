unit ENSDTUObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSDTUObjectTypeController 
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

  ENSDTUObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSDTUObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSDTUObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENSDTUObjectType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENSDTUObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENSDTUObjectFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENSDTUObjectType;
//???
    Felement : ENElement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENSDTUObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENSDTUObjectShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FobjectTypeCode : Integer; 
    FobjectTypeName : WideString;
    FelementCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property buhName : WideString read FbuhName write FbuhName;
    property invNumber : WideString read FinvNumber write FinvNumber;

    property objectTypeCode : Integer read FobjectTypeCode write FobjectTypeCode; 
    property objectTypeName : WideString read FobjectTypeName write FobjectTypeName; 
    property elementCode : Integer read FelementCode write FelementCode; 
  end;

  ArrayOfENSDTUObjectShort = array of ENSDTUObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSDTUObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSDTUObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSDTUObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSDTUObjectController/message/
  // soapAction: http://ksoe.org/ENSDTUObjectController/action/ENSDTUObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSDTUObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSDTUObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSDTUObjectControllerSoapPort = interface(IInvokable)
  ['{121f121f-121f-121f-121f-121f121f121f}']
    function  add(const aENSDTUObject: ENSDTUObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSDTUObject: ENSDTUObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENSDTUObject; stdcall;
    function  getList: ENSDTUObjectShortList; stdcall;
    function  getFilteredList(const aENSDTUObjectFilter: ENSDTUObjectFilter): ENSDTUObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENSDTUObjectFilter: ENSDTUObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSDTUObjectShortList; stdcall;
  end; 


implementation

  destructor ENSDTUObject.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENSDTUObjectFilter.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENSDTUObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSDTUObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObject');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectRef');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectFilter');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectShort');
  RemClassRegistry.RegisterXSClass(ENSDTUObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSDTUObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSDTUObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSDTUObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSDTUObjectControllerSoapPort), 'http://ksoe.org/ENSDTUObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSDTUObjectControllerSoapPort), 'http://ksoe.org/ENSDTUObjectController/action/ENSDTUObjectController.%operationName%');


end.
