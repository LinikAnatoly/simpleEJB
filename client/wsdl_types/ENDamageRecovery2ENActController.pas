unit ENDamageRecovery2ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDamageRecoveryController
   ,ENActController
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

  ENDamageRecovery2ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecovery2ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecovery2ENAct = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FdamageRecoveryRef : ENDamageRecoveryRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property damageRecoveryRef : ENDamageRecoveryRef read FdamageRecoveryRef write FdamageRecoveryRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENDamageRecovery2ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FdamageRecoveryRef : ENDamageRecoveryRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property damageRecoveryRef : ENDamageRecoveryRef read FdamageRecoveryRef write FdamageRecoveryRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENDamageRecovery2ENActFilter = class(ENDamageRecovery2ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDamageRecovery2ENActShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdamageRecoveryRefCode : Integer;
    FdamageRecoveryRefNumberGen : WideString;
    FdamageRecoveryRefDateGen : TXSDate;
    FdamageRecoveryRefFKcontractCode : WideString;
    FdamageRecoveryRefFKpartnerCode : WideString;
    FdamageRecoveryRefFKdocCode : WideString;
    FdamageRecoveryRefFKdocID : Integer;
    FdamageRecoveryRefCommentGen : WideString;
    FdamageRecoveryRefContragentName : WideString;
    FdamageRecoveryRefContragentAddress : WideString;
    FdamageRecoveryRefContragentPassport : WideString;
    FdamageRecoveryRefDamageAmmount : TXSDecimal;
    FdamageRecoveryRefUserGen : WideString;
    FdamageRecoveryRefDateEdit : TXSDate;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer;
    FactRefFinDocMechanicCode : Integer;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property damageRecoveryRefCode : Integer read FdamageRecoveryRefCode write FdamageRecoveryRefCode;
    property damageRecoveryRefNumberGen : WideString read FdamageRecoveryRefNumberGen write FdamageRecoveryRefNumberGen;
    property damageRecoveryRefDateGen : TXSDate read FdamageRecoveryRefDateGen write FdamageRecoveryRefDateGen;
    property damageRecoveryRefFKcontractCode : WideString read FdamageRecoveryRefFKcontractCode write FdamageRecoveryRefFKcontractCode;
    property damageRecoveryRefFKpartnerCode : WideString read FdamageRecoveryRefFKpartnerCode write FdamageRecoveryRefFKpartnerCode;
    property damageRecoveryRefFKdocCode : WideString read FdamageRecoveryRefFKdocCode write FdamageRecoveryRefFKdocCode;
    property damageRecoveryRefFKdocID : Integer read FdamageRecoveryRefFKdocID write FdamageRecoveryRefFKdocID;
    property damageRecoveryRefCommentGen : WideString read FdamageRecoveryRefCommentGen write FdamageRecoveryRefCommentGen;
    property damageRecoveryRefContragentName : WideString read FdamageRecoveryRefContragentName write FdamageRecoveryRefContragentName;
    property damageRecoveryRefContragentAddress : WideString read FdamageRecoveryRefContragentAddress write FdamageRecoveryRefContragentAddress;
    property damageRecoveryRefContragentPassport : WideString read FdamageRecoveryRefContragentPassport write FdamageRecoveryRefContragentPassport;
    property damageRecoveryRefDamageAmmount : TXSDecimal read FdamageRecoveryRefDamageAmmount write FdamageRecoveryRefDamageAmmount;
    property damageRecoveryRefUserGen : WideString read FdamageRecoveryRefUserGen write FdamageRecoveryRefUserGen;
    property damageRecoveryRefDateEdit : TXSDate read FdamageRecoveryRefDateEdit write FdamageRecoveryRefDateEdit;
    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode;
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
  end;

  ArrayOfENDamageRecovery2ENActShort = array of ENDamageRecovery2ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDamageRecovery2ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDamageRecovery2ENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDamageRecovery2ENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDamageRecovery2ENActController/message/
  // soapAction: http://ksoe.org/ENDamageRecovery2ENActController/action/ENDamageRecovery2ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDamageRecovery2ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDamageRecovery2ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDamageRecovery2ENActControllerSoapPort = interface(IInvokable)
  ['{c4a3c4a3-c4a3-c4a3-c4a3-c4a3c4a3c4a3}']
    function add(const aENDamageRecovery2ENAct: ENDamageRecovery2ENAct): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall; overload;
    procedure remove(const actCode: Integer; const damageCode : Integer); stdcall;  overload;
    procedure save(const aENDamageRecovery2ENAct: ENDamageRecovery2ENAct); stdcall;
    function getObject(const anObjectCode: Integer): ENDamageRecovery2ENAct; stdcall;
    function getList: ENDamageRecovery2ENActShortList; stdcall;
    function getFilteredList(const aENDamageRecovery2ENActFilter: ENDamageRecovery2ENActFilter): ENDamageRecovery2ENActShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecovery2ENActShortList; stdcall;
    function getScrollableFilteredList(const aENDamageRecovery2ENActFilter: ENDamageRecovery2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecovery2ENActShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecovery2ENActShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDamageRecovery2ENActFilter: ENDamageRecovery2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDamageRecovery2ENActShort; stdcall;
  end;


implementation

  destructor ENDamageRecovery2ENAct.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdamageRecoveryRef) then
      damageRecoveryRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDamageRecovery2ENActFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdamageRecoveryRef) then
      damageRecoveryRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDamageRecovery2ENActFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDamageRecovery2ENActShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdamageRecoveryRefDateGen) then
      damageRecoveryRefDateGen.Free;
    if Assigned(FdamageRecoveryRefDamageAmmount) then
      damageRecoveryRefDamageAmmount.Free;
    if Assigned(FdamageRecoveryRefDateEdit) then
      damageRecoveryRefDateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENDamageRecovery2ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDamageRecovery2ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery2ENAct');
  RemClassRegistry.RegisterXSClass(ENDamageRecovery2ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery2ENActRef');
  RemClassRegistry.RegisterXSClass(ENDamageRecovery2ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery2ENActFilter');
  RemClassRegistry.RegisterXSClass(ENDamageRecovery2ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery2ENActShort');
  RemClassRegistry.RegisterXSClass(ENDamageRecovery2ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery2ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDamageRecovery2ENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDamageRecovery2ENActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDamageRecovery2ENActControllerSoapPort), 'http://ksoe.org/ENDamageRecovery2ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDamageRecovery2ENActControllerSoapPort), 'http://ksoe.org/ENDamageRecovery2ENActController/action/ENDamageRecovery2ENActController.%operationName%');


end.
