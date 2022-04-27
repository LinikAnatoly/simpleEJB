unit ENTransportDepartmentController;

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

  ENTransportDepartment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDepartment = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENTransportDepartmentFilter = class(TRemotable)
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

  ENTransportDepartmentFilter = class(ENTransportDepartment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportDepartmentShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTransportDepartmentShort = array of ENTransportDepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportDepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportDepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportDepartmentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportDepartmentController/message/
  // soapAction: http://ksoe.org/ENTransportDepartmentController/action/ENTransportDepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportDepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportDepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportDepartmentControllerSoapPort = interface(IInvokable)
  ['{1b621b62-1b62-1b62-1b62-1b621b621b62}']
    function  add(const aENTransportDepartment: ENTransportDepartment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportDepartment: ENTransportDepartment); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportDepartment; stdcall;
    function  getList: ENTransportDepartmentShortList; stdcall;
    function  getFilteredList(const aENTransportDepartmentFilter: ENTransportDepartmentFilter): ENTransportDepartmentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportDepartmentShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportDepartmentFilter: ENTransportDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDepartmentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDepartmentShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportDepartmentFilter: ENTransportDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENTransportDepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportDepartment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDepartment');
  RemClassRegistry.RegisterXSClass(ENTransportDepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDepartmentRef');
  RemClassRegistry.RegisterXSClass(ENTransportDepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENTransportDepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDepartmentShort');
  RemClassRegistry.RegisterXSClass(ENTransportDepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportDepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportDepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportDepartmentControllerSoapPort), 'http://ksoe.org/ENTransportDepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportDepartmentControllerSoapPort), 'http://ksoe.org/ENTransportDepartmentController/action/ENTransportDepartmentController.%operationName%');


end.
