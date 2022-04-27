unit RQFKOrder2FKPartyController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderController 
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

  RQFKOrder2FKParty            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKPartyRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2FKParty = class(TRemotable)
  private
    Fcode : Integer; 
    FpartyCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  partyCode : Integer read FpartyCode write FpartyCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
  
{
  RQFKOrder2FKPartyFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FpartyCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  partyCode : Integer read FpartyCode write FpartyCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
}

  RQFKOrder2FKPartyFilter = class(RQFKOrder2FKParty)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrder2FKPartyShort = class(TRemotable)
  private
    Fcode : Integer; 
    FpartyCode : Integer; 
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefNumberDocOut : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer; 
    FfkOrderRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  partyCode : Integer read FpartyCode write FpartyCode; 

    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefNumberDocOut : WideString read FfkOrderRefNumberDocOut write FfkOrderRefNumberDocOut; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode; 
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName; 
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode; 
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName; 
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode; 
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds; 
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds; 
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
  end;

  ArrayOfRQFKOrder2FKPartyShort = array of RQFKOrder2FKPartyShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2FKPartyShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2FKPartyShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2FKPartyShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2FKPartyController/message/
  // soapAction: http://ksoe.org/RQFKOrder2FKPartyController/action/RQFKOrder2FKPartyController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2FKPartyControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2FKPartyController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2FKPartyControllerSoapPort = interface(IInvokable)
  ['{13421342-1342-1342-1342-134213421342}']
    function  add(const aRQFKOrder2FKParty: RQFKOrder2FKParty): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2FKParty: RQFKOrder2FKParty); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrder2FKParty; stdcall;
    function  getList: RQFKOrder2FKPartyShortList; stdcall;
    function  getFilteredList(const aRQFKOrder2FKPartyFilter: RQFKOrder2FKPartyFilter): RQFKOrder2FKPartyShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKPartyShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrder2FKPartyFilter: RQFKOrder2FKPartyFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKPartyShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2FKPartyShortList; stdcall;
  end; 


implementation

  destructor RQFKOrder2FKParty.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrder2FKPartyFilter.Destroy;
  begin
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrder2FKPartyFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrder2FKPartyShort.Destroy;
  begin
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrder2FKPartyShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2FKParty, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKParty');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKPartyRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKPartyRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKPartyFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKPartyFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKPartyShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKPartyShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2FKPartyShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2FKPartyShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2FKPartyShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2FKPartyShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2FKPartyControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKPartyController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2FKPartyControllerSoapPort), 'http://ksoe.org/RQFKOrder2FKPartyController/action/RQFKOrder2FKPartyController.%operationName%');


end.
