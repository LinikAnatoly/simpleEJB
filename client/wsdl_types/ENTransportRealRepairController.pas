unit ENTransportRealRepairController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKTransportRealController
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

  ENTransportRealRepair            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRealRepairRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRealRepair = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcommentGen : WideString;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
  end;

{
  ENTransportRealRepairFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcommentGen : WideString;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
  end;
}

  ENTransportRealRepairFilter = class(ENTransportRealRepair)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTransportRealRepairShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FcommentGen : WideString;
    FrealTransportCode : Integer;
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property commentGen : WideString read FcommentGen write FcommentGen;

    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode;
    property realTransportName : WideString read FrealTransportName write FrealTransportName;
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber;
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
  end;

  ArrayOfENTransportRealRepairShort = array of ENTransportRealRepairShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRealRepairShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRealRepairShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRealRepairShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRealRepairController/message/
  // soapAction: http://ksoe.org/ENTransportRealRepairController/action/ENTransportRealRepairController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRealRepairControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRealRepairController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRealRepairControllerSoapPort = interface(IInvokable)
  ['{62BA21DD-DC4E-46ED-8E1A-FF9318A0F4B2}']
    function add(const aENTransportRealRepair: ENTransportRealRepair): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRealRepair: ENTransportRealRepair); stdcall;
    function getObject(const anObjectCode: Integer): ENTransportRealRepair; stdcall;
    function getList: ENTransportRealRepairShortList; stdcall;
    function getFilteredList(const aENTransportRealRepairFilter: ENTransportRealRepairFilter): ENTransportRealRepairShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealRepairShortList; stdcall;
    function getScrollableFilteredList(const aENTransportRealRepairFilter: ENTransportRealRepairFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealRepairShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealRepairShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTransportRealRepairFilter: ENTransportRealRepairFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTransportRealRepairShort; stdcall;
  end;


implementation

  destructor ENTransportRealRepair.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;

{
  destructor ENTransportRealRepairFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;
}

  destructor ENTransportRealRepairFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTransportRealRepairShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENTransportRealRepairShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRealRepair, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealRepair');
  RemClassRegistry.RegisterXSClass(ENTransportRealRepairRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealRepairRef');
  RemClassRegistry.RegisterXSClass(ENTransportRealRepairFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealRepairFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRealRepairShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealRepairShort');
  RemClassRegistry.RegisterXSClass(ENTransportRealRepairShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealRepairShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRealRepairShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRealRepairShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRealRepairControllerSoapPort), 'http://ksoe.org/ENTransportRealRepairController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRealRepairControllerSoapPort), 'http://ksoe.org/ENTransportRealRepairController/action/ENTransportRealRepairController.%operationName%');


end.
