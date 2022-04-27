unit ENPlanWorkItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   ,ENPlanWorkController 
   ,TKTechCardController
   ,ENPlanWork2ClassificationTypeController 
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

  ENPlanWorkItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanWorkItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FworkerCount : Integer;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FkartaRef : TKTechCardRef; //KartiRef;

    FtimeGen : TXSDecimal;
    FcostGen : TXSDecimal;
    //???
    FoldPlanRef : ENPlanWorkRef;


  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property  workerCount : Integer read FworkerCount write FworkerCount;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
    property kartaRef : TKTechCardRef read FkartaRef write FkartaRef;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costGen : TXSDecimal read FcostGen write FcostGen;
    property oldPlanRef : ENPlanWorkRef read FoldPlanRef write FoldPlanRef;
  end;

  ENPlanWorkItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FcommentGen : WideString;
    //FworkerCount : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    FplanRef : ENPlanWorkRef;
//???
    FkartaRef : TKTechCardRef;

    FtimeGen : TXSDecimal;

    FcostGen : TXSDecimal;
    FoldPlanRef :  ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    //property  workerCount : Integer read FworkerCount write FworkerCount;     
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef;
    property kartaRef : TKTechCardRef read FkartaRef write FkartaRef;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costGen : TXSDecimal read FcostGen write FcostGen;
    property oldPlanRef : ENPlanWorkRef read FoldPlanRef write FoldPlanRef;
  end;


  ENPlanWorkItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FplanRefCode : Integer; 
    FplanRefDateGen : TXSDate;
    FplanRefYearGen : Integer; 
    FplanRefMonthGen : Integer; 
    FplanRefUserGen : WideString;
    FplanRefDateEdit : TXSDate;
    FkartaRefCode : Integer; 
    FkartaRefName : WideString;
    FkartaNum : WideString;
    FmeasurementUnit : WideString;
    Fmeter : WideString;
    FnormOfTime : TXSDecimal;
    FsourceName : WideString;

    FtimeGen : TXSDecimal;
    FcostServicesFS : TXSDecimal;
    FcommentGen : WideString;
    Fkoef : TXSDecimal;
    FstatusName : WideString;

    FoldPlanRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property planRefCode : Integer read FplanRefCode write FplanRefCode;
    property planRefDateGen : TXSDate read FplanRefDateGen write FplanRefDateGen;
    property planRefYearGen : Integer read FplanRefYearGen write FplanRefYearGen;
    property planRefMonthGen : Integer read FplanRefMonthGen write FplanRefMonthGen;
    property planRefUserGen : WideString read FplanRefUserGen write FplanRefUserGen;
    property planRefDateEdit : TXSDate read FplanRefDateEdit write FplanRefDateEdit;
    property kartaRefCode : Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;
    property normOfTime : TXSDecimal read FnormOfTime write FnormOfTime;
    property measurementUnit : WideString read FmeasurementUnit write FmeasurementUnit;
    property meter : WideString read Fmeter write Fmeter;
    property sourceName : WideString read FsourceName write FsourceName;
    property timeGen : TXSDecimal read FtimeGen write FtimeGen;
    property costServicesFS : TXSDecimal read FcostServicesFS write FcostServicesFS;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property koef : TXSDecimal read Fkoef write Fkoef;
    property statusName : WideString read FstatusName write FstatusName;
    property oldPlanRefCode : Integer read FoldPlanRefCode write FoldPlanRefCode;
  end;

  ArrayOfENPlanWorkItemShort = array of ENPlanWorkItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItemShort read Flist write Flist;
  end;

  ArrayOfENPlanWorkItem = array of ENPlanWorkItem;


  ENPlanWorkItemForClosePlanShort = class(TRemotable)
  private
    FkartaRefCode : Integer;
    FkartaNum : WideString;
    FkartaRefName : WideString;
    FmonthPlanCountGen : TXSDecimal;
    FfactCountGen : TXSDecimal;
    FnpzCountGen : TXSDecimal;
    FpossibleCountGen : TXSDecimal;
    FcountFact : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property kartaRefCode : Integer read FkartaRefCode write FkartaRefCode;
    property kartaRefName : WideString read FkartaRefName write FkartaRefName;
    property kartaNum : WideString read FkartaNum write FkartaNum;
    property monthPlanCountGen : TXSDecimal read FmonthPlanCountGen write FmonthPlanCountGen;
    property factCountGen : TXSDecimal read FfactCountGen write FfactCountGen;
    property npzCountGen : TXSDecimal read FnpzCountGen write FnpzCountGen;
    property possibleCountGen : TXSDecimal read FpossibleCountGen write FpossibleCountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
  end;


  ArrayOfENPlanWorkItemForClosePlanShort = array of ENPlanWorkItemForClosePlanShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanWorkItemForClosePlanShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanWorkItemForClosePlanShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanWorkItemForClosePlanShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanWorkItemController/message/
  // soapAction: http://ksoe.org/ENPlanWorkItemController/action/ENPlanWorkItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanWorkItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanWorkItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanWorkItemControllerSoapPort = interface(IInvokable)
  ['{867E1E59-9626-4AC1-A217-815519E87799}']
    function  add(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanWorkItem: ENPlanWorkItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENPlanWorkItem; stdcall;
    function  getList: ENPlanWorkItemShortList; stdcall;
    function  getFilteredList(const aENPlanWorkItemFilter: ENPlanWorkItemFilter): ENPlanWorkItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItemShortList; stdcall;
    function  getScrollableFilteredList(const aENPlanWorkItemFilter: ENPlanWorkItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanWorkItemShortList; stdcall;

    function  addBySRS_(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure removeBySRS_(const anObjectCode: Integer); stdcall;
    procedure saveBySRS_(const aENPlanWorkItem: ENPlanWorkItem); stdcall;

    function  addBySVES(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure removeBySVES(const anObjectCode: Integer); stdcall;
    procedure saveBySVES(const aENPlanWorkItem: ENPlanWorkItem); stdcall;

    function  addBySPS(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure removeBySPS(const anObjectCode: Integer); stdcall;
    procedure saveBySPS(const aENPlanWorkItem: ENPlanWorkItem); stdcall;

	  function  addByByt(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure removeByByt(const anObjectCode: Integer); stdcall;
    procedure saveByByt(const aENPlanWorkItem: ENPlanWorkItem); stdcall;

	  function  addByProm(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;
    procedure removeByProm(const anObjectCode: Integer); stdcall;
    procedure saveByProm(const aENPlanWorkItem: ENPlanWorkItem); stdcall;

    function  addForCalculation(const aENPlanWorkItem: ENPlanWorkItem; distance: TXSDecimal): Integer; stdcall;

    procedure saveForCalculation(const aENPlanWorkItem: ENPlanWorkItem; distance: TXSDecimal); stdcall;
    procedure saveForCalculationSilent(const aENPlanWorkItem: ENPlanWorkItem; distance: TXSDecimal); stdcall;

    procedure removeForCalculation(const anObjectCode: Integer); stdcall;
    function  addPlanWorkItemsByClassificationTypeForCalculation(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal  ): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForCalculation(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal); stdcall;
    function  addPlanWorkItemsByClassificationTypeForCalculationNotLicensed(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForCalculationNotLicensed(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ); stdcall;
    procedure removePlanWorkItemsByClassificationTypeForCalculation(plan2classificationTypeCode: Integer); stdcall;

    procedure removePlanWorkItemsByClassificationTypeForConnection(plan2classificationTypeCode: Integer); stdcall;

    function addPlanByListOperationsNotLicensed(const aENPlanWork2ClassificationType : ENPlanWork2ClassificationType; distance : TXSDecimal; machinehours : TXSDecimal; condition : WideString): Integer; stdcall;

    function  addPlanWorkItemsByClassificationTypeForCalculation2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer; priconnections : Boolean; customPlanDate : TXSDate): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForCalculation2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer ); overload; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForCalculation2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer; priconnections : Boolean ); overload; stdcall;
    function addPlanByListOperationsNotLicensed2(const aENPlanWork2ClassificationType : ENPlanWork2ClassificationType; distance : TXSDecimal; machinehours : TXSDecimal; condition : WideString ; codeREM : Integer; priconnections : Boolean): Integer; stdcall;
    function addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ; codeREM : Integer; priconnections : Boolean): Integer; stdcall; overload;
    function addPlanWorkItemsByClassificationTypeForCalculationNotLicensed2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ; codeREM : Integer; priconnections : Boolean; customPlanDate : TXSDate): Integer; stdcall; overload;
    procedure savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ; codeREM : Integer ); overload; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForCalculationNotLicensed2(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; machinehours: TXSDecimal ; codeREM : Integer; priconnections : Boolean); overload; stdcall;

    procedure addPlanWorkItemsByClassificationTypeForTechConditions(const classificationTypeCode : Integer; countGen : TXSDecimal; planCode: Integer ) ;stdcall;

    function  addPlanWorkItemsByClassificationTypeForRent(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer;  customPlanDate : TXSDate): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForRent(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer ); stdcall;

    function  addPlanWorkItemsByClassificationTypeForProject(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer;  customPlanDate : TXSDate): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForProject(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal ; codeREM : Integer ); stdcall;

    function  addPlanWorkItemsByClassificationTypeForGuard(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; codeREM : Integer;  customPlanDate : TXSDate): Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForGuard(const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; codeREM : Integer ); stdcall;


    /// добавление АВР плана
    function addForAVR(const aENPlanWork : ENPlanWork; const aPlanWorkItemsArray : ArrayOfENPlanWorkItem; const masterCode: String; const masterName: string; const mechanicCode: string; const mechanicName: string): Integer; stdcall;
    // !!!!!!!! Хитрая замена работы в плане !!!!!!!! //
    function changePlanWorkItem(const aENPlanWorkItem: ENPlanWorkItem): Integer; stdcall;

    function addPlanWorkItemsByClassificationForPriconnection(
      const tcsCode : Integer; aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal;
      codeREM : Integer; priconnections : Boolean) : Integer; stdcall;
    procedure savePlanWorkItemsByClassificationTypeForConnection(
      const aENPlanWork2ClassificationType: ENPlanWork2ClassificationType; distance: TXSDecimal; priconnections: Boolean); stdcall;

    procedure changeWork(const planItemCode: Integer; const techCardCode: Integer) stdcall;
    procedure moveWorkToAbstractPlan(const planItemCode: Integer) stdcall;
    procedure moveWorkFromAbstractPlan(const planItemCode: Integer) stdcall;
    procedure moveTransportToSelectedWork(const planItemFromCode: Integer; const planItemToCode: Integer) stdcall;

    function getPlanWorkItemForClosePlanList(
      const planCode : Integer): ENPlanWorkItemForClosePlanShortList; stdcall;

  end;


implementation

  destructor ENPlanWorkItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
      
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FkartaRef) then
      kartaRef.Free;
    if Assigned(FoldPlanRef) then
      oldPlanRef.Free;
    inherited Destroy;
  end;
  
  destructor ENPlanWorkItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    if Assigned(FkartaRef) then
      kartaRef.Free;
    if Assigned(FoldPlanRef) then
      oldPlanRef.Free;
    inherited Destroy;
  end; 

  destructor ENPlanWorkItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FplanRefDateGen) then
      planRefDateGen.Free;
    if Assigned(FplanRefDateEdit) then
      planRefDateEdit.Free;
    if Assigned(FnormOfTime) then
      normOfTime.Free;
    if Assigned(FcostServicesFS) then
      costServicesFS.Free;
    if Assigned(Fkoef) then
      koef.Free;

    inherited Destroy;
  end;

  destructor ENPlanWorkItemForClosePlanShort.Destroy;
  begin
    if Assigned(FmonthPlanCountGen) then
      monthPlanCountGen.Free;
    if Assigned(FfactCountGen) then
      factCountGen.Free;
    if Assigned(FnpzCountGen) then
      npzCountGen.Free;
    if Assigned(FpossibleCountGen) then
      possibleCountGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    inherited Destroy;
  end;


  
  destructor ENPlanWorkItemShortList.Destroy;
  var
    I: Integer;
  begin
    for I := 0 to Length(Flist)-1 do
     if Assigned(Flist[I]) then
       Flist[I].Free;
     SetLength(Flist, 0);
     inherited Destroy;
  end;

  destructor ENPlanWorkItemForClosePlanShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanWorkItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItem');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemRef');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemFilter');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItemShort');

  RemClassRegistry.RegisterXSClass(ENPlanWorkItemForClosePlanShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemForClosePlanShort');
  RemClassRegistry.RegisterXSClass(ENPlanWorkItemForClosePlanShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanWorkItemForClosePlanShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanWorkItemForClosePlanShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanWorkItemForClosePlanShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanWorkItemControllerSoapPort), 'http://ksoe.org/ENPlanWorkItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanWorkItemControllerSoapPort), 'http://ksoe.org/ENPlanWorkItemController/action/ENPlanWorkItemController.%operationName%');

end.
