unit SCUsageInputItemOZInfoController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCUsageInputItemOZController 
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

  SCUsageInputItemOZInfo            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZInfoRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZInfo = class(TRemotable)
  private
    Fcode : Integer; 
    FsourceCode : WideString;
    Faccount : WideString;
    FexpensesCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FusageInputItemOZRef : SCUsageInputItemOZRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property account : WideString read Faccount write Faccount;
    property expensesCode : WideString read FexpensesCode write FexpensesCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputItemOZRef : SCUsageInputItemOZRef read FusageInputItemOZRef write FusageInputItemOZRef; 
  end;
  
{
  SCUsageInputItemOZInfoFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FsourceCode : WideString;
    Faccount : WideString;
    FexpensesCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    Fmodify_time : Int64;
//???
    FusageInputItemOZRef : SCUsageInputItemOZRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property account : WideString read Faccount write Faccount;
    property expensesCode : WideString read FexpensesCode write FexpensesCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputItemOZRef : SCUsageInputItemOZRef read FusageInputItemOZRef write FusageInputItemOZRef; 
  end;
}

  SCUsageInputItemOZInfoFilter = class(SCUsageInputItemOZInfo)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputItemOZInfoShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsourceCode : WideString;
    Faccount : WideString;
    FexpensesCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FusageInputItemOZRefCode : Integer; 
    FusageInputItemOZRefNumberDoc : WideString;
    FusageInputItemOZRefCounterType : WideString;
    FusageInputItemOZRefAccount : WideString;
    FusageInputItemOZRefCost : TXSDecimal;
    FusageInputItemOZRefCountGen : Integer; 
    FusageInputItemOZRefScCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property account : WideString read Faccount write Faccount;
    property expensesCode : WideString read FexpensesCode write FexpensesCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 

    property usageInputItemOZRefCode : Integer read FusageInputItemOZRefCode write FusageInputItemOZRefCode; 
    property usageInputItemOZRefNumberDoc : WideString read FusageInputItemOZRefNumberDoc write FusageInputItemOZRefNumberDoc; 
    property usageInputItemOZRefCounterType : WideString read FusageInputItemOZRefCounterType write FusageInputItemOZRefCounterType; 
    property usageInputItemOZRefAccount : WideString read FusageInputItemOZRefAccount write FusageInputItemOZRefAccount; 
    property usageInputItemOZRefCost : TXSDecimal read FusageInputItemOZRefCost write FusageInputItemOZRefCost; 
    property usageInputItemOZRefCountGen : Integer read FusageInputItemOZRefCountGen write FusageInputItemOZRefCountGen; 
    property usageInputItemOZRefScCode : Integer read FusageInputItemOZRefScCode write FusageInputItemOZRefScCode; 
  end;

  ArrayOfSCUsageInputItemOZInfoShort = array of SCUsageInputItemOZInfoShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemOZInfoShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemOZInfoShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemOZInfoShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemOZInfoController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemOZInfoController/action/SCUsageInputItemOZInfoController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemOZInfoControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemOZInfoController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemOZInfoControllerSoapPort = interface(IInvokable)
  ['{66290AEA-8A68-4886-B8AD-984383AA348C}']
    function  add(const aSCUsageInputItemOZInfo: SCUsageInputItemOZInfo): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItemOZInfo: SCUsageInputItemOZInfo); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputItemOZInfo; stdcall;
    function  getList: SCUsageInputItemOZInfoShortList; stdcall;
    function  getFilteredList(const aSCUsageInputItemOZInfoFilter: SCUsageInputItemOZInfoFilter): SCUsageInputItemOZInfoShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZInfoShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputItemOZInfoFilter: SCUsageInputItemOZInfoFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZInfoShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZInfoShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputItemOZInfoFilter: SCUsageInputItemOZInfoFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCUsageInputItemOZInfo.Destroy;
  begin
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FusageInputItemOZRef) then
      usageInputItemOZRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCUsageInputItemOZInfoFilter.Destroy;
  begin
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FusageInputItemOZRef) then
      usageInputItemOZRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCUsageInputItemOZInfoFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCUsageInputItemOZInfoShort.Destroy;
  begin
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FusageInputItemOZRefCost) then
      usageInputItemOZRefCost.Free;
    inherited Destroy;
  end; 
  
  destructor SCUsageInputItemOZInfoShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZInfo, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZInfo');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZInfoRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZInfoRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZInfoFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZInfoFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZInfoShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZInfoShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZInfoShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZInfoShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemOZInfoShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemOZInfoShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemOZInfoControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZInfoController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemOZInfoControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZInfoController/action/SCUsageInputItemOZInfoController.%operationName%');


end.
