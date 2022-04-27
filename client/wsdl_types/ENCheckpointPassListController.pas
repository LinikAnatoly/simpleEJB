unit ENCheckpointPassListController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENCheckpointController
   ,ENTransportDepartmentController
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

  ENCheckpointPassList            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointPassListRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointPassList = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FcheckpointRef : ENCheckpointRef;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property checkpointRef : ENCheckpointRef read FcheckpointRef write FcheckpointRef;
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef;
  end;

{
  ENCheckpointPassListFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : DateTime;
    FdateFinal : DateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FcheckpointRef : ENCheckpointRef;
//???
    FtransportDepartmentRef : ENTransportDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateStart : DateTime;
    property dateFinal : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property checkpointRef : ENCheckpointRef read FcheckpointRef write FcheckpointRef;
    property transportDepartmentRef : ENTransportDepartmentRef read FtransportDepartmentRef write FtransportDepartmentRef;
  end;
}

  ENCheckpointPassListFilter = class(ENCheckpointPassList)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCheckpointPassListShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDateTime;
    FdateFinal : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcheckpointRefCode : Integer;
    FcheckpointRefName : WideString;
    FtransportDepartmentRefCode : Integer;
    FtransportDepartmentRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDateTime read FdateStart write FdateStart;
    property dateFinal : TXSDateTime read FdateFinal write FdateFinal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property checkpointRefCode : Integer read FcheckpointRefCode write FcheckpointRefCode;
    property checkpointRefName : WideString read FcheckpointRefName write FcheckpointRefName;
    property transportDepartmentRefCode : Integer read FtransportDepartmentRefCode write FtransportDepartmentRefCode;
    property transportDepartmentRefName : WideString read FtransportDepartmentRefName write FtransportDepartmentRefName;
  end;

  ArrayOfENCheckpointPassListShort = array of ENCheckpointPassListShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCheckpointPassListShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCheckpointPassListShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCheckpointPassListShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCheckpointPassListController/message/
  // soapAction: http://ksoe.org/ENCheckpointPassListController/action/ENCheckpointPassListController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCheckpointPassListControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCheckpointPassListController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCheckpointPassListControllerSoapPort = interface(IInvokable)
  ['{e9f7e9f7-e9f7-e9f7-e9f7-e9f7e9f7e9f7}']
    function add(const aENCheckpointPassList: ENCheckpointPassList): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCheckpointPassList: ENCheckpointPassList); stdcall;
    function getObject(const anObjectCode: Integer): ENCheckpointPassList; stdcall;
    function getList: ENCheckpointPassListShortList; stdcall;
    function getFilteredList(const aENCheckpointPassListFilter: ENCheckpointPassListFilter): ENCheckpointPassListShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListShortList; stdcall;
    function getScrollableFilteredList(const aENCheckpointPassListFilter: ENCheckpointPassListFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCheckpointPassListFilter: ENCheckpointPassListFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCheckpointPassListShort; stdcall;
  end;


implementation

  destructor ENCheckpointPassList.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcheckpointRef) then
      checkpointRef.Free;
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCheckpointPassListFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcheckpointRef) then
      checkpointRef.Free;
    if Assigned(FtransportDepartmentRef) then
      transportDepartmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCheckpointPassListFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCheckpointPassListShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENCheckpointPassListShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCheckpointPassList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassList');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListRef');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListFilter');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListShort');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCheckpointPassListShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCheckpointPassListShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCheckpointPassListControllerSoapPort), 'http://ksoe.org/ENCheckpointPassListController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCheckpointPassListControllerSoapPort), 'http://ksoe.org/ENCheckpointPassListController/action/ENCheckpointPassListController.%operationName%');


end.
