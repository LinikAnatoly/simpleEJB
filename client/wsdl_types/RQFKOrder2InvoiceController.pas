unit RQFKOrder2InvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQInvoiceController 
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

  RQFKOrder2Invoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2InvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2Invoice = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : RQInvoiceRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;

  RQFKOrder2InvoiceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FinvoiceRef : RQInvoiceRef;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
  end;


  RQFKOrder2InvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvoiceRefCode : Integer; 
    FinvoiceRefNumberDoc : WideString;
    FinvoiceRefNumberProject : WideString;
    FinvoiceRefDateGen : TXSDate;
    FinvoiceRefUserGen : WideString;
    FfkOrderRefCode : Integer; 
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefMolCode : WideString;
    FfkOrderRefMolName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; 
    property invoiceRefNumberDoc : WideString read FinvoiceRefNumberDoc write FinvoiceRefNumberDoc; 
    property invoiceRefNumberProject : WideString read FinvoiceRefNumberProject write FinvoiceRefNumberProject; 
    property invoiceRefDateGen : TXSDate read FinvoiceRefDateGen write FinvoiceRefDateGen; 
    property invoiceRefUserGen : WideString read FinvoiceRefUserGen write FinvoiceRefUserGen; 
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode; 
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc; 
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen; 
    property fkOrderRefMolCode : WideString read FfkOrderRefMolCode write FfkOrderRefMolCode; 
    property fkOrderRefMolName : WideString read FfkOrderRefMolName write FfkOrderRefMolName; 
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber; 
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate; 
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO; 
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen; 
  end;

  ArrayOfRQFKOrder2InvoiceShort = array of RQFKOrder2InvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2InvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2InvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2InvoiceShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2InvoiceController/message/
  // soapAction: http://ksoe.org/RQFKOrder2InvoiceController/action/RQFKOrder2InvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2InvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2InvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2InvoiceControllerSoapPort = interface(IInvokable)
  ['{1a791a79-1a79-1a79-1a79-1a791a791a79}']
    function  add(const aRQFKOrder2Invoice: RQFKOrder2Invoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2Invoice: RQFKOrder2Invoice); stdcall;
    function  getObject(const anObjectCode: Integer): RQFKOrder2Invoice; stdcall;
    function  getList: RQFKOrder2InvoiceShortList; stdcall;
    function  getFilteredList(const aRQFKOrder2InvoiceFilter: RQFKOrder2InvoiceFilter): RQFKOrder2InvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2InvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aRQFKOrder2InvoiceFilter: RQFKOrder2InvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2InvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2InvoiceShortList; stdcall;
  end; 


implementation

  destructor RQFKOrder2Invoice.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;
  
  destructor RQFKOrder2InvoiceFilter.Destroy;
  begin
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrder2InvoiceShort.Destroy;
  begin
    if Assigned(FinvoiceRefDateGen) then
      invoiceRefDateGen.Free;
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    inherited Destroy;
  end; 
  
  destructor RQFKOrder2InvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2Invoice, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2Invoice');
  RemClassRegistry.RegisterXSClass(RQFKOrder2InvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2InvoiceRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2InvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2InvoiceFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2InvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2InvoiceShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2InvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2InvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2InvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2InvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2InvoiceControllerSoapPort), 'http://ksoe.org/RQFKOrder2InvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2InvoiceControllerSoapPort), 'http://ksoe.org/RQFKOrder2InvoiceController/action/RQFKOrder2InvoiceController.%operationName%');


end.
