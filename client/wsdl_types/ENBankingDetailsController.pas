unit ENBankingDetailsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENBankingBillTypeController
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

  ENBankingDetails            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBankingDetailsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENBankingDetails = class(TRemotable)
  private
    Fcode : Integer;
    Fbankname : WideString;
    Fbankokpo : WideString;
    Fbankmfo : Integer;
    Fbankaccount : WideString;
    Fpartnercode : WideString;
    Fcontract : WideString;
    FuseDefault : Integer;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FbillTypeRef : ENBankingBillTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property bankname : WideString read Fbankname write Fbankname;
    property bankokpo : WideString read Fbankokpo write Fbankokpo;
    property  bankmfo : Integer read Fbankmfo write Fbankmfo;
    property bankaccount : WideString read Fbankaccount write Fbankaccount;
    property partnercode : WideString read Fpartnercode write Fpartnercode;
    property contract : WideString read Fcontract write Fcontract;
    property  useDefault : Integer read FuseDefault write FuseDefault;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property billTypeRef : ENBankingBillTypeRef read FbillTypeRef write FbillTypeRef;
  end;

{
  ENBankingDetailsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fbankname : WideString;
    Fbankokpo : WideString;
    Fbankmfo : Integer;
    Fbankaccount : Int64;
    Fpartnercode : WideString;
    Fcontract : WideString;
    FuseDefault : Integer;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FbillTypeRef : ENBankingBillTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property bankname : WideString read Fbankname write Fbankname;
    property bankokpo : WideString read Fbankokpo write Fbankokpo;
    property  bankmfo : Integer read Fbankmfo write Fbankmfo;
    property bankaccount : Int64 read Fbankaccount write Fbankaccount;
    property partnercode : WideString read Fpartnercode write Fpartnercode;
    property contract : WideString read Fcontract write Fcontract;
    property  useDefault : Integer read FuseDefault write FuseDefault;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property billTypeRef : ENBankingBillTypeRef read FbillTypeRef write FbillTypeRef;
  end;
}

  ENBankingDetailsFilter = class(ENBankingDetails)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENBankingDetailsShort = class(TRemotable)
  private
    Fcode : Integer;
    Fbankname : WideString;
    Fbankokpo : WideString;
    Fbankmfo : Integer;
    Fbankaccount : WideString;
    Fpartnercode : WideString;
    Fcontract : WideString;
    FuseDefault : Integer;
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
    FbillTypeRefCode : Integer;
    FbillTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property bankname : WideString read Fbankname write Fbankname;
    property bankokpo : WideString read Fbankokpo write Fbankokpo;
    property  bankmfo : Integer read Fbankmfo write Fbankmfo;
    property bankaccount : WideString read Fbankaccount write Fbankaccount;
    property partnercode : WideString read Fpartnercode write Fpartnercode;
    property contract : WideString read Fcontract write Fcontract;
    property  useDefault : Integer read FuseDefault write FuseDefault;

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
    property billTypeRefCode : Integer read FbillTypeRefCode write FbillTypeRefCode;
    property billTypeRefName : WideString read FbillTypeRefName write FbillTypeRefName;
  end;

  ArrayOfENBankingDetailsShort = array of ENBankingDetailsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENBankingDetailsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENBankingDetailsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENBankingDetailsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENBankingDetailsController/message/
  // soapAction: http://ksoe.org/ENBankingDetailsController/action/ENBankingDetailsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENBankingDetailsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENBankingDetailsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENBankingDetailsControllerSoapPort = interface(IInvokable)
  ['{CBBDE000-A427-4AF7-808F-6F482CE6B19A}']
    function add(const aENBankingDetails: ENBankingDetails): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENBankingDetails: ENBankingDetails); stdcall;
    function getObject(const anObjectCode: Integer): ENBankingDetails; stdcall;
    function getList: ENBankingDetailsShortList; stdcall;
    function getFilteredList(const aENBankingDetailsFilter: ENBankingDetailsFilter): ENBankingDetailsShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENBankingDetailsShortList; stdcall;
    function getScrollableFilteredList(const aENBankingDetailsFilter: ENBankingDetailsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENBankingDetailsShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENBankingDetailsShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENBankingDetailsFilter: ENBankingDetailsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENBankingDetailsShort; stdcall;
  end;


implementation

  destructor ENBankingDetails.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FbillTypeRef) then
      billTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENBankingDetailsFilter.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FbillTypeRef) then
      billTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENBankingDetailsFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENBankingDetailsShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENBankingDetailsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENBankingDetails, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingDetails');
  RemClassRegistry.RegisterXSClass(ENBankingDetailsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingDetailsRef');
  RemClassRegistry.RegisterXSClass(ENBankingDetailsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingDetailsFilter');
  RemClassRegistry.RegisterXSClass(ENBankingDetailsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingDetailsShort');
  RemClassRegistry.RegisterXSClass(ENBankingDetailsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENBankingDetailsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENBankingDetailsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENBankingDetailsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENBankingDetailsControllerSoapPort), 'http://ksoe.org/ENBankingDetailsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENBankingDetailsControllerSoapPort), 'http://ksoe.org/ENBankingDetailsController/action/ENBankingDetailsController.%operationName%');


end.
