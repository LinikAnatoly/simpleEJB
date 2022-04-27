unit ENGeographicDepartmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENGeographicDepartment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeographicDepartmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGeographicDepartment = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENGeographicDepartmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENGeographicDepartmentFilter = class(ENGeographicDepartment)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGeographicDepartmentShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

  end;

  ArrayOfENGeographicDepartmentShort = array of ENGeographicDepartmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGeographicDepartmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGeographicDepartmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGeographicDepartmentShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGeographicDepartmentController/message/
  // soapAction: http://ksoe.org/ENGeographicDepartmentController/action/ENGeographicDepartmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGeographicDepartmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGeographicDepartmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGeographicDepartmentControllerSoapPort = interface(IInvokable)
  ['{19A648A4-7250-46FA-B1D2-17567B6E0D3B}']
    function add(const aENGeographicDepartment: ENGeographicDepartment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGeographicDepartment: ENGeographicDepartment); stdcall;
    function getObject(const anObjectCode: Integer): ENGeographicDepartment; stdcall;
    function getList: ENGeographicDepartmentShortList; stdcall;
    function getFilteredList(const aENGeographicDepartmentFilter: ENGeographicDepartmentFilter): ENGeographicDepartmentShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGeographicDepartmentShortList; stdcall;
    function getScrollableFilteredList(const aENGeographicDepartmentFilter: ENGeographicDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGeographicDepartmentShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGeographicDepartmentShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGeographicDepartmentFilter: ENGeographicDepartmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGeographicDepartmentShort; stdcall;
  end;


implementation

  destructor ENGeographicDepartment.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

{
  destructor ENGeographicDepartmentFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;
}

  destructor ENGeographicDepartmentFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGeographicDepartmentShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENGeographicDepartmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGeographicDepartment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeographicDepartment');
  RemClassRegistry.RegisterXSClass(ENGeographicDepartmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeographicDepartmentRef');
  RemClassRegistry.RegisterXSClass(ENGeographicDepartmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeographicDepartmentFilter');
  RemClassRegistry.RegisterXSClass(ENGeographicDepartmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeographicDepartmentShort');
  RemClassRegistry.RegisterXSClass(ENGeographicDepartmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGeographicDepartmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGeographicDepartmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGeographicDepartmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGeographicDepartmentControllerSoapPort), 'http://ksoe.org/ENGeographicDepartmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGeographicDepartmentControllerSoapPort), 'http://ksoe.org/ENGeographicDepartmentController/action/ENGeographicDepartmentController.%operationName%');


end.
