unit ENWarrant4DepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENAgreementKindController
  , ENWarrantController
  , ENDepartmentController
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

  ENWarrant4Department            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrant4DepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWarrant4Department = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FagreementKindRef : ENAgreementKindRef;
//???
    FwarrantRef : ENWarrantRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property agreementKindRef : ENAgreementKindRef read FagreementKindRef write FagreementKindRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENWarrant4DepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FagreementKindRef : ENAgreementKindRef;
//???
    FwarrantRef : ENWarrantRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property agreementKindRef : ENAgreementKindRef read FagreementKindRef write FagreementKindRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENWarrant4DepartmentFilter = class(ENWarrant4Department)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWarrant4DepartmentShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FagreementKindRefCode : Integer;
    FagreementKindRefName : WideString;
    FagreementKindRefUserGen : WideString;
    FwarrantRefCode : Integer;
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer;
    FwarrantRefMaxSum : TXSDecimal;
    FwarrantRefDepartmentName : WideString;
    FwarrantRefDepartmentNameGenitive : WideString;
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
    FdateEdit: TXSDateTime;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property agreementKindRefCode : Integer read FagreementKindRefCode write FagreementKindRefCode;
    property agreementKindRefName : WideString read FagreementKindRefName write FagreementKindRefName;
    property agreementKindRefUserGen : WideString read FagreementKindRefUserGen write FagreementKindRefUserGen;
    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode;
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen;
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName;
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO;
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO;
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition;
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO;
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition;
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport;
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress;
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower;
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum;
    property warrantRefDepartmentName : WideString read FwarrantRefDepartmentName write FwarrantRefDepartmentName;
    property warrantRefDepartmentNameGenitive : WideString read FwarrantRefDepartmentNameGenitive write FwarrantRefDepartmentNameGenitive;
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
    property dateEdit: TXSDateTime read FdateEdit write FdateEdit;
  end;

  ArrayOfENWarrant4DepartmentShort = array of ENWarrant4DepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWarrant4DepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWarrant4DepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWarrant4DepartmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWarrant4DepartmentController/message/
  // soapAction: http://ksoe.org/ENWarrant4DepartmentController/action/ENWarrant4DepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWarrant4DepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWarrant4DepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWarrant4DepartmentControllerSoapPort = interface(IInvokable)
  ['{77637AFC-BBEA-4771-8ED9-B3AB26BC68C3}']
    function add(const aENWarrant4Department: ENWarrant4Department): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWarrant4Department: ENWarrant4Department); stdcall;
    function getObject(const anObjectCode: Integer): ENWarrant4Department; stdcall;
    function getList: ENWarrant4DepartmentShortList; stdcall;
    function getFilteredList(const aENWarrant4DepartmentFilter: ENWarrant4DepartmentFilter): ENWarrant4DepartmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWarrant4DepartmentShortList; stdcall;
    function getScrollableFilteredList(const aENWarrant4DepartmentFilter: ENWarrant4DepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWarrant4DepartmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWarrant4DepartmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWarrant4DepartmentFilter: ENWarrant4DepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWarrant4DepartmentShort; stdcall;
  end;


implementation

  destructor ENWarrant4Department.Destroy;
  begin
    if Assigned(FagreementKindRef) then
      agreementKindRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENWarrant4DepartmentFilter.Destroy;
  begin
    if Assigned(FagreementKindRef) then
      agreementKindRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENWarrant4DepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENWarrant4DepartmentShort.Destroy;
  begin
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENWarrant4DepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWarrant4Department, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant4Department');
  RemClassRegistry.RegisterXSClass(ENWarrant4DepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant4DepartmentRef');
  RemClassRegistry.RegisterXSClass(ENWarrant4DepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant4DepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENWarrant4DepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant4DepartmentShort');
  RemClassRegistry.RegisterXSClass(ENWarrant4DepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWarrant4DepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWarrant4DepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWarrant4DepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWarrant4DepartmentControllerSoapPort), 'http://ksoe.org/ENWarrant4DepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWarrant4DepartmentControllerSoapPort), 'http://ksoe.org/ENWarrant4DepartmentController/action/ENWarrant4DepartmentController.%operationName%');


end.
