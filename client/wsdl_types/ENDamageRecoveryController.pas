unit ENDamageRecoveryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENDamageRecoveryStatusController
   ,ENWarrantController
   ,FKProvObjectController
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

  ENDamageRecovery            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecoveryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENDamageRecovery = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FFKcontractCode : WideString;
    FFKpartnerCode : WideString;
    FFKdocCode : WideString;
    FFKdocID : Integer;
    FcommentGen : WideString;
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentPassport : WideString;
    FdamageAmmount : TXSDecimal;
    FpartId : Integer;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartmentRef;
//???
    FstatusRef : ENDamageRecoveryStatusRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property FKcontractCode : WideString read FFKcontractCode write FFKcontractCode;
    property FKpartnerCode : WideString read FFKpartnerCode write FFKpartnerCode;
    property FKdocCode : WideString read FFKdocCode write FFKdocCode;
    property  FKdocID : Integer read FFKdocID write FFKdocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property damageAmmount : TXSDecimal read FdamageAmmount write FdamageAmmount;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property statusRef : ENDamageRecoveryStatusRef read FstatusRef write FstatusRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;

{
  ENDamageRecoveryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FFKcontractCode : WideString;
    FFKpartnerCode : WideString;
    FFKdocCode : WideString;
    FFKdocID : Integer;
    FcommentGen : WideString;
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentPassport : WideString;
    FdamageAmmount : TXSDecimal;
    FpartId : Integer;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartmentRef;
//???
    FstatusRef : ENDamageRecoveryStatusRef;
//???
    FwarrantRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property FKcontractCode : WideString read FFKcontractCode write FFKcontractCode;
    property FKpartnerCode : WideString read FFKpartnerCode write FFKpartnerCode;
    property FKdocCode : WideString read FFKdocCode write FFKdocCode;
    property  FKdocID : Integer read FFKdocID write FFKdocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property damageAmmount : TXSDecimal read FdamageAmmount write FdamageAmmount;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartmentRef read Fdepartment write Fdepartment;
    property statusRef : ENDamageRecoveryStatusRef read FstatusRef write FstatusRef;
    property warrantRef : ENWarrantRef read FwarrantRef write FwarrantRef;
  end;
}

  ENDamageRecoveryFilter = class(ENDamageRecovery)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENDamageRecoveryShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateGen : TXSDate;
    FFKcontractCode : WideString;
    FFKpartnerCode : WideString;
    FFKdocCode : WideString;
    FFKdocID : Integer;
    FcommentGen : WideString;
    FcontragentName : WideString;
    FcontragentAddress : WideString;
    FcontragentPassport : WideString;
    FdamageAmmount : TXSDecimal;
    FpartId : Integer;
    FdatePosting : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdepartmentCode : Integer;
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FdepartmentRenCode : Integer;
    FdepartmentShpzBalans : WideString;
    FdepartmentKau_table_id_1884 : Integer;
    FdepartmentKau_1884 : WideString;
    FdepartmentName_1884 : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FwarrantRefCode : Integer;
    FwarrantRefNumbergen : WideString;
    FwarrantRefName : WideString;
    FwarrantRefWarrantFIO : WideString;
    FwarrantRefWarrantShortFIO : WideString;
    FwarrantRefWarrantPosition : WideString;
    FwarrantRefGenitiveFIO : WideString;
    FwarrantRefGenitivePosition : WideString;
    FwarrantRefPassport : WideString;
    FwarrantRefAddress : WideString;
    FwarrantRefPower : Integer;
    FwarrantRefMaxSum : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property FKcontractCode : WideString read FFKcontractCode write FFKcontractCode;
    property FKpartnerCode : WideString read FFKpartnerCode write FFKpartnerCode;
    property FKdocCode : WideString read FFKdocCode write FFKdocCode;
    property  FKdocID : Integer read FFKdocID write FFKdocID;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property contragentName : WideString read FcontragentName write FcontragentName;
    property contragentAddress : WideString read FcontragentAddress write FcontragentAddress;
    property contragentPassport : WideString read FcontragentPassport write FcontragentPassport;
    property damageAmmount : TXSDecimal read FdamageAmmount write FdamageAmmount;
    property  partId : Integer read FpartId write FpartId;
    property datePosting : TXSDate read FdatePosting write FdatePosting;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode;
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName;
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart;
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal;
    property departmentRenCode : Integer read FdepartmentRenCode write FdepartmentRenCode;
    property departmentShpzBalans : WideString read FdepartmentShpzBalans write FdepartmentShpzBalans;
    property departmentKau_table_id_1884 : Integer read FdepartmentKau_table_id_1884 write FdepartmentKau_table_id_1884;
    property departmentKau_1884 : WideString read FdepartmentKau_1884 write FdepartmentKau_1884;
    property departmentName_1884 : WideString read FdepartmentName_1884 write FdepartmentName_1884;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property warrantRefCode : Integer read FwarrantRefCode write FwarrantRefCode;
    property warrantRefNumbergen : WideString read FwarrantRefNumbergen write FwarrantRefNumbergen;
    property warrantRefName : WideString read FwarrantRefName write FwarrantRefName;
    property warrantRefWarrantFIO : WideString read FwarrantRefWarrantFIO write FwarrantRefWarrantFIO;
    property warrantRefWarrantShortFIO : WideString read FwarrantRefWarrantShortFIO write FwarrantRefWarrantShortFIO;
    property warrantRefWarrantPosition : WideString read FwarrantRefWarrantPosition write FwarrantRefWarrantPosition;
    property warrantRefGenitiveFIO : WideString read FwarrantRefGenitiveFIO write FwarrantRefGenitiveFIO;
    property warrantRefGenitivePosition : WideString read FwarrantRefGenitivePosition write FwarrantRefGenitivePosition;
    property warrantRefPassport : WideString read FwarrantRefPassport write FwarrantRefPassport;
    property warrantRefAddress : WideString read FwarrantRefAddress write FwarrantRefAddress;
    property warrantRefPower : Integer read FwarrantRefPower write FwarrantRefPower;
    property warrantRefMaxSum : TXSDecimal read FwarrantRefMaxSum write FwarrantRefMaxSum;
  end;

  ArrayOfENDamageRecoveryShort = array of ENDamageRecoveryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENDamageRecoveryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENDamageRecoveryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENDamageRecoveryShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENDamageRecoveryController/message/
  // soapAction: http://ksoe.org/ENDamageRecoveryController/action/ENDamageRecoveryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENDamageRecoveryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENDamageRecoveryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENDamageRecoveryControllerSoapPort = interface(IInvokable)
  ['{78857885-7885-7885-7885-788578857885}']
    function add(const aENDamageRecovery: ENDamageRecovery): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENDamageRecovery: ENDamageRecovery); stdcall;
    function getObject(const anObjectCode: Integer): ENDamageRecovery; stdcall;
    function getList: ENDamageRecoveryShortList; stdcall;
    function getFilteredList(const aENDamageRecoveryFilter: ENDamageRecoveryFilter): ENDamageRecoveryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryShortList; stdcall;
    function getScrollableFilteredList(const aENDamageRecoveryFilter: ENDamageRecoveryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENDamageRecoveryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENDamageRecoveryFilter: ENDamageRecoveryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENDamageRecoveryShort; stdcall;

    procedure changeDatePosting(const aENDamageRecovery: ENDamageRecovery); stdcall;
    function  getFKPostingsList(damageRecoveryCode: Integer): FKProvObjectShortList; stdcall;
    function  movePostingToFK(damageRecoveryCode: Integer): FKProvResult; stdcall;
    procedure deletePostingFromFK(damageRecoveryCode: Integer); stdcall;

  end;


implementation

  destructor ENDamageRecovery.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdamageAmmount) then
      damageAmmount.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;

{
  destructor ENDamageRecoveryFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdamageAmmount) then
      damageAmmount.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FwarrantRef) then
      warrantRef.Free;
    inherited Destroy;
  end;
}

  destructor ENDamageRecoveryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENDamageRecoveryShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdamageAmmount) then
      damageAmmount.Free;
    if Assigned(FdatePosting) then
      datePosting.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    if Assigned(FwarrantRefMaxSum) then
      warrantRefMaxSum.Free;
    inherited Destroy;
  end;

  destructor ENDamageRecoveryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENDamageRecovery, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecovery');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryRef');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryFilter');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryShort');
  RemClassRegistry.RegisterXSClass(ENDamageRecoveryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENDamageRecoveryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENDamageRecoveryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENDamageRecoveryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENDamageRecoveryControllerSoapPort), 'http://ksoe.org/ENDamageRecoveryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENDamageRecoveryControllerSoapPort), 'http://ksoe.org/ENDamageRecoveryController/action/ENDamageRecoveryController.%operationName%');


end.
