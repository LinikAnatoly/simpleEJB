unit ENGroundTypeController;

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

  ENGroundType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGroundTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGroundType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENGroundTypeFilter = class(TRemotable)
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

  ENGroundTypeFilter = class(ENGroundType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENGroundTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENGroundTypeShort = array of ENGroundTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGroundTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGroundTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGroundTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGroundTypeController/message/
  // soapAction: http://ksoe.org/ENGroundTypeController/action/ENGroundTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGroundTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGroundTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGroundTypeControllerSoapPort = interface(IInvokable)
  ['{891d891d-891d-891d-891d-891d891d891d}']
    function  add(const aENGroundType: ENGroundType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGroundType: ENGroundType); stdcall;
    function  getObject(const anObjectCode: Integer): ENGroundType; stdcall;
    function  getList: ENGroundTypeShortList; stdcall;
    function  getFilteredList(const aENGroundTypeFilter: ENGroundTypeFilter): ENGroundTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGroundTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENGroundTypeFilter: ENGroundTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGroundTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGroundTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENGroundTypeFilter: ENGroundTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENGroundTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGroundType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGroundType');
  RemClassRegistry.RegisterXSClass(ENGroundTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGroundTypeRef');
  RemClassRegistry.RegisterXSClass(ENGroundTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGroundTypeFilter');
  RemClassRegistry.RegisterXSClass(ENGroundTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGroundTypeShort');
  RemClassRegistry.RegisterXSClass(ENGroundTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGroundTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGroundTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGroundTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGroundTypeControllerSoapPort), 'http://ksoe.org/ENGroundTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGroundTypeControllerSoapPort), 'http://ksoe.org/ENGroundTypeController/action/ENGroundTypeController.%operationName%');


end.
