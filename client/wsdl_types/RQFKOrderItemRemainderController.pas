unit RQFKOrderItemRemainderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderItemController 
   ,ENDepartmentController 
   ,ENEstimateItemController 
   ,RQFKOrderRemainderTypeController 
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

  RQFKOrderItemRemainder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItemRemainderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrderItemRemainder = class(TRemotable)
  private
    Fcode : Integer; 
    FmaterialNameTxt : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountInPlans : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    Fbudget : ENDepartment;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FtypeRef : RQFKOrderRemainderTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property countInPlans : TXSDecimal read FcountInPlans write FcountInPlans; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property typeRef : RQFKOrderRemainderTypeRef read FtypeRef write FtypeRef; 
  end;
  
{
  RQFKOrderItemRemainderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FmaterialNameTxt : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountInPlans : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    Fmodify_time : Int64;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    Fbudget : ENDepartment;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FtypeRef : RQFKOrderRemainderTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property countInPlans : TXSDecimal read FcountInPlans write FcountInPlans; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property budget : ENDepartment read Fbudget write Fbudget; 
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef; 
    property typeRef : RQFKOrderRemainderTypeRef read FtypeRef write FtypeRef; 
  end;
}

  RQFKOrderItemRemainderFilter = class(RQFKOrderItemRemainder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrderItemRemainderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FmaterialNameTxt : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FcountInPlans : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
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
    FbudgetCode : Integer; 
    FbudgetShortName : WideString;
    FbudgetDateStart : TXSDate;
    FbudgetDateFinal : TXSDate;
    FestimateItemRefCode : Integer; 
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property countInPlans : TXSDecimal read FcountInPlans write FcountInPlans; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 

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
    property budgetCode : Integer read FbudgetCode write FbudgetCode; 
    property budgetShortName : WideString read FbudgetShortName write FbudgetShortName; 
    property budgetDateStart : TXSDate read FbudgetDateStart write FbudgetDateStart; 
    property budgetDateFinal : TXSDate read FbudgetDateFinal write FbudgetDateFinal; 
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode; 
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen; 
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact; 
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice; 
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost; 
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen; 
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit; 
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfRQFKOrderItemRemainderShort = array of RQFKOrderItemRemainderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrderItemRemainderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrderItemRemainderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrderItemRemainderShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrderItemRemainderController/message/
  // soapAction: http://ksoe.org/RQFKOrderItemRemainderController/action/RQFKOrderItemRemainderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrderItemRemainderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrderItemRemainderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrderItemRemainderControllerSoapPort = interface(IInvokable)
  ['{51e051e0-51e0-51e0-51e0-51e051e051e0}']
    function  add(const aRQFKOrderItemRemainder: RQFKOrderItemRemainder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrderItemRemainder: RQFKOrderItemRemainder); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrderItemRemainder; stdcall;
    function  getList: RQFKOrderItemRemainderShortList; stdcall;
    function  getFilteredList(const aRQFKOrderItemRemainderFilter: RQFKOrderItemRemainderFilter): RQFKOrderItemRemainderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemRemainderShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrderItemRemainderFilter: RQFKOrderItemRemainderFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemRemainderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrderItemRemainderShortList; stdcall;
  end; 


implementation

  destructor RQFKOrderItemRemainder.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountInPlans) then
      countInPlans.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrderItemRemainderFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountInPlans) then
      countInPlans.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(Fbudget) then
      budget.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrderItemRemainderFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrderItemRemainderShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountInPlans) then
      countInPlans.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
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
    if Assigned(FbudgetDateStart) then
      budgetDateStart.Free;
    if Assigned(FbudgetDateFinal) then
      budgetDateFinal.Free;
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
  
  destructor RQFKOrderItemRemainderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainder, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainder');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainderRef');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainderFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainderShort');
  RemClassRegistry.RegisterXSClass(RQFKOrderItemRemainderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrderItemRemainderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrderItemRemainderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrderItemRemainderShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrderItemRemainderControllerSoapPort), 'http://ksoe.org/RQFKOrderItemRemainderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrderItemRemainderControllerSoapPort), 'http://ksoe.org/RQFKOrderItemRemainderController/action/RQFKOrderItemRemainderController.%operationName%');


end.
