unit SCOrderKindController;

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

  SCOrderKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrderKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCOrderKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  SCOrderKindFilter = class(TRemotable)
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

  SCOrderKindFilter = class(SCOrderKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCOrderKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfSCOrderKindShort = array of SCOrderKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCOrderKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCOrderKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCOrderKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCOrderKindController/message/
  // soapAction: http://ksoe.org/SCOrderKindController/action/SCOrderKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCOrderKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCOrderKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCOrderKindControllerSoapPort = interface(IInvokable)
  ['{8269B03B-709F-4C5E-B200-2F8BAD2A33F7}']
    function  add(const aSCOrderKind: SCOrderKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCOrderKind: SCOrderKind); stdcall;
    function  getObject(const anObjectCode: Integer): SCOrderKind; stdcall;
    function  getList: SCOrderKindShortList; stdcall;
    function  getFilteredList(const aSCOrderKindFilter: SCOrderKindFilter): SCOrderKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCOrderKindShortList; stdcall;
    function  getScrollableFilteredList(const aSCOrderKindFilter: SCOrderKindFilter; const aFromPosition: Integer; const aQuantity: Integer): SCOrderKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCOrderKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCOrderKindFilter: SCOrderKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor SCOrderKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCOrderKind, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderKind');
  RemClassRegistry.RegisterXSClass(SCOrderKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderKindRef');
  RemClassRegistry.RegisterXSClass(SCOrderKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderKindFilter');
  RemClassRegistry.RegisterXSClass(SCOrderKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderKindShort');
  RemClassRegistry.RegisterXSClass(SCOrderKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCOrderKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCOrderKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCOrderKindShort');

  InvRegistry.RegisterInterface(TypeInfo(SCOrderKindControllerSoapPort), 'http://ksoe.org/SCOrderKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCOrderKindControllerSoapPort), 'http://ksoe.org/SCOrderKindController/action/SCOrderKindController.%operationName%');


end.
