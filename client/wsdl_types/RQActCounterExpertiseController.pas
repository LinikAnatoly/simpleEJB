unit RQActCounterExpertiseController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,RQFKOrderController
   ,SCCounterController
   ,RQActCounterExpertisePurposeController
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

  RQActCounterExpertise            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQActCounterExpertiseRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQActCounterExpertise = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FpersonalAccountName : WideString;
    FisByt : TXSBoolean;
//???
    Fdepartment : ENDepartmentRef;
//???
    FfkOrder : RQFKOrderRef;
//???
    Fcounter : SCCounterRef;
//???
    Fpurpose : RQActCounterExpertisePurposeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property personalAccountName : WideString read FpersonalAccountName write FpersonalAccountName;
    property isByt : TXSBoolean read FisByt write FisByt;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property fkOrder : RQFKOrderRef read FfkOrder write FfkOrder;
    property counter : SCCounterRef read Fcounter write Fcounter;
    property purpose : RQActCounterExpertisePurposeRef read Fpurpose write Fpurpose;
  end;

{
  RQActCounterExpertiseFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FpersonalAccountName : WideString;
    FisByt : TXSBoolean;
//???
    Fdepartment : ENDepartmentRef;
//???
    FfkOrder : RQFKOrderRef;
//???
    Fcounter : SCCounterRef;
//???
    Fpurpose : RQActCounterExpertisePurposeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property personalAccountName : WideString read FpersonalAccountName write FpersonalAccountName;
    property isByt : TXSBoolean read FisByt write FisByt;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property fkOrder : RQFKOrderRef read FfkOrder write FfkOrder;
    property counter : SCCounterRef read Fcounter write Fcounter;
    property purpose : RQActCounterExpertisePurposeRef read Fpurpose write Fpurpose;
  end;
}

  RQActCounterExpertiseFilter = class(RQActCounterExpertise)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQActCounterExpertiseShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FpersonalAccountCode : Integer;
    FpersonalAccountNumber : WideString;
    FpersonalAccountName : WideString;
    FisByt : TXSBoolean;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FfkOrderCode : Integer;
    FfkOrderNumberDoc : WideString;
    FfkOrderDateGen : TXSDate;
    FfkOrderDateShipment : TXSDate;
    FfkOrderMolOutCode : WideString;
    FfkOrderMolOutName : WideString;
    FfkOrderMolInCode : WideString;
    FfkOrderMolInName : WideString;
    FfkOrderExpeditorCode : WideString;
    FfkOrderExpeditorName : WideString;
    FfkOrderWarrantNumber : WideString;
    FfkOrderWarrantDate : TXSDate;
    FfkOrderWarrantFIO : WideString;
    FfkOrderSumWithoutNds : TXSDecimal;
    FfkOrderSumNds : TXSDecimal;
    FfkOrderNdsPercent : Integer;
    FfkOrderPercentProfits : TXSDecimal;
    FfkOrderAccount : WideString;
    FfkOrderKod_podr : WideString;
    FfkOrderName_podr : WideString;
    FfkOrderIsMaterialsSent : Integer;
    FfkOrderCheckedByAccountant : TXSBoolean;
    FfkOrderDateAdd : TXSDateTime;
    FfkOrderUserAdd : WideString;
    FfkOrderDateEdit : TXSDateTime;
    FfkOrderDatePosting : TXSDate;
    FfkOrderUserGen : WideString;
    FfkOrderPalletNumber : WideString;
    FfkOrderIsByOrder : Integer;
    FfkOrderOrderInfo : WideString;
    FfkOrderStatusName : WideString;
    FfkOrderDateDelivery : TXSDate;
    FcounterCode : Integer;
    FcounterInvNumber : WideString;
    FcounterName : WideString;
    FcounterBuildNumber : WideString;
    FcounterAccount : WideString;
    FcounterDepartmetFKCode : WideString;
    FcounterMolCode : WideString;
    FcounterDateIn : TXSDate;
    FcounterDateBuild : TXSDate;
    FcounterDateCheck : TXSDate;
    FcounterCost : TXSDecimal;
    FcounterScCode : Integer;
    FcounterCounterType : WideString;
    FcounterInstallOrderNumber : WideString;
    FcounterReading : WideString;
    FcounterDateEdit : TXSDateTime;
    FpurposeCode : Integer;
    FpurposeName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  personalAccountCode : Integer read FpersonalAccountCode write FpersonalAccountCode;
    property personalAccountNumber : WideString read FpersonalAccountNumber write FpersonalAccountNumber;
    property personalAccountName : WideString read FpersonalAccountName write FpersonalAccountName;
    property isByt : TXSBoolean read FisByt write FisByt;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property fkOrderCode : Integer read FfkOrderCode write FfkOrderCode;
    property fkOrderNumberDoc : WideString read FfkOrderNumberDoc write FfkOrderNumberDoc;
    property fkOrderDateGen : TXSDate read FfkOrderDateGen write FfkOrderDateGen;
    property fkOrderDateShipment : TXSDate read FfkOrderDateShipment write FfkOrderDateShipment;
    property fkOrderMolOutCode : WideString read FfkOrderMolOutCode write FfkOrderMolOutCode;
    property fkOrderMolOutName : WideString read FfkOrderMolOutName write FfkOrderMolOutName;
    property fkOrderMolInCode : WideString read FfkOrderMolInCode write FfkOrderMolInCode;
    property fkOrderMolInName : WideString read FfkOrderMolInName write FfkOrderMolInName;
    property fkOrderExpeditorCode : WideString read FfkOrderExpeditorCode write FfkOrderExpeditorCode;
    property fkOrderExpeditorName : WideString read FfkOrderExpeditorName write FfkOrderExpeditorName;
    property fkOrderWarrantNumber : WideString read FfkOrderWarrantNumber write FfkOrderWarrantNumber;
    property fkOrderWarrantDate : TXSDate read FfkOrderWarrantDate write FfkOrderWarrantDate;
    property fkOrderWarrantFIO : WideString read FfkOrderWarrantFIO write FfkOrderWarrantFIO;
    property fkOrderSumWithoutNds : TXSDecimal read FfkOrderSumWithoutNds write FfkOrderSumWithoutNds;
    property fkOrderSumNds : TXSDecimal read FfkOrderSumNds write FfkOrderSumNds;
    property fkOrderNdsPercent : Integer read FfkOrderNdsPercent write FfkOrderNdsPercent;
    property fkOrderPercentProfits : TXSDecimal read FfkOrderPercentProfits write FfkOrderPercentProfits;
    property fkOrderAccount : WideString read FfkOrderAccount write FfkOrderAccount;
    property fkOrderKod_podr : WideString read FfkOrderKod_podr write FfkOrderKod_podr;
    property fkOrderName_podr : WideString read FfkOrderName_podr write FfkOrderName_podr;
    property fkOrderIsMaterialsSent : Integer read FfkOrderIsMaterialsSent write FfkOrderIsMaterialsSent;
    property fkOrderCheckedByAccountant : TXSBoolean read FfkOrderCheckedByAccountant write FfkOrderCheckedByAccountant;
    property fkOrderDateAdd : TXSDateTime read FfkOrderDateAdd write FfkOrderDateAdd;
    property fkOrderUserAdd : WideString read FfkOrderUserAdd write FfkOrderUserAdd;
    property fkOrderDateEdit : TXSDateTime read FfkOrderDateEdit write FfkOrderDateEdit;
    property fkOrderDatePosting : TXSDate read FfkOrderDatePosting write FfkOrderDatePosting;
    property fkOrderUserGen : WideString read FfkOrderUserGen write FfkOrderUserGen;
    property fkOrderPalletNumber : WideString read FfkOrderPalletNumber write FfkOrderPalletNumber;
    property fkOrderIsByOrder : Integer read FfkOrderIsByOrder write FfkOrderIsByOrder;
    property fkOrderOrderInfo : WideString read FfkOrderOrderInfo write FfkOrderOrderInfo;
    property fkOrderStatusName : WideString read FfkOrderStatusName write FfkOrderStatusName;
    property fkOrderDateDelivery : TXSDate read FfkOrderDateDelivery write FfkOrderDateDelivery;
    property counterCode : Integer read FcounterCode write FcounterCode;
    property counterInvNumber : WideString read FcounterInvNumber write FcounterInvNumber;
    property counterName : WideString read FcounterName write FcounterName;
    property counterBuildNumber : WideString read FcounterBuildNumber write FcounterBuildNumber;
    property counterAccount : WideString read FcounterAccount write FcounterAccount;
    property counterDepartmetFKCode : WideString read FcounterDepartmetFKCode write FcounterDepartmetFKCode;
    property counterMolCode : WideString read FcounterMolCode write FcounterMolCode;
    property counterDateIn : TXSDate read FcounterDateIn write FcounterDateIn;
    property counterDateBuild : TXSDate read FcounterDateBuild write FcounterDateBuild;
    property counterDateCheck : TXSDate read FcounterDateCheck write FcounterDateCheck;
    property counterCost : TXSDecimal read FcounterCost write FcounterCost;
    property counterScCode : Integer read FcounterScCode write FcounterScCode;
    property counterCounterType : WideString read FcounterCounterType write FcounterCounterType;
    property counterInstallOrderNumber : WideString read FcounterInstallOrderNumber write FcounterInstallOrderNumber;
    property counterReading : WideString read FcounterReading write FcounterReading;
    property counterDateEdit : TXSDateTime read FcounterDateEdit write FcounterDateEdit;
    property purposeCode : Integer read FpurposeCode write FpurposeCode;
    property purposeName : WideString read FpurposeName write FpurposeName;
  end;

  ArrayOfRQActCounterExpertiseShort = array of RQActCounterExpertiseShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQActCounterExpertiseShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQActCounterExpertiseShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQActCounterExpertiseShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQActCounterExpertiseController/message/
  // soapAction: http://ksoe.org/RQActCounterExpertiseController/action/RQActCounterExpertiseController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQActCounterExpertiseControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQActCounterExpertiseController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQActCounterExpertiseControllerSoapPort = interface(IInvokable)
  ['{FF599482-C0DF-4AFB-B763-414225EEDCE9}']
    function add(const aRQActCounterExpertise: RQActCounterExpertise): Integer; stdcall; overload;
	function add(const aRQActCounterExpertise: RQActCounterExpertise; counter: SCCounter; isIncome: Boolean): Integer; stdcall; overload;
    procedure remove(const anObjectCode: Integer; isIncome: Boolean); stdcall;
    procedure save(const aRQActCounterExpertise: RQActCounterExpertise); stdcall; overload;
	procedure save(const aRQActCounterExpertise: RQActCounterExpertise; counter: SCCounter; isIncome: Boolean); stdcall; overload;
    function getObject(const anObjectCode: Integer): RQActCounterExpertise; stdcall;
    function getList: RQActCounterExpertiseShortList; stdcall;
    function getFilteredList(const aRQActCounterExpertiseFilter: RQActCounterExpertiseFilter): RQActCounterExpertiseShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertiseShortList; stdcall;
    function getScrollableFilteredList(const aRQActCounterExpertiseFilter: RQActCounterExpertiseFilter; const aFromPosition: Integer; const aQuantity: Integer; const isIncome: Boolean): RQActCounterExpertiseShortList; stdcall; overload;
	function getScrollableFilteredList(const aRQActCounterExpertiseFilter: RQActCounterExpertiseFilter; const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertiseShortList; stdcall; overload;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQActCounterExpertiseShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQActCounterExpertiseFilter: RQActCounterExpertiseFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQActCounterExpertiseShort; stdcall;
  end;


implementation

  destructor RQActCounterExpertise.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FisByt) then
      isByt.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FfkOrder) then
      fkOrder.Free;
    if Assigned(Fcounter) then
      counter.Free;
    if Assigned(Fpurpose) then
      purpose.Free;
    inherited Destroy;
  end;

{
  destructor RQActCounterExpertiseFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FisByt) then
      isByt.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FfkOrder) then
      fkOrder.Free;
    if Assigned(Fcounter) then
      counter.Free;
    if Assigned(Fpurpose) then
      purpose.Free;
    inherited Destroy;
  end;
}

  destructor RQActCounterExpertiseFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQActCounterExpertiseShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FisByt) then
      isByt.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FfkOrderDateGen) then
      fkOrderDateGen.Free;
    if Assigned(FfkOrderDateShipment) then
      fkOrderDateShipment.Free;
    if Assigned(FfkOrderWarrantDate) then
      fkOrderWarrantDate.Free;
    if Assigned(FfkOrderSumWithoutNds) then
      fkOrderSumWithoutNds.Free;
    if Assigned(FfkOrderSumNds) then
      fkOrderSumNds.Free;
    if Assigned(FfkOrderPercentProfits) then
      fkOrderPercentProfits.Free;
    if Assigned(FfkOrderDateAdd) then
      fkOrderDateAdd.Free;
    if Assigned(FfkOrderDateEdit) then
      fkOrderDateEdit.Free;
    if Assigned(FfkOrderDatePosting) then
      fkOrderDatePosting.Free;
    if Assigned(FfkOrderDateDelivery) then
      fkOrderDateDelivery.Free;
    if Assigned(FcounterDateIn) then
      counterDateIn.Free;
    if Assigned(FcounterDateBuild) then
      counterDateBuild.Free;
    if Assigned(FcounterDateCheck) then
      counterDateCheck.Free;
    if Assigned(FcounterCost) then
      counterCost.Free;
    if Assigned(FcounterDateEdit) then
      counterDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQActCounterExpertiseShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQActCounterExpertise, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertise');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertiseRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertiseRef');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertiseFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertiseFilter');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertiseShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertiseShort');
  RemClassRegistry.RegisterXSClass(RQActCounterExpertiseShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQActCounterExpertiseShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQActCounterExpertiseShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQActCounterExpertiseShort');

  InvRegistry.RegisterInterface(TypeInfo(RQActCounterExpertiseControllerSoapPort), 'http://ksoe.org/RQActCounterExpertiseController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQActCounterExpertiseControllerSoapPort), 'http://ksoe.org/RQActCounterExpertiseController/action/RQActCounterExpertiseController.%operationName%');


end.
