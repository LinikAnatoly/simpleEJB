unit ENActIncomServ2ProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, ENActIncomeServicesController
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

  ENActIncomServ2Prov            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomServ2ProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncomServ2Prov = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FdatePosting : TXSDate;
    Fvoucher : WideString;
    FdateEdit : TXSDate;
    FuserGen : WideString;
//???
    FactIncomeRef : ENActIncomeServicesRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property voucher : WideString read Fvoucher write Fvoucher;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property actIncomeRef : ENActIncomeServicesRef read FactIncomeRef write FactIncomeRef;
  end;

{
  ENActIncomServ2ProvFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpartId : Integer;
    FdatePosting : TXSDate;
    Fvoucher : WideString;
    FdateEdit : TXSDate;
    FuserGen : WideString;
//???
    FactIncomeRef : ENActIncomeServicesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property voucher : WideString read Fvoucher write Fvoucher;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property actIncomeRef : ENActIncomeServicesRef read FactIncomeRef write FactIncomeRef;
  end;
}

  ENActIncomServ2ProvFilter = class(ENActIncomServ2Prov)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncomServ2ProvShort = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FdatePosting : TXSDate;
    Fvoucher : WideString;
    FdateEdit : TXSDate;
    FuserGen : WideString;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property voucher : WideString read Fvoucher write Fvoucher;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

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
  end;

  ArrayOfENActIncomServ2ProvShort = array of ENActIncomServ2ProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncomServ2ProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncomServ2ProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncomServ2ProvShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncomServ2ProvController/message/
  // soapAction: http://ksoe.org/ENActIncomServ2ProvController/action/ENActIncomServ2ProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncomServ2ProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncomServ2ProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncomServ2ProvControllerSoapPort = interface(IInvokable)
  ['{101FC209-3E66-45D4-AD3A-4E3ED6BFAB38}']
    function add(const aENActIncomServ2Prov: ENActIncomServ2Prov): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncomServ2Prov: ENActIncomServ2Prov); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncomServ2Prov; stdcall;
    function getList: ENActIncomServ2ProvShortList; stdcall;
    function getFilteredList(const aENActIncomServ2ProvFilter: ENActIncomServ2ProvFilter): ENActIncomServ2ProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ProvShortList; stdcall;
    function getScrollableFilteredList(const aENActIncomServ2ProvFilter: ENActIncomServ2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncomServ2ProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncomServ2ProvFilter: ENActIncomServ2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncomServ2ProvShort; stdcall;
  end;


implementation

  destructor ENActIncomServ2Prov.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActIncomServ2ProvFilter.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRef) then
      actIncomeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActIncomServ2ProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActIncomServ2ProvShort.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENActIncomServ2ProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncomServ2Prov, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2Prov');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ProvRef');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ProvFilter');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ProvShort');
  RemClassRegistry.RegisterXSClass(ENActIncomServ2ProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncomServ2ProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncomServ2ProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncomServ2ProvShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncomServ2ProvControllerSoapPort), 'http://ksoe.org/ENActIncomServ2ProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncomServ2ProvControllerSoapPort), 'http://ksoe.org/ENActIncomServ2ProvController/action/ENActIncomServ2ProvController.%operationName%');


end.
