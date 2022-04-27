unit ENTravelSheetFuelTypeController;

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

  ENTravelSheetFuelType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelType = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENTravelSheetFuelTypeFilter = class(TRemotable)
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

  ENTravelSheetFuelTypeFilter = class(ENTravelSheetFuelType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTravelSheetFuelTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENTravelSheetFuelTypeShort = array of ENTravelSheetFuelTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetFuelTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetFuelTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetFuelTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetFuelTypeController/message/
  // soapAction: http://ksoe.org/ENTravelSheetFuelTypeController/action/ENTravelSheetFuelTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetFuelTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetFuelTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetFuelTypeControllerSoapPort = interface(IInvokable)
  ['{4d5f4d5f-4d5f-4d5f-4d5f-4d5f4d5f4d5f}']
    function add(const aENTravelSheetFuelType: ENTravelSheetFuelType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetFuelType: ENTravelSheetFuelType); stdcall;
    function getObject(const anObjectCode: Integer): ENTravelSheetFuelType; stdcall;
    function getList: ENTravelSheetFuelTypeShortList; stdcall;
    function getFilteredList(const aENTravelSheetFuelTypeFilter: ENTravelSheetFuelTypeFilter): ENTravelSheetFuelTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelTypeShortList; stdcall;
    function getScrollableFilteredList(const aENTravelSheetFuelTypeFilter: ENTravelSheetFuelTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTravelSheetFuelTypeFilter: ENTravelSheetFuelTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTravelSheetFuelTypeShort; stdcall;
  end;


implementation



  destructor ENTravelSheetFuelTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelType');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelTypeRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelTypeFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelTypeShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetFuelTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetFuelTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetFuelTypeControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetFuelTypeControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelTypeController/action/ENTravelSheetFuelTypeController.%operationName%');


end.
