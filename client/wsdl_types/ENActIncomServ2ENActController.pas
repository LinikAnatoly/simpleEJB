unit ENActIncomServ2ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   , ENActIncomeServicesController
   , ENActController
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

  ENActIncomServ2ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomServ2ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomServ2ENAct = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
//???
    FactIncomeRef : ENActIncomeServicesRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property actIncomeRef : ENActIncomeServicesRef read FactIncomeRef write FactIncomeRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENActIncomServ2ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FsummaGen : TXSDecimal;
//???
    FactIncomeRef : ENActIncomeServicesRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property actIncomeRef : ENActIncomeServicesRef read FactIncomeRef write FactIncomeRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENActIncomServ2ENActFilter = class(ENActIncomServ2ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncomServ2ENActShort = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FactIncomeRefCode : Integer;
    FactIncomeRefNumberGen : WideString;
    FactIncomeRefDateGen : TXSDate;
    FactIncomeRefActDateStart : TXSDate;
    FactIncomeRefActDateEnd : TXSDate;
    FactIncomeRefSummaGen : TXSDecimal;
    FactIncomeRefSummaVat : TXSDecimal;
    FactIncomeRefDateAdd : TXSDateTime;
    FactIncomeRefDateEdit : TXSDateTime;
    FactIncomeRefUserGen : WideString;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;

    property actIncomeRefCode : Integer read FactIncomeRefCode write FactIncomeRefCode;
    property actIncomeRefNumberGen : WideString read FactIncomeRefNumberGen write FactIncomeRefNumberGen;
    property actIncomeRefDateGen : TXSDate read FactIncomeRefDateGen write FactIncomeRefDateGen;
    property actIncomeRefActDateStart : TXSDate read FactIncomeRefActDateStart write FactIncomeRefActDateStart;
    property actIncomeRefActDateEnd : TXSDate read FactIncomeRefActDateEnd write FactIncomeRefActDateEnd;
    property actIncomeRefSummaGen : TXSDecimal read FactIncomeRefSummaGen write FactIncomeRefSummaGen;
    property actIncomeRefSummaVat : TXSDecimal read FactIncomeRefSummaVat write FactIncomeRefSummaVat;
    property actIncomeRefDateAdd : TXSDateTime read FactIncomeRefDateAdd write FactIncomeRefDateAdd;
    property actIncomeRefDateEdit : TXSDateTime read FactIncomeRefDateEdit write FactIncomeRefDateEdit;
    property actIncomeRefUserGen : WideString read FactIncomeRefUserGen write FactIncomeRefUserGen;
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
  end;

  ArrayOfENActIncomServ2ENActShort = array of ENActIncomServ2ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomServ2ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomServ2ENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomServ2ENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomServ2ENActController/message/
  // soapAction: http://ksoe.org/ENActIncomServ2ENActController/action/ENActIncomServ2ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomServ2ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomServ2ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomServ2ENActControllerSoapPort = interface(IInvokable)
  ['{E273A0B6-560F-4528-ACDA-9323FDF9EE3A}']
    function add(const aENActIncomServ2ENAct: ENActIncomServ2ENAct): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncomServ2ENAct: ENActIncomServ2ENAct); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncomServ2ENAct; stdcall;
    function getList: ENActIncomServ2ENActShortList; stdcall;
    function getFilteredList(const aENActIncomServ2ENActFilter: ENActIncomServ2ENActFilter): ENActIncomServ2ENActShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ENActShortList; stdcall;
    function getScrollableFilteredList(const aENActIncomServ2ENActFilter: ENActIncomServ2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ENActShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ENActShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncomServ2ENActFilter: ENActIncomServ2ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomServ2ENActShort; stdcall;
  end;


implementation

  destructor ENActIncomServ2ENAct.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActIncomServ2ENActFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActIncomServ2ENActFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActIncomServ2ENActShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FactIncomeRefDateGen) then
      actIncomeRefDateGen.Free;
    if Assigned(FactIncomeRefActDateStart) then
      actIncomeRefActDateStart.Free;
    if Assigned(FactIncomeRefActDateEnd) then
      actIncomeRefActDateEnd.Free;
    if Assigned(FactIncomeRefSummaGen) then
      actIncomeRefSummaGen.Free;
    if Assigned(FactIncomeRefSummaVat) then
      actIncomeRefSummaVat.Free;
    if Assigned(FactIncomeRefDateAdd) then
      actIncomeRefDateAdd.Free;
    if Assigned(FactIncomeRefDateEdit) then
      actIncomeRefDateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENActIncomServ2ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomServ2ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ENAct');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ENActRef');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ENActFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ENActShort');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomServ2ENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomServ2ENActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomServ2ENActControllerSoapPort), 'http://ksoe.org/ENActIncomServ2ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomServ2ENActControllerSoapPort), 'http://ksoe.org/ENActIncomServ2ENActController/action/ENActIncomServ2ENActController.%operationName%');


end.
