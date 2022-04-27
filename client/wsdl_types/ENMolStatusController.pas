unit ENMolStatusController;

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

  ENMolStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENMolStatusFilter = class(TRemotable)
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

  ENMolStatusFilter = class(ENMolStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMolStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMolStatusShort = array of ENMolStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMolStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMolStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMolStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMolStatusController/message/
  // soapAction: http://ksoe.org/ENMolStatusController/action/ENMolStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMolStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMolStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMolStatusControllerSoapPort = interface(IInvokable)
  ['{74fb74fb-74fb-74fb-74fb-74fb74fb74fb}']
    function  add(const aENMolStatus: ENMolStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMolStatus: ENMolStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENMolStatus; stdcall;
    function  getList: ENMolStatusShortList; stdcall;
    function  getFilteredList(const aENMolStatusFilter: ENMolStatusFilter): ENMolStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMolStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENMolStatusFilter: ENMolStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMolStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMolStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMolStatusFilter: ENMolStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENMolStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMolStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolStatus');
  RemClassRegistry.RegisterXSClass(ENMolStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolStatusRef');
  RemClassRegistry.RegisterXSClass(ENMolStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolStatusFilter');
  RemClassRegistry.RegisterXSClass(ENMolStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolStatusShort');
  RemClassRegistry.RegisterXSClass(ENMolStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMolStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMolStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMolStatusControllerSoapPort), 'http://ksoe.org/ENMolStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMolStatusControllerSoapPort), 'http://ksoe.org/ENMolStatusController/action/ENMolStatusController.%operationName%');


end.
