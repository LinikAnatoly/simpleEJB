unit ENPlanWorkKindController;

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

  ENPlanWorkKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENPlanWorkKindFilter = class(TRemotable)
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


  ENPlanWorkKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPlanWorkKindShort = array of ENPlanWorkKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkKindShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkKindController/message/
  // soapAction: http://ksoe.org/ENPlanWorkKindController/action/ENPlanWorkKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkKindControllerSoapPort = interface(IInvokable)
  ['{13211321-1321-1321-1321-132113211321}']
    function  add(const aENPlanWorkKind: ENPlanWorkKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkKind: ENPlanWorkKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkKind; stdcall;
    function  getList: ENPlanWorkKindShortList; stdcall;
    function  getFilteredList(const aENPlanWorkKindFilter: ENPlanWorkKindFilter): ENPlanWorkKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkKindShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkKindFilter: ENPlanWorkKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkKindShortList; stdcall;
  end; 


implementation

  
  
  destructor ENPlanWorkKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkKind');
  RemClassRegistry.RegisterXSClass(ENPlanWorkKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkKindRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkKindFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkKindShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkKindControllerSoapPort), 'http://ksoe.org/ENPlanWorkKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkKindControllerSoapPort), 'http://ksoe.org/ENPlanWorkKindController/action/ENPlanWorkKindController.%operationName%');


end.
