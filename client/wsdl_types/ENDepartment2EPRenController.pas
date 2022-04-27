unit ENDepartment2EPRenController;

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

  ENDepartment2EPRen            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartment2EPRenRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartment2EPRen = class(TRemotable)
  private
    Fcode : Integer;
    FbillingServerIp : WideString;
    FbillingServerJnpPort : WideString;
    FbillingServerPort : WideString;
    FfinRenCode : Integer;
    FfinCFOCode : WideString;
    FfinServicesCode : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FrenRef : EPRenRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property billingServerIp : WideString read FbillingServerIp write FbillingServerIp;
    property billingServerJnpPort : WideString read FbillingServerJnpPort write FbillingServerJnpPort;
    property billingServerPort : WideString read FbillingServerPort write FbillingServerPort;
    property  finRenCode : Integer read FfinRenCode write FfinRenCode;
    property finCFOCode : WideString read FfinCFOCode write FfinCFOCode;
    property finServicesCode : WideString read FfinServicesCode write FfinServicesCode;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
  end;

{
  ENDepartment2EPRenFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FbillingServerIp : WideString;
    FbillingServerJnpPort : WideString;
    FbillingServerPort : WideString;
    FfinRenCode : Integer;
    FfinCFOCode : WideString;
    FfinServicesCode : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FrenRef : EPRenRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property billingServerIp : WideString read FbillingServerIp write FbillingServerIp;
    property billingServerJnpPort : WideString read FbillingServerJnpPort write FbillingServerJnpPort;
    property billingServerPort : WideString read FbillingServerPort write FbillingServerPort;
    property  finRenCode : Integer read FfinRenCode write FfinRenCode;
    property finCFOCode : WideString read FfinCFOCode write FfinCFOCode;
    property finServicesCode : WideString read FfinServicesCode write FfinServicesCode;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
  end;
}

  ENDepartment2EPRenFilter = class(ENDepartment2EPRen)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDepartment2EPRenShort = class(TRemotable)
  private
    Fcode : Integer;
    FbillingServerIp : WideString;
    FbillingServerJnpPort : WideString;
    FbillingServerPort : WideString;
    FfinRenCode : Integer;
    FfinCFOCode : WideString;
    FfinServicesCode : WideString;
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
    FrenRefCode : Integer;
    FrenRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property billingServerIp : WideString read FbillingServerIp write FbillingServerIp;
    property billingServerJnpPort : WideString read FbillingServerJnpPort write FbillingServerJnpPort;
    property billingServerPort : WideString read FbillingServerPort write FbillingServerPort;
    property  finRenCode : Integer read FfinRenCode write FfinRenCode;
    property finCFOCode : WideString read FfinCFOCode write FfinCFOCode;
    property finServicesCode : WideString read FfinServicesCode write FfinServicesCode;

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
    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;
  end;

  ArrayOfENDepartment2EPRenShort = array of ENDepartment2EPRenShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDepartment2EPRenShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDepartment2EPRenShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDepartment2EPRenShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDepartment2EPRenController/message/
  // soapAction: http://ksoe.org/ENDepartment2EPRenController/action/ENDepartment2EPRenController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDepartment2EPRenControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDepartment2EPRenController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDepartment2EPRenControllerSoapPort = interface(IInvokable)
  ['{8B0346F8-AEBD-4D64-A037-3FB781AEB978}']
    function add(const aENDepartment2EPRen: ENDepartment2EPRen): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDepartment2EPRen: ENDepartment2EPRen); stdcall;
    function getObject(const anObjectCode: Integer): ENDepartment2EPRen; stdcall;
    function getList: ENDepartment2EPRenShortList; stdcall;
    function getFilteredList(const aENDepartment2EPRenFilter: ENDepartment2EPRenFilter): ENDepartment2EPRenShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2EPRenShortList; stdcall;
    function getScrollableFilteredList(const aENDepartment2EPRenFilter: ENDepartment2EPRenFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2EPRenShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDepartment2EPRenShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDepartment2EPRenFilter: ENDepartment2EPRenFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDepartment2EPRenShort; stdcall;
  end;


implementation

  destructor ENDepartment2EPRen.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDepartment2EPRenFilter.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDepartment2EPRenFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDepartment2EPRenShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENDepartment2EPRenShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDepartment2EPRen, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2EPRen');
  RemClassRegistry.RegisterXSClass(ENDepartment2EPRenRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2EPRenRef');
  RemClassRegistry.RegisterXSClass(ENDepartment2EPRenFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2EPRenFilter');
  RemClassRegistry.RegisterXSClass(ENDepartment2EPRenShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2EPRenShort');
  RemClassRegistry.RegisterXSClass(ENDepartment2EPRenShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment2EPRenShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDepartment2EPRenShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDepartment2EPRenShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDepartment2EPRenControllerSoapPort), 'http://ksoe.org/ENDepartment2EPRenController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDepartment2EPRenControllerSoapPort), 'http://ksoe.org/ENDepartment2EPRenController/action/ENDepartment2EPRenController.%operationName%');


end.
