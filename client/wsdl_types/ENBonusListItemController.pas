unit ENBonusListItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENBonusListController
   ,ENBonusListItemStatusController
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

  ENBonusListItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBonusListItem = class(TRemotable)
  private
    Fcode : Integer;
    FpodrId : WideString;
    FpodrName : WideString;
    Ffio : WideString;
    FtabNumber : WideString;
    FpositionId : WideString;
    FpositionName : WideString;
    FfundWorkTime : TXSDecimal;
    FworkTimeFact : TXSDecimal;
    FhoursWorkedWithStaff : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FhoursWorkedPlan : TXSDecimal;
    FhoursWorkedNotPlan : TXSDecimal;
    FhoursWorkedSum : TXSDecimal;
    FpercentLoadWork : TXSDecimal;
    FpercentLoadByPlanWork : TXSDecimal;
    FpercentLoadByNotPlanWork : TXSDecimal;
    FpercentBonus : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FpercentBonusForCharging : TXSDecimal;
    FcountFactWorkedDays : TXSDecimal;
    FtradeCategoryId : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FnoWayOutFromPeriod : TXSDecimal;
  FsummaCompensation : TXSDecimal;
    FcoefficientQuality : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
    FreasonInvalid : WideString;
    FuserSetInvalid : WideString;
    FdateSetInvalid : TXSDateTime;
//???
    FbonusList : ENBonusListRef;
//???
    Fstatus : ENBonusListItemStatusRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property podrId : WideString read FpodrId write FpodrId;
    property podrName : WideString read FpodrName write FpodrName;
    property fio : WideString read Ffio write Ffio;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionId : WideString read FpositionId write FpositionId;
    property positionName : WideString read FpositionName write FpositionName;
    property fundWorkTime : TXSDecimal read FfundWorkTime write FfundWorkTime;
    property workTimeFact : TXSDecimal read FworkTimeFact write FworkTimeFact;
    property hoursWorkedWithStaff : TXSDecimal read FhoursWorkedWithStaff write FhoursWorkedWithStaff;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property hoursWorkedPlan : TXSDecimal read FhoursWorkedPlan write FhoursWorkedPlan;
    property hoursWorkedNotPlan : TXSDecimal read FhoursWorkedNotPlan write FhoursWorkedNotPlan;
    property hoursWorkedSum : TXSDecimal read FhoursWorkedSum write FhoursWorkedSum;
    property percentLoadWork : TXSDecimal read FpercentLoadWork write FpercentLoadWork;
    property percentLoadByPlanWork : TXSDecimal read FpercentLoadByPlanWork write FpercentLoadByPlanWork;
    property percentLoadByNotPlanWork : TXSDecimal read FpercentLoadByNotPlanWork write FpercentLoadByNotPlanWork;
    property percentBonus : TXSDecimal read FpercentBonus write FpercentBonus;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property percentBonusForCharging : TXSDecimal read FpercentBonusForCharging write FpercentBonusForCharging;
    property countFactWorkedDays : TXSDecimal read FcountFactWorkedDays write FcountFactWorkedDays;
    property tradeCategoryId : WideString read FtradeCategoryId write FtradeCategoryId;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property noWayOutFromPeriod : TXSDecimal read FnoWayOutFromPeriod write FnoWayOutFromPeriod;
 property summaCompensation : TXSDecimal read FsummaCompensation write FsummaCompensation;
    property coefficientQuality : TXSDecimal read FcoefficientQuality write FcoefficientQuality;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property reasonInvalid : WideString read FreasonInvalid write FreasonInvalid;
    property userSetInvalid : WideString read FuserSetInvalid write FuserSetInvalid;
    property dateSetInvalid : TXSDateTime read FdateSetInvalid write FdateSetInvalid;
    property bonusList : ENBonusListRef read FbonusList write FbonusList;
    property status : ENBonusListItemStatusRef read Fstatus write Fstatus;
  end;

{
  ENBonusListItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpodrId : WideString;
    FpodrName : WideString;
    Ffio : WideString;
    FtabNumber : WideString;
    FpositionId : WideString;
    FpositionName : WideString;
    FfundWorkTime : TXSDecimal;
    FworkTimeFact : TXSDecimal;
    FhoursWorkedWithStaff : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FhoursWorkedPlan : TXSDecimal;
    FhoursWorkedNotPlan : TXSDecimal;
    FhoursWorkedSum : TXSDecimal;
    FpercentLoadWork : TXSDecimal;
    FpercentLoadByPlanWork : TXSDecimal;
    FpercentLoadByNotPlanWork : TXSDecimal;
    FpercentBonus : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FpercentBonusForCharging : TXSDecimal;
    FcountFactWorkedDays : TXSDecimal;
    FtradeCategoryId : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FnoWayOutFromPeriod : TXSDecimal;
 FsummaCompensation : TXSDecimal;
    FcoefficientQuality : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
    FreasonInvalid : WideString;
    FuserSetInvalid : WideString;
    FdateSetInvalid : DateTime;
//???
    FbonusList : ENBonusListRef;
//???
    Fstatus : ENBonusListItemStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property podrId : WideString read FpodrId write FpodrId;
    property podrName : WideString read FpodrName write FpodrName;
    property fio : WideString read Ffio write Ffio;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionId : WideString read FpositionId write FpositionId;
    property positionName : WideString read FpositionName write FpositionName;
    property fundWorkTime : TXSDecimal read FfundWorkTime write FfundWorkTime;
    property workTimeFact : TXSDecimal read FworkTimeFact write FworkTimeFact;
    property hoursWorkedWithStaff : TXSDecimal read FhoursWorkedWithStaff write FhoursWorkedWithStaff;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property hoursWorkedPlan : TXSDecimal read FhoursWorkedPlan write FhoursWorkedPlan;
    property hoursWorkedNotPlan : TXSDecimal read FhoursWorkedNotPlan write FhoursWorkedNotPlan;
    property hoursWorkedSum : TXSDecimal read FhoursWorkedSum write FhoursWorkedSum;
    property percentLoadWork : TXSDecimal read FpercentLoadWork write FpercentLoadWork;
    property percentLoadByPlanWork : TXSDecimal read FpercentLoadByPlanWork write FpercentLoadByPlanWork;
    property percentLoadByNotPlanWork : TXSDecimal read FpercentLoadByNotPlanWork write FpercentLoadByNotPlanWork;
    property percentBonus : TXSDecimal read FpercentBonus write FpercentBonus;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property percentBonusForCharging : TXSDecimal read FpercentBonusForCharging write FpercentBonusForCharging;
    property countFactWorkedDays : TXSDecimal read FcountFactWorkedDays write FcountFactWorkedDays;
    property tradeCategoryId : WideString read FtradeCategoryId write FtradeCategoryId;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property noWayOutFromPeriod : TXSDecimal read FnoWayOutFromPeriod write FnoWayOutFromPeriod;
 property summaCompensation : TXSDecimal read FsummaCompensation write FsummaCompensation;
    property coefficientQuality : TXSDecimal read FcoefficientQuality write FcoefficientQuality;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property reasonInvalid : WideString read FreasonInvalid write FreasonInvalid;
    property userSetInvalid : WideString read FuserSetInvalid write FuserSetInvalid;
    property dateSetInvalid : DateTime;
    property bonusList : ENBonusListRef read FbonusList write FbonusList;
    property status : ENBonusListItemStatusRef read Fstatus write Fstatus;
  end;
}

  ENBonusListItemFilter = class(ENBonusListItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBonusListItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FpodrId : WideString;
    FpodrName : WideString;
    Ffio : WideString;
    FtabNumber : WideString;
    FpositionId : WideString;
    FpositionName : WideString;
    FfundWorkTime : TXSDecimal;
    FworkTimeFact : TXSDecimal;
    FhoursWorkedWithStaff : TXSDecimal;
    FtimeDelivery : TXSDecimal;
    FhoursWorkedPlan : TXSDecimal;
    FhoursWorkedNotPlan : TXSDecimal;
    FhoursWorkedSum : TXSDecimal;
    FpercentLoadWork : TXSDecimal;
    FpercentLoadByPlanWork : TXSDecimal;
    FpercentLoadByNotPlanWork : TXSDecimal;
    FpercentBonus : TXSDecimal;
    Fcoefficient : TXSDecimal;
    FpercentBonusForCharging : TXSDecimal;
    FcountFactWorkedDays : TXSDecimal;
    FtradeCategoryId : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FnoWayOutFromPeriod : TXSDecimal;
  FsummaCompensation : TXSDecimal;
    FcoefficientQuality : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FreasonInvalid : WideString;
    FuserSetInvalid : WideString;
    FdateSetInvalid : TXSDateTime;
    FbonusListCode : Integer;
    FbonusListNumberGen : WideString;
    FbonusListMonthGen : Integer;
    FbonusListYearGen : Integer;
    FbonusListUserAdd : WideString;
    FbonusListDateAdd : TXSDateTime;
    FbonusListUserGen : WideString;
    FbonusListDateEdit : TXSDateTime;
    FstatusCode : Integer;
    FstatusName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property podrId : WideString read FpodrId write FpodrId;
    property podrName : WideString read FpodrName write FpodrName;
    property fio : WideString read Ffio write Ffio;
    property tabNumber : WideString read FtabNumber write FtabNumber;
    property positionId : WideString read FpositionId write FpositionId;
    property positionName : WideString read FpositionName write FpositionName;
    property fundWorkTime : TXSDecimal read FfundWorkTime write FfundWorkTime;
    property workTimeFact : TXSDecimal read FworkTimeFact write FworkTimeFact;
    property hoursWorkedWithStaff : TXSDecimal read FhoursWorkedWithStaff write FhoursWorkedWithStaff;
    property timeDelivery : TXSDecimal read FtimeDelivery write FtimeDelivery;
    property hoursWorkedPlan : TXSDecimal read FhoursWorkedPlan write FhoursWorkedPlan;
    property hoursWorkedNotPlan : TXSDecimal read FhoursWorkedNotPlan write FhoursWorkedNotPlan;
    property hoursWorkedSum : TXSDecimal read FhoursWorkedSum write FhoursWorkedSum;
    property percentLoadWork : TXSDecimal read FpercentLoadWork write FpercentLoadWork;
    property percentLoadByPlanWork : TXSDecimal read FpercentLoadByPlanWork write FpercentLoadByPlanWork;
    property percentLoadByNotPlanWork : TXSDecimal read FpercentLoadByNotPlanWork write FpercentLoadByNotPlanWork;
    property percentBonus : TXSDecimal read FpercentBonus write FpercentBonus;
    property coefficient : TXSDecimal read Fcoefficient write Fcoefficient;
    property percentBonusForCharging : TXSDecimal read FpercentBonusForCharging write FpercentBonusForCharging;
    property countFactWorkedDays : TXSDecimal read FcountFactWorkedDays write FcountFactWorkedDays;
    property tradeCategoryId : WideString read FtradeCategoryId write FtradeCategoryId;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property noWayOutFromPeriod : TXSDecimal read FnoWayOutFromPeriod write FnoWayOutFromPeriod;
 property summaCompensation : TXSDecimal read FsummaCompensation write FsummaCompensation;
    property coefficientQuality : TXSDecimal read FcoefficientQuality write FcoefficientQuality;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property reasonInvalid : WideString read FreasonInvalid write FreasonInvalid;
    property userSetInvalid : WideString read FuserSetInvalid write FuserSetInvalid;
    property dateSetInvalid : TXSDateTime read FdateSetInvalid write FdateSetInvalid;

    property bonusListCode : Integer read FbonusListCode write FbonusListCode;
    property bonusListNumberGen : WideString read FbonusListNumberGen write FbonusListNumberGen;
    property bonusListMonthGen : Integer read FbonusListMonthGen write FbonusListMonthGen;
    property bonusListYearGen : Integer read FbonusListYearGen write FbonusListYearGen;
    property bonusListUserAdd : WideString read FbonusListUserAdd write FbonusListUserAdd;
    property bonusListDateAdd : TXSDateTime read FbonusListDateAdd write FbonusListDateAdd;
    property bonusListUserGen : WideString read FbonusListUserGen write FbonusListUserGen;
    property bonusListDateEdit : TXSDateTime read FbonusListDateEdit write FbonusListDateEdit;
    property statusCode : Integer read FstatusCode write FstatusCode;
    property statusName : WideString read FstatusName write FstatusName;
  end;

  ArrayOfENBonusListItemShort = array of ENBonusListItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBonusListItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBonusListItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBonusListItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBonusListItemController/message/
  // soapAction: http://ksoe.org/ENBonusListItemController/action/ENBonusListItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBonusListItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBonusListItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBonusListItemControllerSoapPort = interface(IInvokable)
  ['{71CCC895-0867-4E9F-999B-39E2CCAE93F6}']
    function add(const aENBonusListItem: ENBonusListItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBonusListItem: ENBonusListItem); stdcall;
    function getObject(const anObjectCode: Integer): ENBonusListItem; stdcall;
    function getList: ENBonusListItemShortList; stdcall;
    function getFilteredList(const aENBonusListItemFilter: ENBonusListItemFilter): ENBonusListItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemShortList; stdcall;
    function getScrollableFilteredList(const aENBonusListItemFilter: ENBonusListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBonusListItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBonusListItemFilter: ENBonusListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBonusListItemShort; stdcall;

    procedure SetBonusItemInvalid(const aENBonusListItem: ENBonusListItem); stdcall;
    procedure UnSetBonusItemInvalid(const aENBonusListItem: ENBonusListItem); stdcall;
  end;


implementation

  destructor ENBonusListItem.Destroy;
  begin
    if Assigned(FfundWorkTime) then
      fundWorkTime.Free;
    if Assigned(FworkTimeFact) then
      workTimeFact.Free;
    if Assigned(FhoursWorkedWithStaff) then
      hoursWorkedWithStaff.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FhoursWorkedPlan) then
      hoursWorkedPlan.Free;
    if Assigned(FhoursWorkedNotPlan) then
      hoursWorkedNotPlan.Free;
    if Assigned(FhoursWorkedSum) then
      hoursWorkedSum.Free;
    if Assigned(FpercentLoadWork) then
      percentLoadWork.Free;
    if Assigned(FpercentLoadByPlanWork) then
      percentLoadByPlanWork.Free;
    if Assigned(FpercentLoadByNotPlanWork) then
      percentLoadByNotPlanWork.Free;
    if Assigned(FpercentBonus) then
      percentBonus.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FpercentBonusForCharging) then
      percentBonusForCharging.Free;
    if Assigned(FcountFactWorkedDays) then
      countFactWorkedDays.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FnoWayOutFromPeriod) then
      noWayOutFromPeriod.Free;
if Assigned(FsummaCompensation) then
      summaCompensation.Free;
    if Assigned(FcoefficientQuality) then
      coefficientQuality.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateSetInvalid) then
      dateSetInvalid.Free;
    if Assigned(FbonusList) then
      bonusList.Free;
    if Assigned(Fstatus) then
      status.Free;
    inherited Destroy;
  end;

{
  destructor ENBonusListItemFilter.Destroy;
  begin
    if Assigned(FfundWorkTime) then
      fundWorkTime.Free;
    if Assigned(FworkTimeFact) then
      workTimeFact.Free;
    if Assigned(FhoursWorkedWithStaff) then
      hoursWorkedWithStaff.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FhoursWorkedPlan) then
      hoursWorkedPlan.Free;
    if Assigned(FhoursWorkedNotPlan) then
      hoursWorkedNotPlan.Free;
    if Assigned(FhoursWorkedSum) then
      hoursWorkedSum.Free;
    if Assigned(FpercentLoadWork) then
      percentLoadWork.Free;
    if Assigned(FpercentLoadByPlanWork) then
      percentLoadByPlanWork.Free;
    if Assigned(FpercentLoadByNotPlanWork) then
      percentLoadByNotPlanWork.Free;
    if Assigned(FpercentBonus) then
      percentBonus.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FpercentBonusForCharging) then
      percentBonusForCharging.Free;
    if Assigned(FcountFactWorkedDays) then
      countFactWorkedDays.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FnoWayOutFromPeriod) then
      noWayOutFromPeriod.Free;
 if Assigned(FsummaCompensation) then
      summaCompensation.Free;
    if Assigned(FcoefficientQuality) then
      coefficientQuality.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateSetInvalid) then
      dateSetInvalid.Free;
    if Assigned(FbonusList) then
      bonusList.Free;
    if Assigned(Fstatus) then
      status.Free;
    inherited Destroy;
  end;
}

  destructor ENBonusListItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBonusListItemShort.Destroy;
  begin
    if Assigned(FfundWorkTime) then
      fundWorkTime.Free;
    if Assigned(FworkTimeFact) then
      workTimeFact.Free;
    if Assigned(FhoursWorkedWithStaff) then
      hoursWorkedWithStaff.Free;
    if Assigned(FtimeDelivery) then
      timeDelivery.Free;
    if Assigned(FhoursWorkedPlan) then
      hoursWorkedPlan.Free;
    if Assigned(FhoursWorkedNotPlan) then
      hoursWorkedNotPlan.Free;
    if Assigned(FhoursWorkedSum) then
      hoursWorkedSum.Free;
    if Assigned(FpercentLoadWork) then
      percentLoadWork.Free;
    if Assigned(FpercentLoadByPlanWork) then
      percentLoadByPlanWork.Free;
    if Assigned(FpercentLoadByNotPlanWork) then
      percentLoadByNotPlanWork.Free;
    if Assigned(FpercentBonus) then
      percentBonus.Free;
    if Assigned(Fcoefficient) then
      coefficient.Free;
    if Assigned(FpercentBonusForCharging) then
      percentBonusForCharging.Free;
    if Assigned(FcountFactWorkedDays) then
      countFactWorkedDays.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FnoWayOutFromPeriod) then
      noWayOutFromPeriod.Free;
if Assigned(FsummaCompensation) then
      summaCompensation.Free;
    if Assigned(FcoefficientQuality) then
      coefficientQuality.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateSetInvalid) then
      dateSetInvalid.Free;
    if Assigned(FbonusListDateAdd) then
      bonusListDateAdd.Free;
    if Assigned(FbonusListDateEdit) then
      bonusListDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENBonusListItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBonusListItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItem');
  RemClassRegistry.RegisterXSClass(ENBonusListItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemRef');
  RemClassRegistry.RegisterXSClass(ENBonusListItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemFilter');
  RemClassRegistry.RegisterXSClass(ENBonusListItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemShort');
  RemClassRegistry.RegisterXSClass(ENBonusListItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBonusListItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBonusListItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBonusListItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBonusListItemControllerSoapPort), 'http://ksoe.org/ENBonusListItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBonusListItemControllerSoapPort), 'http://ksoe.org/ENBonusListItemController/action/ENBonusListItemController.%operationName%');


end.
