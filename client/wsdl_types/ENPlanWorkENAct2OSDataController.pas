unit ENPlanWorkENAct2OSDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPlanWorkController
   ,ENActController
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

  ENPlanWorkENAct2OSData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkENAct2OSDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkENAct2OSData = class(TRemotable)
  private
    Fcode : Integer;
    Fnum_un : Integer;
    Fnum_unWriteOff : Integer;
    Fkod_inv : WideString;
    Fkod_vid : WideString;
    Fkod_subsch_b : WideString;
    Fname_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    FsumBuhWriteOZ : TXSDecimal;
    FsumStCurrentN : TXSDecimal;
    FsumIznCurrentB : TXSDecimal;
    FsumIznCurrentN : TXSDecimal;
    FtypeWriteOff : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FplanWorkRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  num_un : Integer read Fnum_un write Fnum_un;
    property  num_unWriteOff : Integer read Fnum_unWriteOff write Fnum_unWriteOff;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property kod_subsch_b : WideString read Fkod_subsch_b write Fkod_subsch_b;
    property name_inv : WideString read Fname_inv write Fname_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sumBuhWriteOZ : TXSDecimal read FsumBuhWriteOZ write FsumBuhWriteOZ;
    property sumStCurrentN : TXSDecimal read FsumStCurrentN write FsumStCurrentN;
    property sumIznCurrentB : TXSDecimal read FsumIznCurrentB write FsumIznCurrentB;
    property sumIznCurrentN : TXSDecimal read FsumIznCurrentN write FsumIznCurrentN;
    property  typeWriteOff : Integer read FtypeWriteOff write FtypeWriteOff;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;

{
  ENPlanWorkENAct2OSDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fnum_un : Integer;
    Fnum_unWriteOff : Integer;
    Fkod_inv : WideString;
    Fkod_vid : WideString;
    Fkod_subsch_b : WideString;
    Fname_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    FsumBuhWriteOZ : TXSDecimal;
    FsumStCurrentN : TXSDecimal;
    FsumIznCurrentB : TXSDecimal;
    FsumIznCurrentN : TXSDecimal;
    FtypeWriteOff : Integer;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FplanWorkRef : ENPlanWorkRef;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  num_un : Integer read Fnum_un write Fnum_un;
    property  num_unWriteOff : Integer read Fnum_unWriteOff write Fnum_unWriteOff;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property kod_subsch_b : WideString read Fkod_subsch_b write Fkod_subsch_b;
    property name_inv : WideString read Fname_inv write Fname_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sumBuhWriteOZ : TXSDecimal read FsumBuhWriteOZ write FsumBuhWriteOZ;
    property sumStCurrentN : TXSDecimal read FsumStCurrentN write FsumStCurrentN;
    property sumIznCurrentB : TXSDecimal read FsumIznCurrentB write FsumIznCurrentB;
    property sumIznCurrentN : TXSDecimal read FsumIznCurrentN write FsumIznCurrentN;
    property  typeWriteOff : Integer read FtypeWriteOff write FtypeWriteOff;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planWorkRef : ENPlanWorkRef read FplanWorkRef write FplanWorkRef;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENPlanWorkENAct2OSDataFilter = class(ENPlanWorkENAct2OSData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanWorkENAct2OSDataShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnum_un : Integer;
    Fnum_unWriteOff : Integer;
    Fkod_inv : WideString;
    Fkod_vid : WideString;
    Fkod_subsch_b : WideString;
    Fname_inv : WideString;
    Fkod_ist : WideString;
    Fname_ist : WideString;
    FsumBuhWriteOZ : TXSDecimal;
    FsumStCurrentN : TXSDecimal;
    FsumIznCurrentB : TXSDecimal;
    FsumIznCurrentN : TXSDecimal;
    FtypeWriteOff : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FplanWorkRefCode : Integer;
    FplanWorkRefDateGen : TXSDateTime;
    FplanWorkRefDateStart : TXSDate;
    FplanWorkRefDateFinal : TXSDate;
    FplanWorkRefYearGen : Integer;
    FplanWorkRefMonthGen : Integer;
    FplanWorkRefYearOriginal : Integer;
    FplanWorkRefMonthOriginal : Integer;
    FplanWorkRefUserGen : WideString;
    FplanWorkRefDateEdit : TXSDate;
    FplanWorkRefWorkOrderNumber : WideString;
    FplanWorkRefDateWorkOrder : TXSDate;
    FplanWorkRefPriConnectionNumber : WideString;
    FplanWorkRefDateEndPriConnection : TXSDate;
    FplanWorkRefInvestWorksDescription : WideString;
    FplanWorkRefServicesFSideFinId : Integer;
    FplanWorkRefServicesFSideCnNum : WideString;
    FplanWorkRefTotalTimeHours : TXSDecimal;
    FplanWorkRefTotalTimeDays : TXSDecimal;
    FplanWorkRefInvestItemNumber : WideString;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer;
    FactRefFinDocMechanicCode : Integer;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  num_un : Integer read Fnum_un write Fnum_un;
    property  num_unWriteOff : Integer read Fnum_unWriteOff write Fnum_unWriteOff;
    property kod_inv : WideString read Fkod_inv write Fkod_inv;
    property kod_vid : WideString read Fkod_vid write Fkod_vid;
    property kod_subsch_b : WideString read Fkod_subsch_b write Fkod_subsch_b;
    property name_inv : WideString read Fname_inv write Fname_inv;
    property kod_ist : WideString read Fkod_ist write Fkod_ist;
    property name_ist : WideString read Fname_ist write Fname_ist;
    property sumBuhWriteOZ : TXSDecimal read FsumBuhWriteOZ write FsumBuhWriteOZ;
    property sumStCurrentN : TXSDecimal read FsumStCurrentN write FsumStCurrentN;
    property sumIznCurrentB : TXSDecimal read FsumIznCurrentB write FsumIznCurrentB;
    property sumIznCurrentN : TXSDecimal read FsumIznCurrentN write FsumIznCurrentN;
    property  typeWriteOff : Integer read FtypeWriteOff write FtypeWriteOff;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property planWorkRefCode : Integer read FplanWorkRefCode write FplanWorkRefCode;
    property planWorkRefDateGen : TXSDateTime read FplanWorkRefDateGen write FplanWorkRefDateGen;
    property planWorkRefDateStart : TXSDate read FplanWorkRefDateStart write FplanWorkRefDateStart;
    property planWorkRefDateFinal : TXSDate read FplanWorkRefDateFinal write FplanWorkRefDateFinal;
    property planWorkRefYearGen : Integer read FplanWorkRefYearGen write FplanWorkRefYearGen;
    property planWorkRefMonthGen : Integer read FplanWorkRefMonthGen write FplanWorkRefMonthGen;
    property planWorkRefYearOriginal : Integer read FplanWorkRefYearOriginal write FplanWorkRefYearOriginal;
    property planWorkRefMonthOriginal : Integer read FplanWorkRefMonthOriginal write FplanWorkRefMonthOriginal;
    property planWorkRefUserGen : WideString read FplanWorkRefUserGen write FplanWorkRefUserGen;
    property planWorkRefDateEdit : TXSDate read FplanWorkRefDateEdit write FplanWorkRefDateEdit;
    property planWorkRefWorkOrderNumber : WideString read FplanWorkRefWorkOrderNumber write FplanWorkRefWorkOrderNumber;
    property planWorkRefDateWorkOrder : TXSDate read FplanWorkRefDateWorkOrder write FplanWorkRefDateWorkOrder;
    property planWorkRefPriConnectionNumber : WideString read FplanWorkRefPriConnectionNumber write FplanWorkRefPriConnectionNumber;
    property planWorkRefDateEndPriConnection : TXSDate read FplanWorkRefDateEndPriConnection write FplanWorkRefDateEndPriConnection;
    property planWorkRefInvestWorksDescription : WideString read FplanWorkRefInvestWorksDescription write FplanWorkRefInvestWorksDescription;
    property planWorkRefServicesFSideFinId : Integer read FplanWorkRefServicesFSideFinId write FplanWorkRefServicesFSideFinId;
    property planWorkRefServicesFSideCnNum : WideString read FplanWorkRefServicesFSideCnNum write FplanWorkRefServicesFSideCnNum;
    property planWorkRefTotalTimeHours : TXSDecimal read FplanWorkRefTotalTimeHours write FplanWorkRefTotalTimeHours;
    property planWorkRefTotalTimeDays : TXSDecimal read FplanWorkRefTotalTimeDays write FplanWorkRefTotalTimeDays;
    property planWorkRefInvestItemNumber : WideString read FplanWorkRefInvestItemNumber write FplanWorkRefInvestItemNumber;
    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode;
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
  end;

  ArrayOfENPlanWorkENAct2OSDataShort = array of ENPlanWorkENAct2OSDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkENAct2OSDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkENAct2OSDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkENAct2OSDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkENAct2OSDataController/message/
  // soapAction: http://ksoe.org/ENPlanWorkENAct2OSDataController/action/ENPlanWorkENAct2OSDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkENAct2OSDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkENAct2OSDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkENAct2OSDataControllerSoapPort = interface(IInvokable)
  ['{63ce63ce-63ce-63ce-63ce-63ce63ce63ce}']
    function add(const aENPlanWorkENAct2OSData: ENPlanWorkENAct2OSData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkENAct2OSData: ENPlanWorkENAct2OSData); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanWorkENAct2OSData; stdcall;
    function getList: ENPlanWorkENAct2OSDataShortList; stdcall;
    function getFilteredList(const aENPlanWorkENAct2OSDataFilter: ENPlanWorkENAct2OSDataFilter): ENPlanWorkENAct2OSDataShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkENAct2OSDataShortList; stdcall;
    function getScrollableFilteredList(const aENPlanWorkENAct2OSDataFilter: ENPlanWorkENAct2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkENAct2OSDataShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkENAct2OSDataShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanWorkENAct2OSDataFilter: ENPlanWorkENAct2OSDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanWorkENAct2OSDataShort; stdcall;

        // апдейт источника для списания ОС
    procedure saveIstOS(const aENPlanWorkENAct2OSData: ENPlanWorkENAct2OSData); stdcall;

  end;


implementation

  destructor ENPlanWorkENAct2OSData.Destroy;
  begin
    if Assigned(FsumBuhWriteOZ) then
      sumBuhWriteOZ.Free;
    if Assigned(FsumStCurrentN) then
      sumStCurrentN.Free;
    if Assigned(FsumIznCurrentB) then
      sumIznCurrentB.Free;
    if Assigned(FsumIznCurrentN) then
      sumIznCurrentN.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanWorkENAct2OSDataFilter.Destroy;
  begin
    if Assigned(FsumBuhWriteOZ) then
      sumBuhWriteOZ.Free;
    if Assigned(FsumStCurrentN) then
      sumStCurrentN.Free;
    if Assigned(FsumIznCurrentB) then
      sumIznCurrentB.Free;
    if Assigned(FsumIznCurrentN) then
      sumIznCurrentN.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanWorkRef) then
      planWorkRef.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanWorkENAct2OSDataFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanWorkENAct2OSDataShort.Destroy;
  begin
    if Assigned(FsumBuhWriteOZ) then
      sumBuhWriteOZ.Free;
    if Assigned(FsumStCurrentN) then
      sumStCurrentN.Free;
    if Assigned(FsumIznCurrentB) then
      sumIznCurrentB.Free;
    if Assigned(FsumIznCurrentN) then
      sumIznCurrentN.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanWorkRefDateGen) then
      planWorkRefDateGen.Free;
    if Assigned(FplanWorkRefDateStart) then
      planWorkRefDateStart.Free;
    if Assigned(FplanWorkRefDateFinal) then
      planWorkRefDateFinal.Free;
    if Assigned(FplanWorkRefDateEdit) then
      planWorkRefDateEdit.Free;
    if Assigned(FplanWorkRefDateWorkOrder) then
      planWorkRefDateWorkOrder.Free;
    if Assigned(FplanWorkRefDateEndPriConnection) then
      planWorkRefDateEndPriConnection.Free;
    if Assigned(FplanWorkRefTotalTimeHours) then
      planWorkRefTotalTimeHours.Free;
    if Assigned(FplanWorkRefTotalTimeDays) then
      planWorkRefTotalTimeDays.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENPlanWorkENAct2OSDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkENAct2OSData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkENAct2OSData');
  RemClassRegistry.RegisterXSClass(ENPlanWorkENAct2OSDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkENAct2OSDataRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkENAct2OSDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkENAct2OSDataFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkENAct2OSDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkENAct2OSDataShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkENAct2OSDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkENAct2OSDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkENAct2OSDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkENAct2OSDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkENAct2OSDataControllerSoapPort), 'http://ksoe.org/ENPlanWorkENAct2OSDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkENAct2OSDataControllerSoapPort), 'http://ksoe.org/ENPlanWorkENAct2OSDataController/action/ENPlanWorkENAct2OSDataController.%operationName%');


end.
