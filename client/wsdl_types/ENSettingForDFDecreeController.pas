unit ENSettingForDFDecreeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENDepartmentController
   ,ENWarrantController
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

  ENSettingForDFDecree            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettingForDFDecreeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettingForDFDecree = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocTypeName : WideString;
    FcatalogCode : Integer;
    FcatalogName : WideString;
    FdfDocPrefixCode : Integer;
    FdfDocPrefixName : WideString;
    FprefixSignerTabN : WideString;
    FprefixSignerFio : WideString;
    FprefixSignerPostInfo : WideString;
    FinitiatorTabn : WideString;
    FinitiatorFio : WideString;
    FinitiatorPodrName : WideString;
    FinitiatorPodrCode : Integer;
    FdesignatedTabn : WideString;
    FdesignatedFio : WideString;
    FdesignatedpostInfo : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FresponsRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocTypeName : WideString read FdfDocTypeName write FdfDocTypeName;
    property catalogCode : Integer read FcatalogCode write FcatalogCode;
    property catalogName : WideString read FcatalogName write FcatalogName;
    property dfDocPrefixCode : Integer read FdfDocPrefixCode write FdfDocPrefixCode;
    property dfDocPrefixName : WideString read FdfDocPrefixName write FdfDocPrefixName;
    property prefixSignerTabN : WideString read FprefixSignerTabN write FprefixSignerTabN;
    property prefixSignerFio : WideString read FprefixSignerFio write FprefixSignerFio;
    property prefixSignerPostInfo : WideString read FprefixSignerPostInfo write FprefixSignerPostInfo;
    property initiatorTabn : WideString read FinitiatorTabn write FinitiatorTabn;
    property initiatorFio : WideString read FinitiatorFio write FinitiatorFio;
    property initiatorPodrName : WideString read FinitiatorPodrName write FinitiatorPodrName;
    property initiatorPodrCode : Integer read FinitiatorPodrCode write FinitiatorPodrCode;
    property designatedTabn : WideString read FdesignatedTabn write FdesignatedTabn;
    property designatedFio : WideString read FdesignatedFio write FdesignatedFio;
    property designatedpostInfo : WideString read FdesignatedpostInfo write FdesignatedpostInfo;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property responsRef : ENWarrantRef read FresponsRef write FresponsRef;
  end;


  ENSettingForDFDecreeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocTypeName : WideString;
    FcatalogCode : Integer;
    FcatalogName : WideString;
    FdfDocPrefixCode : Integer;
    FdfDocPrefixName : WideString;
    FprefixSignerTabN : WideString;
    FprefixSignerFio : WideString;
    FprefixSignerPostInfo : WideString;
    FinitiatorTabn : WideString;
    FinitiatorFio : WideString;
    FinitiatorPodrName : WideString;
    FinitiatorPodrCode : Integer;
    FdesignatedTabn : WideString;
    FdesignatedFio : WideString;
    FdesignatedpostInfo : WideString;
//???
    FdepartmentRef : ENDepartmentRef;
//???
    FresponsRef : ENWarrantRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocTypeName : WideString read FdfDocTypeName write FdfDocTypeName;
    property catalogCode : Integer read FcatalogCode write FcatalogCode;
    property catalogName : WideString read FcatalogName write FcatalogName;
    property dfDocPrefixCode : Integer read FdfDocPrefixCode write FdfDocPrefixCode;
    property dfDocPrefixName : WideString read FdfDocPrefixName write FdfDocPrefixName;
    property prefixSignerTabN : WideString read FprefixSignerTabN write FprefixSignerTabN;
    property prefixSignerFio : WideString read FprefixSignerFio write FprefixSignerFio;
    property prefixSignerPostInfo : WideString read FprefixSignerPostInfo write FprefixSignerPostInfo;
    property initiatorTabn : WideString read FinitiatorTabn write FinitiatorTabn;
    property initiatorFio : WideString read FinitiatorFio write FinitiatorFio;
    property initiatorPodrName : WideString read FinitiatorPodrName write FinitiatorPodrName;
    property initiatorPodrCode : Integer read FinitiatorPodrCode write FinitiatorPodrCode;
    property designatedTabn : WideString read FdesignatedTabn write FdesignatedTabn;
    property designatedFio : WideString read FdesignatedFio write FdesignatedFio;
    property designatedpostInfo : WideString read FdesignatedpostInfo write FdesignatedpostInfo;
    property departmentRef : ENDepartmentRef read FdepartmentRef write FdepartmentRef;
    property responsRef : ENWarrantRef read FresponsRef write FresponsRef;
  end;


{  ENSettingForDFDecreeFilter = class(ENSettingForDFDecree)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;}

  ENSettingForDFDecreeShort = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocTypeName : WideString;
    FcatalogCode : Integer;
    FcatalogName : WideString;
    FdfDocPrefixCode : Integer;
    FdfDocPrefixName : WideString;
    FprefixSignerTabN : WideString;
    FprefixSignerFio : WideString;
    FprefixSignerPostInfo : WideString;
    FinitiatorTabn : WideString;
    FinitiatorFio : WideString;
    FinitiatorPodrName : WideString;
    FinitiatorPodrCode : Integer;
    FdesignatedTabn : WideString;
    FdesignatedFio : WideString;
    FdesignatedpostInfo : WideString;
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
    FresponsRefCode : Integer;
    FresponsRefNumbergen : WideString;
    FresponsRefName : WideString;
    FresponsRefWarrantFIO : WideString;
    FresponsRefWarrantShortFIO : WideString;
    FresponsRefWarrantPosition : WideString;
    FresponsRefGenitiveFIO : WideString;
    FresponsRefGenitivePosition : WideString;
    FresponsRefPassport : WideString;
    FresponsRefAddress : WideString;
    FresponsRefPower : Integer;
    FresponsRefMaxSum : TXSDecimal;
    FresponsRefDepartmentName : WideString;
    FresponsRefDepartmentNameGenitive : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocTypeName : WideString read FdfDocTypeName write FdfDocTypeName;
    property  catalogCode : Integer read FcatalogCode write FcatalogCode;
    property catalogName : WideString read FcatalogName write FcatalogName;
    property  dfDocPrefixCode : Integer read FdfDocPrefixCode write FdfDocPrefixCode;
    property dfDocPrefixName : WideString read FdfDocPrefixName write FdfDocPrefixName;
    property prefixSignerTabN : WideString read FprefixSignerTabN write FprefixSignerTabN;
    property prefixSignerFio : WideString read FprefixSignerFio write FprefixSignerFio;
    property prefixSignerPostInfo : WideString read FprefixSignerPostInfo write FprefixSignerPostInfo;
    property initiatorTabn : WideString read FinitiatorTabn write FinitiatorTabn;
    property initiatorFio : WideString read FinitiatorFio write FinitiatorFio;
    property initiatorPodrName : WideString read FinitiatorPodrName write FinitiatorPodrName;
    property  initiatorPodrCode : Integer read FinitiatorPodrCode write FinitiatorPodrCode;
    property designatedTabn : WideString read FdesignatedTabn write FdesignatedTabn;
    property designatedFio : WideString read FdesignatedFio write FdesignatedFio;
    property designatedpostInfo : WideString read FdesignatedpostInfo write FdesignatedpostInfo;

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
    property responsRefCode : Integer read FresponsRefCode write FresponsRefCode;
    property responsRefNumbergen : WideString read FresponsRefNumbergen write FresponsRefNumbergen;
    property responsRefName : WideString read FresponsRefName write FresponsRefName;
    property responsRefWarrantFIO : WideString read FresponsRefWarrantFIO write FresponsRefWarrantFIO;
    property responsRefWarrantShortFIO : WideString read FresponsRefWarrantShortFIO write FresponsRefWarrantShortFIO;
    property responsRefWarrantPosition : WideString read FresponsRefWarrantPosition write FresponsRefWarrantPosition;
    property responsRefGenitiveFIO : WideString read FresponsRefGenitiveFIO write FresponsRefGenitiveFIO;
    property responsRefGenitivePosition : WideString read FresponsRefGenitivePosition write FresponsRefGenitivePosition;
    property responsRefPassport : WideString read FresponsRefPassport write FresponsRefPassport;
    property responsRefAddress : WideString read FresponsRefAddress write FresponsRefAddress;
    property responsRefPower : Integer read FresponsRefPower write FresponsRefPower;
    property responsRefMaxSum : TXSDecimal read FresponsRefMaxSum write FresponsRefMaxSum;
    property responsRefDepartmentName : WideString read FresponsRefDepartmentName write FresponsRefDepartmentName;
    property responsRefDepartmentNameGenitive : WideString read FresponsRefDepartmentNameGenitive write FresponsRefDepartmentNameGenitive;
  end;

  ArrayOfENSettingForDFDecreeShort = array of ENSettingForDFDecreeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSettingForDFDecreeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSettingForDFDecreeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSettingForDFDecreeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSettingForDFDecreeController/message/
  // soapAction: http://ksoe.org/ENSettingForDFDecreeController/action/ENSettingForDFDecreeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSettingForDFDecreeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSettingForDFDecreeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSettingForDFDecreeControllerSoapPort = interface(IInvokable)
  ['{8C845E0F-3791-41FA-AFB2-80E7825242B4}']
    function add(const aENSettingForDFDecree: ENSettingForDFDecree): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSettingForDFDecree: ENSettingForDFDecree); stdcall;
    function getObject(const anObjectCode: Integer): ENSettingForDFDecree; stdcall;
    function getList: ENSettingForDFDecreeShortList; stdcall;
    function getFilteredList(const aENSettingForDFDecreeFilter: ENSettingForDFDecreeFilter): ENSettingForDFDecreeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSettingForDFDecreeShortList; stdcall;
    function getScrollableFilteredList(const aENSettingForDFDecreeFilter: ENSettingForDFDecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSettingForDFDecreeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSettingForDFDecreeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSettingForDFDecreeFilter: ENSettingForDFDecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSettingForDFDecreeShort; stdcall;
  end;


implementation

  destructor ENSettingForDFDecree.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FresponsRef) then
      responsRef.Free;
    inherited Destroy;
  end;


  destructor ENSettingForDFDecreeFilter.Destroy;
  begin
    if Assigned(FdepartmentRef) then
      departmentRef.Free;
    if Assigned(FresponsRef) then
      responsRef.Free;
    inherited Destroy;
  end;


{  destructor ENSettingForDFDecreeFilter.Destroy;
  begin
    inherited Destroy;
  end;}

  destructor ENSettingForDFDecreeShort.Destroy;
  begin
    if Assigned(FdepartmentRefDateStart) then
      departmentRefDateStart.Free;
    if Assigned(FdepartmentRefDateFinal) then
      departmentRefDateFinal.Free;
    if Assigned(FresponsRefMaxSum) then
      responsRefMaxSum.Free;
    inherited Destroy;
  end;

  destructor ENSettingForDFDecreeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSettingForDFDecree, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingForDFDecree');
  RemClassRegistry.RegisterXSClass(ENSettingForDFDecreeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingForDFDecreeRef');
  RemClassRegistry.RegisterXSClass(ENSettingForDFDecreeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingForDFDecreeFilter');
  RemClassRegistry.RegisterXSClass(ENSettingForDFDecreeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingForDFDecreeShort');
  RemClassRegistry.RegisterXSClass(ENSettingForDFDecreeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingForDFDecreeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSettingForDFDecreeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSettingForDFDecreeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSettingForDFDecreeControllerSoapPort), 'http://ksoe.org/ENSettingForDFDecreeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSettingForDFDecreeControllerSoapPort), 'http://ksoe.org/ENSettingForDFDecreeController/action/ENSettingForDFDecreeController.%operationName%');


end.
