unit ENBelongingController;

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

  ENBelonging            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBelongingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBelonging = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;

  ENBelongingFilter = class(TRemotable)
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


  ENBelongingShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBelongingShort = array of ENBelongingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBelongingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBelongingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBelongingShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBelongingController/message/
  // soapAction: http://ksoe.org/ENBelongingController/action/ENBelongingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBelongingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBelongingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBelongingControllerSoapPort = interface(IInvokable)
  ['{16521652-1652-1652-1652-165216521652}']
    function  add(const aENBelonging: ENBelonging): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBelonging: ENBelonging); stdcall;
    function  getObject(const anObjectCode: Integer): ENBelonging; stdcall;
    function  getList: ENBelongingShortList; stdcall;
    function  getFilteredList(const aENBelongingFilter: ENBelongingFilter): ENBelongingShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBelongingShortList; stdcall;
    function  getScrollableFilteredList(const aENBelongingFilter: ENBelongingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBelongingShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBelongingShortList; stdcall;
  end; 


implementation

  
  
  destructor ENBelongingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBelonging, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBelonging');
  RemClassRegistry.RegisterXSClass(ENBelongingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBelongingRef');
  RemClassRegistry.RegisterXSClass(ENBelongingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBelongingFilter');
  RemClassRegistry.RegisterXSClass(ENBelongingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBelongingShort');
  RemClassRegistry.RegisterXSClass(ENBelongingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBelongingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBelongingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBelongingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBelongingControllerSoapPort), 'http://ksoe.org/ENBelongingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBelongingControllerSoapPort), 'http://ksoe.org/ENBelongingController/action/ENBelongingController.%operationName%');


end.
