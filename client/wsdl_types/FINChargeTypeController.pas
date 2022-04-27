unit FINChargeTypeController;

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

  FINChargeType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINChargeTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINChargeType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  FINChargeTypeFilter = class(TRemotable)
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
}

  FINChargeTypeFilter = class(FINChargeType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  FINChargeTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfFINChargeTypeShort = array of FINChargeTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINChargeTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINChargeTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINChargeTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINChargeTypeController/message/
  // soapAction: http://ksoe.org/FINChargeTypeController/action/FINChargeTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINChargeTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINChargeTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINChargeTypeControllerSoapPort = interface(IInvokable)
  ['{91b991b9-91b9-91b9-91b9-91b991b991b9}']
    function  add(const aFINChargeType: FINChargeType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINChargeType: FINChargeType); stdcall;
    function  getObject(const anObjectCode: Integer): FINChargeType; stdcall;
    function  getList: FINChargeTypeShortList; stdcall;
    function  getFilteredList(const aFINChargeTypeFilter: FINChargeTypeFilter): FINChargeTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINChargeTypeShortList; stdcall;
    function  getScrollableFilteredList(const aFINChargeTypeFilter: FINChargeTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): FINChargeTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINChargeTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aFINChargeTypeFilter: FINChargeTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor FINChargeTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINChargeType, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeType');
  RemClassRegistry.RegisterXSClass(FINChargeTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeTypeRef');
  RemClassRegistry.RegisterXSClass(FINChargeTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeTypeFilter');
  RemClassRegistry.RegisterXSClass(FINChargeTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeTypeShort');
  RemClassRegistry.RegisterXSClass(FINChargeTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINChargeTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINChargeTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINChargeTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(FINChargeTypeControllerSoapPort), 'http://ksoe.org/FINChargeTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINChargeTypeControllerSoapPort), 'http://ksoe.org/FINChargeTypeController/action/FINChargeTypeController.%operationName%');


end.
