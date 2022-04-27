unit ENPurchasesObjectReasonController;

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

  ENPurchasesObjectReason            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesObjectReasonRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPurchasesObjectReason = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPurchasesObjectReasonFilter = class(TRemotable)
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


  ENPurchasesObjectReasonShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPurchasesObjectReasonShort = array of ENPurchasesObjectReasonShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPurchasesObjectReasonShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPurchasesObjectReasonShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPurchasesObjectReasonShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPurchasesObjectReasonController/message/
  // soapAction: http://ksoe.org/ENPurchasesObjectReasonController/action/ENPurchasesObjectReasonController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPurchasesObjectReasonControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPurchasesObjectReasonController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPurchasesObjectReasonControllerSoapPort = interface(IInvokable)
  ['{3f4e3f4e-3f4e-3f4e-3f4e-3f4e3f4e3f4e}']
    function  add(const aENPurchasesObjectReason: ENPurchasesObjectReason): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPurchasesObjectReason: ENPurchasesObjectReason); stdcall;
    function  getObject(const anObjectCode: Integer): ENPurchasesObjectReason; stdcall;
    function  getList: ENPurchasesObjectReasonShortList; stdcall;
    function  getFilteredList(const aENPurchasesObjectReasonFilter: ENPurchasesObjectReasonFilter): ENPurchasesObjectReasonShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectReasonShortList; stdcall;
    function  getScrollableFilteredList(const aENPurchasesObjectReasonFilter: ENPurchasesObjectReasonFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectReasonShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPurchasesObjectReasonShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPurchasesObjectReasonShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPurchasesObjectReason, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectReason');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectReasonRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectReasonRef');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectReasonFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectReasonFilter');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectReasonShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectReasonShort');
  RemClassRegistry.RegisterXSClass(ENPurchasesObjectReasonShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPurchasesObjectReasonShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPurchasesObjectReasonShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPurchasesObjectReasonShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPurchasesObjectReasonControllerSoapPort), 'http://ksoe.org/ENPurchasesObjectReasonController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPurchasesObjectReasonControllerSoapPort), 'http://ksoe.org/ENPurchasesObjectReasonController/action/ENPurchasesObjectReasonController.%operationName%');


end.
