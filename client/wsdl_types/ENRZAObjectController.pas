unit ENRZAObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENRZAObjectTypeController 
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

  ENRZAObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRZAObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRZAObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENRZAObjectType;
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
    property objectType : ENRZAObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENRZAObjectFilter = class(TRemotable)
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
    FobjectType : ENRZAObjectType;
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
    property objectType : ENRZAObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENRZAObjectShort = class(TRemotable)
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

  ArrayOfENRZAObjectShort = array of ENRZAObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRZAObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRZAObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRZAObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRZAObjectController/message/
  // soapAction: http://ksoe.org/ENRZAObjectController/action/ENRZAObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRZAObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRZAObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRZAObjectControllerSoapPort = interface(IInvokable)
['{F2C880B2-C916-4130-AD31-4B2C09BB975A}']
    function  add(const aENRZAObject: ENRZAObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRZAObject: ENRZAObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENRZAObject; stdcall;
    function  getList: ENRZAObjectShortList; stdcall;
    function  getFilteredList(const aENRZAObjectFilter: ENRZAObjectFilter): ENRZAObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENRZAObjectFilter: ENRZAObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRZAObjectShortList; stdcall;
  end; 


implementation

  destructor ENRZAObject.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENRZAObjectFilter.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENRZAObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRZAObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObject');
  RemClassRegistry.RegisterXSClass(ENRZAObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectRef');
  RemClassRegistry.RegisterXSClass(ENRZAObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectFilter');
  RemClassRegistry.RegisterXSClass(ENRZAObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectShort');
  RemClassRegistry.RegisterXSClass(ENRZAObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRZAObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRZAObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRZAObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRZAObjectControllerSoapPort), 'http://ksoe.org/ENRZAObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRZAObjectControllerSoapPort), 'http://ksoe.org/ENRZAObjectController/action/ENRZAObjectController.%operationName%');


end.
