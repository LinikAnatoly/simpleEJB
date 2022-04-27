unit ENAct2ProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
   ,ENActPostingKindController
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

  ENAct2Prov            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2ProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2Prov = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdatePosting : TXSDate;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fvoucher : WideString;
    FisIncomeAct : Integer;
//???
    FactRef : ENActRef;
//???
    FactPostingKindRef : ENActPostingKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  isIncomeAct : Integer read FisIncomeAct write FisIncomeAct;
    property actRef : ENActRef read FactRef write FactRef;
    property actPostingKindRef : ENActPostingKindRef read FactPostingKindRef write FactPostingKindRef;
  end;

{
  ENAct2ProvFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdatePosting : TXSDate;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fvoucher : WideString;
    FisIncomeAct : Integer;
//???
    FactRef : ENActRef;
//???
    FactPostingKindRef : ENActPostingKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  isIncomeAct : Integer read FisIncomeAct write FisIncomeAct;
    property actRef : ENActRef read FactRef write FactRef;
    property actPostingKindRef : ENActPostingKindRef read FactPostingKindRef write FactPostingKindRef;
  end;
}

  ENAct2ProvFilter = class(ENAct2Prov)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2ProvShort = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdatePosting : TXSDate;
    FdateEdit : TXSDate;
    Fvoucher : WideString;
    FisIncomeAct : Integer;
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
    FactRefMolCodeObject : WideString;
    FactPostingKindRefCode : Integer;
    FactPostingKindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  isIncomeAct : Integer read FisIncomeAct write FisIncomeAct;

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
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actPostingKindRefCode : Integer read FactPostingKindRefCode write FactPostingKindRefCode;
    property actPostingKindRefName : WideString read FactPostingKindRefName write FactPostingKindRefName;
  end;

  ArrayOfENAct2ProvShort = array of ENAct2ProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2ProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2ProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2ProvShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2ProvController/message/
  // soapAction: http://ksoe.org/ENAct2ProvController/action/ENAct2ProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2ProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2ProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2ProvControllerSoapPort = interface(IInvokable)
  ['{DA97952F-1329-4EC1-9D98-64DB905EE26B}']
    function add(const aENAct2Prov: ENAct2Prov): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2Prov: ENAct2Prov); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2Prov; stdcall;
    function getList: ENAct2ProvShortList; stdcall;
    function getFilteredList(const aENAct2ProvFilter: ENAct2ProvFilter): ENAct2ProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2ProvShortList; stdcall;
    function getScrollableFilteredList(const aENAct2ProvFilter: ENAct2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2ProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2ProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2ProvFilter: ENAct2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2ProvShort; stdcall;

    procedure savePostingInfo(const aENAct2Prov: ENAct2Prov); stdcall;

  end;


implementation

  destructor ENAct2Prov.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FactPostingKindRef) then
      actPostingKindRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2ProvFilter.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FactPostingKindRef) then
      actPostingKindRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2ProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2ProvShort.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENAct2ProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2Prov, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2Prov');
  RemClassRegistry.RegisterXSClass(ENAct2ProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ProvRef');
  RemClassRegistry.RegisterXSClass(ENAct2ProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ProvFilter');
  RemClassRegistry.RegisterXSClass(ENAct2ProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ProvShort');
  RemClassRegistry.RegisterXSClass(ENAct2ProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2ProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2ProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2ProvShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2ProvControllerSoapPort), 'http://ksoe.org/ENAct2ProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2ProvControllerSoapPort), 'http://ksoe.org/ENAct2ProvController/action/ENAct2ProvController.%operationName%');


end.
