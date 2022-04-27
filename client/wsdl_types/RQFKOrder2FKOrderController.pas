unit RQFKOrder2FKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQFKOrder2FKOrderTypeController
   ,RQFKOrderController
   //,RQFKOrderController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQFKOrder2FKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKOrder = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
//???
    FtypeRef : RQFKOrder2FKOrderTypeRef;
//???
    FfkOrderInRef : RQFKOrderRef;
//???
    FfkOrderOutRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typeRef : RQFKOrder2FKOrderTypeRef read FtypeRef write FtypeRef;
    property fkOrderInRef : RQFKOrderRef read FfkOrderInRef write FfkOrderInRef;
    property fkOrderOutRef : RQFKOrderRef read FfkOrderOutRef write FfkOrderOutRef;
  end;

{
  RQFKOrder2FKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
//???
    FtypeRef : RQFKOrder2FKOrderTypeRef;
//???
    FfkOrderInRef : RQFKOrderRef;
//???
    FfkOrderOutRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property typeRef : RQFKOrder2FKOrderTypeRef read FtypeRef write FtypeRef;
    property fkOrderInRef : RQFKOrderRef read FfkOrderInRef write FfkOrderInRef;
    property fkOrderOutRef : RQFKOrderRef read FfkOrderOutRef write FfkOrderOutRef;
  end;
}

  RQFKOrder2FKOrderFilter = class(RQFKOrder2FKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrder2FKOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FfkOrderInRefCode : Integer;
    FfkOrderInRefNumberDoc : WideString;
    FfkOrderInRefDateGen : TXSDate;
    FfkOrderInRefDateShipment : TXSDate;
    FfkOrderInRefMolOutCode : WideString;
    FfkOrderInRefMolOutName : WideString;
    FfkOrderInRefMolInCode : WideString;
    FfkOrderInRefMolInName : WideString;
    FfkOrderInRefExpeditorCode : WideString;
    FfkOrderInRefExpeditorName : WideString;
    FfkOrderInRefWarrantNumber : WideString;
    FfkOrderInRefWarrantDate : TXSDate;
    FfkOrderInRefWarrantFIO : WideString;
    FfkOrderInRefSumWithoutNds : TXSDecimal;
    FfkOrderInRefSumNds : TXSDecimal;
    FfkOrderInRefNdsPercent : Integer;
    FfkOrderInRefPercentProfits : TXSDecimal;
    FfkOrderInRefAccount : WideString;
    FfkOrderInRefKod_podr : WideString;
    FfkOrderInRefName_podr : WideString;
    FfkOrderInRefDateAdd : TXSDateTime;
    FfkOrderInRefUserAdd : WideString;
    FfkOrderInRefDateEdit : TXSDateTime;
    FfkOrderInRefDatePosting : TXSDate;
    FfkOrderInRefUserGen : WideString;
    FfkOrderInRefPalletNumber : WideString;
    FfkOrderOutRefCode : Integer;
    FfkOrderOutRefNumberDoc : WideString;
    FfkOrderOutRefDateGen : TXSDate;
    FfkOrderOutRefDateShipment : TXSDate;
    FfkOrderOutRefMolOutCode : WideString;
    FfkOrderOutRefMolOutName : WideString;
    FfkOrderOutRefMolInCode : WideString;
    FfkOrderOutRefMolInName : WideString;
    FfkOrderOutRefExpeditorCode : WideString;
    FfkOrderOutRefExpeditorName : WideString;
    FfkOrderOutRefWarrantNumber : WideString;
    FfkOrderOutRefWarrantDate : TXSDate;
    FfkOrderOutRefWarrantFIO : WideString;
    FfkOrderOutRefSumWithoutNds : TXSDecimal;
    FfkOrderOutRefSumNds : TXSDecimal;
    FfkOrderOutRefNdsPercent : Integer;
    FfkOrderOutRefPercentProfits : TXSDecimal;
    FfkOrderOutRefAccount : WideString;
    FfkOrderOutRefKod_podr : WideString;
    FfkOrderOutRefName_podr : WideString;
    FfkOrderOutRefDateAdd : TXSDateTime;
    FfkOrderOutRefUserAdd : WideString;
    FfkOrderOutRefDateEdit : TXSDateTime;
    FfkOrderOutRefDatePosting : TXSDate;
    FfkOrderOutRefUserGen : WideString;
    FfkOrderOutRefPalletNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property fkOrderInRefCode : Integer read FfkOrderInRefCode write FfkOrderInRefCode;
    property fkOrderInRefNumberDoc : WideString read FfkOrderInRefNumberDoc write FfkOrderInRefNumberDoc;
    property fkOrderInRefDateGen : TXSDate read FfkOrderInRefDateGen write FfkOrderInRefDateGen;
    property fkOrderInRefDateShipment : TXSDate read FfkOrderInRefDateShipment write FfkOrderInRefDateShipment;
    property fkOrderInRefMolOutCode : WideString read FfkOrderInRefMolOutCode write FfkOrderInRefMolOutCode;
    property fkOrderInRefMolOutName : WideString read FfkOrderInRefMolOutName write FfkOrderInRefMolOutName;
    property fkOrderInRefMolInCode : WideString read FfkOrderInRefMolInCode write FfkOrderInRefMolInCode;
    property fkOrderInRefMolInName : WideString read FfkOrderInRefMolInName write FfkOrderInRefMolInName;
    property fkOrderInRefExpeditorCode : WideString read FfkOrderInRefExpeditorCode write FfkOrderInRefExpeditorCode;
    property fkOrderInRefExpeditorName : WideString read FfkOrderInRefExpeditorName write FfkOrderInRefExpeditorName;
    property fkOrderInRefWarrantNumber : WideString read FfkOrderInRefWarrantNumber write FfkOrderInRefWarrantNumber;
    property fkOrderInRefWarrantDate : TXSDate read FfkOrderInRefWarrantDate write FfkOrderInRefWarrantDate;
    property fkOrderInRefWarrantFIO : WideString read FfkOrderInRefWarrantFIO write FfkOrderInRefWarrantFIO;
    property fkOrderInRefSumWithoutNds : TXSDecimal read FfkOrderInRefSumWithoutNds write FfkOrderInRefSumWithoutNds;
    property fkOrderInRefSumNds : TXSDecimal read FfkOrderInRefSumNds write FfkOrderInRefSumNds;
    property fkOrderInRefNdsPercent : Integer read FfkOrderInRefNdsPercent write FfkOrderInRefNdsPercent;
    property fkOrderInRefPercentProfits : TXSDecimal read FfkOrderInRefPercentProfits write FfkOrderInRefPercentProfits;
    property fkOrderInRefAccount : WideString read FfkOrderInRefAccount write FfkOrderInRefAccount;
    property fkOrderInRefKod_podr : WideString read FfkOrderInRefKod_podr write FfkOrderInRefKod_podr;
    property fkOrderInRefName_podr : WideString read FfkOrderInRefName_podr write FfkOrderInRefName_podr;
    property fkOrderInRefDateAdd : TXSDateTime read FfkOrderInRefDateAdd write FfkOrderInRefDateAdd;
    property fkOrderInRefUserAdd : WideString read FfkOrderInRefUserAdd write FfkOrderInRefUserAdd;
    property fkOrderInRefDateEdit : TXSDateTime read FfkOrderInRefDateEdit write FfkOrderInRefDateEdit;
    property fkOrderInRefDatePosting : TXSDate read FfkOrderInRefDatePosting write FfkOrderInRefDatePosting;
    property fkOrderInRefUserGen : WideString read FfkOrderInRefUserGen write FfkOrderInRefUserGen;
    property fkOrderInRefPalletNumber : WideString read FfkOrderInRefPalletNumber write FfkOrderInRefPalletNumber;
    property fkOrderOutRefCode : Integer read FfkOrderOutRefCode write FfkOrderOutRefCode;
    property fkOrderOutRefNumberDoc : WideString read FfkOrderOutRefNumberDoc write FfkOrderOutRefNumberDoc;
    property fkOrderOutRefDateGen : TXSDate read FfkOrderOutRefDateGen write FfkOrderOutRefDateGen;
    property fkOrderOutRefDateShipment : TXSDate read FfkOrderOutRefDateShipment write FfkOrderOutRefDateShipment;
    property fkOrderOutRefMolOutCode : WideString read FfkOrderOutRefMolOutCode write FfkOrderOutRefMolOutCode;
    property fkOrderOutRefMolOutName : WideString read FfkOrderOutRefMolOutName write FfkOrderOutRefMolOutName;
    property fkOrderOutRefMolInCode : WideString read FfkOrderOutRefMolInCode write FfkOrderOutRefMolInCode;
    property fkOrderOutRefMolInName : WideString read FfkOrderOutRefMolInName write FfkOrderOutRefMolInName;
    property fkOrderOutRefExpeditorCode : WideString read FfkOrderOutRefExpeditorCode write FfkOrderOutRefExpeditorCode;
    property fkOrderOutRefExpeditorName : WideString read FfkOrderOutRefExpeditorName write FfkOrderOutRefExpeditorName;
    property fkOrderOutRefWarrantNumber : WideString read FfkOrderOutRefWarrantNumber write FfkOrderOutRefWarrantNumber;
    property fkOrderOutRefWarrantDate : TXSDate read FfkOrderOutRefWarrantDate write FfkOrderOutRefWarrantDate;
    property fkOrderOutRefWarrantFIO : WideString read FfkOrderOutRefWarrantFIO write FfkOrderOutRefWarrantFIO;
    property fkOrderOutRefSumWithoutNds : TXSDecimal read FfkOrderOutRefSumWithoutNds write FfkOrderOutRefSumWithoutNds;
    property fkOrderOutRefSumNds : TXSDecimal read FfkOrderOutRefSumNds write FfkOrderOutRefSumNds;
    property fkOrderOutRefNdsPercent : Integer read FfkOrderOutRefNdsPercent write FfkOrderOutRefNdsPercent;
    property fkOrderOutRefPercentProfits : TXSDecimal read FfkOrderOutRefPercentProfits write FfkOrderOutRefPercentProfits;
    property fkOrderOutRefAccount : WideString read FfkOrderOutRefAccount write FfkOrderOutRefAccount;
    property fkOrderOutRefKod_podr : WideString read FfkOrderOutRefKod_podr write FfkOrderOutRefKod_podr;
    property fkOrderOutRefName_podr : WideString read FfkOrderOutRefName_podr write FfkOrderOutRefName_podr;
    property fkOrderOutRefDateAdd : TXSDateTime read FfkOrderOutRefDateAdd write FfkOrderOutRefDateAdd;
    property fkOrderOutRefUserAdd : WideString read FfkOrderOutRefUserAdd write FfkOrderOutRefUserAdd;
    property fkOrderOutRefDateEdit : TXSDateTime read FfkOrderOutRefDateEdit write FfkOrderOutRefDateEdit;
    property fkOrderOutRefDatePosting : TXSDate read FfkOrderOutRefDatePosting write FfkOrderOutRefDatePosting;
    property fkOrderOutRefUserGen : WideString read FfkOrderOutRefUserGen write FfkOrderOutRefUserGen;
    property fkOrderOutRefPalletNumber : WideString read FfkOrderOutRefPalletNumber write FfkOrderOutRefPalletNumber;
  end;

  ArrayOfRQFKOrder2FKOrderShort = array of RQFKOrder2FKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2FKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2FKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2FKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2FKOrderController/message/
  // soapAction: http://ksoe.org/RQFKOrder2FKOrderController/action/RQFKOrder2FKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2FKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2FKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2FKOrderControllerSoapPort = interface(IInvokable)
  ['{B7E10ECC-FB38-41E4-804D-FEE2E8BAD482}']
    function add(const aRQFKOrder2FKOrder: RQFKOrder2FKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2FKOrder: RQFKOrder2FKOrder); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrder2FKOrder; stdcall;
    function getList: RQFKOrder2FKOrderShortList; stdcall;
    function getFilteredList(const aRQFKOrder2FKOrderFilter: RQFKOrder2FKOrderFilter): RQFKOrder2FKOrderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrder2FKOrderFilter: RQFKOrder2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrder2FKOrderFilter: RQFKOrder2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrder2FKOrderShort; stdcall;
  end;


implementation

  destructor RQFKOrder2FKOrder.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkOrderInRef) then
      fkOrderInRef.Free;
    if Assigned(FfkOrderOutRef) then
      fkOrderOutRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrder2FKOrderFilter.Destroy;
  begin
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FfkOrderInRef) then
      fkOrderInRef.Free;
    if Assigned(FfkOrderOutRef) then
      fkOrderOutRef.Free;
    inherited Destroy;
  end;
}

  destructor RQFKOrder2FKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQFKOrder2FKOrderShort.Destroy;
  begin
    if Assigned(FfkOrderInRefDateGen) then
      fkOrderInRefDateGen.Free;
    if Assigned(FfkOrderInRefDateShipment) then
      fkOrderInRefDateShipment.Free;
    if Assigned(FfkOrderInRefWarrantDate) then
      fkOrderInRefWarrantDate.Free;
    if Assigned(FfkOrderInRefSumWithoutNds) then
      fkOrderInRefSumWithoutNds.Free;
    if Assigned(FfkOrderInRefSumNds) then
      fkOrderInRefSumNds.Free;
    if Assigned(FfkOrderInRefPercentProfits) then
      fkOrderInRefPercentProfits.Free;
    if Assigned(FfkOrderInRefDateAdd) then
      fkOrderInRefDateAdd.Free;
    if Assigned(FfkOrderInRefDateEdit) then
      fkOrderInRefDateEdit.Free;
    if Assigned(FfkOrderInRefDatePosting) then
      fkOrderInRefDatePosting.Free;
    if Assigned(FfkOrderOutRefDateGen) then
      fkOrderOutRefDateGen.Free;
    if Assigned(FfkOrderOutRefDateShipment) then
      fkOrderOutRefDateShipment.Free;
    if Assigned(FfkOrderOutRefWarrantDate) then
      fkOrderOutRefWarrantDate.Free;
    if Assigned(FfkOrderOutRefSumWithoutNds) then
      fkOrderOutRefSumWithoutNds.Free;
    if Assigned(FfkOrderOutRefSumNds) then
      fkOrderOutRefSumNds.Free;
    if Assigned(FfkOrderOutRefPercentProfits) then
      fkOrderOutRefPercentProfits.Free;
    if Assigned(FfkOrderOutRefDateAdd) then
      fkOrderOutRefDateAdd.Free;
    if Assigned(FfkOrderOutRefDateEdit) then
      fkOrderOutRefDateEdit.Free;
    if Assigned(FfkOrderOutRefDatePosting) then
      fkOrderOutRefDatePosting.Free;
    inherited Destroy;
  end;

  destructor RQFKOrder2FKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrder');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2FKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2FKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2FKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2FKOrderControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKOrderController/action/RQFKOrder2FKOrderController.%operationName%');


end.
