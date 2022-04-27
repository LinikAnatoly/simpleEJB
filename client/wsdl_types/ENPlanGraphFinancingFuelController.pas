unit ENPlanGraphFinancingFuelController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKFuelTypeController
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

  ENPlanGraphFinancingFuel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanGraphFinancingFuelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPlanGraphFinancingFuel = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    FkoefDekada1 : TXSDecimal;
    FkoefDekada2 : TXSDecimal;
    FkoefDekada3 : TXSDecimal;
    FcountFuelSpent : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property koefDekada1 : TXSDecimal read FkoefDekada1 write FkoefDekada1;
    property koefDekada2 : TXSDecimal read FkoefDekada2 write FkoefDekada2;
    property koefDekada3 : TXSDecimal read FkoefDekada3 write FkoefDekada3;
    property countFuelSpent : TXSDecimal read FcountFuelSpent write FcountFuelSpent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;

{
  ENPlanGraphFinancingFuelFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    FkoefDekada1 : TXSDecimal;
    FkoefDekada2 : TXSDecimal;
    FkoefDekada3 : TXSDecimal;
    FcountFuelSpent : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FfuelTypeRef : TKFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property koefDekada1 : TXSDecimal read FkoefDekada1 write FkoefDekada1;
    property koefDekada2 : TXSDecimal read FkoefDekada2 write FkoefDekada2;
    property koefDekada3 : TXSDecimal read FkoefDekada3 write FkoefDekada3;
    property countFuelSpent : TXSDecimal read FcountFuelSpent write FcountFuelSpent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
  end;
}

  ENPlanGraphFinancingFuelFilter = class(ENPlanGraphFinancingFuel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPlanGraphFinancingFuelShort = class(TRemotable)
  private
    Fcode : Integer;
    FmonthGen : Integer;
    FyearGen : Integer;
    FtotalSum : TXSDecimal;
    FkoefDekada1 : TXSDecimal;
    FkoefDekada2 : TXSDecimal;
    FkoefDekada3 : TXSDecimal;
    FcountFuelSpent : TXSDecimal;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  monthGen : Integer read FmonthGen write FmonthGen;
    property  yearGen : Integer read FyearGen write FyearGen;
    property totalSum : TXSDecimal read FtotalSum write FtotalSum;
    property koefDekada1 : TXSDecimal read FkoefDekada1 write FkoefDekada1;
    property koefDekada2 : TXSDecimal read FkoefDekada2 write FkoefDekada2;
    property koefDekada3 : TXSDecimal read FkoefDekada3 write FkoefDekada3;
    property countFuelSpent : TXSDecimal read FcountFuelSpent write FcountFuelSpent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
  end;

  ArrayOfENPlanGraphFinancingFuelShort = array of ENPlanGraphFinancingFuelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPlanGraphFinancingFuelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPlanGraphFinancingFuelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPlanGraphFinancingFuelShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPlanGraphFinancingFuelController/message/
  // soapAction: http://ksoe.org/ENPlanGraphFinancingFuelController/action/ENPlanGraphFinancingFuelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPlanGraphFinancingFuelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPlanGraphFinancingFuelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPlanGraphFinancingFuelControllerSoapPort = interface(IInvokable)
  ['{15ee15ee-15ee-15ee-15ee-15ee15ee15ee}']
    function add(const aENPlanGraphFinancingFuel: ENPlanGraphFinancingFuel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPlanGraphFinancingFuel: ENPlanGraphFinancingFuel); stdcall;
    function getObject(const anObjectCode: Integer): ENPlanGraphFinancingFuel; stdcall;
    function getList: ENPlanGraphFinancingFuelShortList; stdcall;
    function getFilteredList(const aENPlanGraphFinancingFuelFilter: ENPlanGraphFinancingFuelFilter): ENPlanGraphFinancingFuelShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPlanGraphFinancingFuelShortList; stdcall;
    function getScrollableFilteredList(const aENPlanGraphFinancingFuelFilter: ENPlanGraphFinancingFuelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPlanGraphFinancingFuelShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPlanGraphFinancingFuelShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPlanGraphFinancingFuelFilter: ENPlanGraphFinancingFuelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPlanGraphFinancingFuelShort; stdcall;
  end;


implementation

  destructor ENPlanGraphFinancingFuel.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(FkoefDekada1) then
      koefDekada1.Free;
    if Assigned(FkoefDekada2) then
      koefDekada2.Free;
    if Assigned(FkoefDekada3) then
      koefDekada3.Free;
    if Assigned(FcountFuelSpent) then
      countFuelSpent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPlanGraphFinancingFuelFilter.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(FkoefDekada1) then
      koefDekada1.Free;
    if Assigned(FkoefDekada2) then
      koefDekada2.Free;
    if Assigned(FkoefDekada3) then
      koefDekada3.Free;
    if Assigned(FcountFuelSpent) then
      countFuelSpent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPlanGraphFinancingFuelFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPlanGraphFinancingFuelShort.Destroy;
  begin
    if Assigned(FtotalSum) then
      totalSum.Free;
    if Assigned(FkoefDekada1) then
      koefDekada1.Free;
    if Assigned(FkoefDekada2) then
      koefDekada2.Free;
    if Assigned(FkoefDekada3) then
      koefDekada3.Free;
    if Assigned(FcountFuelSpent) then
      countFuelSpent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENPlanGraphFinancingFuelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPlanGraphFinancingFuel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanGraphFinancingFuel');
  RemClassRegistry.RegisterXSClass(ENPlanGraphFinancingFuelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanGraphFinancingFuelRef');
  RemClassRegistry.RegisterXSClass(ENPlanGraphFinancingFuelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanGraphFinancingFuelFilter');
  RemClassRegistry.RegisterXSClass(ENPlanGraphFinancingFuelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanGraphFinancingFuelShort');
  RemClassRegistry.RegisterXSClass(ENPlanGraphFinancingFuelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPlanGraphFinancingFuelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPlanGraphFinancingFuelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPlanGraphFinancingFuelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPlanGraphFinancingFuelControllerSoapPort), 'http://ksoe.org/ENPlanGraphFinancingFuelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPlanGraphFinancingFuelControllerSoapPort), 'http://ksoe.org/ENPlanGraphFinancingFuelController/action/ENPlanGraphFinancingFuelController.%operationName%');


end.
