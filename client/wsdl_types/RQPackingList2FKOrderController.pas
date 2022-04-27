unit RQPackingList2FKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPackingListController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  RQPackingList2FKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingList2FKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingList2FKOrder = class(TRemotable)
  private
    Fcode : Integer;
    FnamePallet : WideString;
//???
    FpackingListRef : RQPackingListRef;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;
    property packingListRef : RQPackingListRef read FpackingListRef write FpackingListRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;

{
  RQPackingList2FKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnamePallet : WideString;
//???
    FpackingListRef : RQPackingListRef;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;
    property packingListRef : RQPackingListRef read FpackingListRef write FpackingListRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;
}

  RQPackingList2FKOrderFilter = class(RQPackingList2FKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingList2FKOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    FnamePallet : WideString;
    FpackingListRefCode : Integer;
    FpackingListRefNumberGen : WideString;
    FpackingListRefDateGen : TXSDate;
    FpackingListRefMolFromCode : WideString;
    FpackingListRefMolFromName : WideString;
    FpackingListRefMolToCode : WideString;
    FpackingListRefMolToName : WideString;
    FpackingListRefDateStart : TXSDate;
    FpackingListRefDateFinal : TXSDate;
    FpackingListRefBudgetString : WideString;
    FpackingListRefMaterialString : WideString;
    FpackingListRefPackerFIO : WideString;
    FpackingListRefPackerTabNumber : WideString;
    FpackingListRefPackerPosition : WideString;
    FpackingListRefUserGen : WideString;
    FpackingListRefDateEdit : TXSDate;
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
    FfkorderRefDateAdd : TXSDateTime;
    FfkorderRefUserAdd : WideString;
    FfkorderRefDateEdit : TXSDateTime;
    FfkorderRefDatePosting : TXSDate;
    FfkorderRefUserGen : WideString;
    FfkorderRefCfo : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property namePallet : WideString read FnamePallet write FnamePallet;

    property packingListRefCode : Integer read FpackingListRefCode write FpackingListRefCode;
    property packingListRefNumberGen : WideString read FpackingListRefNumberGen write FpackingListRefNumberGen;
    property packingListRefDateGen : TXSDate read FpackingListRefDateGen write FpackingListRefDateGen;
    property packingListRefMolFromCode : WideString read FpackingListRefMolFromCode write FpackingListRefMolFromCode;
    property packingListRefMolFromName : WideString read FpackingListRefMolFromName write FpackingListRefMolFromName;
    property packingListRefMolToCode : WideString read FpackingListRefMolToCode write FpackingListRefMolToCode;
    property packingListRefMolToName : WideString read FpackingListRefMolToName write FpackingListRefMolToName;
    property packingListRefDateStart : TXSDate read FpackingListRefDateStart write FpackingListRefDateStart;
    property packingListRefDateFinal : TXSDate read FpackingListRefDateFinal write FpackingListRefDateFinal;
    property packingListRefBudgetString : WideString read FpackingListRefBudgetString write FpackingListRefBudgetString;
    property packingListRefMaterialString : WideString read FpackingListRefMaterialString write FpackingListRefMaterialString;
    property packingListRefPackerFIO : WideString read FpackingListRefPackerFIO write FpackingListRefPackerFIO;
    property packingListRefPackerTabNumber : WideString read FpackingListRefPackerTabNumber write FpackingListRefPackerTabNumber;
    property packingListRefPackerPosition : WideString read FpackingListRefPackerPosition write FpackingListRefPackerPosition;
    property packingListRefUserGen : WideString read FpackingListRefUserGen write FpackingListRefUserGen;
    property packingListRefDateEdit : TXSDate read FpackingListRefDateEdit write FpackingListRefDateEdit;
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
    property fkorderRefDateAdd : TXSDateTime read FfkorderRefDateAdd write FfkorderRefDateAdd;
    property fkorderRefUserAdd : WideString read FfkorderRefUserAdd write FfkorderRefUserAdd;
    property fkorderRefDateEdit : TXSDateTime read FfkorderRefDateEdit write FfkorderRefDateEdit;
    property fkorderRefDatePosting : TXSDate read FfkorderRefDatePosting write FfkorderRefDatePosting;
    property fkorderRefUserGen : WideString read FfkorderRefUserGen write FfkorderRefUserGen;
    property fkorderRefCfo : WideString read FfkorderRefCfo write FfkorderRefCfo;
  end;

  ArrayOfRQPackingList2FKOrderShort = array of RQPackingList2FKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingList2FKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingList2FKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingList2FKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingList2FKOrderController/message/
  // soapAction: http://ksoe.org/RQPackingList2FKOrderController/action/RQPackingList2FKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingList2FKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingList2FKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingList2FKOrderControllerSoapPort = interface(IInvokable)
  ['{f92af92a-f92a-f92a-f92a-f92af92af92a}']
    function add(const aRQPackingList2FKOrder: RQPackingList2FKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPackingList2FKOrder: RQPackingList2FKOrder); stdcall;
    function getObject(const anObjectCode: Integer): RQPackingList2FKOrder; stdcall;
    function getList: RQPackingList2FKOrderShortList; stdcall;
    function getFilteredList(const aRQPackingList2FKOrderFilter: RQPackingList2FKOrderFilter): RQPackingList2FKOrderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingList2FKOrderShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingList2FKOrderFilter: RQPackingList2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingList2FKOrderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingList2FKOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingList2FKOrderFilter: RQPackingList2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingList2FKOrderShort; stdcall;
  end;


implementation

  destructor RQPackingList2FKOrder.Destroy;
  begin
    if Assigned(FpackingListRef) then
      packingListRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPackingList2FKOrderFilter.Destroy;
  begin
    if Assigned(FpackingListRef) then
      packingListRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPackingList2FKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPackingList2FKOrderShort.Destroy;
  begin
    if Assigned(FpackingListRefDateGen) then
      packingListRefDateGen.Free;
    if Assigned(FpackingListRefDateStart) then
      packingListRefDateStart.Free;
    if Assigned(FpackingListRefDateFinal) then
      packingListRefDateFinal.Free;
    if Assigned(FpackingListRefDateEdit) then
      packingListRefDateEdit.Free;
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
    inherited Destroy;
  end;

  destructor RQPackingList2FKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingList2FKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList2FKOrder');
  RemClassRegistry.RegisterXSClass(RQPackingList2FKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList2FKOrderRef');
  RemClassRegistry.RegisterXSClass(RQPackingList2FKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList2FKOrderFilter');
  RemClassRegistry.RegisterXSClass(RQPackingList2FKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList2FKOrderShort');
  RemClassRegistry.RegisterXSClass(RQPackingList2FKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList2FKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingList2FKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingList2FKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingList2FKOrderControllerSoapPort), 'http://ksoe.org/RQPackingList2FKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingList2FKOrderControllerSoapPort), 'http://ksoe.org/RQPackingList2FKOrderController/action/RQPackingList2FKOrderController.%operationName%');


end.
