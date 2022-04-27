unit RQAllocationList2FKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQAllocationListController
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

  RQAllocationList2FKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationList2FKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationList2FKOrder = class(TRemotable)
  private
    Fcode : Integer;
//???
    FlistRef : RQAllocationListRef;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property listRef : RQAllocationListRef read FlistRef write FlistRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;

{
  RQAllocationList2FKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FlistRef : RQAllocationListRef;
//???
    FfkorderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property listRef : RQAllocationListRef read FlistRef write FlistRef;
    property fkorderRef : RQFKOrderRef read FfkorderRef write FfkorderRef;
  end;
}

  RQAllocationList2FKOrderFilter = class(RQAllocationList2FKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationList2FKOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    FlistRefCode : Integer;
    FlistRefNumberGen : WideString;
    FlistRefDateGen : TXSDate;
    FlistRefDateStart : TXSDate;
    FlistRefDateFinal : TXSDate;
    FlistRefMolFromCode : WideString;
    FlistRefMolFromName : WideString;
    FlistRefMolToCode : WideString;
    FlistRefMolToName : WideString;
    FlistRefUserGen : WideString;
    FlistRefDateEdit : TXSDate;
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

    property listRefCode : Integer read FlistRefCode write FlistRefCode;
    property listRefNumberGen : WideString read FlistRefNumberGen write FlistRefNumberGen;
    property listRefDateGen : TXSDate read FlistRefDateGen write FlistRefDateGen;
    property listRefDateStart : TXSDate read FlistRefDateStart write FlistRefDateStart;
    property listRefDateFinal : TXSDate read FlistRefDateFinal write FlistRefDateFinal;
    property listRefMolFromCode : WideString read FlistRefMolFromCode write FlistRefMolFromCode;
    property listRefMolFromName : WideString read FlistRefMolFromName write FlistRefMolFromName;
    property listRefMolToCode : WideString read FlistRefMolToCode write FlistRefMolToCode;
    property listRefMolToName : WideString read FlistRefMolToName write FlistRefMolToName;
    property listRefUserGen : WideString read FlistRefUserGen write FlistRefUserGen;
    property listRefDateEdit : TXSDate read FlistRefDateEdit write FlistRefDateEdit;
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

  ArrayOfRQAllocationList2FKOrderShort = array of RQAllocationList2FKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationList2FKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationList2FKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationList2FKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationList2FKOrderController/message/
  // soapAction: http://ksoe.org/RQAllocationList2FKOrderController/action/RQAllocationList2FKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationList2FKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationList2FKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationList2FKOrderControllerSoapPort = interface(IInvokable)
  ['{DD29F634-83FF-41CD-9F77-2D9ABF4CA965}']
    function add(const aRQAllocationList2FKOrder: RQAllocationList2FKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationList2FKOrder: RQAllocationList2FKOrder); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationList2FKOrder; stdcall;
    function getList: RQAllocationList2FKOrderShortList; stdcall;
    function getFilteredList(const aRQAllocationList2FKOrderFilter: RQAllocationList2FKOrderFilter): RQAllocationList2FKOrderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationList2FKOrderShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationList2FKOrderFilter: RQAllocationList2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationList2FKOrderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationList2FKOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationList2FKOrderFilter: RQAllocationList2FKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationList2FKOrderShort; stdcall;
  end;


implementation

  destructor RQAllocationList2FKOrder.Destroy;
  begin
    if Assigned(FlistRef) then
      listRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;

{
  destructor RQAllocationList2FKOrderFilter.Destroy;
  begin
    if Assigned(FlistRef) then
      listRef.Free;
    if Assigned(FfkorderRef) then
      fkorderRef.Free;
    inherited Destroy;
  end;
}

  destructor RQAllocationList2FKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQAllocationList2FKOrderShort.Destroy;
  begin
    if Assigned(FlistRefDateGen) then
      listRefDateGen.Free;
    if Assigned(FlistRefDateStart) then
      listRefDateStart.Free;
    if Assigned(FlistRefDateFinal) then
      listRefDateFinal.Free;
    if Assigned(FlistRefDateEdit) then
      listRefDateEdit.Free;
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

  destructor RQAllocationList2FKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationList2FKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList2FKOrder');
  RemClassRegistry.RegisterXSClass(RQAllocationList2FKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList2FKOrderRef');
  RemClassRegistry.RegisterXSClass(RQAllocationList2FKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList2FKOrderFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationList2FKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList2FKOrderShort');
  RemClassRegistry.RegisterXSClass(RQAllocationList2FKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList2FKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationList2FKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationList2FKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationList2FKOrderControllerSoapPort), 'http://ksoe.org/RQAllocationList2FKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationList2FKOrderControllerSoapPort), 'http://ksoe.org/RQAllocationList2FKOrderController/action/RQAllocationList2FKOrderController.%operationName%');


end.
