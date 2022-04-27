unit ENManagementController;

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

  ENManagement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManagementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManagement = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENManagementFilter = class(TRemotable)
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

  ENManagementFilter = class(ENManagement)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENManagementShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENManagementShort = array of ENManagementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENManagementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENManagementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENManagementShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENManagementController/message/
  // soapAction: http://ksoe.org/ENManagementController/action/ENManagementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENManagementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENManagementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENManagementControllerSoapPort = interface(IInvokable)
  ['{D00615FC-D214-4646-B584-C5A8158B6076}']
    function  add(const aENManagement: ENManagement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENManagement: ENManagement); stdcall;
    function  getObject(const anObjectCode: Integer): ENManagement; stdcall;
    function  getList: ENManagementShortList; stdcall;
    function  getFilteredList(const aENManagementFilter: ENManagementFilter): ENManagementShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENManagementShortList; stdcall;
    function  getScrollableFilteredList(const aENManagementFilter: ENManagementFilter; const aFromPosition: Integer; const aQuantity: Integer): ENManagementShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENManagementShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENManagementFilter: ENManagementFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENManagementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENManagement, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManagement');
  RemClassRegistry.RegisterXSClass(ENManagementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManagementRef');
  RemClassRegistry.RegisterXSClass(ENManagementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManagementFilter');
  RemClassRegistry.RegisterXSClass(ENManagementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManagementShort');
  RemClassRegistry.RegisterXSClass(ENManagementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManagementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENManagementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENManagementShort');

  InvRegistry.RegisterInterface(TypeInfo(ENManagementControllerSoapPort), 'http://ksoe.org/ENManagementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENManagementControllerSoapPort), 'http://ksoe.org/ENManagementController/action/ENManagementController.%operationName%');


end.
