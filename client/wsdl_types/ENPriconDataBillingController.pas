unit ENPriconDataBillingController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENElementController
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

  ENPriconDataBilling            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconDataBillingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENPriconDataBilling = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
//???
    FrenRef : EPRenRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
  end;

{
  ENPriconDataBillingFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FelementRef : ENElementRef;
//???
    FrenRef : EPRenRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property renRef : EPRenRef read FrenRef write FrenRef;
  end;
}

  ENPriconDataBillingFilter = class(ENPriconDataBilling)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENPriconDataBillingShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateGen : TXSDate;
    FpowerContractTotal : TXSDecimal;
    FpowerContractByt : TXSDecimal;
    FpowerContractProm : TXSDecimal;
    FcountCustomer : Integer;
    FcountCustomerByt : Integer;
    FcountCustomerProm : Integer;
    FcommentGen : WideString;
    FuserGen : WideString;
    FelementRefCode : Integer;
    FrenRefCode : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property powerContractTotal : TXSDecimal read FpowerContractTotal write FpowerContractTotal;
    property powerContractByt : TXSDecimal read FpowerContractByt write FpowerContractByt;
    property powerContractProm : TXSDecimal read FpowerContractProm write FpowerContractProm;
    property  countCustomer : Integer read FcountCustomer write FcountCustomer;
    property  countCustomerByt : Integer read FcountCustomerByt write FcountCustomerByt;
    property  countCustomerProm : Integer read FcountCustomerProm write FcountCustomerProm;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property renRefCode : Integer read FrenRefCode write FrenRefCode; //EPRenRef read FrenRefCode write FrenRefCode;
  end;

  ArrayOfENPriconDataBillingShort = array of ENPriconDataBillingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENPriconDataBillingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENPriconDataBillingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENPriconDataBillingShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENPriconDataBillingController/message/
  // soapAction: http://ksoe.org/ENPriconDataBillingController/action/ENPriconDataBillingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENPriconDataBillingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENPriconDataBillingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENPriconDataBillingControllerSoapPort = interface(IInvokable)
  ['{1f241f24-1f24-1f24-1f24-1f241f241f24}']
    function add(const aENPriconDataBilling: ENPriconDataBilling): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENPriconDataBilling: ENPriconDataBilling); stdcall;
    function getObject(const anObjectCode: Integer): ENPriconDataBilling; stdcall;
    function getList: ENPriconDataBillingShortList; stdcall;
    function getFilteredList(const aENPriconDataBillingFilter: ENPriconDataBillingFilter): ENPriconDataBillingShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENPriconDataBillingShortList; stdcall;
    function getScrollableFilteredList(const aENPriconDataBillingFilter: ENPriconDataBillingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENPriconDataBillingShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENPriconDataBillingShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENPriconDataBillingFilter: ENPriconDataBillingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENPriconDataBillingShort; stdcall;
  end;


implementation

  destructor ENPriconDataBilling.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    inherited Destroy;
  end;

{
  destructor ENPriconDataBillingFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FrenRef) then
      renRef.Free;
    inherited Destroy;
  end;
}

  destructor ENPriconDataBillingFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENPriconDataBillingShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FpowerContractTotal) then
      powerContractTotal.Free;
    if Assigned(FpowerContractByt) then
      powerContractByt.Free;
    if Assigned(FpowerContractProm) then
      powerContractProm.Free;
    inherited Destroy;
  end;

  destructor ENPriconDataBillingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENPriconDataBilling, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconDataBilling');
  RemClassRegistry.RegisterXSClass(ENPriconDataBillingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconDataBillingRef');
  RemClassRegistry.RegisterXSClass(ENPriconDataBillingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconDataBillingFilter');
  RemClassRegistry.RegisterXSClass(ENPriconDataBillingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconDataBillingShort');
  RemClassRegistry.RegisterXSClass(ENPriconDataBillingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENPriconDataBillingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENPriconDataBillingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENPriconDataBillingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENPriconDataBillingControllerSoapPort), 'http://ksoe.org/ENPriconDataBillingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENPriconDataBillingControllerSoapPort), 'http://ksoe.org/ENPriconDataBillingController/action/ENPriconDataBillingController.%operationName%');


end.
