unit ENMolController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENMolStatusController
   ,ENMolTypeController
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

  ENMol            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMolRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENMol = class(TRemotable)
  private
    Fcode : Integer;
    FfinCode : WideString;
    Fname : WideString;
    FphoneNumber : WideString;
    FtabNumber : WideString;
    Fstorage : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENMolStatusRef;
//???
    FtypeRef : ENMolTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property finCode : WideString read FfinCode write FfinCode;
    property name : WideString read Fname write Fname;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property storage : WideString read Fstorage write Fstorage;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENMolStatusRef read FstatusRef write FstatusRef;
    property typeRef : ENMolTypeRef read FtypeRef write FtypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENMolFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FfinCode : WideString;
    Fname : WideString;
    FphoneNumber : WideString;
    FtabNumber : WideString;
    Fstorage : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENMolStatusRef;
//???
    FtypeRef : ENMolTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property finCode : WideString read FfinCode write FfinCode;
    property name : WideString read Fname write Fname;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property storage : WideString read Fstorage write Fstorage;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENMolStatusRef read FstatusRef write FstatusRef;
    property typeRef : ENMolTypeRef read FtypeRef write FtypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENMolFilter = class(ENMol)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENMolShort = class(TRemotable)
  private
    Fcode : Integer;
    FfinCode : WideString;
    Fname : WideString;
    FphoneNumber : WideString;
    FtabNumber : WideString;
    Fstorage : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
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
    property finCode : WideString read FfinCode write FfinCode;
    property name : WideString read Fname write Fname;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property storage : WideString read Fstorage write Fstorage;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
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

  ArrayOfENMolShort = array of ENMolShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENMolShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENMolShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENMolShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENMolController/message/
  // soapAction: http://ksoe.org/ENMolController/action/ENMolController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENMolControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENMolController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENMolControllerSoapPort = interface(IInvokable)
  ['{22421359-DE39-4772-A914-28685470DFE7}']
    function add(const aENMol: ENMol): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENMol: ENMol); stdcall;
    function getObject(const anObjectCode: Integer): ENMol; stdcall;
    function getList: ENMolShortList; stdcall;
    function getFilteredList(const aENMolFilter: ENMolFilter): ENMolShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENMolShortList; stdcall;
    function getScrollableFilteredList(const aENMolFilter: ENMolFilter; const aFromPosition: Integer; const aQuantity: Integer): ENMolShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENMolShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENMolFilter: ENMolFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENMolShort; stdcall;
    function synchronizeMols(addOSMols : Boolean): ENMolShortList; stdcall;
  end;


implementation

  destructor ENMol.Destroy;
  begin
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENMolFilter.Destroy;
  begin
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENMolFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENMolShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENMolShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENMol, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMol');
  RemClassRegistry.RegisterXSClass(ENMolRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolRef');
  RemClassRegistry.RegisterXSClass(ENMolFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolFilter');
  RemClassRegistry.RegisterXSClass(ENMolShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolShort');
  RemClassRegistry.RegisterXSClass(ENMolShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENMolShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENMolShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENMolShort');

  InvRegistry.RegisterInterface(TypeInfo(ENMolControllerSoapPort), 'http://ksoe.org/ENMolController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENMolControllerSoapPort), 'http://ksoe.org/ENMolController/action/ENMolController.%operationName%');


end.
