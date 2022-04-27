unit RQPItem2BItem2OItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQPayDocItemController 
   ,RQBillItemController 
   ,RQOrderItemController 
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

  RQPItem2BItem2OItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPItem2BItem2OItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPItem2BItem2OItem = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FpayDocItem : RQPayDocItem;
//???
    FbillItem : RQBillItem;
//???
    ForderItem : RQOrderItem;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property payDocItem : RQPayDocItem read FpayDocItem write FpayDocItem; 
    property billItem : RQBillItem read FbillItem write FbillItem; 
    property orderItem : RQOrderItem read ForderItem write ForderItem; 
  end;
  
{
  RQPItem2BItem2OItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FpayDocItem : RQPayDocItem;
//???
    FbillItem : RQBillItem;
//???
    ForderItem : RQOrderItem;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property payDocItem : RQPayDocItem read FpayDocItem write FpayDocItem; 
    property billItem : RQBillItem read FbillItem write FbillItem; 
    property orderItem : RQOrderItem read ForderItem write ForderItem; 
  end;
}

  RQPItem2BItem2OItemFilter = class(RQPItem2BItem2OItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQPItem2BItem2OItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsummaGen : TXSDecimal;
    FpayDocItemCode : Integer; 
    FbillItemCode : Integer; 
    ForderItemCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property summaGen : TXSDecimal read FsummaGen write FsummaGen; 

    property payDocItemCode : Integer read FpayDocItemCode write FpayDocItemCode; //RQPayDocItemRef read FpayDocItemCode write FpayDocItemCode; 
    property billItemCode : Integer read FbillItemCode write FbillItemCode; //RQBillItemRef read FbillItemCode write FbillItemCode; 
    property orderItemCode : Integer read ForderItemCode write ForderItemCode; //RQOrderItemRef read ForderItemCode write ForderItemCode; 
  end;

  ArrayOfRQPItem2BItem2OItemShort = array of RQPItem2BItem2OItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPItem2BItem2OItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPItem2BItem2OItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPItem2BItem2OItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPItem2BItem2OItemController/message/
  // soapAction: http://ksoe.org/RQPItem2BItem2OItemController/action/RQPItem2BItem2OItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPItem2BItem2OItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPItem2BItem2OItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPItem2BItem2OItemControllerSoapPort = interface(IInvokable)
  ['{f38cf38c-f38c-f38c-f38c-f38cf38cf38c}']
    function  add(const aRQPItem2BItem2OItem: RQPItem2BItem2OItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPItem2BItem2OItem: RQPItem2BItem2OItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQPItem2BItem2OItem; stdcall;
    function  getList: RQPItem2BItem2OItemShortList; stdcall;
    function  getFilteredList(const aRQPItem2BItem2OItemFilter: RQPItem2BItem2OItemFilter): RQPItem2BItem2OItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPItem2BItem2OItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQPItem2BItem2OItemFilter: RQPItem2BItem2OItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPItem2BItem2OItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPItem2BItem2OItemShortList; stdcall;
  end; 


implementation

  destructor RQPItem2BItem2OItem.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FpayDocItem) then
      payDocItem.Free;
    if Assigned(FbillItem) then
      billItem.Free;
    if Assigned(ForderItem) then
      orderItem.Free;
    inherited Destroy;
  end;

{  
  destructor RQPItem2BItem2OItemFilter.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    if Assigned(FpayDocItem) then
      payDocItem.Free;
    if Assigned(FbillItem) then
      billItem.Free;
    if Assigned(ForderItem) then
      orderItem.Free;
    inherited Destroy;
  end; 
}

  destructor RQPItem2BItem2OItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQPItem2BItem2OItemShort.Destroy;
  begin
    if Assigned(FsummaGen) then
      summaGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQPItem2BItem2OItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPItem2BItem2OItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPItem2BItem2OItem');
  RemClassRegistry.RegisterXSClass(RQPItem2BItem2OItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPItem2BItem2OItemRef');
  RemClassRegistry.RegisterXSClass(RQPItem2BItem2OItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPItem2BItem2OItemFilter');
  RemClassRegistry.RegisterXSClass(RQPItem2BItem2OItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPItem2BItem2OItemShort');
  RemClassRegistry.RegisterXSClass(RQPItem2BItem2OItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPItem2BItem2OItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPItem2BItem2OItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPItem2BItem2OItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPItem2BItem2OItemControllerSoapPort), 'http://ksoe.org/RQPItem2BItem2OItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPItem2BItem2OItemControllerSoapPort), 'http://ksoe.org/RQPItem2BItem2OItemController/action/RQPItem2BItem2OItemController.%operationName%');


end.
