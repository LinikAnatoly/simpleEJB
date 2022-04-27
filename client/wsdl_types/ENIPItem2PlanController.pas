unit ENIPItem2PlanController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENIPItemController
   ,ENPlanWorkController
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

  ENIPItem2Plan            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItem2PlanRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENIPItem2Plan = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FipItemRef : ENIPItemRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ipItemRef : ENIPItemRef read FipItemRef write FipItemRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENIPItem2PlanFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FipItemRef : ENIPItemRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property ipItemRef : ENIPItemRef read FipItemRef write FipItemRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENIPItem2PlanFilter = class(ENIPItem2Plan)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENIPItem2PlanShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FipItemRefCode : Integer;
    FipItemRefName : WideString;
    FipItemRefBuhName : WideString;
    FipItemRefItemNumber : WideString;
    FipItemRefInvNumber : WideString;
    FipItemRefIsProjectDocument : Integer;
    FipItemRefFinancing : WideString;
    FipItemRefCommentGen : WideString;
    FipItemRefCountGen : TXSDecimal;
    FipItemRefPrice : TXSDecimal;
    FipItemRefSumGen : TXSDecimal;
    FipItemRefQuarter1count : TXSDecimal;
    FipItemRefQuarter1sum : TXSDecimal;
    FipItemRefQuarter2count : TXSDecimal;
    FipItemRefQuarter2sum : TXSDecimal;
    FipItemRefQuarter3count : TXSDecimal;
    FipItemRefQuarter3sum : TXSDecimal;
    FipItemRefQuarter4count : TXSDecimal;
    FipItemRefQuarter4sum : TXSDecimal;
    FipItemRefCountGenInside : TXSDecimal;
    FipItemRefPriceInside : TXSDecimal;
    FipItemRefSumGenInside : TXSDecimal;
    FipItemRefMm1countInside : TXSDecimal;
    FipItemRefMm1sumInside : TXSDecimal;
    FipItemRefMm2countInside : TXSDecimal;
    FipItemRefMm2sumInside : TXSDecimal;
    FipItemRefMm3countInside : TXSDecimal;
    FipItemRefMm3sumInside : TXSDecimal;
    FipItemRefMm4countInside : TXSDecimal;
    FipItemRefMm4sumInside : TXSDecimal;
    FipItemRefMm5countInside : TXSDecimal;
    FipItemRefMm5sumInside : TXSDecimal;
    FipItemRefMm6countInside : TXSDecimal;
    FipItemRefMm6sumInside : TXSDecimal;
    FipItemRefMm7countInside : TXSDecimal;
    FipItemRefMm7sumInside : TXSDecimal;
    FipItemRefMm8countInside : TXSDecimal;
    FipItemRefMm8sumInside : TXSDecimal;
    FipItemRefMm9countInside : TXSDecimal;
    FipItemRefMm9sumInside : TXSDecimal;
    FipItemRefMm10countInside : TXSDecimal;
    FipItemRefMm10sumInside : TXSDecimal;
    FipItemRefMm11countInside : TXSDecimal;
    FipItemRefMm11sumInside : TXSDecimal;
    FipItemRefMm12countInside : TXSDecimal;
    FipItemRefMm12sumInside : TXSDecimal;
    FipItemRefInfoTenders : WideString;
    FipItemRefUserAdd : WideString;
    FipItemRefDateAdd : TXSDateTime;
    FipItemRefUserGen : WideString;
    FipItemRefDateEdit : TXSDateTime;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property ipItemRefCode : Integer read FipItemRefCode write FipItemRefCode;
    property ipItemRefName : WideString read FipItemRefName write FipItemRefName;
    property ipItemRefBuhName : WideString read FipItemRefBuhName write FipItemRefBuhName;
    property ipItemRefItemNumber : WideString read FipItemRefItemNumber write FipItemRefItemNumber;
    property ipItemRefInvNumber : WideString read FipItemRefInvNumber write FipItemRefInvNumber;
    property ipItemRefIsProjectDocument : Integer read FipItemRefIsProjectDocument write FipItemRefIsProjectDocument;
    property ipItemRefFinancing : WideString read FipItemRefFinancing write FipItemRefFinancing;
    property ipItemRefCommentGen : WideString read FipItemRefCommentGen write FipItemRefCommentGen;
    property ipItemRefCountGen : TXSDecimal read FipItemRefCountGen write FipItemRefCountGen;
    property ipItemRefPrice : TXSDecimal read FipItemRefPrice write FipItemRefPrice;
    property ipItemRefSumGen : TXSDecimal read FipItemRefSumGen write FipItemRefSumGen;
    property ipItemRefQuarter1count : TXSDecimal read FipItemRefQuarter1count write FipItemRefQuarter1count;
    property ipItemRefQuarter1sum : TXSDecimal read FipItemRefQuarter1sum write FipItemRefQuarter1sum;
    property ipItemRefQuarter2count : TXSDecimal read FipItemRefQuarter2count write FipItemRefQuarter2count;
    property ipItemRefQuarter2sum : TXSDecimal read FipItemRefQuarter2sum write FipItemRefQuarter2sum;
    property ipItemRefQuarter3count : TXSDecimal read FipItemRefQuarter3count write FipItemRefQuarter3count;
    property ipItemRefQuarter3sum : TXSDecimal read FipItemRefQuarter3sum write FipItemRefQuarter3sum;
    property ipItemRefQuarter4count : TXSDecimal read FipItemRefQuarter4count write FipItemRefQuarter4count;
    property ipItemRefQuarter4sum : TXSDecimal read FipItemRefQuarter4sum write FipItemRefQuarter4sum;
    property ipItemRefCountGenInside : TXSDecimal read FipItemRefCountGenInside write FipItemRefCountGenInside;
    property ipItemRefPriceInside : TXSDecimal read FipItemRefPriceInside write FipItemRefPriceInside;
    property ipItemRefSumGenInside : TXSDecimal read FipItemRefSumGenInside write FipItemRefSumGenInside;
    property ipItemRefMm1countInside : TXSDecimal read FipItemRefMm1countInside write FipItemRefMm1countInside;
    property ipItemRefMm1sumInside : TXSDecimal read FipItemRefMm1sumInside write FipItemRefMm1sumInside;
    property ipItemRefMm2countInside : TXSDecimal read FipItemRefMm2countInside write FipItemRefMm2countInside;
    property ipItemRefMm2sumInside : TXSDecimal read FipItemRefMm2sumInside write FipItemRefMm2sumInside;
    property ipItemRefMm3countInside : TXSDecimal read FipItemRefMm3countInside write FipItemRefMm3countInside;
    property ipItemRefMm3sumInside : TXSDecimal read FipItemRefMm3sumInside write FipItemRefMm3sumInside;
    property ipItemRefMm4countInside : TXSDecimal read FipItemRefMm4countInside write FipItemRefMm4countInside;
    property ipItemRefMm4sumInside : TXSDecimal read FipItemRefMm4sumInside write FipItemRefMm4sumInside;
    property ipItemRefMm5countInside : TXSDecimal read FipItemRefMm5countInside write FipItemRefMm5countInside;
    property ipItemRefMm5sumInside : TXSDecimal read FipItemRefMm5sumInside write FipItemRefMm5sumInside;
    property ipItemRefMm6countInside : TXSDecimal read FipItemRefMm6countInside write FipItemRefMm6countInside;
    property ipItemRefMm6sumInside : TXSDecimal read FipItemRefMm6sumInside write FipItemRefMm6sumInside;
    property ipItemRefMm7countInside : TXSDecimal read FipItemRefMm7countInside write FipItemRefMm7countInside;
    property ipItemRefMm7sumInside : TXSDecimal read FipItemRefMm7sumInside write FipItemRefMm7sumInside;
    property ipItemRefMm8countInside : TXSDecimal read FipItemRefMm8countInside write FipItemRefMm8countInside;
    property ipItemRefMm8sumInside : TXSDecimal read FipItemRefMm8sumInside write FipItemRefMm8sumInside;
    property ipItemRefMm9countInside : TXSDecimal read FipItemRefMm9countInside write FipItemRefMm9countInside;
    property ipItemRefMm9sumInside : TXSDecimal read FipItemRefMm9sumInside write FipItemRefMm9sumInside;
    property ipItemRefMm10countInside : TXSDecimal read FipItemRefMm10countInside write FipItemRefMm10countInside;
    property ipItemRefMm10sumInside : TXSDecimal read FipItemRefMm10sumInside write FipItemRefMm10sumInside;
    property ipItemRefMm11countInside : TXSDecimal read FipItemRefMm11countInside write FipItemRefMm11countInside;
    property ipItemRefMm11sumInside : TXSDecimal read FipItemRefMm11sumInside write FipItemRefMm11sumInside;
    property ipItemRefMm12countInside : TXSDecimal read FipItemRefMm12countInside write FipItemRefMm12countInside;
    property ipItemRefMm12sumInside : TXSDecimal read FipItemRefMm12sumInside write FipItemRefMm12sumInside;
    property ipItemRefInfoTenders : WideString read FipItemRefInfoTenders write FipItemRefInfoTenders;
    property ipItemRefUserAdd : WideString read FipItemRefUserAdd write FipItemRefUserAdd;
    property ipItemRefDateAdd : TXSDateTime read FipItemRefDateAdd write FipItemRefDateAdd;
    property ipItemRefUserGen : WideString read FipItemRefUserGen write FipItemRefUserGen;
    property ipItemRefDateEdit : TXSDateTime read FipItemRefDateEdit write FipItemRefDateEdit;
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
  end;

  ArrayOfENIPItem2PlanShort = array of ENIPItem2PlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENIPItem2PlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENIPItem2PlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENIPItem2PlanShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENIPItem2PlanController/message/
  // soapAction: http://ksoe.org/ENIPItem2PlanController/action/ENIPItem2PlanController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENIPItem2PlanControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENIPItem2PlanController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENIPItem2PlanControllerSoapPort = interface(IInvokable)
  ['{F2E71AE3-C58D-48D2-9D5C-5840E9396A4D}']
    function add(const aENIPItem2Plan: ENIPItem2Plan): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENIPItem2Plan: ENIPItem2Plan); stdcall;
    function getObject(const anObjectCode: Integer): ENIPItem2Plan; stdcall;
    function getList: ENIPItem2PlanShortList; stdcall;
    function getFilteredList(const aENIPItem2PlanFilter: ENIPItem2PlanFilter): ENIPItem2PlanShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2PlanShortList; stdcall;
    function getScrollableFilteredList(const aENIPItem2PlanFilter: ENIPItem2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2PlanShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENIPItem2PlanShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENIPItem2PlanFilter: ENIPItem2PlanFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENIPItem2PlanShort; stdcall;
    function addWithNewPlan(const aENIPItem2Plan: ENIPItem2Plan): Integer; stdcall;
  end;


implementation

  destructor ENIPItem2Plan.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemRef) then
      ipItemRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENIPItem2PlanFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemRef) then
      ipItemRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENIPItem2PlanFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENIPItem2PlanShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FipItemRefCountGen) then
      ipItemRefCountGen.Free;
    if Assigned(FipItemRefPrice) then
      ipItemRefPrice.Free;
    if Assigned(FipItemRefSumGen) then
      ipItemRefSumGen.Free;
    if Assigned(FipItemRefQuarter1count) then
      ipItemRefQuarter1count.Free;
    if Assigned(FipItemRefQuarter1sum) then
      ipItemRefQuarter1sum.Free;
    if Assigned(FipItemRefQuarter2count) then
      ipItemRefQuarter2count.Free;
    if Assigned(FipItemRefQuarter2sum) then
      ipItemRefQuarter2sum.Free;
    if Assigned(FipItemRefQuarter3count) then
      ipItemRefQuarter3count.Free;
    if Assigned(FipItemRefQuarter3sum) then
      ipItemRefQuarter3sum.Free;
    if Assigned(FipItemRefQuarter4count) then
      ipItemRefQuarter4count.Free;
    if Assigned(FipItemRefQuarter4sum) then
      ipItemRefQuarter4sum.Free;
    if Assigned(FipItemRefCountGenInside) then
      ipItemRefCountGenInside.Free;
    if Assigned(FipItemRefPriceInside) then
      ipItemRefPriceInside.Free;
    if Assigned(FipItemRefSumGenInside) then
      ipItemRefSumGenInside.Free;
    if Assigned(FipItemRefMm1countInside) then
      ipItemRefMm1countInside.Free;
    if Assigned(FipItemRefMm1sumInside) then
      ipItemRefMm1sumInside.Free;
    if Assigned(FipItemRefMm2countInside) then
      ipItemRefMm2countInside.Free;
    if Assigned(FipItemRefMm2sumInside) then
      ipItemRefMm2sumInside.Free;
    if Assigned(FipItemRefMm3countInside) then
      ipItemRefMm3countInside.Free;
    if Assigned(FipItemRefMm3sumInside) then
      ipItemRefMm3sumInside.Free;
    if Assigned(FipItemRefMm4countInside) then
      ipItemRefMm4countInside.Free;
    if Assigned(FipItemRefMm4sumInside) then
      ipItemRefMm4sumInside.Free;
    if Assigned(FipItemRefMm5countInside) then
      ipItemRefMm5countInside.Free;
    if Assigned(FipItemRefMm5sumInside) then
      ipItemRefMm5sumInside.Free;
    if Assigned(FipItemRefMm6countInside) then
      ipItemRefMm6countInside.Free;
    if Assigned(FipItemRefMm6sumInside) then
      ipItemRefMm6sumInside.Free;
    if Assigned(FipItemRefMm7countInside) then
      ipItemRefMm7countInside.Free;
    if Assigned(FipItemRefMm7sumInside) then
      ipItemRefMm7sumInside.Free;
    if Assigned(FipItemRefMm8countInside) then
      ipItemRefMm8countInside.Free;
    if Assigned(FipItemRefMm8sumInside) then
      ipItemRefMm8sumInside.Free;
    if Assigned(FipItemRefMm9countInside) then
      ipItemRefMm9countInside.Free;
    if Assigned(FipItemRefMm9sumInside) then
      ipItemRefMm9sumInside.Free;
    if Assigned(FipItemRefMm10countInside) then
      ipItemRefMm10countInside.Free;
    if Assigned(FipItemRefMm10sumInside) then
      ipItemRefMm10sumInside.Free;
    if Assigned(FipItemRefMm11countInside) then
      ipItemRefMm11countInside.Free;
    if Assigned(FipItemRefMm11sumInside) then
      ipItemRefMm11sumInside.Free;
    if Assigned(FipItemRefMm12countInside) then
      ipItemRefMm12countInside.Free;
    if Assigned(FipItemRefMm12sumInside) then
      ipItemRefMm12sumInside.Free;
    if Assigned(FipItemRefDateAdd) then
      ipItemRefDateAdd.Free;
    if Assigned(FipItemRefDateEdit) then
      ipItemRefDateEdit.Free;
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

  destructor ENIPItem2PlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENIPItem2Plan, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2Plan');
  RemClassRegistry.RegisterXSClass(ENIPItem2PlanRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2PlanRef');
  RemClassRegistry.RegisterXSClass(ENIPItem2PlanFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2PlanFilter');
  RemClassRegistry.RegisterXSClass(ENIPItem2PlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2PlanShort');
  RemClassRegistry.RegisterXSClass(ENIPItem2PlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENIPItem2PlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENIPItem2PlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENIPItem2PlanShort');

  InvRegistry.RegisterInterface(TypeInfo(ENIPItem2PlanControllerSoapPort), 'http://ksoe.org/ENIPItem2PlanController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENIPItem2PlanControllerSoapPort), 'http://ksoe.org/ENIPItem2PlanController/action/ENIPItem2PlanController.%operationName%');


end.
