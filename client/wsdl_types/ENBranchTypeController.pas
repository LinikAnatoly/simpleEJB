unit ENBranchTypeController;

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

  ENBranchType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranchTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBranchType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENBranchTypeFilter = class(TRemotable)
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

  ENBranchTypeFilter = class(ENBranchType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENBranchTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENBranchTypeShort = array of ENBranchTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBranchTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBranchTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBranchTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBranchTypeController/message/
  // soapAction: http://ksoe.org/ENBranchTypeController/action/ENBranchTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBranchTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBranchTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBranchTypeControllerSoapPort = interface(IInvokable)
  ['{b0e8b0e8-b0e8-b0e8-b0e8-b0e8b0e8b0e8}']
    function  add(const aENBranchType: ENBranchType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBranchType: ENBranchType); stdcall;
    function  getObject(const anObjectCode: Integer): ENBranchType; stdcall;
    function  getList: ENBranchTypeShortList; stdcall;
    function  getFilteredList(const aENBranchTypeFilter: ENBranchTypeFilter): ENBranchTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBranchTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENBranchTypeFilter: ENBranchTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBranchTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBranchTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENBranchTypeFilter: ENBranchTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENBranchTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBranchType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchType');
  RemClassRegistry.RegisterXSClass(ENBranchTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchTypeRef');
  RemClassRegistry.RegisterXSClass(ENBranchTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchTypeFilter');
  RemClassRegistry.RegisterXSClass(ENBranchTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchTypeShort');
  RemClassRegistry.RegisterXSClass(ENBranchTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBranchTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBranchTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBranchTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBranchTypeControllerSoapPort), 'http://ksoe.org/ENBranchTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBranchTypeControllerSoapPort), 'http://ksoe.org/ENBranchTypeController/action/ENBranchTypeController.%operationName%');


end.
