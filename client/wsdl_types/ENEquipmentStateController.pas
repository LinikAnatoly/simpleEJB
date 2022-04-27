unit ENEquipmentStateController;

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

  ENEquipmentState            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEquipmentStateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEquipmentState = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENEquipmentStateFilter = class(TRemotable)
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

  ENEquipmentStateFilter = class(ENEquipmentState)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEquipmentStateShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENEquipmentStateShort = array of ENEquipmentStateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENEquipmentStateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEquipmentStateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEquipmentStateShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENEquipmentStateController/message/
  // soapAction: http://ksoe.org/ENEquipmentStateController/action/ENEquipmentStateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENEquipmentStateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENEquipmentStateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENEquipmentStateControllerSoapPort = interface(IInvokable)
  ['{6093C5EC-7D40-4373-8A0A-6A04BF2EE781}']
    function add(const aENEquipmentState: ENEquipmentState): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENEquipmentState: ENEquipmentState); stdcall;
    function getObject(const anObjectCode: Integer): ENEquipmentState; stdcall;
    function getList: ENEquipmentStateShortList; stdcall;
    function getFilteredList(const aENEquipmentStateFilter: ENEquipmentStateFilter): ENEquipmentStateShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENEquipmentStateShortList; stdcall;
    function getScrollableFilteredList(const aENEquipmentStateFilter: ENEquipmentStateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEquipmentStateShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENEquipmentStateShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENEquipmentStateFilter: ENEquipmentStateFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENEquipmentStateShort; stdcall;
  end;


implementation



  destructor ENEquipmentStateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENEquipmentState, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEquipmentState');
  RemClassRegistry.RegisterXSClass(ENEquipmentStateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEquipmentStateRef');
  RemClassRegistry.RegisterXSClass(ENEquipmentStateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEquipmentStateFilter');
  RemClassRegistry.RegisterXSClass(ENEquipmentStateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEquipmentStateShort');
  RemClassRegistry.RegisterXSClass(ENEquipmentStateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEquipmentStateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEquipmentStateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEquipmentStateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENEquipmentStateControllerSoapPort), 'http://ksoe.org/ENEquipmentStateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENEquipmentStateControllerSoapPort), 'http://ksoe.org/ENEquipmentStateController/action/ENEquipmentStateController.%operationName%');


end.
