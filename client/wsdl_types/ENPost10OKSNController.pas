unit ENPost10OKSNController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPostTypeController
   ,ENLine10Controller
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

  ENPost10OKSN            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPost10OKSNRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPost10OKSN = class(TRemotable)
  private
    Fcode : Integer;
    FpostNumber : WideString;
    FnumberOfCables : Integer;
    FbranchLineName : WideString;
    Fmodify_time : Int64;
//???
    FpostTtype : ENPostType;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property postNumber : WideString read FpostNumber write FpostNumber;
    property  numberOfCables : Integer read FnumberOfCables write FnumberOfCables;
    property branchLineName : WideString read FbranchLineName write FbranchLineName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property postTtype : ENPostType read FpostTtype write FpostTtype;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref;
  end;

{
  ENPost10OKSNFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FpostNumber : WideString;
    FnumberOfCables : Integer;
    FbranchLineName : WideString;
    Fmodify_time : Int64;
//???
    FpostTtype : ENPostType;
//???
    Fline10Ref : ENLine10Ref;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property postNumber : WideString read FpostNumber write FpostNumber;
    property  numberOfCables : Integer read FnumberOfCables write FnumberOfCables;
    property branchLineName : WideString read FbranchLineName write FbranchLineName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property postTtype : ENPostType read FpostTtype write FpostTtype;
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref;
  end;
}

  ENPost10OKSNFilter = class(ENPost10OKSN)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPost10OKSNShort = class(TRemotable)
  private
    Fcode : Integer;
    FpostNumber : WideString;
    FnumberOfCables : Integer;
    FbranchLineName : WideString;
    FpostTtypeCode : Integer;
    FpostTtypeName : WideString;
    Fline10RefCode : Integer;
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer;
    Fline10RefYearWorkingStart : Integer;
    Fline10RefLastRepairDate : TXSDate;
    Fline10RefExtentForest : TXSDecimal;
    Fline10RefConventUnit : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property postNumber : WideString read FpostNumber write FpostNumber;
    property  numberOfCables : Integer read FnumberOfCables write FnumberOfCables;
    property branchLineName : WideString read FbranchLineName write FbranchLineName;

    property postTtypeCode : Integer read FpostTtypeCode write FpostTtypeCode;
    property postTtypeName : WideString read FpostTtypeName write FpostTtypeName;
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode;
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber;
    property line10RefName : WideString read Fline10RefName write Fline10RefName;
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName;
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength;
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild;
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart;
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate;
    property line10RefExtentForest : TXSDecimal read Fline10RefExtentForest write Fline10RefExtentForest;
    property line10RefConventUnit : TXSDecimal read Fline10RefConventUnit write Fline10RefConventUnit;
  end;

  ArrayOfENPost10OKSNShort = array of ENPost10OKSNShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPost10OKSNShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPost10OKSNShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPost10OKSNShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPost10OKSNController/message/
  // soapAction: http://ksoe.org/ENPost10OKSNController/action/ENPost10OKSNController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPost10OKSNControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPost10OKSNController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPost10OKSNControllerSoapPort = interface(IInvokable)
  ['{2A30A7CC-3B69-4770-9079-51258A96B8E5}']
    function add(const aENPost10OKSN: ENPost10OKSN): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPost10OKSN: ENPost10OKSN); stdcall;
    function getObject(const anObjectCode: Integer): ENPost10OKSN; stdcall;
    function getList: ENPost10OKSNShortList; stdcall;
    function getFilteredList(const aENPost10OKSNFilter: ENPost10OKSNFilter): ENPost10OKSNShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPost10OKSNShortList; stdcall;
    function getScrollableFilteredList(const aENPost10OKSNFilter: ENPost10OKSNFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPost10OKSNShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPost10OKSNShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPost10OKSNFilter: ENPost10OKSNFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPost10OKSNShort; stdcall;
  end;


implementation

  destructor ENPost10OKSN.Destroy;
  begin
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end;

{
  destructor ENPost10OKSNFilter.Destroy;
  begin
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    inherited Destroy;
  end;
}

  destructor ENPost10OKSNFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPost10OKSNShort.Destroy;
  begin
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fline10RefExtentForest) then
      line10RefExtentForest.Free;
    if Assigned(Fline10RefConventUnit) then
      line10RefConventUnit.Free;
    inherited Destroy;
  end;

  destructor ENPost10OKSNShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPost10OKSN, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost10OKSN');
  RemClassRegistry.RegisterXSClass(ENPost10OKSNRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost10OKSNRef');
  RemClassRegistry.RegisterXSClass(ENPost10OKSNFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost10OKSNFilter');
  RemClassRegistry.RegisterXSClass(ENPost10OKSNShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost10OKSNShort');
  RemClassRegistry.RegisterXSClass(ENPost10OKSNShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost10OKSNShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPost10OKSNShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPost10OKSNShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPost10OKSNControllerSoapPort), 'http://ksoe.org/ENPost10OKSNController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPost10OKSNControllerSoapPort), 'http://ksoe.org/ENPost10OKSNController/action/ENPost10OKSNController.%operationName%');


end.
