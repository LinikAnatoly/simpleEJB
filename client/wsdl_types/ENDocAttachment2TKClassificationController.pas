unit ENDocAttachment2TKClassificationController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDocAttachmentController
   ,TKClassificationTypeController
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

  ENDocAttachment2TKClassification            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2TKClassificationRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDocAttachment2TKClassification = class(TRemotable)
  private
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
  end;

{
  ENDocAttachment2TKClassificationFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FdocAttachmentRef : ENDocAttachmentRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property docAttachmentRef : ENDocAttachmentRef read FdocAttachmentRef write FdocAttachmentRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
  end;
}

  ENDocAttachment2TKClassificationFilter = class(ENDocAttachment2TKClassification)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDocAttachment2TKClassificationShort = class(TRemotable)
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
    FclassificationTypeRefCode : Integer;
    FclassificationTypeRefName : WideString;
    FclassificationTypeRefKod : WideString;
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
    property classificationTypeRefCode : Integer read FclassificationTypeRefCode write FclassificationTypeRefCode;
    property classificationTypeRefName : WideString read FclassificationTypeRefName write FclassificationTypeRefName;
    property classificationTypeRefKod : WideString read FclassificationTypeRefKod write FclassificationTypeRefKod;
  end;

  ArrayOfENDocAttachment2TKClassificationShort = array of ENDocAttachment2TKClassificationShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDocAttachment2TKClassificationShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDocAttachment2TKClassificationShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDocAttachment2TKClassificationShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDocAttachment2TKClassificationController/message/
  // soapAction: http://ksoe.org/ENDocAttachment2TKClassificationController/action/ENDocAttachment2TKClassificationController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDocAttachment2TKClassificationControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDocAttachment2TKClassificationController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDocAttachment2TKClassificationControllerSoapPort = interface(IInvokable)
  ['{40F93064-8354-4055-948E-4E5ABA37FB85}']
    function add(const aENDocAttachment2TKClassification: ENDocAttachment2TKClassification): Integer; stdcall; overload;
    function add(const aENDocAttachment: ENDocAttachment;
                 const aFile: ArrayOfByte;
                 const fileName: WideString;
                 const tkClassificationTypeCode: Integer) : Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDocAttachment2TKClassification: ENDocAttachment2TKClassification); stdcall;
    function getObject(const anObjectCode: Integer): ENDocAttachment2TKClassification; stdcall;
    function getList: ENDocAttachment2TKClassificationShortList; stdcall;
    function getFilteredList(const aENDocAttachment2TKClassificationFilter: ENDocAttachment2TKClassificationFilter): ENDocAttachment2TKClassificationShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKClassificationShortList; stdcall;
    function getScrollableFilteredList(const aENDocAttachment2TKClassificationFilter: ENDocAttachment2TKClassificationFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKClassificationShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDocAttachment2TKClassificationShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDocAttachment2TKClassificationFilter: ENDocAttachment2TKClassificationFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDocAttachment2TKClassificationShort; stdcall;
  end;


implementation

  destructor ENDocAttachment2TKClassification.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDocAttachment2TKClassificationFilter.Destroy;
  begin
    if Assigned(FdocAttachmentRef) then
      docAttachmentRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDocAttachment2TKClassificationFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDocAttachment2TKClassificationShort.Destroy;
  begin
    if Assigned(FdocAttachmentRefDateAdd) then
      docAttachmentRefDateAdd.Free;
    if Assigned(FdocAttachmentRefDateEdit) then
      docAttachmentRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENDocAttachment2TKClassificationShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKClassification, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKClassification');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKClassificationRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKClassificationRef');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKClassificationFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKClassificationFilter');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKClassificationShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKClassificationShort');
  RemClassRegistry.RegisterXSClass(ENDocAttachment2TKClassificationShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDocAttachment2TKClassificationShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDocAttachment2TKClassificationShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDocAttachment2TKClassificationShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDocAttachment2TKClassificationControllerSoapPort), 'http://ksoe.org/ENDocAttachment2TKClassificationController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDocAttachment2TKClassificationControllerSoapPort), 'http://ksoe.org/ENDocAttachment2TKClassificationController/action/ENDocAttachment2TKClassificationController.%operationName%');


end.
