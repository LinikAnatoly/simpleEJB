unit RQApprovedCostController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQApprovedCostStatusController
   ,RQOrderItemController
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

  RQApprovedCost            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApprovedCostRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQApprovedCost = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FcounterPhasity : Integer;
    FcommentGen : WideString;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FapprovedCostStatusRef : RQApprovedCostStatusRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property  counterPhasity : Integer read FcounterPhasity write FcounterPhasity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property approvedCostStatusRef : RQApprovedCostStatusRef read FapprovedCostStatusRef write FapprovedCostStatusRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
  end;

{
  RQApprovedCostFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FcounterPhasity : Integer;
    FcommentGen : WideString;
    FdateEdit : DateTime;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FapprovedCostStatusRef : RQApprovedCostStatusRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property  counterPhasity : Integer read FcounterPhasity write FcounterPhasity;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateEdit : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property approvedCostStatusRef : RQApprovedCostStatusRef read FapprovedCostStatusRef write FapprovedCostStatusRef;
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef;
  end;
}

  RQApprovedCostFilter = class(RQApprovedCost)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQApprovedCostShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FcounterPhasity : Integer;
    FdateEdit : TXSDateTime;
    FuserGen : WideString;
    FapprovedCostStatusRefCode : Integer;
    FapprovedCostStatusRefName : WideString;
    FrqOrderItemRefCode : Integer;
    FrqOrderItemRefCountGen : TXSDecimal;
    FrqOrderItemRefMaterialNameTxt : WideString;
    FrqOrderItemRefMeasurementNameTxt : WideString;
    FrqOrderItemRefMaterialNameGen : WideString;
    FrqOrderItemRefMeasurementNameGen : WideString;
    FrqOrderItemRefMaterialNameGenRQ : WideString;
    FrqOrderItemRefMeasurementNameGenRQ : WideString;
    FrqOrderItemRefCountFact : TXSDecimal;
    FrqOrderItemRefPriceWithoutNds : TXSDecimal;
    FrqOrderItemRefNds : TXSDecimal;
    FrqOrderItemRefPriceWithNds : TXSDecimal;
    FrqOrderItemRefSumWithoutNds : TXSDecimal;
    FrqOrderItemRefSumNds : TXSDecimal;
    FrqOrderItemRefSumGen : TXSDecimal;
    FrqOrderItemRefCommentGen : WideString;
    FrqOrderItemRefDeliveryTime : Integer;
    FrqOrderItemRefContractNumber : WideString;
    FrqOrderItemRefContractDate : TXSDate;
    FrqOrderItemRefFinDocCode : WideString;
    FrqOrderItemRefFinDocID : Integer;
    FrqOrderItemRefPlannedDatePays : TXSDate;
    FrqOrderItemRefPlannedDateDelivery : TXSDate;
    FrqOrderItemRefStatusReason : WideString;
    FrqOrderItemRefPaymentValue : Integer;
    FrqOrderItemRefIsPaid : Integer;
    FrqOrderItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds;
    property  counterPhasity : Integer read FcounterPhasity write FcounterPhasity;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userGen : WideString read FuserGen write FuserGen;

    property approvedCostStatusRefCode : Integer read FapprovedCostStatusRefCode write FapprovedCostStatusRefCode;
    property approvedCostStatusRefName : WideString read FapprovedCostStatusRefName write FapprovedCostStatusRefName;
    property rqOrderItemRefCode : Integer read FrqOrderItemRefCode write FrqOrderItemRefCode;
    property rqOrderItemRefCountGen : TXSDecimal read FrqOrderItemRefCountGen write FrqOrderItemRefCountGen;
    property rqOrderItemRefMaterialNameTxt : WideString read FrqOrderItemRefMaterialNameTxt write FrqOrderItemRefMaterialNameTxt;
    property rqOrderItemRefMeasurementNameTxt : WideString read FrqOrderItemRefMeasurementNameTxt write FrqOrderItemRefMeasurementNameTxt;
    property rqOrderItemRefMaterialNameGen : WideString read FrqOrderItemRefMaterialNameGen write FrqOrderItemRefMaterialNameGen;
    property rqOrderItemRefMeasurementNameGen : WideString read FrqOrderItemRefMeasurementNameGen write FrqOrderItemRefMeasurementNameGen;
    property rqOrderItemRefMaterialNameGenRQ : WideString read FrqOrderItemRefMaterialNameGenRQ write FrqOrderItemRefMaterialNameGenRQ;
    property rqOrderItemRefMeasurementNameGenRQ : WideString read FrqOrderItemRefMeasurementNameGenRQ write FrqOrderItemRefMeasurementNameGenRQ;
    property rqOrderItemRefCountFact : TXSDecimal read FrqOrderItemRefCountFact write FrqOrderItemRefCountFact;
    property rqOrderItemRefPriceWithoutNds : TXSDecimal read FrqOrderItemRefPriceWithoutNds write FrqOrderItemRefPriceWithoutNds;
    property rqOrderItemRefNds : TXSDecimal read FrqOrderItemRefNds write FrqOrderItemRefNds;
    property rqOrderItemRefPriceWithNds : TXSDecimal read FrqOrderItemRefPriceWithNds write FrqOrderItemRefPriceWithNds;
    property rqOrderItemRefSumWithoutNds : TXSDecimal read FrqOrderItemRefSumWithoutNds write FrqOrderItemRefSumWithoutNds;
    property rqOrderItemRefSumNds : TXSDecimal read FrqOrderItemRefSumNds write FrqOrderItemRefSumNds;
    property rqOrderItemRefSumGen : TXSDecimal read FrqOrderItemRefSumGen write FrqOrderItemRefSumGen;
    property rqOrderItemRefCommentGen : WideString read FrqOrderItemRefCommentGen write FrqOrderItemRefCommentGen;
    property rqOrderItemRefDeliveryTime : Integer read FrqOrderItemRefDeliveryTime write FrqOrderItemRefDeliveryTime;
    property rqOrderItemRefContractNumber : WideString read FrqOrderItemRefContractNumber write FrqOrderItemRefContractNumber;
    property rqOrderItemRefContractDate : TXSDate read FrqOrderItemRefContractDate write FrqOrderItemRefContractDate;
    property rqOrderItemRefFinDocCode : WideString read FrqOrderItemRefFinDocCode write FrqOrderItemRefFinDocCode;
    property rqOrderItemRefFinDocID : Integer read FrqOrderItemRefFinDocID write FrqOrderItemRefFinDocID;
    property rqOrderItemRefPlannedDatePays : TXSDate read FrqOrderItemRefPlannedDatePays write FrqOrderItemRefPlannedDatePays;
    property rqOrderItemRefPlannedDateDelivery : TXSDate read FrqOrderItemRefPlannedDateDelivery write FrqOrderItemRefPlannedDateDelivery;
    property rqOrderItemRefStatusReason : WideString read FrqOrderItemRefStatusReason write FrqOrderItemRefStatusReason;
    property rqOrderItemRefPaymentValue : Integer read FrqOrderItemRefPaymentValue write FrqOrderItemRefPaymentValue;
    property rqOrderItemRefIsPaid : Integer read FrqOrderItemRefIsPaid write FrqOrderItemRefIsPaid;
    property rqOrderItemRefUserGen : WideString read FrqOrderItemRefUserGen write FrqOrderItemRefUserGen;
  end;

  ArrayOfRQApprovedCostShort = array of RQApprovedCostShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQApprovedCostShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQApprovedCostShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQApprovedCostShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQApprovedCostController/message/
  // soapAction: http://ksoe.org/RQApprovedCostController/action/RQApprovedCostController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQApprovedCostControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQApprovedCostController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQApprovedCostControllerSoapPort = interface(IInvokable)
  ['{3DF684AC-C6C0-48BB-B7E7-339CEBD78959}']
    function add(const aRQApprovedCost: RQApprovedCost): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQApprovedCost: RQApprovedCost); stdcall;
    function getObject(const anObjectCode: Integer): RQApprovedCost; stdcall;
    function getList: RQApprovedCostShortList; stdcall;
    function getFilteredList(const aRQApprovedCostFilter: RQApprovedCostFilter): RQApprovedCostShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostShortList; stdcall;
    function getScrollableFilteredList(const aRQApprovedCostFilter: RQApprovedCostFilter; const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQApprovedCostShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQApprovedCostFilter: RQApprovedCostFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQApprovedCostShort; stdcall;
    procedure confirmCost(const anObject: RQApprovedCost); stdcall;
    procedure undoConfirmCost(const anObjectCode: Integer); stdcall;
    procedure confirmCostVRTU(const anObject: RQApprovedCost); stdcall;
    procedure confirmCostVRTUNoControl(const anObject: RQApprovedCost); stdcall;
    procedure undoConfirmCostVRTU(const anObjectCode: Integer); stdcall;
  end;


implementation

  destructor RQApprovedCost.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FapprovedCostStatusRef) then
      approvedCostStatusRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQApprovedCostFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FapprovedCostStatusRef) then
      approvedCostStatusRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQApprovedCostFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQApprovedCostShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrqOrderItemRefCountGen) then
      rqOrderItemRefCountGen.Free;
    if Assigned(FrqOrderItemRefCountFact) then
      rqOrderItemRefCountFact.Free;
    if Assigned(FrqOrderItemRefPriceWithoutNds) then
      rqOrderItemRefPriceWithoutNds.Free;
    if Assigned(FrqOrderItemRefNds) then
      rqOrderItemRefNds.Free;
    if Assigned(FrqOrderItemRefPriceWithNds) then
      rqOrderItemRefPriceWithNds.Free;
    if Assigned(FrqOrderItemRefSumWithoutNds) then
      rqOrderItemRefSumWithoutNds.Free;
    if Assigned(FrqOrderItemRefSumNds) then
      rqOrderItemRefSumNds.Free;
    if Assigned(FrqOrderItemRefSumGen) then
      rqOrderItemRefSumGen.Free;
    if Assigned(FrqOrderItemRefContractDate) then
      rqOrderItemRefContractDate.Free;
    if Assigned(FrqOrderItemRefPlannedDatePays) then
      rqOrderItemRefPlannedDatePays.Free;
    if Assigned(FrqOrderItemRefPlannedDateDelivery) then
      rqOrderItemRefPlannedDateDelivery.Free;
    inherited Destroy;
  end;

  destructor RQApprovedCostShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQApprovedCost, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCost');
  RemClassRegistry.RegisterXSClass(RQApprovedCostRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostRef');
  RemClassRegistry.RegisterXSClass(RQApprovedCostFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostFilter');
  RemClassRegistry.RegisterXSClass(RQApprovedCostShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostShort');
  RemClassRegistry.RegisterXSClass(RQApprovedCostShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQApprovedCostShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQApprovedCostShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQApprovedCostShort');

  InvRegistry.RegisterInterface(TypeInfo(RQApprovedCostControllerSoapPort), 'http://ksoe.org/RQApprovedCostController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQApprovedCostControllerSoapPort), 'http://ksoe.org/RQApprovedCostController/action/RQApprovedCostController.%operationName%');


end.
