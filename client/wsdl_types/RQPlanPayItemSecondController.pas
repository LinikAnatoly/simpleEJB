unit RQPlanPayItemSecondController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPayController
   ,RQPlanPayItemFirstController
   ,RQPlanPayItemStatusController
   ,RQBillController
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

  RQPlanPayItemSecond            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemSecondRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemSecond = class(TRemotable)
  private
    Fcode : Integer;
    Fprihod_count : TXSDecimal;
    Fprihod_price : TXSDecimal;
    Fprihod_summa : TXSDecimal;
    Fprihod_date : TXSDate;
    Fpay_plan_summa : TXSDecimal;
    Fpay_plan_date : TXSDate;
    Fpay_fact_date : TXSDate;
    Fpay_fact_price : TXSDecimal;
    Fpay_fact_summa : TXSDecimal;
    Fpay_fact_count : TXSDecimal;
    Fbill_num : WideString;
    Fbudget_name : WideString;
    Fpay_type_name : WideString;
    Fpay_type_value : Integer;
    Fpay_date : TXSDate;
    Fpay_sign : Integer;
    Fpay_type_name_initial : WideString;
    Fpay_type_value_initial : Integer;
    Fbillitemcodes : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FplanPayRef : RQPlanPayRef;
//???
    FplanPayItemFirstRef : RQPlanPayItemFirstRef;
//???
    FplanPayItemStatusRef : RQPlanPayItemStatusRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property prihod_count : TXSDecimal read Fprihod_count write Fprihod_count;
    property prihod_price : TXSDecimal read Fprihod_price write Fprihod_price;
    property prihod_summa : TXSDecimal read Fprihod_summa write Fprihod_summa;
    property prihod_date : TXSDate read Fprihod_date write Fprihod_date;
    property pay_plan_summa : TXSDecimal read Fpay_plan_summa write Fpay_plan_summa;
    property pay_plan_date : TXSDate read Fpay_plan_date write Fpay_plan_date;
    property pay_fact_date : TXSDate read Fpay_fact_date write Fpay_fact_date;
    property pay_fact_price : TXSDecimal read Fpay_fact_price write Fpay_fact_price;
    property pay_fact_summa : TXSDecimal read Fpay_fact_summa write Fpay_fact_summa;
    property pay_fact_count : TXSDecimal read Fpay_fact_count write Fpay_fact_count;
    property bill_num : WideString read Fbill_num write Fbill_num;
    property budget_name : WideString read Fbudget_name write Fbudget_name;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property  pay_type_value : Integer read Fpay_type_value write Fpay_type_value;
    property pay_date : TXSDate read Fpay_date write Fpay_date;
    property  pay_sign : Integer read Fpay_sign write Fpay_sign;
    property pay_type_name_initial : WideString read Fpay_type_name_initial write Fpay_type_name_initial;
    property  pay_type_value_initial : Integer read Fpay_type_value_initial write Fpay_type_value_initial;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property planPayItemFirstRef : RQPlanPayItemFirstRef read FplanPayItemFirstRef write FplanPayItemFirstRef;
    property planPayItemStatusRef : RQPlanPayItemStatusRef read FplanPayItemStatusRef write FplanPayItemStatusRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;

{
  RQPlanPayItemSecondFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fprihod_count : TXSDecimal;
    Fprihod_price : TXSDecimal;
    Fprihod_summa : TXSDecimal;
    Fprihod_date : TXSDate;
    Fpay_plan_summa : TXSDecimal;
    Fpay_plan_date : TXSDate;
    Fpay_fact_date : TXSDate;
    Fpay_fact_price : TXSDecimal;
    Fpay_fact_summa : TXSDecimal;
    Fpay_fact_count : TXSDecimal;
    Fbill_num : WideString;
    Fbudget_name : WideString;
    Fpay_type_name : WideString;
    Fpay_type_value : Integer;
    Fpay_date : TXSDate;
    Fpay_sign : Integer;
    Fpay_type_name_initial : WideString;
    Fpay_type_value_initial : Integer;
    Fbillitemcodes : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanPayRef : RQPlanPayRef;
//???
    FplanPayItemFirstRef : RQPlanPayItemFirstRef;
//???
    FplanPayItemStatusRef : RQPlanPayItemStatusRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property prihod_count : TXSDecimal read Fprihod_count write Fprihod_count;
    property prihod_price : TXSDecimal read Fprihod_price write Fprihod_price;
    property prihod_summa : TXSDecimal read Fprihod_summa write Fprihod_summa;
    property prihod_date : TXSDate read Fprihod_date write Fprihod_date;
    property pay_plan_summa : TXSDecimal read Fpay_plan_summa write Fpay_plan_summa;
    property pay_plan_date : TXSDate read Fpay_plan_date write Fpay_plan_date;
    property pay_fact_date : TXSDate read Fpay_fact_date write Fpay_fact_date;
    property pay_fact_price : TXSDecimal read Fpay_fact_price write Fpay_fact_price;
    property pay_fact_summa : TXSDecimal read Fpay_fact_summa write Fpay_fact_summa;
    property pay_fact_count : TXSDecimal read Fpay_fact_count write Fpay_fact_count;
    property bill_num : WideString read Fbill_num write Fbill_num;
    property budget_name : WideString read Fbudget_name write Fbudget_name;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property  pay_type_value : Integer read Fpay_type_value write Fpay_type_value;
    property pay_date : TXSDate read Fpay_date write Fpay_date;
    property  pay_sign : Integer read Fpay_sign write Fpay_sign;
    property pay_type_name_initial : WideString read Fpay_type_name_initial write Fpay_type_name_initial;
    property  pay_type_value_initial : Integer read Fpay_type_value_initial write Fpay_type_value_initial;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property planPayItemFirstRef : RQPlanPayItemFirstRef read FplanPayItemFirstRef write FplanPayItemFirstRef;
    property planPayItemStatusRef : RQPlanPayItemStatusRef read FplanPayItemStatusRef write FplanPayItemStatusRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;
}



  RQPlanPayItemSecondShort = class(TRemotable)
  private
    Fcode : Integer;
    Fprihod_count : TXSDecimal;
    Fprihod_price : TXSDecimal;
    Fprihod_summa : TXSDecimal;
    Fprihod_date : TXSDate;
    Fpay_plan_summa : TXSDecimal;
    Fpay_plan_date : TXSDate;
    Fpay_fact_date : TXSDate;
    Fpay_fact_price : TXSDecimal;
    Fpay_fact_summa : TXSDecimal;
    Fpay_fact_count : TXSDecimal;
    Fbill_num : WideString;
    Fbudget_name : WideString;
    Fpay_type_name : WideString;
    Fpay_type_value : Integer;
    Fpay_date : TXSDate;
    Fpay_sign : Integer;
    Fpay_type_name_initial : WideString;
    Fpay_type_value_initial : Integer;
    Fbillitemcodes : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FplanPayRefCode : Integer;
    FplanPayRefNumberDoc : WideString;
    FplanPayRefDateGen : TXSDate;
    FplanPayRefUserGen : WideString;
    FplanPayRefDateEdit : TXSDate;
    FplanPayItemFirstRefCode : Integer;
    FplanPayItemFirstRefDdscode : WideString;
    FplanPayItemFirstRefProject : WideString;
    FplanPayItemFirstRefNumberdoc : WideString;
    FplanPayItemFirstRefOrderdate : TXSDate;
    FplanPayItemFirstRefStatussymbol : WideString;
    FplanPayItemFirstRefMname : WideString;
    FplanPayItemFirstRefContract : WideString;
    FplanPayItemFirstRefOrgokpo : WideString;
    FplanPayItemFirstRefOrg : WideString;
    FplanPayItemFirstRefMeas : WideString;
    FplanPayItemFirstRefCountfact : TXSDecimal;
    FplanPayItemFirstRefPricewithnds : TXSDecimal;
    FplanPayItemFirstRefSumma : TXSDecimal;
    FplanPayItemFirstRefPostavka_date : TXSDate;
    FplanPayItemFirstRefDeliverytime : Integer;
    FplanPayItemFirstRefBillitemcodes : WideString;
    FplanPayItemFirstRefMin_postavka_date : TXSDate;
    FplanPayItemFirstRefPlaneddatepays : TXSDate;
    FplanPayItemFirstRefPaymenttypename : WideString;
    FplanPayItemFirstRefPaymentvalue : Integer;
    FplanPayItemFirstRefPlansumpay : TXSDecimal;
    FplanPayItemFirstRefReestr_date : TXSDate;
    FplanPayItemFirstRefPaymenttypename_initial : WideString;
    FplanPayItemFirstRefPaymentvalue_initial : Integer;
    FplanPayItemFirstRefBudgetrefname : WideString;
    FplanPayItemFirstRefUserGen : WideString;
    FplanPayItemFirstRefDateEdit : TXSDate;
    FplanPayItemStatusRefCode : Integer;
    FplanPayItemStatusRefName : WideString;
    FbillRefCode : Integer;
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FbillRefDeliveryDays : TXSDecimal;
    FbillRefVat : TXSDecimal;
    FbillRefContractNumber : WideString;
    FbillRefFinDocCode : WideString;
    FsummaPropose : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property prihod_count : TXSDecimal read Fprihod_count write Fprihod_count;
    property prihod_price : TXSDecimal read Fprihod_price write Fprihod_price;
    property prihod_summa : TXSDecimal read Fprihod_summa write Fprihod_summa;
    property prihod_date : TXSDate read Fprihod_date write Fprihod_date;
    property pay_plan_summa : TXSDecimal read Fpay_plan_summa write Fpay_plan_summa;
    property pay_plan_date : TXSDate read Fpay_plan_date write Fpay_plan_date;
    property pay_fact_date : TXSDate read Fpay_fact_date write Fpay_fact_date;
    property pay_fact_price : TXSDecimal read Fpay_fact_price write Fpay_fact_price;
    property pay_fact_summa : TXSDecimal read Fpay_fact_summa write Fpay_fact_summa;
    property pay_fact_count : TXSDecimal read Fpay_fact_count write Fpay_fact_count;
    property bill_num : WideString read Fbill_num write Fbill_num;
    property budget_name : WideString read Fbudget_name write Fbudget_name;
    property pay_type_name : WideString read Fpay_type_name write Fpay_type_name;
    property  pay_type_value : Integer read Fpay_type_value write Fpay_type_value;
    property pay_date : TXSDate read Fpay_date write Fpay_date;
    property  pay_sign : Integer read Fpay_sign write Fpay_sign;
    property pay_type_name_initial : WideString read Fpay_type_name_initial write Fpay_type_name_initial;
    property  pay_type_value_initial : Integer read Fpay_type_value_initial write Fpay_type_value_initial;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property planPayRefCode : Integer read FplanPayRefCode write FplanPayRefCode;
    property planPayRefNumberDoc : WideString read FplanPayRefNumberDoc write FplanPayRefNumberDoc;
    property planPayRefDateGen : TXSDate read FplanPayRefDateGen write FplanPayRefDateGen;
    property planPayRefUserGen : WideString read FplanPayRefUserGen write FplanPayRefUserGen;
    property planPayRefDateEdit : TXSDate read FplanPayRefDateEdit write FplanPayRefDateEdit;
    property planPayItemFirstRefCode : Integer read FplanPayItemFirstRefCode write FplanPayItemFirstRefCode;
    property planPayItemFirstRefDdscode : WideString read FplanPayItemFirstRefDdscode write FplanPayItemFirstRefDdscode;
    property planPayItemFirstRefProject : WideString read FplanPayItemFirstRefProject write FplanPayItemFirstRefProject;
    property planPayItemFirstRefNumberdoc : WideString read FplanPayItemFirstRefNumberdoc write FplanPayItemFirstRefNumberdoc;
    property planPayItemFirstRefOrderdate : TXSDate read FplanPayItemFirstRefOrderdate write FplanPayItemFirstRefOrderdate;
    property planPayItemFirstRefStatussymbol : WideString read FplanPayItemFirstRefStatussymbol write FplanPayItemFirstRefStatussymbol;
    property planPayItemFirstRefMname : WideString read FplanPayItemFirstRefMname write FplanPayItemFirstRefMname;
    property planPayItemFirstRefContract : WideString read FplanPayItemFirstRefContract write FplanPayItemFirstRefContract;
    property planPayItemFirstRefOrgokpo : WideString read FplanPayItemFirstRefOrgokpo write FplanPayItemFirstRefOrgokpo;
    property planPayItemFirstRefOrg : WideString read FplanPayItemFirstRefOrg write FplanPayItemFirstRefOrg;
    property planPayItemFirstRefMeas : WideString read FplanPayItemFirstRefMeas write FplanPayItemFirstRefMeas;
    property planPayItemFirstRefCountfact : TXSDecimal read FplanPayItemFirstRefCountfact write FplanPayItemFirstRefCountfact;
    property planPayItemFirstRefPricewithnds : TXSDecimal read FplanPayItemFirstRefPricewithnds write FplanPayItemFirstRefPricewithnds;
    property planPayItemFirstRefSumma : TXSDecimal read FplanPayItemFirstRefSumma write FplanPayItemFirstRefSumma;
    property planPayItemFirstRefPostavka_date : TXSDate read FplanPayItemFirstRefPostavka_date write FplanPayItemFirstRefPostavka_date;
    property planPayItemFirstRefDeliverytime : Integer read FplanPayItemFirstRefDeliverytime write FplanPayItemFirstRefDeliverytime;
    property planPayItemFirstRefBillitemcodes : WideString read FplanPayItemFirstRefBillitemcodes write FplanPayItemFirstRefBillitemcodes;
    property planPayItemFirstRefMin_postavka_date : TXSDate read FplanPayItemFirstRefMin_postavka_date write FplanPayItemFirstRefMin_postavka_date;
    property planPayItemFirstRefPlaneddatepays : TXSDate read FplanPayItemFirstRefPlaneddatepays write FplanPayItemFirstRefPlaneddatepays;
    property planPayItemFirstRefPaymenttypename : WideString read FplanPayItemFirstRefPaymenttypename write FplanPayItemFirstRefPaymenttypename;
    property planPayItemFirstRefPaymentvalue : Integer read FplanPayItemFirstRefPaymentvalue write FplanPayItemFirstRefPaymentvalue;
    property planPayItemFirstRefPlansumpay : TXSDecimal read FplanPayItemFirstRefPlansumpay write FplanPayItemFirstRefPlansumpay;
    property planPayItemFirstRefReestr_date : TXSDate read FplanPayItemFirstRefReestr_date write FplanPayItemFirstRefReestr_date;
    property planPayItemFirstRefPaymenttypename_initial : WideString read FplanPayItemFirstRefPaymenttypename_initial write FplanPayItemFirstRefPaymenttypename_initial;
    property planPayItemFirstRefPaymentvalue_initial : Integer read FplanPayItemFirstRefPaymentvalue_initial write FplanPayItemFirstRefPaymentvalue_initial;
    property planPayItemFirstRefBudgetrefname : WideString read FplanPayItemFirstRefBudgetrefname write FplanPayItemFirstRefBudgetrefname;
    property planPayItemFirstRefUserGen : WideString read FplanPayItemFirstRefUserGen write FplanPayItemFirstRefUserGen;
    property planPayItemFirstRefDateEdit : TXSDate read FplanPayItemFirstRefDateEdit write FplanPayItemFirstRefDateEdit;
    property planPayItemStatusRefCode : Integer read FplanPayItemStatusRefCode write FplanPayItemStatusRefCode;
    property planPayItemStatusRefName : WideString read FplanPayItemStatusRefName write FplanPayItemStatusRefName;
    property billRefCode : Integer read FbillRefCode write FbillRefCode;
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc;
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject;
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen;
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen;
    property billRefDeliveryDays : TXSDecimal read FbillRefDeliveryDays write FbillRefDeliveryDays;
    property billRefVat : TXSDecimal read FbillRefVat write FbillRefVat;
    property billRefContractNumber : WideString read FbillRefContractNumber write FbillRefContractNumber;
    property billRefFinDocCode : WideString read FbillRefFinDocCode write FbillRefFinDocCode;
    property summaPropose : TXSDecimal read FsummaPropose write FsummaPropose;
  end;

   RQPlanPayItemSecondFilter = class(RQPlanPayItemSecond)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ArrayOfRQPlanPayItemSecondShort = array of RQPlanPayItemSecondShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayItemSecondShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayItemSecondShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayItemSecondShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayItemSecondController/message/
  // soapAction: http://ksoe.org/RQPlanPayItemSecondController/action/RQPlanPayItemSecondController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayItemSecondControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayItemSecondController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayItemSecondControllerSoapPort = interface(IInvokable)
  ['{7ed07ed0-7ed0-7ed0-7ed0-7ed07ed07ed0}']
    function add(const aRQPlanPayItemSecond: RQPlanPayItemSecond): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayItemSecond: RQPlanPayItemSecond); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayItemSecond; stdcall;
    function getList: RQPlanPayItemSecondShortList; stdcall;
    function getFilteredList(const aRQPlanPayItemSecondFilter: RQPlanPayItemSecondFilter): RQPlanPayItemSecondShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemSecondShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayItemSecondFilter: RQPlanPayItemSecondFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemSecondShortList; stdcall;

  // function getScrollableFilteredList(const aRQPlanPayItemSecondFilter: RQPlanPayItemSecondFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemSecondShortList; stdcall;

    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemSecondShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayItemSecondFilter: RQPlanPayItemSecondFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayItemSecondShort; stdcall;

    procedure updateToPaySum(const objCode: Integer; const newToPaySum: TXSDecimal); stdcall;
    procedure removeSelectedItems(const planPayItemSecondShortArr : ArrayOfRQPlanPayItemSecondShort; const planPayCode :Integer); stdcall;
    procedure removeItemsByBillCode(const billCodesArr : ArrayOfInteger; const planPayCode : Integer); stdcall;
  end;


implementation

  destructor RQPlanPayItemSecond.Destroy;
  begin
    if Assigned(Fprihod_count) then
      prihod_count.Free;
    if Assigned(Fprihod_price) then
      prihod_price.Free;
    if Assigned(Fprihod_summa) then
      prihod_summa.Free;
    if Assigned(Fprihod_date) then
      prihod_date.Free;
    if Assigned(Fpay_plan_summa) then
      pay_plan_summa.Free;
    if Assigned(Fpay_plan_date) then
      pay_plan_date.Free;
    if Assigned(Fpay_fact_date) then
      pay_fact_date.Free;
    if Assigned(Fpay_fact_price) then
      pay_fact_price.Free;
    if Assigned(Fpay_fact_summa) then
      pay_fact_summa.Free;
    if Assigned(Fpay_fact_count) then
      pay_fact_count.Free;
    if Assigned(Fpay_date) then
      pay_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(FplanPayItemFirstRef) then
      planPayItemFirstRef.Free;
    if Assigned(FplanPayItemStatusRef) then
      planPayItemStatusRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPayItemSecondFilter.Destroy;
  begin
    if Assigned(Fprihod_count) then
      prihod_count.Free;
    if Assigned(Fprihod_price) then
      prihod_price.Free;
    if Assigned(Fprihod_summa) then
      prihod_summa.Free;
    if Assigned(Fprihod_date) then
      prihod_date.Free;
    if Assigned(Fpay_plan_summa) then
      pay_plan_summa.Free;
    if Assigned(Fpay_plan_date) then
      pay_plan_date.Free;
    if Assigned(Fpay_fact_date) then
      pay_fact_date.Free;
    if Assigned(Fpay_fact_price) then
      pay_fact_price.Free;
    if Assigned(Fpay_fact_summa) then
      pay_fact_summa.Free;
    if Assigned(Fpay_fact_count) then
      pay_fact_count.Free;
    if Assigned(Fpay_date) then
      pay_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(FplanPayItemFirstRef) then
      planPayItemFirstRef.Free;
    if Assigned(FplanPayItemStatusRef) then
      planPayItemStatusRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPayItemSecondFilter.Destroy;
  begin
    inherited Destroy;
  end;


  destructor RQPlanPayItemSecondShort.Destroy;
  begin
    if Assigned(Fprihod_count) then
      prihod_count.Free;
    if Assigned(Fprihod_price) then
      prihod_price.Free;
    if Assigned(Fprihod_summa) then
      prihod_summa.Free;
    if Assigned(Fprihod_date) then
      prihod_date.Free;
    if Assigned(Fpay_plan_summa) then
      pay_plan_summa.Free;
    if Assigned(Fpay_plan_date) then
      pay_plan_date.Free;
    if Assigned(Fpay_fact_date) then
      pay_fact_date.Free;
    if Assigned(Fpay_fact_price) then
      pay_fact_price.Free;
    if Assigned(Fpay_fact_summa) then
      pay_fact_summa.Free;
    if Assigned(Fpay_fact_count) then
      pay_fact_count.Free;
    if Assigned(Fpay_date) then
      pay_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRefDateGen) then
      planPayRefDateGen.Free;
    if Assigned(FplanPayRefDateEdit) then
      planPayRefDateEdit.Free;
    if Assigned(FplanPayItemFirstRefOrderdate) then
      planPayItemFirstRefOrderdate.Free;
    if Assigned(FplanPayItemFirstRefCountfact) then
      planPayItemFirstRefCountfact.Free;
    if Assigned(FplanPayItemFirstRefPricewithnds) then
      planPayItemFirstRefPricewithnds.Free;
    if Assigned(FplanPayItemFirstRefSumma) then
      planPayItemFirstRefSumma.Free;
    if Assigned(FplanPayItemFirstRefPostavka_date) then
      planPayItemFirstRefPostavka_date.Free;
    if Assigned(FplanPayItemFirstRefMin_postavka_date) then
      planPayItemFirstRefMin_postavka_date.Free;
    if Assigned(FplanPayItemFirstRefPlaneddatepays) then
      planPayItemFirstRefPlaneddatepays.Free;
    if Assigned(FplanPayItemFirstRefPlansumpay) then
      planPayItemFirstRefPlansumpay.Free;
    if Assigned(FplanPayItemFirstRefReestr_date) then
      planPayItemFirstRefReestr_date.Free;
    if Assigned(FplanPayItemFirstRefDateEdit) then
      planPayItemFirstRefDateEdit.Free;
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FbillRefDeliveryDays) then
      billRefDeliveryDays.Free;
    if Assigned(FbillRefVat) then
      billRefVat.Free;
    inherited Destroy;
  end;

  destructor RQPlanPayItemSecondShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayItemSecond, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemSecond');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemSecondRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemSecondRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemSecondFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemSecondFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemSecondShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemSecondShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemSecondShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemSecondShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayItemSecondShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayItemSecondShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayItemSecondControllerSoapPort), 'http://ksoe.org/RQPlanPayItemSecondController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayItemSecondControllerSoapPort), 'http://ksoe.org/RQPlanPayItemSecondController/action/RQPlanPayItemSecondController.%operationName%');


end.
