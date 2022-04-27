unit ENBudgets2NomenclaturesController;

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

  ENBudgets2Nomenclatures            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBudgets2NomenclaturesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBudgets2Nomenclatures = class(TRemotable)
  private
    Fcode : Integer;
    Fmat_id : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  mat_id : Integer read Fmat_id write Fmat_id;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;

{
  ENBudgets2NomenclaturesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmat_id : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  mat_id : Integer read Fmat_id write Fmat_id;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;
}

  ENBudgets2NomenclaturesFilter = class(ENBudgets2Nomenclatures)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBudgets2NomenclaturesShort = class(TRemotable)
  private
    Fcode : Integer;
    Fnn : WideString;
    Fmat_name : WideString;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property nn : WideString read Fnn write Fnn;
    property mat_name : WideString read Fmat_name write Fmat_name;

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
  end;

  ArrayOfENBudgets2NomenclaturesShort = array of ENBudgets2NomenclaturesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBudgets2NomenclaturesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBudgets2NomenclaturesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBudgets2NomenclaturesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBudgets2NomenclaturesController/message/
  // soapAction: http://ksoe.org/ENBudgets2NomenclaturesController/action/ENBudgets2NomenclaturesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBudgets2NomenclaturesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBudgets2NomenclaturesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBudgets2NomenclaturesControllerSoapPort = interface(IInvokable)
  ['{76153B55-4746-4F02-A949-B19106817AFF}']
    function add(const aENBudgets2Nomenclatures: ENBudgets2Nomenclatures): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBudgets2Nomenclatures: ENBudgets2Nomenclatures); stdcall;
    function getObject(const anObjectCode: Integer): ENBudgets2Nomenclatures; stdcall;
    function getList: ENBudgets2NomenclaturesShortList; stdcall;
    function getFilteredList(const aENBudgets2NomenclaturesFilter: ENBudgets2NomenclaturesFilter): ENBudgets2NomenclaturesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBudgets2NomenclaturesShortList; stdcall;
    function getScrollableFilteredList(const aENBudgets2NomenclaturesFilter: ENBudgets2NomenclaturesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBudgets2NomenclaturesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBudgets2NomenclaturesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBudgets2NomenclaturesFilter: ENBudgets2NomenclaturesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBudgets2NomenclaturesShort; stdcall;
  end;


implementation

  destructor ENBudgets2Nomenclatures.Destroy;
  begin
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBudgets2NomenclaturesFilter.Destroy;
  begin
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBudgets2NomenclaturesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBudgets2NomenclaturesShort.Destroy;
  begin
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENBudgets2NomenclaturesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBudgets2Nomenclatures, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBudgets2Nomenclatures');
  RemClassRegistry.RegisterXSClass(ENBudgets2NomenclaturesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBudgets2NomenclaturesRef');
  RemClassRegistry.RegisterXSClass(ENBudgets2NomenclaturesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBudgets2NomenclaturesFilter');
  RemClassRegistry.RegisterXSClass(ENBudgets2NomenclaturesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBudgets2NomenclaturesShort');
  RemClassRegistry.RegisterXSClass(ENBudgets2NomenclaturesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBudgets2NomenclaturesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBudgets2NomenclaturesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBudgets2NomenclaturesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBudgets2NomenclaturesControllerSoapPort), 'http://ksoe.org/ENBudgets2NomenclaturesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBudgets2NomenclaturesControllerSoapPort), 'http://ksoe.org/ENBudgets2NomenclaturesController/action/ENBudgets2NomenclaturesController.%operationName%');


end.
