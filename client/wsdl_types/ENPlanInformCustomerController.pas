unit ENPlanInformCustomerController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   ,ENWorkOrderBytController
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

  ENPlanInformCustomer            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanInformCustomerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanInformCustomer = class(TRemotable)
  private
    Fcode : Integer;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FisSent : Integer;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  isSent : Integer read FisSent write FisSent;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;

{
  ENPlanInformCustomerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FtimeStart : DateTime;
    FtimeFinal : DateTime;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    FisSent : Integer;
//???
    FworkOrderBytRef : ENWorkOrderBytRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property timeStart : DateTime;
    property timeFinal : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property  isSent : Integer read FisSent write FisSent;
    property workOrderBytRef : ENWorkOrderBytRef read FworkOrderBytRef write FworkOrderBytRef;
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
  end;
}

  ENPlanInformCustomerFilter = class(ENPlanInformCustomer)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanInformCustomerShort = class(TRemotable)
  private
    Fcode : Integer;
    FtimeStart : TXSDateTime;
    FtimeFinal : TXSDateTime;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FisSent : Integer;
    FworkOrderBytRefCode : Integer;
    FworkOrderBytRefNumberGen : WideString;
    FworkOrderBytRefDateGen : TXSDate;
    FworkOrderBytRefCommentGen : WideString;
    FworkOrderBytRefDateAdd : TXSDateTime;
    FworkOrderBytRefDateEdit : TXSDateTime;
    FworkOrderBytRefUserAdd : WideString;
    FworkOrderBytRefUserEdit : WideString;
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
    property timeStart : TXSDateTime read FtimeStart write FtimeStart;
    property timeFinal : TXSDateTime read FtimeFinal write FtimeFinal;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  isSent : Integer read FisSent write FisSent;

    property workOrderBytRefCode : Integer read FworkOrderBytRefCode write FworkOrderBytRefCode;
    property workOrderBytRefNumberGen : WideString read FworkOrderBytRefNumberGen write FworkOrderBytRefNumberGen;
    property workOrderBytRefDateGen : TXSDate read FworkOrderBytRefDateGen write FworkOrderBytRefDateGen;
    property workOrderBytRefCommentGen : WideString read FworkOrderBytRefCommentGen write FworkOrderBytRefCommentGen;
    property workOrderBytRefDateAdd : TXSDateTime read FworkOrderBytRefDateAdd write FworkOrderBytRefDateAdd;
    property workOrderBytRefDateEdit : TXSDateTime read FworkOrderBytRefDateEdit write FworkOrderBytRefDateEdit;
    property workOrderBytRefUserAdd : WideString read FworkOrderBytRefUserAdd write FworkOrderBytRefUserAdd;
    property workOrderBytRefUserEdit : WideString read FworkOrderBytRefUserEdit write FworkOrderBytRefUserEdit;
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

  ArrayOfENPlanInformCustomerShort = array of ENPlanInformCustomerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanInformCustomerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanInformCustomerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanInformCustomerShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanInformCustomerController/message/
  // soapAction: http://ksoe.org/ENPlanInformCustomerController/action/ENPlanInformCustomerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanInformCustomerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanInformCustomerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanInformCustomerControllerSoapPort = interface(IInvokable)
   ['{56C4FAF3-0821-4695-A23C-3F8921967F94}']
    function add(const aENPlanInformCustomer: ENPlanInformCustomer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanInformCustomer: ENPlanInformCustomer); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanInformCustomer; stdcall;
    function getList: ENPlanInformCustomerShortList; stdcall;
    function getFilteredList(const aENPlanInformCustomerFilter: ENPlanInformCustomerFilter): ENPlanInformCustomerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanInformCustomerShortList; stdcall;
    function getScrollableFilteredList(const aENPlanInformCustomerFilter: ENPlanInformCustomerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanInformCustomerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanInformCustomerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanInformCustomerFilter: ENPlanInformCustomerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanInformCustomerShort; stdcall;
  end;


implementation

  destructor ENPlanInformCustomer.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanInformCustomerFilter.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytRef) then
      workOrderBytRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanInformCustomerFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanInformCustomerShort.Destroy;
  begin
    if Assigned(FtimeStart) then
      timeStart.Free;
    if Assigned(FtimeFinal) then
      timeFinal.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FworkOrderBytRefDateGen) then
      workOrderBytRefDateGen.Free;
    if Assigned(FworkOrderBytRefDateAdd) then
      workOrderBytRefDateAdd.Free;
    if Assigned(FworkOrderBytRefDateEdit) then
      workOrderBytRefDateEdit.Free;
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

  destructor ENPlanInformCustomerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanInformCustomer, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanInformCustomer');
  RemClassRegistry.RegisterXSClass(ENPlanInformCustomerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanInformCustomerRef');
  RemClassRegistry.RegisterXSClass(ENPlanInformCustomerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanInformCustomerFilter');
  RemClassRegistry.RegisterXSClass(ENPlanInformCustomerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanInformCustomerShort');
  RemClassRegistry.RegisterXSClass(ENPlanInformCustomerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanInformCustomerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanInformCustomerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanInformCustomerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanInformCustomerControllerSoapPort), 'http://ksoe.org/ENPlanInformCustomerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanInformCustomerControllerSoapPort), 'http://ksoe.org/ENPlanInformCustomerController/action/ENPlanInformCustomerController.%operationName%');


end.
