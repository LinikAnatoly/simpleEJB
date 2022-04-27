unit ENActPostingKindController;

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

  ENActPostingKind            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingKindRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActPostingKind = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
    FdateTemplate : TXSDateTime;
    Faccount_expense : WideString;
    Fkau_expense : WideString;
    Faccount_closing : WideString;
    Fkau_closing : WideString;
    FtypeOperMatetialsAct : WideString;
    FtypeOperMatetialsOrder : WideString;
    FtypeOperCountersAct : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property dateTemplate : TXSDateTime read FdateTemplate write FdateTemplate;
    property account_expense : WideString read Faccount_expense write Faccount_expense;
    property kau_expense : WideString read Fkau_expense write Fkau_expense;
    property account_closing : WideString read Faccount_closing write Faccount_closing;
    property kau_closing : WideString read Fkau_closing write Fkau_closing;
    property typeOperMatetialsAct : WideString read FtypeOperMatetialsAct write FtypeOperMatetialsAct;
    property typeOperMatetialsOrder : WideString read FtypeOperMatetialsOrder write FtypeOperMatetialsOrder;
    property typeOperCountersAct : WideString read FtypeOperCountersAct write FtypeOperCountersAct;
  end;

{
  ENActPostingKindFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
    FdateTemplate : TXSDateTime;
    Faccount_expense : WideString;
    Fkau_expense : WideString;
    Faccount_closing : WideString;
    Fkau_closing : WideString;
    FtypeOperMatetialsAct : WideString;
    FtypeOperMatetialsOrder : WideString;
    FtypeOperCountersAct : WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property dateTemplate : TXSDateTime read FdateTemplate write FdateTemplate;
    property account_expense : WideString read Faccount_expense write Faccount_expense;
    property kau_expense : WideString read Fkau_expense write Fkau_expense;
    property account_closing : WideString read Faccount_closing write Faccount_closing;
    property kau_closing : WideString read Fkau_closing write Fkau_closing;
    property typeOperMatetialsAct : WideString read FtypeOperMatetialsAct write FtypeOperMatetialsAct;
    property typeOperMatetialsOrder : WideString read FtypeOperMatetialsOrder write FtypeOperMatetialsOrder;
    property typeOperCountersAct : WideString read FtypeOperCountersAct write FtypeOperCountersAct;
  end;
}

  ENActPostingKindFilter = class(ENActPostingKind)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActPostingKindShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    Fname : WideString;
    FdateTemplate : TXSDateTime;
    Faccount_expense : WideString;
    Fkau_expense : WideString;
    Faccount_closing : WideString;
    Fkau_closing : WideString;
    FtypeOperMatetialsAct : WideString;
    FtypeOperMatetialsOrder : WideString;
    FtypeOperCountersAct : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property name : WideString read Fname write Fname;
    property dateTemplate : TXSDateTime read FdateTemplate write FdateTemplate;
    property account_expense : WideString read Faccount_expense write Faccount_expense;
    property kau_expense : WideString read Fkau_expense write Fkau_expense;
    property account_closing : WideString read Faccount_closing write Faccount_closing;
    property kau_closing : WideString read Fkau_closing write Fkau_closing;
    property typeOperMatetialsAct : WideString read FtypeOperMatetialsAct write FtypeOperMatetialsAct;
    property typeOperMatetialsOrder : WideString read FtypeOperMatetialsOrder write FtypeOperMatetialsOrder;
    property typeOperCountersAct : WideString read FtypeOperCountersAct write FtypeOperCountersAct;

  end;

  ArrayOfENActPostingKindShort = array of ENActPostingKindShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActPostingKindShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActPostingKindShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActPostingKindShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActPostingKindController/message/
  // soapAction: http://ksoe.org/ENActPostingKindController/action/ENActPostingKindController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActPostingKindControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActPostingKindController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActPostingKindControllerSoapPort = interface(IInvokable)
  ['{D94B78FD-943D-41D6-9151-F4CA97104ACB}']
    function add(const aENActPostingKind: ENActPostingKind): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActPostingKind: ENActPostingKind); stdcall;
    function getObject(const anObjectCode: Integer): ENActPostingKind; stdcall;
    function getList: ENActPostingKindShortList; stdcall;
    function getFilteredList(const aENActPostingKindFilter: ENActPostingKindFilter): ENActPostingKindShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindShortList; stdcall;
    function getScrollableFilteredList(const aENActPostingKindFilter: ENActPostingKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActPostingKindShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActPostingKindFilter: ENActPostingKindFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActPostingKindShort; stdcall;
  end;


implementation

  destructor ENActPostingKind.Destroy;
  begin
    if Assigned(FdateTemplate) then
      dateTemplate.Free;
    inherited Destroy;
  end;

{
  destructor ENActPostingKindFilter.Destroy;
  begin
    if Assigned(FdateTemplate) then
      dateTemplate.Free;
    inherited Destroy;
  end;
}

  destructor ENActPostingKindFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActPostingKindShort.Destroy;
  begin
    if Assigned(FdateTemplate) then
      dateTemplate.Free;
    inherited Destroy;
  end;

  destructor ENActPostingKindShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActPostingKind, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKind');
  RemClassRegistry.RegisterXSClass(ENActPostingKindRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindRef');
  RemClassRegistry.RegisterXSClass(ENActPostingKindFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindFilter');
  RemClassRegistry.RegisterXSClass(ENActPostingKindShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindShort');
  RemClassRegistry.RegisterXSClass(ENActPostingKindShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActPostingKindShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActPostingKindShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActPostingKindShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActPostingKindControllerSoapPort), 'http://ksoe.org/ENActPostingKindController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActPostingKindControllerSoapPort), 'http://ksoe.org/ENActPostingKindController/action/ENActPostingKindController.%operationName%');


end.
