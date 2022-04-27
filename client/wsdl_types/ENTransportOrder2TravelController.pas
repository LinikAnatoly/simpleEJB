unit ENTransportOrder2TravelController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENTransportOrderController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENTransportOrder2Travel            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrder2TravelRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportOrder2Travel = class(TRemotable)
  private
    Fcode : Integer;
//???
    Ftransportorder : ENTransportOrder;
//???
    Ftravelsheet : ENTravelSheet;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property transportorder : ENTransportOrder read Ftransportorder write Ftransportorder;
    property travelsheet : ENTravelSheet read Ftravelsheet write Ftravelsheet;
  end;

{
  ENTransportOrder2TravelFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
//???
    Ftransportorder : ENTransportOrder;
//???
    Ftravelsheet : ENTravelSheet;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property transportorder : ENTransportOrder read Ftransportorder write Ftransportorder;
    property travelsheet : ENTravelSheet read Ftravelsheet write Ftravelsheet;
  end;
}

  ENTransportOrder2TravelFilter = class(ENTransportOrder2Travel)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENTransportOrder2TravelShort = class(TRemotable)
  private
    Fcode : Integer;
    FtransportorderCode : Integer;
    FtransportorderNumbergen : WideString;
    FtransportorderTimeStart : TXSDateTime;
    FtransportorderTimeFinal : TXSDateTime;
    FtransportorderDateStart : TXSDateTime;
    FtransportorderDateFinal : TXSDateTime;
    FtransportorderIsAssignment : Integer;
    FtransportorderDateEdit : TXSDateTime;
    FtransportorderUserGen : WideString;
    FtravelsheetCode : Integer;
    FtravelsheetNumberGen : WideString;
    FtravelsheetDateStart : TXSDate;
    FtravelsheetDateFinal : TXSDate;
    FtravelsheetSpeedometerStart : TXSDecimal;
    FtravelsheetSpeedometerFinal : TXSDecimal;
    FtravelsheetFuelCounterStart : TXSDecimal;
    FtravelsheetFuelCounterFinal : TXSDecimal;
    FtravelsheetTimeStart : TXSDateTime;
    FtravelsheetTimeFinal : TXSDateTime;
    FtravelsheetDateEdit : TXSDateTime;
    FtravelsheetUserGen : WideString;
    FtravelsheetIsPrinted : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;

    property transportorderCode : Integer read FtransportorderCode write FtransportorderCode;
    property transportorderNumbergen : WideString read FtransportorderNumbergen write FtransportorderNumbergen;
    property transportorderTimeStart : TXSDateTime read FtransportorderTimeStart write FtransportorderTimeStart;
    property transportorderTimeFinal : TXSDateTime read FtransportorderTimeFinal write FtransportorderTimeFinal;
    property transportorderDateStart : TXSDateTime read FtransportorderDateStart write FtransportorderDateStart;
    property transportorderDateFinal : TXSDateTime read FtransportorderDateFinal write FtransportorderDateFinal;
    property transportorderIsAssignment : Integer read FtransportorderIsAssignment write FtransportorderIsAssignment;
    property transportorderDateEdit : TXSDateTime read FtransportorderDateEdit write FtransportorderDateEdit;
    property transportorderUserGen : WideString read FtransportorderUserGen write FtransportorderUserGen;
    property travelsheetCode : Integer read FtravelsheetCode write FtravelsheetCode;
    property travelsheetNumberGen : WideString read FtravelsheetNumberGen write FtravelsheetNumberGen;
    property travelsheetDateStart : TXSDate read FtravelsheetDateStart write FtravelsheetDateStart;
    property travelsheetDateFinal : TXSDate read FtravelsheetDateFinal write FtravelsheetDateFinal;
    property travelsheetSpeedometerStart : TXSDecimal read FtravelsheetSpeedometerStart write FtravelsheetSpeedometerStart;
    property travelsheetSpeedometerFinal : TXSDecimal read FtravelsheetSpeedometerFinal write FtravelsheetSpeedometerFinal;
    property travelsheetFuelCounterStart : TXSDecimal read FtravelsheetFuelCounterStart write FtravelsheetFuelCounterStart;
    property travelsheetFuelCounterFinal : TXSDecimal read FtravelsheetFuelCounterFinal write FtravelsheetFuelCounterFinal;
    property travelsheetTimeStart : TXSDateTime read FtravelsheetTimeStart write FtravelsheetTimeStart;
    property travelsheetTimeFinal : TXSDateTime read FtravelsheetTimeFinal write FtravelsheetTimeFinal;
    property travelsheetDateEdit : TXSDateTime read FtravelsheetDateEdit write FtravelsheetDateEdit;
    property travelsheetUserGen : WideString read FtravelsheetUserGen write FtravelsheetUserGen;
    property travelsheetIsPrinted : Integer read FtravelsheetIsPrinted write FtravelsheetIsPrinted;
  end;

  ArrayOfENTransportOrder2TravelShort = array of ENTransportOrder2TravelShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportOrder2TravelShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportOrder2TravelShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportOrder2TravelShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportOrder2TravelController/message/
  // soapAction: http://ksoe.org/ENTransportOrder2TravelController/action/ENTransportOrder2TravelController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportOrder2TravelControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportOrder2TravelController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportOrder2TravelControllerSoapPort = interface(IInvokable)
  ['{12301230-1230-1230-1230-123012301230}']
    function add(const aENTransportOrder2Travel: ENTransportOrder2Travel): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportOrder2Travel: ENTransportOrder2Travel); stdcall;
    function getObject(const anObjectCode: Integer): ENTransportOrder2Travel; stdcall;
    function getList: ENTransportOrder2TravelShortList; stdcall;
    function getFilteredList(const aENTransportOrder2TravelFilter: ENTransportOrder2TravelFilter): ENTransportOrder2TravelShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TravelShortList; stdcall;
    function getScrollableFilteredList(const aENTransportOrder2TravelFilter: ENTransportOrder2TravelFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TravelShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportOrder2TravelShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENTransportOrder2TravelFilter: ENTransportOrder2TravelFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENTransportOrder2TravelShort; stdcall;
  end;


implementation

  destructor ENTransportOrder2Travel.Destroy;
  begin
    if Assigned(Ftransportorder) then
      transportorder.Free;
    if Assigned(Ftravelsheet) then
      travelsheet.Free;
    inherited Destroy;
  end;

{
  destructor ENTransportOrder2TravelFilter.Destroy;
  begin
    if Assigned(Ftransportorder) then
      transportorder.Free;
    if Assigned(Ftravelsheet) then
      travelsheet.Free;
    inherited Destroy;
  end;
}

  destructor ENTransportOrder2TravelFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENTransportOrder2TravelShort.Destroy;
  begin
    if Assigned(FtransportorderTimeStart) then
      transportorderTimeStart.Free;
    if Assigned(FtransportorderTimeFinal) then
      transportorderTimeFinal.Free;
    if Assigned(FtransportorderDateStart) then
      transportorderDateStart.Free;
    if Assigned(FtransportorderDateFinal) then
      transportorderDateFinal.Free;
    if Assigned(FtransportorderDateEdit) then
      transportorderDateEdit.Free;
    if Assigned(FtravelsheetDateStart) then
      travelsheetDateStart.Free;
    if Assigned(FtravelsheetDateFinal) then
      travelsheetDateFinal.Free;
    if Assigned(FtravelsheetSpeedometerStart) then
      travelsheetSpeedometerStart.Free;
    if Assigned(FtravelsheetSpeedometerFinal) then
      travelsheetSpeedometerFinal.Free;
    if Assigned(FtravelsheetFuelCounterStart) then
      travelsheetFuelCounterStart.Free;
    if Assigned(FtravelsheetFuelCounterFinal) then
      travelsheetFuelCounterFinal.Free;
    if Assigned(FtravelsheetTimeStart) then
      travelsheetTimeStart.Free;
    if Assigned(FtravelsheetTimeFinal) then
      travelsheetTimeFinal.Free;
    if Assigned(FtravelsheetDateEdit) then
      travelsheetDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENTransportOrder2TravelShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportOrder2Travel, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2Travel');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TravelRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TravelRef');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TravelFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TravelFilter');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TravelShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TravelShort');
  RemClassRegistry.RegisterXSClass(ENTransportOrder2TravelShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportOrder2TravelShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportOrder2TravelShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportOrder2TravelShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportOrder2TravelControllerSoapPort), 'http://ksoe.org/ENTransportOrder2TravelController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportOrder2TravelControllerSoapPort), 'http://ksoe.org/ENTransportOrder2TravelController/action/ENTransportOrder2TravelController.%operationName%');


end.
