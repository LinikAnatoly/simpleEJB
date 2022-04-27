unit SCSealController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,SCSealTypeController
   ,SCSealStatusController
   ,ENEstimateItemController
   ,SCSealLockTypeController
   ,RQStorageZoneController
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

  SCSeal            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSealRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCSeal = class(TRemotable)
  private
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FmolName : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FinstallOrderNumber : WideString;
    FcostOld : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FtypeRef : SCSealTypeRef;
//???
    FstatusRef : SCSealStatusRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FlockTypeRef : SCSealLockTypeRef;
//???
    FzoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property cost : TXSDecimal read Fcost write Fcost;
    property  scCode : Integer read FscCode write FscCode;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property costOld : TXSDecimal read FcostOld write FcostOld;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property typeRef : SCSealTypeRef read FtypeRef write FtypeRef;
    property statusRef : SCSealStatusRef read FstatusRef write FstatusRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property lockTypeRef : SCSealLockTypeRef read FlockTypeRef write FlockTypeRef;
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef;
  end;

{
  SCSealFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FmolName : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FinstallOrderNumber : WideString;
    FcostOld : TXSDecimal;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FtypeRef : SCSealTypeRef;
//???
    FstatusRef : SCSealStatusRef;
//???
    FestimateItemRef : ENEstimateItemRef;
//???
    FlockTypeRef : SCSealLockTypeRef;
//???
    FzoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property cost : TXSDecimal read Fcost write Fcost;
    property  scCode : Integer read FscCode write FscCode;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property costOld : TXSDecimal read FcostOld write FcostOld;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property typeRef : SCSealTypeRef read FtypeRef write FtypeRef;
    property statusRef : SCSealStatusRef read FstatusRef write FstatusRef;
    property estimateItemRef : ENEstimateItemRef read FestimateItemRef write FestimateItemRef;
    property lockTypeRef : SCSealLockTypeRef read FlockTypeRef write FlockTypeRef;
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef;
  end;
}

  SCSealFilter = class(SCSeal)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCSealShort = class(TRemotable)
  private
    Fcode : Integer;
    FinvNumber : WideString;
    Fname : WideString;
    FbuildNumber : WideString;
    Faccount : WideString;
    FdepartmetFKCode : WideString;
    FmolCode : WideString;
    FmolName : WideString;
    FdateIn : TXSDate;
    FdateBuild : TXSDate;
    Fcost : TXSDecimal;
    FscCode : Integer;
    FinstallOrderNumber : WideString;
    FcostOld : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FestimateItemRefCode : Integer;
    FestimateItemRefCountGen : TXSDecimal;
    FestimateItemRefCountFact : TXSDecimal;
    FestimateItemRefPrice : TXSDecimal;
    FestimateItemRefCost : TXSDecimal;
    FestimateItemRefIsUseVAT : Integer;
    FestimateItemRefDeliveryTime : Integer;
    FestimateItemRefUseWorkTime : Integer;
    FestimateItemRefUserGen : WideString;
    FestimateItemRefDateEdit : TXSDate;
    FlockTypeRefCode : Integer;
    FlockTypeRefName : WideString;
    FzoneRefCode : Integer;
    FzoneRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property buildNumber : WideString read FbuildNumber write FbuildNumber;
    property account : WideString read Faccount write Faccount;
    property departmetFKCode : WideString read FdepartmetFKCode write FdepartmetFKCode;
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property dateIn : TXSDate read FdateIn write FdateIn;
    property dateBuild : TXSDate read FdateBuild write FdateBuild;
    property cost : TXSDecimal read Fcost write Fcost;
    property  scCode : Integer read FscCode write FscCode;
    property installOrderNumber : WideString read FinstallOrderNumber write FinstallOrderNumber;
    property costOld : TXSDecimal read FcostOld write FcostOld;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property estimateItemRefCode : Integer read FestimateItemRefCode write FestimateItemRefCode;
    property estimateItemRefCountGen : TXSDecimal read FestimateItemRefCountGen write FestimateItemRefCountGen;
    property estimateItemRefCountFact : TXSDecimal read FestimateItemRefCountFact write FestimateItemRefCountFact;
    property estimateItemRefPrice : TXSDecimal read FestimateItemRefPrice write FestimateItemRefPrice;
    property estimateItemRefCost : TXSDecimal read FestimateItemRefCost write FestimateItemRefCost;
    property estimateItemRefIsUseVAT : Integer read FestimateItemRefIsUseVAT write FestimateItemRefIsUseVAT;
    property estimateItemRefDeliveryTime : Integer read FestimateItemRefDeliveryTime write FestimateItemRefDeliveryTime;
    property estimateItemRefUseWorkTime : Integer read FestimateItemRefUseWorkTime write FestimateItemRefUseWorkTime;
    property estimateItemRefUserGen : WideString read FestimateItemRefUserGen write FestimateItemRefUserGen;
    property estimateItemRefDateEdit : TXSDate read FestimateItemRefDateEdit write FestimateItemRefDateEdit;
    property lockTypeRefCode : Integer read FlockTypeRefCode write FlockTypeRefCode;
    property lockTypeRefName : WideString read FlockTypeRefName write FlockTypeRefName;
    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode;
    property zoneRefName : WideString read FzoneRefName write FzoneRefName;
  end;

  ArrayOfSCSealShort = array of SCSealShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCSealShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCSealShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCSealShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCSealController/message/
  // soapAction: http://ksoe.org/SCSealController/action/SCSealController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCSealControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCSealController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCSealControllerSoapPort = interface(IInvokable)
  ['{F6C223E4-6404-4F64-9BA6-0979230893DB}']
    function add(const aSCSeal: SCSeal): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCSeal: SCSeal); stdcall;
    function getObject(const anObjectCode: Integer): SCSeal; stdcall;
    function getList: SCSealShortList; stdcall;
    function getFilteredList(const aSCSealFilter: SCSealFilter): SCSealShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCSealShortList; stdcall;
    function getScrollableFilteredList(const aSCSealFilter: SCSealFilter; const aFromPosition: Integer; const aQuantity: Integer): SCSealShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCSealShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCSealFilter: SCSealFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCSealShort; stdcall;
  end;


implementation

  destructor SCSeal.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcostOld) then
      costOld.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FlockTypeRef) then
      lockTypeRef.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    inherited Destroy;
  end;

{
  destructor SCSealFilter.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcostOld) then
      costOld.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FestimateItemRef) then
      estimateItemRef.Free;
    if Assigned(FlockTypeRef) then
      lockTypeRef.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    inherited Destroy;
  end;
}

  destructor SCSealFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor SCSealShort.Destroy;
  begin
    if Assigned(FdateIn) then
      dateIn.Free;
    if Assigned(FdateBuild) then
      dateBuild.Free;
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FcostOld) then
      costOld.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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

  destructor SCSealShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCSeal, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSeal');
  RemClassRegistry.RegisterXSClass(SCSealRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealRef');
  RemClassRegistry.RegisterXSClass(SCSealFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealFilter');
  RemClassRegistry.RegisterXSClass(SCSealShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealShort');
  RemClassRegistry.RegisterXSClass(SCSealShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCSealShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCSealShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCSealShort');

  InvRegistry.RegisterInterface(TypeInfo(SCSealControllerSoapPort), 'http://ksoe.org/SCSealController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCSealControllerSoapPort), 'http://ksoe.org/SCSealController/action/SCSealController.%operationName%');


end.
