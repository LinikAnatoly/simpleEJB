unit ENBasisTypeController;

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

  ENBasisType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBasisTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBasisType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENBasisTypeFilter = class(TRemotable)
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

  ENBasisTypeFilter = class(ENBasisType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBasisTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBasisTypeShort = array of ENBasisTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBasisTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBasisTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBasisTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBasisTypeController/message/
  // soapAction: http://ksoe.org/ENBasisTypeController/action/ENBasisTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBasisTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBasisTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBasisTypeControllerSoapPort = interface(IInvokable)
  ['{10de10de-10de-10de-10de-10de10de10de}']
    function  add(const aENBasisType: ENBasisType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBasisType: ENBasisType); stdcall;
    function  getObject(const anObjectCode: Integer): ENBasisType; stdcall;
    function  getList: ENBasisTypeShortList; stdcall;
    function  getFilteredList(const aENBasisTypeFilter: ENBasisTypeFilter): ENBasisTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBasisTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENBasisTypeFilter: ENBasisTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBasisTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBasisTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBasisTypeFilter: ENBasisTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENBasisTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBasisType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBasisType');
  RemClassRegistry.RegisterXSClass(ENBasisTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBasisTypeRef');
  RemClassRegistry.RegisterXSClass(ENBasisTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBasisTypeFilter');
  RemClassRegistry.RegisterXSClass(ENBasisTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBasisTypeShort');
  RemClassRegistry.RegisterXSClass(ENBasisTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBasisTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBasisTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBasisTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBasisTypeControllerSoapPort), 'http://ksoe.org/ENBasisTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBasisTypeControllerSoapPort), 'http://ksoe.org/ENBasisTypeController/action/ENBasisTypeController.%operationName%');


end.
