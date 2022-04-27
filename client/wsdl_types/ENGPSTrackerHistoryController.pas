unit ENGPSTrackerHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKTransportRealController
   ,ENGPSTrackerController
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

  ENGPSTrackerHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGPSTrackerHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENGPSTrackerHistory = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FrealTransport : TKTransportRealRef;
//???
    FgpsTracker : ENGPSTrackerRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property realTransport : TKTransportRealRef read FrealTransport write FrealTransport;
    property gpsTracker : ENGPSTrackerRef read FgpsTracker write FgpsTracker;
  end;

{
  ENGPSTrackerHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FrealTransport : TKTransportRealRef;
//???
    FgpsTracker : ENGPSTrackerRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property realTransport : TKTransportRealRef read FrealTransport write FrealTransport;
    property gpsTracker : ENGPSTrackerRef read FgpsTracker write FgpsTracker;
  end;
}

  ENGPSTrackerHistoryFilter = class(ENGPSTrackerHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENGPSTrackerHistoryShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FphoneNumber : WideString;
    FcardNumber : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FrealTransportCode : Integer;
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
    FgpsTrackerCode : Integer;
    FgpsTrackerReg_id : WideString;
    FgpsTrackerPhoneNumber : WideString;
    FgpsTrackerCardNumber : WideString;
    FgpsTrackerUserGen : WideString;
    FgpsTrackerDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property phoneNumber : WideString read FphoneNumber write FphoneNumber;
    property cardNumber : WideString read FcardNumber write FcardNumber;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode;
    property realTransportName : WideString read FrealTransportName write FrealTransportName;
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber;
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
    property gpsTrackerCode : Integer read FgpsTrackerCode write FgpsTrackerCode;
    property gpsTrackerReg_id : WideString read FgpsTrackerReg_id write FgpsTrackerReg_id;
    property gpsTrackerPhoneNumber : WideString read FgpsTrackerPhoneNumber write FgpsTrackerPhoneNumber;
    property gpsTrackerCardNumber : WideString read FgpsTrackerCardNumber write FgpsTrackerCardNumber;
    property gpsTrackerUserGen : WideString read FgpsTrackerUserGen write FgpsTrackerUserGen;
    property gpsTrackerDateEdit : TXSDateTime read FgpsTrackerDateEdit write FgpsTrackerDateEdit;
  end;

  ArrayOfENGPSTrackerHistoryShort = array of ENGPSTrackerHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENGPSTrackerHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENGPSTrackerHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENGPSTrackerHistoryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENGPSTrackerHistoryController/message/
  // soapAction: http://ksoe.org/ENGPSTrackerHistoryController/action/ENGPSTrackerHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENGPSTrackerHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENGPSTrackerHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENGPSTrackerHistoryControllerSoapPort = interface(IInvokable)
  ['{AC23E91B-F121-4D8A-9D46-5F64D06EA920}']
    function add(const aENGPSTrackerHistory: ENGPSTrackerHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENGPSTrackerHistory: ENGPSTrackerHistory); stdcall;
    function getObject(const anObjectCode: Integer): ENGPSTrackerHistory; stdcall;
    function getList: ENGPSTrackerHistoryShortList; stdcall;
    function getFilteredList(const aENGPSTrackerHistoryFilter: ENGPSTrackerHistoryFilter): ENGPSTrackerHistoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerHistoryShortList; stdcall;
    function getScrollableFilteredList(const aENGPSTrackerHistoryFilter: ENGPSTrackerHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerHistoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENGPSTrackerHistoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENGPSTrackerHistoryFilter: ENGPSTrackerHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENGPSTrackerHistoryShort; stdcall;
  end;


implementation

  destructor ENGPSTrackerHistory.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FgpsTracker) then
      gpsTracker.Free;
    inherited Destroy;
  end;

{
  destructor ENGPSTrackerHistoryFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FgpsTracker) then
      gpsTracker.Free;
    inherited Destroy;
  end;
}

  destructor ENGPSTrackerHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENGPSTrackerHistoryShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FgpsTrackerDateEdit) then
      gpsTrackerDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENGPSTrackerHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENGPSTrackerHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerHistory');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerHistoryRef');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerHistoryShort');
  RemClassRegistry.RegisterXSClass(ENGPSTrackerHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENGPSTrackerHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENGPSTrackerHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENGPSTrackerHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENGPSTrackerHistoryControllerSoapPort), 'http://ksoe.org/ENGPSTrackerHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENGPSTrackerHistoryControllerSoapPort), 'http://ksoe.org/ENGPSTrackerHistoryController/action/ENGPSTrackerHistoryController.%operationName%');


end.
