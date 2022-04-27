unit ENBonusListController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,FINWorkerKindController
   ,ENBonusListStatusController
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

  ENBonusList            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusList = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FmonthGen : Integer;
    FyearGen : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartmentRef;
//???
    FkindRef : FINWorkerKindRef;
//???
    Fstatus : ENBonusListStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property kindRef : FINWorkerKindRef read FkindRef write FkindRef;
    property status : ENBonusListStatusRef read Fstatus write Fstatus;
  end;

{
  ENBonusListFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FmonthGen : Integer;
    FyearGen : Integer;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartmentRef;
//???
    FkindRef : FINWorkerKindRef;
//???
    Fstatus : ENBonusListStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property kindRef : FINWorkerKindRef read FkindRef write FkindRef;
    property status : ENBonusListStatusRef read Fstatus write Fstatus;
  end;
}

  ENBonusListFilter = class(ENBonusList)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBonusListShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FmonthGen : Integer;
    FyearGen : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer;
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FdepartmentHrmorganizationid : WideString;
    FkindRefCode : Integer;
    FkindRefName : WideString;
    FstatusCode : Integer;
    FstatusName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode;
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans;
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884;
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884;
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884;
    property departmentHrmorganizationid : WideString read FdepartmentHrmorganizationid write FdepartmentHrmorganizationid;
    property kindRefCode : Integer read FkindRefCode write FkindRefCode;
    property kindRefName : WideString read FkindRefName write FkindRefName;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property statusName : WideString read FstatusName write FstatusName;
  end;

  ArrayOfENBonusListShort = array of ENBonusListShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBonusListShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBonusListShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBonusListShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBonusListController/message/
  // soapAction: http://ksoe.org/ENBonusListController/action/ENBonusListController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBonusListControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBonusListController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBonusListControllerSoapPort = interface(IInvokable)
  ['{E02323CA-9D06-4F0A-AE2D-4B3D87D7E3E4}']
    function add(const aENBonusList: ENBonusList): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBonusList: ENBonusList); stdcall;
    function getObject(const anObjectCode: Integer): ENBonusList; stdcall;
    function getList: ENBonusListShortList; stdcall;
    function getFilteredList(const aENBonusListFilter: ENBonusListFilter): ENBonusListShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBonusListShortList; stdcall;
    function getScrollableFilteredList(const aENBonusListFilter: ENBonusListFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBonusListFilter: ENBonusListFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBonusListShort; stdcall;

    procedure approve(const aENBonusListObj: Integer); stdcall;
    procedure unapprove(const aENBonusListObj: Integer); stdcall;
  end;


implementation

  destructor ENBonusList.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(Fstatus) then
      status.Free;
    inherited Destroy;
  end;

{
  destructor ENBonusListFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    if Assigned(Fstatus) then
      status.Free;
    inherited Destroy;
  end;
}

  destructor ENBonusListFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBonusListShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENBonusListShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBonusList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusList');
  RemClassRegistry.RegisterXSClass(ENBonusListRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListRef');
  RemClassRegistry.RegisterXSClass(ENBonusListFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListFilter');
  RemClassRegistry.RegisterXSClass(ENBonusListShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListShort');
  RemClassRegistry.RegisterXSClass(ENBonusListShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBonusListShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBonusListShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBonusListControllerSoapPort), 'http://ksoe.org/ENBonusListController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBonusListControllerSoapPort), 'http://ksoe.org/ENBonusListController/action/ENBonusListController.%operationName%');


end.
