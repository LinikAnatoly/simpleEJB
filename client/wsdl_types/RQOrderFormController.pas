unit RQOrderFormController;

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

  RQOrderForm            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderFormRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderForm = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQOrderFormFilter = class(TRemotable)
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


  RQOrderFormShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQOrderFormShort = array of RQOrderFormShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderFormShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderFormShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderFormShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderFormController/message/
  // soapAction: http://ksoe.org/RQOrderFormController/action/RQOrderFormController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderFormControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderFormController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderFormControllerSoapPort = interface(IInvokable)
  ['{3f3f3f3f-3f3f-3f3f-3f3f-3f3f3f3f3f3f}']
    function  add(const aRQOrderForm: RQOrderForm): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderForm: RQOrderForm); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderForm; stdcall;
    function  getList: RQOrderFormShortList; stdcall;
    function  getFilteredList(const aRQOrderFormFilter: RQOrderFormFilter): RQOrderFormShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderFormShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderFormFilter: RQOrderFormFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderFormShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderFormShortList; stdcall;
  end; 


implementation

  
  
  destructor RQOrderFormShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderForm, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderForm');
  RemClassRegistry.RegisterXSClass(RQOrderFormRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderFormRef');
  RemClassRegistry.RegisterXSClass(RQOrderFormFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderFormFilter');
  RemClassRegistry.RegisterXSClass(RQOrderFormShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderFormShort');
  RemClassRegistry.RegisterXSClass(RQOrderFormShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderFormShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderFormShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderFormShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderFormControllerSoapPort), 'http://ksoe.org/RQOrderFormController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderFormControllerSoapPort), 'http://ksoe.org/RQOrderFormController/action/RQOrderFormController.%operationName%');


end.
