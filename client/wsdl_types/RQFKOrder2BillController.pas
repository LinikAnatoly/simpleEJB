unit RQFKOrder2BillController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQBillController 
   ,RQFKOrderController
   ,RQBillTypeController
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

  RQFKOrder2Bill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2BillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2Bill = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
  
{
  RQFKOrder2BillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FbillRef : RQBillRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property billRef : RQBillRef read FbillRef write FbillRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;
}

  RQFKOrder2BillFilter = class(RQFKOrder2Bill)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQFKOrder2BillShort = class(TRemotable)
  private
    Fcode : Integer; 
    FbillRefCode : Integer; 
    FbillRefNumberDoc : WideString;
    FbillRefNumberProject : WideString;
    FbillRefDateGen : TXSDate;
    FbillRefUserGen : WideString;
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
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
    FfkOrderRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property billRefCode : Integer read FbillRefCode write FbillRefCode; 
    property billRefNumberDoc : WideString read FbillRefNumberDoc write FbillRefNumberDoc; 
    property billRefNumberProject : WideString read FbillRefNumberProject write FbillRefNumberProject; 
    property billRefDateGen : TXSDate read FbillRefDateGen write FbillRefDateGen; 
    property billRefUserGen : WideString read FbillRefUserGen write FbillRefUserGen; 
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
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
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
  end;

  ArrayOfRQFKOrder2BillShort = array of RQFKOrder2BillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2BillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2BillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2BillShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2BillController/message/
  // soapAction: http://ksoe.org/RQFKOrder2BillController/action/RQFKOrder2BillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2BillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2BillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2BillControllerSoapPort = interface(IInvokable)
  ['{7e757e75-7e75-7e75-7e75-7e757e757e75}']
    function  add(const aRQFKOrder2Bill: RQFKOrder2Bill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2Bill: RQFKOrder2Bill); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrder2Bill; stdcall;
    function  getList: RQFKOrder2BillShortList; stdcall;
    function  getFilteredList(const aRQFKOrder2BillFilter: RQFKOrder2BillFilter): RQFKOrder2BillShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2BillShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrder2BillFilter: RQFKOrder2BillFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2BillShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2BillShortList; stdcall;
  end; 


implementation

  destructor RQFKOrder2Bill.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQFKOrder2BillFilter.Destroy;
  begin
    if Assigned(FbillRef) then
      billRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQFKOrder2BillFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQFKOrder2BillShort.Destroy;
  begin
    if Assigned(FbillRefDateGen) then
      billRefDateGen.Free;
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrder2BillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2Bill, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2Bill');
  RemClassRegistry.RegisterXSClass(RQFKOrder2BillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2BillRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2BillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2BillFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2BillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2BillShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2BillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2BillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2BillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2BillShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2BillControllerSoapPort), 'http://ksoe.org/RQFKOrder2BillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2BillControllerSoapPort), 'http://ksoe.org/RQFKOrder2BillController/action/RQFKOrder2BillController.%operationName%');


end.
