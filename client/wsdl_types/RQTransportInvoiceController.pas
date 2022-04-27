unit RQTransportInvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQTransportInvoiceStatusController 
   ,ENPlanWorkController 
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

  RQTransportInvoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoice = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQTransportInvoiceStatusRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property statusRef : RQTransportInvoiceStatusRef read FstatusRef write FstatusRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
  
{
  RQTransportInvoiceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FstatusRef : RQTransportInvoiceStatusRef;
//???
    FplanRef : ENPlanWorkRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property statusRef : RQTransportInvoiceStatusRef read FstatusRef write FstatusRef; 
    property planRef : ENPlanWorkRef read FplanRef write FplanRef; 
  end;
}

  RQTransportInvoiceFilter = class(RQTransportInvoice)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQTransportInvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FnumberDoc : WideString;
    FnumberProject : WideString;
    FdateGen : TXSDate;	
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstatusRefCode : Integer; 
    FstatusRefName : WideString;
    FtotalWeight : TXSDecimal;
    FplanRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property numberProject : WideString read FnumberProject write FnumberProject;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property totalWeight : TXSDecimal read FtotalWeight write FtotalWeight;
    property planRefCode : Integer read FplanRefCode write FplanRefCode;
  end;

  ArrayOfRQTransportInvoiceShort = array of RQTransportInvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTransportInvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTransportInvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTransportInvoiceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTransportInvoiceController/message/
  // soapAction: http://ksoe.org/RQTransportInvoiceController/action/RQTransportInvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTransportInvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTransportInvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTransportInvoiceControllerSoapPort = interface(IInvokable)
  ['{1ae71ae7-1ae7-1ae7-1ae7-1ae71ae71ae7}']
    function  add(const aRQTransportInvoice: RQTransportInvoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTransportInvoice: RQTransportInvoice); stdcall;
    function  getObject(const anObjectCode: Integer): RQTransportInvoice; stdcall;
    function  getList: RQTransportInvoiceShortList; stdcall;
    function  getFilteredList(const aRQTransportInvoiceFilter: RQTransportInvoiceFilter): RQTransportInvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aRQTransportInvoiceFilter: RQTransportInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQTransportInvoiceFilter: RQTransportInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQTransportInvoice.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQTransportInvoiceFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FplanRef) then
      planRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQTransportInvoiceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQTransportInvoiceShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQTransportInvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTransportInvoice, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoice');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceRef');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceFilter');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceShort');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTransportInvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTransportInvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTransportInvoiceControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTransportInvoiceControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceController/action/RQTransportInvoiceController.%operationName%');


end.
