unit RQPackingListItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,RQStorageZoneController
   ,RQPackingListItemTypeController
   ,RQPackingListController
   , SCCounterController
   , ENEstimateItemController
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

  RQPackingListItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListItem = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    Fnn : WideString;
    FmeasurementName : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FestimateItemString : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;

 /// столбцы с палетами (пока только с 1 по 4)
    FnamePaletCol1 : WideString;
    FcountPaletCol1 : TXSDecimal;
    FnamePaletCol2 : WideString;
    FcountPaletCol2 : TXSDecimal;
    FnamePaletCol3 : WideString;
    FcountPaletCol3 : TXSDecimal;
    FnamePaletCol4 : WideString;
    FcountPaletCol4 : TXSDecimal;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FstorageZoneRef : RQStorageZoneRef;
//???
    FitemTypeRef : RQPackingListItemTypeRef;
//???
    FpackingListRef : RQPackingListRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property nn : WideString read Fnn write Fnn;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property estimateItemString : WideString read FestimateItemString write FestimateItemString;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;

    property namePaletCol1 : WideString read FnamePaletCol1 write FnamePaletCol1;
    property countPaletCol1 : TXSDecimal read FcountPaletCol1 write FcountPaletCol1;
    property namePaletCol2 : WideString read FnamePaletCol2 write FnamePaletCol2;
    property countPaletCol2 : TXSDecimal read FcountPaletCol2 write FcountPaletCol2;
    property namePaletCol3 : WideString read FnamePaletCol3 write FnamePaletCol3;
    property countPaletCol3 : TXSDecimal read FcountPaletCol3 write FcountPaletCol3;
    property namePaletCol4 : WideString read FnamePaletCol4 write FnamePaletCol4;
    property countPaletCol4 : TXSDecimal read FcountPaletCol4 write FcountPaletCol4;

    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property storageZoneRef : RQStorageZoneRef read FstorageZoneRef write FstorageZoneRef;
    property itemTypeRef : RQPackingListItemTypeRef read FitemTypeRef write FitemTypeRef;
    property packingListRef : RQPackingListRef read FpackingListRef write FpackingListRef;
  end;

  RQPackingListItemFilter = class(RQPackingListItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingListItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    Fnn : WideString;
    FmeasurementName : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FestimateItemString : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialRefCostnkre : TXSDecimal;
    FmaterialRefWeight : TXSDecimal;
    FmaterialRefCostAlternative : TXSDecimal;
    FstorageZoneRefCode : Integer;
    FstorageZoneRefName : WideString;
    FstorageZoneRefDescription : WideString;
    FstorageZoneRefUserGen : WideString;
    FstorageZoneRefDateEdit : TXSDateTime;
    FitemTypeRefCode : Integer;
    FitemTypeRefName : WideString;

    FnamePaletCol1 : WideString;
    FcountPaletCol1 : TXSDecimal;
    FnamePaletCol2 : WideString;
    FcountPaletCol2 : TXSDecimal;
    FnamePaletCol3 : WideString;
    FcountPaletCol3 : TXSDecimal;
    FnamePaletCol4 : WideString;
    FcountPaletCol4 : TXSDecimal;

    FpackingListRefCode : Integer;
    FpackingListRefNumberGen : WideString;
    FpackingListRefDateGen : TXSDate;
    FpackingListRefMolFromCode : WideString;
    FpackingListRefMolFromName : WideString;
    FpackingListRefMolToCode : WideString;
    FpackingListRefMolToName : WideString;
    FpackingListRefDateStart : TXSDate;
    FpackingListRefDateFinal : TXSDate;
    FpackingListRefBudgetString : WideString;
    FpackingListRefMaterialString : WideString;
    FpackingListRefPackerFIO : WideString;
    FpackingListRefPackerTabNumber : WideString;
    FpackingListRefPackerPosition : WideString;
    FpackingListRefUserGen : WideString;
    FpackingListRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property nn : WideString read Fnn write Fnn;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property estimateItemString : WideString read FestimateItemString write FestimateItemString;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property namePaletCol1 : WideString read FnamePaletCol1 write FnamePaletCol1;
    property countPaletCol1 : TXSDecimal read FcountPaletCol1 write FcountPaletCol1;
    property namePaletCol2 : WideString read FnamePaletCol2 write FnamePaletCol2;
    property countPaletCol2 : TXSDecimal read FcountPaletCol2 write FcountPaletCol2;
    property namePaletCol3 : WideString read FnamePaletCol3 write FnamePaletCol3;
    property countPaletCol3 : TXSDecimal read FcountPaletCol3 write FcountPaletCol3;
    property namePaletCol4 : WideString read FnamePaletCol4 write FnamePaletCol4;
    property countPaletCol4 : TXSDecimal read FcountPaletCol4 write FcountPaletCol4;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre;
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight;
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;
    property storageZoneRefCode : Integer read FstorageZoneRefCode write FstorageZoneRefCode;
    property storageZoneRefName : WideString read FstorageZoneRefName write FstorageZoneRefName;
    property storageZoneRefDescription : WideString read FstorageZoneRefDescription write FstorageZoneRefDescription;
    property storageZoneRefUserGen : WideString read FstorageZoneRefUserGen write FstorageZoneRefUserGen;
    property storageZoneRefDateEdit : TXSDateTime read FstorageZoneRefDateEdit write FstorageZoneRefDateEdit;
    property itemTypeRefCode : Integer read FitemTypeRefCode write FitemTypeRefCode;
    property itemTypeRefName : WideString read FitemTypeRefName write FitemTypeRefName;
    property packingListRefCode : Integer read FpackingListRefCode write FpackingListRefCode;
    property packingListRefNumberGen : WideString read FpackingListRefNumberGen write FpackingListRefNumberGen;
    property packingListRefDateGen : TXSDate read FpackingListRefDateGen write FpackingListRefDateGen;
    property packingListRefMolFromCode : WideString read FpackingListRefMolFromCode write FpackingListRefMolFromCode;
    property packingListRefMolFromName : WideString read FpackingListRefMolFromName write FpackingListRefMolFromName;
    property packingListRefMolToCode : WideString read FpackingListRefMolToCode write FpackingListRefMolToCode;
    property packingListRefMolToName : WideString read FpackingListRefMolToName write FpackingListRefMolToName;
    property packingListRefDateStart : TXSDate read FpackingListRefDateStart write FpackingListRefDateStart;
    property packingListRefDateFinal : TXSDate read FpackingListRefDateFinal write FpackingListRefDateFinal;
    property packingListRefBudgetString : WideString read FpackingListRefBudgetString write FpackingListRefBudgetString;
    property packingListRefMaterialString : WideString read FpackingListRefMaterialString write FpackingListRefMaterialString;
    property packingListRefPackerFIO : WideString read FpackingListRefPackerFIO write FpackingListRefPackerFIO;
    property packingListRefPackerTabNumber : WideString read FpackingListRefPackerTabNumber write FpackingListRefPackerTabNumber;
    property packingListRefPackerPosition : WideString read FpackingListRefPackerPosition write FpackingListRefPackerPosition;
    property packingListRefUserGen : WideString read FpackingListRefUserGen write FpackingListRefUserGen;
    property packingListRefDateEdit : TXSDate read FpackingListRefDateEdit write FpackingListRefDateEdit;
  end;

  ArrayOfRQPackingListItemShort = array of RQPackingListItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingListItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingListItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingListItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

    // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENEstimateItem2RQPackingListItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FpartiesString : WideString;
//???
    FpackingListItemRef : RQPackingListItemRef;
//???
    FestimateItemRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property partiesString : WideString read FpartiesString write FpartiesString;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
  end;

  ENEstimateItem2RQPackingListItemFilter = class(ENEstimateItem2RQPackingListItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENEstimateItem2RQPackingListItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FpartiesString : WideString;
    FpackingListItemRefCode : Integer;
    FpackingListItemRefMaterialName : WideString;
    FpackingListItemRefNn : WideString;
    FpackingListItemRefMeasurementName : WideString;
    FpackingListItemRefCountGen : TXSDecimal;
    FpackingListItemRefCountFact : TXSDecimal;
    FpackingListItemRefEstimateItemString : WideString;
    FpackingListItemRefUserGen : WideString;
    FpackingListItemRefDateEdit : TXSDate;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FplanElementName : WideString;
    FplanYearGen : Integer;
    FplanMonthGen : Integer;
    FplanFormName : WideString;
    FplanStateName : WideString;
    FplanTypeName : WideString;
    FplanBudgetName : WideString;
	FkartaRefNumber : WideString;
    FkartaRefName : WideString;
    Fcost : TXSDecimal;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property partiesString : WideString read FpartiesString write FpartiesString;

    property packingListItemRefCode : Integer read FpackingListItemRefCode write FpackingListItemRefCode;
    property packingListItemRefMaterialName : WideString read FpackingListItemRefMaterialName write FpackingListItemRefMaterialName;
    property packingListItemRefNn : WideString read FpackingListItemRefNn write FpackingListItemRefNn;
    property packingListItemRefMeasurementName : WideString read FpackingListItemRefMeasurementName write FpackingListItemRefMeasurementName;
    property packingListItemRefCountGen : TXSDecimal read FpackingListItemRefCountGen write FpackingListItemRefCountGen;
    property packingListItemRefCountFact : TXSDecimal read FpackingListItemRefCountFact write FpackingListItemRefCountFact;
    property packingListItemRefEstimateItemString : WideString read FpackingListItemRefEstimateItemString write FpackingListItemRefEstimateItemString;
    property packingListItemRefUserGen : WideString read FpackingListItemRefUserGen write FpackingListItemRefUserGen;
    property packingListItemRefDateEdit : TXSDate read FpackingListItemRefDateEdit write FpackingListItemRefDateEdit;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
    property planYearGen : Integer read FplanYearGen write FplanYearGen;
    property planMonthGen : Integer read FplanMonthGen write FplanMonthGen;
    property planElementName : WideString read FplanElementName write FplanElementName;
    property planFormName : WideString read FplanFormName write FplanFormName;
    property planStateName : WideString read FplanStateName write FplanStateName;
    property planTypeName : WideString read FplanTypeName write FplanTypeName;
    property planBudgetName : WideString read FplanBudgetName write FplanBudgetName;
    property kartaRefNumber : WideString read FkartaRefNumber write FkartaRefNumber;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property cost : TXSDecimal read Fcost write Fcost;
  end;

  ArrayOfENEstimateItem2RQPackingListItemShort = array of ENEstimateItem2RQPackingListItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }
  ArrayOfENEstimateItem2RQPackingListItem = array of ENEstimateItem2RQPackingListItem;  // { "http://ksoe.org/EnergyproControllerService/type/" }


  ENEstimateItem2RQPackingListItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENEstimateItem2RQPackingListItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENEstimateItem2RQPackingListItemShort read Flist write Flist;
  end;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingListItemController/message/
  // soapAction: http://ksoe.org/RQPackingListItemController/action/RQPackingListItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingListItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingListItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingListItemControllerSoapPort = interface(IInvokable)
  ['{21f421f4-21f4-21f4-21f4-21f421f421f4}']
    function add(const aRQPackingListItem: RQPackingListItem): Integer; stdcall;
    procedure remove(const anObject: ENEstimateItem2RQPackingListItem); stdcall; overload;
    procedure save(const isENEstimateItem2RQPackingListItem: Boolean; const anObjects: ArrayOfENEstimateItem2RQPackingListItem); stdcall; overload;
    procedure remove(const anObjectCode: Integer); stdcall; overload;
    procedure remove(const isENEstimateItem2RQPackingListItem: Boolean; const codes : ArrayOfInteger); stdcall; overload;
    procedure save(const aRQPackingListItem: RQPackingListItem); stdcall; overload;
    function getObject(const anObjectCode: Integer): RQPackingListItem; stdcall;
    function getList: RQPackingListItemShortList; stdcall;
    function getFilteredList(const aRQPackingListItemFilter: RQPackingListItemFilter): RQPackingListItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingListItemFilter: RQPackingListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemShortList; stdcall; overload;
    function getScrollableFilteredList(const aENEstimateItem2RQPackingListItemFilter: ENEstimateItem2RQPackingListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENEstimateItem2RQPackingListItemShortList; stdcall; overload;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingListItemFilter: RQPackingListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingListItemShort; stdcall;

    function getScrollableFilteredListForEdit(const aRQPackingListItemFilter: RQPackingListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListItemShortList; stdcall;
    procedure addStringAutomatic(const anPackingListObject: RQPackingList; aGroupOrMaterial: Integer); stdcall;
    procedure findRemainsAndReservAutomaticForRQPackingList(const anPackingListCode: Integer); stdcall;
    procedure savePackingItems(const aPackingItemsArrayOfShort: ArrayOfRQPackingListItemShort); stdcall;
    procedure createChildOrdersByPackingList(const aPackingListCode: Integer);stdcall;
    procedure removeOrdersByPackingList(const aPackingListCode: Integer);stdcall;
    procedure updateFactQuantity(const aPackingListItemCode: Integer; const newQty : TXSDecimal);stdcall;
    procedure addNewCountersBySCOrderCode(const anPackingListCode: Integer; const scOrderCode : Integer); stdcall;
    procedure addBUCounters(const anPackingListCode: Integer; const counters : SCCounterController.ArrayOfSCCounterShort; const boxCode : Integer); stdcall;
    function checkCounterInScanCounter(const invNumber: string; const packingListMolCode: string; const rqPackingListDate : TXSDate): WideString; stdcall;

  end;
implementation

  destructor RQPackingListItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountPaletCol1) then
      countPaletCol1.Free;
    if Assigned(FcountPaletCol2) then
      countPaletCol2.Free;
    if Assigned(FcountPaletCol3) then
      countPaletCol3.Free;
    if Assigned(FcountPaletCol4) then
      countPaletCol4.Free;  
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FstorageZoneRef) then
      storageZoneRef.Free;
    if Assigned(FitemTypeRef) then
      itemTypeRef.Free;
    if Assigned(FpackingListRef) then
      packingListRef.Free;
    inherited Destroy;
  end;

  destructor RQPackingListItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPackingListItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FcountPaletCol1) then
      countPaletCol1.Free;
    if Assigned(FcountPaletCol2) then
      countPaletCol2.Free;
    if Assigned(FcountPaletCol3) then
      countPaletCol3.Free;
    if Assigned(FcountPaletCol4) then
      countPaletCol4.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmaterialRefCostnkre) then
      materialRefCostnkre.Free;
    if Assigned(FmaterialRefWeight) then
      materialRefWeight.Free;
    if Assigned(FmaterialRefCostAlternative) then
      materialRefCostAlternative.Free;
    if Assigned(FstorageZoneRefDateEdit) then
      storageZoneRefDateEdit.Free;
    if Assigned(FpackingListRefDateGen) then
      packingListRefDateGen.Free;
    if Assigned(FpackingListRefDateStart) then
      packingListRefDateStart.Free;
    if Assigned(FpackingListRefDateFinal) then
      packingListRefDateFinal.Free;
    if Assigned(FpackingListRefDateEdit) then
      packingListRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQPackingListItemShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

    destructor ENEstimateItem2RQPackingListItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    inherited Destroy;
  end;

  destructor ENEstimateItem2RQPackingListItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENEstimateItem2RQPackingListItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FpackingListItemRefCountGen) then
      packingListItemRefCountGen.Free;
    if Assigned(FpackingListItemRefCountFact) then
      packingListItemRefCountFact.Free;
    if Assigned(FpackingListItemRefDateEdit) then
      packingListItemRefDateEdit.Free;
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
    if Assigned(Fcost) then
      Fcost.Free;
    inherited Destroy;
  end;

  destructor ENEstimateItem2RQPackingListItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingListItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItem');
  RemClassRegistry.RegisterXSClass(RQPackingListItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemRef');
  RemClassRegistry.RegisterXSClass(RQPackingListItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemFilter');
  RemClassRegistry.RegisterXSClass(RQPackingListItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemShort');
  RemClassRegistry.RegisterXSClass(RQPackingListItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingListItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingListItemShort');

  RemClassRegistry.RegisterXSClass(ENEstimateItem2RQPackingListItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2RQPackingListItem');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2RQPackingListItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2RQPackingListItemFilter');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2RQPackingListItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2RQPackingListItemShort');
  RemClassRegistry.RegisterXSClass(ENEstimateItem2RQPackingListItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENEstimateItem2RQPackingListItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENEstimateItem2RQPackingListItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENEstimateItem2RQPackingListItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingListItemControllerSoapPort), 'http://ksoe.org/RQPackingListItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingListItemControllerSoapPort), 'http://ksoe.org/RQPackingListItemController/action/RQPackingListItemController.%operationName%');
end.
