unit RQAllocationListItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMaterialsController
   ,RQAllocationListController
   ,ENDepartmentController
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

  RQAllocationListItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListItem = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FlistRef : RQAllocationListRef;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property listRef : RQAllocationListRef read FlistRef write FlistRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;

{
  RQAllocationListItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FlistRef : RQAllocationListRef;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
    property listRef : RQAllocationListRef read FlistRef write FlistRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;
}

  RQAllocationListItemFilter = class(RQAllocationListItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
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
    FlistRefCode : Integer;
    FlistRefNumberGen : WideString;
    FlistRefDateGen : TXSDate;
    FlistRefDateStart : TXSDate;
    FlistRefDateFinal : TXSDate;
    FlistRefMolFromCode : WideString;
    FlistRefMolFromName : WideString;
    FlistRefMolToCode : WideString;
    FlistRefMolToName : WideString;
    FlistRefUserGen : WideString;
    FlistRefDateEdit : TXSDate;
    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;

    FnomenclatureNum : WideString;
    FnomenclatureName : WideString;
    FfkOrderItemCountFact : TXSDecimal;
    FfkOrderItemCode : Integer;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre;
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight;
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;
    property listRefCode : Integer read FlistRefCode write FlistRefCode;
    property listRefNumberGen : WideString read FlistRefNumberGen write FlistRefNumberGen;
    property listRefDateGen : TXSDate read FlistRefDateGen write FlistRefDateGen;
    property listRefDateStart : TXSDate read FlistRefDateStart write FlistRefDateStart;
    property listRefDateFinal : TXSDate read FlistRefDateFinal write FlistRefDateFinal;
    property listRefMolFromCode : WideString read FlistRefMolFromCode write FlistRefMolFromCode;
    property listRefMolFromName : WideString read FlistRefMolFromName write FlistRefMolFromName;
    property listRefMolToCode : WideString read FlistRefMolToCode write FlistRefMolToCode;
    property listRefMolToName : WideString read FlistRefMolToName write FlistRefMolToName;
    property listRefUserGen : WideString read FlistRefUserGen write FlistRefUserGen;
    property listRefDateEdit : TXSDate read FlistRefDateEdit write FlistRefDateEdit;
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart;
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal;

    property nomenclatureNum : WideString read FnomenclatureNum write FnomenclatureNum;
    property nomenclatureName : WideString read FnomenclatureName write FnomenclatureName;
    property fkOrderItemCountFact : TXSDecimal read FfkOrderItemCountFact write FfkOrderItemCountFact;
    property fkOrderItemCode : Integer read FfkOrderItemCode write FfkOrderItemCode;
  end;

  ArrayOfRQAllocationListItemShort = array of RQAllocationListItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListItemController/message/
  // soapAction: http://ksoe.org/RQAllocationListItemController/action/RQAllocationListItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListItemControllerSoapPort = interface(IInvokable)
  ['{7CAA90AF-3C7E-4335-B32D-BF5B7DB0AC88}']
    function add(const aRQAllocationListItem: RQAllocationListItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationListItem: RQAllocationListItem); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationListItem; stdcall;
    function getList: RQAllocationListItemShortList; stdcall;
    function getFilteredList(const aRQAllocationListItemFilter: RQAllocationListItemFilter): RQAllocationListItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItemShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListItemFilter: RQAllocationListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListItemFilter: RQAllocationListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListItemShort; stdcall;

    function getShortListForFKOrderItem(const aRQAllocationListItemFilter: RQAllocationListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListItemShortList; stdcall;
    // Удаление строки транзитного ордера на строке ведомости
    procedure removeItem(const listItemCode : Integer; const fkOrderItemCode : Integer); stdcall;

  end;


implementation

  destructor RQAllocationListItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FlistRef) then
      listRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;

{
  destructor RQAllocationListItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FlistRef) then
      listRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;
}

  destructor RQAllocationListItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQAllocationListItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
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
    if Assigned(FlistRefDateGen) then
      listRefDateGen.Free;
    if Assigned(FlistRefDateStart) then
      listRefDateStart.Free;
    if Assigned(FlistRefDateFinal) then
      listRefDateFinal.Free;
    if Assigned(FlistRefDateEdit) then
      listRefDateEdit.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    if Assigned(FfkOrderItemCountFact) then
      fkOrderItemCountFact.Free;

    inherited Destroy;
  end;

  destructor RQAllocationListItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationListItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItem');
  RemClassRegistry.RegisterXSClass(RQAllocationListItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItemRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItemFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItemShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListItemControllerSoapPort), 'http://ksoe.org/RQAllocationListItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListItemControllerSoapPort), 'http://ksoe.org/RQAllocationListItemController/action/RQAllocationListItemController.%operationName%');


end.
