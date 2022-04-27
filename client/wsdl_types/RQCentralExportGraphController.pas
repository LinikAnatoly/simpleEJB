unit RQCentralExportGraphController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,RQCentralExportGraphTypeController
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

  RQCentralExportGraph            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraphRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQCentralExportGraph = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
//???
    Fdepartment : ENDepartmentRef;
//???
    FexportGraphType : RQCentralExportGraphTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property exportGraphType : RQCentralExportGraphTypeRef read FexportGraphType write FexportGraphType;
  end;

{
  RQCentralExportGraphFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
//???
    Fdepartment : ENDepartmentRef;
//???
    FexportGraphType : RQCentralExportGraphTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property exportGraphType : RQCentralExportGraphTypeRef read FexportGraphType write FexportGraphType;
  end;
}

  RQCentralExportGraphFilter = class(RQCentralExportGraph)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQCentralExportGraphShort = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FexportGraphTypeCode : Integer;
    FexportGraphTypeName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property exportGraphTypeCode : Integer read FexportGraphTypeCode write FexportGraphTypeCode;
    property exportGraphTypeName : WideString read FexportGraphTypeName write FexportGraphTypeName;
  end;

  ArrayOfRQCentralExportGraphShort = array of RQCentralExportGraphShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQCentralExportGraphShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQCentralExportGraphShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQCentralExportGraphShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQCentralExportGraphController/message/
  // soapAction: http://ksoe.org/RQCentralExportGraphController/action/RQCentralExportGraphController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQCentralExportGraphControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQCentralExportGraphController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQCentralExportGraphControllerSoapPort = interface(IInvokable)
  ['{2907B941-EFF5-40E3-9C6B-2030180A1B5A}']
    function add(const aRQCentralExportGraph: RQCentralExportGraph): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQCentralExportGraph: RQCentralExportGraph); stdcall;
    function getObject(const anObjectCode: Integer): RQCentralExportGraph; stdcall;
    function getList: RQCentralExportGraphShortList; stdcall;
    function getFilteredList(const aRQCentralExportGraphFilter: RQCentralExportGraphFilter): RQCentralExportGraphShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphShortList; stdcall;
    function getScrollableFilteredList(const aRQCentralExportGraphFilter: RQCentralExportGraphFilter; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQCentralExportGraphShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQCentralExportGraphFilter: RQCentralExportGraphFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQCentralExportGraphShort; stdcall;
  end;


implementation

  destructor RQCentralExportGraph.Destroy;
  begin
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FexportGraphType) then
      exportGraphType.Free;
    inherited Destroy;
  end;

{
  destructor RQCentralExportGraphFilter.Destroy;
  begin
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FexportGraphType) then
      exportGraphType.Free;
    inherited Destroy;
  end;
}

  destructor RQCentralExportGraphFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQCentralExportGraphShort.Destroy;
  begin
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end;

  destructor RQCentralExportGraphShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQCentralExportGraph, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraph');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphRef');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphFilter');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphShort');
  RemClassRegistry.RegisterXSClass(RQCentralExportGraphShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQCentralExportGraphShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQCentralExportGraphShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQCentralExportGraphShort');

  InvRegistry.RegisterInterface(TypeInfo(RQCentralExportGraphControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQCentralExportGraphControllerSoapPort), 'http://ksoe.org/RQCentralExportGraphController/action/RQCentralExportGraphController.%operationName%');


end.
