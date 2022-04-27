unit RQPlanItemBankDetailController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENBankingDetailsController
   ,RQPlanPayItemSecondController
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

  RQPlanItemBankDetail            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanItemBankDetailRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPlanItemBankDetail = class(TRemotable)
  private
    Fcode : Integer;
    ForgOkpo : WideString;
    ForgName : WideString;
    ForgAccount : WideString;
    FbankMfo : WideString;
//???
    FbankingRef : ENBankingDetailsRef;
//???
    FplanItemSecondRef : RQPlanPayItemSecondRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property orgOkpo : WideString read ForgOkpo write ForgOkpo;
    property orgName : WideString read ForgName write ForgName;
    property orgAccount : WideString read ForgAccount write ForgAccount;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankingRef : ENBankingDetailsRef read FbankingRef write FbankingRef;
    property planItemSecondRef : RQPlanPayItemSecondRef read FplanItemSecondRef write FplanItemSecondRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;

{
  RQPlanItemBankDetailFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    ForgOkpo : WideString;
    ForgName : WideString;
    ForgAccount : WideString;
    FbankMfo : WideString;
//???
    FbankingRef : ENBankingDetailsRef;
//???
    FplanItemSecondRef : RQPlanPayItemSecondRef;
//???
    FbillRef : RQBillRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property orgOkpo : WideString read ForgOkpo write ForgOkpo;
    property orgName : WideString read ForgName write ForgName;
    property orgAccount : WideString read ForgAccount write ForgAccount;
    property bankMfo : WideString read FbankMfo write FbankMfo;
    property bankingRef : ENBankingDetailsRef read FbankingRef write FbankingRef;
    property planItemSecondRef : RQPlanPayItemSecondRef read FplanItemSecondRef write FplanItemSecondRef;
    property billRef : RQBillRef read FbillRef write FbillRef;
  end;
}

  RQPlanItemBankDetailFilter = class(RQPlanItemBankDetail)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPlanItemBankDetailShort = class(TRemotable)
  private
    Fcode : Integer;
    ForgOkpo : WideString;
    ForgName : WideString;
    ForgAccount : WideString;
    FbankMfo : WideString;
    FbankingRefCode : Integer;
    FplanItemSecondRefCode : Integer;
    FplanItemSecondRefPrihod_count : TXSDecimal;
    FplanItemSecondRefPrihod_price : TXSDecimal;
    FplanItemSecondRefPrihod_summa : TXSDecimal;
    FplanItemSecondRefPrihod_date : TXSDate;
    FplanItemSecondRefPay_plan_summa : TXSDecimal;
    FplanItemSecondRefPay_plan_date : TXSDate;
    FplanItemSecondRefPay_fact_date : TXSDate;
    FplanItemSecondRefPay_fact_price : TXSDecimal;
    FplanItemSecondRefPay_fact_summa : TXSDecimal;
    FplanItemSecondRefPay_fact_count : TXSDecimal;
    FplanItemSecondRefBill_num : WideString;
    FplanItemSecondRefBudget_name : WideString;
    FplanItemSecondRefPay_type_name : WideString;
    FplanItemSecondRefPay_type_value : Integer;
    FplanItemSecondRefPay_date : TXSDate;
    FplanItemSecondRefPay_sign : Integer;
    FplanItemSecondRefPay_type_name_initial : WideString;
    FplanItemSecondRefPay_type_value_initial : Integer;
    FplanItemSecondRefBillitemcodes : WideString;
    FplanItemSecondRefUserGen : WideString;
    FplanItemSecondRefDateEdit : TXSDate;
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
    property orgOkpo : WideString read ForgOkpo write ForgOkpo;
    property orgName : WideString read ForgName write ForgName;
    property orgAccount : WideString read ForgAccount write ForgAccount;
    property bankMfo : WideString read FbankMfo write FbankMfo;

    property bankingRefCode : Integer read FbankingRefCode write FbankingRefCode; //ENBankingDetailsRef read FbankingRefCode write FbankingRefCode;
    property planItemSecondRefCode : Integer read FplanItemSecondRefCode write FplanItemSecondRefCode;
    property planItemSecondRefPrihod_count : TXSDecimal read FplanItemSecondRefPrihod_count write FplanItemSecondRefPrihod_count;
    property planItemSecondRefPrihod_price : TXSDecimal read FplanItemSecondRefPrihod_price write FplanItemSecondRefPrihod_price;
    property planItemSecondRefPrihod_summa : TXSDecimal read FplanItemSecondRefPrihod_summa write FplanItemSecondRefPrihod_summa;
    property planItemSecondRefPrihod_date : TXSDate read FplanItemSecondRefPrihod_date write FplanItemSecondRefPrihod_date;
    property planItemSecondRefPay_plan_summa : TXSDecimal read FplanItemSecondRefPay_plan_summa write FplanItemSecondRefPay_plan_summa;
    property planItemSecondRefPay_plan_date : TXSDate read FplanItemSecondRefPay_plan_date write FplanItemSecondRefPay_plan_date;
    property planItemSecondRefPay_fact_date : TXSDate read FplanItemSecondRefPay_fact_date write FplanItemSecondRefPay_fact_date;
    property planItemSecondRefPay_fact_price : TXSDecimal read FplanItemSecondRefPay_fact_price write FplanItemSecondRefPay_fact_price;
    property planItemSecondRefPay_fact_summa : TXSDecimal read FplanItemSecondRefPay_fact_summa write FplanItemSecondRefPay_fact_summa;
    property planItemSecondRefPay_fact_count : TXSDecimal read FplanItemSecondRefPay_fact_count write FplanItemSecondRefPay_fact_count;
    property planItemSecondRefBill_num : WideString read FplanItemSecondRefBill_num write FplanItemSecondRefBill_num;
    property planItemSecondRefBudget_name : WideString read FplanItemSecondRefBudget_name write FplanItemSecondRefBudget_name;
    property planItemSecondRefPay_type_name : WideString read FplanItemSecondRefPay_type_name write FplanItemSecondRefPay_type_name;
    property planItemSecondRefPay_type_value : Integer read FplanItemSecondRefPay_type_value write FplanItemSecondRefPay_type_value;
    property planItemSecondRefPay_date : TXSDate read FplanItemSecondRefPay_date write FplanItemSecondRefPay_date;
    property planItemSecondRefPay_sign : Integer read FplanItemSecondRefPay_sign write FplanItemSecondRefPay_sign;
    property planItemSecondRefPay_type_name_initial : WideString read FplanItemSecondRefPay_type_name_initial write FplanItemSecondRefPay_type_name_initial;
    property planItemSecondRefPay_type_value_initial : Integer read FplanItemSecondRefPay_type_value_initial write FplanItemSecondRefPay_type_value_initial;
    property planItemSecondRefBillitemcodes : WideString read FplanItemSecondRefBillitemcodes write FplanItemSecondRefBillitemcodes;
    property planItemSecondRefUserGen : WideString read FplanItemSecondRefUserGen write FplanItemSecondRefUserGen;
    property planItemSecondRefDateEdit : TXSDate read FplanItemSecondRefDateEdit write FplanItemSecondRefDateEdit;
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

  ArrayOfRQPlanItemBankDetailShort = array of RQPlanItemBankDetailShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPlanItemBankDetailShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPlanItemBankDetailShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPlanItemBankDetailShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPlanItemBankDetailController/message/
  // soapAction: http://ksoe.org/RQPlanItemBankDetailController/action/RQPlanItemBankDetailController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPlanItemBankDetailControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPlanItemBankDetailController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPlanItemBankDetailControllerSoapPort = interface(IInvokable)
['{DA7780D9-8DC0-4F0C-A626-0CB823A65DD5}']
    function add(const aRQPlanItemBankDetail: RQPlanItemBankDetail): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPlanItemBankDetail: RQPlanItemBankDetail); stdcall;
    function getObject(const anObjectCode: Integer): RQPlanItemBankDetail; stdcall;
    function getList: RQPlanItemBankDetailShortList; stdcall;
    function getFilteredList(const aRQPlanItemBankDetailFilter: RQPlanItemBankDetailFilter): RQPlanItemBankDetailShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPlanItemBankDetailShortList; stdcall;
    function getScrollableFilteredList(const aRQPlanItemBankDetailFilter: RQPlanItemBankDetailFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPlanItemBankDetailShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPlanItemBankDetailShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPlanItemBankDetailFilter: RQPlanItemBankDetailFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPlanItemBankDetailShort; stdcall;

    procedure saveByRqBill(const aRQPlanItemBankDetail: RQPlanItemBankDetail); stdcall;
  end;


implementation

  destructor RQPlanItemBankDetail.Destroy;
  begin
    if Assigned(FbankingRef) then
      bankingRef.Free;
    if Assigned(FplanItemSecondRef) then
      planItemSecondRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPlanItemBankDetailFilter.Destroy;
  begin
    if Assigned(FbankingRef) then
      bankingRef.Free;
    if Assigned(FplanItemSecondRef) then
      planItemSecondRef.Free;
    if Assigned(FbillRef) then
      billRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPlanItemBankDetailFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPlanItemBankDetailShort.Destroy;
  begin
    if Assigned(FplanItemSecondRefPrihod_count) then
      planItemSecondRefPrihod_count.Free;
    if Assigned(FplanItemSecondRefPrihod_price) then
      planItemSecondRefPrihod_price.Free;
    if Assigned(FplanItemSecondRefPrihod_summa) then
      planItemSecondRefPrihod_summa.Free;
    if Assigned(FplanItemSecondRefPrihod_date) then
      planItemSecondRefPrihod_date.Free;
    if Assigned(FplanItemSecondRefPay_plan_summa) then
      planItemSecondRefPay_plan_summa.Free;
    if Assigned(FplanItemSecondRefPay_plan_date) then
      planItemSecondRefPay_plan_date.Free;
    if Assigned(FplanItemSecondRefPay_fact_date) then
      planItemSecondRefPay_fact_date.Free;
    if Assigned(FplanItemSecondRefPay_fact_price) then
      planItemSecondRefPay_fact_price.Free;
    if Assigned(FplanItemSecondRefPay_fact_summa) then
      planItemSecondRefPay_fact_summa.Free;
    if Assigned(FplanItemSecondRefPay_fact_count) then
      planItemSecondRefPay_fact_count.Free;
    if Assigned(FplanItemSecondRefPay_date) then
      planItemSecondRefPay_date.Free;
    if Assigned(FplanItemSecondRefDateEdit) then
      planItemSecondRefDateEdit.Free;
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FbillRefDeliveryDays) then
      billRefDeliveryDays.Free;
    if Assigned(FbillRefVat) then
      billRefVat.Free;
    inherited Destroy;
  end;

  destructor RQPlanItemBankDetailShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPlanItemBankDetail, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanItemBankDetail');
  RemClassRegistry.RegisterXSClass(RQPlanItemBankDetailRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanItemBankDetailRef');
  RemClassRegistry.RegisterXSClass(RQPlanItemBankDetailFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanItemBankDetailFilter');
  RemClassRegistry.RegisterXSClass(RQPlanItemBankDetailShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanItemBankDetailShort');
  RemClassRegistry.RegisterXSClass(RQPlanItemBankDetailShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPlanItemBankDetailShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPlanItemBankDetailShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPlanItemBankDetailShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPlanItemBankDetailControllerSoapPort), 'http://ksoe.org/RQPlanItemBankDetailController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPlanItemBankDetailControllerSoapPort), 'http://ksoe.org/RQPlanItemBankDetailController/action/RQPlanItemBankDetailController.%operationName%');


end.
