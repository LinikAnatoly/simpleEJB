unit ENMol2GeoDepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENMolController
   ,ENGeographicDepartmentController
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

  ENMol2GeoDepartment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMol2GeoDepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMol2GeoDepartment = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
//???
    Fmol : ENMol;
//???
    FgeoDepartment : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property mol : ENMol read Fmol write Fmol;
    property geoDepartment : ENGeographicDepartmentRef read FgeoDepartment write FgeoDepartment;
  end;

{
  ENMol2GeoDepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
//???
    Fmol : ENMol;
//???
    FgeoDepartment : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property mol : ENMol read Fmol write Fmol;
    property geoDepartment : ENGeographicDepartmentRef read FgeoDepartment write FgeoDepartment;
  end;
}

  ENMol2GeoDepartmentFilter = class(ENMol2GeoDepartment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMol2GeoDepartmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FmolCode : Integer;
    FmolFinCode : WideString;
    FmolName : WideString;
    FmolPhoneNumber : WideString;
    FmolTabNumber : WideString;
    FmolStorage : WideString;
    FgeoDepartmentCode : Integer;
    FgeoDepartmentName : WideString;
    FgeoDepartmentCommentgen : WideString;
    FgeoDepartmentUserAdd : WideString;
    FgeoDepartmentDateAdd : TXSDateTime;
    FgeoDepartmentUserGen : WideString;
    FgeoDepartmentDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property molCode : Integer read FmolCode write FmolCode;
    property molFinCode : WideString read FmolFinCode write FmolFinCode;
    property molName : WideString read FmolName write FmolName;
    property molPhoneNumber : WideString read FmolPhoneNumber write FmolPhoneNumber;
    property molTabNumber : WideString read FmolTabNumber write FmolTabNumber;
    property molStorage : WideString read FmolStorage write FmolStorage;
    property geoDepartmentCode : Integer read FgeoDepartmentCode write FgeoDepartmentCode;
    property geoDepartmentName : WideString read FgeoDepartmentName write FgeoDepartmentName;
    property geoDepartmentCommentgen : WideString read FgeoDepartmentCommentgen write FgeoDepartmentCommentgen;
    property geoDepartmentUserAdd : WideString read FgeoDepartmentUserAdd write FgeoDepartmentUserAdd;
    property geoDepartmentDateAdd : TXSDateTime read FgeoDepartmentDateAdd write FgeoDepartmentDateAdd;
    property geoDepartmentUserGen : WideString read FgeoDepartmentUserGen write FgeoDepartmentUserGen;
    property geoDepartmentDateEdit : TXSDateTime read FgeoDepartmentDateEdit write FgeoDepartmentDateEdit;
  end;

  ArrayOfENMol2GeoDepartmentShort = array of ENMol2GeoDepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMol2GeoDepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMol2GeoDepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMol2GeoDepartmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMol2GeoDepartmentController/message/
  // soapAction: http://ksoe.org/ENMol2GeoDepartmentController/action/ENMol2GeoDepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMol2GeoDepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMol2GeoDepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMol2GeoDepartmentControllerSoapPort = interface(IInvokable)
  ['{7F4A93E9-A391-4568-8A84-FF0D668DB5FC}']
    function add(const aENMol2GeoDepartment: ENMol2GeoDepartment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMol2GeoDepartment: ENMol2GeoDepartment); stdcall;
    function getObject(const anObjectCode: Integer): ENMol2GeoDepartment; stdcall;
    function getList: ENMol2GeoDepartmentShortList; stdcall;
    function getFilteredList(const aENMol2GeoDepartmentFilter: ENMol2GeoDepartmentFilter): ENMol2GeoDepartmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMol2GeoDepartmentShortList; stdcall;
    function getScrollableFilteredList(const aENMol2GeoDepartmentFilter: ENMol2GeoDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMol2GeoDepartmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMol2GeoDepartmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMol2GeoDepartmentFilter: ENMol2GeoDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMol2GeoDepartmentShort; stdcall;
  end;


implementation

  destructor ENMol2GeoDepartment.Destroy;
  begin
    if Assigned(Fmol) then
      mol.Free;
    if Assigned(FgeoDepartment) then
      geoDepartment.Free;
    inherited Destroy;
  end;

{
  destructor ENMol2GeoDepartmentFilter.Destroy;
  begin
    if Assigned(Fmol) then
      mol.Free;
    if Assigned(FgeoDepartment) then
      geoDepartment.Free;
    inherited Destroy;
  end;
}

  destructor ENMol2GeoDepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENMol2GeoDepartmentShort.Destroy;
  begin
    if Assigned(FgeoDepartmentDateAdd) then
      geoDepartmentDateAdd.Free;
    if Assigned(FgeoDepartmentDateEdit) then
      geoDepartmentDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENMol2GeoDepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMol2GeoDepartment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2GeoDepartment');
  RemClassRegistry.RegisterXSClass(ENMol2GeoDepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2GeoDepartmentRef');
  RemClassRegistry.RegisterXSClass(ENMol2GeoDepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2GeoDepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENMol2GeoDepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2GeoDepartmentShort');
  RemClassRegistry.RegisterXSClass(ENMol2GeoDepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2GeoDepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMol2GeoDepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMol2GeoDepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMol2GeoDepartmentControllerSoapPort), 'http://ksoe.org/ENMol2GeoDepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMol2GeoDepartmentControllerSoapPort), 'http://ksoe.org/ENMol2GeoDepartmentController/action/ENMol2GeoDepartmentController.%operationName%');


end.
