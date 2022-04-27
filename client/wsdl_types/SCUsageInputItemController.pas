unit SCUsageInputItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,SCUsageInputController 
   ,SCUsageInputItemKindController 
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

  SCUsageInputItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCUsageInputItem = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberInt : Integer; 
    FcountGen : Integer; 
    FscCode : Integer; 
    FmolCode : WideString;
    FmolName : WideString;
    Fmodify_time : Int64;
//???
    FusageInputRef : SCUsageInputRef;
//???
    FkindRef : SCUsageInputItemKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  numberInt : Integer read FnumberInt write FnumberInt; 
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputRef : SCUsageInputRef read FusageInputRef write FusageInputRef; 
    property kindRef : SCUsageInputItemKindRef read FkindRef write FkindRef; 
  end;
  
{
  SCUsageInputItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberInt : Integer; 
    FcountGen : Integer; 
    FscCode : Integer; 
    FmolCode : WideString;
    FmolName : WideString;
    Fmodify_time : Int64;
//???
    FusageInputRef : SCUsageInputRef;
//???
    FkindRef : SCUsageInputItemKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  numberInt : Integer read FnumberInt write FnumberInt; 
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property usageInputRef : SCUsageInputRef read FusageInputRef write FusageInputRef; 
    property kindRef : SCUsageInputItemKindRef read FkindRef write FkindRef; 
  end;
}

  SCUsageInputItemFilter = class(SCUsageInputItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCUsageInputItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FcountGen : Integer; 
    FscCode : Integer; 
    FmolCode : WideString;
    FmolName : WideString;
    FusageInputRefCode : Integer; 
    FusageInputRefNumberDoc : WideString;
    FusageInputRefDateGen : TXSDate;
    FusageInputRefDateStart : TXSDate;
    FusageInputRefDateFinal : TXSDate;
    FusageInputRefMolCode : WideString;
    FusageInputRefMolName : WideString;
    FusageInputRefDateEdit : TXSDateTime;	
    FusageInputRefUserGen : WideString;
    FkindRefCode : Integer; 
    FkindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property molCode : WideString read FmolCode write FmolCode;
    property molName : WideString read FmolName write FmolName;

    property usageInputRefCode : Integer read FusageInputRefCode write FusageInputRefCode; 
    property usageInputRefNumberDoc : WideString read FusageInputRefNumberDoc write FusageInputRefNumberDoc; 
    property usageInputRefDateGen : TXSDate read FusageInputRefDateGen write FusageInputRefDateGen; 
    property usageInputRefDateStart : TXSDate read FusageInputRefDateStart write FusageInputRefDateStart; 
    property usageInputRefDateFinal : TXSDate read FusageInputRefDateFinal write FusageInputRefDateFinal; 
    property usageInputRefMolCode : WideString read FusageInputRefMolCode write FusageInputRefMolCode; 
    property usageInputRefMolName : WideString read FusageInputRefMolName write FusageInputRefMolName; 
    property usageInputRefDateEdit : TXSDateTime read FusageInputRefDateEdit write FusageInputRefDateEdit; 
    property usageInputRefUserGen : WideString read FusageInputRefUserGen write FusageInputRefUserGen; 
    property kindRefCode : Integer read FkindRefCode write FkindRefCode; 
    property kindRefName : WideString read FkindRefName write FkindRefName; 
  end;

  ArrayOfSCUsageInputItemShort = array of SCUsageInputItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCUsageInputItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCUsageInputItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCUsageInputItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCUsageInputItemController/message/
  // soapAction: http://ksoe.org/SCUsageInputItemController/action/SCUsageInputItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCUsageInputItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCUsageInputItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCUsageInputItemControllerSoapPort = interface(IInvokable)
  ['{9a419a41-9a41-9a41-9a41-9a419a419a41}']
    function  add(const aSCUsageInputItem: SCUsageInputItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCUsageInputItem: SCUsageInputItem); stdcall;
    function  getObject(const anObjectCode: Integer): SCUsageInputItem; stdcall;
    function  getList: SCUsageInputItemShortList; stdcall;
    function  getFilteredList(const aSCUsageInputItemFilter: SCUsageInputItemFilter): SCUsageInputItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemShortList; stdcall;
    function  getScrollableFilteredList(const aSCUsageInputItemFilter: SCUsageInputItemFilter; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCUsageInputItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCUsageInputItemFilter: SCUsageInputItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCUsageInputItem.Destroy;
  begin
    if Assigned(FusageInputRef) then
      usageInputRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCUsageInputItemFilter.Destroy;
  begin
    if Assigned(FusageInputRef) then
      usageInputRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCUsageInputItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCUsageInputItemShort.Destroy;
  begin
    if Assigned(FusageInputRefDateGen) then
      usageInputRefDateGen.Free;
    if Assigned(FusageInputRefDateStart) then
      usageInputRefDateStart.Free;
    if Assigned(FusageInputRefDateFinal) then
      usageInputRefDateFinal.Free;
    if Assigned(FusageInputRefDateEdit) then
      usageInputRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor SCUsageInputItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCUsageInputItem, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItem');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemRef');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemFilter');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemShort');
  RemClassRegistry.RegisterXSClass(SCUsageInputItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCUsageInputItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCUsageInputItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCUsageInputItemShort');

  InvRegistry.RegisterInterface(TypeInfo(SCUsageInputItemControllerSoapPort), 'http://ksoe.org/SCUsageInputItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCUsageInputItemControllerSoapPort), 'http://ksoe.org/SCUsageInputItemController/action/SCUsageInputItemController.%operationName%');


end.
