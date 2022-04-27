unit ENMolFuelMotionTypeController;

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

  ENMolFuelMotionType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolFuelMotionTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolFuelMotionType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENMolFuelMotionTypeFilter = class(TRemotable)
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

  ENMolFuelMotionTypeFilter = class(ENMolFuelMotionType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMolFuelMotionTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENMolFuelMotionTypeShort = array of ENMolFuelMotionTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMolFuelMotionTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMolFuelMotionTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMolFuelMotionTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMolFuelMotionTypeController/message/
  // soapAction: http://ksoe.org/ENMolFuelMotionTypeController/action/ENMolFuelMotionTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMolFuelMotionTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMolFuelMotionTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMolFuelMotionTypeControllerSoapPort = interface(IInvokable)
  ['{d0add0ad-d0ad-d0ad-d0ad-d0add0add0ad}']
    function add(const aENMolFuelMotionType: ENMolFuelMotionType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMolFuelMotionType: ENMolFuelMotionType); stdcall;
    function getObject(const anObjectCode: Integer): ENMolFuelMotionType; stdcall;
    function getList: ENMolFuelMotionTypeShortList; stdcall;
    function getFilteredList(const aENMolFuelMotionTypeFilter: ENMolFuelMotionTypeFilter): ENMolFuelMotionTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionTypeShortList; stdcall;
    function getScrollableFilteredList(const aENMolFuelMotionTypeFilter: ENMolFuelMotionTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMolFuelMotionTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMolFuelMotionTypeFilter: ENMolFuelMotionTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMolFuelMotionTypeShort; stdcall;
  end;


implementation



  destructor ENMolFuelMotionTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMolFuelMotionType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionType');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionTypeRef');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionTypeFilter');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionTypeShort');
  RemClassRegistry.RegisterXSClass(ENMolFuelMotionTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFuelMotionTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMolFuelMotionTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMolFuelMotionTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMolFuelMotionTypeControllerSoapPort), 'http://ksoe.org/ENMolFuelMotionTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMolFuelMotionTypeControllerSoapPort), 'http://ksoe.org/ENMolFuelMotionTypeController/action/ENMolFuelMotionTypeController.%operationName%');


end.
