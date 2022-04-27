unit FINMolController;

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

  FINMol            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMolRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINMol = class(TRemotable)
  private
    //Fid : Integer;
    Fid : WideString;
    Ftext : WideString;
    Fobj_id : Integer; 
    Fstate : Integer; 
    FaxReceiptBlocking : WideString;
    FaxIssueBlocking : WideString;
  published
    //property  id : Integer read Fid write Fid;
    property id : WideString read Fid write Fid;
    property text : WideString read Ftext write Ftext;
    property  obj_id : Integer read Fobj_id write Fobj_id; 
    property  state : Integer read Fstate write Fstate; 
    property axReceiptBlocking : WideString read FaxReceiptBlocking write FaxReceiptBlocking;
    property axIssueBlocking : WideString read FaxIssueBlocking write FaxIssueBlocking;
  end;

  FINMolFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    //Fid : Integer;
    Fid : WideString;
    Ftext : WideString;
    Fobj_id : Integer; 
    Fstate : Integer; 
    FaxReceiptBlocking : WideString;
    FaxIssueBlocking : WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    //property  id : Integer read Fid write Fid;
    property id : WideString read Fid write Fid;
    property text : WideString read Ftext write Ftext;
    property  obj_id : Integer read Fobj_id write Fobj_id; 
    property  state : Integer read Fstate write Fstate; 
    property axReceiptBlocking : WideString read FaxReceiptBlocking write FaxReceiptBlocking;
    property axIssueBlocking : WideString read FaxIssueBlocking write FaxIssueBlocking;
  end;


  FINMolShort = class(TRemotable)
  private
    //Fid : Integer;
    Fid : WideString;
    Ftext : WideString;
    Fobj_id : Integer; 
    Fstate : Integer; 
    FaxReceiptBlocking : WideString;
    FaxIssueBlocking : WideString;
  published
    //property  id : Integer read Fid write Fid;
    property id : WideString read Fid write Fid;
    property text : WideString read Ftext write Ftext;
    property  obj_id : Integer read Fobj_id write Fobj_id; 
    property  state : Integer read Fstate write Fstate; 
    property axReceiptBlocking : WideString read FaxReceiptBlocking write FaxReceiptBlocking;
    property axIssueBlocking : WideString read FaxIssueBlocking write FaxIssueBlocking;

  end;

  ArrayOfFINMolShort = array of FINMolShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINMolShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINMolShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINMolShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINMolController/message/
  // soapAction: http://ksoe.org/FINMolController/action/FINMolController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINMolControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINMolController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINMolControllerSoapPort = interface(IInvokable)
  ['{53CBBD30-9371-4F84-B221-A0511904F9B1}']
    function  add(const aFINMol: FINMol): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINMol: FINMol); stdcall;
    function  getObject(const anObjectCode: Integer): FINMol; stdcall;
    function  getList: FINMolShortList; stdcall;
    function  getFilteredList(const aFINMolFilter: FINMolFilter): FINMolShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINMolShortList; stdcall;
    function  getScrollableFilteredList(const aFINMolFilter: FINMolFilter; const aFromPosition: Integer; const aQuantity: Integer): FINMolShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINMolShortList; stdcall;
  end; 


implementation

  
  
  destructor FINMolShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINMol, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMol');
  RemClassRegistry.RegisterXSClass(FINMolRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolRef');
  RemClassRegistry.RegisterXSClass(FINMolFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolFilter');
  RemClassRegistry.RegisterXSClass(FINMolShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolShort');
  RemClassRegistry.RegisterXSClass(FINMolShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINMolShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINMolShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINMolShort');

  InvRegistry.RegisterInterface(TypeInfo(FINMolControllerSoapPort), 'http://ksoe.org/FINMolController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINMolControllerSoapPort), 'http://ksoe.org/FINMolController/action/FINMolController.%operationName%');


end.
