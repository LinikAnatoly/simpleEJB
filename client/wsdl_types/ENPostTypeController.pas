unit ENPostTypeController;

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

  ENPostType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPostTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPostType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENPostTypeFilter = class(TRemotable)
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
}

  ENPostTypeFilter = class(ENPostType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENPostTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENPostTypeShort = array of ENPostTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPostTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPostTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPostTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPostTypeController/message/
  // soapAction: http://ksoe.org/ENPostTypeController/action/ENPostTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPostTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPostTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPostTypeControllerSoapPort = interface(IInvokable)
  ['{1d861d86-1d86-1d86-1d86-1d861d861d86}']
    function  add(const aENPostType: ENPostType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPostType: ENPostType); stdcall;
    function  getObject(const anObjectCode: Integer): ENPostType; stdcall;
    function  getList: ENPostTypeShortList; stdcall;
    function  getFilteredList(const aENPostTypeFilter: ENPostTypeFilter): ENPostTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPostTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENPostTypeFilter: ENPostTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPostTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPostTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENPostTypeFilter: ENPostTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENPostTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPostType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostType');
  RemClassRegistry.RegisterXSClass(ENPostTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostTypeRef');
  RemClassRegistry.RegisterXSClass(ENPostTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostTypeFilter');
  RemClassRegistry.RegisterXSClass(ENPostTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostTypeShort');
  RemClassRegistry.RegisterXSClass(ENPostTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPostTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPostTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPostTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPostTypeControllerSoapPort), 'http://ksoe.org/ENPostTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPostTypeControllerSoapPort), 'http://ksoe.org/ENPostTypeController/action/ENPostTypeController.%operationName%');


end.
