unit SCUsageInputItemOZ2SCCounterController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCUsageInputItemOZController 
   ,SCCounterController 
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

  SCUsageInputItemOZ2SCCounter            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZ2SCCounterRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemOZ2SCCounter = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FozRef : SCUsageInputItemOZRef;
//???
    FscCounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property ozRef : SCUsageInputItemOZRef read FozRef write FozRef; 
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef; 
  end;
  
{
  SCUsageInputItemOZ2SCCounterFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FozRef : SCUsageInputItemOZRef;
//???
    FscCounterRef : SCCounterRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property ozRef : SCUsageInputItemOZRef read FozRef write FozRef; 
    property scCounterRef : SCCounterRef read FscCounterRef write FscCounterRef; 
  end;
}

  SCUsageInputItemOZ2SCCounterFilter = class(SCUsageInputItemOZ2SCCounter)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputItemOZ2SCCounterShort = class(TRemotable)
  private
    Fcode : Integer; 
    FozRefCode : Integer; 
    FozRefNumberDoc : WideString;
    FozRefCounterType : WideString;
    FozRefAccount : WideString;
    FozRefCost : TXSDecimal;
    FozRefCountGen : Integer; 
    FozRefScCode : Integer; 
    FscCounterRefCode : Integer; 
    FscCounterRefInvNumber : WideString;
    FscCounterRefName : WideString;
    FscCounterRefBuildNumber : WideString;
    FscCounterRefAccount : WideString;
    FscCounterRefDepartmetFKCode : WideString;
    FscCounterRefMolCode : WideString;
    FscCounterRefDateIn : TXSDate;
    FscCounterRefDateBuild : TXSDate;
    FscCounterRefDateCheck : TXSDate;
    FscCounterRefCost : TXSDecimal;
    FscCounterRefScCode : Integer; 
    FscCounterRefCounterType : WideString;
    FscCounterRefInstallOrderNumber : WideString;
    FscCounterRefReading : WideString;
    FscCounterRefDateEdit : TXSDateTime;	
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property ozRefCode : Integer read FozRefCode write FozRefCode; 
    property ozRefNumberDoc : WideString read FozRefNumberDoc write FozRefNumberDoc; 
    property ozRefCounterType : WideString read FozRefCounterType write FozRefCounterType; 
    property ozRefAccount : WideString read FozRefAccount write FozRefAccount; 
    property ozRefCost : TXSDecimal read FozRefCost write FozRefCost; 
    property ozRefCountGen : Integer read FozRefCountGen write FozRefCountGen; 
    property ozRefScCode : Integer read FozRefScCode write FozRefScCode; 
    property scCounterRefCode : Integer read FscCounterRefCode write FscCounterRefCode; 
    property scCounterRefInvNumber : WideString read FscCounterRefInvNumber write FscCounterRefInvNumber; 
    property scCounterRefName : WideString read FscCounterRefName write FscCounterRefName; 
    property scCounterRefBuildNumber : WideString read FscCounterRefBuildNumber write FscCounterRefBuildNumber; 
    property scCounterRefAccount : WideString read FscCounterRefAccount write FscCounterRefAccount; 
    property scCounterRefDepartmetFKCode : WideString read FscCounterRefDepartmetFKCode write FscCounterRefDepartmetFKCode; 
    property scCounterRefMolCode : WideString read FscCounterRefMolCode write FscCounterRefMolCode; 
    property scCounterRefDateIn : TXSDate read FscCounterRefDateIn write FscCounterRefDateIn; 
    property scCounterRefDateBuild : TXSDate read FscCounterRefDateBuild write FscCounterRefDateBuild; 
    property scCounterRefDateCheck : TXSDate read FscCounterRefDateCheck write FscCounterRefDateCheck; 
    property scCounterRefCost : TXSDecimal read FscCounterRefCost write FscCounterRefCost; 
    property scCounterRefScCode : Integer read FscCounterRefScCode write FscCounterRefScCode; 
    property scCounterRefCounterType : WideString read FscCounterRefCounterType write FscCounterRefCounterType; 
    property scCounterRefInstallOrderNumber : WideString read FscCounterRefInstallOrderNumber write FscCounterRefInstallOrderNumber; 
    property scCounterRefReading : WideString read FscCounterRefReading write FscCounterRefReading; 
    property scCounterRefDateEdit : TXSDateTime read FscCounterRefDateEdit write FscCounterRefDateEdit; 
  end;

  ArrayOfSCUsageInputItemOZ2SCCounterShort = array of SCUsageInputItemOZ2SCCounterShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemOZ2SCCounterShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemOZ2SCCounterShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemOZ2SCCounterShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemOZ2SCCounterController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemOZ2SCCounterController/action/SCUsageInputItemOZ2SCCounterController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemOZ2SCCounterControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemOZ2SCCounterController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemOZ2SCCounterControllerSoapPort = interface(IInvokable)
  ['{7ffd7ffd-7ffd-7ffd-7ffd-7ffd7ffd7ffd}']
    function  add(const aSCUsageInputItemOZ2SCCounter: SCUsageInputItemOZ2SCCounter): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItemOZ2SCCounter: SCUsageInputItemOZ2SCCounter); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputItemOZ2SCCounter; stdcall;
    function  getList: SCUsageInputItemOZ2SCCounterShortList; stdcall;
    function  getFilteredList(const aSCUsageInputItemOZ2SCCounterFilter: SCUsageInputItemOZ2SCCounterFilter): SCUsageInputItemOZ2SCCounterShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2SCCounterShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputItemOZ2SCCounterFilter: SCUsageInputItemOZ2SCCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2SCCounterShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemOZ2SCCounterShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputItemOZ2SCCounterFilter: SCUsageInputItemOZ2SCCounterFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCUsageInputItemOZ2SCCounter.Destroy;
  begin
    if Assigned(FozRef) then
      ozRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCUsageInputItemOZ2SCCounterFilter.Destroy;
  begin
    if Assigned(FozRef) then
      ozRef.Free;
    if Assigned(FscCounterRef) then
      scCounterRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCUsageInputItemOZ2SCCounterFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCUsageInputItemOZ2SCCounterShort.Destroy;
  begin
    if Assigned(FozRefCost) then
      ozRefCost.Free;
    if Assigned(FscCounterRefDateIn) then
      scCounterRefDateIn.Free;
    if Assigned(FscCounterRefDateBuild) then
      scCounterRefDateBuild.Free;
    if Assigned(FscCounterRefDateCheck) then
      scCounterRefDateCheck.Free;
    if Assigned(FscCounterRefCost) then
      scCounterRefCost.Free;
    if Assigned(FscCounterRefDateEdit) then
      scCounterRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor SCUsageInputItemOZ2SCCounterShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2SCCounter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2SCCounter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2SCCounterRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2SCCounterRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2SCCounterFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2SCCounterFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2SCCounterShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2SCCounterShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemOZ2SCCounterShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemOZ2SCCounterShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemOZ2SCCounterShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemOZ2SCCounterShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemOZ2SCCounterControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZ2SCCounterController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemOZ2SCCounterControllerSoapPort), 'http://ksoe.org/SCUsageInputItemOZ2SCCounterController/action/SCUsageInputItemOZ2SCCounterController.%operationName%');


end.
