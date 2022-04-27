unit RQAllocationListItem2ENEstimateItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQAllocationListItemController
   ,ENEstimateItemController
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

  RQAllocationListItem2ENEstimateItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListItem2ENEstimateItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListItem2ENEstimateItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
//???
    FlistItemRef : RQAllocationListItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property listItemRef : RQAllocationListItemRef read FlistItemRef write FlistItemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;

{
  RQAllocationListItem2ENEstimateItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
//???
    FlistItemRef : RQAllocationListItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property listItemRef : RQAllocationListItemRef read FlistItemRef write FlistItemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;
}

  RQAllocationListItem2ENEstimateItemFilter = class(RQAllocationListItem2ENEstimateItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListItem2ENEstimateItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FlistItemRefCode : Integer;
    FlistItemRefMaterialName : WideString;
    FlistItemRefNn : WideString;
    FlistItemRefMeasurementName : WideString;
    FlistItemRefCountGen : TXSDecimal;
    FlistItemRefCountFact : TXSDecimal;
    FlistItemRefUserGen : WideString;
    FlistItemRefDateEdit : TXSDate;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;

    property listItemRefCode : Integer read FlistItemRefCode write FlistItemRefCode;
    property listItemRefMaterialName : WideString read FlistItemRefMaterialName write FlistItemRefMaterialName;
    property listItemRefNn : WideString read FlistItemRefNn write FlistItemRefNn;
    property listItemRefMeasurementName : WideString read FlistItemRefMeasurementName write FlistItemRefMeasurementName;
    property listItemRefCountGen : TXSDecimal read FlistItemRefCountGen write FlistItemRefCountGen;
    property listItemRefCountFact : TXSDecimal read FlistItemRefCountFact write FlistItemRefCountFact;
    property listItemRefUserGen : WideString read FlistItemRefUserGen write FlistItemRefUserGen;
    property listItemRefDateEdit : TXSDate read FlistItemRefDateEdit write FlistItemRefDateEdit;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
  end;

  ArrayOfRQAllocationListItem2ENEstimateItemShort = array of RQAllocationListItem2ENEstimateItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListItem2ENEstimateItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListItem2ENEstimateItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListItem2ENEstimateItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListItem2ENEstimateItemController/message/
  // soapAction: http://ksoe.org/RQAllocationListItem2ENEstimateItemController/action/RQAllocationListItem2ENEstimateItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListItem2ENEstimateItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListItem2ENEstimateItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListItem2ENEstimateItemControllerSoapPort = interface(IInvokable)
  ['{EAF3BBE6-BE59-4FD5-A7B1-311C6FFE8101}']
    function add(const aRQAllocationListItem2ENEstimateItem: RQAllocationListItem2ENEstimateItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationListItem2ENEstimateItem: RQAllocationListItem2ENEstimateItem); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationListItem2ENEstimateItem; stdcall;
    function getList: RQAllocationListItem2ENEstimateItemShortList; stdcall;
    function getFilteredList(const aRQAllocationListItem2ENEstimateItemFilter: RQAllocationListItem2ENEstimateItemFilter): RQAllocationListItem2ENEstimateItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItem2ENEstimateItemShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListItem2ENEstimateItemFilter: RQAllocationListItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItem2ENEstimateItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItem2ENEstimateItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListItem2ENEstimateItemFilter: RQAllocationListItem2ENEstimateItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListItem2ENEstimateItemShort; stdcall;
  end;


implementation

  destructor RQAllocationListItem2ENEstimateItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FlistItemRef) then
      listItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQAllocationListItem2ENEstimateItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FlistItemRef) then
      listItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQAllocationListItem2ENEstimateItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQAllocationListItem2ENEstimateItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FlistItemRefCountGen) then
      listItemRefCountGen.Free;
    if Assigned(FlistItemRefCountFact) then
      listItemRefCountFact.Free;
    if Assigned(FlistItemRefDateEdit) then
      listItemRefDateEdit.Free;
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
    inherited Destroy;
  end;

  destructor RQAllocationListItem2ENEstimateItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationListItem2ENEstimateItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem2ENEstimateItem');
  RemClassRegistry.RegisterXSClass(RQAllocationListItem2ENEstimateItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem2ENEstimateItemRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListItem2ENEstimateItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem2ENEstimateItemFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListItem2ENEstimateItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem2ENEstimateItemShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListItem2ENEstimateItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem2ENEstimateItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListItem2ENEstimateItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListItem2ENEstimateItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQAllocationListItem2ENEstimateItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListItem2ENEstimateItemControllerSoapPort), 'http://ksoe.org/RQAllocationListItem2ENEstimateItemController/action/RQAllocationListItem2ENEstimateItemController.%operationName%');


end.
