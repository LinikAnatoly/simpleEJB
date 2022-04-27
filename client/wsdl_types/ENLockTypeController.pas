unit ENLockTypeController;

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

  ENLockType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLockTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLockType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENLockTypeFilter = class(TRemotable)
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

  ENLockTypeFilter = class(ENLockType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLockTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENLockTypeShort = array of ENLockTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLockTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLockTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLockTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLockTypeController/message/
  // soapAction: http://ksoe.org/ENLockTypeController/action/ENLockTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLockTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLockTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLockTypeControllerSoapPort = interface(IInvokable)
  ['{42364236-4236-4236-4236-423642364236}']
    function  add(const aENLockType: ENLockType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLockType: ENLockType); stdcall;
    function  getObject(const anObjectCode: Integer): ENLockType; stdcall;
    function  getList: ENLockTypeShortList; stdcall;
    function  getFilteredList(const aENLockTypeFilter: ENLockTypeFilter): ENLockTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLockTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENLockTypeFilter: ENLockTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLockTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLockTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLockTypeFilter: ENLockTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENLockTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLockType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLockType');
  RemClassRegistry.RegisterXSClass(ENLockTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLockTypeRef');
  RemClassRegistry.RegisterXSClass(ENLockTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLockTypeFilter');
  RemClassRegistry.RegisterXSClass(ENLockTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLockTypeShort');
  RemClassRegistry.RegisterXSClass(ENLockTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLockTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLockTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLockTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLockTypeControllerSoapPort), 'http://ksoe.org/ENLockTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLockTypeControllerSoapPort), 'http://ksoe.org/ENLockTypeController/action/ENLockTypeController.%operationName%');


end.
