unit ENRouteBytDetailController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPlanWorkController 
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

  ENRouteBytDetail            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRouteBytDetailRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRouteBytDetail = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fnumbergen : WideString;
    FrouteCode : Integer; 
    FrpCode : Integer; 
    FrpName : WideString;
    FentryCode : Integer; 
    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
    FstatusCode : Integer;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property  routeCode : Integer read FrouteCode write FrouteCode; 
    property  rpCode : Integer read FrpCode write FrpCode; 
    property rpName : WideString read FrpName write FrpName;
    property  entryCode : Integer read FentryCode write FentryCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property  statusCode : Integer read FstatusCode write FstatusCode; 

  end;
  

  ENRouteBytDetailFilter = class(ENRouteBytDetail)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENRouteBytDetailShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fnumbergen : WideString;
    FrouteCode : Integer; 
    FrpCode : Integer; 
    FrpName : WideString;
    FentryCode : Integer; 
    FplanRefCode : Integer;
    FstatusCode : Integer; 
 
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property numbergen : WideString read Fnumbergen write Fnumbergen;
    property  routeCode : Integer read FrouteCode write FrouteCode; 
    property  rpCode : Integer read FrpCode write FrpCode; 
    property rpName : WideString read FrpName write FrpName;
    property  entryCode : Integer read FentryCode write FentryCode; 

    property planRefCode : Integer read FplanRefCode write FplanRefCode; //ENPlanWorkRef read FplanRefCode write FplanRefCode; 
    property  statusCode : Integer read FstatusCode write FstatusCode; 

  end;

  ArrayOfENRouteBytDetailShort = array of ENRouteBytDetailShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRouteBytDetailShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRouteBytDetailShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRouteBytDetailShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRouteBytDetailController/message/
  // soapAction: http://ksoe.org/ENRouteBytDetailController/action/ENRouteBytDetailController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRouteBytDetailControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRouteBytDetailController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRouteBytDetailControllerSoapPort = interface(IInvokable)
  ['{15bf15bf-15bf-15bf-15bf-15bf15bf15bf}']
    function  add(const aENRouteBytDetail: ENRouteBytDetail): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRouteBytDetail: ENRouteBytDetail); stdcall;
    function  getObject(const anObjectCode: Integer): ENRouteBytDetail; stdcall;
    function  getList: ENRouteBytDetailShortList; stdcall;
    function  getFilteredList(const aENRouteBytDetailFilter: ENRouteBytDetailFilter): ENRouteBytDetailShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytDetailShortList; stdcall;
    function  getScrollableFilteredList(const aENRouteBytDetailFilter: ENRouteBytDetailFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytDetailShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRouteBytDetailShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENRouteBytDetailFilter: ENRouteBytDetailFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENRouteBytDetail.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENRouteBytDetailFilter.Destroy;
  begin
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENRouteBytDetailFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  
  destructor ENRouteBytDetailShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRouteBytDetail, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytDetail');
  RemClassRegistry.RegisterXSClass(ENRouteBytDetailRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytDetailRef');
  RemClassRegistry.RegisterXSClass(ENRouteBytDetailFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytDetailFilter');
  RemClassRegistry.RegisterXSClass(ENRouteBytDetailShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytDetailShort');
  RemClassRegistry.RegisterXSClass(ENRouteBytDetailShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRouteBytDetailShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRouteBytDetailShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRouteBytDetailShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRouteBytDetailControllerSoapPort), 'http://ksoe.org/ENRouteBytDetailController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRouteBytDetailControllerSoapPort), 'http://ksoe.org/ENRouteBytDetailController/action/ENRouteBytDetailController.%operationName%');


end.
