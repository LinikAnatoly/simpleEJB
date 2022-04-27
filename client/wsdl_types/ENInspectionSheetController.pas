unit ENInspectionSheetController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
  , ENInspectionSheetStatusController
  , ENElementController
  , TKDefects2InspectionController
  , ENPlanWorkController
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

  ENInspectionSheet            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheetRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInspectionSheet = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FinspectionKind : Integer;
    FdateGen : TXSDate;
    Fexecutor : WideString;
    Faccepted : WideString;
    FobjectInvNumber : WideString;
    FobjectName : WideString;
    FequipmentKind : Integer;
    FtakeIntoCalculation : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FstatusRef : ENInspectionSheetStatusRef;
//???
    FelementRef : ENElementRef;
//???
    Fdefects2InspectRef : TKDefects2InspectionRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property inspectionKind : Integer read FinspectionKind write FinspectionKind;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property executor : WideString read Fexecutor write Fexecutor;
    property accepted : WideString read Faccepted write Faccepted;
    property objectInvNumber : WideString read FobjectInvNumber write FobjectInvNumber;
    property objectName : WideString read FobjectName write FobjectName;
    property equipmentKind : Integer read FequipmentKind write FequipmentKind;
    property takeIntoCalculation : Integer read FtakeIntoCalculation write FtakeIntoCalculation;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENInspectionSheetStatusRef read FstatusRef write FstatusRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property defects2InspectRef : TKDefects2InspectionRef read Fdefects2InspectRef write Fdefects2InspectRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENInspectionSheetFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FinspectionKind : Integer;
    FdateGen : TXSDate;
    Fexecutor : WideString;
    Faccepted : WideString;
    FobjectInvNumber : WideString;
    FobjectName : WideString;
    FequipmentKind : Integer;
    FtakeIntoCalculation : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FstatusRef : ENInspectionSheetStatusRef;
//???
    FelementRef : ENElementRef;
//???
    Fdefects2InspectRef : TKDefects2InspectionRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property inspectionKind : Integer read FinspectionKind write FinspectionKind;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property executor : WideString read Fexecutor write Fexecutor;
    property accepted : WideString read Faccepted write Faccepted;
    property objectInvNumber : WideString read FobjectInvNumber write FobjectInvNumber;
    property objectName : WideString read FobjectName write FobjectName;
    property equipmentKind : Integer read FequipmentKind write FequipmentKind;
    property takeIntoCalculation : Integer read FtakeIntoCalculation write FtakeIntoCalculation;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENInspectionSheetStatusRef read FstatusRef write FstatusRef;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property defects2InspectRef : TKDefects2InspectionRef read Fdefects2InspectRef write Fdefects2InspectRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENInspectionSheetFilter = class(ENInspectionSheet)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInspectionSheetShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FinspectionKind : Integer;
    FdateGen : TXSDate;
    Fexecutor : WideString;
    Faccepted : WideString;
    FobjectInvNumber : WideString;
    FobjectName : WideString;
    FequipmentKind : Integer;
    FtakeIntoCalculation : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FelementRefCode : Integer;
    Fdefects2InspectRefCode : Integer;
    Fdefects2InspectRefName : WideString;
    Fdefects2InspectRefUserGen : WideString;
    Fdefects2InspectRefDateEdit : TXSDateTime;
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
    FplanRefInvestDateStartWork : TXSDateTime;
    FplanRefInvestWorkMeasCode : Integer;
    FplanRefServicesFSideFinId : Integer;
    FplanRefServicesFSideCnNum : WideString;
    FplanRefTotalTimeHours : TXSDecimal;
    FplanRefTotalTimeDays : TXSDecimal;
    FplanRefInvestItemNumber : WideString;

    FinspectionKindName : WideString;
    FelementType : WideString;
    FelementInvNumber : WideString;
    FelementName : WideString;
    FrenCode : Integer;
    FrenName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property  inspectionKind : Integer read FinspectionKind write FinspectionKind;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property executor : WideString read Fexecutor write Fexecutor;
    property accepted : WideString read Faccepted write Faccepted;
    property objectInvNumber : WideString read FobjectInvNumber write FobjectInvNumber;
    property objectName : WideString read FobjectName write FobjectName;
    property equipmentKind : Integer read FequipmentKind write FequipmentKind;
    property  takeIntoCalculation : Integer read FtakeIntoCalculation write FtakeIntoCalculation;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property defects2InspectRefCode : Integer read Fdefects2InspectRefCode write Fdefects2InspectRefCode;
    property defects2InspectRefName : WideString read Fdefects2InspectRefName write Fdefects2InspectRefName;
    property defects2InspectRefUserGen : WideString read Fdefects2InspectRefUserGen write Fdefects2InspectRefUserGen;
    property defects2InspectRefDateEdit : TXSDateTime read Fdefects2InspectRefDateEdit write Fdefects2InspectRefDateEdit;
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
    property planRefInvestDateStartWork : TXSDateTime read FplanRefInvestDateStartWork write FplanRefInvestDateStartWork;
    property planRefInvestWorkMeasCode : Integer read FplanRefInvestWorkMeasCode write FplanRefInvestWorkMeasCode;
    property planRefServicesFSideFinId : Integer read FplanRefServicesFSideFinId write FplanRefServicesFSideFinId;
    property planRefServicesFSideCnNum : WideString read FplanRefServicesFSideCnNum write FplanRefServicesFSideCnNum;
    property planRefTotalTimeHours : TXSDecimal read FplanRefTotalTimeHours write FplanRefTotalTimeHours;
    property planRefTotalTimeDays : TXSDecimal read FplanRefTotalTimeDays write FplanRefTotalTimeDays;
    property planRefInvestItemNumber : WideString read FplanRefInvestItemNumber write FplanRefInvestItemNumber;

    property inspectionKindName : WideString read FinspectionKindName write FinspectionKindName;
    property elementType : WideString read FelementType write FelementType;
    property elementInvNumber : WideString read FelementInvNumber write FelementInvNumber;
    property elementName : WideString read FelementName write FelementName;
    property renCode : Integer read FrenCode write FrenCode;
    property renName : WideString read FrenName write FrenName;
  end;

  ArrayOfENInspectionSheetShort = array of ENInspectionSheetShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInspectionSheetShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInspectionSheetShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInspectionSheetShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInspectionSheetController/message/
  // soapAction: http://ksoe.org/ENInspectionSheetController/action/ENInspectionSheetController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInspectionSheetControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInspectionSheetController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInspectionSheetControllerSoapPort = interface(IInvokable)
  ['{8F999340-83C8-4D78-8D99-F35552118AE1}']
    function add(const aENInspectionSheet: ENInspectionSheet): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInspectionSheet: ENInspectionSheet); stdcall;
    function getObject(const anObjectCode: Integer): ENInspectionSheet; stdcall;
    function getList: ENInspectionSheetShortList; stdcall;
    function getFilteredList(const aENInspectionSheetFilter: ENInspectionSheetFilter): ENInspectionSheetShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetShortList; stdcall;
    function getScrollableFilteredList(const aENInspectionSheetFilter: ENInspectionSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInspectionSheetShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInspectionSheetFilter: ENInspectionSheetFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInspectionSheetShort; stdcall;

    //** ENInspectionSheet. Отправить на подписание. */
    procedure sendToSigning(const anObjectCode: Integer); stdcall;
    //** ENInspectionSheet. Возврат в черновой. */
    procedure unSigning(const anObjectCode: Integer); stdcall;
    //** ENInspectionSheet. Подписать. */
    procedure signed(const anObjectCode: Integer); stdcall;
    //** ENInspectionSheet. Отмена подписания. */
    procedure unSigned(const anObjectCode: Integer); stdcall;
    //** ENInspectionSheet. Создание плана на основании листа осмотра. */
    function createPlanFromInspectionSheet(
      const inspectionSheetCode: Integer;
      const plan: ENPlanWork): Integer; stdcall;

    //** ENInspectionSheet. Копировать лист осмотра. */
	  function copySheet(const sheetCode: Integer): Integer; stdcall;

    //** ENInspectionSheet. Получить код класса напряжения по коду номинала напряжения. */
    function getVoltageClassCodeByVoltageNominalCode(const voltageNominalCode: Integer): Integer; stdcall;
  end;



implementation

  destructor ENInspectionSheet.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(Fdefects2InspectRef) then
      defects2InspectRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENInspectionSheetFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(Fdefects2InspectRef) then
      defects2InspectRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENInspectionSheetFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENInspectionSheetShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdefects2InspectRefDateEdit) then
      defects2InspectRefDateEdit.Free;
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
    if Assigned(FplanRefInvestDateStartWork) then
      planRefInvestDateStartWork.Free;
    if Assigned(FplanRefTotalTimeHours) then
      planRefTotalTimeHours.Free;
    if Assigned(FplanRefTotalTimeDays) then
      planRefTotalTimeDays.Free;
    inherited Destroy;
  end;

  destructor ENInspectionSheetShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInspectionSheet, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheet');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetRef');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetFilter');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetShort');
  RemClassRegistry.RegisterXSClass(ENInspectionSheetShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInspectionSheetShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInspectionSheetShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInspectionSheetShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInspectionSheetControllerSoapPort), 'http://ksoe.org/ENInspectionSheetController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInspectionSheetControllerSoapPort), 'http://ksoe.org/ENInspectionSheetController/action/ENInspectionSheetController.%operationName%');


end.
