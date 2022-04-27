unit RQContactController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQContactTypeController
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

  RQContact            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContactRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQContact = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : WideString;
    FdateLostActuality : TXSDate;
    Forg_id : Integer;
    FaxOrgId : Integer;
//???
    FtypeRef : RQContactTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property value : WideString read Fvalue write Fvalue;
    property dateLostActuality : TXSDate read FdateLostActuality write FdateLostActuality;
    property  org_id : Integer read Forg_id write Forg_id;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property typeRef : RQContactTypeRef read FtypeRef write FtypeRef;
  end;

{
  RQContactFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fvalue : WideString;
    FdateLostActuality : TXSDate;
    Forg_id : Integer;
    FaxOrgId : Integer;
//???
    FtypeRef : RQContactTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property value : WideString read Fvalue write Fvalue;
    property dateLostActuality : TXSDate read FdateLostActuality write FdateLostActuality;
    property  org_id : Integer read Forg_id write Forg_id;
    property  axOrgId : Integer read FaxOrgId write FaxOrgId;
    property typeRef : RQContactTypeRef read FtypeRef write FtypeRef;
  end;
}

  RQContactFilter = class(RQContact)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQContactShort = class(TRemotable)
  private
    Fcode : Integer;
    Fvalue : WideString;
    FdateLostActuality : TXSDate;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property value : WideString read Fvalue write Fvalue;
    property dateLostActuality : TXSDate read FdateLostActuality write FdateLostActuality;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfRQContactShort = array of RQContactShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQContactShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQContactShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQContactShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQContactController/message/
  // soapAction: http://ksoe.org/RQContactController/action/RQContactController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQContactControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQContactController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQContactControllerSoapPort = interface(IInvokable)
  ['{37B8C2A6-0BD8-4CA7-BB19-1C0F7FA64E98}']
    function add(const aRQContact: RQContact): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQContact: RQContact); stdcall;
    function getObject(const anObjectCode: Integer): RQContact; stdcall;
    function getList: RQContactShortList; stdcall;
    function getFilteredList(const aRQContactFilter: RQContactFilter): RQContactShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQContactShortList; stdcall;
    function getScrollableFilteredList(const aRQContactFilter: RQContactFilter; const aFromPosition: Integer; const aQuantity: Integer): RQContactShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQContactShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQContactFilter: RQContactFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQContactShort; stdcall;
  end;


implementation

  destructor RQContact.Destroy;
  begin
    if Assigned(FdateLostActuality) then
      dateLostActuality.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor RQContactFilter.Destroy;
  begin
    if Assigned(FdateLostActuality) then
      dateLostActuality.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor RQContactFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQContactShort.Destroy;
  begin
    if Assigned(FdateLostActuality) then
      dateLostActuality.Free;
    inherited Destroy;
  end;

  destructor RQContactShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQContact, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContact');
  RemClassRegistry.RegisterXSClass(RQContactRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactRef');
  RemClassRegistry.RegisterXSClass(RQContactFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactFilter');
  RemClassRegistry.RegisterXSClass(RQContactShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactShort');
  RemClassRegistry.RegisterXSClass(RQContactShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQContactShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQContactShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQContactShort');

  InvRegistry.RegisterInterface(TypeInfo(RQContactControllerSoapPort), 'http://ksoe.org/RQContactController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQContactControllerSoapPort), 'http://ksoe.org/RQContactController/action/RQContactController.%operationName%');


end.
