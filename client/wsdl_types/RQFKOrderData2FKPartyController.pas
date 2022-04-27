unit RQFKOrderData2FKPartyController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderController 
   ,RQFKOrderItemController 
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

  RQFKOrderData2FKParty            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderData2FKPartyRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderData2FKParty = class(TRemotable)
  private
    Fcode : Integer; 
    FpartyCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  partyCode : Integer read FpartyCode write FpartyCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
  end;
  
{
  RQFKOrderData2FKPartyFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FpartyCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  partyCode : Integer read FpartyCode write FpartyCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
  end;
}

  RQFKOrderData2FKPartyFilter = class(RQFKOrderData2FKParty)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderData2FKPartyShort = class(TRemotable)
  private
    Fcode : Integer; 
    FpartyCode : Integer; 
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer; 
    FfkOrderRefUserGen : WideString;
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
    property  partyCode : Integer read FpartyCode write FpartyCode; 

    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode; 
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName; 
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode; 
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName; 
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode; 
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds; 
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds; 
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
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
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit; 
  end;

  ArrayOfRQFKOrderData2FKPartyShort = array of RQFKOrderData2FKPartyShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderData2FKPartyShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderData2FKPartyShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderData2FKPartyShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderData2FKPartyController/message/
  // soapAction: http://ksoe.org/RQFKOrderData2FKPartyController/action/RQFKOrderData2FKPartyController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderData2FKPartyControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderData2FKPartyController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderData2FKPartyControllerSoapPort = interface(IInvokable)
  ['{15dc15dc-15dc-15dc-15dc-15dc15dc15dc}']
    function  add(const aRQFKOrderData2FKParty: RQFKOrderData2FKParty): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderData2FKParty: RQFKOrderData2FKParty); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderData2FKParty; stdcall;
    function  getList: RQFKOrderData2FKPartyShortList; stdcall;
    function  getFilteredList(const aRQFKOrderData2FKPartyFilter: RQFKOrderData2FKPartyFilter): RQFKOrderData2FKPartyShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderData2FKPartyShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderData2FKPartyFilter: RQFKOrderData2FKPartyFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderData2FKPartyShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderData2FKPartyShortList; stdcall;
  end; 


implementation

  destructor RQFKOrderData2FKParty.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrderData2FKPartyFilter.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderData2FKPartyFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderData2FKPartyShort.Destroy;
  begin
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
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
  
  destructor RQFKOrderData2FKPartyShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderData2FKParty, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData2FKParty');
  RemClassRegistry.RegisterXSClass(RQFKOrderData2FKPartyRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData2FKPartyRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderData2FKPartyFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData2FKPartyFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderData2FKPartyShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData2FKPartyShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderData2FKPartyShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderData2FKPartyShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderData2FKPartyShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderData2FKPartyShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderData2FKPartyControllerSoapPort), 'http://ksoe.org/RQFKOrderData2FKPartyController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderData2FKPartyControllerSoapPort), 'http://ksoe.org/RQFKOrderData2FKPartyController/action/RQFKOrderData2FKPartyController.%operationName%');


end.
