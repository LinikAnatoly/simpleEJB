unit ENServicesObjectStatusController;

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

  ENServicesObjectStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENServicesObjectStatusFilter = class(TRemotable)
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

  ENServicesObjectStatusFilter = class(ENServicesObjectStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENServicesObjectStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesObjectStatusShort = array of ENServicesObjectStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesObjectStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesObjectStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesObjectStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesObjectStatusController/message/
  // soapAction: http://ksoe.org/ENServicesObjectStatusController/action/ENServicesObjectStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesObjectStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesObjectStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesObjectStatusControllerSoapPort = interface(IInvokable)
  ['{5b855b85-5b85-5b85-5b85-5b855b855b85}']
    function  add(const aENServicesObjectStatus: ENServicesObjectStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesObjectStatus: ENServicesObjectStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENServicesObjectStatus; stdcall;
    function  getList: ENServicesObjectStatusShortList; stdcall;
    function  getFilteredList(const aENServicesObjectStatusFilter: ENServicesObjectStatusFilter): ENServicesObjectStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENServicesObjectStatusFilter: ENServicesObjectStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENServicesObjectStatusFilter: ENServicesObjectStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENServicesObjectStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesObjectStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectStatus');
  RemClassRegistry.RegisterXSClass(ENServicesObjectStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectStatusRef');
  RemClassRegistry.RegisterXSClass(ENServicesObjectStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectStatusFilter');
  RemClassRegistry.RegisterXSClass(ENServicesObjectStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectStatusShort');
  RemClassRegistry.RegisterXSClass(ENServicesObjectStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesObjectStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesObjectStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesObjectStatusControllerSoapPort), 'http://ksoe.org/ENServicesObjectStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesObjectStatusControllerSoapPort), 'http://ksoe.org/ENServicesObjectStatusController/action/ENServicesObjectStatusController.%operationName%');


end.
