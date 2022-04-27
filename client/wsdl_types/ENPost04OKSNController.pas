unit ENPost04OKSNController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENPostTypeController
   ,ENLine04Controller
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

  ENPost04OKSN            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPost04OKSNRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPost04OKSN = class(TRemotable)
  private
    Fcode : Integer;
    FpostNumber : WideString;
    FnumberOfCables : Integer;
    FbranchLineName : WideString;
    Fmodify_time : Int64;
//???
    FpostTtype : ENPostType;
//???
    Fline04Ref : ENLine04Ref;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property postNumber : WideString read FpostNumber write FpostNumber;
    property  numberOfCables : Integer read FnumberOfCables write FnumberOfCables;
    property branchLineName : WideString read FbranchLineName write FbranchLineName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property postTtype : ENPostType read FpostTtype write FpostTtype;
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref;
  end;

{
  ENPost04OKSNFilter = class(TRemotable)
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
    Fline04Ref : ENLine04Ref;
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
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref;
  end;
}

  ENPost04OKSNFilter = class(ENPost04OKSN)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPost04OKSNShort = class(TRemotable)
  private
    Fcode : Integer;
    FpostNumber : WideString;
    FnumberOfCables : Integer;
    FbranchLineName : WideString;
    FpostTtypeCode : Integer;
    FpostTtypeName : WideString;
    Fline04RefCode : Integer;
    Fline04RefInvNumber : WideString;
    Fline04RefName : WideString;
    Fline04RefBuhName : WideString;
    Fline04RefLineLength : TXSDecimal;
    Fline04RefYearBuild : Integer;
    Fline04RefYearWorkingStart : Integer;
    Fline04RefLastRepairDate : TXSDate;
    Fline04RefExtentForest : TXSDecimal;
    Fline04RefConventUnit : TXSDecimal;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property postNumber : WideString read FpostNumber write FpostNumber;
    property  numberOfCables : Integer read FnumberOfCables write FnumberOfCables;
    property branchLineName : WideString read FbranchLineName write FbranchLineName;

    property postTtypeCode : Integer read FpostTtypeCode write FpostTtypeCode;
    property postTtypeName : WideString read FpostTtypeName write FpostTtypeName;
    property line04RefCode : Integer read Fline04RefCode write Fline04RefCode;
    property line04RefInvNumber : WideString read Fline04RefInvNumber write Fline04RefInvNumber;
    property line04RefName : WideString read Fline04RefName write Fline04RefName;
    property line04RefBuhName : WideString read Fline04RefBuhName write Fline04RefBuhName;
    property line04RefLineLength : TXSDecimal read Fline04RefLineLength write Fline04RefLineLength;
    property line04RefYearBuild : Integer read Fline04RefYearBuild write Fline04RefYearBuild;
    property line04RefYearWorkingStart : Integer read Fline04RefYearWorkingStart write Fline04RefYearWorkingStart;
    property line04RefLastRepairDate : TXSDate read Fline04RefLastRepairDate write Fline04RefLastRepairDate;
    property line04RefExtentForest : TXSDecimal read Fline04RefExtentForest write Fline04RefExtentForest;
    property line04RefConventUnit : TXSDecimal read Fline04RefConventUnit write Fline04RefConventUnit;
  end;

  ArrayOfENPost04OKSNShort = array of ENPost04OKSNShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPost04OKSNShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPost04OKSNShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPost04OKSNShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPost04OKSNController/message/
  // soapAction: http://ksoe.org/ENPost04OKSNController/action/ENPost04OKSNController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPost04OKSNControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPost04OKSNController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPost04OKSNControllerSoapPort = interface(IInvokable)
  ['{FD100ABA-51A5-4BAE-8D29-9D95615147CE}']
    function add(const aENPost04OKSN: ENPost04OKSN): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPost04OKSN: ENPost04OKSN); stdcall;
    function getObject(const anObjectCode: Integer): ENPost04OKSN; stdcall;
    function getList: ENPost04OKSNShortList; stdcall;
    function getFilteredList(const aENPost04OKSNFilter: ENPost04OKSNFilter): ENPost04OKSNShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPost04OKSNShortList; stdcall;
    function getScrollableFilteredList(const aENPost04OKSNFilter: ENPost04OKSNFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPost04OKSNShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPost04OKSNShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPost04OKSNFilter: ENPost04OKSNFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPost04OKSNShort; stdcall;
  end;


implementation

  destructor ENPost04OKSN.Destroy;
  begin
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    inherited Destroy;
  end;

{
  destructor ENPost04OKSNFilter.Destroy;
  begin
    if Assigned(FpostTtype) then
      postTtype.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    inherited Destroy;
  end;
}

  destructor ENPost04OKSNFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPost04OKSNShort.Destroy;
  begin
    if Assigned(Fline04RefLineLength) then
      line04RefLineLength.Free;
    if Assigned(Fline04RefLastRepairDate) then
      line04RefLastRepairDate.Free;
    if Assigned(Fline04RefExtentForest) then
      line04RefExtentForest.Free;
    if Assigned(Fline04RefConventUnit) then
      line04RefConventUnit.Free;
    inherited Destroy;
  end;

  destructor ENPost04OKSNShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPost04OKSN, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost04OKSN');
  RemClassRegistry.RegisterXSClass(ENPost04OKSNRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost04OKSNRef');
  RemClassRegistry.RegisterXSClass(ENPost04OKSNFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost04OKSNFilter');
  RemClassRegistry.RegisterXSClass(ENPost04OKSNShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost04OKSNShort');
  RemClassRegistry.RegisterXSClass(ENPost04OKSNShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPost04OKSNShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPost04OKSNShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPost04OKSNShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPost04OKSNControllerSoapPort), 'http://ksoe.org/ENPost04OKSNController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPost04OKSNControllerSoapPort), 'http://ksoe.org/ENPost04OKSNController/action/ENPost04OKSNController.%operationName%');


end.
