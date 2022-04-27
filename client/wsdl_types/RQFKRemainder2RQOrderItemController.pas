unit RQFKRemainder2RQOrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderItemRemainderController 
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

  RQFKRemainder2RQOrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKRemainder2RQOrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKRemainder2RQOrderItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FremainderRef : RQFKOrderItemRemainderRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property remainderRef : RQFKOrderItemRemainderRef read FremainderRef write FremainderRef; 
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef; 
  end;
  
{
  RQFKRemainder2RQOrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FremainderRef : RQFKOrderItemRemainderRef;
//???
    FrqOrderItemRef : RQOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property remainderRef : RQFKOrderItemRemainderRef read FremainderRef write FremainderRef; 
    property rqOrderItemRef : RQOrderItemRef read FrqOrderItemRef write FrqOrderItemRef; 
  end;
}

  RQFKRemainder2RQOrderItemFilter = class(RQFKRemainder2RQOrderItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKRemainder2RQOrderItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FremainderRefCode : Integer; 
    FremainderRefMaterialNameTxt : WideString;
    FremainderRefCountGen : TXSDecimal;
    FremainderRefPriceWithoutNds : TXSDecimal;
    FremainderRefSumWithoutNds : TXSDecimal;
    FrqOrderItemRefCode : Integer; 
    FrqOrderItemRefCountGen : TXSDecimal;
    FrqOrderItemRefMaterialNameTxt : WideString;
    FrqOrderItemRefMeasurementNameTxt : WideString;
    FrqOrderItemRefMaterialNameGen : WideString;
    FrqOrderItemRefMeasurementNameGen : WideString;
    FrqOrderItemRefMaterialNameGenRQ : WideString;
    FrqOrderItemRefMeasurementNameGenRQ : WideString;
    FrqOrderItemRefCountFact : TXSDecimal;
    FrqOrderItemRefPriceWithoutNds : TXSDecimal;
    FrqOrderItemRefNds : TXSDecimal;
    FrqOrderItemRefPriceWithNds : TXSDecimal;
    FrqOrderItemRefSumWithoutNds : TXSDecimal;
    FrqOrderItemRefSumNds : TXSDecimal;
    FrqOrderItemRefSumGen : TXSDecimal;
    FrqOrderItemRefCommentGen : WideString;
    FrqOrderItemRefDeliveryTime : Integer; 
    FrqOrderItemRefContractNumber : WideString;
    FrqOrderItemRefContractDate : TXSDate;
    FrqOrderItemRefFinDocCode : WideString;
    FrqOrderItemRefFinDocID : Integer; 
    FrqOrderItemRefPlannedDatePays : TXSDate;
    FrqOrderItemRefPlannedDateDelivery : TXSDate;
    FrqOrderItemRefMaterialIdentId : WideString;
    FrqOrderItemRefStatusReason : WideString;
    FrqOrderItemRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property remainderRefCode : Integer read FremainderRefCode write FremainderRefCode; 
    property remainderRefMaterialNameTxt : WideString read FremainderRefMaterialNameTxt write FremainderRefMaterialNameTxt; 
    property remainderRefCountGen : TXSDecimal read FremainderRefCountGen write FremainderRefCountGen; 
    property remainderRefPriceWithoutNds : TXSDecimal read FremainderRefPriceWithoutNds write FremainderRefPriceWithoutNds; 
    property remainderRefSumWithoutNds : TXSDecimal read FremainderRefSumWithoutNds write FremainderRefSumWithoutNds; 
    property rqOrderItemRefCode : Integer read FrqOrderItemRefCode write FrqOrderItemRefCode; 
    property rqOrderItemRefCountGen : TXSDecimal read FrqOrderItemRefCountGen write FrqOrderItemRefCountGen; 
    property rqOrderItemRefMaterialNameTxt : WideString read FrqOrderItemRefMaterialNameTxt write FrqOrderItemRefMaterialNameTxt; 
    property rqOrderItemRefMeasurementNameTxt : WideString read FrqOrderItemRefMeasurementNameTxt write FrqOrderItemRefMeasurementNameTxt; 
    property rqOrderItemRefMaterialNameGen : WideString read FrqOrderItemRefMaterialNameGen write FrqOrderItemRefMaterialNameGen; 
    property rqOrderItemRefMeasurementNameGen : WideString read FrqOrderItemRefMeasurementNameGen write FrqOrderItemRefMeasurementNameGen; 
    property rqOrderItemRefMaterialNameGenRQ : WideString read FrqOrderItemRefMaterialNameGenRQ write FrqOrderItemRefMaterialNameGenRQ; 
    property rqOrderItemRefMeasurementNameGenRQ : WideString read FrqOrderItemRefMeasurementNameGenRQ write FrqOrderItemRefMeasurementNameGenRQ; 
    property rqOrderItemRefCountFact : TXSDecimal read FrqOrderItemRefCountFact write FrqOrderItemRefCountFact; 
    property rqOrderItemRefPriceWithoutNds : TXSDecimal read FrqOrderItemRefPriceWithoutNds write FrqOrderItemRefPriceWithoutNds; 
    property rqOrderItemRefNds : TXSDecimal read FrqOrderItemRefNds write FrqOrderItemRefNds; 
    property rqOrderItemRefPriceWithNds : TXSDecimal read FrqOrderItemRefPriceWithNds write FrqOrderItemRefPriceWithNds; 
    property rqOrderItemRefSumWithoutNds : TXSDecimal read FrqOrderItemRefSumWithoutNds write FrqOrderItemRefSumWithoutNds; 
    property rqOrderItemRefSumNds : TXSDecimal read FrqOrderItemRefSumNds write FrqOrderItemRefSumNds; 
    property rqOrderItemRefSumGen : TXSDecimal read FrqOrderItemRefSumGen write FrqOrderItemRefSumGen; 
    property rqOrderItemRefCommentGen : WideString read FrqOrderItemRefCommentGen write FrqOrderItemRefCommentGen; 
    property rqOrderItemRefDeliveryTime : Integer read FrqOrderItemRefDeliveryTime write FrqOrderItemRefDeliveryTime; 
    property rqOrderItemRefContractNumber : WideString read FrqOrderItemRefContractNumber write FrqOrderItemRefContractNumber; 
    property rqOrderItemRefContractDate : TXSDate read FrqOrderItemRefContractDate write FrqOrderItemRefContractDate; 
    property rqOrderItemRefFinDocCode : WideString read FrqOrderItemRefFinDocCode write FrqOrderItemRefFinDocCode; 
    property rqOrderItemRefFinDocID : Integer read FrqOrderItemRefFinDocID write FrqOrderItemRefFinDocID; 
    property rqOrderItemRefPlannedDatePays : TXSDate read FrqOrderItemRefPlannedDatePays write FrqOrderItemRefPlannedDatePays; 
    property rqOrderItemRefPlannedDateDelivery : TXSDate read FrqOrderItemRefPlannedDateDelivery write FrqOrderItemRefPlannedDateDelivery; 
    property rqOrderItemRefMaterialIdentId : WideString read FrqOrderItemRefMaterialIdentId write FrqOrderItemRefMaterialIdentId; 
    property rqOrderItemRefStatusReason : WideString read FrqOrderItemRefStatusReason write FrqOrderItemRefStatusReason; 
    property rqOrderItemRefUserGen : WideString read FrqOrderItemRefUserGen write FrqOrderItemRefUserGen; 
  end;

  ArrayOfRQFKRemainder2RQOrderItemShort = array of RQFKRemainder2RQOrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKRemainder2RQOrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKRemainder2RQOrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKRemainder2RQOrderItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKRemainder2RQOrderItemController/message/
  // soapAction: http://ksoe.org/RQFKRemainder2RQOrderItemController/action/RQFKRemainder2RQOrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKRemainder2RQOrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKRemainder2RQOrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKRemainder2RQOrderItemControllerSoapPort = interface(IInvokable)
  ['{1b821b82-1b82-1b82-1b82-1b821b821b82}']
    function  add(const aRQFKRemainder2RQOrderItem: RQFKRemainder2RQOrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKRemainder2RQOrderItem: RQFKRemainder2RQOrderItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKRemainder2RQOrderItem; stdcall;
    function  getList: RQFKRemainder2RQOrderItemShortList; stdcall;
    function  getFilteredList(const aRQFKRemainder2RQOrderItemFilter: RQFKRemainder2RQOrderItemFilter): RQFKRemainder2RQOrderItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2RQOrderItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKRemainder2RQOrderItemFilter: RQFKRemainder2RQOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2RQOrderItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKRemainder2RQOrderItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQFKRemainder2RQOrderItemFilter: RQFKRemainder2RQOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQFKRemainder2RQOrderItem.Destroy;
  begin
    if Assigned(FremainderRef) then
      remainderRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKRemainder2RQOrderItemFilter.Destroy;
  begin
    if Assigned(FremainderRef) then
      remainderRef.Free;
    if Assigned(FrqOrderItemRef) then
      rqOrderItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKRemainder2RQOrderItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKRemainder2RQOrderItemShort.Destroy;
  begin
    if Assigned(FremainderRefCountGen) then
      remainderRefCountGen.Free;
    if Assigned(FremainderRefPriceWithoutNds) then
      remainderRefPriceWithoutNds.Free;
    if Assigned(FremainderRefSumWithoutNds) then
      remainderRefSumWithoutNds.Free;
    if Assigned(FrqOrderItemRefCountGen) then
      rqOrderItemRefCountGen.Free;
    if Assigned(FrqOrderItemRefCountFact) then
      rqOrderItemRefCountFact.Free;
    if Assigned(FrqOrderItemRefPriceWithoutNds) then
      rqOrderItemRefPriceWithoutNds.Free;
    if Assigned(FrqOrderItemRefNds) then
      rqOrderItemRefNds.Free;
    if Assigned(FrqOrderItemRefPriceWithNds) then
      rqOrderItemRefPriceWithNds.Free;
    if Assigned(FrqOrderItemRefSumWithoutNds) then
      rqOrderItemRefSumWithoutNds.Free;
    if Assigned(FrqOrderItemRefSumNds) then
      rqOrderItemRefSumNds.Free;
    if Assigned(FrqOrderItemRefSumGen) then
      rqOrderItemRefSumGen.Free;
    if Assigned(FrqOrderItemRefContractDate) then
      rqOrderItemRefContractDate.Free;
    if Assigned(FrqOrderItemRefPlannedDatePays) then
      rqOrderItemRefPlannedDatePays.Free;
    if Assigned(FrqOrderItemRefPlannedDateDelivery) then
      rqOrderItemRefPlannedDateDelivery.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKRemainder2RQOrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKRemainder2RQOrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2RQOrderItem');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2RQOrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2RQOrderItemRef');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2RQOrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2RQOrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2RQOrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2RQOrderItemShort');
  RemClassRegistry.RegisterXSClass(RQFKRemainder2RQOrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKRemainder2RQOrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKRemainder2RQOrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKRemainder2RQOrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKRemainder2RQOrderItemControllerSoapPort), 'http://ksoe.org/RQFKRemainder2RQOrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKRemainder2RQOrderItemControllerSoapPort), 'http://ksoe.org/RQFKRemainder2RQOrderItemController/action/RQFKRemainder2RQOrderItemController.%operationName%');


end.
