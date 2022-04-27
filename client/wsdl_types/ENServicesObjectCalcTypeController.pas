unit ENServicesObjectCalcTypeController;

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

  ENServicesObjectCalcType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectCalcTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesObjectCalcType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENServicesObjectCalcTypeFilter = class(TRemotable)
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

  ENServicesObjectCalcTypeFilter = class(ENServicesObjectCalcType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesObjectCalcTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENServicesObjectCalcTypeShort = array of ENServicesObjectCalcTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesObjectCalcTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesObjectCalcTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesObjectCalcTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesObjectCalcTypeController/message/
  // soapAction: http://ksoe.org/ENServicesObjectCalcTypeController/action/ENServicesObjectCalcTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesObjectCalcTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesObjectCalcTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesObjectCalcTypeControllerSoapPort = interface(IInvokable)
  ['{2a6f2a6f-2a6f-2a6f-2a6f-2a6f2a6f2a6f}']
    function add(const aENServicesObjectCalcType: ENServicesObjectCalcType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesObjectCalcType: ENServicesObjectCalcType); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesObjectCalcType; stdcall;
    function getList: ENServicesObjectCalcTypeShortList; stdcall;
    function getFilteredList(const aENServicesObjectCalcTypeFilter: ENServicesObjectCalcTypeFilter): ENServicesObjectCalcTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectCalcTypeShortList; stdcall;
    function getScrollableFilteredList(const aENServicesObjectCalcTypeFilter: ENServicesObjectCalcTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectCalcTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesObjectCalcTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesObjectCalcTypeFilter: ENServicesObjectCalcTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesObjectCalcTypeShort; stdcall;
  end;


implementation



  destructor ENServicesObjectCalcTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesObjectCalcType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectCalcType');
  RemClassRegistry.RegisterXSClass(ENServicesObjectCalcTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectCalcTypeRef');
  RemClassRegistry.RegisterXSClass(ENServicesObjectCalcTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectCalcTypeFilter');
  RemClassRegistry.RegisterXSClass(ENServicesObjectCalcTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectCalcTypeShort');
  RemClassRegistry.RegisterXSClass(ENServicesObjectCalcTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesObjectCalcTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesObjectCalcTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesObjectCalcTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesObjectCalcTypeControllerSoapPort), 'http://ksoe.org/ENServicesObjectCalcTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesObjectCalcTypeControllerSoapPort), 'http://ksoe.org/ENServicesObjectCalcTypeController/action/ENServicesObjectCalcTypeController.%operationName%');


end.
