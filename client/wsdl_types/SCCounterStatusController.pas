unit SCCounterStatusController;

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

  SCCounterStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounterStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounterStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCCounterStatusFilter = class(TRemotable)
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

  SCCounterStatusFilter = class(SCCounterStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCCounterStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCCounterStatusShort = array of SCCounterStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCCounterStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCCounterStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCCounterStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCCounterStatusController/message/
  // soapAction: http://ksoe.org/SCCounterStatusController/action/SCCounterStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCCounterStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCCounterStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCCounterStatusControllerSoapPort = interface(IInvokable)
  ['{36BEB9C5-12AA-4077-8F29-4254CB00670B}']
    function  add(const aSCCounterStatus: SCCounterStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCCounterStatus: SCCounterStatus); stdcall;
    function  getObject(const anObjectCode: Integer): SCCounterStatus; stdcall;
    function  getList: SCCounterStatusShortList; stdcall;
    function  getFilteredList(const aSCCounterStatusFilter: SCCounterStatusFilter): SCCounterStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCCounterStatusShortList; stdcall;
    function  getScrollableFilteredList(const aSCCounterStatusFilter: SCCounterStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): SCCounterStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCCounterStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCCounterStatusFilter: SCCounterStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCCounterStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCCounterStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterStatus');
  RemClassRegistry.RegisterXSClass(SCCounterStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterStatusRef');
  RemClassRegistry.RegisterXSClass(SCCounterStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterStatusFilter');
  RemClassRegistry.RegisterXSClass(SCCounterStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterStatusShort');
  RemClassRegistry.RegisterXSClass(SCCounterStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCCounterStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCCounterStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(SCCounterStatusControllerSoapPort), 'http://ksoe.org/SCCounterStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCCounterStatusControllerSoapPort), 'http://ksoe.org/SCCounterStatusController/action/SCCounterStatusController.%operationName%');


end.
