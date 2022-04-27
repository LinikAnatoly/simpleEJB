unit ENActFailureController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActFailureReasonController
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

  ENActFailure            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActFailureRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActFailure = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateAct : TXSDateTime;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FreasonRef : ENActFailureReasonRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateAct : TXSDateTime read FdateAct write FdateAct;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property reasonRef : ENActFailureReasonRef read FreasonRef write FreasonRef;
  end;

{
  ENActFailureFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateAct : DateTime;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FreasonRef : ENActFailureReasonRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateAct : DateTime;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property reasonRef : ENActFailureReasonRef read FreasonRef write FreasonRef;
  end;
}

  ENActFailureFilter = class(ENActFailure)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActFailureShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateAct : TXSDateTime;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FreasonRefCode : Integer;
    FreasonRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateAct : TXSDateTime read FdateAct write FdateAct;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property reasonRefCode : Integer read FreasonRefCode write FreasonRefCode;
    property reasonRefName : WideString read FreasonRefName write FreasonRefName;
  end;

  ArrayOfENActFailureShort = array of ENActFailureShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActFailureShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActFailureShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActFailureShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActFailureController/message/
  // soapAction: http://ksoe.org/ENActFailureController/action/ENActFailureController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActFailureControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActFailureController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActFailureControllerSoapPort = interface(IInvokable)
  ['{25ee25ee-25ee-25ee-25ee-25ee25ee25ee}']
    function add(const aENActFailure: ENActFailure): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActFailure: ENActFailure); stdcall;
    function getObject(const anObjectCode: Integer): ENActFailure; stdcall;
    function getList: ENActFailureShortList; stdcall;
    function getFilteredList(const aENActFailureFilter: ENActFailureFilter): ENActFailureShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActFailureShortList; stdcall;
    function getScrollableFilteredList(const aENActFailureFilter: ENActFailureFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActFailureShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActFailureShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActFailureFilter: ENActFailureFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActFailureShort; stdcall;
  end;


implementation

  destructor ENActFailure.Destroy;
  begin
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FreasonRef) then
      reasonRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActFailureFilter.Destroy;
  begin
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FreasonRef) then
      reasonRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActFailureFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActFailureShort.Destroy;
  begin
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENActFailureShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActFailure, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailure');
  RemClassRegistry.RegisterXSClass(ENActFailureRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureRef');
  RemClassRegistry.RegisterXSClass(ENActFailureFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureFilter');
  RemClassRegistry.RegisterXSClass(ENActFailureShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureShort');
  RemClassRegistry.RegisterXSClass(ENActFailureShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFailureShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActFailureShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActFailureShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActFailureControllerSoapPort), 'http://ksoe.org/ENActFailureController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActFailureControllerSoapPort), 'http://ksoe.org/ENActFailureController/action/ENActFailureController.%operationName%');


end.
