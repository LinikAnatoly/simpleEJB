unit ENAct2TransportController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENActController 
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

  ENAct2Transport            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2TransportRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2Transport = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    Fexpense : TXSDecimal;
    FdepreciationMonth : TXSDecimal;
    FdepreciationHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FpaysWork : TXSDecimal;
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property expense : TXSDecimal read Fexpense write Fexpense; 
    property depreciationMonth : TXSDecimal read FdepreciationMonth write FdepreciationMonth; 
    property depreciationHours : TXSDecimal read FdepreciationHours write FdepreciationHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;

  ENAct2TransportFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    Fexpense : TXSDecimal;
    FdepreciationMonth : TXSDecimal;
    FdepreciationHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FpaysWork : TXSDecimal;
    Fmodify_time : Int64;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property expense : TXSDecimal read Fexpense write Fexpense; 
    property depreciationMonth : TXSDecimal read FdepreciationMonth write FdepreciationMonth; 
    property depreciationHours : TXSDecimal read FdepreciationHours write FdepreciationHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property actRef : ENActRef read FactRef write FactRef; 
  end;


  ENAct2TransportShort = class(TRemotable)
  private
    Fcode : Integer; 
    FinvNumber : WideString;
    Fname : WideString;
    Fexpense : TXSDecimal;
    FdepreciationMonth : TXSDecimal;
    FdepreciationHours : TXSDecimal;
    FtimeWork : TXSDecimal;
    FpaysWork : TXSDecimal;
    FactRefCode : Integer; 
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer; 
    FactRefFinDocMechanicCode : Integer; 
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property invNumber : WideString read FinvNumber write FinvNumber;
    property name : WideString read Fname write Fname;
    property expense : TXSDecimal read Fexpense write Fexpense; 
    property depreciationMonth : TXSDecimal read FdepreciationMonth write FdepreciationMonth; 
    property depreciationHours : TXSDecimal read FdepreciationHours write FdepreciationHours; 
    property timeWork : TXSDecimal read FtimeWork write FtimeWork; 
    property paysWork : TXSDecimal read FpaysWork write FpaysWork; 

    property actRefCode : Integer read FactRefCode write FactRefCode; 
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen; 
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen; 
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode; 
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode; 
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName; 
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName; 
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen; 
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit; 
  end;

  ArrayOfENAct2TransportShort = array of ENAct2TransportShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2TransportShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2TransportShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2TransportShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2TransportController/message/
  // soapAction: http://ksoe.org/ENAct2TransportController/action/ENAct2TransportController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2TransportControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2TransportController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2TransportControllerSoapPort = interface(IInvokable)
  ['{0358CE28-680E-494A-9E33-EC96D047E78E}']
    function  add(const aENAct2Transport: ENAct2Transport): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2Transport: ENAct2Transport); stdcall;
    function  getObject(const anObjectCode: Integer): ENAct2Transport; stdcall;
    function  getList: ENAct2TransportShortList; stdcall;
    function  getFilteredList(const aENAct2TransportFilter: ENAct2TransportFilter): ENAct2TransportShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2TransportShortList; stdcall;
    function  getScrollableFilteredList(const aENAct2TransportFilter: ENAct2TransportFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2TransportShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2TransportShortList; stdcall;
  end; 


implementation

  destructor ENAct2Transport.Destroy;
  begin
    if Assigned(Fexpense) then
      expense.Free;
    if Assigned(FdepreciationMonth) then
      depreciationMonth.Free;
    if Assigned(FdepreciationHours) then
      depreciationHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
  
  destructor ENAct2TransportFilter.Destroy;
  begin
    if Assigned(Fexpense) then
      expense.Free;
    if Assigned(FdepreciationMonth) then
      depreciationMonth.Free;
    if Assigned(FdepreciationHours) then
      depreciationHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENAct2TransportShort.Destroy;
  begin
    if Assigned(Fexpense) then
      expense.Free;
    if Assigned(FdepreciationMonth) then
      depreciationMonth.Free;
    if Assigned(FdepreciationHours) then
      depreciationHours.Free;
    if Assigned(FtimeWork) then
      timeWork.Free;
    if Assigned(FpaysWork) then
      paysWork.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENAct2TransportShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2Transport, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2Transport');
  RemClassRegistry.RegisterXSClass(ENAct2TransportRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2TransportRef');
  RemClassRegistry.RegisterXSClass(ENAct2TransportFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2TransportFilter');
  RemClassRegistry.RegisterXSClass(ENAct2TransportShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2TransportShort');
  RemClassRegistry.RegisterXSClass(ENAct2TransportShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2TransportShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2TransportShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2TransportShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2TransportControllerSoapPort), 'http://ksoe.org/ENAct2TransportController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2TransportControllerSoapPort), 'http://ksoe.org/ENAct2TransportController/action/ENAct2TransportController.%operationName%');


end.
