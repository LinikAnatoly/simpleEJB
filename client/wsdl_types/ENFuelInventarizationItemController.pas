unit ENFuelInventarizationItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelInventarizationController
   ,TKFuelTypeController
   ,TKTransportRealController
   ,ENTravelSheetController
   ,ENTravelSheetFuelTypeController
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

  ENFuelInventarizationItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarizationItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelInventarizationItem = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FinventarizationRef : ENFuelInventarizationRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FtravelFuelTypeRef : ENTravelSheetFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property inventarizationRef : ENFuelInventarizationRef read FinventarizationRef write FinventarizationRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property travelFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelFuelTypeRef write FtravelFuelTypeRef;
  end;

{
  ENFuelInventarizationItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FinventarizationRef : ENFuelInventarizationRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FtravelFuelTypeRef : ENTravelSheetFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property inventarizationRef : ENFuelInventarizationRef read FinventarizationRef write FinventarizationRef;
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef;
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property travelFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelFuelTypeRef write FtravelFuelTypeRef;
  end;
}

  ENFuelInventarizationItemFilter = class(ENFuelInventarizationItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelInventarizationItemShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    FcountFact : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FinventarizationRefCode : Integer;
    FinventarizationRefNumberGen : WideString;
    FinventarizationRefDateGen : TXSDateTime;
    FinventarizationRefMolCode : WideString;
    FinventarizationRefMolName : WideString;
    FinventarizationRefCommentGen : WideString;
    FinventarizationRefUserAdd : WideString;
    FinventarizationRefDateAdd : TXSDateTime;
    FinventarizationRefUserGen : WideString;
    FinventarizationRefDateEdit : TXSDateTime;
    FfuelTypeRefCode : Integer;
    FfuelTypeRefName : WideString;
    FtransportRealRefCode : Integer;
    FtransportRealRefName : WideString;
    FtransportRealRefInvNumber : WideString;
    FtransportRealRefGosNumber : WideString;
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
    FtravelFuelTypeRefCode : Integer;
    FtravelFuelTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property countFact : TXSDecimal read FcountFact write FcountFact;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property inventarizationRefCode : Integer read FinventarizationRefCode write FinventarizationRefCode;
    property inventarizationRefNumberGen : WideString read FinventarizationRefNumberGen write FinventarizationRefNumberGen;
    property inventarizationRefDateGen : TXSDateTime read FinventarizationRefDateGen write FinventarizationRefDateGen;
    property inventarizationRefMolCode : WideString read FinventarizationRefMolCode write FinventarizationRefMolCode;
    property inventarizationRefMolName : WideString read FinventarizationRefMolName write FinventarizationRefMolName;
    property inventarizationRefCommentGen : WideString read FinventarizationRefCommentGen write FinventarizationRefCommentGen;
    property inventarizationRefUserAdd : WideString read FinventarizationRefUserAdd write FinventarizationRefUserAdd;
    property inventarizationRefDateAdd : TXSDateTime read FinventarizationRefDateAdd write FinventarizationRefDateAdd;
    property inventarizationRefUserGen : WideString read FinventarizationRefUserGen write FinventarizationRefUserGen;
    property inventarizationRefDateEdit : TXSDateTime read FinventarizationRefDateEdit write FinventarizationRefDateEdit;
    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode;
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName;
    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode;
    property transportRealRefName : WideString read FtransportRealRefName write FtransportRealRefName;
    property transportRealRefInvNumber : WideString read FtransportRealRefInvNumber write FtransportRealRefInvNumber;
    property transportRealRefGosNumber : WideString read FtransportRealRefGosNumber write FtransportRealRefGosNumber;
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
    property travelFuelTypeRefCode : Integer read FtravelFuelTypeRefCode write FtravelFuelTypeRefCode;
    property travelFuelTypeRefName : WideString read FtravelFuelTypeRefName write FtravelFuelTypeRefName;
  end;

  ArrayOfENFuelInventarizationItemShort = array of ENFuelInventarizationItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelInventarizationItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelInventarizationItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelInventarizationItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelInventarizationItemController/message/
  // soapAction: http://ksoe.org/ENFuelInventarizationItemController/action/ENFuelInventarizationItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelInventarizationItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelInventarizationItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelInventarizationItemControllerSoapPort = interface(IInvokable)
  ['{2591FDA4-1981-4357-BAC5-B70EBF4F13B9}']
    function add(const aENFuelInventarizationItem: ENFuelInventarizationItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelInventarizationItem: ENFuelInventarizationItem); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelInventarizationItem; stdcall;
    function getList: ENFuelInventarizationItemShortList; stdcall;
    function getFilteredList(const aENFuelInventarizationItemFilter: ENFuelInventarizationItemFilter): ENFuelInventarizationItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationItemShortList; stdcall;
    function getScrollableFilteredList(const aENFuelInventarizationItemFilter: ENFuelInventarizationItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelInventarizationItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelInventarizationItemFilter: ENFuelInventarizationItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelInventarizationItemShort; stdcall;
    procedure saveCountFact(const aFuelInventarizationItemsArrayOfShort: ArrayOfENFuelInventarizationItemShort); stdcall;
  end;


implementation

  destructor ENFuelInventarizationItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRef) then
      inventarizationRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FtravelFuelTypeRef) then
      travelFuelTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelInventarizationItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRef) then
      inventarizationRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FtravelFuelTypeRef) then
      travelFuelTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelInventarizationItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelInventarizationItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinventarizationRefDateGen) then
      inventarizationRefDateGen.Free;
    if Assigned(FinventarizationRefDateAdd) then
      inventarizationRefDateAdd.Free;
    if Assigned(FinventarizationRefDateEdit) then
      inventarizationRefDateEdit.Free;
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

  destructor ENFuelInventarizationItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelInventarizationItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationItem');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationItemRef');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationItemFilter');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationItemShort');
  RemClassRegistry.RegisterXSClass(ENFuelInventarizationItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelInventarizationItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelInventarizationItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelInventarizationItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelInventarizationItemControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelInventarizationItemControllerSoapPort), 'http://ksoe.org/ENFuelInventarizationItemController/action/ENFuelInventarizationItemController.%operationName%');


end.
