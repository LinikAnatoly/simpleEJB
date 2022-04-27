unit ENConnectionLevelController;

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

  ENConnectionLevel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLevelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionLevel = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENConnectionLevelFilter = class(TRemotable)
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

  ENConnectionLevelFilter = class(ENConnectionLevel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENConnectionLevelShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENConnectionLevelShort = array of ENConnectionLevelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionLevelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionLevelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionLevelShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionLevelController/message/
  // soapAction: http://ksoe.org/ENConnectionLevelController/action/ENConnectionLevelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionLevelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionLevelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionLevelControllerSoapPort = interface(IInvokable)
  ['{94046B99-8B1A-45DC-A0F5-5C252FF87E89}']
    function  add(const aENConnectionLevel: ENConnectionLevel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionLevel: ENConnectionLevel); stdcall;
    function  getObject(const anObjectCode: Integer): ENConnectionLevel; stdcall;
    function  getList: ENConnectionLevelShortList; stdcall;
    function  getFilteredList(const aENConnectionLevelFilter: ENConnectionLevelFilter): ENConnectionLevelShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLevelShortList; stdcall;
    function  getScrollableFilteredList(const aENConnectionLevelFilter: ENConnectionLevelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLevelShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionLevelShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENConnectionLevelFilter: ENConnectionLevelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENConnectionLevelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionLevel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLevel');
  RemClassRegistry.RegisterXSClass(ENConnectionLevelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLevelRef');
  RemClassRegistry.RegisterXSClass(ENConnectionLevelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLevelFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionLevelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLevelShort');
  RemClassRegistry.RegisterXSClass(ENConnectionLevelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionLevelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionLevelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionLevelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionLevelControllerSoapPort), 'http://ksoe.org/ENConnectionLevelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionLevelControllerSoapPort), 'http://ksoe.org/ENConnectionLevelController/action/ENConnectionLevelController.%operationName%');


end.
