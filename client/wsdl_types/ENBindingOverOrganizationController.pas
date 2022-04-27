unit ENBindingOverOrganizationController;

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

  ENBindingOverOrganization            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBindingOverOrganizationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBindingOverOrganization = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;

  ENBindingOverOrganizationFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fmodify_time : Int64;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
  end;


  ENBindingOverOrganizationShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBindingOverOrganizationShort = array of ENBindingOverOrganizationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBindingOverOrganizationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBindingOverOrganizationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBindingOverOrganizationShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBindingOverOrganizationController/message/
  // soapAction: http://ksoe.org/ENBindingOverOrganizationController/action/ENBindingOverOrganizationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBindingOverOrganizationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBindingOverOrganizationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBindingOverOrganizationControllerSoapPort = interface(IInvokable)
  ['{92609260-9260-9260-9260-926092609260}']
    function  add(const aENBindingOverOrganization: ENBindingOverOrganization): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBindingOverOrganization: ENBindingOverOrganization); stdcall;
    function  getObject(const anObjectCode: Integer): ENBindingOverOrganization; stdcall;
    function  getList: ENBindingOverOrganizationShortList; stdcall;
    function  getFilteredList(const aENBindingOverOrganizationFilter: ENBindingOverOrganizationFilter): ENBindingOverOrganizationShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverOrganizationShortList; stdcall;
    function  getScrollableFilteredList(const aENBindingOverOrganizationFilter: ENBindingOverOrganizationFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverOrganizationShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBindingOverOrganizationShortList; stdcall;
  end; 


implementation

  
  
  destructor ENBindingOverOrganizationShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBindingOverOrganization, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverOrganization');
  RemClassRegistry.RegisterXSClass(ENBindingOverOrganizationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverOrganizationRef');
  RemClassRegistry.RegisterXSClass(ENBindingOverOrganizationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverOrganizationFilter');
  RemClassRegistry.RegisterXSClass(ENBindingOverOrganizationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverOrganizationShort');
  RemClassRegistry.RegisterXSClass(ENBindingOverOrganizationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBindingOverOrganizationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBindingOverOrganizationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBindingOverOrganizationShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBindingOverOrganizationControllerSoapPort), 'http://ksoe.org/ENBindingOverOrganizationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBindingOverOrganizationControllerSoapPort), 'http://ksoe.org/ENBindingOverOrganizationController/action/ENBindingOverOrganizationController.%operationName%');


end.
