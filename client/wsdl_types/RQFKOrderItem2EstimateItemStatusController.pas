unit RQFKOrderItem2EstimateItemStatusController;

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

  RQFKOrderItem2EstimateItemStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2EstimateItemStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2EstimateItemStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQFKOrderItem2EstimateItemStatusFilter = class(TRemotable)
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

  RQFKOrderItem2EstimateItemStatusFilter = class(RQFKOrderItem2EstimateItemStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItem2EstimateItemStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQFKOrderItem2EstimateItemStatusShort = array of RQFKOrderItem2EstimateItemStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2EstimateItemStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2EstimateItemStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2EstimateItemStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2EstimateItemStatusController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2EstimateItemStatusController/action/RQFKOrderItem2EstimateItemStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2EstimateItemStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2EstimateItemStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2EstimateItemStatusControllerSoapPort = interface(IInvokable)
  ['{191f191f-191f-191f-191f-191f191f191f}']
    function  add(const aRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2EstimateItemStatus: RQFKOrderItem2EstimateItemStatus); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItem2EstimateItemStatus; stdcall;
    function  getList: RQFKOrderItem2EstimateItemStatusShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItem2EstimateItemStatusFilter: RQFKOrderItem2EstimateItemStatusFilter): RQFKOrderItem2EstimateItemStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2EstimateItemStatusShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItem2EstimateItemStatusFilter: RQFKOrderItem2EstimateItemStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2EstimateItemStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2EstimateItemStatusShortList; stdcall;
  end; 


implementation


  
  destructor RQFKOrderItem2EstimateItemStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2EstimateItemStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2EstimateItemStatus');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2EstimateItemStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2EstimateItemStatusRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2EstimateItemStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2EstimateItemStatusFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2EstimateItemStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2EstimateItemStatusShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2EstimateItemStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2EstimateItemStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2EstimateItemStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2EstimateItemStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2EstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2EstimateItemStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2EstimateItemStatusControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2EstimateItemStatusController/action/RQFKOrderItem2EstimateItemStatusController.%operationName%');


end.
