unit FINDoc2FKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQFKOrderController
   ,FINDocTypeController
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

  FINDoc2FKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDoc2FKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FINDoc2FKOrder = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCodeContract : Integer;
    FaxPurchaseOrderCode : WideString;
    FaxTransferJournalCode : WideString;
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfinDocTypeRef : FINDocTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCodeContract : Integer read FfinDocCodeContract write FfinDocCodeContract;
    property axPurchaseOrderCode : WideString read FaxPurchaseOrderCode write FaxPurchaseOrderCode;
    property axTransferJournalCode : WideString read FaxTransferJournalCode write FaxTransferJournalCode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property finDocTypeRef : FINDocTypeRef read FfinDocTypeRef write FfinDocTypeRef;
  end;

{
  FINDoc2FKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCodeContract : Integer;
    FaxPurchaseOrderCode : WideString;
    FaxTransferJournalCode : WideString;
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfinDocTypeRef : FINDocTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCodeContract : Integer read FfinDocCodeContract write FfinDocCodeContract;
    property axPurchaseOrderCode : WideString read FaxPurchaseOrderCode write FaxPurchaseOrderCode;
    property axTransferJournalCode : WideString read FaxTransferJournalCode write FaxTransferJournalCode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property finDocTypeRef : FINDocTypeRef read FfinDocTypeRef write FfinDocTypeRef;
  end;
}

  FINDoc2FKOrderFilter = class(FINDoc2FKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FINDoc2FKOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    FfinDocCode : Integer;
    FfinDocCodeContract : Integer;
    FaxPurchaseOrderCode : WideString;
    FaxTransferJournalCode : WideString;
    FfkOrderRefCode : Integer;
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefDateShipment : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer;
    FfkOrderRefPercentProfits : TXSDecimal;
    FfkOrderRefAccount : WideString;
    FfkOrderRefKod_podr : WideString;
    FfkOrderRefName_podr : WideString;
    FfkOrderRefIsMaterialsSent : Integer;
    FfkOrderRefDateAdd : TXSDateTime;
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;
    FfkOrderRefDatePosting : TXSDate;
    FfkOrderRefUserGen : WideString;
    FfkOrderRefPalletNumber : WideString;
    FfkOrderRefIsByOrder : Integer;
    FfkOrderRefOrderInfo : WideString;
    FfkOrderRefDateDelivery : TXSDate;
    FfinDocTypeRefCode : Integer;
    FfinDocTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  finDocCode : Integer read FfinDocCode write FfinDocCode;
    property  finDocCodeContract : Integer read FfinDocCodeContract write FfinDocCodeContract;
    property axPurchaseOrderCode : WideString read FaxPurchaseOrderCode write FaxPurchaseOrderCode;
    property axTransferJournalCode : WideString read FaxTransferJournalCode write FaxTransferJournalCode;

    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode;
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc;
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen;
    property fkOrderRefDateShipment : TXSDate read FfkOrderRefDateShipment write FfkOrderRefDateShipment;
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode;
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName;
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode;
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName;
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode;
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName;
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber;
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate;
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO;
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds;
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds;
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent;
    property fkOrderRefPercentProfits : TXSDecimal read FfkOrderRefPercentProfits write FfkOrderRefPercentProfits;
    property fkOrderRefAccount : WideString read FfkOrderRefAccount write FfkOrderRefAccount;
    property fkOrderRefKod_podr : WideString read FfkOrderRefKod_podr write FfkOrderRefKod_podr;
    property fkOrderRefName_podr : WideString read FfkOrderRefName_podr write FfkOrderRefName_podr;
    property fkOrderRefIsMaterialsSent : Integer read FfkOrderRefIsMaterialsSent write FfkOrderRefIsMaterialsSent;
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd;
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd;
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit;
    property fkOrderRefDatePosting : TXSDate read FfkOrderRefDatePosting write FfkOrderRefDatePosting;
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen;
    property fkOrderRefPalletNumber : WideString read FfkOrderRefPalletNumber write FfkOrderRefPalletNumber;
    property fkOrderRefIsByOrder : Integer read FfkOrderRefIsByOrder write FfkOrderRefIsByOrder;
    property fkOrderRefOrderInfo : WideString read FfkOrderRefOrderInfo write FfkOrderRefOrderInfo;
    property fkOrderRefDateDelivery : TXSDate read FfkOrderRefDateDelivery write FfkOrderRefDateDelivery;
    property finDocTypeRefCode : Integer read FfinDocTypeRefCode write FfinDocTypeRefCode;
    property finDocTypeRefName : WideString read FfinDocTypeRefName write FfinDocTypeRefName;
  end;

  ArrayOfFINDoc2FKOrderShort = array of FINDoc2FKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FINDoc2FKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFINDoc2FKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFINDoc2FKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FINDoc2FKOrderController/message/
  // soapAction: http://ksoe.org/FINDoc2FKOrderController/action/FINDoc2FKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FINDoc2FKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FINDoc2FKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FINDoc2FKOrderControllerSoapPort = interface(IInvokable)
  ['{67C8DC51-8F97-44DC-8E36-53B905226EE5}']
    function add(const aFINDoc2FKOrder: FINDoc2FKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFINDoc2FKOrder: FINDoc2FKOrder); stdcall;
    function getObject(const anObjectCode: Integer): FINDoc2FKOrder; stdcall;
    function getList: FINDoc2FKOrderShortList; stdcall;
    function getFilteredList(const aFINDoc2FKOrderFilter: FINDoc2FKOrderFilter): FINDoc2FKOrderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FINDoc2FKOrderShortList; stdcall;
    function getScrollableFilteredList(const aFINDoc2FKOrderFilter: FINDoc2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): FINDoc2FKOrderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FINDoc2FKOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFINDoc2FKOrderFilter: FINDoc2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FINDoc2FKOrderShort; stdcall;
  end;


implementation

  destructor FINDoc2FKOrder.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfinDocTypeRef) then
      finDocTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor FINDoc2FKOrderFilter.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfinDocTypeRef) then
      finDocTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor FINDoc2FKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FINDoc2FKOrderShort.Destroy;
  begin
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefDateShipment) then
      fkOrderRefDateShipment.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    if Assigned(FfkOrderRefPercentProfits) then
      fkOrderRefPercentProfits.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    if Assigned(FfkOrderRefDatePosting) then
      fkOrderRefDatePosting.Free;
    if Assigned(FfkOrderRefDateDelivery) then
      fkOrderRefDateDelivery.Free;
    inherited Destroy;
  end;

  destructor FINDoc2FKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FINDoc2FKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2FKOrder');
  RemClassRegistry.RegisterXSClass(FINDoc2FKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2FKOrderRef');
  RemClassRegistry.RegisterXSClass(FINDoc2FKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2FKOrderFilter');
  RemClassRegistry.RegisterXSClass(FINDoc2FKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2FKOrderShort');
  RemClassRegistry.RegisterXSClass(FINDoc2FKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FINDoc2FKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFINDoc2FKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFINDoc2FKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(FINDoc2FKOrderControllerSoapPort), 'http://ksoe.org/FINDoc2FKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FINDoc2FKOrderControllerSoapPort), 'http://ksoe.org/FINDoc2FKOrderController/action/FINDoc2FKOrderController.%operationName%');


end.
