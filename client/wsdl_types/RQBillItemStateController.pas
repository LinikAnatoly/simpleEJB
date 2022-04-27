unit RQBillItemStateController;

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

  RQBillItemState            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItemStateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItemState = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  RQBillItemStateFilter = class(TRemotable)
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


  RQBillItemStateShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQBillItemStateShort = array of RQBillItemStateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillItemStateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillItemStateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillItemStateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillItemStateController/message/
  // soapAction: http://ksoe.org/RQBillItemStateController/action/RQBillItemStateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillItemStateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillItemStateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillItemStateControllerSoapPort = interface(IInvokable)
  ['{fd18fd18-fd18-fd18-fd18-fd18fd18fd18}']
    function  add(const aRQBillItemState: RQBillItemState): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillItemState: RQBillItemState); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillItemState; stdcall;
    function  getList: RQBillItemStateShortList; stdcall;
    function  getFilteredList(const aRQBillItemStateFilter: RQBillItemStateFilter): RQBillItemStateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillItemStateShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillItemStateFilter: RQBillItemStateFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillItemStateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillItemStateShortList; stdcall;
  end; 


implementation

  
  
  destructor RQBillItemStateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillItemState, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemState');
  RemClassRegistry.RegisterXSClass(RQBillItemStateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemStateRef');
  RemClassRegistry.RegisterXSClass(RQBillItemStateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemStateFilter');
  RemClassRegistry.RegisterXSClass(RQBillItemStateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemStateShort');
  RemClassRegistry.RegisterXSClass(RQBillItemStateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItemStateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillItemStateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillItemStateShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillItemStateControllerSoapPort), 'http://ksoe.org/RQBillItemStateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillItemStateControllerSoapPort), 'http://ksoe.org/RQBillItemStateController/action/RQBillItemStateController.%operationName%');


end.
