unit ENDepartment2OrgController;

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

  ENDepartment2Org            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartment2OrgRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartment2Org = class(TRemotable)
  private
    Fcode : Integer;
    Forg_id : Integer;
    FaxOrgId : Integer;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  org_id : Integer read Forg_id write Forg_id;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENDepartment2OrgFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Forg_id : Integer;
    FaxOrgId : Integer;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  org_id : Integer read Forg_id write Forg_id;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENDepartment2OrgFilter = class(ENDepartment2Org)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDepartment2OrgShort = class(TRemotable)
  private
    Fcode : Integer;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FdepartmentRefHrmorganizationid : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property departmentRefHrmorganizationid : WideString read FdepartmentRefHrmorganizationid write FdepartmentRefHrmorganizationid;
  end;

  ArrayOfENDepartment2OrgShort = array of ENDepartment2OrgShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDepartment2OrgShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDepartment2OrgShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDepartment2OrgShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDepartment2OrgController/message/
  // soapAction: http://ksoe.org/ENDepartment2OrgController/action/ENDepartment2OrgController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDepartment2OrgControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDepartment2OrgController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDepartment2OrgControllerSoapPort = interface(IInvokable)
  ['{FCC69EAF-C4E8-4BA1-9BD9-17B6499E20CF}']
    function add(const aENDepartment2Org: ENDepartment2Org): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDepartment2Org: ENDepartment2Org); stdcall;
    function getObject(const anObjectCode: Integer): ENDepartment2Org; stdcall;
    function getList: ENDepartment2OrgShortList; stdcall;
    function getFilteredList(const aENDepartment2OrgFilter: ENDepartment2OrgFilter): ENDepartment2OrgShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2OrgShortList; stdcall;
    function getScrollableFilteredList(const aENDepartment2OrgFilter: ENDepartment2OrgFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2OrgShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2OrgShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDepartment2OrgFilter: ENDepartment2OrgFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDepartment2OrgShort; stdcall;
  end;


implementation

  destructor ENDepartment2Org.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDepartment2OrgFilter.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDepartment2OrgFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDepartment2OrgShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENDepartment2OrgShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDepartment2Org, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2Org');
  RemClassRegistry.RegisterXSClass(ENDepartment2OrgRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2OrgRef');
  RemClassRegistry.RegisterXSClass(ENDepartment2OrgFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2OrgFilter');
  RemClassRegistry.RegisterXSClass(ENDepartment2OrgShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2OrgShort');
  RemClassRegistry.RegisterXSClass(ENDepartment2OrgShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2OrgShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDepartment2OrgShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDepartment2OrgShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDepartment2OrgControllerSoapPort), 'http://ksoe.org/ENDepartment2OrgController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDepartment2OrgControllerSoapPort), 'http://ksoe.org/ENDepartment2OrgController/action/ENDepartment2OrgController.%operationName%');


end.
