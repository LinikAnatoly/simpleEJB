unit ENPhotoFactController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENWorkOrderBytController
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

  ENPhotoFact            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPhotoFactRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPhotoFact = class(TRemotable)
  private
    Fcode : Integer;
    Fdescription : WideString;
    FdateFact : TXSDateTime;
    FactNumber : WideString;
    FpersonalAccount : WideString;
    FpersonalAccountUid : WideString;
    FrecordpointCode : Integer;
    FcustomerFIO : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
//???
    FrenRef : EPRenRef;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;
    property dateFact : TXSDateTime read FdateFact write FdateFact;
    property actNumber : WideString read FactNumber write FactNumber;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property recordpointCode : Integer read FrecordpointCode write FrecordpointCode;
    property customerFIO : WideString read FcustomerFIO write FcustomerFIO;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
  end;

{
  ENPhotoFactFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fdescription : WideString;
    FdateFact : DateTime;
    FactNumber : WideString;
    FpersonalAccount : WideString;
    FpersonalAccountUid : WideString;
    FrecordpointCode : Integer;
    FcustomerFIO : WideString;
    FdateAdd : DateTime;
    FdateEdit : DateTime;
    FuserGen : WideString;
//???
    FrenRef : EPRenRef;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;
    property dateFact : DateTime;
    property actNumber : WideString read FactNumber write FactNumber;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property recordpointCode : Integer read FrecordpointCode write FrecordpointCode;
    property customerFIO : WideString read FcustomerFIO write FcustomerFIO;
    property dateAdd : DateTime;
    property dateEdit : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
  end;
}

  ENPhotoFactFilter = class(ENPhotoFact)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPhotoFactShort = class(TRemotable)
  private
    Fcode : Integer;
    Fdescription : WideString;
    FdateFact : TXSDateTime;
    FactNumber : WideString;
    FpersonalAccount : WideString;
    FpersonalAccountUid : WideString;
    FcustomerFIO : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FrenRefCode : Integer;
    FrenRefName : WideString;
    FworkOrderBytRefCode : Integer;
    FworkOrderBytRefNumberGen : WideString;
    FworkOrderBytRefDateGen : TXSDate;
    FworkOrderBytRefCommentGen : WideString;
    FworkOrderBytRefDateAdd : TXSDateTime;
    FworkOrderBytRefDateEdit : TXSDateTime;
    FworkOrderBytRefUserAdd : WideString;
    FworkOrderBytRefUserEdit : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;
    property dateFact : TXSDateTime read FdateFact write FdateFact;
    property actNumber : WideString read FactNumber write FactNumber;
    property personalAccount : WideString read FpersonalAccount write FpersonalAccount;
    property personalAccountUid : WideString read FpersonalAccountUid write FpersonalAccountUid;
    property customerFIO : WideString read FcustomerFIO write FcustomerFIO;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;
    property workOrderBytRefCode : Integer read FworkOrderBytRefCode write FworkOrderBytRefCode;
    property workOrderBytRefNumberGen : WideString read FworkOrderBytRefNumberGen write FworkOrderBytRefNumberGen;
    property workOrderBytRefDateGen : TXSDate read FworkOrderBytRefDateGen write FworkOrderBytRefDateGen;
    property workOrderBytRefCommentGen : WideString read FworkOrderBytRefCommentGen write FworkOrderBytRefCommentGen;
    property workOrderBytRefDateAdd : TXSDateTime read FworkOrderBytRefDateAdd write FworkOrderBytRefDateAdd;
    property workOrderBytRefDateEdit : TXSDateTime read FworkOrderBytRefDateEdit write FworkOrderBytRefDateEdit;
    property workOrderBytRefUserAdd : WideString read FworkOrderBytRefUserAdd write FworkOrderBytRefUserAdd;
    property workOrderBytRefUserEdit : WideString read FworkOrderBytRefUserEdit write FworkOrderBytRefUserEdit;
  end;

  ArrayOfENPhotoFactShort = array of ENPhotoFactShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPhotoFactShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPhotoFactShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPhotoFactShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPhotoFactController/message/
  // soapAction: http://ksoe.org/ENPhotoFactController/action/ENPhotoFactController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPhotoFactControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPhotoFactController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPhotoFactControllerSoapPort = interface(IInvokable)
  ['{4EB83A14-4D19-463E-94FC-A3B19DB79D77}']
    function add(const aENPhotoFact: ENPhotoFact): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPhotoFact: ENPhotoFact); stdcall;
    function getObject(const anObjectCode: Integer): ENPhotoFact; stdcall;
    function getList: ENPhotoFactShortList; stdcall;
    function getFilteredList(const aENPhotoFactFilter: ENPhotoFactFilter): ENPhotoFactShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactShortList; stdcall;
    function getScrollableFilteredList(const aENPhotoFactFilter: ENPhotoFactFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPhotoFactShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPhotoFactFilter: ENPhotoFactFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPhotoFactShort; stdcall;
  end;


implementation

  destructor ENPhotoFact.Destroy;
  begin
    if Assigned(FdateFact) then
      dateFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPhotoFactFilter.Destroy;
  begin
    if Assigned(FdateFact) then
      dateFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPhotoFactFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPhotoFactShort.Destroy;
  begin
    if Assigned(FdateFact) then
      dateFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytRefDateGen) then
      workOrderBytRefDateGen.Free;
    if Assigned(FworkOrderBytRefDateAdd) then
      workOrderBytRefDateAdd.Free;
    if Assigned(FworkOrderBytRefDateEdit) then
      workOrderBytRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPhotoFactShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPhotoFact, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFact');
  RemClassRegistry.RegisterXSClass(ENPhotoFactRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactRef');
  RemClassRegistry.RegisterXSClass(ENPhotoFactFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactFilter');
  RemClassRegistry.RegisterXSClass(ENPhotoFactShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactShort');
  RemClassRegistry.RegisterXSClass(ENPhotoFactShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPhotoFactShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPhotoFactShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPhotoFactShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPhotoFactControllerSoapPort), 'http://ksoe.org/ENPhotoFactController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPhotoFactControllerSoapPort), 'http://ksoe.org/ENPhotoFactController/action/ENPhotoFactController.%operationName%');


end.
