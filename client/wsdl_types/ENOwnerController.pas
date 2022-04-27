unit ENOwnerController;

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

  ENOwner            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOwnerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENOwner = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENOwnerFilter = class(TRemotable)
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


  ENOwnerShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENOwnerShort = array of ENOwnerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENOwnerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENOwnerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENOwnerShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENOwnerController/message/
  // soapAction: http://ksoe.org/ENOwnerController/action/ENOwnerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENOwnerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENOwnerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENOwnerControllerSoapPort = interface(IInvokable)
  ['{55855585-5585-5585-5585-558555855585}']
    function  add(const aENOwner: ENOwner): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENOwner: ENOwner); stdcall;
    function  getObject(const anObjectCode: Integer): ENOwner; stdcall;
    function  getList: ENOwnerShortList; stdcall;
    function  getFilteredList(const aENOwnerFilter: ENOwnerFilter): ENOwnerShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENOwnerShortList; stdcall;
    function  getScrollableFilteredList(const aENOwnerFilter: ENOwnerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENOwnerShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENOwnerShortList; stdcall;
  end; 


implementation

  
  
  destructor ENOwnerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENOwner, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOwner');
  RemClassRegistry.RegisterXSClass(ENOwnerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOwnerRef');
  RemClassRegistry.RegisterXSClass(ENOwnerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOwnerFilter');
  RemClassRegistry.RegisterXSClass(ENOwnerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOwnerShort');
  RemClassRegistry.RegisterXSClass(ENOwnerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENOwnerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENOwnerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENOwnerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENOwnerControllerSoapPort), 'http://ksoe.org/ENOwnerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENOwnerControllerSoapPort), 'http://ksoe.org/ENOwnerController/action/ENOwnerController.%operationName%');


end.
