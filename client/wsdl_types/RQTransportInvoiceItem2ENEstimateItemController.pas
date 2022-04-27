unit RQTransportInvoiceItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENEstimateItemController 
   ,RQTransportInvoiceItemController 
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

  RQTransportInvoiceItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fweight : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FtransportInvoiceItemRef : RQTransportInvoiceItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property transportInvoiceItemRef : RQTransportInvoiceItemRef read FtransportInvoiceItemRef write FtransportInvoiceItemRef; 
  end;
  
{
  RQTransportInvoiceItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fweight : TXSDecimal;
    Fmodify_time : Int64;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FtransportInvoiceItemRef : RQTransportInvoiceItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property transportInvoiceItemRef : RQTransportInvoiceItemRef read FtransportInvoiceItemRef write FtransportInvoiceItemRef; 
  end;
}

  RQTransportInvoiceItem2ENEstimateItemFilter = class(RQTransportInvoiceItem2ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQTransportInvoiceItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    Fweight : TXSDecimal;
    FestimateItemRefCode : Integer; 
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FtransportInvoiceItemRefCode : Integer; 
    FtransportInvoiceItemRefMaterialName : WideString;
    FtransportInvoiceItemRefMeasurementName : WideString;
    FtransportInvoiceItemRefCountFact : TXSDecimal;
    FtransportInvoiceItemRefWeight : TXSDecimal;
    FtransportInvoiceItemRefCommentGen : WideString;
    FtransportInvoiceItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property weight : TXSDecimal read Fweight write Fweight; 

    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit; 
    property transportInvoiceItemRefCode : Integer read FtransportInvoiceItemRefCode write FtransportInvoiceItemRefCode; 
    property transportInvoiceItemRefMaterialName : WideString read FtransportInvoiceItemRefMaterialName write FtransportInvoiceItemRefMaterialName; 
    property transportInvoiceItemRefMeasurementName : WideString read FtransportInvoiceItemRefMeasurementName write FtransportInvoiceItemRefMeasurementName; 
    property transportInvoiceItemRefCountFact : TXSDecimal read FtransportInvoiceItemRefCountFact write FtransportInvoiceItemRefCountFact; 
    property transportInvoiceItemRefWeight : TXSDecimal read FtransportInvoiceItemRefWeight write FtransportInvoiceItemRefWeight; 
    property transportInvoiceItemRefCommentGen : WideString read FtransportInvoiceItemRefCommentGen write FtransportInvoiceItemRefCommentGen; 
    property transportInvoiceItemRefUserGen : WideString read FtransportInvoiceItemRefUserGen write FtransportInvoiceItemRefUserGen; 
  end;

  ArrayOfRQTransportInvoiceItem2ENEstimateItemShort = array of RQTransportInvoiceItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTransportInvoiceItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTransportInvoiceItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTransportInvoiceItem2ENEstimateItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTransportInvoiceItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQTransportInvoiceItem2ENEstimateItemController/action/RQTransportInvoiceItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTransportInvoiceItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTransportInvoiceItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTransportInvoiceItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{376c376c-376c-376c-376c-376c376c376c}']
    function  add(const aRQTransportInvoiceItem2ENEstimateItem: RQTransportInvoiceItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTransportInvoiceItem2ENEstimateItem: RQTransportInvoiceItem2ENEstimateItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQTransportInvoiceItem2ENEstimateItem; stdcall;
    function  getList: RQTransportInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getFilteredList(const aRQTransportInvoiceItem2ENEstimateItemFilter: RQTransportInvoiceItem2ENEstimateItemFilter): RQTransportInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQTransportInvoiceItem2ENEstimateItemFilter: RQTransportInvoiceItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItem2ENEstimateItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQTransportInvoiceItem2ENEstimateItemFilter: RQTransportInvoiceItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQTransportInvoiceItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FtransportInvoiceItemRef) then
      transportInvoiceItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQTransportInvoiceItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FtransportInvoiceItemRef) then
      transportInvoiceItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQTransportInvoiceItem2ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQTransportInvoiceItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FestimateItemRefCountGen) then
      estimateItemRefCountGen.Free;
    if Assigned(FestimateItemRefCountFact) then
      estimateItemRefCountFact.Free;
    if Assigned(FestimateItemRefPrice) then
      estimateItemRefPrice.Free;
    if Assigned(FestimateItemRefCost) then
      estimateItemRefCost.Free;
    if Assigned(FestimateItemRefDateEdit) then
      estimateItemRefDateEdit.Free;
    if Assigned(FtransportInvoiceItemRefCountFact) then
      transportInvoiceItemRefCountFact.Free;
    if Assigned(FtransportInvoiceItemRefWeight) then
      transportInvoiceItemRefWeight.Free;
    inherited Destroy;
  end; 
  
  destructor RQTransportInvoiceItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTransportInvoiceItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTransportInvoiceItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTransportInvoiceItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTransportInvoiceItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceItem2ENEstimateItemController/action/RQTransportInvoiceItem2ENEstimateItemController.%operationName%');


end.
