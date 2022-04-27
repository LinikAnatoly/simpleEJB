unit ENTransportDep2DepController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportDepartmentController 
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

  ENTransportDep2Dep            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDep2DepRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportDep2Dep = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtransportDepartment : ENTransportDepartment;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;
  
{
  ENTransportDep2DepFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtransportDepartment : ENTransportDepartment;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property transportDepartment : ENTransportDepartment read FtransportDepartment write FtransportDepartment; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;
}

  ENTransportDep2DepFilter = class(ENTransportDep2Dep)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportDep2DepShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtransportDepartmentCode : Integer; 
    FtransportDepartmentName : WideString;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer; 
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property transportDepartmentCode : Integer read FtransportDepartmentCode write FtransportDepartmentCode; 
    property transportDepartmentName : WideString read FtransportDepartmentName write FtransportDepartmentName; 
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans; 
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884; 
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884; 
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884; 
  end;

  ArrayOfENTransportDep2DepShort = array of ENTransportDep2DepShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportDep2DepShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportDep2DepShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportDep2DepShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportDep2DepController/message/
  // soapAction: http://ksoe.org/ENTransportDep2DepController/action/ENTransportDep2DepController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportDep2DepControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportDep2DepController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportDep2DepControllerSoapPort = interface(IInvokable)
  ['{19e719e7-19e7-19e7-19e7-19e719e719e7}']
    function  add(const aENTransportDep2Dep: ENTransportDep2Dep): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportDep2Dep: ENTransportDep2Dep); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportDep2Dep; stdcall;
    function  getList: ENTransportDep2DepShortList; stdcall;
    function  getFilteredList(const aENTransportDep2DepFilter: ENTransportDep2DepFilter): ENTransportDep2DepShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2DepShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportDep2DepFilter: ENTransportDep2DepFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2DepShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportDep2DepShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportDep2DepFilter: ENTransportDep2DepFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportDep2Dep.Destroy;
  begin
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportDep2DepFilter.Destroy;
  begin
    if Assigned(FtransportDepartment) then
      transportDepartment.Free;
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportDep2DepFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportDep2DepShort.Destroy;
  begin
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransportDep2DepShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportDep2Dep, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2Dep');
  RemClassRegistry.RegisterXSClass(ENTransportDep2DepRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2DepRef');
  RemClassRegistry.RegisterXSClass(ENTransportDep2DepFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2DepFilter');
  RemClassRegistry.RegisterXSClass(ENTransportDep2DepShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2DepShort');
  RemClassRegistry.RegisterXSClass(ENTransportDep2DepShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportDep2DepShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportDep2DepShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportDep2DepShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportDep2DepControllerSoapPort), 'http://ksoe.org/ENTransportDep2DepController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportDep2DepControllerSoapPort), 'http://ksoe.org/ENTransportDep2DepController/action/ENTransportDep2DepController.%operationName%');


end.
