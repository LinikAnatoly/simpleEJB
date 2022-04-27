unit SCUsageInputStatusController;

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

  SCUsageInputStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCUsageInputStatusFilter = class(TRemotable)
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

  SCUsageInputStatusFilter = class(SCUsageInputStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCUsageInputStatusShort = array of SCUsageInputStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputStatusController/message/
  // soapAction: http://ksoe.org/SCUsageInputStatusController/action/SCUsageInputStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputStatusControllerSoapPort = interface(IInvokable)
  ['{1bc41bc4-1bc4-1bc4-1bc4-1bc41bc41bc4}']
    function  add(const aSCUsageInputStatus: SCUsageInputStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputStatus: SCUsageInputStatus); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputStatus; stdcall;
    function  getList: SCUsageInputStatusShortList; stdcall;
    function  getFilteredList(const aSCUsageInputStatusFilter: SCUsageInputStatusFilter): SCUsageInputStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputStatusShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputStatusFilter: SCUsageInputStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputStatusFilter: SCUsageInputStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCUsageInputStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputStatus');
  RemClassRegistry.RegisterXSClass(SCUsageInputStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputStatusRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputStatusFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputStatusShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputStatusControllerSoapPort), 'http://ksoe.org/SCUsageInputStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputStatusControllerSoapPort), 'http://ksoe.org/SCUsageInputStatusController/action/SCUsageInputStatusController.%operationName%');


end.
