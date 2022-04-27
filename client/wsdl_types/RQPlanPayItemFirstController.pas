unit RQPlanPayItemFirstController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPlanPayController
   ,RQOrderItemController
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

  RQPlanPayItemFirst            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemFirstRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanPayItemFirst = class(TRemotable)
  private
    Fcode : Integer;
    Fddscode : WideString;
    Fproject : WideString;
    Fnumberdoc : WideString;
    Forderdate : TXSDate;
    Fstatussymbol : WideString;
    Fmname : WideString;
    Fcontract : WideString;
    Forgokpo : WideString;
    Forg : WideString;
    Fmeas : WideString;
    Fcountfact : TXSDecimal;
    Fpricewithnds : TXSDecimal;
    Fsumma : TXSDecimal;
    Fpostavka_date : TXSDate;
    Fdeliverytime : Integer;
    Fbillitemcodes : WideString;
    Fmin_postavka_date : TXSDate;
    Fplaneddatepays : TXSDate;
    Fpaymenttypename : WideString;
    Fpaymentvalue : Integer;
    Fplansumpay : TXSDecimal;
    Freestr_date : TXSDate;
    Fpaymenttypename_initial : WideString;
    Fpaymentvalue_initial : Integer;
    Fbudgetrefname : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanPayRef : RQPlanPayRef;
//???
    ForderitemRef : RQOrderItemRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property project : WideString read Fproject write Fproject;
    property numberdoc : WideString read Fnumberdoc write Fnumberdoc;
    property orderdate : TXSDate read Forderdate write Forderdate;
    property statussymbol : WideString read Fstatussymbol write Fstatussymbol;
    property mname : WideString read Fmname write Fmname;
    property contract : WideString read Fcontract write Fcontract;
    property orgokpo : WideString read Forgokpo write Forgokpo;
    property org : WideString read Forg write Forg;
    property meas : WideString read Fmeas write Fmeas;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property pricewithnds : TXSDecimal read Fpricewithnds write Fpricewithnds;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property postavka_date : TXSDate read Fpostavka_date write Fpostavka_date;
    property  deliverytime : Integer read Fdeliverytime write Fdeliverytime;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property min_postavka_date : TXSDate read Fmin_postavka_date write Fmin_postavka_date;
    property planeddatepays : TXSDate read Fplaneddatepays write Fplaneddatepays;
    property paymenttypename : WideString read Fpaymenttypename write Fpaymenttypename;
    property  paymentvalue : Integer read Fpaymentvalue write Fpaymentvalue;
    property plansumpay : TXSDecimal read Fplansumpay write Fplansumpay;
    property reestr_date : TXSDate read Freestr_date write Freestr_date;
    property paymenttypename_initial : WideString read Fpaymenttypename_initial write Fpaymenttypename_initial;
    property  paymentvalue_initial : Integer read Fpaymentvalue_initial write Fpaymentvalue_initial;
    property budgetrefname : WideString read Fbudgetrefname write Fbudgetrefname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property orderitemRef : RQOrderItemRef read ForderitemRef write ForderitemRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;

{
  RQPlanPayItemFirstFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fddscode : WideString;
    Fproject : WideString;
    Fnumberdoc : WideString;
    Forderdate : TXSDate;
    Fstatussymbol : WideString;
    Fmname : WideString;
    Fcontract : WideString;
    Forgokpo : WideString;
    Forg : WideString;
    Fmeas : WideString;
    Fcountfact : TXSDecimal;
    Fpricewithnds : TXSDecimal;
    Fsumma : TXSDecimal;
    Fpostavka_date : TXSDate;
    Fdeliverytime : Integer;
    Fbillitemcodes : WideString;
    Fmin_postavka_date : TXSDate;
    Fplaneddatepays : TXSDate;
    Fpaymenttypename : WideString;
    Fpaymentvalue : Integer;
    Fplansumpay : TXSDecimal;
    Freestr_date : TXSDate;
    Fpaymenttypename_initial : WideString;
    Fpaymentvalue_initial : Integer;
    Fbudgetrefname : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FplanPayRef : RQPlanPayRef;
//???
    ForderitemRef : RQOrderItemRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property project : WideString read Fproject write Fproject;
    property numberdoc : WideString read Fnumberdoc write Fnumberdoc;
    property orderdate : TXSDate read Forderdate write Forderdate;
    property statussymbol : WideString read Fstatussymbol write Fstatussymbol;
    property mname : WideString read Fmname write Fmname;
    property contract : WideString read Fcontract write Fcontract;
    property orgokpo : WideString read Forgokpo write Forgokpo;
    property org : WideString read Forg write Forg;
    property meas : WideString read Fmeas write Fmeas;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property pricewithnds : TXSDecimal read Fpricewithnds write Fpricewithnds;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property postavka_date : TXSDate read Fpostavka_date write Fpostavka_date;
    property  deliverytime : Integer read Fdeliverytime write Fdeliverytime;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property min_postavka_date : TXSDate read Fmin_postavka_date write Fmin_postavka_date;
    property planeddatepays : TXSDate read Fplaneddatepays write Fplaneddatepays;
    property paymenttypename : WideString read Fpaymenttypename write Fpaymenttypename;
    property  paymentvalue : Integer read Fpaymentvalue write Fpaymentvalue;
    property plansumpay : TXSDecimal read Fplansumpay write Fplansumpay;
    property reestr_date : TXSDate read Freestr_date write Freestr_date;
    property paymenttypename_initial : WideString read Fpaymenttypename_initial write Fpaymenttypename_initial;
    property  paymentvalue_initial : Integer read Fpaymentvalue_initial write Fpaymentvalue_initial;
    property budgetrefname : WideString read Fbudgetrefname write Fbudgetrefname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property planPayRef : RQPlanPayRef read FplanPayRef write FplanPayRef;
    property orderitemRef : RQOrderItemRef read ForderitemRef write ForderitemRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;
}

  RQPlanPayItemFirstFilter = class(RQPlanPayItemFirst)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanPayItemFirstShort = class(TRemotable)
  private
    Fcode : Integer;
    Fddscode : WideString;
    Fproject : WideString;
    Fnumberdoc : WideString;
    Forderdate : TXSDate;
    Fstatussymbol : WideString;
    Fmname : WideString;
    Fcontract : WideString;
    Forgokpo : WideString;
    Forg : WideString;
    Fmeas : WideString;
    Fcountfact : TXSDecimal;
    Fpricewithnds : TXSDecimal;
    Fsumma : TXSDecimal;
    Fpostavka_date : TXSDate;
    Fdeliverytime : Integer;
    Fbillitemcodes : WideString;
    Fmin_postavka_date : TXSDate;
    Fplaneddatepays : TXSDate;
    Fpaymenttypename : WideString;
    Fpaymentvalue : Integer;
    Fplansumpay : TXSDecimal;
    Freestr_date : TXSDate;
    Fpaymenttypename_initial : WideString;
    Fpaymentvalue_initial : Integer;
    Fbudgetrefname : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FplanPayRefCode : Integer;
    FplanPayRefNumberDoc : WideString;
    FplanPayRefDateGen : TXSDate;
    FplanPayRefUserGen : WideString;
    FplanPayRefDateEdit : TXSDate;
    ForderitemRefCode : Integer;
    ForderitemRefCountGen : TXSDecimal;
    ForderitemRefMaterialNameTxt : WideString;
    ForderitemRefMeasurementNameTxt : WideString;
    ForderitemRefMaterialNameGen : WideString;
    ForderitemRefMeasurementNameGen : WideString;
    ForderitemRefMaterialNameGenRQ : WideString;
    ForderitemRefMeasurementNameGenRQ : WideString;
    ForderitemRefCountFact : TXSDecimal;
    ForderitemRefPriceWithoutNds : TXSDecimal;
    ForderitemRefNds : TXSDecimal;
    ForderitemRefPriceWithNds : TXSDecimal;
    ForderitemRefSumWithoutNds : TXSDecimal;
    ForderitemRefSumNds : TXSDecimal;
    ForderitemRefSumGen : TXSDecimal;
    ForderitemRefCommentGen : WideString;
    ForderitemRefDeliveryTime : Integer;
    ForderitemRefContractNumber : WideString;
    ForderitemRefContractDate : TXSDate;
    ForderitemRefFinDocCode : WideString;
    ForderitemRefFinDocID : Integer;
    ForderitemRefPlannedDatePays : TXSDate;
    ForderitemRefPlannedDateDelivery : TXSDate;
    ForderitemRefStatusReason : WideString;
    ForderitemRefPaymentValue : Integer;
    ForderitemRefUserGen : WideString;
    FbillRefCode : Integer;
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FbillRefDeliveryDays : TXSDecimal;
    FbillRefVat : TXSDecimal;
    FbillRefContractNumber : WideString;
    FbillRefFinDocCode : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property ddscode : WideString read Fddscode write Fddscode;
    property project : WideString read Fproject write Fproject;
    property numberdoc : WideString read Fnumberdoc write Fnumberdoc;
    property orderdate : TXSDate read Forderdate write Forderdate;
    property statussymbol : WideString read Fstatussymbol write Fstatussymbol;
    property mname : WideString read Fmname write Fmname;
    property contract : WideString read Fcontract write Fcontract;
    property orgokpo : WideString read Forgokpo write Forgokpo;
    property org : WideString read Forg write Forg;
    property meas : WideString read Fmeas write Fmeas;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property pricewithnds : TXSDecimal read Fpricewithnds write Fpricewithnds;
    property summa : TXSDecimal read Fsumma write Fsumma;
    property postavka_date : TXSDate read Fpostavka_date write Fpostavka_date;
    property  deliverytime : Integer read Fdeliverytime write Fdeliverytime;
    property billitemcodes : WideString read Fbillitemcodes write Fbillitemcodes;
    property min_postavka_date : TXSDate read Fmin_postavka_date write Fmin_postavka_date;
    property planeddatepays : TXSDate read Fplaneddatepays write Fplaneddatepays;
    property paymenttypename : WideString read Fpaymenttypename write Fpaymenttypename;
    property  paymentvalue : Integer read Fpaymentvalue write Fpaymentvalue;
    property plansumpay : TXSDecimal read Fplansumpay write Fplansumpay;
    property reestr_date : TXSDate read Freestr_date write Freestr_date;
    property paymenttypename_initial : WideString read Fpaymenttypename_initial write Fpaymenttypename_initial;
    property  paymentvalue_initial : Integer read Fpaymentvalue_initial write Fpaymentvalue_initial;
    property budgetrefname : WideString read Fbudgetrefname write Fbudgetrefname;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property planPayRefCode : Integer read FplanPayRefCode write FplanPayRefCode;
    property planPayRefNumberDoc : WideString read FplanPayRefNumberDoc write FplanPayRefNumberDoc;
    property planPayRefDateGen : TXSDate read FplanPayRefDateGen write FplanPayRefDateGen;
    property planPayRefUserGen : WideString read FplanPayRefUserGen write FplanPayRefUserGen;
    property planPayRefDateEdit : TXSDate read FplanPayRefDateEdit write FplanPayRefDateEdit;
    property orderitemRefCode : Integer read ForderitemRefCode write ForderitemRefCode;
    property orderitemRefCountGen : TXSDecimal read ForderitemRefCountGen write ForderitemRefCountGen;
    property orderitemRefMaterialNameTxt : WideString read ForderitemRefMaterialNameTxt write ForderitemRefMaterialNameTxt;
    property orderitemRefMeasurementNameTxt : WideString read ForderitemRefMeasurementNameTxt write ForderitemRefMeasurementNameTxt;
    property orderitemRefMaterialNameGen : WideString read ForderitemRefMaterialNameGen write ForderitemRefMaterialNameGen;
    property orderitemRefMeasurementNameGen : WideString read ForderitemRefMeasurementNameGen write ForderitemRefMeasurementNameGen;
    property orderitemRefMaterialNameGenRQ : WideString read ForderitemRefMaterialNameGenRQ write ForderitemRefMaterialNameGenRQ;
    property orderitemRefMeasurementNameGenRQ : WideString read ForderitemRefMeasurementNameGenRQ write ForderitemRefMeasurementNameGenRQ;
    property orderitemRefCountFact : TXSDecimal read ForderitemRefCountFact write ForderitemRefCountFact;
    property orderitemRefPriceWithoutNds : TXSDecimal read ForderitemRefPriceWithoutNds write ForderitemRefPriceWithoutNds;
    property orderitemRefNds : TXSDecimal read ForderitemRefNds write ForderitemRefNds;
    property orderitemRefPriceWithNds : TXSDecimal read ForderitemRefPriceWithNds write ForderitemRefPriceWithNds;
    property orderitemRefSumWithoutNds : TXSDecimal read ForderitemRefSumWithoutNds write ForderitemRefSumWithoutNds;
    property orderitemRefSumNds : TXSDecimal read ForderitemRefSumNds write ForderitemRefSumNds;
    property orderitemRefSumGen : TXSDecimal read ForderitemRefSumGen write ForderitemRefSumGen;
    property orderitemRefCommentGen : WideString read ForderitemRefCommentGen write ForderitemRefCommentGen;
    property orderitemRefDeliveryTime : Integer read ForderitemRefDeliveryTime write ForderitemRefDeliveryTime;
    property orderitemRefContractNumber : WideString read ForderitemRefContractNumber write ForderitemRefContractNumber;
    property orderitemRefContractDate : TXSDate read ForderitemRefContractDate write ForderitemRefContractDate;
    property orderitemRefFinDocCode : WideString read ForderitemRefFinDocCode write ForderitemRefFinDocCode;
    property orderitemRefFinDocID : Integer read ForderitemRefFinDocID write ForderitemRefFinDocID;
    property orderitemRefPlannedDatePays : TXSDate read ForderitemRefPlannedDatePays write ForderitemRefPlannedDatePays;
    property orderitemRefPlannedDateDelivery : TXSDate read ForderitemRefPlannedDateDelivery write ForderitemRefPlannedDateDelivery;
    property orderitemRefStatusReason : WideString read ForderitemRefStatusReason write ForderitemRefStatusReason;
    property orderitemRefPaymentValue : Integer read ForderitemRefPaymentValue write ForderitemRefPaymentValue;
    property orderitemRefUserGen : WideString read ForderitemRefUserGen write ForderitemRefUserGen;
    property billRefCode : Integer read FbillRefCode write FbillRefCode;
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc;
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject;
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen;
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen;
    property billRefDeliveryDays : TXSDecimal read FbillRefDeliveryDays write FbillRefDeliveryDays;
    property billRefVat : TXSDecimal read FbillRefVat write FbillRefVat;
    property billRefContractNumber : WideString read FbillRefContractNumber write FbillRefContractNumber;
    property billRefFinDocCode : WideString read FbillRefFinDocCode write FbillRefFinDocCode;
  end;

  ArrayOfRQPlanPayItemFirstShort = array of RQPlanPayItemFirstShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanPayItemFirstShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanPayItemFirstShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanPayItemFirstShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanPayItemFirstController/message/
  // soapAction: http://ksoe.org/RQPlanPayItemFirstController/action/RQPlanPayItemFirstController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanPayItemFirstControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanPayItemFirstController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanPayItemFirstControllerSoapPort = interface(IInvokable)
  ['{ecfaecfa-ecfa-ecfa-ecfa-ecfaecfaecfa}']
    function add(const aRQPlanPayItemFirst: RQPlanPayItemFirst): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanPayItemFirst: RQPlanPayItemFirst); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanPayItemFirst; stdcall;
    function getList: RQPlanPayItemFirstShortList; stdcall;
    function getFilteredList(const aRQPlanPayItemFirstFilter: RQPlanPayItemFirstFilter): RQPlanPayItemFirstShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFirstShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanPayItemFirstFilter: RQPlanPayItemFirstFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFirstShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanPayItemFirstShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanPayItemFirstFilter: RQPlanPayItemFirstFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanPayItemFirstShort; stdcall;
  end;


implementation

  destructor RQPlanPayItemFirst.Destroy;
  begin
    if Assigned(Forderdate) then
      orderdate.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(Fpricewithnds) then
      pricewithnds.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fpostavka_date) then
      postavka_date.Free;
    if Assigned(Fmin_postavka_date) then
      min_postavka_date.Free;
    if Assigned(Fplaneddatepays) then
      planeddatepays.Free;
    if Assigned(Fplansumpay) then
      plansumpay.Free;
    if Assigned(Freestr_date) then
      reestr_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(ForderitemRef) then
      orderitemRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanPayItemFirstFilter.Destroy;
  begin
    if Assigned(Forderdate) then
      orderdate.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(Fpricewithnds) then
      pricewithnds.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fpostavka_date) then
      postavka_date.Free;
    if Assigned(Fmin_postavka_date) then
      min_postavka_date.Free;
    if Assigned(Fplaneddatepays) then
      planeddatepays.Free;
    if Assigned(Fplansumpay) then
      plansumpay.Free;
    if Assigned(Freestr_date) then
      reestr_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRef) then
      planPayRef.Free;
    if Assigned(ForderitemRef) then
      orderitemRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanPayItemFirstFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanPayItemFirstShort.Destroy;
  begin
    if Assigned(Forderdate) then
      orderdate.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(Fpricewithnds) then
      pricewithnds.Free;
    if Assigned(Fsumma) then
      summa.Free;
    if Assigned(Fpostavka_date) then
      postavka_date.Free;
    if Assigned(Fmin_postavka_date) then
      min_postavka_date.Free;
    if Assigned(Fplaneddatepays) then
      planeddatepays.Free;
    if Assigned(Fplansumpay) then
      plansumpay.Free;
    if Assigned(Freestr_date) then
      reestr_date.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanPayRefDateGen) then
      planPayRefDateGen.Free;
    if Assigned(FplanPayRefDateEdit) then
      planPayRefDateEdit.Free;
    if Assigned(ForderitemRefCountGen) then
      orderitemRefCountGen.Free;
    if Assigned(ForderitemRefCountFact) then
      orderitemRefCountFact.Free;
    if Assigned(ForderitemRefPriceWithoutNds) then
      orderitemRefPriceWithoutNds.Free;
    if Assigned(ForderitemRefNds) then
      orderitemRefNds.Free;
    if Assigned(ForderitemRefPriceWithNds) then
      orderitemRefPriceWithNds.Free;
    if Assigned(ForderitemRefSumWithoutNds) then
      orderitemRefSumWithoutNds.Free;
    if Assigned(ForderitemRefSumNds) then
      orderitemRefSumNds.Free;
    if Assigned(ForderitemRefSumGen) then
      orderitemRefSumGen.Free;
    if Assigned(ForderitemRefContractDate) then
      orderitemRefContractDate.Free;
    if Assigned(ForderitemRefPlannedDatePays) then
      orderitemRefPlannedDatePays.Free;
    if Assigned(ForderitemRefPlannedDateDelivery) then
      orderitemRefPlannedDateDelivery.Free;
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FbillRefDeliveryDays) then
      billRefDeliveryDays.Free;
    if Assigned(FbillRefVat) then
      billRefVat.Free;
    inherited Destroy;
  end;

  destructor RQPlanPayItemFirstShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanPayItemFirst, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFirst');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFirstRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFirstRef');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFirstFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFirstFilter');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFirstShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFirstShort');
  RemClassRegistry.RegisterXSClass(RQPlanPayItemFirstShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanPayItemFirstShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanPayItemFirstShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanPayItemFirstShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanPayItemFirstControllerSoapPort), 'http://ksoe.org/RQPlanPayItemFirstController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanPayItemFirstControllerSoapPort), 'http://ksoe.org/RQPlanPayItemFirstController/action/RQPlanPayItemFirstController.%operationName%');


end.
