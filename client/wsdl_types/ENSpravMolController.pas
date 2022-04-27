unit ENSpravMolController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  ENSpravMol            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSpravMolRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSpravMol = class(TRemotable)
  private
    Fcode : Integer; 
    Fmolkod : WideString;
    Fmolname : WideString;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property molkod : WideString read Fmolkod write Fmolkod;
    property molname : WideString read Fmolname write Fmolname;
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;
  
{
  ENSpravMolFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmolkod : WideString;
    Fmolname : WideString;
//???
    Fdepartment : ENDepartment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property molkod : WideString read Fmolkod write Fmolkod;
    property molname : WideString read Fmolname write Fmolname;
    property department : ENDepartment read Fdepartment write Fdepartment; 
  end;
}

  ENSpravMolFilter = class(ENSpravMol)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENSpravMolShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fmolkod : WideString;
    Fmolname : WideString;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property molkod : WideString read Fmolkod write Fmolkod;
    property molname : WideString read Fmolname write Fmolname;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
  end;

  ArrayOfENSpravMolShort = array of ENSpravMolShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSpravMolShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSpravMolShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSpravMolShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSpravMolController/message/
  // soapAction: http://ksoe.org/ENSpravMolController/action/ENSpravMolController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSpravMolControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSpravMolController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSpravMolControllerSoapPort = interface(IInvokable)
  ['{89dd89dd-89dd-89dd-89dd-89dd89dd89dd}']
    function  add(const aENSpravMol: ENSpravMol): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSpravMol: ENSpravMol); stdcall;
    function  getObject(const anObjectCode: Integer): ENSpravMol; stdcall;
    function  getList: ENSpravMolShortList; stdcall;
    function  getFilteredList(const aENSpravMolFilter: ENSpravMolFilter): ENSpravMolShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSpravMolShortList; stdcall;
    function  getScrollableFilteredList(const aENSpravMolFilter: ENSpravMolFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSpravMolShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSpravMolShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENSpravMolFilter: ENSpravMolFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENSpravMol.Destroy;
  begin
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end;

{  
  destructor ENSpravMolFilter.Destroy;
  begin
    if Assigned(Fdepartment) then
      department.Free;
    inherited Destroy;
  end; 
}

  destructor ENSpravMolFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENSpravMolShort.Destroy;
  begin
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENSpravMolShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSpravMol, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSpravMol');
  RemClassRegistry.RegisterXSClass(ENSpravMolRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSpravMolRef');
  RemClassRegistry.RegisterXSClass(ENSpravMolFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSpravMolFilter');
  RemClassRegistry.RegisterXSClass(ENSpravMolShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSpravMolShort');
  RemClassRegistry.RegisterXSClass(ENSpravMolShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSpravMolShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSpravMolShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSpravMolShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSpravMolControllerSoapPort), 'http://ksoe.org/ENSpravMolController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSpravMolControllerSoapPort), 'http://ksoe.org/ENSpravMolController/action/ENSpravMolController.%operationName%');


end.
