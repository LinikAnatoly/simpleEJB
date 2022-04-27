unit ENTCOValuesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTechConditionsObjectsController
   ,ENTCOValuesTypeController
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

  ENTCOValues            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTCOValuesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTCOValues = class(TRemotable)
  private
    Fcode : Integer;
    Fdescription : WideString;
//???
    Ftechconditionsobjects : ENTechConditionsObjectsRef;
//???
    FtcoValuesType : ENTCOValuesTypeRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;
    property techconditionsobjects : ENTechConditionsObjectsRef read Ftechconditionsobjects write Ftechconditionsobjects;
    property tcoValuesType : ENTCOValuesTypeRef read FtcoValuesType write FtcoValuesType;
  end;

{
  ENTCOValuesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fdescription : WideString;
//???
    Ftechconditionsobjects : ENTechConditionsObjectsRef;
//???
    FtcoValuesType : ENTCOValuesTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;
    property techconditionsobjects : ENTechConditionsObjectsRef read Ftechconditionsobjects write Ftechconditionsobjects;
    property tcoValuesType : ENTCOValuesTypeRef read FtcoValuesType write FtcoValuesType;
  end;
}

  ENTCOValuesFilter = class(ENTCOValues)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTCOValuesShort = class(TRemotable)
  private
    Fcode : Integer;
    Fdescription : WideString;
    FtechconditionsobjectsCode : Integer;
    FtechconditionsobjectsNumberGen : WideString;
    FtechconditionsobjectsDateGen : TXSDate;
    FtechconditionsobjectsCustomer : WideString;
    FtechconditionsobjectsBuilding : WideString;
    FtechconditionsobjectsAddress : WideString;
    FtechconditionsobjectsTyCurrentPower : TXSDecimal;
    FtechconditionsobjectsTyServicesPower : TXSDecimal;
    FtechconditionsobjectsConnectionPowerPlaces : WideString;
    FtechconditionsobjectsConnectionPowerPlacesNum : WideString;
    FtechconditionsobjectsConnectionPowerPoint : WideString;
    FtechconditionsobjectsConnectionPowerPointNum : WideString;
    FtechconditionsobjectsConnectionSource : WideString;
    FtechconditionsobjectsConnectionSourceNum : WideString;
    FtechconditionsobjectsCat1CurrentPower : TXSDecimal;
    FtechconditionsobjectsCat2CurrentPower : TXSDecimal;
    FtechconditionsobjectsCat3CurrentPower : TXSDecimal;
    FtechconditionsobjectsCat1ServicesPower : TXSDecimal;
    FtechconditionsobjectsCat2ServicesPower : TXSDecimal;
    FtechconditionsobjectsCat3ServicesPower : TXSDecimal;
    FtechconditionsobjectsTyServicesPowerWaterHeating : TXSDecimal;
    FtechconditionsobjectsTyServicesPowerHeating : TXSDecimal;
    FtechconditionsobjectsTyServicesPowerCooker : TXSDecimal;
    FtechconditionsobjectsPowerGeneration : TXSDecimal;
    FtechconditionsobjectsYearGen : Integer;
    FtechconditionsobjectsPerformer : WideString;
    FtechconditionsobjectsPerformerPhone : WideString;
    FtechconditionsobjectsUserGen : WideString;
    FtechconditionsobjectsDateEdit : TXSDate;
    FtcoValuesTypeCode : Integer;
    FtcoValuesTypeName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property description : WideString read Fdescription write Fdescription;

    property techconditionsobjectsCode : Integer read FtechconditionsobjectsCode write FtechconditionsobjectsCode;
    property techconditionsobjectsNumberGen : WideString read FtechconditionsobjectsNumberGen write FtechconditionsobjectsNumberGen;
    property techconditionsobjectsDateGen : TXSDate read FtechconditionsobjectsDateGen write FtechconditionsobjectsDateGen;
    property techconditionsobjectsCustomer : WideString read FtechconditionsobjectsCustomer write FtechconditionsobjectsCustomer;
    property techconditionsobjectsBuilding : WideString read FtechconditionsobjectsBuilding write FtechconditionsobjectsBuilding;
    property techconditionsobjectsAddress : WideString read FtechconditionsobjectsAddress write FtechconditionsobjectsAddress;
    property techconditionsobjectsTyCurrentPower : TXSDecimal read FtechconditionsobjectsTyCurrentPower write FtechconditionsobjectsTyCurrentPower;
    property techconditionsobjectsTyServicesPower : TXSDecimal read FtechconditionsobjectsTyServicesPower write FtechconditionsobjectsTyServicesPower;
    property techconditionsobjectsConnectionPowerPlaces : WideString read FtechconditionsobjectsConnectionPowerPlaces write FtechconditionsobjectsConnectionPowerPlaces;
    property techconditionsobjectsConnectionPowerPlacesNum : WideString read FtechconditionsobjectsConnectionPowerPlacesNum write FtechconditionsobjectsConnectionPowerPlacesNum;
    property techconditionsobjectsConnectionPowerPoint : WideString read FtechconditionsobjectsConnectionPowerPoint write FtechconditionsobjectsConnectionPowerPoint;
    property techconditionsobjectsConnectionPowerPointNum : WideString read FtechconditionsobjectsConnectionPowerPointNum write FtechconditionsobjectsConnectionPowerPointNum;
    property techconditionsobjectsConnectionSource : WideString read FtechconditionsobjectsConnectionSource write FtechconditionsobjectsConnectionSource;
    property techconditionsobjectsConnectionSourceNum : WideString read FtechconditionsobjectsConnectionSourceNum write FtechconditionsobjectsConnectionSourceNum;
    property techconditionsobjectsCat1CurrentPower : TXSDecimal read FtechconditionsobjectsCat1CurrentPower write FtechconditionsobjectsCat1CurrentPower;
    property techconditionsobjectsCat2CurrentPower : TXSDecimal read FtechconditionsobjectsCat2CurrentPower write FtechconditionsobjectsCat2CurrentPower;
    property techconditionsobjectsCat3CurrentPower : TXSDecimal read FtechconditionsobjectsCat3CurrentPower write FtechconditionsobjectsCat3CurrentPower;
    property techconditionsobjectsCat1ServicesPower : TXSDecimal read FtechconditionsobjectsCat1ServicesPower write FtechconditionsobjectsCat1ServicesPower;
    property techconditionsobjectsCat2ServicesPower : TXSDecimal read FtechconditionsobjectsCat2ServicesPower write FtechconditionsobjectsCat2ServicesPower;
    property techconditionsobjectsCat3ServicesPower : TXSDecimal read FtechconditionsobjectsCat3ServicesPower write FtechconditionsobjectsCat3ServicesPower;
    property techconditionsobjectsTyServicesPowerWaterHeating : TXSDecimal read FtechconditionsobjectsTyServicesPowerWaterHeating write FtechconditionsobjectsTyServicesPowerWaterHeating;
    property techconditionsobjectsTyServicesPowerHeating : TXSDecimal read FtechconditionsobjectsTyServicesPowerHeating write FtechconditionsobjectsTyServicesPowerHeating;
    property techconditionsobjectsTyServicesPowerCooker : TXSDecimal read FtechconditionsobjectsTyServicesPowerCooker write FtechconditionsobjectsTyServicesPowerCooker;
    property techconditionsobjectsPowerGeneration : TXSDecimal read FtechconditionsobjectsPowerGeneration write FtechconditionsobjectsPowerGeneration;
    property techconditionsobjectsYearGen : Integer read FtechconditionsobjectsYearGen write FtechconditionsobjectsYearGen;
    property techconditionsobjectsPerformer : WideString read FtechconditionsobjectsPerformer write FtechconditionsobjectsPerformer;
    property techconditionsobjectsPerformerPhone : WideString read FtechconditionsobjectsPerformerPhone write FtechconditionsobjectsPerformerPhone;
    property techconditionsobjectsUserGen : WideString read FtechconditionsobjectsUserGen write FtechconditionsobjectsUserGen;
    property techconditionsobjectsDateEdit : TXSDate read FtechconditionsobjectsDateEdit write FtechconditionsobjectsDateEdit;
    property tcoValuesTypeCode : Integer read FtcoValuesTypeCode write FtcoValuesTypeCode;
    property tcoValuesTypeName : WideString read FtcoValuesTypeName write FtcoValuesTypeName;
  end;

  ArrayOfENTCOValuesShort = array of ENTCOValuesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTCOValuesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTCOValuesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTCOValuesShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTCOValuesController/message/
  // soapAction: http://ksoe.org/ENTCOValuesController/action/ENTCOValuesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTCOValuesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTCOValuesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTCOValuesControllerSoapPort = interface(IInvokable)
  ['{235EE9D0-F8C1-498D-8361-3C7BF1086110}']
    function add(const aENTCOValues: ENTCOValues): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTCOValues: ENTCOValues); stdcall;
    function getObject(const anObjectCode: Integer): ENTCOValues; stdcall;
    function getList: ENTCOValuesShortList; stdcall;
    function getFilteredList(const aENTCOValuesFilter: ENTCOValuesFilter): ENTCOValuesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesShortList; stdcall;
    function getScrollableFilteredList(const aENTCOValuesFilter: ENTCOValuesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTCOValuesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTCOValuesFilter: ENTCOValuesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTCOValuesShort; stdcall;
  end;


implementation

  destructor ENTCOValues.Destroy;
  begin
    if Assigned(Ftechconditionsobjects) then
      techconditionsobjects.Free;
    if Assigned(FtcoValuesType) then
      tcoValuesType.Free;
    inherited Destroy;
  end;

{
  destructor ENTCOValuesFilter.Destroy;
  begin
    if Assigned(Ftechconditionsobjects) then
      techconditionsobjects.Free;
    if Assigned(FtcoValuesType) then
      tcoValuesType.Free;
    inherited Destroy;
  end;
}

  destructor ENTCOValuesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTCOValuesShort.Destroy;
  begin
    if Assigned(FtechconditionsobjectsDateGen) then
      techconditionsobjectsDateGen.Free;
    if Assigned(FtechconditionsobjectsTyCurrentPower) then
      techconditionsobjectsTyCurrentPower.Free;
    if Assigned(FtechconditionsobjectsTyServicesPower) then
      techconditionsobjectsTyServicesPower.Free;
    if Assigned(FtechconditionsobjectsCat1CurrentPower) then
      techconditionsobjectsCat1CurrentPower.Free;
    if Assigned(FtechconditionsobjectsCat2CurrentPower) then
      techconditionsobjectsCat2CurrentPower.Free;
    if Assigned(FtechconditionsobjectsCat3CurrentPower) then
      techconditionsobjectsCat3CurrentPower.Free;
    if Assigned(FtechconditionsobjectsCat1ServicesPower) then
      techconditionsobjectsCat1ServicesPower.Free;
    if Assigned(FtechconditionsobjectsCat2ServicesPower) then
      techconditionsobjectsCat2ServicesPower.Free;
    if Assigned(FtechconditionsobjectsCat3ServicesPower) then
      techconditionsobjectsCat3ServicesPower.Free;
    if Assigned(FtechconditionsobjectsTyServicesPowerWaterHeating) then
      techconditionsobjectsTyServicesPowerWaterHeating.Free;
    if Assigned(FtechconditionsobjectsTyServicesPowerHeating) then
      techconditionsobjectsTyServicesPowerHeating.Free;
    if Assigned(FtechconditionsobjectsTyServicesPowerCooker) then
      techconditionsobjectsTyServicesPowerCooker.Free;
    if Assigned(FtechconditionsobjectsPowerGeneration) then
      techconditionsobjectsPowerGeneration.Free;
    if Assigned(FtechconditionsobjectsDateEdit) then
      techconditionsobjectsDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENTCOValuesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTCOValues, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValues');
  RemClassRegistry.RegisterXSClass(ENTCOValuesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesRef');
  RemClassRegistry.RegisterXSClass(ENTCOValuesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesFilter');
  RemClassRegistry.RegisterXSClass(ENTCOValuesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesShort');
  RemClassRegistry.RegisterXSClass(ENTCOValuesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTCOValuesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTCOValuesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTCOValuesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTCOValuesControllerSoapPort), 'http://ksoe.org/ENTCOValuesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTCOValuesControllerSoapPort), 'http://ksoe.org/ENTCOValuesController/action/ENTCOValuesController.%operationName%');


end.
