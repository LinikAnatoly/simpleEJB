unit RQFKOrderItem2BillItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQBillItemController
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

  RQFKOrderItem2BillItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2BillItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItem2BillItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef;
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef;
  end;

{
  RQFKOrderItem2BillItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountFact : TXSDecimal;
    Fmodify_time : Int64;
//???
    FbillItemRef : RQBillItemRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property billItemRef : RQBillItemRef read FbillItemRef write FbillItemRef;
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef;
  end;
}

  RQFKOrderItem2BillItemFilter = class(RQFKOrderItem2BillItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrderItem2BillItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountFact : TXSDecimal;
    FbillItemRefCode : Integer;
    FbillItemRefCountGen : TXSDecimal;
    FbillItemRefMaterialNameTxt : WideString;
    FbillItemRefMeasurementNameTxt : WideString;
    FbillItemRefCountFact : TXSDecimal;
    FbillItemRefPriceWithoutNds : TXSDecimal;
    FbillItemRefPriceWithNds : TXSDecimal;
    FbillItemRefNds : TXSDecimal;
    FbillItemRefSumWithoutNds : TXSDecimal;
    FbillItemRefSumNds : TXSDecimal;
    FbillItemRefSumGen : TXSDecimal;
    FbillItemRefCommentGen : WideString;
    FbillItemRefDdsCodesTxt : WideString;
    FbillItemRefContractNumber : WideString;
    FbillItemRefFinDocCode : WideString;
    FbillItemRefFinDocId : Integer;
    FbillItemRefUserGen : WideString;
    FfkOrderItemRefCode : Integer;
    FfkOrderItemRefFinCode : Integer;
    FfkOrderItemRefNomenclatureCode : Integer;
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer;
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefContractNumber : WideString;
    FfkOrderItemRefContractDate : TXSDate;
    FfkOrderItemRefFinDocCode : WideString;
    FfkOrderItemRefFinDocID : Integer;
    FfkOrderItemRefMaterialNameTxt : WideString;
    FfkOrderItemRefMeasurementNameTxt : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefPriceWithNds : TXSDecimal;
    FfkOrderItemRefPriceNds : TXSDecimal;
    FfkOrderItemRefSumWithoutNds : TXSDecimal;
    FfkOrderItemRefSumNds : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
    FfkOrderItemRefCommentGen : WideString;
    FfkOrderItemRefNext_mat_name : WideString;
    FfkOrderItemRefMeasurementTwoUnits : WideString;
    FfkOrderItemRefCountTwoUnits : TXSDecimal;
    FfkOrderItemRefPriceTwoUnits : TXSDecimal;
    FfkOrderItemRefWeight : TXSDecimal;
    FfkOrderItemRefSellingPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefSellingCostWithoutNds : TXSDecimal;
    FfkOrderItemRefDateRealiz : TXSDate;
    FfkOrderItemRefFundingType : Integer;
    FfkOrderItemRefSealSeriesStart : WideString;
    FfkOrderItemRefSealNumberStart : Integer;
    FfkOrderItemRefSealName : WideString;
    FfkOrderItemRefSealColor : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countFact : TXSDecimal read FcountFact write FcountFact;

    property billItemRefCode : Integer read FbillItemRefCode write FbillItemRefCode;
    property billItemRefCountGen : TXSDecimal read FbillItemRefCountGen write FbillItemRefCountGen;
    property billItemRefMaterialNameTxt : WideString read FbillItemRefMaterialNameTxt write FbillItemRefMaterialNameTxt;
    property billItemRefMeasurementNameTxt : WideString read FbillItemRefMeasurementNameTxt write FbillItemRefMeasurementNameTxt;
    property billItemRefCountFact : TXSDecimal read FbillItemRefCountFact write FbillItemRefCountFact;
    property billItemRefPriceWithoutNds : TXSDecimal read FbillItemRefPriceWithoutNds write FbillItemRefPriceWithoutNds;
    property billItemRefPriceWithNds : TXSDecimal read FbillItemRefPriceWithNds write FbillItemRefPriceWithNds;
    property billItemRefNds : TXSDecimal read FbillItemRefNds write FbillItemRefNds;
    property billItemRefSumWithoutNds : TXSDecimal read FbillItemRefSumWithoutNds write FbillItemRefSumWithoutNds;
    property billItemRefSumNds : TXSDecimal read FbillItemRefSumNds write FbillItemRefSumNds;
    property billItemRefSumGen : TXSDecimal read FbillItemRefSumGen write FbillItemRefSumGen;
    property billItemRefCommentGen : WideString read FbillItemRefCommentGen write FbillItemRefCommentGen;
    property billItemRefDdsCodesTxt : WideString read FbillItemRefDdsCodesTxt write FbillItemRefDdsCodesTxt;
    property billItemRefContractNumber : WideString read FbillItemRefContractNumber write FbillItemRefContractNumber;
    property billItemRefFinDocCode : WideString read FbillItemRefFinDocCode write FbillItemRefFinDocCode;
    property billItemRefFinDocId : Integer read FbillItemRefFinDocId write FbillItemRefFinDocId;
    property billItemRefUserGen : WideString read FbillItemRefUserGen write FbillItemRefUserGen;
    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode;
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode;
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode;
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum;
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch;
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName;
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode;
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName;
    property fkOrderItemRefContractNumber : WideString read FfkOrderItemRefContractNumber write FfkOrderItemRefContractNumber;
    property fkOrderItemRefContractDate : TXSDate read FfkOrderItemRefContractDate write FfkOrderItemRefContractDate;
    property fkOrderItemRefFinDocCode : WideString read FfkOrderItemRefFinDocCode write FfkOrderItemRefFinDocCode;
    property fkOrderItemRefFinDocID : Integer read FfkOrderItemRefFinDocID write FfkOrderItemRefFinDocID;
    property fkOrderItemRefMaterialNameTxt : WideString read FfkOrderItemRefMaterialNameTxt write FfkOrderItemRefMaterialNameTxt;
    property fkOrderItemRefMeasurementNameTxt : WideString read FfkOrderItemRefMeasurementNameTxt write FfkOrderItemRefMeasurementNameTxt;
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen;
    property fkOrderItemRefPriceWithoutNds : TXSDecimal read FfkOrderItemRefPriceWithoutNds write FfkOrderItemRefPriceWithoutNds;
    property fkOrderItemRefPriceWithNds : TXSDecimal read FfkOrderItemRefPriceWithNds write FfkOrderItemRefPriceWithNds;
    property fkOrderItemRefPriceNds : TXSDecimal read FfkOrderItemRefPriceNds write FfkOrderItemRefPriceNds;
    property fkOrderItemRefSumWithoutNds : TXSDecimal read FfkOrderItemRefSumWithoutNds write FfkOrderItemRefSumWithoutNds;
    property fkOrderItemRefSumNds : TXSDecimal read FfkOrderItemRefSumNds write FfkOrderItemRefSumNds;
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen;
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen;
    property fkOrderItemRefCommentGen : WideString read FfkOrderItemRefCommentGen write FfkOrderItemRefCommentGen;
    property fkOrderItemRefNext_mat_name : WideString read FfkOrderItemRefNext_mat_name write FfkOrderItemRefNext_mat_name;
    property fkOrderItemRefMeasurementTwoUnits : WideString read FfkOrderItemRefMeasurementTwoUnits write FfkOrderItemRefMeasurementTwoUnits;
    property fkOrderItemRefCountTwoUnits : TXSDecimal read FfkOrderItemRefCountTwoUnits write FfkOrderItemRefCountTwoUnits;
    property fkOrderItemRefPriceTwoUnits : TXSDecimal read FfkOrderItemRefPriceTwoUnits write FfkOrderItemRefPriceTwoUnits;
    property fkOrderItemRefWeight : TXSDecimal read FfkOrderItemRefWeight write FfkOrderItemRefWeight;
    property fkOrderItemRefSellingPriceWithoutNds : TXSDecimal read FfkOrderItemRefSellingPriceWithoutNds write FfkOrderItemRefSellingPriceWithoutNds;
    property fkOrderItemRefSellingCostWithoutNds : TXSDecimal read FfkOrderItemRefSellingCostWithoutNds write FfkOrderItemRefSellingCostWithoutNds;
    property fkOrderItemRefDateRealiz : TXSDate read FfkOrderItemRefDateRealiz write FfkOrderItemRefDateRealiz;
    property fkOrderItemRefFundingType : Integer read FfkOrderItemRefFundingType write FfkOrderItemRefFundingType;
    property fkOrderItemRefSealSeriesStart : WideString read FfkOrderItemRefSealSeriesStart write FfkOrderItemRefSealSeriesStart;
    property fkOrderItemRefSealNumberStart : Integer read FfkOrderItemRefSealNumberStart write FfkOrderItemRefSealNumberStart;
    property fkOrderItemRefSealName : WideString read FfkOrderItemRefSealName write FfkOrderItemRefSealName;
    property fkOrderItemRefSealColor : WideString read FfkOrderItemRefSealColor write FfkOrderItemRefSealColor;
  end;

  ArrayOfRQFKOrderItem2BillItemShort = array of RQFKOrderItem2BillItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItem2BillItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItem2BillItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItem2BillItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItem2BillItemController/message/
  // soapAction: http://ksoe.org/RQFKOrderItem2BillItemController/action/RQFKOrderItem2BillItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItem2BillItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItem2BillItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItem2BillItemControllerSoapPort = interface(IInvokable)
  ['{D16497C7-61C6-4F37-A284-1D674FCE00C5}']
    function add(const aRQFKOrderItem2BillItem: RQFKOrderItem2BillItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItem2BillItem: RQFKOrderItem2BillItem); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrderItem2BillItem; stdcall;
    function getList: RQFKOrderItem2BillItemShortList; stdcall;
    function getFilteredList(const aRQFKOrderItem2BillItemFilter: RQFKOrderItem2BillItemFilter): RQFKOrderItem2BillItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2BillItemShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrderItem2BillItemFilter: RQFKOrderItem2BillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2BillItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItem2BillItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrderItem2BillItemFilter: RQFKOrderItem2BillItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrderItem2BillItemShort; stdcall;
  end;


implementation

  destructor RQFKOrderItem2BillItem.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrderItem2BillItemFilter.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FbillItemRef) then
      billItemRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQFKOrderItem2BillItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQFKOrderItem2BillItemShort.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FbillItemRefCountGen) then
      billItemRefCountGen.Free;
    if Assigned(FbillItemRefCountFact) then
      billItemRefCountFact.Free;
    if Assigned(FbillItemRefPriceWithoutNds) then
      billItemRefPriceWithoutNds.Free;
    if Assigned(FbillItemRefPriceWithNds) then
      billItemRefPriceWithNds.Free;
    if Assigned(FbillItemRefNds) then
      billItemRefNds.Free;
    if Assigned(FbillItemRefSumWithoutNds) then
      billItemRefSumWithoutNds.Free;
    if Assigned(FbillItemRefSumNds) then
      billItemRefSumNds.Free;
    if Assigned(FbillItemRefSumGen) then
      billItemRefSumGen.Free;
    if Assigned(FfkOrderItemRefContractDate) then
      fkOrderItemRefContractDate.Free;
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPriceWithoutNds) then
      fkOrderItemRefPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefPriceWithNds) then
      fkOrderItemRefPriceWithNds.Free;
    if Assigned(FfkOrderItemRefPriceNds) then
      fkOrderItemRefPriceNds.Free;
    if Assigned(FfkOrderItemRefSumWithoutNds) then
      fkOrderItemRefSumWithoutNds.Free;
    if Assigned(FfkOrderItemRefSumNds) then
      fkOrderItemRefSumNds.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    if Assigned(FfkOrderItemRefCountTwoUnits) then
      fkOrderItemRefCountTwoUnits.Free;
    if Assigned(FfkOrderItemRefPriceTwoUnits) then
      fkOrderItemRefPriceTwoUnits.Free;
    if Assigned(FfkOrderItemRefWeight) then
      fkOrderItemRefWeight.Free;
    if Assigned(FfkOrderItemRefSellingPriceWithoutNds) then
      fkOrderItemRefSellingPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefSellingCostWithoutNds) then
      fkOrderItemRefSellingCostWithoutNds.Free;
    if Assigned(FfkOrderItemRefDateRealiz) then
      fkOrderItemRefDateRealiz.Free;
    inherited Destroy;
  end;

  destructor RQFKOrderItem2BillItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItem2BillItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2BillItem');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2BillItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2BillItemRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2BillItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2BillItemFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2BillItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2BillItemShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItem2BillItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItem2BillItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItem2BillItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItem2BillItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItem2BillItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2BillItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItem2BillItemControllerSoapPort), 'http://ksoe.org/RQFKOrderItem2BillItemController/action/RQFKOrderItem2BillItemController.%operationName%');


end.
