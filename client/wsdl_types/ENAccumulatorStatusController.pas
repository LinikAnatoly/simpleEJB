unit ENAccumulatorStatusController;

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

  ENAccumulatorStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENAccumulatorStatusFilter = class(TRemotable)
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

  ENAccumulatorStatusFilter = class(ENAccumulatorStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAccumulatorStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENAccumulatorStatusShort = array of ENAccumulatorStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAccumulatorStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAccumulatorStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAccumulatorStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAccumulatorStatusController/message/
  // soapAction: http://ksoe.org/ENAccumulatorStatusController/action/ENAccumulatorStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAccumulatorStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAccumulatorStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAccumulatorStatusControllerSoapPort = interface(IInvokable)
  ['{4a154a15-4a15-4a15-4a15-4a154a154a15}']
    function  add(const aENAccumulatorStatus: ENAccumulatorStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAccumulatorStatus: ENAccumulatorStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENAccumulatorStatus; stdcall;
    function  getList: ENAccumulatorStatusShortList; stdcall;
    function  getFilteredList(const aENAccumulatorStatusFilter: ENAccumulatorStatusFilter): ENAccumulatorStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENAccumulatorStatusFilter: ENAccumulatorStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAccumulatorStatusFilter: ENAccumulatorStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENAccumulatorStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAccumulatorStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorStatus');
  RemClassRegistry.RegisterXSClass(ENAccumulatorStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorStatusRef');
  RemClassRegistry.RegisterXSClass(ENAccumulatorStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorStatusFilter');
  RemClassRegistry.RegisterXSClass(ENAccumulatorStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorStatusShort');
  RemClassRegistry.RegisterXSClass(ENAccumulatorStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAccumulatorStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAccumulatorStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAccumulatorStatusControllerSoapPort), 'http://ksoe.org/ENAccumulatorStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAccumulatorStatusControllerSoapPort), 'http://ksoe.org/ENAccumulatorStatusController/action/ENAccumulatorStatusController.%operationName%');


end.
