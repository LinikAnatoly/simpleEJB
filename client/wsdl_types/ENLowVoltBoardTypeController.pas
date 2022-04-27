unit ENLowVoltBoardTypeController;

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

  ENLowVoltBoardType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLowVoltBoardTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLowVoltBoardType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENLowVoltBoardTypeFilter = class(TRemotable)
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

  ENLowVoltBoardTypeFilter = class(ENLowVoltBoardType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLowVoltBoardTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENLowVoltBoardTypeShort = array of ENLowVoltBoardTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLowVoltBoardTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLowVoltBoardTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLowVoltBoardTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLowVoltBoardTypeController/message/
  // soapAction: http://ksoe.org/ENLowVoltBoardTypeController/action/ENLowVoltBoardTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLowVoltBoardTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLowVoltBoardTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLowVoltBoardTypeControllerSoapPort = interface(IInvokable)
  ['{13d813d8-13d8-13d8-13d8-13d813d813d8}']
    function  add(const aENLowVoltBoardType: ENLowVoltBoardType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLowVoltBoardType: ENLowVoltBoardType); stdcall;
    function  getObject(const anObjectCode: Integer): ENLowVoltBoardType; stdcall;
    function  getList: ENLowVoltBoardTypeShortList; stdcall;
    function  getFilteredList(const aENLowVoltBoardTypeFilter: ENLowVoltBoardTypeFilter): ENLowVoltBoardTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENLowVoltBoardTypeFilter: ENLowVoltBoardTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLowVoltBoardTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLowVoltBoardTypeFilter: ENLowVoltBoardTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENLowVoltBoardTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLowVoltBoardType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardType');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardTypeRef');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardTypeFilter');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardTypeShort');
  RemClassRegistry.RegisterXSClass(ENLowVoltBoardTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLowVoltBoardTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLowVoltBoardTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLowVoltBoardTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLowVoltBoardTypeControllerSoapPort), 'http://ksoe.org/ENLowVoltBoardTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLowVoltBoardTypeControllerSoapPort), 'http://ksoe.org/ENLowVoltBoardTypeController/action/ENLowVoltBoardTypeController.%operationName%');


end.
