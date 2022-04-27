unit ENTiresInstallStatusController;

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

  ENTiresInstallStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTiresInstallStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTiresInstallStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTiresInstallStatusFilter = class(TRemotable)
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

  ENTiresInstallStatusFilter = class(ENTiresInstallStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTiresInstallStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTiresInstallStatusShort = array of ENTiresInstallStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTiresInstallStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTiresInstallStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTiresInstallStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTiresInstallStatusController/message/
  // soapAction: http://ksoe.org/ENTiresInstallStatusController/action/ENTiresInstallStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTiresInstallStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTiresInstallStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTiresInstallStatusControllerSoapPort = interface(IInvokable)
  ['{9a5d9a5d-9a5d-9a5d-9a5d-9a5d9a5d9a5d}']
    function  add(const aENTiresInstallStatus: ENTiresInstallStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTiresInstallStatus: ENTiresInstallStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENTiresInstallStatus; stdcall;
    function  getList: ENTiresInstallStatusShortList; stdcall;
    function  getFilteredList(const aENTiresInstallStatusFilter: ENTiresInstallStatusFilter): ENTiresInstallStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENTiresInstallStatusFilter: ENTiresInstallStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTiresInstallStatusShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTiresInstallStatusFilter: ENTiresInstallStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTiresInstallStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTiresInstallStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallStatus');
  RemClassRegistry.RegisterXSClass(ENTiresInstallStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallStatusRef');
  RemClassRegistry.RegisterXSClass(ENTiresInstallStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallStatusFilter');
  RemClassRegistry.RegisterXSClass(ENTiresInstallStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallStatusShort');
  RemClassRegistry.RegisterXSClass(ENTiresInstallStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTiresInstallStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTiresInstallStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTiresInstallStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTiresInstallStatusControllerSoapPort), 'http://ksoe.org/ENTiresInstallStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTiresInstallStatusControllerSoapPort), 'http://ksoe.org/ENTiresInstallStatusController/action/ENTiresInstallStatusController.%operationName%');


end.
