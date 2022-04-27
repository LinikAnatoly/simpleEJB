unit ENWorkOrderBytController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENSiteController
   ,FINWorkerController
   ,ENWorkOrderBytTypeController
   ,ENMetrologyCounterController
   ,ENWorkOrderBytStatusController
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

  ENWorkOrderByt            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderBytRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderByt = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FsiteRef : ENSiteRef;
//???
    FfinWorker : FINWorker;
//???
    FtypeRef : ENWorkOrderBytTypeRef;
//???
    FstatusRef : ENWorkOrderBytStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property siteRef : ENSiteRef read FsiteRef write FsiteRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property typeRef : ENWorkOrderBytTypeRef read FtypeRef write FtypeRef;
    property statusRef : ENWorkOrderBytStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENWorkOrderBytFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FdateAdd : DateTime;
    FdateEdit : DateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
    Fmodify_time : Int64;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FsiteRef : ENSiteRef;
//???
    FfinWorker : FINWorker;
//???
    FtypeRef : ENWorkOrderBytTypeRef;
//???
    FstatusRef : ENWorkOrderBytStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : DateTime;
    property dateEdit : DateTime;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property siteRef : ENSiteRef read FsiteRef write FsiteRef;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property typeRef : ENWorkOrderBytTypeRef read FtypeRef write FtypeRef;
    property statusRef : ENWorkOrderBytStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENWorkOrderBytFilter = class(ENWorkOrderByt)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENWorkOrderBytShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FdateAdd : TXSDateTime;
    FdateEdit : TXSDateTime;
    FuserAdd : WideString;
    FuserEdit : WideString;
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
    FsiteRefCode : Integer;
    FsiteRefName : WideString;
    FsiteRefSiteaddress : WideString;
    FsiteRefSitephone : WideString;
    FfinWorkerCode : Integer;
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    FfinWorkerPositionCode : Integer;
    FfinWorkerDepartmentName : WideString;
    FfinWorkerDepartmentCode : WideString;
    FfinWorkerPriceGen : TXSDecimal;
    FfinWorkerCategor : Integer;
    FfinWorkerFinCode : Integer;
    FfinWorkerIsSentAssignment : Integer;
    FfinWorkerChargePercent : TXSDecimal;
    FfinWorkerCategorId : Integer;
    FfinWorkerCategorName : WideString;
    FfinWorkerWorkTimeId : WideString;
    FfinWorkerPositionId : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property userEdit : WideString read FuserEdit write FuserEdit;

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
    property siteRefCode : Integer read FsiteRefCode write FsiteRefCode;
    property siteRefName : WideString read FsiteRefName write FsiteRefName;
    property siteRefSiteaddress : WideString read FsiteRefSiteaddress write FsiteRefSiteaddress;
    property siteRefSitephone : WideString read FsiteRefSitephone write FsiteRefSitephone;
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode;
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName;
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName;
    property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode;
    property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName;
    property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode;
    property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen;
    property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor;
    property finWorkerFinCode : Integer read FfinWorkerFinCode write FfinWorkerFinCode;
    property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment;
    property finWorkerChargePercent : TXSDecimal read FfinWorkerChargePercent write FfinWorkerChargePercent;
    property finWorkerCategorId : Integer read FfinWorkerCategorId write FfinWorkerCategorId;
    property finWorkerCategorName : WideString read FfinWorkerCategorName write FfinWorkerCategorName;
    property finWorkerWorkTimeId : WideString read FfinWorkerWorkTimeId write FfinWorkerWorkTimeId;
    property finWorkerPositionId : WideString read FfinWorkerPositionId write FfinWorkerPositionId;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfENWorkOrderBytShort = array of ENWorkOrderBytShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderBytShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderBytShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderBytShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderBytController/message/
  // soapAction: http://ksoe.org/ENWorkOrderBytController/action/ENWorkOrderBytController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderBytControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderBytController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderBytControllerSoapPort = interface(IInvokable)
  ['{4D940E0B-FC7C-44FA-91B7-B1EE80ABD383}']
    function add(const aENWorkOrderByt: ENWorkOrderByt): Integer; stdcall;

    procedure remove(const anObjectCode: Integer); stdcall;
    procedure removeBadRaid(const anObjectCode: Integer); stdcall;

    procedure save(const aENWorkOrderByt: ENWorkOrderByt); stdcall;
    function getObject(const anObjectCode: Integer): ENWorkOrderByt; stdcall;
    function getList: ENWorkOrderBytShortList; stdcall;
    function getFilteredList(const aENWorkOrderBytFilter: ENWorkOrderBytFilter): ENWorkOrderBytShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytShortList; stdcall;
    function getScrollableFilteredList(const aENWorkOrderBytFilter: ENWorkOrderBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderBytFilter: ENWorkOrderBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENWorkOrderBytShort; stdcall;

    function getObjectForRaid(const anObjectCode: Integer): ENWorkOrderByt; stdcall;
    function getScrollableFilteredListForRaid(const aENWorkOrderBytFilter: ENWorkOrderBytFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderBytShortList; stdcall;

    procedure addSeals(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                       const anAccountingTypeCode: Integer); stdcall; overload;
    procedure addSeals(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                       const anAccountingTypeCode: Integer; const aNoBindingToPlans: Boolean); stdcall; overload;
    procedure addSealsForRaid(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                              const anAccountingTypeCode: Integer; const aNoBindingToPlans: Boolean); stdcall;
    procedure addSealsByFact(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                             const anAccountingTypeCode: Integer); stdcall; overload;
    procedure addSealsByFact(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                             const anAccountingTypeCode: Integer; const aNoBindingToPlans: Boolean); stdcall; overload;
    procedure addSealsForRaidByFact(const aWorkOrderBytCode: Integer; const aSeals: ArrayOfENMetrologyCounterShort;
                                    const anAccountingTypeCode: Integer; const aNoBindingToPlans: Boolean); stdcall;

    procedure removeSeals(const aWorkOrderBytCode: Integer; const aSealCodes: ArrayOfInteger); stdcall;
    procedure removeSealsByFact(const aWorkOrderBytCode: Integer; const aSealCodes: ArrayOfInteger); stdcall;

    procedure makeFormed(const aWorkOrderBytCode: Integer); stdcall;
    procedure undoMakeFormed(const aWorkOrderBytCode: Integer); stdcall;
    procedure makeApproved(const aWorkOrderBytCode: Integer); stdcall;
    procedure undoMakeApproved(const aWorkOrderBytCode: Integer); stdcall;
    procedure makeCompleted(const aWorkOrderBytCode: Integer); stdcall;
    procedure undoMakeCompleted(const aWorkOrderBytCode: Integer); stdcall;
    procedure makeClosed(const aWorkOrderBytCode: Integer); stdcall;
    procedure undoMakeClosed(const aWorkOrderBytCode: Integer); stdcall;

    function checkWorkOrderBytForStatus(const aWorkOrderBytCode: Integer; const aStatusCode: Integer; const isException: Boolean): Boolean; overload; stdcall;
    function checkWorkOrderBytForStatus(const aENWorkOrderByt: ENWorkOrderByt; const aStatusCode: Integer; const isException: Boolean): Boolean; overload; stdcall;
  end;


implementation

  destructor ENWorkOrderByt.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FsiteRef) then
      siteRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENWorkOrderBytFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FsiteRef) then
      siteRef.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENWorkOrderBytFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENWorkOrderBytShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    if Assigned(FfinWorkerChargePercent) then
      finWorkerChargePercent.Free;
    inherited Destroy;
  end;

  destructor ENWorkOrderBytShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrderByt, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderByt');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderBytShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderBytShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderBytShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderBytShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderBytControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderBytControllerSoapPort), 'http://ksoe.org/ENWorkOrderBytController/action/ENWorkOrderBytController.%operationName%');


end.
