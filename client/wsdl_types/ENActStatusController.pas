unit ENActStatusController;

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

  ENActStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActStatus = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENActStatusFilter = class(TRemotable)
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


  ENActStatusShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENActStatusShort = array of ENActStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActStatusShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActStatusController/message/
  // soapAction: http://ksoe.org/ENActStatusController/action/ENActStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActStatusControllerSoapPort = interface(IInvokable)
  ['{d6eed6ee-d6ee-d6ee-d6ee-d6eed6eed6ee}']
    function  add(const aENActStatus: ENActStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActStatus: ENActStatus); stdcall;
    function  getObject(const anObjectCode: Integer): ENActStatus; stdcall;
    function  getList: ENActStatusShortList; stdcall;
    function  getFilteredList(const aENActStatusFilter: ENActStatusFilter): ENActStatusShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActStatusShortList; stdcall;
    function  getScrollableFilteredList(const aENActStatusFilter: ENActStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActStatusShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActStatusShortList; stdcall;
  end; 


implementation

  
  
  destructor ENActStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActStatus');
  RemClassRegistry.RegisterXSClass(ENActStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActStatusRef');
  RemClassRegistry.RegisterXSClass(ENActStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActStatusFilter');
  RemClassRegistry.RegisterXSClass(ENActStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActStatusShort');
  RemClassRegistry.RegisterXSClass(ENActStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActStatusControllerSoapPort), 'http://ksoe.org/ENActStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActStatusControllerSoapPort), 'http://ksoe.org/ENActStatusController/action/ENActStatusController.%operationName%');


end.
