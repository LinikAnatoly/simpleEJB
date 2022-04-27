unit ENCheckpointPassListItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKTransportRealController
   ,ENCheckpointPassListController
   ,ENCheckpointEventTypeController
   ,ENTravelSheetController
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

  ENCheckpointPassListItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointPassListItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENCheckpointPassListItem = class(TRemotable)
  private
    Fcode : Integer;
    FdateEvent : TXSDateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FcheckpointPassListRef : ENCheckpointPassListRef;
//???
    FeventTypeRef : ENCheckpointEventTypeRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateEvent : TXSDateTime read FdateEvent write FdateEvent;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef;
    property checkpointPassListRef : ENCheckpointPassListRef read FcheckpointPassListRef write FcheckpointPassListRef;
    property eventTypeRef : ENCheckpointEventTypeRef read FeventTypeRef write FeventTypeRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
  end;

{
  ENCheckpointPassListItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateEvent : DateTime;
    Fmodify_time : Int64;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FcheckpointPassListRef : ENCheckpointPassListRef;
//???
    FeventTypeRef : ENCheckpointEventTypeRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateEvent : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef;
    property checkpointPassListRef : ENCheckpointPassListRef read FcheckpointPassListRef write FcheckpointPassListRef;
    property eventTypeRef : ENCheckpointEventTypeRef read FeventTypeRef write FeventTypeRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
  end;
}

  ENCheckpointPassListItemFilter = class(ENCheckpointPassListItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENCheckpointPassListItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateEvent : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FtransportRealRefCode : Integer;
    FtransportRealRefName : WideString;
    FtransportRealRefInvNumber : WideString;
    FtransportRealRefGosNumber : WideString;
    FcheckpointPassListRefCode : Integer;
    FcheckpointPassListRefDateStart : TXSDateTime;
    FcheckpointPassListRefDateFinal : TXSDateTime;
    FcheckpointPassListRefUserGen : WideString;
    FcheckpointPassListRefDateEdit : TXSDateTime;
    FeventTypeRefCode : Integer;
    FeventTypeRefName : WideString;
    FtravelSheetRefCode : Integer;
    FtravelSheetRefNumberGen : WideString;
    FtravelSheetRefDateStart : TXSDate;
    FtravelSheetRefDateFinal : TXSDate;
    FtravelSheetRefSpeedometerStart : TXSDecimal;
    FtravelSheetRefSpeedometerFinal : TXSDecimal;
    FtravelSheetRefFuelCounterStart : TXSDecimal;
    FtravelSheetRefFuelCounterFinal : TXSDecimal;
    FtravelSheetRefTimeStart : TXSDateTime;
    FtravelSheetRefTimeFinal : TXSDateTime;
    FtravelSheetRefDateEdit : TXSDateTime;
    FtravelSheetRefUserGen : WideString;
    FcheckpointName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateEvent : TXSDateTime read FdateEvent write FdateEvent;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode;
    property transportRealRefName : WideString read FtransportRealRefName write FtransportRealRefName;
    property transportRealRefInvNumber : WideString read FtransportRealRefInvNumber write FtransportRealRefInvNumber;
    property transportRealRefGosNumber : WideString read FtransportRealRefGosNumber write FtransportRealRefGosNumber;
    property checkpointPassListRefCode : Integer read FcheckpointPassListRefCode write FcheckpointPassListRefCode;
    property checkpointPassListRefDateStart : TXSDateTime read FcheckpointPassListRefDateStart write FcheckpointPassListRefDateStart;
    property checkpointPassListRefDateFinal : TXSDateTime read FcheckpointPassListRefDateFinal write FcheckpointPassListRefDateFinal;
    property checkpointPassListRefUserGen : WideString read FcheckpointPassListRefUserGen write FcheckpointPassListRefUserGen;
    property checkpointPassListRefDateEdit : TXSDateTime read FcheckpointPassListRefDateEdit write FcheckpointPassListRefDateEdit;
    property eventTypeRefCode : Integer read FeventTypeRefCode write FeventTypeRefCode;
    property eventTypeRefName : WideString read FeventTypeRefName write FeventTypeRefName;
    property travelSheetRefCode : Integer read FtravelSheetRefCode write FtravelSheetRefCode;
    property travelSheetRefNumberGen : WideString read FtravelSheetRefNumberGen write FtravelSheetRefNumberGen;
    property travelSheetRefDateStart : TXSDate read FtravelSheetRefDateStart write FtravelSheetRefDateStart;
    property travelSheetRefDateFinal : TXSDate read FtravelSheetRefDateFinal write FtravelSheetRefDateFinal;
    property travelSheetRefSpeedometerStart : TXSDecimal read FtravelSheetRefSpeedometerStart write FtravelSheetRefSpeedometerStart;
    property travelSheetRefSpeedometerFinal : TXSDecimal read FtravelSheetRefSpeedometerFinal write FtravelSheetRefSpeedometerFinal;
    property travelSheetRefFuelCounterStart : TXSDecimal read FtravelSheetRefFuelCounterStart write FtravelSheetRefFuelCounterStart;
    property travelSheetRefFuelCounterFinal : TXSDecimal read FtravelSheetRefFuelCounterFinal write FtravelSheetRefFuelCounterFinal;
    property travelSheetRefTimeStart : TXSDateTime read FtravelSheetRefTimeStart write FtravelSheetRefTimeStart;
    property travelSheetRefTimeFinal : TXSDateTime read FtravelSheetRefTimeFinal write FtravelSheetRefTimeFinal;
    property travelSheetRefDateEdit : TXSDateTime read FtravelSheetRefDateEdit write FtravelSheetRefDateEdit;
    property travelSheetRefUserGen : WideString read FtravelSheetRefUserGen write FtravelSheetRefUserGen;
    property checkpointName  : WideString read FcheckpointName write FcheckpointName;
  end;

  ArrayOfENCheckpointPassListItemShort = array of ENCheckpointPassListItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENCheckpointPassListItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENCheckpointPassListItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENCheckpointPassListItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENCheckpointPassListItemController/message/
  // soapAction: http://ksoe.org/ENCheckpointPassListItemController/action/ENCheckpointPassListItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENCheckpointPassListItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENCheckpointPassListItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENCheckpointPassListItemControllerSoapPort = interface(IInvokable)
  ['{4CBE6D15-F41E-43C5-A2F0-96B90980E5BF}']
    function add(const checkpointPassListItemArr : ArrayOfENCheckpointPassListItemShort {aENCheckpointPassListItem: ENCheckpointPassListItem}): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENCheckpointPassListItem: ENCheckpointPassListItem); stdcall;
    function getObject(const anObjectCode: Integer): ENCheckpointPassListItem; stdcall;
    function getList: ENCheckpointPassListItemShortList; stdcall;
    function getFilteredList(const aENCheckpointPassListItemFilter: ENCheckpointPassListItemFilter): ENCheckpointPassListItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListItemShortList; stdcall;
    function getScrollableFilteredList(const aENCheckpointPassListItemFilter: ENCheckpointPassListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENCheckpointPassListItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENCheckpointPassListItemFilter: ENCheckpointPassListItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENCheckpointPassListItemShort; stdcall;
    procedure addRideIn(const aENCheckpointPassListItem: ENCheckpointPassListItem); stdcall;
    procedure addRideOut(const aENCheckpointPassListItem: ENCheckpointPassListItem); stdcall;
  end;


implementation

  destructor ENCheckpointPassListItem.Destroy;
  begin
    if Assigned(FdateEvent) then
      dateEvent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FcheckpointPassListRef) then
      checkpointPassListRef.Free;
    if Assigned(FeventTypeRef) then
      eventTypeRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;

{
  destructor ENCheckpointPassListItemFilter.Destroy;
  begin
    if Assigned(FdateEvent) then
      dateEvent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FcheckpointPassListRef) then
      checkpointPassListRef.Free;
    if Assigned(FeventTypeRef) then
      eventTypeRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;
}

  destructor ENCheckpointPassListItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENCheckpointPassListItemShort.Destroy;
  begin
    if Assigned(FdateEvent) then
      dateEvent.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FcheckpointPassListRefDateStart) then
      checkpointPassListRefDateStart.Free;
    if Assigned(FcheckpointPassListRefDateFinal) then
      checkpointPassListRefDateFinal.Free;
    if Assigned(FcheckpointPassListRefDateEdit) then
      checkpointPassListRefDateEdit.Free;
    if Assigned(FtravelSheetRefDateStart) then
      travelSheetRefDateStart.Free;
    if Assigned(FtravelSheetRefDateFinal) then
      travelSheetRefDateFinal.Free;
    if Assigned(FtravelSheetRefSpeedometerStart) then
      travelSheetRefSpeedometerStart.Free;
    if Assigned(FtravelSheetRefSpeedometerFinal) then
      travelSheetRefSpeedometerFinal.Free;
    if Assigned(FtravelSheetRefFuelCounterStart) then
      travelSheetRefFuelCounterStart.Free;
    if Assigned(FtravelSheetRefFuelCounterFinal) then
      travelSheetRefFuelCounterFinal.Free;
    if Assigned(FtravelSheetRefTimeStart) then
      travelSheetRefTimeStart.Free;
    if Assigned(FtravelSheetRefTimeFinal) then
      travelSheetRefTimeFinal.Free;
    if Assigned(FtravelSheetRefDateEdit) then
      travelSheetRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENCheckpointPassListItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENCheckpointPassListItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListItem');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListItemRef');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListItemFilter');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListItemShort');
  RemClassRegistry.RegisterXSClass(ENCheckpointPassListItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENCheckpointPassListItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENCheckpointPassListItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENCheckpointPassListItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENCheckpointPassListItemControllerSoapPort), 'http://ksoe.org/ENCheckpointPassListItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENCheckpointPassListItemControllerSoapPort), 'http://ksoe.org/ENCheckpointPassListItemController/action/ENCheckpointPassListItemController.%operationName%');


end.
