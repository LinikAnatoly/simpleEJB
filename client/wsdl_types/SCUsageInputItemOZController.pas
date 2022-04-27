unit SCUsageInputItemOZController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns
   ,SCUsageInputItemController
   ,ENDepartmentController, FKProvObjectController
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

  SCUsageInputItemOZ            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZ = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberInt : Integer;
    FcounterType : WideString;
    Faccount : WideString;
    Fcost : TXSDecimal;
    FcountGen : Integer;
    FscCode : Integer;
    Fmodify_time : Int64;
//???
    FusageInputItemRef : SCUsageInputItemRef;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  numberInt : Integer read FnumberInt write FnumberInt;
    property counterType : WideString read FcounterType write FcounterType;
    property account : WideString read Faccount write Faccount;
    property cost : TXSDecimal read Fcost write Fcost;
    property  countGen : Integer read FcountGen write FcountGen;
    property  scCode : Integer read FscCode write FscCode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property usageInputItemRef : SCUsageInputItemRef read FusageInputItemRef write FusageInputItemRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;

{
  SCUsageInputItemOZFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberDoc : WideString;
    FnumberInt : Integer;
    FcounterType : WideString;
    Faccount : WideString;
    Fcost : TXSDecimal;
    FcountGen : Integer;
    FscCode : Integer;
    Fmodify_time : Int64;
//???
    FusageInputItemRef : SCUsageInputItemRef;
//???
    FbudgetRef : ENDepartmentRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  numberInt : Integer read FnumberInt write FnumberInt;
    property counterType : WideString read FcounterType write FcounterType;
    property account : WideString read Faccount write Faccount;
    property cost : TXSDecimal read Fcost write Fcost;
    property  countGen : Integer read FcountGen write FcountGen;
    property  scCode : Integer read FscCode write FscCode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property usageInputItemRef : SCUsageInputItemRef read FusageInputItemRef write FusageInputItemRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
  end;
}

  SCUsageInputItemOZFilter = class(SCUsageInputItemOZ)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  SCUsageInputItemOZShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberDoc : WideString;
    FcounterType : WideString;
    Faccount : WideString;
    Fcost : TXSDecimal;
    FcountGen : Integer;
    FscCode : Integer;
    FusageInputItemRefCode : Integer;
    FusageInputItemRefNumberDoc : WideString;
    FusageInputItemRefCountGen : Integer;
    FusageInputItemRefScCode : Integer;
    FusageInputItemRefKindCode : Integer;
    FusageInputItemRefKindName : WideString;
    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property counterType : WideString read FcounterType write FcounterType;
    property account : WideString read Faccount write Faccount;
    property cost : TXSDecimal read Fcost write Fcost;
    property  countGen : Integer read FcountGen write FcountGen;
    property  scCode : Integer read FscCode write FscCode;

    property usageInputItemRefCode : Integer read FusageInputItemRefCode write FusageInputItemRefCode;
    property usageInputItemRefNumberDoc : WideString read FusageInputItemRefNumberDoc write FusageInputItemRefNumberDoc;
    property usageInputItemRefCountGen : Integer read FusageInputItemRefCountGen write FusageInputItemRefCountGen;
    property usageInputItemRefScCode : Integer read FusageInputItemRefScCode write FusageInputItemRefScCode;
    property usageInputItemRefKindCode : Integer read FusageInputItemRefKindCode write FusageInputItemRefKindCode;
    property usageInputItemRefKindName : WideString read FusageInputItemRefKindName write FusageInputItemRefKindName;    
	property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
  end;

  ArrayOfSCUsageInputItemOZShort = array of SCUsageInputItemOZShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemOZShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemOZShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemOZShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemOZController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemOZController/action/SCUsageInputItemOZController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemOZControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemOZController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemOZControllerSoapPort = interface(IInvokable)
  ['{3D8136CB-2CDC-42B4-B0A2-4161D80AD034}']
    function add(const aSCUsageInputItemOZ: SCUsageInputItemOZ): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItemOZ: SCUsageInputItemOZ); stdcall;
    function getObject(const anObjectCode: Integer): SCUsageInputItemOZ; stdcall;
    function getList: SCUsageInputItemOZShortList; stdcall;
    function getFilteredList(const aSCUsageInputItemOZFilter: SCUsageInputItemOZFilter): SCUsageInputItemOZShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZShortList; stdcall;
    function getScrollableFilteredList(const aSCUsageInputItemOZFilter: SCUsageInputItemOZFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZShortList; stdcall;
    function getScrollableFilteredCodeArray(const aSCUsageInputItemOZFilter: SCUsageInputItemOZFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): SCUsageInputItemOZShort; stdcall;

    // список проводок по коду OZ
    function getPostingsList(servicesObjectCode: Integer): FKProvObjectShortList; stdcall;
  end;



implementation

  destructor SCUsageInputItemOZ.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FusageInputItemRef) then
      usageInputItemRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;

{
  destructor SCUsageInputItemOZFilter.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    if Assigned(FusageInputItemRef) then
      usageInputItemRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    inherited Destroy;
  end;
}

  destructor SCUsageInputItemOZFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor SCUsageInputItemOZShort.Destroy;
  begin
    if Assigned(Fcost) then
      cost.Free;
    inherited Destroy;
  end;

  destructor SCUsageInputItemOZShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemOZShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemOZShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemOZControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemOZControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZController/action/SCUsageInputItemOZController.%operationName%');


end.
