unit ENResponsiblesKindController;

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

  ENResponsiblesKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsiblesKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENResponsiblesKind = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENResponsiblesKindFilter = class(TRemotable)
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

  ENResponsiblesKindFilter = class(ENResponsiblesKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENResponsiblesKindShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENResponsiblesKindShort = array of ENResponsiblesKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENResponsiblesKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENResponsiblesKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENResponsiblesKindShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENResponsiblesKindController/message/
  // soapAction: http://ksoe.org/ENResponsiblesKindController/action/ENResponsiblesKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENResponsiblesKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENResponsiblesKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENResponsiblesKindControllerSoapPort = interface(IInvokable)
  ['{18f318f3-18f3-18f3-18f3-18f318f318f3}']
    function  add(const aENResponsiblesKind: ENResponsiblesKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENResponsiblesKind: ENResponsiblesKind); stdcall;
    function  getObject(const anObjectCode: Integer): ENResponsiblesKind; stdcall;
    function  getList: ENResponsiblesKindShortList; stdcall;
    function  getFilteredList(const aENResponsiblesKindFilter: ENResponsiblesKindFilter): ENResponsiblesKindShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesKindShortList; stdcall;
    function  getScrollableFilteredList(const aENResponsiblesKindFilter: ENResponsiblesKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesKindShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENResponsiblesKindShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENResponsiblesKindFilter: ENResponsiblesKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENResponsiblesKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENResponsiblesKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesKind');
  RemClassRegistry.RegisterXSClass(ENResponsiblesKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesKindRef');
  RemClassRegistry.RegisterXSClass(ENResponsiblesKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesKindFilter');
  RemClassRegistry.RegisterXSClass(ENResponsiblesKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesKindShort');
  RemClassRegistry.RegisterXSClass(ENResponsiblesKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENResponsiblesKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENResponsiblesKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENResponsiblesKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENResponsiblesKindControllerSoapPort), 'http://ksoe.org/ENResponsiblesKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENResponsiblesKindControllerSoapPort), 'http://ksoe.org/ENResponsiblesKindController/action/ENResponsiblesKindController.%operationName%');


end.
