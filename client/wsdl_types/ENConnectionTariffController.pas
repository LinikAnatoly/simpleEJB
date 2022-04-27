unit ENConnectionTariffController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENConnectionLevelController
   ,ENPowerReliabilityCategoryController
   ,ENConnectionPowerPointController
   ,ENConnectionPhasityController
   ,ENConnectionLineTypeController
   ,ENConnectionInstallationTypeController
   ,ENConnectionLocationTypeController
   ,ENConnectionTariffTypeController
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

  ENConnectionTariff            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariffRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENConnectionTariff = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fshortname : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FlevelRef : ENConnectionLevelRef;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
//???
    FphasityRef : ENConnectionPhasityRef;
//???
    FlineTypeRef : ENConnectionLineTypeRef;
//???
    FinstallationTypeRef : ENConnectionInstallationTypeRef;
//???
    FlocationTypeRef : ENConnectionLocationTypeRef;
//???
    FtarifTypeRef : ENConnectionTariffTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;


  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortname : WideString read Fshortname write Fshortname;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property levelRef : ENConnectionLevelRef read FlevelRef write FlevelRef;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
    property phasityRef : ENConnectionPhasityRef read FphasityRef write FphasityRef;
    property lineTypeRef : ENConnectionLineTypeRef read FlineTypeRef write FlineTypeRef;
    property installationTypeRef : ENConnectionInstallationTypeRef read FinstallationTypeRef write FinstallationTypeRef;
    property locationTypeRef : ENConnectionLocationTypeRef read FlocationTypeRef write FlocationTypeRef;
    property tarifTypeRef : ENConnectionTariffTypeRef read FtarifTypeRef write FtarifTypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;


  end;

{
  ENConnectionTariffFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    Fshortname : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
//???
    FlevelRef : ENConnectionLevelRef;
//???
    FcategoryRef : ENPowerReliabilityCategoryRef;
//???
    FpowerPointRef : ENConnectionPowerPointRef;
//???
    FphasityRef : ENConnectionPhasityRef;
//???
    FlineTypeRef : ENConnectionLineTypeRef;
//???
    FinstallationTypeRef : ENConnectionInstallationTypeRef;
//???
    FlocationTypeRef : ENConnectionLocationTypeRef;
//???
    FtarifTypeRef : ENConnectionTariffTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortname : WideString read Fshortname write Fshortname;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property levelRef : ENConnectionLevelRef read FlevelRef write FlevelRef;
    property categoryRef : ENPowerReliabilityCategoryRef read FcategoryRef write FcategoryRef;
    property powerPointRef : ENConnectionPowerPointRef read FpowerPointRef write FpowerPointRef;
    property phasityRef : ENConnectionPhasityRef read FphasityRef write FphasityRef;
    property lineTypeRef : ENConnectionLineTypeRef read FlineTypeRef write FlineTypeRef;
    property installationTypeRef : ENConnectionInstallationTypeRef read FinstallationTypeRef write FinstallationTypeRef;
    property locationTypeRef : ENConnectionLocationTypeRef read FlocationTypeRef write FlocationTypeRef;
    property tarifTypeRef : ENConnectionTariffTypeRef read FtarifTypeRef write FtarifTypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENConnectionTariffFilter = class(ENConnectionTariff)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENConnectionTariffShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    Fshortname : WideString;
    FuserGen : WideString;
    FlevelRefCode : Integer;
    FlevelRefName : WideString;
    FcategoryRefCode : Integer;
    FcategoryRefName : WideString;
    FpowerPointRefCode : Integer;
    FpowerPointRefName : WideString;
    FphasityRefCode : Integer;
    FphasityRefName : WideString;
    FlineTypeRefCode : Integer;
    FlineTypeRefName : WideString;
    FinstallationTypeRefCode : Integer;
    FinstallationTypeRefName : WideString;
    FlocationTypeRefCode : Integer;
    FlocationTypeRefName : WideString;
    FtarifTypeRefCode : Integer;
    FtarifTypeRefName : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FdepartmentRefRenCode : Integer;
    FdepartmentRefShpzBalans : WideString;
    FdepartmentRefKau_table_id_1884 : Integer;
    FdepartmentRefKau_1884 : WideString;
    FdepartmentRefName_1884 : WideString;
    FdepartmentRefHrmorganizationid : WideString;
    FtariffEntryCode : Integer;
    Fvalue : TXSDecimal;
    FstartDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property shortname : WideString read Fshortname write Fshortname;
    property userGen : WideString read FuserGen write FuserGen;

    property levelRefCode : Integer read FlevelRefCode write FlevelRefCode;
    property levelRefName : WideString read FlevelRefName write FlevelRefName;
    property categoryRefCode : Integer read FcategoryRefCode write FcategoryRefCode;
    property categoryRefName : WideString read FcategoryRefName write FcategoryRefName;
    property powerPointRefCode : Integer read FpowerPointRefCode write FpowerPointRefCode;
    property powerPointRefName : WideString read FpowerPointRefName write FpowerPointRefName;
    property phasityRefCode : Integer read FphasityRefCode write FphasityRefCode;
    property phasityRefName : WideString read FphasityRefName write FphasityRefName;
    property lineTypeRefCode : Integer read FlineTypeRefCode write FlineTypeRefCode;
    property lineTypeRefName : WideString read FlineTypeRefName write FlineTypeRefName;
    property installationTypeRefCode : Integer read FinstallationTypeRefCode write FinstallationTypeRefCode;
    property installationTypeRefName : WideString read FinstallationTypeRefName write FinstallationTypeRefName;
    property locationTypeRefCode : Integer read FlocationTypeRefCode write FlocationTypeRefCode;
    property locationTypeRefName : WideString read FlocationTypeRefName write FlocationTypeRefName;
    property tarifTypeRefCode : Integer read FtarifTypeRefCode write FtarifTypeRefCode;
    property tarifTypeRefName : WideString read FtarifTypeRefName write FtarifTypeRefName;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property departmentRefRenCode : Integer read FdepartmentRefRenCode write FdepartmentRefRenCode;
    property departmentRefShpzBalans : WideString read FdepartmentRefShpzBalans write FdepartmentRefShpzBalans;
    property departmentRefKau_table_id_1884 : Integer read FdepartmentRefKau_table_id_1884 write FdepartmentRefKau_table_id_1884;
    property departmentRefKau_1884 : WideString read FdepartmentRefKau_1884 write FdepartmentRefKau_1884;
    property departmentRefName_1884 : WideString read FdepartmentRefName_1884 write FdepartmentRefName_1884;
    property departmentRefHrmorganizationid : WideString read FdepartmentRefHrmorganizationid write FdepartmentRefHrmorganizationid;
    property tariffEntryCode : Integer read FtariffEntryCode write FtariffEntryCode;
    property value : TXSDecimal read Fvalue write Fvalue;
    property startDate : TXSDate read FstartDate write FstartDate;
  end;

  ArrayOfENConnectionTariffShort = array of ENConnectionTariffShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENConnectionTariffShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENConnectionTariffShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENConnectionTariffShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENConnectionTariffController/message/
  // soapAction: http://ksoe.org/ENConnectionTariffController/action/ENConnectionTariffController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENConnectionTariffControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENConnectionTariffController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENConnectionTariffControllerSoapPort = interface(IInvokable)
  ['{2BD13767-9E3C-4083-A75E-DCC79DCB8C5C}']
    function  add(const aENConnectionTariff: ENConnectionTariff): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENConnectionTariff: ENConnectionTariff); stdcall;
    function  getObject(const anObjectCode: Integer): ENConnectionTariff; stdcall;
    function  getList: ENConnectionTariffShortList; stdcall;
    function  getFilteredList(const aENConnectionTariffFilter: ENConnectionTariffFilter): ENConnectionTariffShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffShortList; stdcall;
    function  getScrollableFilteredList(const aENConnectionTariffFilter: ENConnectionTariffFilter; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffShortList; stdcall; overload;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENConnectionTariffShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENConnectionTariffFilter: ENConnectionTariffFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getShortObject(const anObjectCode: Integer): ENConnectionTariffShort; stdcall; overload;

    function  getShortObject(const anObjectCode : Integer; dateTY : TXSDate): ENConnectionTariffShort; stdcall; overload;
    function  getScrollableFilteredList(
        const aENConnectionTariffFilter: ENConnectionTariffFilter;
        const aFromPosition: Integer;
        const aQuantity: Integer;  dateTY : TXSDate): ENConnectionTariffShortList; stdcall; overload;
  end;


implementation

  destructor ENConnectionTariff.Destroy;
  begin
    if Assigned(FlevelRef) then
      levelRef.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    if Assigned(FphasityRef) then
      phasityRef.Free;
    if Assigned(FlineTypeRef) then
      lineTypeRef.Free;
    if Assigned(FinstallationTypeRef) then
      installationTypeRef.Free;
    if Assigned(FlocationTypeRef) then
      locationTypeRef.Free;
    if Assigned(FtarifTypeRef) then
      tarifTypeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENConnectionTariffFilter.Destroy;
  begin
    if Assigned(FlevelRef) then
      levelRef.Free;
    if Assigned(FcategoryRef) then
      categoryRef.Free;
    if Assigned(FpowerPointRef) then
      powerPointRef.Free;
    if Assigned(FphasityRef) then
      phasityRef.Free;
    if Assigned(FlineTypeRef) then
      lineTypeRef.Free;
    if Assigned(FinstallationTypeRef) then
      installationTypeRef.Free;
    if Assigned(FlocationTypeRef) then
      locationTypeRef.Free;
    if Assigned(FtarifTypeRef) then
      tarifTypeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENConnectionTariffFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENConnectionTariffShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENConnectionTariffShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENConnectionTariff, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariff');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffRef');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffFilter');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffShort');
  RemClassRegistry.RegisterXSClass(ENConnectionTariffShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENConnectionTariffShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENConnectionTariffShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENConnectionTariffShort');

  InvRegistry.RegisterInterface(TypeInfo(ENConnectionTariffControllerSoapPort), 'http://ksoe.org/ENConnectionTariffController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENConnectionTariffControllerSoapPort), 'http://ksoe.org/ENConnectionTariffController/action/ENConnectionTariffController.%operationName%');


end.
