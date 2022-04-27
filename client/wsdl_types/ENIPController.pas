unit ENIPController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENIPStatusController
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

  ENIP            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIP = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENIPStatusRef;
//???
    FparentRef : ENIPRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENIPStatusRef read FstatusRef write FstatusRef;
    property parentRef : ENIPRef read FparentRef write FparentRef;
  end;

{
  ENIPFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : DateTime;
    FdateEdit : DateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : ENIPStatusRef;
//???
    FparentRef : ENIPRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : DateTime;
    property dateEdit : DateTime;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENIPStatusRef read FstatusRef write FstatusRef;
    property parentRef : ENIPRef read FparentRef write FparentRef;
  end;
}

  ENIPFilter = class(ENIP)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FyearGen : Integer;
    Fversion : Integer;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FparentRefCode : Integer;
    FparentRefName : WideString;
    FparentRefYearGen : Integer;
    FparentRefVersion : Integer;
    FparentRefCommentGen : WideString;
    FparentRefDateAdd : TXSDateTime;
    FparentRefDateEdit : TXSDateTime;
    FparentRefUserAdd : WideString;
    FparentRefUserEdit : WideString;
    FlastIpCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  yearGen : Integer read FyearGen write FyearGen;
    property  version : Integer read Fversion write Fversion;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property parentRefCode : Integer read FparentRefCode write FparentRefCode;
    property parentRefName : WideString read FparentRefName write FparentRefName;
    property parentRefYearGen : Integer read FparentRefYearGen write FparentRefYearGen;
    property parentRefVersion : Integer read FparentRefVersion write FparentRefVersion;
    property parentRefCommentGen : WideString read FparentRefCommentGen write FparentRefCommentGen;
    property parentRefDateAdd : TXSDateTime read FparentRefDateAdd write FparentRefDateAdd;
    property parentRefDateEdit : TXSDateTime read FparentRefDateEdit write FparentRefDateEdit;
    property parentRefUserAdd : WideString read FparentRefUserAdd write FparentRefUserAdd;
    property parentRefUserEdit : WideString read FparentRefUserEdit write FparentRefUserEdit;

    property lastIpCode : Integer read FlastIpCode write FlastIpCode;
  end;

  ArrayOfENIPShort = array of ENIPShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPController/message/
  // soapAction: http://ksoe.org/ENIPController/action/ENIPController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPControllerSoapPort = interface(IInvokable)
  ['{C617DB03-235F-44DA-A277-5D31AC27734C}']
    function add(const aENIP: ENIP): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIP: ENIP); stdcall;
    function getObject(const anObjectCode: Integer): ENIP; stdcall;
    function getList: ENIPShortList; stdcall;
    function getFilteredList(const aENIPFilter: ENIPFilter): ENIPShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPShortList; stdcall;
    function getScrollableFilteredList(const aENIPFilter: ENIPFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPFilter: ENIPFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPShort; stdcall;

    procedure ñopyNewVersionIP(const anObjectCode: Integer); stdcall;

    procedure create(const anObjectCode: Integer); stdcall;
    procedure undoCreate(const anObjectCode: Integer); stdcall;
    procedure approve(const anObjectCode: Integer); stdcall;
    procedure undoApprove(const anObjectCode: Integer); stdcall;

    procedure test_admin(const anObjectCode: Integer); stdcall;
  end;


implementation

  destructor ENIP.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENIPFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FparentRef) then
      parentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENIPFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENIPShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FparentRefDateAdd) then
      parentRefDateAdd.Free;
    if Assigned(FparentRefDateEdit) then
      parentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENIPShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIP, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIP');
  RemClassRegistry.RegisterXSClass(ENIPRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPRef');
  RemClassRegistry.RegisterXSClass(ENIPFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPFilter');
  RemClassRegistry.RegisterXSClass(ENIPShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPShort');
  RemClassRegistry.RegisterXSClass(ENIPShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPControllerSoapPort), 'http://ksoe.org/ENIPController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPControllerSoapPort), 'http://ksoe.org/ENIPController/action/ENIPController.%operationName%');


end.
