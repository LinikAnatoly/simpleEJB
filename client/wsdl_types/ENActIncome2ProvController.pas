unit ENActIncome2ProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActIncomeController
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

  ENActIncome2Prov            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncome2ProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActIncome2Prov = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FdatePosting : TXSDate;
    Fvoucher : WideString;
    FdateEdit : TXSDate;
    FuserGen : WideString;
//???
    FactIncomeRef : ENActIncomeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property voucher : WideString read Fvoucher write Fvoucher;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property actIncomeRef : ENActIncomeRef read FactIncomeRef write FactIncomeRef;
  end;

{
  ENActIncome2ProvFilter = class(TRemotable)
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
    FactIncomeRef : ENActIncomeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property voucher : WideString read Fvoucher write Fvoucher;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property actIncomeRef : ENActIncomeRef read FactIncomeRef write FactIncomeRef;
  end;
}

  ENActIncome2ProvFilter = class(ENActIncome2Prov)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActIncome2ProvShort = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FdatePosting : TXSDate;
    Fvoucher : WideString;
    FdateEdit : TXSDate;
    FuserGen : WideString;
    FactIncomeRefCode : Integer;
    FactIncomeRefNumbergen : WideString;
    FactIncomeRefDategen : TXSDate;
    FactIncomeRefActDateStart : TXSDate;
    FactIncomeRefActDateEnd : TXSDate;
    FactIncomeRefContractNumber : WideString;
    FactIncomeRefContractDate : TXSDate;
    FactIncomeRefPartnername : WideString;
    FactIncomeRefPartnerCode : WideString;
    FactIncomeRefFinDocCode : WideString;
    FactIncomeRefFinDocID : Integer;
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
    property actIncomeRefNumbergen : WideString read FactIncomeRefNumbergen write FactIncomeRefNumbergen;
    property actIncomeRefDategen : TXSDate read FactIncomeRefDategen write FactIncomeRefDategen;
    property actIncomeRefActDateStart : TXSDate read FactIncomeRefActDateStart write FactIncomeRefActDateStart;
    property actIncomeRefActDateEnd : TXSDate read FactIncomeRefActDateEnd write FactIncomeRefActDateEnd;
    property actIncomeRefContractNumber : WideString read FactIncomeRefContractNumber write FactIncomeRefContractNumber;
    property actIncomeRefContractDate : TXSDate read FactIncomeRefContractDate write FactIncomeRefContractDate;
    property actIncomeRefPartnername : WideString read FactIncomeRefPartnername write FactIncomeRefPartnername;
    property actIncomeRefPartnerCode : WideString read FactIncomeRefPartnerCode write FactIncomeRefPartnerCode;
    property actIncomeRefFinDocCode : WideString read FactIncomeRefFinDocCode write FactIncomeRefFinDocCode;
    property actIncomeRefFinDocID : Integer read FactIncomeRefFinDocID write FactIncomeRefFinDocID;
  end;

  ArrayOfENActIncome2ProvShort = array of ENActIncome2ProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActIncome2ProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActIncome2ProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActIncome2ProvShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActIncome2ProvController/message/
  // soapAction: http://ksoe.org/ENActIncome2ProvController/action/ENActIncome2ProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActIncome2ProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActIncome2ProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActIncome2ProvControllerSoapPort = interface(IInvokable)
  ['{7D9F6D92-4FA9-4489-B4AA-58F2A9FF26AE}']
    function add(const aENActIncome2Prov: ENActIncome2Prov): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENActIncome2Prov: ENActIncome2Prov); stdcall;
    function getObject(const anObjectCode: Integer): ENActIncome2Prov; stdcall;
    function getList: ENActIncome2ProvShortList; stdcall;
    function getFilteredList(const aENActIncome2ProvFilter: ENActIncome2ProvFilter): ENActIncome2ProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ProvShortList; stdcall;
    function getScrollableFilteredList(const aENActIncome2ProvFilter: ENActIncome2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActIncome2ProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActIncome2ProvFilter: ENActIncome2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActIncome2ProvShort; stdcall;
  end;


implementation

  destructor ENActIncome2Prov.Destroy;
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
  destructor ENActIncome2ProvFilter.Destroy;
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

  destructor ENActIncome2ProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActIncome2ProvShort.Destroy;
  begin
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactIncomeRefDategen) then
      actIncomeRefDategen.Free;
    if Assigned(FactIncomeRefActDateStart) then
      actIncomeRefActDateStart.Free;
    if Assigned(FactIncomeRefActDateEnd) then
      actIncomeRefActDateEnd.Free;
    if Assigned(FactIncomeRefContractDate) then
      actIncomeRefContractDate.Free;
    inherited Destroy;
  end;

  destructor ENActIncome2ProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENActIncome2Prov, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2Prov');
  RemClassRegistry.RegisterXSClass(ENActIncome2ProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ProvRef');
  RemClassRegistry.RegisterXSClass(ENActIncome2ProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ProvFilter');
  RemClassRegistry.RegisterXSClass(ENActIncome2ProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ProvShort');
  RemClassRegistry.RegisterXSClass(ENActIncome2ProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActIncome2ProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActIncome2ProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActIncome2ProvShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActIncome2ProvControllerSoapPort), 'http://ksoe.org/ENActIncome2ProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActIncome2ProvControllerSoapPort), 'http://ksoe.org/ENActIncome2ProvController/action/ENActIncome2ProvController.%operationName%');


end.
