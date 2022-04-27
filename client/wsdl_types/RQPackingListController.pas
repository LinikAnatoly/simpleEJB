unit RQPackingListController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQPackingListStatusController
   ,ENDepartmentController
   ,TKAccountingTypeController
   ,ENGeographicDepartmentController
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

  RQPackingList            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingListRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQPackingList = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FmolFromCode : WideString;
    FmolFromName : WideString;
    FmolToCode : WideString;
    FmolToName : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FbudgetString : WideString;
    FmaterialString : WideString;
    FelementString : WideString;
    FpackerFIO : WideString;
    FpackerTabNumber : WideString;
    FpackerPosition : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    FstatusRef : RQPackingListStatusRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FrenRef : EPRenRef;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
//???
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property molFromCode : WideString read FmolFromCode write FmolFromCode;
    property molFromName : WideString read FmolFromName write FmolFromName;
    property molToCode : WideString read FmolToCode write FmolToCode;
    property molToName : WideString read FmolToName write FmolToName;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property budgetString : WideString read FbudgetString write FbudgetString;
    property materialString : WideString read FmaterialString write FmaterialString;
    property elementString : WideString read FelementString write FelementString;
    property packerFIO : WideString read FpackerFIO write FpackerFIO;
    property packerTabNumber : WideString read FpackerTabNumber write FpackerTabNumber;
    property packerPosition : WideString read FpackerPosition write FpackerPosition;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property statusRef : RQPackingListStatusRef read FstatusRef write FstatusRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
   end;
{
  RQPackingListFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FmolFromCode : WideString;
    FmolFromName : WideString;
    FmolToCode : WideString;
    FmolToName : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FbudgetString : WideString;
    FmaterialString : WideString;
    FelementString : WideString;
    FpackerFIO : WideString;
    FpackerTabNumber : WideString;
    FpackerPosition : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
    Fdomain_info : WideString;
//???
    FstatusRef : RQPackingListStatusRef;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FrenRef : EPRenRef;
//???
    FaccountingTypeRef : TKAccountingTypeRef;
//???
    FgeoDepartmentRef : ENGeographicDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property molFromCode : WideString read FmolFromCode write FmolFromCode;
    property molFromName : WideString read FmolFromName write FmolFromName;
    property molToCode : WideString read FmolToCode write FmolToCode;
    property molToName : WideString read FmolToName write FmolToName;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property budgetString : WideString read FbudgetString write FbudgetString;
    property materialString : WideString read FmaterialString write FmaterialString;
    property elementString : WideString read FelementString write FelementString;
    property packerFIO : WideString read FpackerFIO write FpackerFIO;
    property packerTabNumber : WideString read FpackerTabNumber write FpackerTabNumber;
    property packerPosition : WideString read FpackerPosition write FpackerPosition;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property statusRef : RQPackingListStatusRef read FstatusRef write FstatusRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
    property accountingTypeRef : TKAccountingTypeRef read FaccountingTypeRef write FaccountingTypeRef;
    property geoDepartmentRef : ENGeographicDepartmentRef read FgeoDepartmentRef write FgeoDepartmentRef;
  end;
}

  RQPackingListFilter = class(RQPackingList)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQPackingListShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FmolFromCode : WideString;
    FmolFromName : WideString;
    FmolToCode : WideString;
    FmolToName : WideString;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FbudgetString : WideString;
    FmaterialString : WideString;
    FpackerFIO : WideString;
    FpackerTabNumber : WideString;
    FpackerPosition : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FdepartmentRefCode : Integer;
    FdepartmentRefShortName : WideString;
    FdepartmentRefDateStart : TXSDate;
    FdepartmentRefDateFinal : TXSDate;
    FrenRefCode : Integer;
    FrenRefName : WideString;
    FaccountingTypeRefCode : Integer;
    FaccountingTypeRefName : WideString;
    FgeoDepartmentRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property molFromCode : WideString read FmolFromCode write FmolFromCode;
    property molFromName : WideString read FmolFromName write FmolFromName;
    property molToCode : WideString read FmolToCode write FmolToCode;
    property molToName : WideString read FmolToName write FmolToName;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property budgetString : WideString read FbudgetString write FbudgetString;
    property materialString : WideString read FmaterialString write FmaterialString;
    property packerFIO : WideString read FpackerFIO write FpackerFIO;
    property packerTabNumber : WideString read FpackerTabNumber write FpackerTabNumber;
    property packerPosition : WideString read FpackerPosition write FpackerPosition;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property departmentRefCode : Integer read FdepartmentRefCode write FdepartmentRefCode;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property departmentRefDateStart : TXSDate read FdepartmentRefDateStart write FdepartmentRefDateStart;
    property departmentRefDateFinal : TXSDate read FdepartmentRefDateFinal write FdepartmentRefDateFinal;
    property renRefCode : Integer read FrenRefCode write FrenRefCode;
    property renRefName : WideString read FrenRefName write FrenRefName;
    property accountingTypeRefCode : Integer read FaccountingTypeRefCode write FaccountingTypeRefCode;
    property accountingTypeRefName : WideString read FaccountingTypeRefName write FaccountingTypeRefName;
    property geoDepartmentRefCode : Integer read FgeoDepartmentRefCode write FgeoDepartmentRefCode; //ENGeographicDepartmentRef read FgeoDepartmentRefCode write FgeoDepartmentRefCode;
  end;

  ArrayOfRQPackingListShort = array of RQPackingListShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQPackingListShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQPackingListShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQPackingListShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQPackingListController/message/
  // soapAction: http://ksoe.org/RQPackingListController/action/RQPackingListController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQPackingListControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQPackingListController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQPackingListControllerSoapPort = interface(IInvokable)
  ['{12a512a5-12a5-12a5-12a5-12a512a512a5}']
    function add(const aRQPackingList: RQPackingList): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQPackingList: RQPackingList); stdcall;
    function getObject(const anObjectCode: Integer): RQPackingList; stdcall;
    function getList: RQPackingListShortList; stdcall;
    function getFilteredList(const aRQPackingListFilter: RQPackingListFilter): RQPackingListShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQPackingListShortList; stdcall;
    function getScrollableFilteredList(const aRQPackingListFilter: RQPackingListFilter; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQPackingListShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQPackingListFilter: RQPackingListFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQPackingListShort; stdcall;
    function getPalletNumbers(const packingListCode: Integer) : ArrayOfString; stdcall;
  end;


implementation

  destructor RQPackingList.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end;

{
  destructor RQPackingListFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    if Assigned(FaccountingTypeRef) then
      accountingTypeRef.Free;
if Assigned(FgeoDepartmentRef) then
      geoDepartmentRef.Free;
    inherited Destroy;
  end;
}

  destructor RQPackingListFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQPackingListShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor RQPackingListShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQPackingList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingList');
  RemClassRegistry.RegisterXSClass(RQPackingListRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListRef');
  RemClassRegistry.RegisterXSClass(RQPackingListFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListFilter');
  RemClassRegistry.RegisterXSClass(RQPackingListShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListShort');
  RemClassRegistry.RegisterXSClass(RQPackingListShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQPackingListShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQPackingListShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQPackingListShort');

  InvRegistry.RegisterInterface(TypeInfo(RQPackingListControllerSoapPort), 'http://ksoe.org/RQPackingListController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQPackingListControllerSoapPort), 'http://ksoe.org/RQPackingListController/action/RQPackingListController.%operationName%');


end.
