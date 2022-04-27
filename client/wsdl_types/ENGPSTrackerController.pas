unit ENGPSTrackerController;

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

  ENGPSTracker            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGPSTrackerRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGPSTracker = class(TRemotable)
  private
    Fcode : Integer;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FrealTransport : TKTransportRealRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property realTransport : TKTransportRealRef read FrealTransport write FrealTransport;
  end;

{
  ENGPSTrackerFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FrealTransport : TKTransportRealRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property realTransport : TKTransportRealRef read FrealTransport write FrealTransport;
  end;
}

  ENGPSTrackerFilter = class(ENGPSTracker)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGPSTrackerShort = class(TRemotable)
  private
    Fcode : Integer;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FrealTransportCode : Integer;
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode;
    property realTransportName : WideString read FrealTransportName write FrealTransportName;
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber;
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
  end;

  ArrayOfENGPSTrackerShort = array of ENGPSTrackerShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGPSTrackerShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGPSTrackerShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGPSTrackerShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGPSTrackerController/message/
  // soapAction: http://ksoe.org/ENGPSTrackerController/action/ENGPSTrackerController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGPSTrackerControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGPSTrackerController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGPSTrackerControllerSoapPort = interface(IInvokable)
  ['{ED9EAE5F-1149-45CE-AA19-7C212AC41208}']
    function add(const aENGPSTracker: ENGPSTracker): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGPSTracker: ENGPSTracker); stdcall;
    function getObject(const anObjectCode: Integer): ENGPSTracker; stdcall;
    function getList: ENGPSTrackerShortList; stdcall;
    function getFilteredList(const aENGPSTrackerFilter: ENGPSTrackerFilter): ENGPSTrackerShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerShortList; stdcall;
    function getScrollableFilteredList(const aENGPSTrackerFilter: ENGPSTrackerFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGPSTrackerFilter: ENGPSTrackerFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGPSTrackerShort; stdcall;
    procedure installGPS(const gpsTrackerCode: Integer; const transporRealCode: Integer; const insDate : TXSDate); stdcall;
    procedure unInstallGPS(const gpsTrackerCode: Integer; const unInsDate : TXSDate); stdcall;
  end;


implementation

  destructor ENGPSTracker.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;

{
  destructor ENGPSTrackerFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end;
}

  destructor ENGPSTrackerFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGPSTrackerShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENGPSTrackerShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGPSTracker, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTracker');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerRef');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerFilter');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerShort');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGPSTrackerShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGPSTrackerShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGPSTrackerControllerSoapPort), 'http://ksoe.org/ENGPSTrackerController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGPSTrackerControllerSoapPort), 'http://ksoe.org/ENGPSTrackerController/action/ENGPSTrackerController.%operationName%');


end.
