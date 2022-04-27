unit ENDocAttachment2TKTechCardController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentController
   ,TKTechCardController
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

  ENDocAttachment2TKTechCard            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2TKTechCardRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2TKTechCard = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FtechCardRef : TKTechCardRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property techCardRef : TKTechCardRef read FtechCardRef write FtechCardRef;
  end;

{
  ENDocAttachment2TKTechCardFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FtechCardRef : TKTechCardRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property techCardRef : TKTechCardRef read FtechCardRef write FtechCardRef;
  end;
}

  ENDocAttachment2TKTechCardFilter = class(ENDocAttachment2TKTechCard)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachment2TKTechCardShort = class(TRemotable)
  private
    Fcode : Integer;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefFilesize : Int64;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
    FtechCardRefCode : Integer;
    FtechCardRefTechKartNumber : WideString;
    FtechCardRefName : WideString;
    FtechCardRefSafety : WideString;
    FtechCardRefDateCreation : TXSDate;
    FtechCardRefDateFrom : TXSDate;
    FtechCardRefDateTo : TXSDate;
    FtechCardRefWorkconditions : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefFilesize : Int64 read FdocAttachmentRefFilesize write FdocAttachmentRefFilesize;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
    property techCardRefCode : Integer read FtechCardRefCode write FtechCardRefCode;
    property techCardRefTechKartNumber : WideString read FtechCardRefTechKartNumber write FtechCardRefTechKartNumber;
    property techCardRefName : WideString read FtechCardRefName write FtechCardRefName;
    property techCardRefSafety : WideString read FtechCardRefSafety write FtechCardRefSafety;
    property techCardRefDateCreation : TXSDate read FtechCardRefDateCreation write FtechCardRefDateCreation;
    property techCardRefDateFrom : TXSDate read FtechCardRefDateFrom write FtechCardRefDateFrom;
    property techCardRefDateTo : TXSDate read FtechCardRefDateTo write FtechCardRefDateTo;
    property techCardRefWorkconditions : WideString read FtechCardRefWorkconditions write FtechCardRefWorkconditions;
  end;

  ArrayOfENDocAttachment2TKTechCardShort = array of ENDocAttachment2TKTechCardShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachment2TKTechCardShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachment2TKTechCardShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachment2TKTechCardShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachment2TKTechCardController/message/
  // soapAction: http://ksoe.org/ENDocAttachment2TKTechCardController/action/ENDocAttachment2TKTechCardController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachment2TKTechCardControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachment2TKTechCardController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachment2TKTechCardControllerSoapPort = interface(IInvokable)
  ['{E1F236C5-CA1C-44CD-A1EA-1772AF64F50A}']
    function add(const aENDocAttachment2TKTechCard: ENDocAttachment2TKTechCard): Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment;
                 const aFile: ArrayOfByte;
                 const fileName: WideString;
                 const tkTechCardCode: Integer) : Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachment2TKTechCard: ENDocAttachment2TKTechCard); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment2TKTechCard; stdcall;
    function getList: ENDocAttachment2TKTechCardShortList; stdcall;
    function getFilteredList(const aENDocAttachment2TKTechCardFilter: ENDocAttachment2TKTechCardFilter): ENDocAttachment2TKTechCardShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKTechCardShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachment2TKTechCardFilter: ENDocAttachment2TKTechCardFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKTechCardShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKTechCardShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachment2TKTechCardFilter: ENDocAttachment2TKTechCardFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachment2TKTechCardShort; stdcall;
  end;


implementation

  destructor ENDocAttachment2TKTechCard.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FtechCardRef) then
      techCardRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachment2TKTechCardFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FtechCardRef) then
      techCardRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachment2TKTechCardFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachment2TKTechCardShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    if Assigned(FtechCardRefDateCreation) then
      techCardRefDateCreation.Free;
    if Assigned(FtechCardRefDateFrom) then
      techCardRefDateFrom.Free;
    if Assigned(FtechCardRefDateTo) then
      techCardRefDateTo.Free;
    inherited Destroy;
  end;

  destructor ENDocAttachment2TKTechCardShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKTechCard, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKTechCard');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKTechCardRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKTechCardRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKTechCardFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKTechCardFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKTechCardShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKTechCardShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKTechCardShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKTechCardShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachment2TKTechCardShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachment2TKTechCardShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachment2TKTechCardControllerSoapPort), 'http://ksoe.org/ENDocAttachment2TKTechCardController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachment2TKTechCardControllerSoapPort), 'http://ksoe.org/ENDocAttachment2TKTechCardController/action/ENDocAttachment2TKTechCardController.%operationName%');


end.
