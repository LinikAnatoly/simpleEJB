unit ENDepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENDepartmentTypeController
  , ENManagementController
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

  ENDepartment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDepartment = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FshortName : WideString;
    FisVirtual : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FrenCode : Integer;
    FshpzBalans : WideString;
    FshpzFinId : Integer;
    Fkau_table_id_1884 : Integer;
    Fkau_1884 : WideString;
    Fname_1884 : WideString;
    Fhrmorganizationid : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FparentRef : ENDepartmentRef;
//???
    FtypeRef : ENDepartmentTypeRef;
//???
    FmanagementRef : ENManagementRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property isVirtual : Integer read FisVirtual write FisVirtual;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property renCode : Integer read FrenCode write FrenCode;
    property shpzBalans : WideString read FshpzBalans write FshpzBalans;
    property shpzFinId : Integer read FshpzFinId write FshpzFinId;
    property kau_table_id_1884 : Integer read Fkau_table_id_1884 write Fkau_table_id_1884;
    property kau_1884 : WideString read Fkau_1884 write Fkau_1884;
    property name_1884 : WideString read Fname_1884 write Fname_1884;
    property hrmorganizationid : WideString read Fhrmorganizationid write Fhrmorganizationid;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property parentRef : ENDepartmentRef read FparentRef write FparentRef;
    property typeRef : ENDepartmentTypeRef read FtypeRef write FtypeRef;
    property managementRef : ENManagementRef read FmanagementRef write FmanagementRef;
  end;

{
  ENDepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FshortName : WideString;
    FisVirtual : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FrenCode : Integer;
    FshpzBalans : WideString;
    FshpzFinId : Integer;
    Fkau_table_id_1884 : Integer;
    Fkau_1884 : WideString;
    Fname_1884 : WideString;
    Fhrmorganizationid : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FparentRef : ENDepartmentRef;
//???
    FtypeRef : ENDepartmentTypeRef;
//???
    FmanagementRef : ENManagementRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property isVirtual : Integer read FisVirtual write FisVirtual;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property renCode : Integer read FrenCode write FrenCode;
    property shpzBalans : WideString read FshpzBalans write FshpzBalans;
    property shpzFinId : Integer read FshpzFinId write FshpzFinId;
    property kau_table_id_1884 : Integer read Fkau_table_id_1884 write Fkau_table_id_1884;
    property kau_1884 : WideString read Fkau_1884 write Fkau_1884;
    property name_1884 : WideString read Fname_1884 write Fname_1884;
    property hrmorganizationid : WideString read Fhrmorganizationid write Fhrmorganizationid;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property parentRef : ENDepartmentRef read FparentRef write FparentRef;
    property typeRef : ENDepartmentTypeRef read FtypeRef write FtypeRef;
    property managementRef : ENManagementRef read FmanagementRef write FmanagementRef;
  end;
}

  ENDepartmentFilter = class(ENDepartment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDepartmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FshortName : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FrenCode : Integer;
    FshpzBalans : WideString;
    Fkau_table_id_1884 : Integer;
    Fkau_1884 : WideString;
    Fname_1884 : WideString;
    Fhrmorganizationid : WideString;
    FparentRefCode : Integer;
    FparentRefShortName : WideString;
    FparentRefDateStart : TXSDate;
    FparentRefDateFinal : TXSDate;
    FparentRefRenCode : Integer;
    FparentRefShpzBalans : WideString;
    FparentRefKau_table_id_1884 : Integer;
    FparentRefKau_1884 : WideString;
    FparentRefName_1884 : WideString;
    FparentRefHrmorganizationid : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FmanagementRefCode : Integer;
    FmanagementRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property shortName : WideString read FshortName write FshortName;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property  renCode : Integer read FrenCode write FrenCode;
    property shpzBalans : WideString read FshpzBalans write FshpzBalans;
    property  kau_table_id_1884 : Integer read Fkau_table_id_1884 write Fkau_table_id_1884;
    property kau_1884 : WideString read Fkau_1884 write Fkau_1884;
    property name_1884 : WideString read Fname_1884 write Fname_1884;
    property hrmorganizationid : WideString read Fhrmorganizationid write Fhrmorganizationid;

    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefShortName : WideString read FparentRefShortName write FparentRefShortName;
    property parentRefDateStart : TXSDate read FparentRefDateStart write FparentRefDateStart;
    property parentRefDateFinal : TXSDate read FparentRefDateFinal write FparentRefDateFinal;
    property parentRefRenCode : Integer read FparentRefRenCode write FparentRefRenCode;
    property parentRefShpzBalans : WideString read FparentRefShpzBalans write FparentRefShpzBalans;
    property parentRefKau_table_id_1884 : Integer read FparentRefKau_table_id_1884 write FparentRefKau_table_id_1884;
    property parentRefKau_1884 : WideString read FparentRefKau_1884 write FparentRefKau_1884;
    property parentRefName_1884 : WideString read FparentRefName_1884 write FparentRefName_1884;
    property parentRefHrmorganizationid : WideString read FparentRefHrmorganizationid write FparentRefHrmorganizationid;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property managementRefCode : Integer read FmanagementRefCode write FmanagementRefCode;
    property managementRefName : WideString read FmanagementRefName write FmanagementRefName;
  end;

  ArrayOfENDepartmentShort = array of ENDepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDepartmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDepartmentController/message/
  // soapAction: http://ksoe.org/ENDepartmentController/action/ENDepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDepartmentControllerSoapPort = interface(IInvokable)
  ['{AA3DEF67-C701-4A04-ACAC-CCAB3FBDD6CD}']
    function  add(const aENDepartment: ENDepartment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDepartment: ENDepartment); stdcall;
    function  getObject(const anObjectCode: Integer): ENDepartment; stdcall;
    function  getList: ENDepartmentShortList; stdcall;
    function  getFilteredList(const aENDepartmentFilter: ENDepartmentFilter): ENDepartmentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentShortList; stdcall;
    function  getScrollableFilteredList(const aENDepartmentFilter: ENDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentShortList; stdcall;
    function  getDepartmentCodesDown(const aDepartmentCode : Integer) : WideString ; stdcall ;
    function  getAXDepartmentCodesDown(const aDepartmentCode : Integer) : WideString ; stdcall ;
    function  getRenCodeFromEndepartmentByCode(const codeDepartment : Integer) : Integer ; stdcall ;

    function  getDepartmentListFromSprav(const aENDepartmentFilter: ENDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDepartmentShortList; stdcall;
    function  getDepartmentCategory(const departmentCode: Integer): Integer; stdcall;

    function getDepartmentIdDownFromKadry(const aDepartmentCode : Integer) : WideString ; stdcall ;
  end;



implementation

  destructor ENDepartment.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FmanagementRef) then
      managementRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDepartmentFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FmanagementRef) then
      managementRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDepartmentShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FparentRefDateStart) then
      parentRefDateStart.Free;
    if Assigned(FparentRefDateFinal) then
      parentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENDepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDepartment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartment');
  RemClassRegistry.RegisterXSClass(ENDepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentRef');
  RemClassRegistry.RegisterXSClass(ENDepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENDepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentShort');
  RemClassRegistry.RegisterXSClass(ENDepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDepartmentControllerSoapPort), 'http://ksoe.org/ENDepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDepartmentControllerSoapPort), 'http://ksoe.org/ENDepartmentController/action/ENDepartmentController.%operationName%');


end.
