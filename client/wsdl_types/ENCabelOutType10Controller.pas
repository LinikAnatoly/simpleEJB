unit ENCabelOutType10Controller;

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

  ENCabelOutType10            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOutType10Ref = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCabelOutType10 = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENCabelOutType10Filter = class(TRemotable)
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

  ENCabelOutType10Filter = class(ENCabelOutType10)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENCabelOutType10Short = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENCabelOutType10Short = array of ENCabelOutType10Short;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCabelOutType10ShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCabelOutType10Short;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCabelOutType10Short read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCabelOutType10Controller/message/
  // soapAction: http://ksoe.org/ENCabelOutType10Controller/action/ENCabelOutType10Controller.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCabelOutType10ControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCabelOutType10Controller
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCabelOutType10ControllerSoapPort = interface(IInvokable)
  ['{1fed1fed-1fed-1fed-1fed-1fed1fed1fed}']
    function  add(const aENCabelOutType10: ENCabelOutType10): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCabelOutType10: ENCabelOutType10); stdcall;
    function  getObject(const anObjectCode: Integer): ENCabelOutType10; stdcall;
    function  getList: ENCabelOutType10ShortList; stdcall;
    function  getFilteredList(const aENCabelOutType10Filter: ENCabelOutType10Filter): ENCabelOutType10ShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCabelOutType10ShortList; stdcall;
    function  getScrollableFilteredList(const aENCabelOutType10Filter: ENCabelOutType10Filter; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOutType10ShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCabelOutType10ShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENCabelOutType10Filter: ENCabelOutType10Filter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENCabelOutType10ShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCabelOutType10, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOutType10');
  RemClassRegistry.RegisterXSClass(ENCabelOutType10Ref, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOutType10Ref');
  RemClassRegistry.RegisterXSClass(ENCabelOutType10Filter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOutType10Filter');
  RemClassRegistry.RegisterXSClass(ENCabelOutType10Short, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOutType10Short');
  RemClassRegistry.RegisterXSClass(ENCabelOutType10ShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCabelOutType10ShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCabelOutType10Short), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCabelOutType10Short');

  InvRegistry.RegisterInterface(TypeInfo(ENCabelOutType10ControllerSoapPort), 'http://ksoe.org/ENCabelOutType10Controller/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCabelOutType10ControllerSoapPort), 'http://ksoe.org/ENCabelOutType10Controller/action/ENCabelOutType10Controller.%operationName%');


end.
