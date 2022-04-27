unit ENDocAttachment2ENWarrantController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentController
   ,ENWarrantController
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

  ENDocAttachment2ENWarrant            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENWarrantRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2ENWarrant = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;

{
  ENDocAttachment2ENWarrantFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;
}

  ENDocAttachment2ENWarrantFilter = class(ENDocAttachment2ENWarrant)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachment2ENWarrantShort = class(TRemotable)
  private
    Fcode : Integer;
    FdocAttachmentRefCode : Integer;
    FdocAttachmentRefCommentGen : WideString;
    FdocAttachmentRefFileLink : WideString;
    FdocAttachmentRefUserAdd : WideString;
    FdocAttachmentRefDateAdd : TXSDateTime;
    FdocAttachmentRefUserGen : WideString;
    FdocAttachmentRefDateEdit : TXSDateTime;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property docAttachmentRefCode : Integer read FdocAttachmentRefCode write FdocAttachmentRefCode;
    property docAttachmentRefCommentGen : WideString read FdocAttachmentRefCommentGen write FdocAttachmentRefCommentGen;
    property docAttachmentRefFileLink : WideString read FdocAttachmentRefFileLink write FdocAttachmentRefFileLink;
    property docAttachmentRefUserAdd : WideString read FdocAttachmentRefUserAdd write FdocAttachmentRefUserAdd;
    property docAttachmentRefDateAdd : TXSDateTime read FdocAttachmentRefDateAdd write FdocAttachmentRefDateAdd;
    property docAttachmentRefUserGen : WideString read FdocAttachmentRefUserGen write FdocAttachmentRefUserGen;
    property docAttachmentRefDateEdit : TXSDateTime read FdocAttachmentRefDateEdit write FdocAttachmentRefDateEdit;
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
  end;

  ArrayOfENDocAttachment2ENWarrantShort = array of ENDocAttachment2ENWarrantShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachment2ENWarrantShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachment2ENWarrantShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachment2ENWarrantShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachment2ENWarrantController/message/
  // soapAction: http://ksoe.org/ENDocAttachment2ENWarrantController/action/ENDocAttachment2ENWarrantController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachment2ENWarrantControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachment2ENWarrantController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachment2ENWarrantControllerSoapPort = interface(IInvokable)
  ['{620A0EF8-AED2-44C4-8C33-B5BEE7E84990}']

      function add(const aENDocAttachment: ENDocAttachment;
             const aFile: ArrayOfByte;
             const fileName: WideString;
             const warCode: Integer) : Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment;
             const aFile: ArrayOfByte;
             const fileName: WideString;
             const warCode: Integer;
             const kindCode: Integer) : Integer; stdcall; overload;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachment2ENWarrant: ENDocAttachment2ENWarrant); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment2ENWarrant; stdcall;
    function getList: ENDocAttachment2ENWarrantShortList; stdcall;
    function getFilteredList(const aENDocAttachment2ENWarrantFilter: ENDocAttachment2ENWarrantFilter): ENDocAttachment2ENWarrantShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENWarrantShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachment2ENWarrantFilter: ENDocAttachment2ENWarrantFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENWarrantShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2ENWarrantShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachment2ENWarrantFilter: ENDocAttachment2ENWarrantFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachment2ENWarrantShort; stdcall;
  end;


implementation

  destructor ENDocAttachment2ENWarrant.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachment2ENWarrantFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachment2ENWarrantFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENWarrantShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    inherited Destroy;
  end;

  destructor ENDocAttachment2ENWarrantShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENWarrant, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENWarrant');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENWarrantRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENWarrantRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENWarrantFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENWarrantFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENWarrantShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENWarrantShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2ENWarrantShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2ENWarrantShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachment2ENWarrantShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachment2ENWarrantShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachment2ENWarrantControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENWarrantController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachment2ENWarrantControllerSoapPort), 'http://ksoe.org/ENDocAttachment2ENWarrantController/action/ENDocAttachment2ENWarrantController.%operationName%');


end.
