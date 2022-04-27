unit RQFKOrder2ProvController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQFKOrderController
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

  RQFKOrder2Prov            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2ProvRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2Prov = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fvoucher : WideString;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voucher : WideString read Fvoucher write Fvoucher;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;

{
  RQFKOrder2ProvFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fvoucher : WideString;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property voucher : WideString read Fvoucher write Fvoucher;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;
}

  RQFKOrder2ProvFilter = class(RQFKOrder2Prov)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrder2ProvShort = class(TRemotable)
  private
    Fcode : Integer;
    FpartId : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fvoucher : WideString;
    FfkorderRefCode : Integer;
    FfkorderRefNumberDoc : WideString;
    FfkorderRefDateGen : TXSDate;
    FfkorderRefDateShipment : TXSDate;
    FfkorderRefMolOutCode : WideString;
    FfkorderRefMolOutName : WideString;
    FfkorderRefMolInCode : WideString;
    FfkorderRefMolInName : WideString;
    FfkorderRefExpeditorCode : WideString;
    FfkorderRefExpeditorName : WideString;
    FfkorderRefWarrantNumber : WideString;
    FfkorderRefWarrantDate : TXSDate;
    FfkorderRefWarrantFIO : WideString;
    FfkorderRefSumWithoutNds : TXSDecimal;
    FfkorderRefSumNds : TXSDecimal;
    FfkorderRefNdsPercent : Integer;
    FfkorderRefPercentProfits : TXSDecimal;
    FfkorderRefAccount : WideString;
    FfkorderRefKod_podr : WideString;
    FfkorderRefName_podr : WideString;
    FfkorderRefIsMaterialsSent : Integer;
    FfkorderRefDateAdd : TXSDateTime;
    FfkorderRefUserAdd : WideString;
    FfkorderRefDateEdit : TXSDateTime;
    FfkorderRefDatePosting : TXSDate;
    FfkorderRefUserGen : WideString;
    FfkorderRefPalletNumber : WideString;
    FfkorderRefIsByOrder : Integer;
    FfkorderRefOrderInfo : WideString;
    FfkorderRefDateDelivery : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  partId : Integer read FpartId write FpartId;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property voucher : WideString read Fvoucher write Fvoucher;

    property fkorderRefCode : Integer read FfkorderRefCode write FfkorderRefCode;
    property fkorderRefNumberDoc : WideString read FfkorderRefNumberDoc write FfkorderRefNumberDoc;
    property fkorderRefDateGen : TXSDate read FfkorderRefDateGen write FfkorderRefDateGen;
    property fkorderRefDateShipment : TXSDate read FfkorderRefDateShipment write FfkorderRefDateShipment;
    property fkorderRefMolOutCode : WideString read FfkorderRefMolOutCode write FfkorderRefMolOutCode;
    property fkorderRefMolOutName : WideString read FfkorderRefMolOutName write FfkorderRefMolOutName;
    property fkorderRefMolInCode : WideString read FfkorderRefMolInCode write FfkorderRefMolInCode;
    property fkorderRefMolInName : WideString read FfkorderRefMolInName write FfkorderRefMolInName;
    property fkorderRefExpeditorCode : WideString read FfkorderRefExpeditorCode write FfkorderRefExpeditorCode;
    property fkorderRefExpeditorName : WideString read FfkorderRefExpeditorName write FfkorderRefExpeditorName;
    property fkorderRefWarrantNumber : WideString read FfkorderRefWarrantNumber write FfkorderRefWarrantNumber;
    property fkorderRefWarrantDate : TXSDate read FfkorderRefWarrantDate write FfkorderRefWarrantDate;
    property fkorderRefWarrantFIO : WideString read FfkorderRefWarrantFIO write FfkorderRefWarrantFIO;
    property fkorderRefSumWithoutNds : TXSDecimal read FfkorderRefSumWithoutNds write FfkorderRefSumWithoutNds;
    property fkorderRefSumNds : TXSDecimal read FfkorderRefSumNds write FfkorderRefSumNds;
    property fkorderRefNdsPercent : Integer read FfkorderRefNdsPercent write FfkorderRefNdsPercent;
    property fkorderRefPercentProfits : TXSDecimal read FfkorderRefPercentProfits write FfkorderRefPercentProfits;
    property fkorderRefAccount : WideString read FfkorderRefAccount write FfkorderRefAccount;
    property fkorderRefKod_podr : WideString read FfkorderRefKod_podr write FfkorderRefKod_podr;
    property fkorderRefName_podr : WideString read FfkorderRefName_podr write FfkorderRefName_podr;
    property fkorderRefIsMaterialsSent : Integer read FfkorderRefIsMaterialsSent write FfkorderRefIsMaterialsSent;
    property fkorderRefDateAdd : TXSDateTime read FfkorderRefDateAdd write FfkorderRefDateAdd;
    property fkorderRefUserAdd : WideString read FfkorderRefUserAdd write FfkorderRefUserAdd;
    property fkorderRefDateEdit : TXSDateTime read FfkorderRefDateEdit write FfkorderRefDateEdit;
    property fkorderRefDatePosting : TXSDate read FfkorderRefDatePosting write FfkorderRefDatePosting;
    property fkorderRefUserGen : WideString read FfkorderRefUserGen write FfkorderRefUserGen;
    property fkorderRefPalletNumber : WideString read FfkorderRefPalletNumber write FfkorderRefPalletNumber;
    property fkorderRefIsByOrder : Integer read FfkorderRefIsByOrder write FfkorderRefIsByOrder;
    property fkorderRefOrderInfo : WideString read FfkorderRefOrderInfo write FfkorderRefOrderInfo;
    property fkorderRefDateDelivery : TXSDate read FfkorderRefDateDelivery write FfkorderRefDateDelivery;
  end;

  ArrayOfRQFKOrder2ProvShort = array of RQFKOrder2ProvShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2ProvShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2ProvShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2ProvShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2ProvController/message/
  // soapAction: http://ksoe.org/RQFKOrder2ProvController/action/RQFKOrder2ProvController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2ProvControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2ProvController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2ProvControllerSoapPort = interface(IInvokable)
  ['{547D207A-7B71-4E93-B064-AD5FC6479B18}']
    function add(const aRQFKOrder2Prov: RQFKOrder2Prov): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2Prov: RQFKOrder2Prov); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrder2Prov; stdcall;
    function getList: RQFKOrder2ProvShortList; stdcall;
    function getFilteredList(const aRQFKOrder2ProvFilter: RQFKOrder2ProvFilter): RQFKOrder2ProvShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2ProvShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrder2ProvFilter: RQFKOrder2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2ProvShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2ProvShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrder2ProvFilter: RQFKOrder2ProvFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrder2ProvShort; stdcall;
  end;


implementation

  destructor RQFKOrder2Prov.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrder2ProvFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;
}

  destructor RQFKOrder2ProvFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQFKOrder2ProvShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkorderRefDateGen) then
      fkorderRefDateGen.Free;
    if Assigned(FfkorderRefDateShipment) then
      fkorderRefDateShipment.Free;
    if Assigned(FfkorderRefWarrantDate) then
      fkorderRefWarrantDate.Free;
    if Assigned(FfkorderRefSumWithoutNds) then
      fkorderRefSumWithoutNds.Free;
    if Assigned(FfkorderRefSumNds) then
      fkorderRefSumNds.Free;
    if Assigned(FfkorderRefPercentProfits) then
      fkorderRefPercentProfits.Free;
    if Assigned(FfkorderRefDateAdd) then
      fkorderRefDateAdd.Free;
    if Assigned(FfkorderRefDateEdit) then
      fkorderRefDateEdit.Free;
    if Assigned(FfkorderRefDatePosting) then
      fkorderRefDatePosting.Free;
    if Assigned(FfkorderRefDateDelivery) then
      fkorderRefDateDelivery.Free;
    inherited Destroy;
  end;

  destructor RQFKOrder2ProvShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2Prov, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2Prov');
  RemClassRegistry.RegisterXSClass(RQFKOrder2ProvRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2ProvRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2ProvFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2ProvFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2ProvShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2ProvShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2ProvShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2ProvShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2ProvShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2ProvShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2ProvControllerSoapPort), 'http://ksoe.org/RQFKOrder2ProvController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2ProvControllerSoapPort), 'http://ksoe.org/RQFKOrder2ProvController/action/RQFKOrder2ProvController.%operationName%');


end.
