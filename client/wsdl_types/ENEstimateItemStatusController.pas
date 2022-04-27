unit ENEstimateItemStatusController;

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

  ENEstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENEstimateItemStatusFilter = class(TRemotable)
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


  ENEstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEstimateItemStatusShort = array of ENEstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateItemStatusController/message/
  // soapAction: http://ksoe.org/ENEstimateItemStatusController/action/ENEstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{107f107f-107f-107f-107f-107f107f107f}']
    function  add(const aENEstimateItemStatus: ENEstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateItemStatus: ENEstimateItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENEstimateItemStatus; stdcall;
    function  getList: ENEstimateItemStatusShortList; stdcall;
    function  getFilteredList(const aENEstimateItemStatusFilter: ENEstimateItemStatusFilter): ENEstimateItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENEstimateItemStatusFilter: ENEstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItemStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor ENEstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatus');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/ENEstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateItemStatusControllerSoapPort), 'http://ksoe.org/ENEstimateItemStatusController/action/ENEstimateItemStatusController.%operationName%');


end.
