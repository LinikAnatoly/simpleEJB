unit ENIzolationObjectController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENIzolationObjectTypeController 
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

  ENIzolationObject            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIzolationObjectRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIzolationObject = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FbuhName : WideString;
    FinvNumber : WideString;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENIzolationObjectType;
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
    property objectType : ENIzolationObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;

  ENIzolationObjectFilter = class(TRemotable)
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
    FobjectType : ENIzolationObjectType;
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
    property objectType : ENIzolationObjectType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
  end;


  ENIzolationObjectShort = class(TRemotable)
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

  ArrayOfENIzolationObjectShort = array of ENIzolationObjectShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIzolationObjectShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIzolationObjectShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIzolationObjectShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIzolationObjectController/message/
  // soapAction: http://ksoe.org/ENIzolationObjectController/action/ENIzolationObjectController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIzolationObjectControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIzolationObjectController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIzolationObjectControllerSoapPort = interface(IInvokable)
  ['{88368836-8836-8836-8836-883688368836}']
    function  add(const aENIzolationObject: ENIzolationObject): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIzolationObject: ENIzolationObject); stdcall;
    function  getObject(const anObjectCode: Integer): ENIzolationObject; stdcall;
    function  getList: ENIzolationObjectShortList; stdcall;
    function  getFilteredList(const aENIzolationObjectFilter: ENIzolationObjectFilter): ENIzolationObjectShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectShortList; stdcall;
    function  getScrollableFilteredList(const aENIzolationObjectFilter: ENIzolationObjectFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIzolationObjectShortList; stdcall;
  end; 


implementation

  destructor ENIzolationObject.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end;
  
  destructor ENIzolationObjectFilter.Destroy;
  begin
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENIzolationObjectShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIzolationObject, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObject');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectRef');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectFilter');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectShort');
  RemClassRegistry.RegisterXSClass(ENIzolationObjectShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIzolationObjectShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIzolationObjectShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIzolationObjectShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIzolationObjectControllerSoapPort), 'http://ksoe.org/ENIzolationObjectController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIzolationObjectControllerSoapPort), 'http://ksoe.org/ENIzolationObjectController/action/ENIzolationObjectController.%operationName%');


end.
