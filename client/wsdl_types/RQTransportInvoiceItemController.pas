unit RQTransportInvoiceItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,RQTransportInvoiceController 
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

  RQTransportInvoiceItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQTransportInvoiceItem = class(TRemotable)
  private
    Fcode : Integer; 
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountFact : TXSDecimal;
    Fweight : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtransportInvoiceRef : RQTransportInvoiceRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property transportInvoiceRef : RQTransportInvoiceRef read FtransportInvoiceRef write FtransportInvoiceRef; 
  end;
  
{
  RQTransportInvoiceItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountFact : TXSDecimal;
    Fweight : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FmaterialRef : TKMaterialsRef;
//???
    FtransportInvoiceRef : RQTransportInvoiceRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
    property transportInvoiceRef : RQTransportInvoiceRef read FtransportInvoiceRef write FtransportInvoiceRef; 
  end;
}

  RQTransportInvoiceItemFilter = class(RQTransportInvoiceItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQTransportInvoiceItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FmaterialName : WideString;
    FmeasurementName : WideString;
    FcountFact : TXSDecimal;
    Fweight : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FtransportInvoiceRefCode : Integer; 
    FtransportInvoiceRefNumberDoc : WideString;
    FtransportInvoiceRefNumberProject : WideString;
    FtransportInvoiceRefDateGen : TXSDate;
    FtransportInvoiceRefUserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property materialName : WideString read FmaterialName write FmaterialName;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property weight : TXSDecimal read Fweight write Fweight; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property transportInvoiceRefCode : Integer read FtransportInvoiceRefCode write FtransportInvoiceRefCode; 
    property transportInvoiceRefNumberDoc : WideString read FtransportInvoiceRefNumberDoc write FtransportInvoiceRefNumberDoc; 
    property transportInvoiceRefNumberProject : WideString read FtransportInvoiceRefNumberProject write FtransportInvoiceRefNumberProject; 
    property transportInvoiceRefDateGen : TXSDate read FtransportInvoiceRefDateGen write FtransportInvoiceRefDateGen; 
    property transportInvoiceRefUserGen : WideString read FtransportInvoiceRefUserGen write FtransportInvoiceRefUserGen; 
  end;

  ArrayOfRQTransportInvoiceItemShort = array of RQTransportInvoiceItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQTransportInvoiceItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQTransportInvoiceItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQTransportInvoiceItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQTransportInvoiceItemController/message/
  // soapAction: http://ksoe.org/RQTransportInvoiceItemController/action/RQTransportInvoiceItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQTransportInvoiceItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQTransportInvoiceItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQTransportInvoiceItemControllerSoapPort = interface(IInvokable)
  ['{15481548-1548-1548-1548-154815481548}']
    function  add(const aRQTransportInvoiceItem: RQTransportInvoiceItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQTransportInvoiceItem: RQTransportInvoiceItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQTransportInvoiceItem; stdcall;
    function  getList: RQTransportInvoiceItemShortList; stdcall;
    function  getFilteredList(const aRQTransportInvoiceItemFilter: RQTransportInvoiceItemFilter): RQTransportInvoiceItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQTransportInvoiceItemFilter: RQTransportInvoiceItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQTransportInvoiceItemShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQTransportInvoiceItemFilter: RQTransportInvoiceItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQTransportInvoiceItem.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtransportInvoiceRef) then
      transportInvoiceRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQTransportInvoiceItemFilter.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    if Assigned(FtransportInvoiceRef) then
      transportInvoiceRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQTransportInvoiceItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQTransportInvoiceItemShort.Destroy;
  begin
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(Fweight) then
      weight.Free;
    if Assigned(FtransportInvoiceRefDateGen) then
      transportInvoiceRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQTransportInvoiceItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItem');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItemRef');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItemFilter');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItemShort');
  RemClassRegistry.RegisterXSClass(RQTransportInvoiceItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQTransportInvoiceItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQTransportInvoiceItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQTransportInvoiceItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQTransportInvoiceItemControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQTransportInvoiceItemControllerSoapPort), 'http://ksoe.org/RQTransportInvoiceItemController/action/RQTransportInvoiceItemController.%operationName%');


end.
