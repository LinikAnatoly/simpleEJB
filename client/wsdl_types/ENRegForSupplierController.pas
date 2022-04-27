unit ENRegForSupplierController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENRegForSupplierTypeController
   ,ENRegForSupplierStatusController
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

  ENRegForSupplier            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplierRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRegForSupplier = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateFrom : TXSDate;
    FdateTo : TXSDate;
    FsupplierCode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FtypeRef : ENRegForSupplierTypeRef;
//???
    FstatusRef : ENRegForSupplierStatusRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateFrom : TXSDate read FdateFrom write FdateFrom;
    property dateTo : TXSDate read FdateTo write FdateTo;
    property supplierCode : Integer read FsupplierCode write FsupplierCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property typeRef : ENRegForSupplierTypeRef read FtypeRef write FtypeRef;
    property statusRef : ENRegForSupplierStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENRegForSupplierFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FnumberGen : WideString;
    FdateFrom : TXSDate;
    FdateTo : TXSDate;
    FsupplierCode : Integer;
    FcommentGen : WideString;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FtypeRef : ENRegForSupplierTypeRef;
//???
    FstatusRef : ENRegForSupplierStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateFrom : TXSDate read FdateFrom write FdateFrom;
    property dateTo : TXSDate read FdateTo write FdateTo;
    property supplierCode : Integer read FsupplierCode write FsupplierCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property typeRef : ENRegForSupplierTypeRef read FtypeRef write FtypeRef;
    property statusRef : ENRegForSupplierStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENRegForSupplierFilter = class(ENRegForSupplier)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENRegForSupplierShort = class(TRemotable)
  private
    Fcode : Integer;
    FnumberGen : WideString;
    FdateFrom : TXSDate;
    FdateTo : TXSDate;
    FsupplierCode : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
    FtypeRefDescription : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    /////
    FsupplierName : WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property numberGen : WideString read FnumberGen write FnumberGen;
    property dateFrom : TXSDate read FdateFrom write FdateFrom;
    property dateTo : TXSDate read FdateTo write FdateTo;
    property  supplierCode : Integer read FsupplierCode write FsupplierCode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property typeRefDescription : WideString read FtypeRefDescription write FtypeRefDescription;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    /////
    property supplierName : WideString read FsupplierName write FsupplierName;
    /////
  end;

  ArrayOfENRegForSupplierShort = array of ENRegForSupplierShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRegForSupplierShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRegForSupplierShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRegForSupplierShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRegForSupplierController/message/
  // soapAction: http://ksoe.org/ENRegForSupplierController/action/ENRegForSupplierController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRegForSupplierControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRegForSupplierController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRegForSupplierControllerSoapPort = interface(IInvokable)
  ['{D85AC4BC-57D4-4B89-B555-3B85F219CBF4}']
    function add(const aENRegForSupplier: ENRegForSupplier): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRegForSupplier: ENRegForSupplier); stdcall;
    function getObject(const anObjectCode: Integer): ENRegForSupplier; stdcall;
    function getList: ENRegForSupplierShortList; stdcall;
    function getFilteredList(const aENRegForSupplierFilter: ENRegForSupplierFilter): ENRegForSupplierShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierShortList; stdcall;
    function getScrollableFilteredList(const aENRegForSupplierFilter: ENRegForSupplierFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRegForSupplierShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENRegForSupplierFilter: ENRegForSupplierFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENRegForSupplierShort; stdcall;

    procedure generateRegItems(const aRegCode: Integer); stdcall;
    procedure removeRegItems(const aRegCode: Integer); stdcall;
  end;


implementation

  destructor ENRegForSupplier.Destroy;
  begin
    if Assigned(FdateFrom) then
      dateFrom.Free;
    if Assigned(FdateTo) then
      dateTo.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENRegForSupplierFilter.Destroy;
  begin
    if Assigned(FdateFrom) then
      dateFrom.Free;
    if Assigned(FdateTo) then
      dateTo.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENRegForSupplierFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENRegForSupplierShort.Destroy;
  begin
    if Assigned(FdateFrom) then
      dateFrom.Free;
    if Assigned(FdateTo) then
      dateTo.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENRegForSupplierShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRegForSupplier, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplier');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierRef');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierFilter');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierShort');
  RemClassRegistry.RegisterXSClass(ENRegForSupplierShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRegForSupplierShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRegForSupplierShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRegForSupplierShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRegForSupplierControllerSoapPort), 'http://ksoe.org/ENRegForSupplierController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRegForSupplierControllerSoapPort), 'http://ksoe.org/ENRegForSupplierController/action/ENRegForSupplierController.%operationName%');


end.
