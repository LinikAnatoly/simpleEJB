unit ENStandTypeController;

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

  ENStandType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENStandType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
  end;
  
{
  ENStandTypeFilter = class(TRemotable)
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

  ENStandTypeFilter = class(ENStandType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENStandTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENStandTypeShort = array of ENStandTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENStandTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENStandTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENStandTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENStandTypeController/message/
  // soapAction: http://ksoe.org/ENStandTypeController/action/ENStandTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENStandTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENStandTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENStandTypeControllerSoapPort = interface(IInvokable)
  ['{b8ebb8eb-b8eb-b8eb-b8eb-b8ebb8ebb8eb}']
    function  add(const aENStandType: ENStandType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENStandType: ENStandType); stdcall;
    function  getObject(const anObjectCode: Integer): ENStandType; stdcall;
    function  getList: ENStandTypeShortList; stdcall;
    function  getFilteredList(const aENStandTypeFilter: ENStandTypeFilter): ENStandTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENStandTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENStandTypeFilter: ENStandTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENStandTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENStandTypeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENStandTypeFilter: ENStandTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation


  
  destructor ENStandTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENStandType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandType');
  RemClassRegistry.RegisterXSClass(ENStandTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandTypeRef');
  RemClassRegistry.RegisterXSClass(ENStandTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandTypeFilter');
  RemClassRegistry.RegisterXSClass(ENStandTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandTypeShort');
  RemClassRegistry.RegisterXSClass(ENStandTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENStandTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENStandTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENStandTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENStandTypeControllerSoapPort), 'http://ksoe.org/ENStandTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENStandTypeControllerSoapPort), 'http://ksoe.org/ENStandTypeController/action/ENStandTypeController.%operationName%');


end.
