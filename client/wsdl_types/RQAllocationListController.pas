unit RQAllocationListController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQAllocationListFormController
   ,RQAllocationListStatusController
   ,RQAllocationListTypeController
   ,ENDepartmentController
   , TKMaterialsController
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

  RQAllocationList            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationListRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationList = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FdateDoc : TXSDate;
    FlistPeriod : TXSDate;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FsumGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FformRef : RQAllocationListFormRef;
//???
    FstatusRef : RQAllocationListStatusRef;
//???
    FtypeRef : RQAllocationListTypeRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateDoc : TXSDate read FdateDoc write FdateDoc;
    property listPeriod : TXSDate read FlistPeriod write FlistPeriod;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property formRef : RQAllocationListFormRef read FformRef write FformRef;
    property statusRef : RQAllocationListStatusRef read FstatusRef write FstatusRef;
    property typeRef : RQAllocationListTypeRef read FtypeRef write FtypeRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

  { ласс по передачи с клиентской части дополнительной информации дл€ формировани€ распределени€}
    // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQAllocationAdditionalParameters = class(TRemotable)
  private
    FmolOnlyNativeRem : Boolean;
	FmolNeighborRems : Boolean;
	FmolCentralWarehouse : Boolean;
	FmolManagement : Boolean;
	FmolOtherRems : Boolean;
	Fbudgets : ArrayOfENDepartmentShort;
	FmaterialsGroups : ArrayOfTKMaterialsRef;
	FpriconnectionDoc : WideString;
  FoldRem : Integer;
  public
    destructor Destroy; override;
  published
    property molOnlyNativeRem : Boolean read FmolOnlyNativeRem write FmolOnlyNativeRem;
    property molNeighborRems : Boolean read FmolNeighborRems write FmolNeighborRems;
    property molCentralWarehouse : Boolean read FmolCentralWarehouse write FmolCentralWarehouse;
    property molManagement : Boolean read FmolManagement write FmolManagement;
    property molOtherRems : Boolean read FmolOtherRems write FmolOtherRems;
    property budgets : ArrayOfENDepartmentShort read Fbudgets write Fbudgets;
	  property materialsGroups : ArrayOfTKMaterialsRef read FmaterialsGroups write FmaterialsGroups;
    property priconnectionDoc : WideString read FpriconnectionDoc write FpriconnectionDoc;
    property oldRem : Integer read FoldRem write FoldRem;
  end;

  RQAllocationListFilter = class(RQAllocationList)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQAllocationListShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FdateDoc : TXSDate;
    FlistPeriod : TXSDate;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FsumGen : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FformRefCode : Integer;
    FformRefName : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property dateDoc : TXSDate read FdateDoc write FdateDoc;
    property listPeriod : TXSDate read FlistPeriod write FlistPeriod;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property formRefCode : Integer read FformRefCode write FformRefCode;
    property formRefName : WideString read FformRefName write FformRefName;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
  end;

  ArrayOfRQAllocationListShort = array of RQAllocationListShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQAllocationListShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQAllocationListShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQAllocationListShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQAllocationListController/message/
  // soapAction: http://ksoe.org/RQAllocationListController/action/RQAllocationListController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQAllocationListControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQAllocationListController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQAllocationListControllerSoapPort = interface(IInvokable)
  ['{F6A9964D-DC36-4FEB-A067-B9AFDBFA1154}']
    function add(const aRQAllocationList: RQAllocationList): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQAllocationList: RQAllocationList); stdcall;
    function getObject(const anObjectCode: Integer): RQAllocationList; stdcall;
    function getList: RQAllocationListShortList; stdcall;
    function getFilteredList(const aRQAllocationListFilter: RQAllocationListFilter): RQAllocationListShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListShortList; stdcall;
    function getScrollableFilteredList(const aRQAllocationListFilter: RQAllocationListFilter; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQAllocationListShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQAllocationListFilter: RQAllocationListFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQAllocationListShort; stdcall;
    // —формировать строки ведомости
    procedure createAutoItems(const allListCode : Integer; additionalParameters : RQAllocationAdditionalParameters); stdcall;
    // ”далить строки ведомости
    procedure removeAutoItems(const allListCode : Integer); stdcall;

    // ”твердить ведомость распределени€ остатков
    procedure confirm(const allListCode : Integer); stdcall;
    // ќтменить утверждение ведомости распределени€ остатков
    procedure unConfirm(const allListCode : Integer); stdcall;

    // ѕроверка прав редактировать резервированную ведомость распределени€ остатков
    procedure editAllocationBudget(); stdcall;

  end;


implementation

  destructor RQAllocationList.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FlistPeriod) then
      listPeriod.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FformRef) then
      formRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

  destructor RQAllocationAdditionalParameters.Destroy;
  var
    i : Integer;
  begin
    if Assigned(Fbudgets) then begin
		for i := 0 to Length(Fbudgets) do begin
			Fbudgets[i].Free;
		end;
	end;
	if Assigned(Fbudgets) then begin
		for i := 0 to Length(FmaterialsGroups) do begin
			FmaterialsGroups[i].Free;
		end;
	end;
    inherited Destroy;
  end;

{
  destructor RQAllocationListFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FlistPeriod) then
      listPeriod.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FformRef) then
      formRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor RQAllocationListFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQAllocationListShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FlistPeriod) then
      listPeriod.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor RQAllocationListShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQAllocationList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationList');
  RemClassRegistry.RegisterXSClass(RQAllocationAdditionalParameters, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationAdditionalParameters');
  RemClassRegistry.RegisterXSClass(RQAllocationListRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListRef');
  RemClassRegistry.RegisterXSClass(RQAllocationListFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListFilter');
  RemClassRegistry.RegisterXSClass(RQAllocationListShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListShort');
  RemClassRegistry.RegisterXSClass(RQAllocationListShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQAllocationListShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQAllocationListShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQAllocationListShort');

  InvRegistry.RegisterInterface(TypeInfo(RQAllocationListControllerSoapPort), 'http://ksoe.org/RQAllocationListController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQAllocationListControllerSoapPort), 'http://ksoe.org/RQAllocationListController/action/RQAllocationListController.%operationName%');


end.
