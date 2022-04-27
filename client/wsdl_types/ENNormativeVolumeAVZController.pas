unit ENNormativeVolumeAVZController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENNormativeVolumeAVZ            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNormativeVolumeAVZRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENNormativeVolumeAVZ = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Frest_purpose_type_id : Integer;
    Frest_purpose_type_name : WideString;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property rest_purpose_type_name : WideString read Frest_purpose_type_name write Frest_purpose_type_name;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;

{
  ENNormativeVolumeAVZFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Frest_purpose_type_id : Integer;
    Frest_purpose_type_name : WideString;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FdepartmentRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property rest_purpose_type_name : WideString read Frest_purpose_type_name write Frest_purpose_type_name;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
  end;
}

  ENNormativeVolumeAVZFilter = class(ENNormativeVolumeAVZ)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENNormativeVolumeAVZShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Frest_purpose_type_id : Integer;
    Frest_purpose_type_name : WideString;
    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FbudgetRefRenCode : Integer;
    FbudgetRefShpzBalans : WideString;
    FbudgetRefKau_table_id_1884 : Integer;
    FbudgetRefKau_1884 : WideString;
    FbudgetRefName_1884 : WideString;
    FbudgetRefHrmorganizationid : WideString;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id;
    property rest_purpose_type_name : WideString read Frest_purpose_type_name write Frest_purpose_type_name;

    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart;
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal;
    property budgetRefRenCode : Integer read FbudgetRefRenCode write FbudgetRefRenCode;
    property budgetRefShpzBalans : WideString read FbudgetRefShpzBalans write FbudgetRefShpzBalans;
    property budgetRefKau_table_id_1884 : Integer read FbudgetRefKau_table_id_1884 write FbudgetRefKau_table_id_1884;
    property budgetRefKau_1884 : WideString read FbudgetRefKau_1884 write FbudgetRefKau_1884;
    property budgetRefName_1884 : WideString read FbudgetRefName_1884 write FbudgetRefName_1884;
    property budgetRefHrmorganizationid : WideString read FbudgetRefHrmorganizationid write FbudgetRefHrmorganizationid;
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
  end;

  ArrayOfENNormativeVolumeAVZShort = array of ENNormativeVolumeAVZShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENNormativeVolumeAVZShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENNormativeVolumeAVZShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENNormativeVolumeAVZShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENNormativeVolumeAVZController/message/
  // soapAction: http://ksoe.org/ENNormativeVolumeAVZController/action/ENNormativeVolumeAVZController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENNormativeVolumeAVZControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENNormativeVolumeAVZController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENNormativeVolumeAVZControllerSoapPort = interface(IInvokable)
  ['{D5F0571B-5019-4FBA-ACC0-9242516A3614}']
    function add(const aENNormativeVolumeAVZ: ENNormativeVolumeAVZ): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENNormativeVolumeAVZ: ENNormativeVolumeAVZ); stdcall;
    function getObject(const anObjectCode: Integer): ENNormativeVolumeAVZ; stdcall;
    function getList: ENNormativeVolumeAVZShortList; stdcall;
    function getFilteredList(const aENNormativeVolumeAVZFilter: ENNormativeVolumeAVZFilter): ENNormativeVolumeAVZShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENNormativeVolumeAVZShortList; stdcall;
    function getScrollableFilteredList(const aENNormativeVolumeAVZFilter: ENNormativeVolumeAVZFilter; const aFromPosition: Integer; const aQuantity: Integer): ENNormativeVolumeAVZShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENNormativeVolumeAVZShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENNormativeVolumeAVZFilter: ENNormativeVolumeAVZFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENNormativeVolumeAVZShort; stdcall;
  end;


implementation

  destructor ENNormativeVolumeAVZ.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;

{
  destructor ENNormativeVolumeAVZFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    inherited Destroy;
  end;
}

  destructor ENNormativeVolumeAVZFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENNormativeVolumeAVZShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENNormativeVolumeAVZShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENNormativeVolumeAVZ, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormativeVolumeAVZ');
  RemClassRegistry.RegisterXSClass(ENNormativeVolumeAVZRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormativeVolumeAVZRef');
  RemClassRegistry.RegisterXSClass(ENNormativeVolumeAVZFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormativeVolumeAVZFilter');
  RemClassRegistry.RegisterXSClass(ENNormativeVolumeAVZShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormativeVolumeAVZShort');
  RemClassRegistry.RegisterXSClass(ENNormativeVolumeAVZShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENNormativeVolumeAVZShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENNormativeVolumeAVZShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENNormativeVolumeAVZShort');

  InvRegistry.RegisterInterface(TypeInfo(ENNormativeVolumeAVZControllerSoapPort), 'http://ksoe.org/ENNormativeVolumeAVZController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENNormativeVolumeAVZControllerSoapPort), 'http://ksoe.org/ENNormativeVolumeAVZController/action/ENNormativeVolumeAVZController.%operationName%');


end.
