unit ENGeoDep2ENDepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENGeographicDepartmentController
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

  ENGeoDep2ENDepartment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeoDep2ENDepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeoDep2ENDepartment = class(TRemotable)
  private
    Fcode : Integer;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
  end;

{
  ENGeoDep2ENDepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
  end;
}

  ENGeoDep2ENDepartmentFilter = class(ENGeoDep2ENDepartment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGeoDep2ENDepartmentShort = class(TRemotable)
  private
    Fcode : Integer;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FgeoDepartmentRefCode : Integer;
    FgeoDepartmentRefName : WideString;
    FgeoDepartmentRefCommentgen : WideString;
    FgeoDepartmentRefUserAdd : WideString;
    FgeoDepartmentRefDateAdd : TXSDateTime;
    FgeoDepartmentRefUserGen : WideString;
    FgeoDepartmentRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property geoDepartmentRefCode : Integer read FgeoDepartmentRefCode write FgeoDepartmentRefCode;
    property geoDepartmentRefName : WideString read FgeoDepartmentRefName write FgeoDepartmentRefName;
    property geoDepartmentRefCommentgen : WideString read FgeoDepartmentRefCommentgen write FgeoDepartmentRefCommentgen;
    property geoDepartmentRefUserAdd : WideString read FgeoDepartmentRefUserAdd write FgeoDepartmentRefUserAdd;
    property geoDepartmentRefDateAdd : TXSDateTime read FgeoDepartmentRefDateAdd write FgeoDepartmentRefDateAdd;
    property geoDepartmentRefUserGen : WideString read FgeoDepartmentRefUserGen write FgeoDepartmentRefUserGen;
    property geoDepartmentRefDateEdit : TXSDateTime read FgeoDepartmentRefDateEdit write FgeoDepartmentRefDateEdit;
  end;

  ArrayOfENGeoDep2ENDepartmentShort = array of ENGeoDep2ENDepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGeoDep2ENDepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGeoDep2ENDepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGeoDep2ENDepartmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGeoDep2ENDepartmentController/message/
  // soapAction: http://ksoe.org/ENGeoDep2ENDepartmentController/action/ENGeoDep2ENDepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGeoDep2ENDepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGeoDep2ENDepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGeoDep2ENDepartmentControllerSoapPort = interface(IInvokable)
  ['{BF2D8E7A-843E-4777-B4BA-B1A83E9517E3}']
    function add(const aENGeoDep2ENDepartment: ENGeoDep2ENDepartment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGeoDep2ENDepartment: ENGeoDep2ENDepartment); stdcall;
    function getObject(const anObjectCode: Integer): ENGeoDep2ENDepartment; stdcall;
    function getList: ENGeoDep2ENDepartmentShortList; stdcall;
    function getFilteredList(const aENGeoDep2ENDepartmentFilter: ENGeoDep2ENDepartmentFilter): ENGeoDep2ENDepartmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGeoDep2ENDepartmentShortList; stdcall;
    function getScrollableFilteredList(const aENGeoDep2ENDepartmentFilter: ENGeoDep2ENDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGeoDep2ENDepartmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGeoDep2ENDepartmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGeoDep2ENDepartmentFilter: ENGeoDep2ENDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGeoDep2ENDepartmentShort; stdcall;
  end;


implementation

  destructor ENGeoDep2ENDepartment.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENGeoDep2ENDepartmentFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENGeoDep2ENDepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGeoDep2ENDepartmentShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    if Assigned(FgeoDepartmentRefDateAdd) then
      geoDepartmentRefDateAdd.Free;
    if Assigned(FgeoDepartmentRefDateEdit) then
      geoDepartmentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENGeoDep2ENDepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGeoDep2ENDepartment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeoDep2ENDepartment');
  RemClassRegistry.RegisterXSClass(ENGeoDep2ENDepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeoDep2ENDepartmentRef');
  RemClassRegistry.RegisterXSClass(ENGeoDep2ENDepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeoDep2ENDepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENGeoDep2ENDepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeoDep2ENDepartmentShort');
  RemClassRegistry.RegisterXSClass(ENGeoDep2ENDepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeoDep2ENDepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGeoDep2ENDepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGeoDep2ENDepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGeoDep2ENDepartmentControllerSoapPort), 'http://ksoe.org/ENGeoDep2ENDepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGeoDep2ENDepartmentControllerSoapPort), 'http://ksoe.org/ENGeoDep2ENDepartmentController/action/ENGeoDep2ENDepartmentController.%operationName%');


end.
