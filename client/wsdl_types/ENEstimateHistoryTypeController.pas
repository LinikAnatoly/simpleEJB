unit ENEstimateHistoryTypeController;

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

  ENEstimateHistoryType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateHistoryTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateHistoryType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENEstimateHistoryTypeFilter = class(TRemotable)
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

  ENEstimateHistoryTypeFilter = class(ENEstimateHistoryType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateHistoryTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEstimateHistoryTypeShort = array of ENEstimateHistoryTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEstimateHistoryTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateHistoryTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateHistoryTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEstimateHistoryTypeController/message/
  // soapAction: http://ksoe.org/ENEstimateHistoryTypeController/action/ENEstimateHistoryTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEstimateHistoryTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEstimateHistoryTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEstimateHistoryTypeControllerSoapPort = interface(IInvokable)
  ['{377FB8F0-D8DA-4CBD-8B7B-73EB053E585D}']
    function add(const aENEstimateHistoryType: ENEstimateHistoryType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEstimateHistoryType: ENEstimateHistoryType); stdcall;
    function getObject(const anObjectCode: Integer): ENEstimateHistoryType; stdcall;
    function getList: ENEstimateHistoryTypeShortList; stdcall;
    function getFilteredList(const aENEstimateHistoryTypeFilter: ENEstimateHistoryTypeFilter): ENEstimateHistoryTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryTypeShortList; stdcall;
    function getScrollableFilteredList(const aENEstimateHistoryTypeFilter: ENEstimateHistoryTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateHistoryTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENEstimateHistoryTypeFilter: ENEstimateHistoryTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENEstimateHistoryTypeShort; stdcall;
  end;


implementation



  destructor ENEstimateHistoryTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEstimateHistoryType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryType');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryTypeRef');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryTypeFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryTypeShort');
  RemClassRegistry.RegisterXSClass(ENEstimateHistoryTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateHistoryTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateHistoryTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateHistoryTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEstimateHistoryTypeControllerSoapPort), 'http://ksoe.org/ENEstimateHistoryTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEstimateHistoryTypeControllerSoapPort), 'http://ksoe.org/ENEstimateHistoryTypeController/action/ENEstimateHistoryTypeController.%operationName%');


end.
