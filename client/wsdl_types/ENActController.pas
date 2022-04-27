unit ENActController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActStatusController
   ,ENElementController
   ,ENPlanWorkStateController
   ,ENPlan2HumenController
   ,ENPlanWorkController
   ,FKProvObjectController
   ,DFDocSignerController
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

  ENAct            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENActRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FfinMechanicCode : WideString;
    FfinMechanicName : WideString;
    FcommentGen : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FdateAct : TXSDate;
    FmolCodeObject : WideString;
    FcheckedByAccountant : TXSBoolean;
//???
    FstatusRef : ENActStatusRef;
//???
    Felement : ENElement;
//???
    FactTypeRef : ENPlanWorkStateRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicCode : WideString read FfinMechanicCode write FfinMechanicCode;
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property dateAct : TXSDate read FdateAct write FdateAct;
    property molCodeObject : WideString read FmolCodeObject write FmolCodeObject;
    property checkedByAccountant : TXSBoolean read FcheckedByAccountant write FcheckedByAccountant;
    property statusRef : ENActStatusRef read FstatusRef write FstatusRef;
    property element : ENElement read Felement write Felement;
    property actTypeRef : ENPlanWorkStateRef read FactTypeRef write FactTypeRef;
  end;

{
  ENActFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FfinMechanicCode : WideString;
    FfinMechanicName : WideString;
    FcommentGen : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
    FdateAct : TXSDate;
    FmolCodeObject : WideString;
    FcheckedByAccountant : TXSBoolean;
//???
    FstatusRef : ENActStatusRef;
//???
    Felement : ENElement;
//???
    FactTypeRef : ENPlanWorkStateRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicCode : WideString read FfinMechanicCode write FfinMechanicCode;
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property dateAct : TXSDate read FdateAct write FdateAct;
    property molCodeObject : WideString read FmolCodeObject write FmolCodeObject;
    property checkedByAccountant : TXSBoolean read FcheckedByAccountant write FcheckedByAccountant;
    property statusRef : ENActStatusRef read FstatusRef write FstatusRef;
    property element : ENElement read Felement write Felement;
    property actTypeRef : ENPlanWorkStateRef read FactTypeRef write FactTypeRef;
  end;
}

  ENActFilter = class(ENAct)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENActShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FfinMechanicName : WideString;
    FinvNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdateAct : TXSDate;
    FmolCodeObject : WideString;
    FcheckedByAccountant : TXSBoolean;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FelementCode : Integer;
    FactTypeRefCode : Integer;
    FactTypeRefName : WideString;
    FactTypeRefShortName : WideString;
    FplanWorkTypeName: WideString;
    FhumanHours: TXSDecimal;  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property dateAct : TXSDate read FdateAct write FdateAct;
    property molCodeObject : WideString read FmolCodeObject write FmolCodeObject;
    property checkedByAccountant : TXSBoolean read FcheckedByAccountant write FcheckedByAccountant;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property elementCode : Integer read FelementCode write FelementCode;
    property actTypeRefCode : Integer read FactTypeRefCode write FactTypeRefCode;
    property actTypeRefName : WideString read FactTypeRefName write FactTypeRefName;
    property actTypeRefShortName : WideString read FactTypeRefShortName write FactTypeRefShortName;
    property planWorkTypeName : WideString read FplanWorkTypeName write FplanWorkTypeName;
    property humanHours : TXSDecimal read FhumanHours write FhumanHours;  end;

  ArrayOfENActShort = array of ENActShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENActShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENActShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENActShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENActController/message/
  // soapAction: http://ksoe.org/ENActController/action/ENActController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENActControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENActController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENActControllerSoapPort = interface(IInvokable)
  ['{3AB65682-8CE1-4407-B76B-5E0B32B5D980}']
    function add(const aENAct: ENAct): Integer; overload; stdcall;
    function add(const aENAct: ENAct; const dfDocSigners: ArrayOfDFDocSigner): Integer; overload; stdcall;

    procedure remove(const anObjectCode: Integer; const isClient: Integer); stdcall;

    procedure save(const aENAct: ENAct); overload; stdcall;
    procedure save(const aENAct: ENAct; const dfDocSigners: ArrayOfDFDocSigner); overload; stdcall;

    procedure saveDFDocSigners(const aENAct: ENAct; const dfDocSigners: ArrayOfDFDocSigner); overload; stdcall;

    function getObject(const anObjectCode: Integer): ENAct; stdcall;
    function getList: ENActShortList; stdcall;
    function getFilteredList(const aENActFilter: ENActFilter): ENActShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENActShortList; stdcall;
    function getScrollableFilteredList(const aENActFilter: ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ENActShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENActShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENActFilter: ENActFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENActShort; stdcall;
    procedure close(const anObjectCode: Integer; const isClient: Integer ; const withUseAxTransaction : boolean); stdcall;
    procedure unClose(const anObjectCode: Integer; const isClient: Integer); stdcall;
    procedure unCloseByEcp(const anObjectCode: Integer; const isClient: Integer); stdcall;
    procedure fillActData(const anObjectCode: Integer); stdcall;
    function getActs4Recalc(const actCode : Integer) : ENActShortList;  stdcall;

    function getRelatedWorkOrders(const actCode : Integer ) : ENPlanWorkShortList ; stdcall;

    procedure signatured(const anObjectCode: Integer); stdcall;
    procedure unSignatured(const anObjectCode: Integer); stdcall;

    function getRelatedWorkOrdersByTabNumber(const aActCode : Integer; const aTabNumber : WideString ): ENPlan2HumenShortList; stdcall;

    function getCountProvByActCode(const actCode : Integer ) : Integer ; stdcall;

    //  21.09.2012 +++ изменение даты проведения акта
    procedure changeDateMove(const aENAct : ENAct); stdcall;

    procedure moveToReversed(const actCode : Integer); stdcall;

    function createActForRecyclableMaterials(const aENAct: ENAct): Integer; stdcall;
    procedure removeActForRecyclableMaterials(const actCode : Integer); stdcall;

    // список проводок по коду акта
    function getPostingsList(servicesObjectCode: Integer; isMaterials : TXSBoolean): FKProvObjectShortList; stdcall;
	
	// SUPP-78694 Проставление или снятие признака "Проверено в бухгалтерии"
    procedure checkOrUncheckByAccountant(const actCode: Integer; const isChecked : Boolean); stdcall;

    function getReportsListForENAct(const aENAct: ENAct): ArrayOfEPReportRequestEx; stdcall;
  end;


implementation

  destructor ENAct.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FactTypeRef) then
      actTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENActFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(FactTypeRef) then
      actTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENActFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENActShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateAct) then
      dateAct.Free;
    if Assigned(FcheckedByAccountant) then
      checkedByAccountant.Free;
    inherited Destroy;
  end;

  destructor ENActShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct');
  RemClassRegistry.RegisterXSClass(ENActRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActRef');
  RemClassRegistry.RegisterXSClass(ENActFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActFilter');
  RemClassRegistry.RegisterXSClass(ENActShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActShort');
  RemClassRegistry.RegisterXSClass(ENActShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENActShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENActShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENActShort');

  InvRegistry.RegisterInterface(TypeInfo(ENActControllerSoapPort), 'http://ksoe.org/ENActController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENActControllerSoapPort), 'http://ksoe.org/ENActController/action/ENActController.%operationName%');


end.
