unit FINMaterialsStatusController;

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

  FINMaterialsStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMaterialsStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMaterialsStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  FINMaterialsStatusFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;


  FINMaterialsStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINMaterialsStatusShort = array of FINMaterialsStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINMaterialsStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMaterialsStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMaterialsStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINMaterialsStatusController/message/
  // soapAction: http://ksoe.org/FINMaterialsStatusController/action/FINMaterialsStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINMaterialsStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINMaterialsStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINMaterialsStatusControllerSoapPort = interface(IInvokable)
   ['{887E1FC1-3CC0-44ED-8C5A-0F4C9FBCA9B0}']
    function  add(const aFINMaterialsStatus: FINMaterialsStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINMaterialsStatus: FINMaterialsStatus); stdcall;
    function  getObject(const anObjectCode: Integer): FINMaterialsStatus; stdcall;
    function  getList: FINMaterialsStatusShortList; stdcall;
    function  getFilteredList(const aFINMaterialsStatusFilter: FINMaterialsStatusFilter): FINMaterialsStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsStatusShortList; stdcall;
    function  getScrollableFilteredList(const aFINMaterialsStatusFilter: FINMaterialsStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINMaterialsStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor FINMaterialsStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINMaterialsStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsStatus');
  RemClassRegistry.RegisterXSClass(FINMaterialsStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsStatusRef');
  RemClassRegistry.RegisterXSClass(FINMaterialsStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsStatusFilter');
  RemClassRegistry.RegisterXSClass(FINMaterialsStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsStatusShort');
  RemClassRegistry.RegisterXSClass(FINMaterialsStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMaterialsStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINMaterialsStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINMaterialsStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(FINMaterialsStatusControllerSoapPort), 'http://ksoe.org/FINMaterialsStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINMaterialsStatusControllerSoapPort), 'http://ksoe.org/FINMaterialsStatusController/action/FINMaterialsStatusController.%operationName%');


end.
