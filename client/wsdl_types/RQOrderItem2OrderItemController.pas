unit RQOrderItem2OrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQOrderItemController 
   //,RQOrderItemController 
   ,RQOrderItem2OrderItemTypeController 
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

  RQOrderItem2OrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2OrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQOrderItem2OrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    ForderItemInRef : RQOrderItemRef;
//???
    ForderItemOutRef : RQOrderItemRef;
//???
    FtypeRef : RQOrderItem2OrderItemTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property orderItemInRef : RQOrderItemRef read ForderItemInRef write ForderItemInRef; 
    property orderItemOutRef : RQOrderItemRef read ForderItemOutRef write ForderItemOutRef; 
    property typeRef : RQOrderItem2OrderItemTypeRef read FtypeRef write FtypeRef; 
  end;

  RQOrderItem2OrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    ForderItemInRef : RQOrderItemRef;
//???
    ForderItemOutRef : RQOrderItemRef;
//???
    FtypeRef : RQOrderItem2OrderItemTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property orderItemInRef : RQOrderItemRef read ForderItemInRef write ForderItemInRef; 
    property orderItemOutRef : RQOrderItemRef read ForderItemOutRef write ForderItemOutRef; 
    property typeRef : RQOrderItem2OrderItemTypeRef read FtypeRef write FtypeRef; 
  end;


  RQOrderItem2OrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    ForderItemInRefCode : Integer; 
    ForderItemInRefCountGen : TXSDecimal;
    ForderItemInRefMaterialNameTxt : WideString;
    ForderItemInRefMeasurementNameTxt : WideString;
    ForderItemInRefCountFact : TXSDecimal;
    ForderItemInRefPriceWithoutNds : TXSDecimal;
    ForderItemInRefNds : TXSDecimal;
    ForderItemInRefPriceWithNds : TXSDecimal;
    ForderItemInRefSumWithoutNds : TXSDecimal;
    ForderItemInRefSumNds : TXSDecimal;
    ForderItemInRefSumGen : TXSDecimal;
    ForderItemInRefCommentGen : WideString;
    ForderItemInRefUserGen : WideString;
    ForderItemOutRefCode : Integer; 
    ForderItemOutRefCountGen : TXSDecimal;
    ForderItemOutRefMaterialNameTxt : WideString;
    ForderItemOutRefMeasurementNameTxt : WideString;
    ForderItemOutRefCountFact : TXSDecimal;
    ForderItemOutRefPriceWithoutNds : TXSDecimal;
    ForderItemOutRefNds : TXSDecimal;
    ForderItemOutRefPriceWithNds : TXSDecimal;
    ForderItemOutRefSumWithoutNds : TXSDecimal;
    ForderItemOutRefSumNds : TXSDecimal;
    ForderItemOutRefSumGen : TXSDecimal;
    ForderItemOutRefCommentGen : WideString;
    ForderItemOutRefUserGen : WideString;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property orderItemInRefCode : Integer read ForderItemInRefCode write ForderItemInRefCode; 
    property orderItemInRefCountGen : TXSDecimal read ForderItemInRefCountGen write ForderItemInRefCountGen; 
    property orderItemInRefMaterialNameTxt : WideString read ForderItemInRefMaterialNameTxt write ForderItemInRefMaterialNameTxt; 
    property orderItemInRefMeasurementNameTxt : WideString read ForderItemInRefMeasurementNameTxt write ForderItemInRefMeasurementNameTxt; 
    property orderItemInRefCountFact : TXSDecimal read ForderItemInRefCountFact write ForderItemInRefCountFact; 
    property orderItemInRefPriceWithoutNds : TXSDecimal read ForderItemInRefPriceWithoutNds write ForderItemInRefPriceWithoutNds; 
    property orderItemInRefNds : TXSDecimal read ForderItemInRefNds write ForderItemInRefNds; 
    property orderItemInRefPriceWithNds : TXSDecimal read ForderItemInRefPriceWithNds write ForderItemInRefPriceWithNds; 
    property orderItemInRefSumWithoutNds : TXSDecimal read ForderItemInRefSumWithoutNds write ForderItemInRefSumWithoutNds; 
    property orderItemInRefSumNds : TXSDecimal read ForderItemInRefSumNds write ForderItemInRefSumNds; 
    property orderItemInRefSumGen : TXSDecimal read ForderItemInRefSumGen write ForderItemInRefSumGen; 
    property orderItemInRefCommentGen : WideString read ForderItemInRefCommentGen write ForderItemInRefCommentGen; 
    property orderItemInRefUserGen : WideString read ForderItemInRefUserGen write ForderItemInRefUserGen; 
    property orderItemOutRefCode : Integer read ForderItemOutRefCode write ForderItemOutRefCode; 
    property orderItemOutRefCountGen : TXSDecimal read ForderItemOutRefCountGen write ForderItemOutRefCountGen; 
    property orderItemOutRefMaterialNameTxt : WideString read ForderItemOutRefMaterialNameTxt write ForderItemOutRefMaterialNameTxt; 
    property orderItemOutRefMeasurementNameTxt : WideString read ForderItemOutRefMeasurementNameTxt write ForderItemOutRefMeasurementNameTxt; 
    property orderItemOutRefCountFact : TXSDecimal read ForderItemOutRefCountFact write ForderItemOutRefCountFact; 
    property orderItemOutRefPriceWithoutNds : TXSDecimal read ForderItemOutRefPriceWithoutNds write ForderItemOutRefPriceWithoutNds; 
    property orderItemOutRefNds : TXSDecimal read ForderItemOutRefNds write ForderItemOutRefNds; 
    property orderItemOutRefPriceWithNds : TXSDecimal read ForderItemOutRefPriceWithNds write ForderItemOutRefPriceWithNds; 
    property orderItemOutRefSumWithoutNds : TXSDecimal read ForderItemOutRefSumWithoutNds write ForderItemOutRefSumWithoutNds; 
    property orderItemOutRefSumNds : TXSDecimal read ForderItemOutRefSumNds write ForderItemOutRefSumNds; 
    property orderItemOutRefSumGen : TXSDecimal read ForderItemOutRefSumGen write ForderItemOutRefSumGen; 
    property orderItemOutRefCommentGen : WideString read ForderItemOutRefCommentGen write ForderItemOutRefCommentGen; 
    property orderItemOutRefUserGen : WideString read ForderItemOutRefUserGen write ForderItemOutRefUserGen; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfRQOrderItem2OrderItemShort = array of RQOrderItem2OrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQOrderItem2OrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQOrderItem2OrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQOrderItem2OrderItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQOrderItem2OrderItemController/message/
  // soapAction: http://ksoe.org/RQOrderItem2OrderItemController/action/RQOrderItem2OrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQOrderItem2OrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQOrderItem2OrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQOrderItem2OrderItemControllerSoapPort = interface(IInvokable)
  ['{1ddf1ddf-1ddf-1ddf-1ddf-1ddf1ddf1ddf}']
    function  add(const aRQOrderItem2OrderItem: RQOrderItem2OrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQOrderItem2OrderItem: RQOrderItem2OrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQOrderItem2OrderItem; stdcall;
    function  getList: RQOrderItem2OrderItemShortList; stdcall;
    function  getFilteredList(const aRQOrderItem2OrderItemFilter: RQOrderItem2OrderItemFilter): RQOrderItem2OrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQOrderItem2OrderItemFilter: RQOrderItem2OrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQOrderItem2OrderItemShortList; stdcall;
  end; 


implementation

  destructor RQOrderItem2OrderItem.Destroy;
  begin
    if Assigned(ForderItemInRef) then
      orderItemInRef.Free;
    if Assigned(ForderItemOutRef) then
      orderItemOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
  
  destructor RQOrderItem2OrderItemFilter.Destroy;
  begin
    if Assigned(ForderItemInRef) then
      orderItemInRef.Free;
    if Assigned(ForderItemOutRef) then
      orderItemOutRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderItem2OrderItemShort.Destroy;
  begin
    if Assigned(ForderItemInRefCountGen) then
      orderItemInRefCountGen.Free;
    if Assigned(ForderItemInRefCountFact) then
      orderItemInRefCountFact.Free;
    if Assigned(ForderItemInRefPriceWithoutNds) then
      orderItemInRefPriceWithoutNds.Free;
    if Assigned(ForderItemInRefNds) then
      orderItemInRefNds.Free;
    if Assigned(ForderItemInRefPriceWithNds) then
      orderItemInRefPriceWithNds.Free;
    if Assigned(ForderItemInRefSumWithoutNds) then
      orderItemInRefSumWithoutNds.Free;
    if Assigned(ForderItemInRefSumNds) then
      orderItemInRefSumNds.Free;
    if Assigned(ForderItemInRefSumGen) then
      orderItemInRefSumGen.Free;
    if Assigned(ForderItemOutRefCountGen) then
      orderItemOutRefCountGen.Free;
    if Assigned(ForderItemOutRefCountFact) then
      orderItemOutRefCountFact.Free;
    if Assigned(ForderItemOutRefPriceWithoutNds) then
      orderItemOutRefPriceWithoutNds.Free;
    if Assigned(ForderItemOutRefNds) then
      orderItemOutRefNds.Free;
    if Assigned(ForderItemOutRefPriceWithNds) then
      orderItemOutRefPriceWithNds.Free;
    if Assigned(ForderItemOutRefSumWithoutNds) then
      orderItemOutRefSumWithoutNds.Free;
    if Assigned(ForderItemOutRefSumNds) then
      orderItemOutRefSumNds.Free;
    if Assigned(ForderItemOutRefSumGen) then
      orderItemOutRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQOrderItem2OrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItem');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemRef');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemShort');
  RemClassRegistry.RegisterXSClass(RQOrderItem2OrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQOrderItem2OrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQOrderItem2OrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQOrderItem2OrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQOrderItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQOrderItem2OrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQOrderItem2OrderItemControllerSoapPort), 'http://ksoe.org/RQOrderItem2OrderItemController/action/RQOrderItem2OrderItemController.%operationName%');


end.
