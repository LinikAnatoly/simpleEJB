unit ENTechConditionsObjectsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
   ,ENDepartmentController
   ,ENPowerReliabilityCategoryController
   ,ENConnectionPowerPointController
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

  ENTechConditionsObjects            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsObjectsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTechConditionsObjects = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    Fcustomer : WideString;
    Fbuilding : WideString;
    Faddress : WideString;
    FtyCurrentPower : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FconnectionPowerPlaces : WideString;
    FconnectionPowerPlacesNum : WideString;
    FconnectionPowerPoint : WideString;
    FconnectionPowerPointNum : WideString;
    FconnectionSource : WideString;
    FconnectionSourceNum : WideString;
    Fcat1CurrentPower : TXSDecimal;
    Fcat2CurrentPower : TXSDecimal;
    Fcat3CurrentPower : TXSDecimal;
    Fcat1ServicesPower : TXSDecimal;
    Fcat2ServicesPower : TXSDecimal;
    Fcat3ServicesPower : TXSDecimal;
    FtyServicesPowerWaterHeating : TXSDecimal;
    FtyServicesPowerHeating : TXSDecimal;
    FtyServicesPowerCooker : TXSDecimal;
    FvoltageCurrent : Integer;
    FvoltageServices : Integer;
    FpowerGeneration : TXSDecimal;
    FyearGen : Integer;
    Fperformer : WideString;
    FperformerPhone : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FsecurityZone : Integer;
    FobjectSecurityZone : WideString;
    FidentNumber : Integer;
    FdateChangeTU : TXSDate;
//???
    Felement : ENElement;
//???
    Fdepartment : ENDepartment;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property customer : WideString read Fcustomer write Fcustomer;
    property building : WideString read Fbuilding write Fbuilding;
    property address : WideString read Faddress write Faddress;
    property tyCurrentPower : TXSDecimal read FtyCurrentPower write FtyCurrentPower;
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower;
    property connectionPowerPlaces : WideString read FconnectionPowerPlaces write FconnectionPowerPlaces;
    property connectionPowerPlacesNum : WideString read FconnectionPowerPlacesNum write FconnectionPowerPlacesNum;
    property connectionPowerPoint : WideString read FconnectionPowerPoint write FconnectionPowerPoint;
    property connectionPowerPointNum : WideString read FconnectionPowerPointNum write FconnectionPowerPointNum;
    property connectionSource : WideString read FconnectionSource write FconnectionSource;
    property connectionSourceNum : WideString read FconnectionSourceNum write FconnectionSourceNum;
    property cat1CurrentPower : TXSDecimal read Fcat1CurrentPower write Fcat1CurrentPower;
    property cat2CurrentPower : TXSDecimal read Fcat2CurrentPower write Fcat2CurrentPower;
    property cat3CurrentPower : TXSDecimal read Fcat3CurrentPower write Fcat3CurrentPower;
    property cat1ServicesPower : TXSDecimal read Fcat1ServicesPower write Fcat1ServicesPower;
    property cat2ServicesPower : TXSDecimal read Fcat2ServicesPower write Fcat2ServicesPower;
    property cat3ServicesPower : TXSDecimal read Fcat3ServicesPower write Fcat3ServicesPower;
    property tyServicesPowerWaterHeating : TXSDecimal read FtyServicesPowerWaterHeating write FtyServicesPowerWaterHeating;
    property tyServicesPowerHeating : TXSDecimal read FtyServicesPowerHeating write FtyServicesPowerHeating;
    property tyServicesPowerCooker : TXSDecimal read FtyServicesPowerCooker write FtyServicesPowerCooker;
    property voltageCurrent : Integer read FvoltageCurrent write FvoltageCurrent;
    property voltageServices : Integer read FvoltageServices write FvoltageServices;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property yearGen : Integer read FyearGen write FyearGen;
    property performer : WideString read Fperformer write Fperformer;
    property performerPhone : WideString read FperformerPhone write FperformerPhone;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property securityZone : Integer read FsecurityZone write FsecurityZone;
    property objectSecurityZone : WideString read FobjectSecurityZone write FobjectSecurityZone;
    property identNumber : Integer read FidentNumber write FidentNumber;
    property dateChangeTU : TXSDate read FdateChangeTU write FdateChangeTU;
    property element : ENElement read Felement write Felement;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
  end;

{
  ENTechConditionsObjectsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    Fcustomer : WideString;
    Fbuilding : WideString;
    Faddress : WideString;
    FtyCurrentPower : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FconnectionPowerPlaces : WideString;
    FconnectionPowerPlacesNum : WideString;
    FconnectionPowerPoint : WideString;
    FconnectionPowerPointNum : WideString;
    FconnectionSource : WideString;
    FconnectionSourceNum : WideString;
    Fcat1CurrentPower : TXSDecimal;
    Fcat2CurrentPower : TXSDecimal;
    Fcat3CurrentPower : TXSDecimal;
    Fcat1ServicesPower : TXSDecimal;
    Fcat2ServicesPower : TXSDecimal;
    Fcat3ServicesPower : TXSDecimal;
    FtyServicesPowerWaterHeating : TXSDecimal;
    FtyServicesPowerHeating : TXSDecimal;
    FtyServicesPowerCooker : TXSDecimal;
    FvoltageCurrent : Integer;
    FvoltageServices : Integer;
    FpowerGeneration : TXSDecimal;
    FyearGen : Integer;
    Fperformer : WideString;
    FperformerPhone : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FsecurityZone : Integer;
    FobjectSecurityZone : WideString;
    FidentNumber : Integer;
    FdateChangeTU : TXSDate;
//???
    Felement : ENElement;
//???
    Fdepartment : ENDepartment;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property customer : WideString read Fcustomer write Fcustomer;
    property building : WideString read Fbuilding write Fbuilding;
    property address : WideString read Faddress write Faddress;
    property tyCurrentPower : TXSDecimal read FtyCurrentPower write FtyCurrentPower;
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower;
    property connectionPowerPlaces : WideString read FconnectionPowerPlaces write FconnectionPowerPlaces;
    property connectionPowerPlacesNum : WideString read FconnectionPowerPlacesNum write FconnectionPowerPlacesNum;
    property connectionPowerPoint : WideString read FconnectionPowerPoint write FconnectionPowerPoint;
    property connectionPowerPointNum : WideString read FconnectionPowerPointNum write FconnectionPowerPointNum;
    property connectionSource : WideString read FconnectionSource write FconnectionSource;
    property connectionSourceNum : WideString read FconnectionSourceNum write FconnectionSourceNum;
    property cat1CurrentPower : TXSDecimal read Fcat1CurrentPower write Fcat1CurrentPower;
    property cat2CurrentPower : TXSDecimal read Fcat2CurrentPower write Fcat2CurrentPower;
    property cat3CurrentPower : TXSDecimal read Fcat3CurrentPower write Fcat3CurrentPower;
    property cat1ServicesPower : TXSDecimal read Fcat1ServicesPower write Fcat1ServicesPower;
    property cat2ServicesPower : TXSDecimal read Fcat2ServicesPower write Fcat2ServicesPower;
    property cat3ServicesPower : TXSDecimal read Fcat3ServicesPower write Fcat3ServicesPower;
    property tyServicesPowerWaterHeating : TXSDecimal read FtyServicesPowerWaterHeating write FtyServicesPowerWaterHeating;
    property tyServicesPowerHeating : TXSDecimal read FtyServicesPowerHeating write FtyServicesPowerHeating;
    property tyServicesPowerCooker : TXSDecimal read FtyServicesPowerCooker write FtyServicesPowerCooker;
    property voltageCurrent : Integer read FvoltageCurrent write FvoltageCurrent;
    property voltageServices : Integer read FvoltageServices write FvoltageServices;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property yearGen : Integer read FyearGen write FyearGen;
    property performer : WideString read Fperformer write Fperformer;
    property performerPhone : WideString read FperformerPhone write FperformerPhone;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property securityZone : Integer read FsecurityZone write FsecurityZone;
    property objectSecurityZone : WideString read FobjectSecurityZone write FobjectSecurityZone;
    property identNumber : Integer read FidentNumber write FidentNumber;
    property dateChangeTU : TXSDate read FdateChangeTU write FdateChangeTU;
    property element : ENElement read Felement write Felement;
    property department : ENDepartment read Fdepartment write Fdepartment;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
  end;
}

  ENTechConditionsObjectsFilter = class(ENTechConditionsObjects)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTechConditionsObjectsShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    Fcustomer : WideString;
    Fbuilding : WideString;
    Faddress : WideString;
    FtyCurrentPower : TXSDecimal;
    FtyServicesPower : TXSDecimal;
    FconnectionPowerPlaces : WideString;
    FconnectionPowerPlacesNum : WideString;
    FconnectionPowerPoint : WideString;
    FconnectionPowerPointNum : WideString;
    FconnectionSource : WideString;
    FconnectionSourceNum : WideString;
    Fcat1CurrentPower : TXSDecimal;
    Fcat2CurrentPower : TXSDecimal;
    Fcat3CurrentPower : TXSDecimal;
    Fcat1ServicesPower : TXSDecimal;
    Fcat2ServicesPower : TXSDecimal;
    Fcat3ServicesPower : TXSDecimal;
    FtyServicesPowerWaterHeating : TXSDecimal;
    FtyServicesPowerHeating : TXSDecimal;
    FtyServicesPowerCooker : TXSDecimal;
    FpowerGeneration : TXSDecimal;
    FyearGen : Integer;
    Fperformer : WideString;
    FperformerPhone : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FsecurityZone : Integer;
    FobjectSecurityZone : WideString;
    FidentNumber : Integer;
    FdateChangeTU : TXSDate;
    FelementCode : Integer;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer;
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FdepartmentHrmorganizationid : WideString;
    FcategoryRefCode : Integer;
    FcategoryRefName : WideString;
    FcategoryRefCoef : TXSDecimal;
    FpowerPointRefCode : Integer;
    FpowerPointRefName : WideString;
    FpowerPointRefCoef : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property customer : WideString read Fcustomer write Fcustomer;
    property building : WideString read Fbuilding write Fbuilding;
    property address : WideString read Faddress write Faddress;
    property tyCurrentPower : TXSDecimal read FtyCurrentPower write FtyCurrentPower;
    property tyServicesPower : TXSDecimal read FtyServicesPower write FtyServicesPower;
    property connectionPowerPlaces : WideString read FconnectionPowerPlaces write FconnectionPowerPlaces;
    property connectionPowerPlacesNum : WideString read FconnectionPowerPlacesNum write FconnectionPowerPlacesNum;
    property connectionPowerPoint : WideString read FconnectionPowerPoint write FconnectionPowerPoint;
    property connectionPowerPointNum : WideString read FconnectionPowerPointNum write FconnectionPowerPointNum;
    property connectionSource : WideString read FconnectionSource write FconnectionSource;
    property connectionSourceNum : WideString read FconnectionSourceNum write FconnectionSourceNum;
    property cat1CurrentPower : TXSDecimal read Fcat1CurrentPower write Fcat1CurrentPower;
    property cat2CurrentPower : TXSDecimal read Fcat2CurrentPower write Fcat2CurrentPower;
    property cat3CurrentPower : TXSDecimal read Fcat3CurrentPower write Fcat3CurrentPower;
    property cat1ServicesPower : TXSDecimal read Fcat1ServicesPower write Fcat1ServicesPower;
    property cat2ServicesPower : TXSDecimal read Fcat2ServicesPower write Fcat2ServicesPower;
    property cat3ServicesPower : TXSDecimal read Fcat3ServicesPower write Fcat3ServicesPower;
    property tyServicesPowerWaterHeating : TXSDecimal read FtyServicesPowerWaterHeating write FtyServicesPowerWaterHeating;
    property tyServicesPowerHeating : TXSDecimal read FtyServicesPowerHeating write FtyServicesPowerHeating;
    property tyServicesPowerCooker : TXSDecimal read FtyServicesPowerCooker write FtyServicesPowerCooker;
    property powerGeneration : TXSDecimal read FpowerGeneration write FpowerGeneration;
    property  yearGen : Integer read FyearGen write FyearGen;
    property performer : WideString read Fperformer write Fperformer;
    property performerPhone : WideString read FperformerPhone write FperformerPhone;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property  securityZone : Integer read FsecurityZone write FsecurityZone;
    property objectSecurityZone : WideString read FobjectSecurityZone write FobjectSecurityZone;
    property  identNumber : Integer read FidentNumber write FidentNumber;
    property dateChangeTU : TXSDate read FdateChangeTU write FdateChangeTU;

    property elementCode : Integer read FelementCode write FelementCode;
    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode;
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans;
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884;
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884;
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884;
    property departmentHrmorganizationid : WideString read FdepartmentHrmorganizationid write FdepartmentHrmorganizationid;
    property categoryRefCode : Integer read FcategoryRefCode write FcategoryRefCode;
    property categoryRefName : WideString read FcategoryRefName write FcategoryRefName;
    property categoryRefCoef : TXSDecimal read FcategoryRefCoef write FcategoryRefCoef;
    property powerPointRefCode : Integer read FpowerPointRefCode write FpowerPointRefCode;
    property powerPointRefName : WideString read FpowerPointRefName write FpowerPointRefName;
    property powerPointRefCoef : TXSDecimal read FpowerPointRefCoef write FpowerPointRefCoef;
  end;

  ArrayOfENTechConditionsObjectsShort = array of ENTechConditionsObjectsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTechConditionsObjectsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTechConditionsObjectsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTechConditionsObjectsShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTechConditionsObjectsController/message/
  // soapAction: http://ksoe.org/ENTechConditionsObjectsController/action/ENTechConditionsObjectsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTechConditionsObjectsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTechConditionsObjectsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTechConditionsObjectsControllerSoapPort = interface(IInvokable)
  ['{DF1BA1F7-8407-4618-A1BC-708958693F60}']
    function add(const aENTechConditionsObjects: ENTechConditionsObjects): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTechConditionsObjects: ENTechConditionsObjects); stdcall;
    function getObject(const anObjectCode: Integer): ENTechConditionsObjects; stdcall;
    function getList: ENTechConditionsObjectsShortList; stdcall;
    function getFilteredList(const aENTechConditionsObjectsFilter: ENTechConditionsObjectsFilter): ENTechConditionsObjectsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsObjectsShortList; stdcall;
    function getScrollableFilteredList(const aENTechConditionsObjectsFilter: ENTechConditionsObjectsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsObjectsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTechConditionsObjectsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTechConditionsObjectsFilter: ENTechConditionsObjectsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTechConditionsObjectsShort; stdcall;
    procedure generateIdentNumber(const anObjectCode: Integer); stdcall;
    procedure resetIdentNumber(const anObjectCode: Integer); stdcall;
  end;


implementation

  destructor ENTechConditionsObjects.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtyCurrentPower) then
      tyCurrentPower.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(Fcat1CurrentPower) then
      cat1CurrentPower.Free;
    if Assigned(Fcat2CurrentPower) then
      cat2CurrentPower.Free;
    if Assigned(Fcat3CurrentPower) then
      cat3CurrentPower.Free;
    if Assigned(Fcat1ServicesPower) then
      cat1ServicesPower.Free;
    if Assigned(Fcat2ServicesPower) then
      cat2ServicesPower.Free;
    if Assigned(Fcat3ServicesPower) then
      cat3ServicesPower.Free;
    if Assigned(FtyServicesPowerWaterHeating) then
      tyServicesPowerWaterHeating.Free;
    if Assigned(FtyServicesPowerHeating) then
      tyServicesPowerHeating.Free;
    if Assigned(FtyServicesPowerCooker) then
      tyServicesPowerCooker.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateChangeTU) then
      dateChangeTU.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTechConditionsObjectsFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtyCurrentPower) then
      tyCurrentPower.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(Fcat1CurrentPower) then
      cat1CurrentPower.Free;
    if Assigned(Fcat2CurrentPower) then
      cat2CurrentPower.Free;
    if Assigned(Fcat3CurrentPower) then
      cat3CurrentPower.Free;
    if Assigned(Fcat1ServicesPower) then
      cat1ServicesPower.Free;
    if Assigned(Fcat2ServicesPower) then
      cat2ServicesPower.Free;
    if Assigned(Fcat3ServicesPower) then
      cat3ServicesPower.Free;
    if Assigned(FtyServicesPowerWaterHeating) then
      tyServicesPowerWaterHeating.Free;
    if Assigned(FtyServicesPowerHeating) then
      tyServicesPowerHeating.Free;
    if Assigned(FtyServicesPowerCooker) then
      tyServicesPowerCooker.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateChangeTU) then
      dateChangeTU.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTechConditionsObjectsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTechConditionsObjectsShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtyCurrentPower) then
      tyCurrentPower.Free;
    if Assigned(FtyServicesPower) then
      tyServicesPower.Free;
    if Assigned(Fcat1CurrentPower) then
      cat1CurrentPower.Free;
    if Assigned(Fcat2CurrentPower) then
      cat2CurrentPower.Free;
    if Assigned(Fcat3CurrentPower) then
      cat3CurrentPower.Free;
    if Assigned(Fcat1ServicesPower) then
      cat1ServicesPower.Free;
    if Assigned(Fcat2ServicesPower) then
      cat2ServicesPower.Free;
    if Assigned(Fcat3ServicesPower) then
      cat3ServicesPower.Free;
    if Assigned(FtyServicesPowerWaterHeating) then
      tyServicesPowerWaterHeating.Free;
    if Assigned(FtyServicesPowerHeating) then
      tyServicesPowerHeating.Free;
    if Assigned(FtyServicesPowerCooker) then
      tyServicesPowerCooker.Free;
    if Assigned(FpowerGeneration) then
      powerGeneration.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateChangeTU) then
      dateChangeTU.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FcategoryRefCoef) then
      categoryRefCoef.Free;
    if Assigned(FpowerPointRefCoef) then
      powerPointRefCoef.Free;
    inherited Destroy;
  end;

  destructor ENTechConditionsObjectsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTechConditionsObjects, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsObjects');
  RemClassRegistry.RegisterXSClass(ENTechConditionsObjectsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsObjectsRef');
  RemClassRegistry.RegisterXSClass(ENTechConditionsObjectsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsObjectsFilter');
  RemClassRegistry.RegisterXSClass(ENTechConditionsObjectsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsObjectsShort');
  RemClassRegistry.RegisterXSClass(ENTechConditionsObjectsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTechConditionsObjectsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTechConditionsObjectsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTechConditionsObjectsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTechConditionsObjectsControllerSoapPort), 'http://ksoe.org/ENTechConditionsObjectsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTechConditionsObjectsControllerSoapPort), 'http://ksoe.org/ENTechConditionsObjectsController/action/ENTechConditionsObjectsController.%operationName%');


end.
