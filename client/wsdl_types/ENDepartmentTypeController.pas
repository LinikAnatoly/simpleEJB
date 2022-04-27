unit ENDepartmentTypeController;

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

  ENDepartmentType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartmentTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartmentType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENDepartmentTypeFilter = class(TRemotable)
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


  ENDepartmentTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENDepartmentTypeShort = array of ENDepartmentTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDepartmentTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDepartmentTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDepartmentTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDepartmentTypeController/message/
  // soapAction: http://ksoe.org/ENDepartmentTypeController/action/ENDepartmentTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDepartmentTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDepartmentTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDepartmentTypeControllerSoapPort = interface(IInvokable)
  ['{a57ba57b-a57b-a57b-a57b-a57ba57ba57b}']
    function  add(const aENDepartmentType: ENDepartmentType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDepartmentType: ENDepartmentType); stdcall;
    function  getObject(const anObjectCode: Integer): ENDepartmentType; stdcall;
    function  getList: ENDepartmentTypeShortList; stdcall;
    function  getFilteredList(const aENDepartmentTypeFilter: ENDepartmentTypeFilter): ENDepartmentTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENDepartmentTypeFilter: ENDepartmentTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentTypeShortList; stdcall;
  end; 


implementation

  
  
  destructor ENDepartmentTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDepartmentType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentType');
  RemClassRegistry.RegisterXSClass(ENDepartmentTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentTypeRef');
  RemClassRegistry.RegisterXSClass(ENDepartmentTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentTypeFilter');
  RemClassRegistry.RegisterXSClass(ENDepartmentTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentTypeShort');
  RemClassRegistry.RegisterXSClass(ENDepartmentTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDepartmentTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDepartmentTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDepartmentTypeControllerSoapPort), 'http://ksoe.org/ENDepartmentTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDepartmentTypeControllerSoapPort), 'http://ksoe.org/ENDepartmentTypeController/action/ENDepartmentTypeController.%operationName%');


end.
