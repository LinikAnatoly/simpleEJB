unit SCUsageInputItemKindController;

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

  SCUsageInputItemKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCUsageInputItemKindFilter = class(TRemotable)
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

  SCUsageInputItemKindFilter = class(SCUsageInputItemKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputItemKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCUsageInputItemKindShort = array of SCUsageInputItemKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemKindController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemKindController/action/SCUsageInputItemKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemKindControllerSoapPort = interface(IInvokable)
  ['{9a429a42-9a42-9a42-9a42-9a429a429a42}']
    function  add(const aSCUsageInputItemKind: SCUsageInputItemKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItemKind: SCUsageInputItemKind); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputItemKind; stdcall;
    function  getList: SCUsageInputItemKindShortList; stdcall;
    function  getFilteredList(const aSCUsageInputItemKindFilter: SCUsageInputItemKindFilter): SCUsageInputItemKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemKindShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputItemKindFilter: SCUsageInputItemKindFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputItemKindFilter: SCUsageInputItemKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCUsageInputItemKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItemKind, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemKind');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemKindRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemKindFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemKindShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemKindShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemKindControllerSoapPort), 'http://ksoe.org/SCUsageInputItemKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemKindControllerSoapPort), 'http://ksoe.org/SCUsageInputItemKindController/action/SCUsageInputItemKindController.%operationName%');


end.
