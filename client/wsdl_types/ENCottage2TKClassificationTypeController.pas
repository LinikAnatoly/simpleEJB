unit ENCottage2TKClassificationTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKClassificationTypeController
   ,ENCottageController
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

  ENCottage2TKClassificationType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCottage2TKClassificationTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCottage2TKClassificationType = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
//???
    FcottageRef : ENCottageRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
    property cottageRef : ENCottageRef read FcottageRef write FcottageRef;
  end;

{
  ENCottage2TKClassificationTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
//???
    FcottageRef : ENCottageRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
    property cottageRef : ENCottageRef read FcottageRef write FcottageRef;
  end;
}

  ENCottage2TKClassificationTypeFilter = class(ENCottage2TKClassificationType)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCottage2TKClassificationTypeShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FclassificationTypeRefCode : Integer;
    FclassificationTypeRefName : WideString;
    FclassificationTypeRefKod : WideString;
    FcottageRefCode : Integer;
    FcottageRefNumberGen : WideString;
    FcottageRefNumberBeds : Integer;
    FcottageRefDescription : WideString;
    FcottageRefCommentgen : WideString;
    FcottageRefUserGen : WideString;
    FcottageRefDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property classificationTypeRefCode : Integer read FclassificationTypeRefCode write FclassificationTypeRefCode;
    property classificationTypeRefName : WideString read FclassificationTypeRefName write FclassificationTypeRefName;
    property classificationTypeRefKod : WideString read FclassificationTypeRefKod write FclassificationTypeRefKod;
    property cottageRefCode : Integer read FcottageRefCode write FcottageRefCode;
    property cottageRefNumberGen : WideString read FcottageRefNumberGen write FcottageRefNumberGen;
    property cottageRefNumberBeds : Integer read FcottageRefNumberBeds write FcottageRefNumberBeds;
    property cottageRefDescription : WideString read FcottageRefDescription write FcottageRefDescription;
    property cottageRefCommentgen : WideString read FcottageRefCommentgen write FcottageRefCommentgen;
    property cottageRefUserGen : WideString read FcottageRefUserGen write FcottageRefUserGen;
    property cottageRefDateEdit : TXSDateTime read FcottageRefDateEdit write FcottageRefDateEdit;
  end;

  ArrayOfENCottage2TKClassificationTypeShort = array of ENCottage2TKClassificationTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCottage2TKClassificationTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCottage2TKClassificationTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCottage2TKClassificationTypeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCottage2TKClassificationTypeController/message/
  // soapAction: http://ksoe.org/ENCottage2TKClassificationTypeController/action/ENCottage2TKClassificationTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCottage2TKClassificationTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCottage2TKClassificationTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCottage2TKClassificationTypeControllerSoapPort = interface(IInvokable)
  ['{59072060-8FB9-4A06-AF57-8FED42F3B1BD}']
    function add(const aENCottage2TKClassificationType: ENCottage2TKClassificationType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCottage2TKClassificationType: ENCottage2TKClassificationType); stdcall;
    function getObject(const anObjectCode: Integer): ENCottage2TKClassificationType; stdcall;
    function getList: ENCottage2TKClassificationTypeShortList; stdcall;
    function getFilteredList(const aENCottage2TKClassificationTypeFilter: ENCottage2TKClassificationTypeFilter): ENCottage2TKClassificationTypeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCottage2TKClassificationTypeShortList; stdcall;
    function getScrollableFilteredList(const aENCottage2TKClassificationTypeFilter: ENCottage2TKClassificationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCottage2TKClassificationTypeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCottage2TKClassificationTypeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCottage2TKClassificationTypeFilter: ENCottage2TKClassificationTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCottage2TKClassificationTypeShort; stdcall;
  end;


implementation

  destructor ENCottage2TKClassificationType.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FcottageRef) then
      cottageRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCottage2TKClassificationTypeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    if Assigned(FcottageRef) then
      cottageRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCottage2TKClassificationTypeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCottage2TKClassificationTypeShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcottageRefDateEdit) then
      cottageRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENCottage2TKClassificationTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCottage2TKClassificationType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage2TKClassificationType');
  RemClassRegistry.RegisterXSClass(ENCottage2TKClassificationTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage2TKClassificationTypeRef');
  RemClassRegistry.RegisterXSClass(ENCottage2TKClassificationTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage2TKClassificationTypeFilter');
  RemClassRegistry.RegisterXSClass(ENCottage2TKClassificationTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage2TKClassificationTypeShort');
  RemClassRegistry.RegisterXSClass(ENCottage2TKClassificationTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCottage2TKClassificationTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCottage2TKClassificationTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCottage2TKClassificationTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCottage2TKClassificationTypeControllerSoapPort), 'http://ksoe.org/ENCottage2TKClassificationTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCottage2TKClassificationTypeControllerSoapPort), 'http://ksoe.org/ENCottage2TKClassificationTypeController/action/ENCottage2TKClassificationTypeController.%operationName%');


end.
