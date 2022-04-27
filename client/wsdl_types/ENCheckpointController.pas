unit ENCheckpointController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTransportDepartmentController
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

  ENCheckpoint            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpoint = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef;
  end;

{
  ENCheckpointFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef;
  end;
}

  ENCheckpointFilter = class(ENCheckpoint)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCheckpointShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FtransportDepartmentRefCode : Integer;
    FtransportDepartmentRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;

    property transportDepartmentRefCode : Integer read FtransportDepartmentRefCode write FtransportDepartmentRefCode;
    property transportDepartmentRefName : WideString read FtransportDepartmentRefName write FtransportDepartmentRefName;
  end;

  ArrayOfENCheckpointShort = array of ENCheckpointShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCheckpointShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCheckpointShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCheckpointShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCheckpointController/message/
  // soapAction: http://ksoe.org/ENCheckpointController/action/ENCheckpointController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCheckpointControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCheckpointController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCheckpointControllerSoapPort = interface(IInvokable)
  ['{22f922f9-22f9-22f9-22f9-22f922f922f9}']
    function add(const aENCheckpoint: ENCheckpoint): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCheckpoint: ENCheckpoint); stdcall;
    function getObject(const anObjectCode: Integer): ENCheckpoint; stdcall;
    function getList: ENCheckpointShortList; stdcall;
    function getFilteredList(const aENCheckpointFilter: ENCheckpointFilter): ENCheckpointShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointShortList; stdcall;
    function getScrollableFilteredList(const aENCheckpointFilter: ENCheckpointFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCheckpointFilter: ENCheckpointFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCheckpointShort; stdcall;
  end;


implementation

  destructor ENCheckpoint.Destroy;
  begin
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCheckpointFilter.Destroy;
  begin
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCheckpointFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor ENCheckpointShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCheckpoint, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpoint');
  RemClassRegistry.RegisterXSClass(ENCheckpointRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointRef');
  RemClassRegistry.RegisterXSClass(ENCheckpointFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointFilter');
  RemClassRegistry.RegisterXSClass(ENCheckpointShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointShort');
  RemClassRegistry.RegisterXSClass(ENCheckpointShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCheckpointShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCheckpointShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCheckpointControllerSoapPort), 'http://ksoe.org/ENCheckpointController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCheckpointControllerSoapPort), 'http://ksoe.org/ENCheckpointController/action/ENCheckpointController.%operationName%');


end.
