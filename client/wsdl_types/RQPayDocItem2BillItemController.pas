unit RQPayDocItem2BillItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQBillItemController
   ,RQPayDocItemController
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

  RQPayDocItem2BillItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDocItem2BillItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPayDocItem2BillItem = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FsummaFact : TXSDecimal;
    Fmodify_time : Int64;
//???
    Fbillitem : RQBillItem;
//???
    Fpaydocitem : RQPayDocItem;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaFact : TXSDecimal read FsummaFact write FsummaFact;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property billitem : RQBillItem read Fbillitem write Fbillitem;
    property paydocitem : RQPayDocItem read Fpaydocitem write Fpaydocitem;
  end;

{
  RQPayDocItem2BillItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FsummaFact : TXSDecimal;
    Fmodify_time : Int64;
//???
    Fbillitem : RQBillItem;
//???
    Fpaydocitem : RQPayDocItem;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaFact : TXSDecimal read FsummaFact write FsummaFact;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property billitem : RQBillItem read Fbillitem write Fbillitem;
    property paydocitem : RQPayDocItem read Fpaydocitem write Fpaydocitem;
  end;
}

  RQPayDocItem2BillItemFilter = class(RQPayDocItem2BillItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPayDocItem2BillItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FsummaGen : TXSDecimal;
    FsummaFact : TXSDecimal;
    FbillitemCode : Integer;
    FbillitemCountGen : TXSDecimal;
    FbillitemMaterialNameTxt : WideString;
    FbillitemMeasurementNameTxt : WideString;
    FbillitemCountFact : TXSDecimal;
    FbillitemPriceWithoutNds : TXSDecimal;
    FbillitemPriceWithNds : TXSDecimal;
    FbillitemNds : TXSDecimal;
    FbillitemSumWithoutNds : TXSDecimal;
    FbillitemSumNds : TXSDecimal;
    FbillitemSumGen : TXSDecimal;
    FbillitemCommentGen : WideString;
    FbillitemDdsCodesTxt : WideString;
    FbillitemContractNumber : WideString;
    FbillitemFinDocCode : WideString;
    FbillitemFinDocId : Integer;
    FbillitemUserGen : WideString;
    FpaydocitemCode : Integer;
    FpaydocitemSummaGen : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property summaGen : TXSDecimal read FsummaGen write FsummaGen;
    property summaFact : TXSDecimal read FsummaFact write FsummaFact;

    property billitemCode : Integer read FbillitemCode write FbillitemCode;
    property billitemCountGen : TXSDecimal read FbillitemCountGen write FbillitemCountGen;
    property billitemMaterialNameTxt : WideString read FbillitemMaterialNameTxt write FbillitemMaterialNameTxt;
    property billitemMeasurementNameTxt : WideString read FbillitemMeasurementNameTxt write FbillitemMeasurementNameTxt;
    property billitemCountFact : TXSDecimal read FbillitemCountFact write FbillitemCountFact;
    property billitemPriceWithoutNds : TXSDecimal read FbillitemPriceWithoutNds write FbillitemPriceWithoutNds;
    property billitemPriceWithNds : TXSDecimal read FbillitemPriceWithNds write FbillitemPriceWithNds;
    property billitemNds : TXSDecimal read FbillitemNds write FbillitemNds;
    property billitemSumWithoutNds : TXSDecimal read FbillitemSumWithoutNds write FbillitemSumWithoutNds;
    property billitemSumNds : TXSDecimal read FbillitemSumNds write FbillitemSumNds;
    property billitemSumGen : TXSDecimal read FbillitemSumGen write FbillitemSumGen;
    property billitemCommentGen : WideString read FbillitemCommentGen write FbillitemCommentGen;
    property billitemDdsCodesTxt : WideString read FbillitemDdsCodesTxt write FbillitemDdsCodesTxt;
    property billitemContractNumber : WideString read FbillitemContractNumber write FbillitemContractNumber;
    property billitemFinDocCode : WideString read FbillitemFinDocCode write FbillitemFinDocCode;
    property billitemFinDocId : Integer read FbillitemFinDocId write FbillitemFinDocId;
    property billitemUserGen : WideString read FbillitemUserGen write FbillitemUserGen;
    property paydocitemCode : Integer read FpaydocitemCode write FpaydocitemCode;
    property paydocitemSummaGen : TXSDecimal read FpaydocitemSummaGen write FpaydocitemSummaGen;
  end;

  ArrayOfRQPayDocItem2BillItemShort = array of RQPayDocItem2BillItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPayDocItem2BillItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPayDocItem2BillItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPayDocItem2BillItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPayDocItem2BillItemController/message/
  // soapAction: http://ksoe.org/RQPayDocItem2BillItemController/action/RQPayDocItem2BillItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPayDocItem2BillItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPayDocItem2BillItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPayDocItem2BillItemControllerSoapPort = interface(IInvokable)
  ['{E2A1DDAA-97DB-4804-803F-826C165092E0}']
    function add(const aRQPayDocItem2BillItem: RQPayDocItem2BillItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPayDocItem2BillItem: RQPayDocItem2BillItem); stdcall;
    function getObject(const anObjectCode: Integer): RQPayDocItem2BillItem; stdcall;
    function getList: RQPayDocItem2BillItemShortList; stdcall;
    function getFilteredList(const aRQPayDocItem2BillItemFilter: RQPayDocItem2BillItemFilter): RQPayDocItem2BillItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItem2BillItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPayDocItem2BillItemFilter: RQPayDocItem2BillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItem2BillItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPayDocItem2BillItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPayDocItem2BillItemFilter: RQPayDocItem2BillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPayDocItem2BillItemShort; stdcall;
  end;


implementation

  destructor RQPayDocItem2BillItem.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaFact) then
      summaFact.Free;
    if Assigned(Fbillitem) then
      billitem.Free;
    if Assigned(Fpaydocitem) then
      paydocitem.Free;
    inherited Destroy;
  end;

{
  destructor RQPayDocItem2BillItemFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaFact) then
      summaFact.Free;
    if Assigned(Fbillitem) then
      billitem.Free;
    if Assigned(Fpaydocitem) then
      paydocitem.Free;
    inherited Destroy;
  end;
}

  destructor RQPayDocItem2BillItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPayDocItem2BillItemShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FsummaFact) then
      summaFact.Free;
    if Assigned(FbillitemCountGen) then
      billitemCountGen.Free;
    if Assigned(FbillitemCountFact) then
      billitemCountFact.Free;
    if Assigned(FbillitemPriceWithoutNds) then
      billitemPriceWithoutNds.Free;
    if Assigned(FbillitemPriceWithNds) then
      billitemPriceWithNds.Free;
    if Assigned(FbillitemNds) then
      billitemNds.Free;
    if Assigned(FbillitemSumWithoutNds) then
      billitemSumWithoutNds.Free;
    if Assigned(FbillitemSumNds) then
      billitemSumNds.Free;
    if Assigned(FbillitemSumGen) then
      billitemSumGen.Free;
    if Assigned(FpaydocitemSummaGen) then
      paydocitemSummaGen.Free;
    inherited Destroy;
  end;

  destructor RQPayDocItem2BillItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPayDocItem2BillItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem2BillItem');
  RemClassRegistry.RegisterXSClass(RQPayDocItem2BillItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem2BillItemRef');
  RemClassRegistry.RegisterXSClass(RQPayDocItem2BillItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem2BillItemFilter');
  RemClassRegistry.RegisterXSClass(RQPayDocItem2BillItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem2BillItemShort');
  RemClassRegistry.RegisterXSClass(RQPayDocItem2BillItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPayDocItem2BillItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPayDocItem2BillItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPayDocItem2BillItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPayDocItem2BillItemControllerSoapPort), 'http://ksoe.org/RQPayDocItem2BillItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPayDocItem2BillItemControllerSoapPort), 'http://ksoe.org/RQPayDocItem2BillItemController/action/RQPayDocItem2BillItemController.%operationName%');


end.
