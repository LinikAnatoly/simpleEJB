unit ENPlanWorkFuelHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,TKFuelTypeController
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

  ENPlanWorkFuelHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkFuelHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkFuelHistory = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    Fversion : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property  version : Integer read Fversion write Fversion;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;

{
  ENPlanWorkFuelHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    Fversion : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FplanRef : ENPlanWorkRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property  version : Integer read Fversion write Fversion;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;
}

  ENPlanWorkFuelHistoryFilter = class(ENPlanWorkFuelHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWorkFuelHistoryShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FcountGen : TXSDecimal;
    Fversion : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property  version : Integer read Fversion write Fversion;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
  end;

  ArrayOfENPlanWorkFuelHistoryShort = array of ENPlanWorkFuelHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkFuelHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkFuelHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkFuelHistoryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkFuelHistoryController/message/
  // soapAction: http://ksoe.org/ENPlanWorkFuelHistoryController/action/ENPlanWorkFuelHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkFuelHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkFuelHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkFuelHistoryControllerSoapPort = interface(IInvokable)
  ['{BDF9B6B9-9691-44C6-B7AD-C7BB34A369BA}']
    function add(const aENPlanWorkFuelHistory: ENPlanWorkFuelHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkFuelHistory: ENPlanWorkFuelHistory); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanWorkFuelHistory; stdcall;
    function getList: ENPlanWorkFuelHistoryShortList; stdcall;
    function getFilteredList(const aENPlanWorkFuelHistoryFilter: ENPlanWorkFuelHistoryFilter): ENPlanWorkFuelHistoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFuelHistoryShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWorkFuelHistoryFilter: ENPlanWorkFuelHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFuelHistoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkFuelHistoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWorkFuelHistoryFilter: ENPlanWorkFuelHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWorkFuelHistoryShort; stdcall;
  end;


implementation

  destructor ENPlanWorkFuelHistory.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWorkFuelHistoryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWorkFuelHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWorkFuelHistoryShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    inherited Destroy;
  end;

  destructor ENPlanWorkFuelHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkFuelHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFuelHistory');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFuelHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFuelHistoryRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFuelHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFuelHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFuelHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFuelHistoryShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkFuelHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkFuelHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkFuelHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkFuelHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkFuelHistoryControllerSoapPort), 'http://ksoe.org/ENPlanWorkFuelHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkFuelHistoryControllerSoapPort), 'http://ksoe.org/ENPlanWorkFuelHistoryController/action/ENPlanWorkFuelHistoryController.%operationName%');


end.
