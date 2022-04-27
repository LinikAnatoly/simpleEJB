unit ENTravelSheetFuelFillController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
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

  ENTravelSheetFuelFill            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelFillRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelFill = class(TRemotable)
  private
    Fcode : Integer;
    Freg_id : Integer;
    FtimeGen : TXSDateTime;
    FcountGen : TXSDecimal;
    FtimeReceived : TXSDateTime;
    Fmodify_time : Int64;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  reg_id : Integer read Freg_id write Freg_id;
    property timeGen : TXSDateTime read FtimeGen write FtimeGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property timeReceived : TXSDateTime read FtimeReceived write FtimeReceived;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
  end;

{
  ENTravelSheetFuelFillFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Freg_id : Integer;
    FtimeGen : DateTime;
    FcountGen : TXSDecimal;
    FtimeReceived : DateTime;
    Fmodify_time : Int64;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  reg_id : Integer read Freg_id write Freg_id;
    property timeGen : DateTime;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property timeReceived : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef;
  end;
}

  ENTravelSheetFuelFillFilter = class(ENTravelSheetFuelFill)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTravelSheetFuelFillShort = class(TRemotable)
  private
    Fcode : Integer;
    FtimeGen : TXSDateTime;
    FcountGen : TXSDecimal;
    FtimeReceived : TXSDateTime;
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
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property timeGen : TXSDateTime read FtimeGen write FtimeGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property timeReceived : TXSDateTime read FtimeReceived write FtimeReceived;

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
  end;

  ArrayOfENTravelSheetFuelFillShort = array of ENTravelSheetFuelFillShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetFuelFillShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetFuelFillShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetFuelFillShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetFuelFillController/message/
  // soapAction: http://ksoe.org/ENTravelSheetFuelFillController/action/ENTravelSheetFuelFillController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetFuelFillControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetFuelFillController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetFuelFillControllerSoapPort = interface(IInvokable)
  ['{30c230c2-30c2-30c2-30c2-30c230c230c2}']
    function add(const aENTravelSheetFuelFill: ENTravelSheetFuelFill): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetFuelFill: ENTravelSheetFuelFill); stdcall;
    function getObject(const anObjectCode: Integer): ENTravelSheetFuelFill; stdcall;
    function getList: ENTravelSheetFuelFillShortList; stdcall;
    function getFilteredList(const aENTravelSheetFuelFillFilter: ENTravelSheetFuelFillFilter): ENTravelSheetFuelFillShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelFillShortList; stdcall;
    function getScrollableFilteredList(const aENTravelSheetFuelFillFilter: ENTravelSheetFuelFillFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelFillShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelFillShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTravelSheetFuelFillFilter: ENTravelSheetFuelFillFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTravelSheetFuelFillShort; stdcall;
  end;


implementation

  destructor ENTravelSheetFuelFill.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeReceived) then
      timeReceived.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;

{
  destructor ENTravelSheetFuelFillFilter.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeReceived) then
      timeReceived.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;
}

  destructor ENTravelSheetFuelFillFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTravelSheetFuelFillShort.Destroy;
  begin
    if Assigned(FtimeGen) then
      timeGen.Free;
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FtimeReceived) then
      timeReceived.Free;
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

  destructor ENTravelSheetFuelFillShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFill, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFill');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFillRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFillRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFillFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFillFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFillShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFillShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelFillShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelFillShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetFuelFillShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetFuelFillShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetFuelFillControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelFillController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetFuelFillControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelFillController/action/ENTravelSheetFuelFillController.%operationName%');


end.
