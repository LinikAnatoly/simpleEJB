unit ENServicesMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENServicesCostController
   ,TKCalcMaterialsController
   ,TKMaterialsController
   ,TKTechCardController
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

  ENServicesMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENServicesMaterials = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasureUnitName : WideString;
    FpriceGen : TXSDecimal;
    FcountGen : TXSDecimal;
    FsumGen : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcMaterialsRef : TKCalcMaterialsRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FkartaRef : TKTechCardRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measureUnitName : WideString read FmeasureUnitName write FmeasureUnitName;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcMaterialsRef : TKCalcMaterialsRef read FcalcMaterialsRef write FcalcMaterialsRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property kartaRef : TKTechCardRef read FkartaRef write FkartaRef;
  end;

{
  ENServicesMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasureUnitName : WideString;
    FpriceGen : TXSDecimal;
    FcountGen : TXSDecimal;
    FsumGen : TXSDecimal;
//???
    FservicesCostRef : ENServicesCostRef;
//???
    FcalcMaterialsRef : TKCalcMaterialsRef;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FkartaRef : TKTechCardRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measureUnitName : WideString read FmeasureUnitName write FmeasureUnitName;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property servicesCostRef : ENServicesCostRef read FservicesCostRef write FservicesCostRef;
    property calcMaterialsRef : TKCalcMaterialsRef read FcalcMaterialsRef write FcalcMaterialsRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property kartaRef : TKTechCardRef read FkartaRef write FkartaRef;
  end;
}

  ENServicesMaterialsFilter = class(ENServicesMaterials)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENServicesMaterialsShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasureUnitName : WideString;
    FpriceGen : TXSDecimal;
    FcountGen : TXSDecimal;
    FsumGen : TXSDecimal;
    FservicesCostRefCode : Integer;
    FservicesCostRefDateGen : TXSDate;
    FservicesCostRefCountGen : TXSDecimal;
    FservicesCostRefCalculationCost : TXSDecimal;
    FservicesCostRefCostWithoutVAT : TXSDecimal;
    FservicesCostRefCostVAT : TXSDecimal;
    FservicesCostRefCostWithVAT : TXSDecimal;
    FcalcMaterialsRefCode : Integer;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FkartaRefCode : Integer;
    FkartaRefTechKartNumber : WideString;
    FkartaRefName : WideString;
    FkartaRefSafety : WideString;
    FkartaRefDateCreation : TXSDate;
    FkartaRefDateFrom : TXSDate;
    FkartaRefDateTo : TXSDate;
    FkartaRefWorkconditions : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measureUnitName : WideString read FmeasureUnitName write FmeasureUnitName;
    property priceGen : TXSDecimal read FpriceGen write FpriceGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property sumGen : TXSDecimal read FsumGen write FsumGen;

    property servicesCostRefCode : Integer read FservicesCostRefCode write FservicesCostRefCode;
    property servicesCostRefDateGen : TXSDate read FservicesCostRefDateGen write FservicesCostRefDateGen;
    property servicesCostRefCountGen : TXSDecimal read FservicesCostRefCountGen write FservicesCostRefCountGen;
    property servicesCostRefCalculationCost : TXSDecimal read FservicesCostRefCalculationCost write FservicesCostRefCalculationCost;
    property servicesCostRefCostWithoutVAT : TXSDecimal read FservicesCostRefCostWithoutVAT write FservicesCostRefCostWithoutVAT;
    property servicesCostRefCostVAT : TXSDecimal read FservicesCostRefCostVAT write FservicesCostRefCostVAT;
    property servicesCostRefCostWithVAT : TXSDecimal read FservicesCostRefCostWithVAT write FservicesCostRefCostWithVAT;
    property calcMaterialsRefCode : Integer read FcalcMaterialsRefCode write FcalcMaterialsRefCode;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property kartaRefCode : Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefTechKartNumber : WideString read FkartaRefTechKartNumber write FkartaRefTechKartNumber;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaRefSafety : WideString read FkartaRefSafety write FkartaRefSafety;
    property kartaRefDateCreation : TXSDate read FkartaRefDateCreation write FkartaRefDateCreation;
    property kartaRefDateFrom : TXSDate read FkartaRefDateFrom write FkartaRefDateFrom;
    property kartaRefDateTo : TXSDate read FkartaRefDateTo write FkartaRefDateTo;
    property kartaRefWorkconditions : WideString read FkartaRefWorkconditions write FkartaRefWorkconditions;
  end;

  ArrayOfENServicesMaterialsShort = array of ENServicesMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENServicesMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENServicesMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENServicesMaterialsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENServicesMaterialsController/message/
  // soapAction: http://ksoe.org/ENServicesMaterialsController/action/ENServicesMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENServicesMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENServicesMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENServicesMaterialsControllerSoapPort = interface(IInvokable)
  ['{83AA64D5-C73C-4EA8-B7FF-AC2F99839F95}']
    function add(const aENServicesMaterials: ENServicesMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENServicesMaterials: ENServicesMaterials); stdcall;
    function getObject(const anObjectCode: Integer): ENServicesMaterials; stdcall;
    function getList: ENServicesMaterialsShortList; stdcall;
    function getFilteredList(const aENServicesMaterialsFilter: ENServicesMaterialsFilter): ENServicesMaterialsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENServicesMaterialsShortList; stdcall;
    function getScrollableFilteredList(const aENServicesMaterialsFilter: ENServicesMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENServicesMaterialsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENServicesMaterialsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENServicesMaterialsFilter: ENServicesMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENServicesMaterialsShort; stdcall;
  end;


implementation

  destructor ENServicesMaterials.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcMaterialsRef) then
      calcMaterialsRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FkartaRef) then
      kartaRef.Free;
    inherited Destroy;
  end;

{
  destructor ENServicesMaterialsFilter.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FservicesCostRef) then
      servicesCostRef.Free;
    if Assigned(FcalcMaterialsRef) then
      calcMaterialsRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FkartaRef) then
      kartaRef.Free;
    inherited Destroy;
  end;
}

  destructor ENServicesMaterialsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENServicesMaterialsShort.Destroy;
  begin
    if Assigned(FpriceGen) then
      priceGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FservicesCostRefDateGen) then
      servicesCostRefDateGen.Free;
    if Assigned(FservicesCostRefCountGen) then
      servicesCostRefCountGen.Free;
    if Assigned(FservicesCostRefCalculationCost) then
      servicesCostRefCalculationCost.Free;
    if Assigned(FservicesCostRefCostWithoutVAT) then
      servicesCostRefCostWithoutVAT.Free;
    if Assigned(FservicesCostRefCostVAT) then
      servicesCostRefCostVAT.Free;
    if Assigned(FservicesCostRefCostWithVAT) then
      servicesCostRefCostWithVAT.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FkartaRefDateCreation) then
      kartaRefDateCreation.Free;
    if Assigned(FkartaRefDateFrom) then
      kartaRefDateFrom.Free;
    if Assigned(FkartaRefDateTo) then
      kartaRefDateTo.Free;
    inherited Destroy;
  end;

  destructor ENServicesMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENServicesMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesMaterials');
  RemClassRegistry.RegisterXSClass(ENServicesMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesMaterialsRef');
  RemClassRegistry.RegisterXSClass(ENServicesMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesMaterialsFilter');
  RemClassRegistry.RegisterXSClass(ENServicesMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesMaterialsShort');
  RemClassRegistry.RegisterXSClass(ENServicesMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENServicesMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENServicesMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENServicesMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENServicesMaterialsControllerSoapPort), 'http://ksoe.org/ENServicesMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENServicesMaterialsControllerSoapPort), 'http://ksoe.org/ENServicesMaterialsController/action/ENServicesMaterialsController.%operationName%');


end.
