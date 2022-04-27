unit ENMol2DepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENMolController 
   ,ENDepartmentController 
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

  ENMol2Department            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMol2DepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMol2Department = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fmol : ENMol;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property mol : ENMol read Fmol write Fmol; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
  end;
  
{
  ENMol2DepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    Fmol : ENMol;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property mol : ENMol read Fmol write Fmol; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
  end;
}

  ENMol2DepartmentFilter = class(ENMol2Department)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENMol2DepartmentShort = class(TRemotable)
  private
    Fcode : Integer; 
    FmolCode : Integer; 
    FmolFinCode : WideString;
    FmolName : WideString;
    FdepartmentRefCode : Integer; 
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property molCode : Integer read FmolCode write FmolCode; 
    property molFinCode : WideString read FmolFinCode write FmolFinCode; 
    property molName : WideString read FmolName write FmolName; 
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName; 
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart; 
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal; 
  end;

  ArrayOfENMol2DepartmentShort = array of ENMol2DepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMol2DepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMol2DepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMol2DepartmentShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMol2DepartmentController/message/
  // soapAction: http://ksoe.org/ENMol2DepartmentController/action/ENMol2DepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMol2DepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMol2DepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMol2DepartmentControllerSoapPort = interface(IInvokable)
  ['{3d7d3d7d-3d7d-3d7d-3d7d-3d7d3d7d3d7d}']
    function  add(const aENMol2Department: ENMol2Department): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMol2Department: ENMol2Department); stdcall;
    function  getObject(const anObjectCode: Integer): ENMol2Department; stdcall;
    function  getList: ENMol2DepartmentShortList; stdcall;
    function  getFilteredList(const aENMol2DepartmentFilter: ENMol2DepartmentFilter): ENMol2DepartmentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMol2DepartmentShortList; stdcall;
    function  getScrollableFilteredList(const aENMol2DepartmentFilter: ENMol2DepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMol2DepartmentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMol2DepartmentShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENMol2DepartmentFilter: ENMol2DepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENMol2Department.Destroy;
  begin
    if Assigned(Fmol) then
      mol.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENMol2DepartmentFilter.Destroy;
  begin
    if Assigned(Fmol) then
      mol.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENMol2DepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENMol2DepartmentShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENMol2DepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMol2Department, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2Department');
  RemClassRegistry.RegisterXSClass(ENMol2DepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2DepartmentRef');
  RemClassRegistry.RegisterXSClass(ENMol2DepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2DepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENMol2DepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2DepartmentShort');
  RemClassRegistry.RegisterXSClass(ENMol2DepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol2DepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMol2DepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMol2DepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMol2DepartmentControllerSoapPort), 'http://ksoe.org/ENMol2DepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMol2DepartmentControllerSoapPort), 'http://ksoe.org/ENMol2DepartmentController/action/ENMol2DepartmentController.%operationName%');


end.
