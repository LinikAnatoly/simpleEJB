unit RQFKOrderRemainderTypeController;

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

  RQFKOrderRemainderType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderRemainderTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderRemainderType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  RQFKOrderRemainderTypeFilter = class(TRemotable)
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

  RQFKOrderRemainderTypeFilter = class(RQFKOrderRemainderType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderRemainderTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfRQFKOrderRemainderTypeShort = array of RQFKOrderRemainderTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderRemainderTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderRemainderTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderRemainderTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderRemainderTypeController/message/
  // soapAction: http://ksoe.org/RQFKOrderRemainderTypeController/action/RQFKOrderRemainderTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderRemainderTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderRemainderTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderRemainderTypeControllerSoapPort = interface(IInvokable)
  ['{1c091c09-1c09-1c09-1c09-1c091c091c09}']
    function  add(const aRQFKOrderRemainderType: RQFKOrderRemainderType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderRemainderType: RQFKOrderRemainderType); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderRemainderType; stdcall;
    function  getList: RQFKOrderRemainderTypeShortList; stdcall;
    function  getFilteredList(const aRQFKOrderRemainderTypeFilter: RQFKOrderRemainderTypeFilter): RQFKOrderRemainderTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderRemainderTypeShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderRemainderTypeFilter: RQFKOrderRemainderTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderRemainderTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderRemainderTypeShortList; stdcall;
  end; 


implementation


  
  destructor RQFKOrderRemainderTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderRemainderType, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRemainderType');
  RemClassRegistry.RegisterXSClass(RQFKOrderRemainderTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRemainderTypeRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderRemainderTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRemainderTypeFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderRemainderTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRemainderTypeShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderRemainderTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderRemainderTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderRemainderTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderRemainderTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderRemainderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrderRemainderTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderRemainderTypeControllerSoapPort), 'http://ksoe.org/RQFKOrderRemainderTypeController/action/RQFKOrderRemainderTypeController.%operationName%');


end.
