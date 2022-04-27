unit ENRegForSupplierItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENRegForSupplierController
   ,ENRegForSupplierTypeController
   ,ENDisconnectInitiatorController
   ,ENPlanWorkController
   ,TKClassificationTypeController
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

  ENRegForSupplierItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierItem = class(TRemotable)
  private
    Fcode : Integer;
    FrecordpointEic : WideString;
    FcustomerUid : WideString;
    FdatePlanned : TXSDate;
    FdateComplete : TXSDate;
    Fdescription : WideString;
    FcalcNumber : WideString;
    FcalcName : WideString;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
    FdhDisconnectionCode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FregistryRef : ENRegForSupplierRef;
//???
    FregistryTypeRef : ENRegForSupplierTypeRef;
//???
    FinitiatorRef : ENDisconnectInitiatorRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfactRef : ENPlanWorkRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property recordpointEic : WideString read FrecordpointEic write FrecordpointEic;
    property customerUid : WideString read FcustomerUid write FcustomerUid;
    property datePlanned : TXSDate read FdatePlanned write FdatePlanned;
    property dateComplete : TXSDate read FdateComplete write FdateComplete;
    property description : WideString read Fdescription write Fdescription;
    property calcNumber : WideString read FcalcNumber write FcalcNumber;
    property calcName : WideString read FcalcName write FcalcName;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;
    property dhDisconnectionCode : Integer read FdhDisconnectionCode write FdhDisconnectionCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property registryRef : ENRegForSupplierRef read FregistryRef write FregistryRef;
    property registryTypeRef : ENRegForSupplierTypeRef read FregistryTypeRef write FregistryTypeRef;
    property initiatorRef : ENDisconnectInitiatorRef read FinitiatorRef write FinitiatorRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property factRef : ENPlanWorkRef read FfactRef write FfactRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
  end;

{
  ENRegForSupplierItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FrecordpointEic : WideString;
    FcustomerUid : WideString;
    FdatePlanned : TXSDate;
    FdateComplete : TXSDate;
    Fdescription : WideString;
    FcalcNumber : WideString;
    FcalcName : WideString;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
    FdhDisconnectionCode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FregistryRef : ENRegForSupplierRef;
//???
    FregistryTypeRef : ENRegForSupplierTypeRef;
//???
    FinitiatorRef : ENDisconnectInitiatorRef;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfactRef : ENPlanWorkRef;
//???
    FclassificationTypeRef : TKClassificationTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property recordpointEic : WideString read FrecordpointEic write FrecordpointEic;
    property customerUid : WideString read FcustomerUid write FcustomerUid;
    property datePlanned : TXSDate read FdatePlanned write FdatePlanned;
    property dateComplete : TXSDate read FdateComplete write FdateComplete;
    property description : WideString read Fdescription write Fdescription;
    property calcNumber : WideString read FcalcNumber write FcalcNumber;
    property calcName : WideString read FcalcName write FcalcName;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;
    property dhDisconnectionCode : Integer read FdhDisconnectionCode write FdhDisconnectionCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property registryRef : ENRegForSupplierRef read FregistryRef write FregistryRef;
    property registryTypeRef : ENRegForSupplierTypeRef read FregistryTypeRef write FregistryTypeRef;
    property initiatorRef : ENDisconnectInitiatorRef read FinitiatorRef write FinitiatorRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property factRef : ENPlanWorkRef read FfactRef write FfactRef;
    property classificationTypeRef : TKClassificationTypeRef read FclassificationTypeRef write FclassificationTypeRef;
  end;
}

  ENRegForSupplierItemFilter = class(ENRegForSupplierItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRegForSupplierItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FrecordpointEic : WideString;
    FcustomerUid : WideString;
    FdatePlanned : TXSDate;
    FdateComplete : TXSDate;
    Fdescription : WideString;
    FcalcNumber : WideString;
    FcalcName : WideString;
    FcostWithoutVAT : TXSDecimal;
    FcostVAT : TXSDecimal;
    FcostWithVAT : TXSDecimal;
    FdhDisconnectionCode : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FregistryRefCode : Integer;
    FregistryRefNumberGen : WideString;
    FregistryRefDateFrom : TXSDate;
    FregistryRefDateTo : TXSDate;
    FregistryRefSupplierCode : Integer;
    FregistryRefCommentGen : WideString;
    FregistryRefUserGen : WideString;
    FregistryRefDateEdit : TXSDateTime;
    FregistryTypeRefCode : Integer;
    FregistryTypeRefName : WideString;
    FregistryTypeRefDescription : WideString;
    FinitiatorRefCode : Integer;
    FinitiatorRefName : WideString;
    FplanRefCode : Integer;
    FplanRefDateGen : TXSDateTime;
    FplanRefDateStart : TXSDate;
    FplanRefDateFinal : TXSDate;
    FplanRefYearGen : Integer;
    FplanRefMonthGen : Integer;
    FplanRefYearOriginal : Integer;
    FplanRefMonthOriginal : Integer;
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FplanRefWorkOrderNumber : WideString;
    FplanRefDateWorkOrder : TXSDate;
    FplanRefPriConnectionNumber : WideString;
    FplanRefDateEndPriConnection : TXSDate;
    FplanRefInvestWorksDescription : WideString;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;
    FfactRefCode : Integer;
    FfactRefDateGen : TXSDateTime;
    FfactRefDateStart : TXSDate;
    FfactRefDateFinal : TXSDate;
    FfactRefYearGen : Integer;
    FfactRefMonthGen : Integer;
    FfactRefYearOriginal : Integer;
    FfactRefMonthOriginal : Integer;
    FfactRefUserGen : WideString;
    FfactRefDateEdit : TXSDate;
    FfactRefWorkOrderNumber : WideString;
    FfactRefDateWorkOrder : TXSDate;
    FfactRefPriConnectionNumber : WideString;
    FfactRefDateEndPriConnection : TXSDate;
    FfactRefInvestWorksDescription : WideString;
    FfactRefServicesFSideFinId : Integer;
    FfactRefServicesFSideCnNum : WideString;
    FfactRefTotalTimeHours : TXSDecimal;
    FfactRefTotalTimeDays : TXSDecimal;
    FfactRefInvestItemNumber : WideString;
    FclassificationTypeRefCode : Integer;
    FclassificationTypeRefName : WideString;
    FclassificationTypeRefKod : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property recordpointEic : WideString read FrecordpointEic write FrecordpointEic;
    property customerUid : WideString read FcustomerUid write FcustomerUid;
    property datePlanned : TXSDate read FdatePlanned write FdatePlanned;
    property dateComplete : TXSDate read FdateComplete write FdateComplete;
    property description : WideString read Fdescription write Fdescription;
    property calcNumber : WideString read FcalcNumber write FcalcNumber;
    property calcName : WideString read FcalcName write FcalcName;
    property costWithoutVAT : TXSDecimal read FcostWithoutVAT write FcostWithoutVAT;
    property costVAT : TXSDecimal read FcostVAT write FcostVAT;
    property costWithVAT : TXSDecimal read FcostWithVAT write FcostWithVAT;
    property  dhDisconnectionCode : Integer read FdhDisconnectionCode write FdhDisconnectionCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property registryRefCode : Integer read FregistryRefCode write FregistryRefCode;
    property registryRefNumberGen : WideString read FregistryRefNumberGen write FregistryRefNumberGen;
    property registryRefDateFrom : TXSDate read FregistryRefDateFrom write FregistryRefDateFrom;
    property registryRefDateTo : TXSDate read FregistryRefDateTo write FregistryRefDateTo;
    property registryRefSupplierCode : Integer read FregistryRefSupplierCode write FregistryRefSupplierCode;
    property registryRefCommentGen : WideString read FregistryRefCommentGen write FregistryRefCommentGen;
    property registryRefUserGen : WideString read FregistryRefUserGen write FregistryRefUserGen;
    property registryRefDateEdit : TXSDateTime read FregistryRefDateEdit write FregistryRefDateEdit;
    property registryTypeRefCode : Integer read FregistryTypeRefCode write FregistryTypeRefCode;
    property registryTypeRefName : WideString read FregistryTypeRefName write FregistryTypeRefName;
    property registryTypeRefDescription : WideString read FregistryTypeRefDescription write FregistryTypeRefDescription;
    property initiatorRefCode : Integer read FinitiatorRefCode write FinitiatorRefCode;
    property initiatorRefName : WideString read FinitiatorRefName write FinitiatorRefName;
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDateTime read FplanRefDateGen write FplanRefDateGen;
    property planRefDateStart : TXSDate read FplanRefDateStart write FplanRefDateStart;
    property planRefDateFinal : TXSDate read FplanRefDateFinal write FplanRefDateFinal;
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property planRefYearOriginal : Integer read FplanRefYearOriginal write FplanRefYearOriginal;
    property planRefMonthOriginal : Integer read FplanRefMonthOriginal write FplanRefMonthOriginal;
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen;
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit;
    property planRefWorkOrderNumber : WideString read FplanRefWorkOrderNumber write FplanRefWorkOrderNumber;
    property planRefDateWorkOrder : TXSDate read FplanRefDateWorkOrder write FplanRefDateWorkOrder;
    property planRefPriConnectionNumber : WideString read FplanRefPriConnectionNumber write FplanRefPriConnectionNumber;
    property planRefDateEndPriConnection : TXSDate read FplanRefDateEndPriConnection write FplanRefDateEndPriConnection;
    property planRefInvestWorksDescription : WideString read FplanRefInvestWorksDescription write FplanRefInvestWorksDescription;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;
    property factRefCode : Integer read FfactRefCode write FfactRefCode;
    property factRefDateGen : TXSDateTime read FfactRefDateGen write FfactRefDateGen;
    property factRefDateStart : TXSDate read FfactRefDateStart write FfactRefDateStart;
    property factRefDateFinal : TXSDate read FfactRefDateFinal write FfactRefDateFinal;
    property factRefYearGen : Integer read FfactRefYearGen write FfactRefYearGen;
    property factRefMonthGen : Integer read FfactRefMonthGen write FfactRefMonthGen;
    property factRefYearOriginal : Integer read FfactRefYearOriginal write FfactRefYearOriginal;
    property factRefMonthOriginal : Integer read FfactRefMonthOriginal write FfactRefMonthOriginal;
    property factRefUserGen : WideString read FfactRefUserGen write FfactRefUserGen;
    property factRefDateEdit : TXSDate read FfactRefDateEdit write FfactRefDateEdit;
    property factRefWorkOrderNumber : WideString read FfactRefWorkOrderNumber write FfactRefWorkOrderNumber;
    property factRefDateWorkOrder : TXSDate read FfactRefDateWorkOrder write FfactRefDateWorkOrder;
    property factRefPriConnectionNumber : WideString read FfactRefPriConnectionNumber write FfactRefPriConnectionNumber;
    property factRefDateEndPriConnection : TXSDate read FfactRefDateEndPriConnection write FfactRefDateEndPriConnection;
    property factRefInvestWorksDescription : WideString read FfactRefInvestWorksDescription write FfactRefInvestWorksDescription;
    property factRefServicesFSideFinId : Integer read FfactRefServicesFSideFinId write FfactRefServicesFSideFinId;
    property factRefServicesFSideCnNum : WideString read FfactRefServicesFSideCnNum write FfactRefServicesFSideCnNum;
    property factRefTotalTimeHours : TXSDecimal read FfactRefTotalTimeHours write FfactRefTotalTimeHours;
    property factRefTotalTimeDays : TXSDecimal read FfactRefTotalTimeDays write FfactRefTotalTimeDays;
    property factRefInvestItemNumber : WideString read FfactRefInvestItemNumber write FfactRefInvestItemNumber;
    property classificationTypeRefCode : Integer read FclassificationTypeRefCode write FclassificationTypeRefCode;
    property classificationTypeRefName : WideString read FclassificationTypeRefName write FclassificationTypeRefName;
    property classificationTypeRefKod : WideString read FclassificationTypeRefKod write FclassificationTypeRefKod;
  end;

  ArrayOfENRegForSupplierItemShort = array of ENRegForSupplierItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRegForSupplierItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRegForSupplierItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRegForSupplierItemShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRegForSupplierItemController/message/
  // soapAction: http://ksoe.org/ENRegForSupplierItemController/action/ENRegForSupplierItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRegForSupplierItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRegForSupplierItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRegForSupplierItemControllerSoapPort = interface(IInvokable)
  ['{21BFDA3F-303F-49C8-8D97-A6882B1AC790}']
    function add(const aENRegForSupplierItem: ENRegForSupplierItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRegForSupplierItem: ENRegForSupplierItem); stdcall;
    function getObject(const anObjectCode: Integer): ENRegForSupplierItem; stdcall;
    function getList: ENRegForSupplierItemShortList; stdcall;
    function getFilteredList(const aENRegForSupplierItemFilter: ENRegForSupplierItemFilter): ENRegForSupplierItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierItemShortList; stdcall;
    function getScrollableFilteredList(const aENRegForSupplierItemFilter: ENRegForSupplierItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRegForSupplierItemFilter: ENRegForSupplierItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRegForSupplierItemShort; stdcall;
  end;


implementation

  destructor ENRegForSupplierItem.Destroy;
  begin
    if Assigned(FdatePlanned) then
      datePlanned.Free;
    if Assigned(FdateComplete) then
      dateComplete.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FregistryRef) then
      registryRef.Free;
    if Assigned(FregistryTypeRef) then
      registryTypeRef.Free;
    if Assigned(FinitiatorRef) then
      initiatorRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfactRef) then
      factRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENRegForSupplierItemFilter.Destroy;
  begin
    if Assigned(FdatePlanned) then
      datePlanned.Free;
    if Assigned(FdateComplete) then
      dateComplete.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FregistryRef) then
      registryRef.Free;
    if Assigned(FregistryTypeRef) then
      registryTypeRef.Free;
    if Assigned(FinitiatorRef) then
      initiatorRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfactRef) then
      factRef.Free;
    if Assigned(FclassificationTypeRef) then
      classificationTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENRegForSupplierItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENRegForSupplierItemShort.Destroy;
  begin
    if Assigned(FdatePlanned) then
      datePlanned.Free;
    if Assigned(FdateComplete) then
      dateComplete.Free;
    if Assigned(FcostWithoutVAT) then
      costWithoutVAT.Free;
    if Assigned(FcostVAT) then
      costVAT.Free;
    if Assigned(FcostWithVAT) then
      costWithVAT.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FregistryRefDateFrom) then
      registryRefDateFrom.Free;
    if Assigned(FregistryRefDateTo) then
      registryRefDateTo.Free;
    if Assigned(FregistryRefDateEdit) then
      registryRefDateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateStart) then
      planRefDateStart.Free;
    if Assigned(FplanRefDateFinal) then
      planRefDateFinal.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FplanRefDateWorkOrder) then
      planRefDateWorkOrder.Free;
    if Assigned(FplanRefDateEndPriConnection) then
      planRefDateEndPriConnection.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    if Assigned(FfactRefDateGen) then
      factRefDateGen.Free;
    if Assigned(FfactRefDateStart) then
      factRefDateStart.Free;
    if Assigned(FfactRefDateFinal) then
      factRefDateFinal.Free;
    if Assigned(FfactRefDateEdit) then
      factRefDateEdit.Free;
    if Assigned(FfactRefDateWorkOrder) then
      factRefDateWorkOrder.Free;
    if Assigned(FfactRefDateEndPriConnection) then
      factRefDateEndPriConnection.Free;
    if Assigned(FfactRefTotalTimeHours) then
      factRefTotalTimeHours.Free;
    if Assigned(FfactRefTotalTimeDays) then
      factRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENRegForSupplierItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRegForSupplierItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierItem');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierItemRef');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierItemFilter');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierItemShort');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRegForSupplierItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRegForSupplierItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRegForSupplierItemControllerSoapPort), 'http://ksoe.org/ENRegForSupplierItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRegForSupplierItemControllerSoapPort), 'http://ksoe.org/ENRegForSupplierItemController/action/ENRegForSupplierItemController.%operationName%');


end.
