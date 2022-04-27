unit ENTechCondResponsibles2DepController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTechCondResponsiblesController 
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

  ENTechCondResponsibles2Dep            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCondResponsibles2DepRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechCondResponsibles2Dep = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtechCondResponsiblesRef : ENTechCondResponsiblesRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property techCondResponsiblesRef : ENTechCondResponsiblesRef read FtechCondResponsiblesRef write FtechCondResponsiblesRef; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
  end;
  
{
  ENTechCondResponsibles2DepFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtechCondResponsiblesRef : ENTechCondResponsiblesRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property techCondResponsiblesRef : ENTechCondResponsiblesRef read FtechCondResponsiblesRef write FtechCondResponsiblesRef; 
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef; 
  end;
}

  ENTechCondResponsibles2DepFilter = class(ENTechCondResponsibles2Dep)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTechCondResponsibles2DepShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtechCondResponsiblesRefCode : Integer; 
    FtechCondResponsiblesRefResponsibleFIO : WideString;
    FtechCondResponsiblesRefResponsibleTabNumber : Integer; 
    FtechCondResponsiblesRefResponsiblePosition : WideString;
    FtechCondResponsiblesRefResponsibleDepName : WideString;
    FtechCondResponsiblesRefResponsibleDepCode : WideString;
    FtechCondResponsiblesRefPower : Integer; 
    FdepartmentRefCode : Integer; 
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer; 
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property techCondResponsiblesRefCode : Integer read FtechCondResponsiblesRefCode write FtechCondResponsiblesRefCode; 
    property techCondResponsiblesRefResponsibleFIO : WideString read FtechCondResponsiblesRefResponsibleFIO write FtechCondResponsiblesRefResponsibleFIO; 
    property techCondResponsiblesRefResponsibleTabNumber : Integer read FtechCondResponsiblesRefResponsibleTabNumber write FtechCondResponsiblesRefResponsibleTabNumber; 
    property techCondResponsiblesRefResponsiblePosition : WideString read FtechCondResponsiblesRefResponsiblePosition write FtechCondResponsiblesRefResponsiblePosition; 
    property techCondResponsiblesRefResponsibleDepName : WideString read FtechCondResponsiblesRefResponsibleDepName write FtechCondResponsiblesRefResponsibleDepName; 
    property techCondResponsiblesRefResponsibleDepCode : WideString read FtechCondResponsiblesRefResponsibleDepCode write FtechCondResponsiblesRefResponsibleDepCode; 
    property techCondResponsiblesRefPower : Integer read FtechCondResponsiblesRefPower write FtechCondResponsiblesRefPower; 
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode; 
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName; 
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart; 
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal; 
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans; 
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884; 
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884; 
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884; 
  end;

  ArrayOfENTechCondResponsibles2DepShort = array of ENTechCondResponsibles2DepShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechCondResponsibles2DepShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechCondResponsibles2DepShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechCondResponsibles2DepShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechCondResponsibles2DepController/message/
  // soapAction: http://ksoe.org/ENTechCondResponsibles2DepController/action/ENTechCondResponsibles2DepController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechCondResponsibles2DepControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechCondResponsibles2DepController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechCondResponsibles2DepControllerSoapPort = interface(IInvokable)
  ['{47494749-4749-4749-4749-474947494749}']
    function  add(const aENTechCondResponsibles2Dep: ENTechCondResponsibles2Dep): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechCondResponsibles2Dep: ENTechCondResponsibles2Dep); stdcall;
    function  getObject(const anObjectCode: Integer): ENTechCondResponsibles2Dep; stdcall;
    function  getList: ENTechCondResponsibles2DepShortList; stdcall;
    function  getFilteredList(const aENTechCondResponsibles2DepFilter: ENTechCondResponsibles2DepFilter): ENTechCondResponsibles2DepShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsibles2DepShortList; stdcall;
    function  getScrollableFilteredList(const aENTechCondResponsibles2DepFilter: ENTechCondResponsibles2DepFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsibles2DepShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechCondResponsibles2DepShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTechCondResponsibles2DepFilter: ENTechCondResponsibles2DepFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTechCondResponsibles2Dep.Destroy;
  begin
    if Assigned(FtechCondResponsiblesRef) then
      techCondResponsiblesRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTechCondResponsibles2DepFilter.Destroy;
  begin
    if Assigned(FtechCondResponsiblesRef) then
      techCondResponsiblesRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTechCondResponsibles2DepFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTechCondResponsibles2DepShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENTechCondResponsibles2DepShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles2Dep, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles2Dep');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles2DepRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles2DepRef');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles2DepFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles2DepFilter');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles2DepShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles2DepShort');
  RemClassRegistry.RegisterXSClass(ENTechCondResponsibles2DepShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechCondResponsibles2DepShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechCondResponsibles2DepShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechCondResponsibles2DepShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechCondResponsibles2DepControllerSoapPort), 'http://ksoe.org/ENTechCondResponsibles2DepController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechCondResponsibles2DepControllerSoapPort), 'http://ksoe.org/ENTechCondResponsibles2DepController/action/ENTechCondResponsibles2DepController.%operationName%');


end.
