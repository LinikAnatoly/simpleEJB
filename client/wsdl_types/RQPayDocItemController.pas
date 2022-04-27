unit RQPayDocItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQBillItemController 
   ,RQPayDocController 
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

  RQPayDocItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDocItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDocItem = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    FpayDocRef : RQPayDocRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef; 
    property payDocRef : RQPayDocRef read FpayDocRef write FpayDocRef; 
  end;

  RQPayDocItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    FpayDocRef : RQPayDocRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef; 
    property payDocRef : RQPayDocRef read FpayDocRef write FpayDocRef; 
  end;


  RQPayDocItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    FbillItemRefCode : Integer; 
    FbillItemRefCountGen : TXSDecimal;
    FbillItemRefMaterialName : WideString;
    FbillItemRefMeasurementName : WideString;
    FbillItemRefCountFact : TXSDecimal;
    FbillItemRefPriceWithoutNds : TXSDecimal;
    FbillItemRefNds : TXSDecimal;
    FbillItemRefSumWithoutNds : TXSDecimal;
    FbillItemRefSumNds : TXSDecimal;
    FbillItemRefSumGen : TXSDecimal;
    FbillItemRefCommentGen : WideString;
    FbillItemRefUserGen : WideString;
    FpayDocRefCode : Integer; 
    FpayDocRefSummaGen : TXSDecimal;
    FpayDocRefNumberGen : WideString;
    FpayDocRefDateGen : TXSDate;
    FpayDocRefPayOrder : WideString;
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FbillitemsumGen : TXSDecimal;
    FbillitemsumNDS : TXSDecimal;
    FcountFact : TXSDecimal;
    FsummaFact : TXSDecimal;
    Fcode1 : Integer;
    FbillItemSummaGen : TXSDecimal;
    FbillItemSumWithNds : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;

    property billItemRefCode : Integer read FbillItemRefCode write FbillItemRefCode;
    property billItemRefCountGen : TXSDecimal read FbillItemRefCountGen write FbillItemRefCountGen;
    property billItemRefMaterialName : WideString read FbillItemRefMaterialName write FbillItemRefMaterialName;
    property billItemRefMeasurementName : WideString read FbillItemRefMeasurementName write FbillItemRefMeasurementName;
    property billItemRefCountFact : TXSDecimal read FbillItemRefCountFact write FbillItemRefCountFact;
    property billItemRefPriceWithoutNds : TXSDecimal read FbillItemRefPriceWithoutNds write FbillItemRefPriceWithoutNds; 
    property billItemRefNds : TXSDecimal read FbillItemRefNds write FbillItemRefNds; 
    property billItemRefSumWithoutNds : TXSDecimal read FbillItemRefSumWithoutNds write FbillItemRefSumWithoutNds; 
    property billItemRefSumNds : TXSDecimal read FbillItemRefSumNds write FbillItemRefSumNds; 
    property billItemRefSumGen : TXSDecimal read FbillItemRefSumGen write FbillItemRefSumGen; 
    property billItemRefCommentGen : WideString read FbillItemRefCommentGen write FbillItemRefCommentGen; 
    property billItemRefUserGen : WideString read FbillItemRefUserGen write FbillItemRefUserGen; 
    property payDocRefCode : Integer read FpayDocRefCode write FpayDocRefCode; 
    property payDocRefSummaGen : TXSDecimal read FpayDocRefSummaGen write FpayDocRefSummaGen; 
    property payDocRefNumberGen : WideString read FpayDocRefNumberGen write FpayDocRefNumberGen; 
    property payDocRefDateGen : TXSDate read FpayDocRefDateGen write FpayDocRefDateGen; 
    property payDocRefPayOrder : WideString read FpayDocRefPayOrder write FpayDocRefPayOrder;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property billitemsumGen : TXSDecimal read FbillitemsumGen write FbillitemsumGen;
    property billItemSummaGen : TXSDecimal read FbillItemSummaGen write FbillItemSummaGen;
    property billItemSumWithNds : TXSDecimal read FbillItemSumWithNds write FbillItemSumWithNds;
    property billitemsumNDS : TXSDecimal read FbillitemsumNDS write FbillitemsumNDS;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property summaFact : TXSDecimal read FsummaFact write FsummaFact;
    property  code1 : Integer read Fcode1 write Fcode1;
  end;

  ArrayOfRQPayDocItemShort = array of RQPayDocItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPayDocItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPayDocItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPayDocItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPayDocItemController/message/
  // soapAction: http://ksoe.org/RQPayDocItemController/action/RQPayDocItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPayDocItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPayDocItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPayDocItemControllerSoapPort = interface(IInvokable)
  ['{45224522-4522-4522-4522-452245224522}']
    function  add(const aRQPayDocItem: RQPayDocItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPayDocItem: RQPayDocItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQPayDocItem; stdcall;
    function  getList: RQPayDocItemShortList; stdcall;
    function  getFilteredList(const aRQPayDocItemFilter: RQPayDocItemFilter): RQPayDocItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQPayDocItemFilter: RQPayDocItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItemShortList; stdcall;
    function  addPayDocItemList(const RQPayDocItem: RQPayDocItem; const summaGen: TXSDecimal; const billItemCode: Integer; const payDocItemCode: Integer; const isServer: Boolean) : Integer; stdcall;
  end; 


implementation

  destructor RQPayDocItem.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(FpayDocRef) then
      payDocRef.Free;
    inherited Destroy;
  end;
  
  destructor RQPayDocItemFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(FpayDocRef) then
      payDocRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQPayDocItemShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FbillItemRefCountGen) then
      billItemRefCountGen.Free;
    if Assigned(FbillItemRefCountFact) then
      billItemRefCountFact.Free;
    if Assigned(FbillItemRefPriceWithoutNds) then
      billItemRefPriceWithoutNds.Free;
    if Assigned(FbillItemRefNds) then
      billItemRefNds.Free;
    if Assigned(FbillItemRefSumWithoutNds) then
      billItemRefSumWithoutNds.Free;
    if Assigned(FbillItemRefSumNds) then
      billItemRefSumNds.Free;
    if Assigned(FbillItemRefSumGen) then
      billItemRefSumGen.Free;
    if Assigned(FpayDocRefSummaGen) then
      payDocRefSummaGen.Free;
    if Assigned(FpayDocRefDateGen) then
      payDocRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQPayDocItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPayDocItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem');
  RemClassRegistry.RegisterXSClass(RQPayDocItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItemRef');
  RemClassRegistry.RegisterXSClass(RQPayDocItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItemFilter');
  RemClassRegistry.RegisterXSClass(RQPayDocItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItemShort');
  RemClassRegistry.RegisterXSClass(RQPayDocItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPayDocItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPayDocItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPayDocItemControllerSoapPort), 'http://ksoe.org/RQPayDocItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPayDocItemControllerSoapPort), 'http://ksoe.org/RQPayDocItemController/action/RQPayDocItemController.%operationName%');


end.
