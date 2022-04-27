unit FINExecutorController;

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

  FINExecutor            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutorRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINExecutor = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FfinCode : Integer; 
    FfinTypeName : WideString;
    FfinTypeCode : Integer; 
    FfinKindName : WideString;
    FfinKindCode : Integer; 
    FfinCehName : WideString;
    FfinCehCode : Integer; 
    FaxOrgId : WideString;
    FaxParentOrgId : WideString;
    FaxParentOrgName : WideString;
    FaxOrgTypeId : Integer;
    FaxOrgTypeName : WideString;
    Fmodify_time : Int64;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  finCode : Integer read FfinCode write FfinCode; 
    property finTypeName : WideString read FfinTypeName write FfinTypeName;
    property  finTypeCode : Integer read FfinTypeCode write FfinTypeCode; 
    property finKindName : WideString read FfinKindName write FfinKindName;
    property  finKindCode : Integer read FfinKindCode write FfinKindCode; 
    property finCehName : WideString read FfinCehName write FfinCehName;
    property  finCehCode : Integer read FfinCehCode write FfinCehCode; 
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
    property axParentOrgId : WideString read FaxParentOrgId write FaxParentOrgId;
    property axParentOrgName : WideString read FaxParentOrgName write FaxParentOrgName;
    property  axOrgTypeId : Integer read FaxOrgTypeId write FaxOrgTypeId;
    property axOrgTypeName : WideString read FaxOrgTypeName write FaxOrgTypeName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;

{
  FINExecutorFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FfinCode : Integer; 
    FfinTypeName : WideString;
    FfinTypeCode : Integer; 
    FfinKindName : WideString;
    FfinKindCode : Integer; 
    FfinCehName : WideString;
    FfinCehCode : Integer; 
    FaxOrgId : WideString;
    FaxParentOrgId : WideString;
    FaxParentOrgName : WideString;
    FaxOrgTypeId : Integer;
    FaxOrgTypeName : WideString;
    Fmodify_time : Int64;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  finCode : Integer read FfinCode write FfinCode; 
    property finTypeName : WideString read FfinTypeName write FfinTypeName;
    property  finTypeCode : Integer read FfinTypeCode write FfinTypeCode; 
    property finKindName : WideString read FfinKindName write FfinKindName;
    property  finKindCode : Integer read FfinKindCode write FfinKindCode; 
    property finCehName : WideString read FfinCehName write FfinCehName;
    property  finCehCode : Integer read FfinCehCode write FfinCehCode; 
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
    property axParentOrgId : WideString read FaxParentOrgId write FaxParentOrgId;
    property axParentOrgName : WideString read FaxParentOrgName write FaxParentOrgName;
    property  axOrgTypeId : Integer read FaxOrgTypeId write FaxOrgTypeId;
    property axOrgTypeName : WideString read FaxOrgTypeName write FaxOrgTypeName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;
}

  FINExecutorFilter = class(FINExecutor)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINExecutorShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FfinCode : Integer; 
    FfinTypeName : WideString;
    FfinTypeCode : Integer; 
    FfinKindName : WideString;
    FfinKindCode : Integer; 
    FfinCehName : WideString;
    FfinCehCode : Integer; 
    FaxOrgId : WideString;
    FaxParentOrgId : WideString;
    FaxParentOrgName : WideString;
    FaxOrgTypeId : Integer;
    FaxOrgTypeName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  finCode : Integer read FfinCode write FfinCode; 
    property finTypeName : WideString read FfinTypeName write FfinTypeName;
    property  finTypeCode : Integer read FfinTypeCode write FfinTypeCode; 
    property finKindName : WideString read FfinKindName write FfinKindName;
    property  finKindCode : Integer read FfinKindCode write FfinKindCode; 
    property finCehName : WideString read FfinCehName write FfinCehName;
    property  finCehCode : Integer read FfinCehCode write FfinCehCode; 
    property axOrgId : WideString read FaxOrgId write FaxOrgId;
    property axParentOrgId : WideString read FaxParentOrgId write FaxParentOrgId;
    property axParentOrgName : WideString read FaxParentOrgName write FaxParentOrgName;
    property  axOrgTypeId : Integer read FaxOrgTypeId write FaxOrgTypeId;
    property axOrgTypeName : WideString read FaxOrgTypeName write FaxOrgTypeName;

  end;

  ArrayOfFINExecutorShort = array of FINExecutorShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINExecutorShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINExecutorShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINExecutorShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;
  //ArrayOfString = array of String;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINExecutorController/message/
  // soapAction: http://ksoe.org/FINExecutorController/action/FINExecutorController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINExecutorControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINExecutorController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINExecutorControllerSoapPort = interface(IInvokable)
  ['{64778261-DEA6-43B4-B92C-69AF235C769E}']
    function  add(const aFINExecutor: FINExecutor): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINExecutor: FINExecutor); stdcall;
    function  getObject(const anObjectCode: Integer): FINExecutor; stdcall;
    function  getList: FINExecutorShortList; stdcall;
    function  getFilteredList(const aFINExecutorFilter: FINExecutorFilter): FINExecutorShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINExecutorShortList; stdcall;
    function  getScrollableFilteredList(const aFINExecutorFilter: FINExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer): FINExecutorShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINExecutorShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINExecutorFilter: FINExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINExecutorShort; stdcall;

    function getFINExecutorList(const aFINExecutorFilter: FINExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer): FINExecutorShortList; stdcall; overload;
    // reloadFinExecutor == true :: обновить список подразделений со штатного (ФК).....
    function getFINExecutorList(const aFINExecutorFilter: FINExecutorFilter; const aFromPosition: Integer; const aQuantity: Integer; const reloadFinExecutor : Boolean): FINExecutorShortList; stdcall; overload;
    function getPodrIdFromKadryByDepartmentCodeNVZ_E(departmentCode : Integer ; dateSrez : String ): String ; stdcall; // по коду подразделения выбирает из кадров ID подразделения по параметру признака НВЗ или НВЗ_Е
    // возвращает строку fincode из finexecutor (код подразделения из кадров) по коду подразделения из аксапты
    function getpodrFinCodeBypodrAxCodeFromFinexecutor( podrAxCode : String ): String ; stdcall;
    function getAllIdsByParent( parent : String ): ArrayOfString ; stdcall; overload;
    function getAllIdsByParent( parent : String; isMDAX : TXSBoolean ): ArrayOfString ; stdcall; overload;
  end;


implementation

  
  
  destructor FINExecutorShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINExecutor, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutor');
  RemClassRegistry.RegisterXSClass(FINExecutorRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorRef');
  RemClassRegistry.RegisterXSClass(FINExecutorFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorFilter');
  RemClassRegistry.RegisterXSClass(FINExecutorShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorShort');
  RemClassRegistry.RegisterXSClass(FINExecutorShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINExecutorShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINExecutorShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINExecutorShort');

  InvRegistry.RegisterInterface(TypeInfo(FINExecutorControllerSoapPort), 'http://ksoe.org/FINExecutorController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINExecutorControllerSoapPort), 'http://ksoe.org/FINExecutorController/action/FINExecutorController.%operationName%');


end.
