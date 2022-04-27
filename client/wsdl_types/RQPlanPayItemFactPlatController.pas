unit RQPlanPayItemFactPlatController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPayItemSecondController
   ,RQPlanPayController
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

  RQPlanPayItemFactPlat            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemFactPlatRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemFactPlat = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    FsumInPayment : TXSDecimal;
    FsumGen : TXSDecimal;
//???
    FplanPayItemSecondRef : RQPlanPayItemSecondRef;
//???
    FplanPayRef : RQPlanPayRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property sumInPayment : TXSDecimal read FsumInPayment write FsumInPayment;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property planPayItemSecondRef : RQPlanPayItemSecondRef read FplanPayItemSecondRef write FplanPayItemSecondRef;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
  end;

{
  RQPlanPayItemFactPlatFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fid : Integer;
    FsumInPayment : TXSDecimal;
    FsumGen : TXSDecimal;
//???
    FplanPayItemSecondRef : RQPlanPayItemSecondRef;
//???
    FplanPayRef : RQPlanPayRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property sumInPayment : TXSDecimal read FsumInPayment write FsumInPayment;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property planPayItemSecondRef : RQPlanPayItemSecondRef read FplanPayItemSecondRef write FplanPayItemSecondRef;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
  end;
}

  RQPlanPayItemFactPlatFilter = class(RQPlanPayItemFactPlat)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayItemFactPlatShort = class(TRemotable)
  private
    Fcode : Integer;
    Fid : Integer;
    FsumInPayment : TXSDecimal;
    FsumGen : TXSDecimal;
    FplanPayItemSecondRefCode : Integer;
    FplanPayItemSecondRefPrihod_count : TXSDecimal;
    FplanPayItemSecondRefPrihod_price : TXSDecimal;
    FplanPayItemSecondRefPrihod_summa : TXSDecimal;
    FplanPayItemSecondRefPrihod_date : TXSDate;
    FplanPayItemSecondRefPay_plan_summa : TXSDecimal;
    FplanPayItemSecondRefPay_plan_date : TXSDate;
    FplanPayItemSecondRefPay_fact_date : TXSDate;
    FplanPayItemSecondRefPay_fact_price : TXSDecimal;
    FplanPayItemSecondRefPay_fact_summa : TXSDecimal;
    FplanPayItemSecondRefPay_fact_count : TXSDecimal;
    FplanPayItemSecondRefBill_num : WideString;
    FplanPayItemSecondRefBudget_name : WideString;
    FplanPayItemSecondRefPay_type_name : WideString;
    FplanPayItemSecondRefPay_type_value : Integer;
    FplanPayItemSecondRefPay_date : TXSDate;
    FplanPayItemSecondRefPay_sign : Integer;
    FplanPayItemSecondRefPay_type_name_initial : WideString;
    FplanPayItemSecondRefPay_type_value_initial : Integer;
    FplanPayItemSecondRefBillitemcodes : WideString;
    FplanPayItemSecondRefUserGen : WideString;
    FplanPayItemSecondRefDateEdit : TXSDate;
    FplanPayRefCode : Integer;
    FplanPayRefNumberDoc : WideString;
    FplanPayRefDateGen : TXSDate;
    FplanPayRefUserGen : WideString;
    FplanPayRefDateEdit : TXSDate;
    FrqBillRefDateGen : TXSDate;
    FrqBillRefNumberGen : WideString;
    FrqBillItemRefMaterialNames : WideString;
    FrqBillItemRefStates : WideString;
    FrqBillRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  id : Integer read Fid write Fid;
    property sumInPayment : TXSDecimal read FsumInPayment write FsumInPayment;
    property sumGen : TXSDecimal read FsumGen write FsumGen;

    property planPayItemSecondRefCode : Integer read FplanPayItemSecondRefCode write FplanPayItemSecondRefCode;
    property planPayItemSecondRefPrihod_count : TXSDecimal read FplanPayItemSecondRefPrihod_count write FplanPayItemSecondRefPrihod_count;
    property planPayItemSecondRefPrihod_price : TXSDecimal read FplanPayItemSecondRefPrihod_price write FplanPayItemSecondRefPrihod_price;
    property planPayItemSecondRefPrihod_summa : TXSDecimal read FplanPayItemSecondRefPrihod_summa write FplanPayItemSecondRefPrihod_summa;
    property planPayItemSecondRefPrihod_date : TXSDate read FplanPayItemSecondRefPrihod_date write FplanPayItemSecondRefPrihod_date;
    property planPayItemSecondRefPay_plan_summa : TXSDecimal read FplanPayItemSecondRefPay_plan_summa write FplanPayItemSecondRefPay_plan_summa;
    property planPayItemSecondRefPay_plan_date : TXSDate read FplanPayItemSecondRefPay_plan_date write FplanPayItemSecondRefPay_plan_date;
    property planPayItemSecondRefPay_fact_date : TXSDate read FplanPayItemSecondRefPay_fact_date write FplanPayItemSecondRefPay_fact_date;
    property planPayItemSecondRefPay_fact_price : TXSDecimal read FplanPayItemSecondRefPay_fact_price write FplanPayItemSecondRefPay_fact_price;
    property planPayItemSecondRefPay_fact_summa : TXSDecimal read FplanPayItemSecondRefPay_fact_summa write FplanPayItemSecondRefPay_fact_summa;
    property planPayItemSecondRefPay_fact_count : TXSDecimal read FplanPayItemSecondRefPay_fact_count write FplanPayItemSecondRefPay_fact_count;
    property planPayItemSecondRefBill_num : WideString read FplanPayItemSecondRefBill_num write FplanPayItemSecondRefBill_num;
    property planPayItemSecondRefBudget_name : WideString read FplanPayItemSecondRefBudget_name write FplanPayItemSecondRefBudget_name;
    property planPayItemSecondRefPay_type_name : WideString read FplanPayItemSecondRefPay_type_name write FplanPayItemSecondRefPay_type_name;
    property planPayItemSecondRefPay_type_value : Integer read FplanPayItemSecondRefPay_type_value write FplanPayItemSecondRefPay_type_value;
    property planPayItemSecondRefPay_date : TXSDate read FplanPayItemSecondRefPay_date write FplanPayItemSecondRefPay_date;
    property planPayItemSecondRefPay_sign : Integer read FplanPayItemSecondRefPay_sign write FplanPayItemSecondRefPay_sign;
    property planPayItemSecondRefPay_type_name_initial : WideString read FplanPayItemSecondRefPay_type_name_initial write FplanPayItemSecondRefPay_type_name_initial;
    property planPayItemSecondRefPay_type_value_initial : Integer read FplanPayItemSecondRefPay_type_value_initial write FplanPayItemSecondRefPay_type_value_initial;
    property planPayItemSecondRefBillitemcodes : WideString read FplanPayItemSecondRefBillitemcodes write FplanPayItemSecondRefBillitemcodes;
    property planPayItemSecondRefUserGen : WideString read FplanPayItemSecondRefUserGen write FplanPayItemSecondRefUserGen;
    property planPayItemSecondRefDateEdit : TXSDate read FplanPayItemSecondRefDateEdit write FplanPayItemSecondRefDateEdit;
    property planPayRefCode : Integer read FplanPayRefCode write FplanPayRefCode;
    property planPayRefNumberDoc : WideString read FplanPayRefNumberDoc write FplanPayRefNumberDoc;
    property planPayRefDateGen : TXSDate read FplanPayRefDateGen write FplanPayRefDateGen;
    property planPayRefUserGen : WideString read FplanPayRefUserGen write FplanPayRefUserGen;
    property planPayRefDateEdit : TXSDate read FplanPayRefDateEdit write FplanPayRefDateEdit;

    property rqBillRefDateGen : TXSDate read FrqBillRefDateGen write FrqBillRefDateGen;
    property rqBillRefNumberGen : WideString read FrqBillRefNumberGen write FrqBillRefNumberGen;
    property rqBillItemRefMaterialNames : WideString read FrqBillItemRefMaterialNames write FrqBillItemRefMaterialNames;
    property rqBillItemRefStates : WideString read FrqBillItemRefStates write FrqBillItemRefStates;
    property rqBillRefCode : Integer read FrqBillRefCode write FrqBillRefCode;
  end;

  ArrayOfRQPlanPayItemFactPlatShort = array of RQPlanPayItemFactPlatShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayItemFactPlatShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayItemFactPlatShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayItemFactPlatShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayItemFactPlatController/message/
  // soapAction: http://ksoe.org/RQPlanPayItemFactPlatController/action/RQPlanPayItemFactPlatController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayItemFactPlatControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayItemFactPlatController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayItemFactPlatControllerSoapPort = interface(IInvokable)
  ['{2d1b2d1b-2d1b-2d1b-2d1b-2d1b2d1b2d1b}']
    function add(const aRQPlanPayItemFactPlat: RQPlanPayItemFactPlat): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayItemFactPlat: RQPlanPayItemFactPlat); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayItemFactPlat; stdcall;
    function getList: RQPlanPayItemFactPlatShortList; stdcall;
    function getFilteredList(const aRQPlanPayItemFactPlatFilter: RQPlanPayItemFactPlatFilter): RQPlanPayItemFactPlatShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFactPlatShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayItemFactPlatFilter: RQPlanPayItemFactPlatFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFactPlatShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFactPlatShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayItemFactPlatFilter: RQPlanPayItemFactPlatFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayItemFactPlatShort; stdcall;
  end;


implementation

  destructor RQPlanPayItemFactPlat.Destroy;
  begin
    if Assigned(FsumInPayment) then
      sumInPayment.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplanPayItemSecondRef) then
      planPayItemSecondRef.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPayItemFactPlatFilter.Destroy;
  begin
    if Assigned(FsumInPayment) then
      sumInPayment.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplanPayItemSecondRef) then
      planPayItemSecondRef.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPayItemFactPlatFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPayItemFactPlatShort.Destroy;
  begin
    if Assigned(FsumInPayment) then
      sumInPayment.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FplanPayItemSecondRefPrihod_count) then
      planPayItemSecondRefPrihod_count.Free;
    if Assigned(FplanPayItemSecondRefPrihod_price) then
      planPayItemSecondRefPrihod_price.Free;
    if Assigned(FplanPayItemSecondRefPrihod_summa) then
      planPayItemSecondRefPrihod_summa.Free;
    if Assigned(FplanPayItemSecondRefPrihod_date) then
      planPayItemSecondRefPrihod_date.Free;
    if Assigned(FplanPayItemSecondRefPay_plan_summa) then
      planPayItemSecondRefPay_plan_summa.Free;
    if Assigned(FplanPayItemSecondRefPay_plan_date) then
      planPayItemSecondRefPay_plan_date.Free;
    if Assigned(FplanPayItemSecondRefPay_fact_date) then
      planPayItemSecondRefPay_fact_date.Free;
    if Assigned(FplanPayItemSecondRefPay_fact_price) then
      planPayItemSecondRefPay_fact_price.Free;
    if Assigned(FplanPayItemSecondRefPay_fact_summa) then
      planPayItemSecondRefPay_fact_summa.Free;
    if Assigned(FplanPayItemSecondRefPay_fact_count) then
      planPayItemSecondRefPay_fact_count.Free;
    if Assigned(FplanPayItemSecondRefPay_date) then
      planPayItemSecondRefPay_date.Free;
    if Assigned(FplanPayItemSecondRefDateEdit) then
      planPayItemSecondRefDateEdit.Free;
    if Assigned(FplanPayRefDateGen) then
      planPayRefDateGen.Free;
    if Assigned(FplanPayRefDateEdit) then
      planPayRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPlanPayItemFactPlatShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayItemFactPlat, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFactPlat');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFactPlatRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFactPlatRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFactPlatFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFactPlatFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFactPlatShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFactPlatShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFactPlatShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFactPlatShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayItemFactPlatShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayItemFactPlatShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayItemFactPlatControllerSoapPort), 'http://ksoe.org/RQPlanPayItemFactPlatController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayItemFactPlatControllerSoapPort), 'http://ksoe.org/RQPlanPayItemFactPlatController/action/RQPlanPayItemFactPlatController.%operationName%');


end.
