unit RQBoxItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQBoxController
   ,SCCounterController
   ,RQPackingListItemController
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

  RQBoxItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBoxItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQBoxItem = class(TRemotable)
  private
    Fcode : Integer;
//???
    FboxRef : RQBoxRef;
//???
    FcounterRef : SCCounterRef;
//???
    FpackingListItemRef : RQPackingListItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property boxRef : RQBoxRef read FboxRef write FboxRef;
    property counterRef : SCCounterRef read FcounterRef write FcounterRef;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
  end;

{
  RQBoxItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    FboxRef : RQBoxRef;
//???
    FcounterRef : SCCounterRef;
//???
    FpackingListItemRef : RQPackingListItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property boxRef : RQBoxRef read FboxRef write FboxRef;
    property counterRef : SCCounterRef read FcounterRef write FcounterRef;
    property packingListItemRef : RQPackingListItemRef read FpackingListItemRef write FpackingListItemRef;
  end;
}

  RQBoxItemFilter = class(RQBoxItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQBoxItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FboxRefCode : Integer;
    FboxRefNumberGen : WideString;
    FboxRefCountGen : TXSDecimal;
    FcounterRefCode : Integer;
    FcounterRefInvNumber : WideString;
    FcounterRefName : WideString;
    FcounterRefBuildNumber : WideString;
    FcounterRefAccount : WideString;
    FcounterRefDepartmetFKCode : WideString;
    FcounterRefMolCode : WideString;
    FcounterRefDateIn : TXSDate;
    FcounterRefDateBuild : TXSDate;
    FcounterRefDateCheck : TXSDate;
    FcounterRefCost : TXSDecimal;
    FcounterRefScCode : Integer;
    FcounterRefCounterType : WideString;
    FcounterRefInstallOrderNumber : WideString;
    FcounterRefReading : WideString;
    FcounterRefDateEdit : TXSDateTime;
    FpackingListItemRefCode : Integer;
    FpackingListItemRefMaterialName : WideString;
    FpackingListItemRefNn : WideString;
    FpackingListItemRefMeasurementName : WideString;
    FpackingListItemRefCountGen : TXSDecimal;
    FpackingListItemRefCountFact : TXSDecimal;
    FpackingListItemRefEstimateItemString : WideString;
    FpackingListItemRefUserGen : WideString;
    FpackingListItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property boxRefCode : Integer read FboxRefCode write FboxRefCode;
    property boxRefNumberGen : WideString read FboxRefNumberGen write FboxRefNumberGen;
    property boxRefCountGen : TXSDecimal read FboxRefCountGen write FboxRefCountGen;
    property counterRefCode : Integer read FcounterRefCode write FcounterRefCode;
    property counterRefInvNumber : WideString read FcounterRefInvNumber write FcounterRefInvNumber;
    property counterRefName : WideString read FcounterRefName write FcounterRefName;
    property counterRefBuildNumber : WideString read FcounterRefBuildNumber write FcounterRefBuildNumber;
    property counterRefAccount : WideString read FcounterRefAccount write FcounterRefAccount;
    property counterRefDepartmetFKCode : WideString read FcounterRefDepartmetFKCode write FcounterRefDepartmetFKCode;
    property counterRefMolCode : WideString read FcounterRefMolCode write FcounterRefMolCode;
    property counterRefDateIn : TXSDate read FcounterRefDateIn write FcounterRefDateIn;
    property counterRefDateBuild : TXSDate read FcounterRefDateBuild write FcounterRefDateBuild;
    property counterRefDateCheck : TXSDate read FcounterRefDateCheck write FcounterRefDateCheck;
    property counterRefCost : TXSDecimal read FcounterRefCost write FcounterRefCost;
    property counterRefScCode : Integer read FcounterRefScCode write FcounterRefScCode;
    property counterRefCounterType : WideString read FcounterRefCounterType write FcounterRefCounterType;
    property counterRefInstallOrderNumber : WideString read FcounterRefInstallOrderNumber write FcounterRefInstallOrderNumber;
    property counterRefReading : WideString read FcounterRefReading write FcounterRefReading;
    property counterRefDateEdit : TXSDateTime read FcounterRefDateEdit write FcounterRefDateEdit;
    property packingListItemRefCode : Integer read FpackingListItemRefCode write FpackingListItemRefCode;
    property packingListItemRefMaterialName : WideString read FpackingListItemRefMaterialName write FpackingListItemRefMaterialName;
    property packingListItemRefNn : WideString read FpackingListItemRefNn write FpackingListItemRefNn;
    property packingListItemRefMeasurementName : WideString read FpackingListItemRefMeasurementName write FpackingListItemRefMeasurementName;
    property packingListItemRefCountGen : TXSDecimal read FpackingListItemRefCountGen write FpackingListItemRefCountGen;
    property packingListItemRefCountFact : TXSDecimal read FpackingListItemRefCountFact write FpackingListItemRefCountFact;
    property packingListItemRefEstimateItemString : WideString read FpackingListItemRefEstimateItemString write FpackingListItemRefEstimateItemString;
    property packingListItemRefUserGen : WideString read FpackingListItemRefUserGen write FpackingListItemRefUserGen;
    property packingListItemRefDateEdit : TXSDate read FpackingListItemRefDateEdit write FpackingListItemRefDateEdit;
  end;

  ArrayOfRQBoxItemShort = array of RQBoxItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQBoxItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQBoxItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQBoxItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQBoxItemController/message/
  // soapAction: http://ksoe.org/RQBoxItemController/action/RQBoxItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQBoxItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQBoxItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQBoxItemControllerSoapPort = interface(IInvokable)
  ['{2a472a47-2a47-2a47-2a47-2a472a472a47}']
    function add(const aRQBoxItem: RQBoxItem): Integer; stdcall;
    procedure remove(const arrayOfCodes : ArrayOfInteger; const packingListCode: Integer); stdcall;
    procedure save(const aRQBoxItem: RQBoxItem); stdcall;
    function getObject(const anObjectCode: Integer): RQBoxItem; stdcall;
    function getList: RQBoxItemShortList; stdcall;
    function getFilteredList(const aRQBoxItemFilter: RQBoxItemFilter): RQBoxItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQBoxItemShortList; stdcall;
    function getScrollableFilteredList(const aRQBoxItemFilter: RQBoxItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQBoxItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQBoxItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQBoxItemFilter: RQBoxItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQBoxItemShort; stdcall;
  end;


implementation

  destructor RQBoxItem.Destroy;
  begin
    if Assigned(FboxRef) then
      boxRef.Free;
    if Assigned(FcounterRef) then
      counterRef.Free;
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    inherited Destroy;
  end;

{
  destructor RQBoxItemFilter.Destroy;
  begin
    if Assigned(FboxRef) then
      boxRef.Free;
    if Assigned(FcounterRef) then
      counterRef.Free;
    if Assigned(FpackingListItemRef) then
      packingListItemRef.Free;
    inherited Destroy;
  end;
}

  destructor RQBoxItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQBoxItemShort.Destroy;
  begin
    if Assigned(FboxRefCountGen) then
      boxRefCountGen.Free;
    if Assigned(FcounterRefDateIn) then
      counterRefDateIn.Free;
    if Assigned(FcounterRefDateBuild) then
      counterRefDateBuild.Free;
    if Assigned(FcounterRefDateCheck) then
      counterRefDateCheck.Free;
    if Assigned(FcounterRefCost) then
      counterRefCost.Free;
    if Assigned(FcounterRefDateEdit) then
      counterRefDateEdit.Free;
    if Assigned(FpackingListItemRefCountGen) then
      packingListItemRefCountGen.Free;
    if Assigned(FpackingListItemRefCountFact) then
      packingListItemRefCountFact.Free;
    if Assigned(FpackingListItemRefDateEdit) then
      packingListItemRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor RQBoxItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQBoxItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxItem');
  RemClassRegistry.RegisterXSClass(RQBoxItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxItemRef');
  RemClassRegistry.RegisterXSClass(RQBoxItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxItemFilter');
  RemClassRegistry.RegisterXSClass(RQBoxItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxItemShort');
  RemClassRegistry.RegisterXSClass(RQBoxItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQBoxItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQBoxItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQBoxItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQBoxItemControllerSoapPort), 'http://ksoe.org/RQBoxItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQBoxItemControllerSoapPort), 'http://ksoe.org/RQBoxItemController/action/RQBoxItemController.%operationName%');


end.
