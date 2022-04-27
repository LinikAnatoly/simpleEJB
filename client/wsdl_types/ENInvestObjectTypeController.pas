unit ENInvestObjectTypeController;

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

  ENInvestObjectType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestObjectTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestObjectType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENInvestObjectTypeFilter = class(TRemotable)
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

  ENInvestObjectTypeFilter = class(ENInvestObjectType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInvestObjectTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENInvestObjectTypeShort = array of ENInvestObjectTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestObjectTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestObjectTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestObjectTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestObjectTypeController/message/
  // soapAction: http://ksoe.org/ENInvestObjectTypeController/action/ENInvestObjectTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestObjectTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestObjectTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestObjectTypeControllerSoapPort = interface(IInvokable)
  ['{14491449-1449-1449-1449-144914491449}']
    function add(const aENInvestObjectType: ENInvestObjectType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestObjectType: ENInvestObjectType); stdcall;
    function getObject(const anObjectCode: Integer): ENInvestObjectType; stdcall;
    function getList: ENInvestObjectTypeShortList; stdcall;
    function getFilteredList(const aENInvestObjectTypeFilter: ENInvestObjectTypeFilter): ENInvestObjectTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestObjectTypeShortList; stdcall;
    function getScrollableFilteredList(const aENInvestObjectTypeFilter: ENInvestObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestObjectTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestObjectTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInvestObjectTypeFilter: ENInvestObjectTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInvestObjectTypeShort; stdcall;
  end;


implementation



  destructor ENInvestObjectTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestObjectType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestObjectType');
  RemClassRegistry.RegisterXSClass(ENInvestObjectTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestObjectTypeRef');
  RemClassRegistry.RegisterXSClass(ENInvestObjectTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestObjectTypeFilter');
  RemClassRegistry.RegisterXSClass(ENInvestObjectTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestObjectTypeShort');
  RemClassRegistry.RegisterXSClass(ENInvestObjectTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestObjectTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestObjectTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestObjectTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestObjectTypeControllerSoapPort), 'http://ksoe.org/ENInvestObjectTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestObjectTypeControllerSoapPort), 'http://ksoe.org/ENInvestObjectTypeController/action/ENInvestObjectTypeController.%operationName%');


end.
