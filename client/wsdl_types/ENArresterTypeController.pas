unit ENArresterTypeController;

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

  ENArresterType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArresterTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArresterType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENArresterTypeFilter = class(TRemotable)
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

  ENArresterTypeFilter = class(ENArresterType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENArresterTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENArresterTypeShort = array of ENArresterTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENArresterTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENArresterTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENArresterTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENArresterTypeController/message/
  // soapAction: http://ksoe.org/ENArresterTypeController/action/ENArresterTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENArresterTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENArresterTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENArresterTypeControllerSoapPort = interface(IInvokable)
  ['{1f1f1f1f-1f1f-1f1f-1f1f-1f1f1f1f1f1f}']
    function  add(const aENArresterType: ENArresterType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENArresterType: ENArresterType); stdcall;
    function  getObject(const anObjectCode: Integer): ENArresterType; stdcall;
    function  getList: ENArresterTypeShortList; stdcall;
    function  getFilteredList(const aENArresterTypeFilter: ENArresterTypeFilter): ENArresterTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENArresterTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENArresterTypeFilter: ENArresterTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENArresterTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENArresterTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENArresterTypeFilter: ENArresterTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENArresterTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENArresterType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterType');
  RemClassRegistry.RegisterXSClass(ENArresterTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterTypeRef');
  RemClassRegistry.RegisterXSClass(ENArresterTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterTypeFilter');
  RemClassRegistry.RegisterXSClass(ENArresterTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterTypeShort');
  RemClassRegistry.RegisterXSClass(ENArresterTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENArresterTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENArresterTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENArresterTypeControllerSoapPort), 'http://ksoe.org/ENArresterTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENArresterTypeControllerSoapPort), 'http://ksoe.org/ENArresterTypeController/action/ENArresterTypeController.%operationName%');


end.
