unit ENTravelSheetFuelController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTravelSheetController
   ,TKTransportRealController
   ,TKFuelTypeController
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

  ENTravelSheetFuel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuel = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    Fseries : WideString;
    Fnumbers : WideString;
    FdateGen : TXSDate;
    FisVRTU : Integer;
    Fmodify_time : Int64;
    FisThirdParty : TXSBoolean;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FrealTransport : TKTransportReal;
//???
    FfuelType : TKFuelType;
//???
    FtravelSheetFuelTypeRef : ENTravelSheetFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property series : WideString read Fseries write Fseries;
    property numbers : WideString read Fnumbers write Fnumbers;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  isVRTU : Integer read FisVRTU write FisVRTU;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
    property fuelType : TKFuelType read FfuelType write FfuelType;
    property travelSheetFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelSheetFuelTypeRef write FtravelSheetFuelTypeRef;
    property isThirdParty : TXSBoolean read FisThirdParty write FisThirdParty;
  end;

{
  ENTravelSheetFuelFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcountGen : TXSDecimal;
    Fseries : WideString;
    Fnumbers : WideString;
    FdateGen : TXSDate;
    FisVRTU : Integer;
    Fmodify_time : Int64;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FrealTransport : TKTransportReal;
//???
    FfuelType : TKFuelType;
//???
    FtravelSheetFuelTypeRef : ENTravelSheetFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property series : WideString read Fseries write Fseries;
    property numbers : WideString read Fnumbers write Fnumbers;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  isVRTU : Integer read FisVRTU write FisVRTU;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
    property fuelType : TKFuelType read FfuelType write FfuelType;
    property travelSheetFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelSheetFuelTypeRef write FtravelSheetFuelTypeRef;
  end;
}

  ENTravelSheetFuelFilter = class(ENTravelSheetFuel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTravelSheetFuelShort = class(TRemotable)
  private
    Fcode : Integer;
    FcountGen : TXSDecimal;
    Fseries : WideString;
    Fnumbers : WideString;
    FdateGen : TXSDate;
    FisVRTU : Integer;
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
    FrealTransportCode : Integer;
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
    FfuelTypeCode : Integer;
    FfuelTypeName : WideString;
    FtravelSheetFuelTypeRefCode : Integer;
    FtravelSheetFuelTypeRefName : WideString;
    FisThirdParty : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property series : WideString read Fseries write Fseries;
    property numbers : WideString read Fnumbers write Fnumbers;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property  isVRTU : Integer read FisVRTU write FisVRTU;

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
    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode;
    property realTransportName : WideString read FrealTransportName write FrealTransportName;
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber;
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
    property fuelTypeCode : Integer read FfuelTypeCode write FfuelTypeCode;
    property fuelTypeName : WideString read FfuelTypeName write FfuelTypeName;
    property travelSheetFuelTypeRefCode : Integer read FtravelSheetFuelTypeRefCode write FtravelSheetFuelTypeRefCode;
    property travelSheetFuelTypeRefName : WideString read FtravelSheetFuelTypeRefName write FtravelSheetFuelTypeRefName;
    property isThirdParty : TXSBoolean read FisThirdParty write FisThirdParty;
  end;

  ArrayOfENTravelSheetFuelShort = array of ENTravelSheetFuelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetFuelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetFuelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetFuelShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetFuelController/message/
  // soapAction: http://ksoe.org/ENTravelSheetFuelController/action/ENTravelSheetFuelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetFuelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetFuelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetFuelControllerSoapPort = interface(IInvokable)
  ['{63f063f0-63f0-63f0-63f0-63f063f063f0}']
    function add(const aENTravelSheetFuel: ENTravelSheetFuel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetFuel: ENTravelSheetFuel); stdcall;
    function getObject(const anObjectCode: Integer): ENTravelSheetFuel; stdcall;
    function getList: ENTravelSheetFuelShortList; stdcall;
    function getFilteredList(const aENTravelSheetFuelFilter: ENTravelSheetFuelFilter): ENTravelSheetFuelShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelShortList; stdcall;
    function getScrollableFilteredList(const aENTravelSheetFuelFilter: ENTravelSheetFuelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTravelSheetFuelFilter: ENTravelSheetFuelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTravelSheetFuelShort; stdcall;
    procedure reloadFuel(const travelsheetfuelcode : Integer); stdcall;
  end;


implementation

  destructor ENTravelSheetFuel.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FtravelSheetFuelTypeRef) then
      travelSheetFuelTypeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTravelSheetFuelFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FtravelSheetFuelTypeRef) then
      travelSheetFuelTypeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTravelSheetFuelFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTravelSheetFuelShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FdateGen) then
      dateGen.Free;
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

  destructor ENTravelSheetFuelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetFuel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuel');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetFuelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetFuelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetFuelControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetFuelControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelController/action/ENTravelSheetFuelController.%operationName%');


end.
