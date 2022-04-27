unit ENFuelInventarizationStatusController;

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

  ENFuelInventarizationStatus            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarizationStatusRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarizationStatus = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
  end;

{
  ENFuelInventarizationStatusFilter = class(TRemotable)
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

  ENFuelInventarizationStatusFilter = class(ENFuelInventarizationStatus)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelInventarizationStatusShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

  end;

  ArrayOfENFuelInventarizationStatusShort = array of ENFuelInventarizationStatusShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelInventarizationStatusShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelInventarizationStatusShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelInventarizationStatusShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelInventarizationStatusController/message/
  // soapAction: http://ksoe.org/ENFuelInventarizationStatusController/action/ENFuelInventarizationStatusController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelInventarizationStatusControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelInventarizationStatusController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelInventarizationStatusControllerSoapPort = interface(IInvokable)
 ['{DC836916-5453-445A-87B8-BED6D0308C6D}']
    function add(const aENFuelInventarizationStatus: ENFuelInventarizationStatus): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelInventarizationStatus: ENFuelInventarizationStatus); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelInventarizationStatus; stdcall;
    function getList: ENFuelInventarizationStatusShortList; stdcall;
    function getFilteredList(const aENFuelInventarizationStatusFilter: ENFuelInventarizationStatusFilter): ENFuelInventarizationStatusShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationStatusShortList; stdcall;
    function getScrollableFilteredList(const aENFuelInventarizationStatusFilter: ENFuelInventarizationStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationStatusShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationStatusShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelInventarizationStatusFilter: ENFuelInventarizationStatusFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelInventarizationStatusShort; stdcall;
  end;


implementation



  destructor ENFuelInventarizationStatusShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelInventarizationStatus, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationStatus');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationStatusRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationStatusRef');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationStatusFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationStatusFilter');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationStatusShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationStatusShort');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationStatusShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationStatusShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelInventarizationStatusShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelInventarizationStatusShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelInventarizationStatusControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationStatusController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelInventarizationStatusControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationStatusController/action/ENFuelInventarizationStatusController.%operationName%');


end.
