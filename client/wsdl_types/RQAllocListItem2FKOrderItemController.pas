unit RQAllocListItem2FKOrderItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQAllocationListItemController
   ,RQFKOrderItemController
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

  RQAllocListItem2FKOrderItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocListItem2FKOrderItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocListItem2FKOrderItem = class(TRemotable)
  private
    Fcode : Integer;
//???
    FlistItemRef : RQAllocationListItemRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property listItemRef : RQAllocationListItemRef read FlistItemRef write FlistItemRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
  end;

{
  RQAllocListItem2FKOrderItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FlistItemRef : RQAllocationListItemRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property listItemRef : RQAllocationListItemRef read FlistItemRef write FlistItemRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
  end;
}

  RQAllocListItem2FKOrderItemFilter = class(RQAllocListItem2FKOrderItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocListItem2FKOrderItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FlistItemRefCode : Integer;
    FlistItemRefMaterialName : WideString;
    FlistItemRefNn : WideString;
    FlistItemRefMeasurementName : WideString;
    FlistItemRefCountGen : TXSDecimal;
    FlistItemRefCountFact : TXSDecimal;
    FlistItemRefUserGen : WideString;
    FlistItemRefDateEdit : TXSDate;
    FfkorderitemRefCode : Integer;
    FfkorderitemRefFinCode : Integer;
    FfkorderitemRefNomenclatureCode : Integer;
    FfkorderitemRefNomenclatureNum : WideString;
    FfkorderitemRefNomenclatureBalSch : WideString;
    FfkorderitemRefNomenclatureName : WideString;
    FfkorderitemRefNomenclatureUnitCode : Integer;
    FfkorderitemRefNomenclatureUnitName : WideString;
    FfkorderitemRefContractNumber : WideString;
    FfkorderitemRefContractDate : TXSDate;
    FfkorderitemRefFinDocCode : WideString;
    FfkorderitemRefFinDocID : Integer;
    FfkorderitemRefMaterialNameTxt : WideString;
    FfkorderitemRefMeasurementNameTxt : WideString;
    FfkorderitemRefCountGen : TXSDecimal;
    FfkorderitemRefPriceWithoutNds : TXSDecimal;
    FfkorderitemRefPriceWithNds : TXSDecimal;
    FfkorderitemRefPriceNds : TXSDecimal;
    FfkorderitemRefSumWithoutNds : TXSDecimal;
    FfkorderitemRefSumNds : TXSDecimal;
    FfkorderitemRefSumGen : TXSDecimal;
    FfkorderitemRefUserGen : WideString;
    FfkorderitemRefCommentGen : WideString;
    FfkorderitemRefNext_mat_name : WideString;
    FfkorderitemRefMeasurementTwoUnits : WideString;
    FfkorderitemRefCountTwoUnits : TXSDecimal;
    FfkorderitemRefPriceTwoUnits : TXSDecimal;
    FfkorderitemRefWeight : TXSDecimal;
    FfkorderitemRefSellingPriceWithoutNds : TXSDecimal;
    FfkorderitemRefSellingCostWithoutNds : TXSDecimal;
    FfkorderitemRefDateRealiz : TXSDate;
    FfkorderitemRefFundingType : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property listItemRefCode : Integer read FlistItemRefCode write FlistItemRefCode;
    property listItemRefMaterialName : WideString read FlistItemRefMaterialName write FlistItemRefMaterialName;
    property listItemRefNn : WideString read FlistItemRefNn write FlistItemRefNn;
    property listItemRefMeasurementName : WideString read FlistItemRefMeasurementName write FlistItemRefMeasurementName;
    property listItemRefCountGen : TXSDecimal read FlistItemRefCountGen write FlistItemRefCountGen;
    property listItemRefCountFact : TXSDecimal read FlistItemRefCountFact write FlistItemRefCountFact;
    property listItemRefUserGen : WideString read FlistItemRefUserGen write FlistItemRefUserGen;
    property listItemRefDateEdit : TXSDate read FlistItemRefDateEdit write FlistItemRefDateEdit;
    property fkorderitemRefCode : Integer read FfkorderitemRefCode write FfkorderitemRefCode;
    property fkorderitemRefFinCode : Integer read FfkorderitemRefFinCode write FfkorderitemRefFinCode;
    property fkorderitemRefNomenclatureCode : Integer read FfkorderitemRefNomenclatureCode write FfkorderitemRefNomenclatureCode;
    property fkorderitemRefNomenclatureNum : WideString read FfkorderitemRefNomenclatureNum write FfkorderitemRefNomenclatureNum;
    property fkorderitemRefNomenclatureBalSch : WideString read FfkorderitemRefNomenclatureBalSch write FfkorderitemRefNomenclatureBalSch;
    property fkorderitemRefNomenclatureName : WideString read FfkorderitemRefNomenclatureName write FfkorderitemRefNomenclatureName;
    property fkorderitemRefNomenclatureUnitCode : Integer read FfkorderitemRefNomenclatureUnitCode write FfkorderitemRefNomenclatureUnitCode;
    property fkorderitemRefNomenclatureUnitName : WideString read FfkorderitemRefNomenclatureUnitName write FfkorderitemRefNomenclatureUnitName;
    property fkorderitemRefContractNumber : WideString read FfkorderitemRefContractNumber write FfkorderitemRefContractNumber;
    property fkorderitemRefContractDate : TXSDate read FfkorderitemRefContractDate write FfkorderitemRefContractDate;
    property fkorderitemRefFinDocCode : WideString read FfkorderitemRefFinDocCode write FfkorderitemRefFinDocCode;
    property fkorderitemRefFinDocID : Integer read FfkorderitemRefFinDocID write FfkorderitemRefFinDocID;
    property fkorderitemRefMaterialNameTxt : WideString read FfkorderitemRefMaterialNameTxt write FfkorderitemRefMaterialNameTxt;
    property fkorderitemRefMeasurementNameTxt : WideString read FfkorderitemRefMeasurementNameTxt write FfkorderitemRefMeasurementNameTxt;
    property fkorderitemRefCountGen : TXSDecimal read FfkorderitemRefCountGen write FfkorderitemRefCountGen;
    property fkorderitemRefPriceWithoutNds : TXSDecimal read FfkorderitemRefPriceWithoutNds write FfkorderitemRefPriceWithoutNds;
    property fkorderitemRefPriceWithNds : TXSDecimal read FfkorderitemRefPriceWithNds write FfkorderitemRefPriceWithNds;
    property fkorderitemRefPriceNds : TXSDecimal read FfkorderitemRefPriceNds write FfkorderitemRefPriceNds;
    property fkorderitemRefSumWithoutNds : TXSDecimal read FfkorderitemRefSumWithoutNds write FfkorderitemRefSumWithoutNds;
    property fkorderitemRefSumNds : TXSDecimal read FfkorderitemRefSumNds write FfkorderitemRefSumNds;
    property fkorderitemRefSumGen : TXSDecimal read FfkorderitemRefSumGen write FfkorderitemRefSumGen;
    property fkorderitemRefUserGen : WideString read FfkorderitemRefUserGen write FfkorderitemRefUserGen;
    property fkorderitemRefCommentGen : WideString read FfkorderitemRefCommentGen write FfkorderitemRefCommentGen;
    property fkorderitemRefNext_mat_name : WideString read FfkorderitemRefNext_mat_name write FfkorderitemRefNext_mat_name;
    property fkorderitemRefMeasurementTwoUnits : WideString read FfkorderitemRefMeasurementTwoUnits write FfkorderitemRefMeasurementTwoUnits;
    property fkorderitemRefCountTwoUnits : TXSDecimal read FfkorderitemRefCountTwoUnits write FfkorderitemRefCountTwoUnits;
    property fkorderitemRefPriceTwoUnits : TXSDecimal read FfkorderitemRefPriceTwoUnits write FfkorderitemRefPriceTwoUnits;
    property fkorderitemRefWeight : TXSDecimal read FfkorderitemRefWeight write FfkorderitemRefWeight;
    property fkorderitemRefSellingPriceWithoutNds : TXSDecimal read FfkorderitemRefSellingPriceWithoutNds write FfkorderitemRefSellingPriceWithoutNds;
    property fkorderitemRefSellingCostWithoutNds : TXSDecimal read FfkorderitemRefSellingCostWithoutNds write FfkorderitemRefSellingCostWithoutNds;
    property fkorderitemRefDateRealiz : TXSDate read FfkorderitemRefDateRealiz write FfkorderitemRefDateRealiz;
    property fkorderitemRefFundingType : Integer read FfkorderitemRefFundingType write FfkorderitemRefFundingType;
  end;

  ArrayOfRQAllocListItem2FKOrderItemShort = array of RQAllocListItem2FKOrderItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocListItem2FKOrderItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocListItem2FKOrderItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocListItem2FKOrderItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocListItem2FKOrderItemController/message/
  // soapAction: http://ksoe.org/RQAllocListItem2FKOrderItemController/action/RQAllocListItem2FKOrderItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocListItem2FKOrderItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocListItem2FKOrderItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocListItem2FKOrderItemControllerSoapPort = interface(IInvokable)
  ['{0829084A-D6CA-4BB3-8EBD-79FB1B8223C1}']
    function add(const aRQAllocListItem2FKOrderItem: RQAllocListItem2FKOrderItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocListItem2FKOrderItem: RQAllocListItem2FKOrderItem); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocListItem2FKOrderItem; stdcall;
    function getList: RQAllocListItem2FKOrderItemShortList; stdcall;
    function getFilteredList(const aRQAllocListItem2FKOrderItemFilter: RQAllocListItem2FKOrderItemFilter): RQAllocListItem2FKOrderItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocListItem2FKOrderItemShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocListItem2FKOrderItemFilter: RQAllocListItem2FKOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocListItem2FKOrderItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocListItem2FKOrderItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocListItem2FKOrderItemFilter: RQAllocListItem2FKOrderItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocListItem2FKOrderItemShort; stdcall;
  end;


implementation

  destructor RQAllocListItem2FKOrderItem.Destroy;
  begin
    if Assigned(FlistItemRef) then
      listItemRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQAllocListItem2FKOrderItemFilter.Destroy;
  begin
    if Assigned(FlistItemRef) then
      listItemRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQAllocListItem2FKOrderItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQAllocListItem2FKOrderItemShort.Destroy;
  begin
    if Assigned(FlistItemRefCountGen) then
      listItemRefCountGen.Free;
    if Assigned(FlistItemRefCountFact) then
      listItemRefCountFact.Free;
    if Assigned(FlistItemRefDateEdit) then
      listItemRefDateEdit.Free;
    if Assigned(FfkorderitemRefContractDate) then
      fkorderitemRefContractDate.Free;
    if Assigned(FfkorderitemRefCountGen) then
      fkorderitemRefCountGen.Free;
    if Assigned(FfkorderitemRefPriceWithoutNds) then
      fkorderitemRefPriceWithoutNds.Free;
    if Assigned(FfkorderitemRefPriceWithNds) then
      fkorderitemRefPriceWithNds.Free;
    if Assigned(FfkorderitemRefPriceNds) then
      fkorderitemRefPriceNds.Free;
    if Assigned(FfkorderitemRefSumWithoutNds) then
      fkorderitemRefSumWithoutNds.Free;
    if Assigned(FfkorderitemRefSumNds) then
      fkorderitemRefSumNds.Free;
    if Assigned(FfkorderitemRefSumGen) then
      fkorderitemRefSumGen.Free;
    if Assigned(FfkorderitemRefCountTwoUnits) then
      fkorderitemRefCountTwoUnits.Free;
    if Assigned(FfkorderitemRefPriceTwoUnits) then
      fkorderitemRefPriceTwoUnits.Free;
    if Assigned(FfkorderitemRefWeight) then
      fkorderitemRefWeight.Free;
    if Assigned(FfkorderitemRefSellingPriceWithoutNds) then
      fkorderitemRefSellingPriceWithoutNds.Free;
    if Assigned(FfkorderitemRefSellingCostWithoutNds) then
      fkorderitemRefSellingCostWithoutNds.Free;
    if Assigned(FfkorderitemRefDateRealiz) then
      fkorderitemRefDateRealiz.Free;
    inherited Destroy;
  end;

  destructor RQAllocListItem2FKOrderItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocListItem2FKOrderItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocListItem2FKOrderItem');
  RemClassRegistry.RegisterXSClass(RQAllocListItem2FKOrderItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocListItem2FKOrderItemRef');
  RemClassRegistry.RegisterXSClass(RQAllocListItem2FKOrderItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocListItem2FKOrderItemFilter');
  RemClassRegistry.RegisterXSClass(RQAllocListItem2FKOrderItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocListItem2FKOrderItemShort');
  RemClassRegistry.RegisterXSClass(RQAllocListItem2FKOrderItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocListItem2FKOrderItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocListItem2FKOrderItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocListItem2FKOrderItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocListItem2FKOrderItemControllerSoapPort), 'http://ksoe.org/RQAllocListItem2FKOrderItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocListItem2FKOrderItemControllerSoapPort), 'http://ksoe.org/RQAllocListItem2FKOrderItemController/action/RQAllocListItem2FKOrderItemController.%operationName%');


end.
