unit SCCounterKindController;

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

  SCCounterKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounterKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCCounterKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCCounterKindFilter = class(TRemotable)
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

  SCCounterKindFilter = class(SCCounterKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCCounterKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCCounterKindShort = array of SCCounterKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCCounterKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCCounterKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCCounterKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCCounterKindController/message/
  // soapAction: http://ksoe.org/SCCounterKindController/action/SCCounterKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCCounterKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCCounterKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCCounterKindControllerSoapPort = interface(IInvokable)
  ['{8b678b67-8b67-8b67-8b67-8b678b678b67}']
    function  add(const aSCCounterKind: SCCounterKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCCounterKind: SCCounterKind); stdcall;
    function  getObject(const anObjectCode: Integer): SCCounterKind; stdcall;
    function  getList: SCCounterKindShortList; stdcall;
    function  getFilteredList(const aSCCounterKindFilter: SCCounterKindFilter): SCCounterKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCCounterKindShortList; stdcall;
    function  getScrollableFilteredList(const aSCCounterKindFilter: SCCounterKindFilter; const aFromPosition: Integer; const aQuantity: Integer): SCCounterKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCCounterKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCCounterKindFilter: SCCounterKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCCounterKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCCounterKind, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterKind');
  RemClassRegistry.RegisterXSClass(SCCounterKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterKindRef');
  RemClassRegistry.RegisterXSClass(SCCounterKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterKindFilter');
  RemClassRegistry.RegisterXSClass(SCCounterKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterKindShort');
  RemClassRegistry.RegisterXSClass(SCCounterKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCCounterKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCCounterKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCCounterKindShort');

  InvRegistry.RegisterInterface(TypeInfo(SCCounterKindControllerSoapPort), 'http://ksoe.org/SCCounterKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCCounterKindControllerSoapPort), 'http://ksoe.org/SCCounterKindController/action/SCCounterKindController.%operationName%');


end.
