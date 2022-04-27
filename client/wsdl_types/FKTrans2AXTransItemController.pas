unit FKTrans2AXTransItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,FKTrans2AXTransController
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

  FKTrans2AXTransItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKTrans2AXTransItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  FKTrans2AXTransItem = class(TRemotable)
  private
    Fcode : Integer;
    FnumUnFKStr : WideString;
    FpartId : Integer;
    FisPrihod : Integer;
    FtransDate : TXSDate;
    FbalCeh : WideString;
    FbalSch : WideString;
    FbalKau : WideString;
    FkorCeh : WideString;
    FkorSch : WideString;
    FkorKau : WideString;
    FamountCur : TXSDecimal;
    Fcurrency : WideString;
    FamountMST : TXSDecimal;
    FaccountNum : WideString;
    FoffsetAccountNum : WideString;
    FaccountDimension1 : WideString;
    FaccountDimension2 : WideString;
    FaccountDimension3 : WideString;
    FaccountDimension4 : WideString;
    FaccountDimension5 : WideString;
    FaccountDimension6 : WideString;
    FaccountDimension7 : WideString;
    FaccountDimension8 : WideString;
    FaccountDimension9 : WideString;
    FaccountDimension10 : WideString;
    FaccountDimension11 : WideString;
    FaccountDimension12 : WideString;
    FaccountDimension13 : WideString;
    FcorAccountDimension1 : WideString;
    FcorAccountDimension2 : WideString;
    FcorAccountDimension3 : WideString;
    FcorAccountDimension4 : WideString;
    FcorAccountDimension5 : WideString;
    FcorAccountDimension6 : WideString;
    FcorAccountDimension7 : WideString;
    FcorAccountDimension8 : WideString;
    FcorAccountDimension9 : WideString;
    FcorAccountDimension10 : WideString;
    FcorAccountDimension11 : WideString;
    FcorAccountDimension12 : WideString;
    FcorAccountDimension13 : WideString;
    FledgerTxt : WideString;
    Fvoucher : WideString;
    Fstatus : Integer;
    FerrorStr : WideString;
//???
    FFKTrans2AXTrans : FKTrans2AXTransRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numUnFKStr : WideString read FnumUnFKStr write FnumUnFKStr;
    property  partId : Integer read FpartId write FpartId;
    property  isPrihod : Integer read FisPrihod write FisPrihod;
    property transDate : TXSDate read FtransDate write FtransDate;
    property balCeh : WideString read FbalCeh write FbalCeh;
    property balSch : WideString read FbalSch write FbalSch;
    property balKau : WideString read FbalKau write FbalKau;
    property korCeh : WideString read FkorCeh write FkorCeh;
    property korSch : WideString read FkorSch write FkorSch;
    property korKau : WideString read FkorKau write FkorKau;
    property amountCur : TXSDecimal read FamountCur write FamountCur;
    property currency : WideString read Fcurrency write Fcurrency;
    property amountMST : TXSDecimal read FamountMST write FamountMST;
    property accountNum : WideString read FaccountNum write FaccountNum;
    property offsetAccountNum : WideString read FoffsetAccountNum write FoffsetAccountNum;
    property accountDimension1 : WideString read FaccountDimension1 write FaccountDimension1;
    property accountDimension2 : WideString read FaccountDimension2 write FaccountDimension2;
    property accountDimension3 : WideString read FaccountDimension3 write FaccountDimension3;
    property accountDimension4 : WideString read FaccountDimension4 write FaccountDimension4;
    property accountDimension5 : WideString read FaccountDimension5 write FaccountDimension5;
    property accountDimension6 : WideString read FaccountDimension6 write FaccountDimension6;
    property accountDimension7 : WideString read FaccountDimension7 write FaccountDimension7;
    property accountDimension8 : WideString read FaccountDimension8 write FaccountDimension8;
    property accountDimension9 : WideString read FaccountDimension9 write FaccountDimension9;
    property accountDimension10 : WideString read FaccountDimension10 write FaccountDimension10;
    property accountDimension11 : WideString read FaccountDimension11 write FaccountDimension11;
    property accountDimension12 : WideString read FaccountDimension12 write FaccountDimension12;
    property accountDimension13 : WideString read FaccountDimension13 write FaccountDimension13;
    property corAccountDimension1 : WideString read FcorAccountDimension1 write FcorAccountDimension1;
    property corAccountDimension2 : WideString read FcorAccountDimension2 write FcorAccountDimension2;
    property corAccountDimension3 : WideString read FcorAccountDimension3 write FcorAccountDimension3;
    property corAccountDimension4 : WideString read FcorAccountDimension4 write FcorAccountDimension4;
    property corAccountDimension5 : WideString read FcorAccountDimension5 write FcorAccountDimension5;
    property corAccountDimension6 : WideString read FcorAccountDimension6 write FcorAccountDimension6;
    property corAccountDimension7 : WideString read FcorAccountDimension7 write FcorAccountDimension7;
    property corAccountDimension8 : WideString read FcorAccountDimension8 write FcorAccountDimension8;
    property corAccountDimension9 : WideString read FcorAccountDimension9 write FcorAccountDimension9;
    property corAccountDimension10 : WideString read FcorAccountDimension10 write FcorAccountDimension10;
    property corAccountDimension11 : WideString read FcorAccountDimension11 write FcorAccountDimension11;
    property corAccountDimension12 : WideString read FcorAccountDimension12 write FcorAccountDimension12;
    property corAccountDimension13 : WideString read FcorAccountDimension13 write FcorAccountDimension13;
    property ledgerTxt : WideString read FledgerTxt write FledgerTxt;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  status : Integer read Fstatus write Fstatus;
    property errorStr : WideString read FerrorStr write FerrorStr;
    property FKTrans2AXTrans : FKTrans2AXTransRef read FFKTrans2AXTrans write FFKTrans2AXTrans;
  end;

{
  FKTrans2AXTransItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumUnFKStr : WideString;
    FpartId : Integer;
    FisPrihod : Integer;
    FtransDate : TXSDate;
    FbalCeh : WideString;
    FbalSch : WideString;
    FbalKau : WideString;
    FkorCeh : WideString;
    FkorSch : WideString;
    FkorKau : WideString;
    FamountCur : TXSDecimal;
    Fcurrency : WideString;
    FamountMST : TXSDecimal;
    FaccountNum : WideString;
    FoffsetAccountNum : WideString;
    FaccountDimension1 : WideString;
    FaccountDimension2 : WideString;
    FaccountDimension3 : WideString;
    FaccountDimension4 : WideString;
    FaccountDimension5 : WideString;
    FaccountDimension6 : WideString;
    FaccountDimension7 : WideString;
    FaccountDimension8 : WideString;
    FaccountDimension9 : WideString;
    FaccountDimension10 : WideString;
    FaccountDimension11 : WideString;
    FaccountDimension12 : WideString;
    FaccountDimension13 : WideString;
    FcorAccountDimension1 : WideString;
    FcorAccountDimension2 : WideString;
    FcorAccountDimension3 : WideString;
    FcorAccountDimension4 : WideString;
    FcorAccountDimension5 : WideString;
    FcorAccountDimension6 : WideString;
    FcorAccountDimension7 : WideString;
    FcorAccountDimension8 : WideString;
    FcorAccountDimension9 : WideString;
    FcorAccountDimension10 : WideString;
    FcorAccountDimension11 : WideString;
    FcorAccountDimension12 : WideString;
    FcorAccountDimension13 : WideString;
    FledgerTxt : WideString;
    Fvoucher : WideString;
    Fstatus : Integer;
    FerrorStr : WideString;
//???
    FFKTrans2AXTrans : FKTrans2AXTransRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numUnFKStr : WideString read FnumUnFKStr write FnumUnFKStr;
    property  partId : Integer read FpartId write FpartId;
    property  isPrihod : Integer read FisPrihod write FisPrihod;
    property transDate : TXSDate read FtransDate write FtransDate;
    property balCeh : WideString read FbalCeh write FbalCeh;
    property balSch : WideString read FbalSch write FbalSch;
    property balKau : WideString read FbalKau write FbalKau;
    property korCeh : WideString read FkorCeh write FkorCeh;
    property korSch : WideString read FkorSch write FkorSch;
    property korKau : WideString read FkorKau write FkorKau;
    property amountCur : TXSDecimal read FamountCur write FamountCur;
    property currency : WideString read Fcurrency write Fcurrency;
    property amountMST : TXSDecimal read FamountMST write FamountMST;
    property accountNum : WideString read FaccountNum write FaccountNum;
    property offsetAccountNum : WideString read FoffsetAccountNum write FoffsetAccountNum;
    property accountDimension1 : WideString read FaccountDimension1 write FaccountDimension1;
    property accountDimension2 : WideString read FaccountDimension2 write FaccountDimension2;
    property accountDimension3 : WideString read FaccountDimension3 write FaccountDimension3;
    property accountDimension4 : WideString read FaccountDimension4 write FaccountDimension4;
    property accountDimension5 : WideString read FaccountDimension5 write FaccountDimension5;
    property accountDimension6 : WideString read FaccountDimension6 write FaccountDimension6;
    property accountDimension7 : WideString read FaccountDimension7 write FaccountDimension7;
    property accountDimension8 : WideString read FaccountDimension8 write FaccountDimension8;
    property accountDimension9 : WideString read FaccountDimension9 write FaccountDimension9;
    property accountDimension10 : WideString read FaccountDimension10 write FaccountDimension10;
    property accountDimension11 : WideString read FaccountDimension11 write FaccountDimension11;
    property accountDimension12 : WideString read FaccountDimension12 write FaccountDimension12;
    property accountDimension13 : WideString read FaccountDimension13 write FaccountDimension13;
    property corAccountDimension1 : WideString read FcorAccountDimension1 write FcorAccountDimension1;
    property corAccountDimension2 : WideString read FcorAccountDimension2 write FcorAccountDimension2;
    property corAccountDimension3 : WideString read FcorAccountDimension3 write FcorAccountDimension3;
    property corAccountDimension4 : WideString read FcorAccountDimension4 write FcorAccountDimension4;
    property corAccountDimension5 : WideString read FcorAccountDimension5 write FcorAccountDimension5;
    property corAccountDimension6 : WideString read FcorAccountDimension6 write FcorAccountDimension6;
    property corAccountDimension7 : WideString read FcorAccountDimension7 write FcorAccountDimension7;
    property corAccountDimension8 : WideString read FcorAccountDimension8 write FcorAccountDimension8;
    property corAccountDimension9 : WideString read FcorAccountDimension9 write FcorAccountDimension9;
    property corAccountDimension10 : WideString read FcorAccountDimension10 write FcorAccountDimension10;
    property corAccountDimension11 : WideString read FcorAccountDimension11 write FcorAccountDimension11;
    property corAccountDimension12 : WideString read FcorAccountDimension12 write FcorAccountDimension12;
    property corAccountDimension13 : WideString read FcorAccountDimension13 write FcorAccountDimension13;
    property ledgerTxt : WideString read FledgerTxt write FledgerTxt;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  status : Integer read Fstatus write Fstatus;
    property errorStr : WideString read FerrorStr write FerrorStr;
    property FKTrans2AXTrans : FKTrans2AXTransRef read FFKTrans2AXTrans write FFKTrans2AXTrans;
  end;
}

  FKTrans2AXTransItemFilter = class(FKTrans2AXTransItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  FKTrans2AXTransItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumUnFKStr : WideString;
    FpartId : Integer;
    FisPrihod : Integer;
    FtransDate : TXSDate;
    FbalCeh : WideString;
    FbalSch : WideString;
    FbalKau : WideString;
    FkorCeh : WideString;
    FkorSch : WideString;
    FkorKau : WideString;
    FamountCur : TXSDecimal;
    Fcurrency : WideString;
    FamountMST : TXSDecimal;
    FaccountNum : WideString;
    FoffsetAccountNum : WideString;
    FaccountDimension1 : WideString;
    FaccountDimension2 : WideString;
    FaccountDimension3 : WideString;
    FaccountDimension4 : WideString;
    FaccountDimension5 : WideString;
    FaccountDimension6 : WideString;
    FaccountDimension7 : WideString;
    FaccountDimension8 : WideString;
    FaccountDimension9 : WideString;
    FaccountDimension10 : WideString;
    FaccountDimension11 : WideString;
    FaccountDimension12 : WideString;
    FaccountDimension13 : WideString;
    FcorAccountDimension1 : WideString;
    FcorAccountDimension2 : WideString;
    FcorAccountDimension3 : WideString;
    FcorAccountDimension4 : WideString;
    FcorAccountDimension5 : WideString;
    FcorAccountDimension6 : WideString;
    FcorAccountDimension7 : WideString;
    FcorAccountDimension8 : WideString;
    FcorAccountDimension9 : WideString;
    FcorAccountDimension10 : WideString;
    FcorAccountDimension11 : WideString;
    FcorAccountDimension12 : WideString;
    FcorAccountDimension13 : WideString;
    FledgerTxt : WideString;
    Fvoucher : WideString;
    Fstatus : Integer;
    FerrorStr : WideString;
    FFKTrans2AXTransCode : Integer;
    FFKTrans2AXTransMonthGen : Integer;
    FFKTrans2AXTransYearGen : Integer;
    FFKTrans2AXTransTaskOwner : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numUnFKStr : WideString read FnumUnFKStr write FnumUnFKStr;
    property  partId : Integer read FpartId write FpartId;
    property  isPrihod : Integer read FisPrihod write FisPrihod;
    property transDate : TXSDate read FtransDate write FtransDate;
    property balCeh : WideString read FbalCeh write FbalCeh;
    property balSch : WideString read FbalSch write FbalSch;
    property balKau : WideString read FbalKau write FbalKau;
    property korCeh : WideString read FkorCeh write FkorCeh;
    property korSch : WideString read FkorSch write FkorSch;
    property korKau : WideString read FkorKau write FkorKau;
    property amountCur : TXSDecimal read FamountCur write FamountCur;
    property currency : WideString read Fcurrency write Fcurrency;
    property amountMST : TXSDecimal read FamountMST write FamountMST;
    property accountNum : WideString read FaccountNum write FaccountNum;
    property offsetAccountNum : WideString read FoffsetAccountNum write FoffsetAccountNum;
    property accountDimension1 : WideString read FaccountDimension1 write FaccountDimension1;
    property accountDimension2 : WideString read FaccountDimension2 write FaccountDimension2;
    property accountDimension3 : WideString read FaccountDimension3 write FaccountDimension3;
    property accountDimension4 : WideString read FaccountDimension4 write FaccountDimension4;
    property accountDimension5 : WideString read FaccountDimension5 write FaccountDimension5;
    property accountDimension6 : WideString read FaccountDimension6 write FaccountDimension6;
    property accountDimension7 : WideString read FaccountDimension7 write FaccountDimension7;
    property accountDimension8 : WideString read FaccountDimension8 write FaccountDimension8;
    property accountDimension9 : WideString read FaccountDimension9 write FaccountDimension9;
    property accountDimension10 : WideString read FaccountDimension10 write FaccountDimension10;
    property accountDimension11 : WideString read FaccountDimension11 write FaccountDimension11;
    property accountDimension12 : WideString read FaccountDimension12 write FaccountDimension12;
    property accountDimension13 : WideString read FaccountDimension13 write FaccountDimension13;
    property corAccountDimension1 : WideString read FcorAccountDimension1 write FcorAccountDimension1;
    property corAccountDimension2 : WideString read FcorAccountDimension2 write FcorAccountDimension2;
    property corAccountDimension3 : WideString read FcorAccountDimension3 write FcorAccountDimension3;
    property corAccountDimension4 : WideString read FcorAccountDimension4 write FcorAccountDimension4;
    property corAccountDimension5 : WideString read FcorAccountDimension5 write FcorAccountDimension5;
    property corAccountDimension6 : WideString read FcorAccountDimension6 write FcorAccountDimension6;
    property corAccountDimension7 : WideString read FcorAccountDimension7 write FcorAccountDimension7;
    property corAccountDimension8 : WideString read FcorAccountDimension8 write FcorAccountDimension8;
    property corAccountDimension9 : WideString read FcorAccountDimension9 write FcorAccountDimension9;
    property corAccountDimension10 : WideString read FcorAccountDimension10 write FcorAccountDimension10;
    property corAccountDimension11 : WideString read FcorAccountDimension11 write FcorAccountDimension11;
    property corAccountDimension12 : WideString read FcorAccountDimension12 write FcorAccountDimension12;
    property corAccountDimension13 : WideString read FcorAccountDimension13 write FcorAccountDimension13;
    property ledgerTxt : WideString read FledgerTxt write FledgerTxt;
    property voucher : WideString read Fvoucher write Fvoucher;
    property  status : Integer read Fstatus write Fstatus;
    property errorStr : WideString read FerrorStr write FerrorStr;

    property FKTrans2AXTransCode : Integer read FFKTrans2AXTransCode write FFKTrans2AXTransCode;
    property FKTrans2AXTransMonthGen : Integer read FFKTrans2AXTransMonthGen write FFKTrans2AXTransMonthGen;
    property FKTrans2AXTransYearGen : Integer read FFKTrans2AXTransYearGen write FFKTrans2AXTransYearGen;
    property FKTrans2AXTransTaskOwner : WideString read FFKTrans2AXTransTaskOwner write FFKTrans2AXTransTaskOwner;
  end;

  ArrayOfFKTrans2AXTransItemShort = array of FKTrans2AXTransItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  FKTrans2AXTransItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfFKTrans2AXTransItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfFKTrans2AXTransItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/FKTrans2AXTransItemController/message/
  // soapAction: http://ksoe.org/FKTrans2AXTransItemController/action/FKTrans2AXTransItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : FKTrans2AXTransItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : FKTrans2AXTransItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  FKTrans2AXTransItemControllerSoapPort = interface(IInvokable)
  ['{E937F068-31E8-4573-A741-B29D04D42DD0}']
    function add(const aFKTrans2AXTransItem: FKTrans2AXTransItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aFKTrans2AXTransItem: FKTrans2AXTransItem); stdcall;
    function getObject(const anObjectCode: Integer): FKTrans2AXTransItem; stdcall;
    function getList: FKTrans2AXTransItemShortList; stdcall;
    function getFilteredList(const aFKTrans2AXTransItemFilter: FKTrans2AXTransItemFilter): FKTrans2AXTransItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransItemShortList; stdcall;
    function getScrollableFilteredList(const aFKTrans2AXTransItemFilter: FKTrans2AXTransItemFilter; const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aFKTrans2AXTransItemFilter: FKTrans2AXTransItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): FKTrans2AXTransItemShort; stdcall;

    function getScrollableFilteredListGroup(const aFKTrans2AXTransItemFilter: FKTrans2AXTransItemFilter; const aFromPosition: Integer; const aQuantity: Integer): FKTrans2AXTransItemShortList; stdcall;

    procedure makeDimensionAX( const transCode : Integer ; const transDate : String ); stdcall;

    procedure moveTrans2AX( const transCode : Integer ; const transDate : String ); stdcall;
    procedure exportTrans2AX( const transCode : Integer ; const transDate : String ); stdcall;

  end;


implementation

  destructor FKTrans2AXTransItem.Destroy;
  begin
    if Assigned(FtransDate) then
      transDate.Free;
    if Assigned(FamountCur) then
      amountCur.Free;
    if Assigned(FamountMST) then
      amountMST.Free;
    if Assigned(FFKTrans2AXTrans) then
      FKTrans2AXTrans.Free;
    inherited Destroy;
  end;

{
  destructor FKTrans2AXTransItemFilter.Destroy;
  begin
    if Assigned(FtransDate) then
      transDate.Free;
    if Assigned(FamountCur) then
      amountCur.Free;
    if Assigned(FamountMST) then
      amountMST.Free;
    if Assigned(FFKTrans2AXTrans) then
      FKTrans2AXTrans.Free;
    inherited Destroy;
  end;
}

  destructor FKTrans2AXTransItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor FKTrans2AXTransItemShort.Destroy;
  begin
    if Assigned(FtransDate) then
      transDate.Free;
    if Assigned(FamountCur) then
      amountCur.Free;
    if Assigned(FamountMST) then
      amountMST.Free;
    inherited Destroy;
  end;

  destructor FKTrans2AXTransItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(FKTrans2AXTransItem, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransItem');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransItemRef');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransItemFilter');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransItemShort');
  RemClassRegistry.RegisterXSClass(FKTrans2AXTransItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'FKTrans2AXTransItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfFKTrans2AXTransItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfFKTrans2AXTransItemShort');

  InvRegistry.RegisterInterface(TypeInfo(FKTrans2AXTransItemControllerSoapPort), 'http://ksoe.org/FKTrans2AXTransItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(FKTrans2AXTransItemControllerSoapPort), 'http://ksoe.org/FKTrans2AXTransItemController/action/FKTrans2AXTransItemController.%operationName%');


end.
