unit ENManningTableController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENPositionController 
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

  ENManningTable            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManningTableRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENManningTable = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FfinCode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fposition : ENPosition;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property  finCode : Integer read FfinCode write FfinCode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property position : ENPosition read Fposition write Fposition; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;

  ENManningTableFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FfinCode : Integer; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fposition : ENPosition;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property  finCode : Integer read FfinCode write FfinCode; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property position : ENPosition read Fposition write Fposition; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;


  ENManningTableShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FpositionCode : Integer; 
    FpositionName : WideString;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;

    property positionCode : Integer read FpositionCode write FpositionCode; 
    property positionName : WideString read FpositionName write FpositionName; 
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
  end;

  ArrayOfENManningTableShort = array of ENManningTableShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENManningTableShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENManningTableShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENManningTableShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENManningTableController/message/
  // soapAction: http://ksoe.org/ENManningTableController/action/ENManningTableController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENManningTableControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENManningTableController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENManningTableControllerSoapPort = interface(IInvokable)
  ['{18721872-1872-1872-1872-187218721872}']
    function  add(const aENManningTable: ENManningTable): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENManningTable: ENManningTable); stdcall;
    function  getObject(const anObjectCode: Integer): ENManningTable; stdcall;
    function  getList: ENManningTableShortList; stdcall;
    function  getFilteredList(const aENManningTableFilter: ENManningTableFilter): ENManningTableShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENManningTableShortList; stdcall;
    function  getScrollableFilteredList(const aENManningTableFilter: ENManningTableFilter; const aFromPosition: Integer; const aQuantity: Integer): ENManningTableShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENManningTableShortList; stdcall;
  end; 


implementation

  destructor ENManningTable.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(Fposition) then
      position.Free;
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end;
  
  destructor ENManningTableFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(Fposition) then
      position.Free;
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENManningTableShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENManningTable, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTable');
  RemClassRegistry.RegisterXSClass(ENManningTableRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTableRef');
  RemClassRegistry.RegisterXSClass(ENManningTableFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTableFilter');
  RemClassRegistry.RegisterXSClass(ENManningTableShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTableShort');
  RemClassRegistry.RegisterXSClass(ENManningTableShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENManningTableShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENManningTableShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENManningTableShort');

  InvRegistry.RegisterInterface(TypeInfo(ENManningTableControllerSoapPort), 'http://ksoe.org/ENManningTableController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENManningTableControllerSoapPort), 'http://ksoe.org/ENManningTableController/action/ENManningTableController.%operationName%');


end.
