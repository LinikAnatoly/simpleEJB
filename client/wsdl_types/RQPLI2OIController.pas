unit RQPLI2OIController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPackingListItemController
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

  RQPLI2OI            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPLI2OIRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPLI2OI = class(TRemotable)
  private
    Fcode : Integer;
//???
    FpackingListItemRef : RQPackingListItemRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
  end;

{
  RQPLI2OIFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FpackingListItemRef : RQPackingListItemRef;
//???
    FfkorderitemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
    property fkorderitemRef : RQFKOrderItemRef read FfkorderitemRef write FfkorderitemRef;
  end;
}

  RQPLI2OIFilter = class(RQPLI2OI)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPLI2OIShort = class(TRemotable)
  private
    Fcode : Integer;
    FpackingListItemRefCode : Integer;
    FpackingListItemRefMaterialName : WideString;
    FpackingListItemRefNn : WideString;
    FpackingListItemRefMeasurementName : WideString;
    FpackingListItemRefCountGen : TXSDecimal;
    FpackingListItemRefEstimateItemString : WideString;
    FpackingListItemRefUserGen : WideString;
    FpackingListItemRefDateEdit : TXSDate;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property packingListItemRefCode : Integer read FpackingListItemRefCode write FpackingListItemRefCode;
    property packingListItemRefMaterialName : WideString read FpackingListItemRefMaterialName write FpackingListItemRefMaterialName;
    property packingListItemRefNn : WideString read FpackingListItemRefNn write FpackingListItemRefNn;
    property packingListItemRefMeasurementName : WideString read FpackingListItemRefMeasurementName write FpackingListItemRefMeasurementName;
    property packingListItemRefCountGen : TXSDecimal read FpackingListItemRefCountGen write FpackingListItemRefCountGen;
    property packingListItemRefEstimateItemString : WideString read FpackingListItemRefEstimateItemString write FpackingListItemRefEstimateItemString;
    property packingListItemRefUserGen : WideString read FpackingListItemRefUserGen write FpackingListItemRefUserGen;
    property packingListItemRefDateEdit : TXSDate read FpackingListItemRefDateEdit write FpackingListItemRefDateEdit;
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
  end;

  ArrayOfRQPLI2OIShort = array of RQPLI2OIShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPLI2OIShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPLI2OIShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPLI2OIShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPLI2OIController/message/
  // soapAction: http://ksoe.org/RQPLI2OIController/action/RQPLI2OIController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPLI2OIControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPLI2OIController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPLI2OIControllerSoapPort = interface(IInvokable)
  ['{bfbdbfbd-bfbd-bfbd-bfbd-bfbdbfbdbfbd}']
    function add(const aRQPLI2OI: RQPLI2OI): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPLI2OI: RQPLI2OI); stdcall;
    function getObject(const anObjectCode: Integer): RQPLI2OI; stdcall;
    function getList: RQPLI2OIShortList; stdcall;
    function getFilteredList(const aRQPLI2OIFilter: RQPLI2OIFilter): RQPLI2OIShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPLI2OIShortList; stdcall;
    function getScrollableFilteredList(const aRQPLI2OIFilter: RQPLI2OIFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPLI2OIShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPLI2OIShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPLI2OIFilter: RQPLI2OIFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPLI2OIShort; stdcall;
  end;


implementation

  destructor RQPLI2OI.Destroy;
  begin
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPLI2OIFilter.Destroy;
  begin
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    if Assigned(FfkorderitemRef) then
      fkorderitemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPLI2OIFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPLI2OIShort.Destroy;
  begin
    if Assigned(FpackingListItemRefCountGen) then
      packingListItemRefCountGen.Free;
    if Assigned(FpackingListItemRefDateEdit) then
      packingListItemRefDateEdit.Free;
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

  destructor RQPLI2OIShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPLI2OI, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPLI2OI');
  RemClassRegistry.RegisterXSClass(RQPLI2OIRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPLI2OIRef');
  RemClassRegistry.RegisterXSClass(RQPLI2OIFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPLI2OIFilter');
  RemClassRegistry.RegisterXSClass(RQPLI2OIShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPLI2OIShort');
  RemClassRegistry.RegisterXSClass(RQPLI2OIShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPLI2OIShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPLI2OIShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPLI2OIShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPLI2OIControllerSoapPort), 'http://ksoe.org/RQPLI2OIController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPLI2OIControllerSoapPort), 'http://ksoe.org/RQPLI2OIController/action/RQPLI2OIController.%operationName%');


end.
