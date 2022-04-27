unit ENAverageCountPersonalController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENAverageCountPersonal            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAverageCountPersonalRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAverageCountPersonal = class(TRemotable)
  private
    Fcode : Integer;
    FcodePodr : WideString;
    FnamePodr : WideString;
    FcodeCeh : WideString;
    FnameCeh : WideString;
    FcalculateDate : TXSDate;
    FdateEdit : TXSDate;
    FcountGen : TXSDecimal;
    FpersonalVidId : WideString;
    FpersonalVidName : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property namePodr : WideString read FnamePodr write FnamePodr;
    property codeCeh : WideString read FcodeCeh write FcodeCeh;
    property nameCeh : WideString read FnameCeh write FnameCeh;
    property calculateDate : TXSDate read FcalculateDate write FcalculateDate;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property personalVidId : WideString read FpersonalVidId write FpersonalVidId;
    property personalVidName : WideString read FpersonalVidName write FpersonalVidName;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;

{
  ENAverageCountPersonalFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcodePodr : WideString;
    FnamePodr : WideString;
    FcodeCeh : WideString;
    FnameCeh : WideString;
    FcalculateDate : TXSDate;
    FdateEdit : TXSDate;
    FcountGen : TXSDecimal;
    FpersonalVidId : WideString;
    FpersonalVidName : WideString;
    FuserGen : WideString;
    Fmodify_time : Int64;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property namePodr : WideString read FnamePodr write FnamePodr;
    property codeCeh : WideString read FcodeCeh write FcodeCeh;
    property nameCeh : WideString read FnameCeh write FnameCeh;
    property calculateDate : TXSDate read FcalculateDate write FcalculateDate;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property personalVidId : WideString read FpersonalVidId write FpersonalVidId;
    property personalVidName : WideString read FpersonalVidName write FpersonalVidName;
    property userGen : WideString read FuserGen write FuserGen;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
  end;
}

  ENAverageCountPersonalFilter = class(ENAverageCountPersonal)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAverageCountPersonalShort = class(TRemotable)
  private
    Fcode : Integer;
    FcodePodr : WideString;
    FnamePodr : WideString;
    FcodeCeh : WideString;
    FnameCeh : WideString;
    FcalculateDate : TXSDate;
    FdateEdit : TXSDate;
    FcountGen : TXSDecimal;
    FpersonalVidId : WideString;
    FpersonalVidName : WideString;
    FuserGen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property codePodr : WideString read FcodePodr write FcodePodr;
    property namePodr : WideString read FnamePodr write FnamePodr;
    property codeCeh : WideString read FcodeCeh write FcodeCeh;
    property nameCeh : WideString read FnameCeh write FnameCeh;
    property calculateDate : TXSDate read FcalculateDate write FcalculateDate;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property personalVidId : WideString read FpersonalVidId write FpersonalVidId;
    property personalVidName : WideString read FpersonalVidName write FpersonalVidName;
    property userGen : WideString read FuserGen write FuserGen;

  end;

  ArrayOfENAverageCountPersonalShort = array of ENAverageCountPersonalShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAverageCountPersonalShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAverageCountPersonalShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAverageCountPersonalShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAverageCountPersonalController/message/
  // soapAction: http://ksoe.org/ENAverageCountPersonalController/action/ENAverageCountPersonalController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAverageCountPersonalControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAverageCountPersonalController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAverageCountPersonalControllerSoapPort = interface(IInvokable)
  ['{7B59DA48-CB2D-4ED0-B57A-C98D7101D119}']
    function add(const aENAverageCountPersonal: ENAverageCountPersonal): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAverageCountPersonal: ENAverageCountPersonal); stdcall;
    function getObject(const anObjectCode: Integer): ENAverageCountPersonal; stdcall;
    function getList: ENAverageCountPersonalShortList; stdcall;
    function getFilteredList(const aENAverageCountPersonalFilter: ENAverageCountPersonalFilter): ENAverageCountPersonalShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAverageCountPersonalShortList; stdcall;
    function getScrollableFilteredList(const aENAverageCountPersonalFilter: ENAverageCountPersonalFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAverageCountPersonalShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAverageCountPersonalShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAverageCountPersonalFilter: ENAverageCountPersonalFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAverageCountPersonalShort; stdcall;

    function  calculateAverageCountPersonal(const aAverageCountPersonal: ENAverageCountPersonal): Integer; stdcall;
    function  getListCalculatedPeriod(): ENAverageCountPersonalShortList; stdcall;
  end;


implementation

  destructor ENAverageCountPersonal.Destroy;
  begin
    if Assigned(FcalculateDate) then
      calculateDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    inherited Destroy;
  end;

{
  destructor ENAverageCountPersonalFilter.Destroy;
  begin
    if Assigned(FcalculateDate) then
      calculateDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    inherited Destroy;
  end;
}

  destructor ENAverageCountPersonalFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAverageCountPersonalShort.Destroy;
  begin
    if Assigned(FcalculateDate) then
      calculateDate.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    inherited Destroy;
  end;

  destructor ENAverageCountPersonalShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAverageCountPersonal, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAverageCountPersonal');
  RemClassRegistry.RegisterXSClass(ENAverageCountPersonalRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAverageCountPersonalRef');
  RemClassRegistry.RegisterXSClass(ENAverageCountPersonalFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAverageCountPersonalFilter');
  RemClassRegistry.RegisterXSClass(ENAverageCountPersonalShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAverageCountPersonalShort');
  RemClassRegistry.RegisterXSClass(ENAverageCountPersonalShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAverageCountPersonalShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAverageCountPersonalShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAverageCountPersonalShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAverageCountPersonalControllerSoapPort), 'http://ksoe.org/ENAverageCountPersonalController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAverageCountPersonalControllerSoapPort), 'http://ksoe.org/ENAverageCountPersonalController/action/ENAverageCountPersonalController.%operationName%');


end.
