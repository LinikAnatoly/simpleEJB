unit RQBillItem2OrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
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

  RQBillItem2OrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2OrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBillItem2OrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    ForderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef; 
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef; 
  end;

  RQBillItem2OrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    ForderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef; 
    property orderItemRef : RQOrderItemRef read ForderItemRef write ForderItemRef; 
  end;


  RQBillItem2OrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FbillItemRefCode : Integer; 
    FbillItemRefCountGen : TXSDecimal;
    FbillItemRefMaterialNameTxt : WideString;
    FbillItemRefMeasurementNameTxt : WideString;
    FbillItemRefCountFact : TXSDecimal;
    FbillItemRefPriceWithoutNds : TXSDecimal;
    FbillItemRefNds : TXSDecimal;
    FbillItemRefSumWithoutNds : TXSDecimal;
    FbillItemRefSumNds : TXSDecimal;
    FbillItemRefSumGen : TXSDecimal;
    FbillItemRefCommentGen : WideString;
    FbillItemRefUserGen : WideString;
    ForderItemRefCode : Integer; 
    ForderItemRefCountGen : TXSDecimal;
    ForderItemRefMaterialNameTxt : WideString;
    ForderItemRefMeasurementNameTxt : WideString;
    ForderItemRefCountFact : TXSDecimal;
    ForderItemRefPriceWithoutNds : TXSDecimal;
    ForderItemRefNds : TXSDecimal;
    ForderItemRefSumWithoutNds : TXSDecimal;
    ForderItemRefSumNds : TXSDecimal;
    ForderItemRefSumGen : TXSDecimal;
    ForderItemRefCommentGen : WideString;
    ForderItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property billItemRefCode : Integer read FbillItemRefCode write FbillItemRefCode; 
    property billItemRefCountGen : TXSDecimal read FbillItemRefCountGen write FbillItemRefCountGen; 
    property billItemRefMaterialNameTxt : WideString read FbillItemRefMaterialNameTxt write FbillItemRefMaterialNameTxt; 
    property billItemRefMeasurementNameTxt : WideString read FbillItemRefMeasurementNameTxt write FbillItemRefMeasurementNameTxt; 
    property billItemRefCountFact : TXSDecimal read FbillItemRefCountFact write FbillItemRefCountFact; 
    property billItemRefPriceWithoutNds : TXSDecimal read FbillItemRefPriceWithoutNds write FbillItemRefPriceWithoutNds; 
    property billItemRefNds : TXSDecimal read FbillItemRefNds write FbillItemRefNds; 
    property billItemRefSumWithoutNds : TXSDecimal read FbillItemRefSumWithoutNds write FbillItemRefSumWithoutNds; 
    property billItemRefSumNds : TXSDecimal read FbillItemRefSumNds write FbillItemRefSumNds; 
    property billItemRefSumGen : TXSDecimal read FbillItemRefSumGen write FbillItemRefSumGen; 
    property billItemRefCommentGen : WideString read FbillItemRefCommentGen write FbillItemRefCommentGen; 
    property billItemRefUserGen : WideString read FbillItemRefUserGen write FbillItemRefUserGen; 
    property orderItemRefCode : Integer read ForderItemRefCode write ForderItemRefCode; 
    property orderItemRefCountGen : TXSDecimal read ForderItemRefCountGen write ForderItemRefCountGen; 
    property orderItemRefMaterialNameTxt : WideString read ForderItemRefMaterialNameTxt write ForderItemRefMaterialNameTxt; 
    property orderItemRefMeasurementNameTxt : WideString read ForderItemRefMeasurementNameTxt write ForderItemRefMeasurementNameTxt; 
    property orderItemRefCountFact : TXSDecimal read ForderItemRefCountFact write ForderItemRefCountFact; 
    property orderItemRefPriceWithoutNds : TXSDecimal read ForderItemRefPriceWithoutNds write ForderItemRefPriceWithoutNds; 
    property orderItemRefNds : TXSDecimal read ForderItemRefNds write ForderItemRefNds; 
    property orderItemRefSumWithoutNds : TXSDecimal read ForderItemRefSumWithoutNds write ForderItemRefSumWithoutNds; 
    property orderItemRefSumNds : TXSDecimal read ForderItemRefSumNds write ForderItemRefSumNds; 
    property orderItemRefSumGen : TXSDecimal read ForderItemRefSumGen write ForderItemRefSumGen; 
    property orderItemRefCommentGen : WideString read ForderItemRefCommentGen write ForderItemRefCommentGen; 
    property orderItemRefUserGen : WideString read ForderItemRefUserGen write ForderItemRefUserGen; 
  end;

  ArrayOfRQBillItem2OrderItemShort = array of RQBillItem2OrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBillItem2OrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBillItem2OrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBillItem2OrderItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBillItem2OrderItemController/message/
  // soapAction: http://ksoe.org/RQBillItem2OrderItemController/action/RQBillItem2OrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBillItem2OrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBillItem2OrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBillItem2OrderItemControllerSoapPort = interface(IInvokable)
  ['{1b811b81-1b81-1b81-1b81-1b811b811b81}']
    function  add(const aRQBillItem2OrderItem: RQBillItem2OrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQBillItem2OrderItem: RQBillItem2OrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQBillItem2OrderItem; stdcall;
    function  getList: RQBillItem2OrderItemShortList; stdcall;
    function  getFilteredList(const aRQBillItem2OrderItemFilter: RQBillItem2OrderItemFilter): RQBillItem2OrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2OrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQBillItem2OrderItemFilter: RQBillItem2OrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2OrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBillItem2OrderItemShortList; stdcall;
  end; 


implementation

  destructor RQBillItem2OrderItem.Destroy;
  begin
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    inherited Destroy;
  end;
  
  destructor RQBillItem2OrderItemFilter.Destroy;
  begin
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(ForderItemRef) then
      orderItemRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQBillItem2OrderItemShort.Destroy;
  begin
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
    if Assigned(ForderItemRefCountGen) then
      orderItemRefCountGen.Free;
    if Assigned(ForderItemRefCountFact) then
      orderItemRefCountFact.Free;
    if Assigned(ForderItemRefPriceWithoutNds) then
      orderItemRefPriceWithoutNds.Free;
    if Assigned(ForderItemRefNds) then
      orderItemRefNds.Free;
    if Assigned(ForderItemRefSumWithoutNds) then
      orderItemRefSumWithoutNds.Free;
    if Assigned(ForderItemRefSumNds) then
      orderItemRefSumNds.Free;
    if Assigned(ForderItemRefSumGen) then
      orderItemRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQBillItem2OrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBillItem2OrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2OrderItem');
  RemClassRegistry.RegisterXSClass(RQBillItem2OrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2OrderItemRef');
  RemClassRegistry.RegisterXSClass(RQBillItem2OrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2OrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQBillItem2OrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2OrderItemShort');
  RemClassRegistry.RegisterXSClass(RQBillItem2OrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBillItem2OrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBillItem2OrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBillItem2OrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBillItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQBillItem2OrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBillItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQBillItem2OrderItemController/action/RQBillItem2OrderItemController.%operationName%');


end.
