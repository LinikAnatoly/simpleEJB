unit ENArresterSiteController;

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

  ENArresterSite            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArresterSiteRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENArresterSite = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENArresterSiteFilter = class(TRemotable)
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

  ENArresterSiteFilter = class(ENArresterSite)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENArresterSiteShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENArresterSiteShort = array of ENArresterSiteShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENArresterSiteShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENArresterSiteShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENArresterSiteShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENArresterSiteController/message/
  // soapAction: http://ksoe.org/ENArresterSiteController/action/ENArresterSiteController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENArresterSiteControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENArresterSiteController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENArresterSiteControllerSoapPort = interface(IInvokable)
  ['{17cb17cb-17cb-17cb-17cb-17cb17cb17cb}']
    function  add(const aENArresterSite: ENArresterSite): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENArresterSite: ENArresterSite); stdcall;
    function  getObject(const anObjectCode: Integer): ENArresterSite; stdcall;
    function  getList: ENArresterSiteShortList; stdcall;
    function  getFilteredList(const aENArresterSiteFilter: ENArresterSiteFilter): ENArresterSiteShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENArresterSiteShortList; stdcall;
    function  getScrollableFilteredList(const aENArresterSiteFilter: ENArresterSiteFilter; const aFromPosition: Integer; const aQuantity: Integer): ENArresterSiteShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENArresterSiteShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENArresterSiteFilter: ENArresterSiteFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENArresterSiteShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENArresterSite, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterSite');
  RemClassRegistry.RegisterXSClass(ENArresterSiteRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterSiteRef');
  RemClassRegistry.RegisterXSClass(ENArresterSiteFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterSiteFilter');
  RemClassRegistry.RegisterXSClass(ENArresterSiteShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterSiteShort');
  RemClassRegistry.RegisterXSClass(ENArresterSiteShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENArresterSiteShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENArresterSiteShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENArresterSiteShort');

  InvRegistry.RegisterInterface(TypeInfo(ENArresterSiteControllerSoapPort), 'http://ksoe.org/ENArresterSiteController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENArresterSiteControllerSoapPort), 'http://ksoe.org/ENArresterSiteController/action/ENArresterSiteController.%operationName%');


end.
