unit ENTravelSheetFuelRemainsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTravelSheetController 
   ,TKFuelTypeController 
   ,TKTransportRealController
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
  // !:EPCalculatorShortList - "http://ksoe.org/EnergyproControllerService/type/"
  // !:EPCalculatorFilter - "http://ksoe.org/EnergyproControllerService/type/"

  ENTravelSheetFuelRemains            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelRemainsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetFuelRemains = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;
    FcountGenStart : TXSDecimal;
    FpriceGenStart : TXSDecimal;
    FsumGenStart : TXSDecimal;
    FcountGenIn : TXSDecimal;
    FpriceGenIn : TXSDecimal;
    FsumGenIn : TXSDecimal;
    FcountGenOut : TXSDecimal;
    FpriceGenOut : TXSDecimal;
    FsumGenOut : TXSDecimal;
    FcountGenFinal : TXSDecimal;
    FpriceGenFinal : TXSDecimal;
    FsumGenFinal : TXSDecimal;
    Fmodify_time : Int64;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FrealTransport : TKTransportReal;
//???
    FtravelSheetFuelTypeRef : ENTravelSheetFuelTypeRef;
    FisThirdParty : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGenStart : TXSDecimal read FcountGenStart write FcountGenStart; 
    property priceGenStart : TXSDecimal read FpriceGenStart write FpriceGenStart; 
    property sumGenStart : TXSDecimal read FsumGenStart write FsumGenStart; 
    property countGenIn : TXSDecimal read FcountGenIn write FcountGenIn; 
    property priceGenIn : TXSDecimal read FpriceGenIn write FpriceGenIn; 
    property sumGenIn : TXSDecimal read FsumGenIn write FsumGenIn; 
    property countGenOut : TXSDecimal read FcountGenOut write FcountGenOut; 
    property priceGenOut : TXSDecimal read FpriceGenOut write FpriceGenOut; 
    property sumGenOut : TXSDecimal read FsumGenOut write FsumGenOut; 
    property countGenFinal : TXSDecimal read FcountGenFinal write FcountGenFinal; 
    property priceGenFinal : TXSDecimal read FpriceGenFinal write FpriceGenFinal; 
    property sumGenFinal : TXSDecimal read FsumGenFinal write FsumGenFinal; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
    property travelSheetFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelSheetFuelTypeRef write FtravelSheetFuelTypeRef;
    property isThirdParty : TXSBoolean read FisThirdParty write FisThirdParty;
  end;
  
{
  ENTravelSheetFuelRemainsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateGen : TXSDate;
    FcountGenStart : TXSDecimal;
    FpriceGenStart : TXSDecimal;
    FsumGenStart : TXSDecimal;
    FcountGenIn : TXSDecimal;
    FpriceGenIn : TXSDecimal;
    FsumGenIn : TXSDecimal;
    FcountGenOut : TXSDecimal;
    FpriceGenOut : TXSDecimal;
    FsumGenOut : TXSDecimal;
    FcountGenFinal : TXSDecimal;
    FpriceGenFinal : TXSDecimal;
    FsumGenFinal : TXSDecimal;
    Fmodify_time : Int64;
//???
    FtravelSheetRef : ENTravelSheetRef;
//???
    FfuelTypeRef : TKFuelTypeRef;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGenStart : TXSDecimal read FcountGenStart write FcountGenStart; 
    property priceGenStart : TXSDecimal read FpriceGenStart write FpriceGenStart; 
    property sumGenStart : TXSDecimal read FsumGenStart write FsumGenStart; 
    property countGenIn : TXSDecimal read FcountGenIn write FcountGenIn; 
    property priceGenIn : TXSDecimal read FpriceGenIn write FpriceGenIn; 
    property sumGenIn : TXSDecimal read FsumGenIn write FsumGenIn; 
    property countGenOut : TXSDecimal read FcountGenOut write FcountGenOut; 
    property priceGenOut : TXSDecimal read FpriceGenOut write FpriceGenOut; 
    property sumGenOut : TXSDecimal read FsumGenOut write FsumGenOut; 
    property countGenFinal : TXSDecimal read FcountGenFinal write FcountGenFinal; 
    property priceGenFinal : TXSDecimal read FpriceGenFinal write FpriceGenFinal; 
    property sumGenFinal : TXSDecimal read FsumGenFinal write FsumGenFinal; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
}

  ENTravelSheetFuelRemainsFilter = class(ENTravelSheetFuelRemains)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetFuelRemainsShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateGen : TXSDate;	
    FcountGenStart : TXSDecimal;
    FpriceGenStart : TXSDecimal;
    FsumGenStart : TXSDecimal;
    FcountGenIn : TXSDecimal;
    FpriceGenIn : TXSDecimal;
    FsumGenIn : TXSDecimal;
    FcountGenOut : TXSDecimal;
    FpriceGenOut : TXSDecimal;
    FsumGenOut : TXSDecimal;
    FcountGenFinal : TXSDecimal;
    FpriceGenFinal : TXSDecimal;
    FsumGenFinal : TXSDecimal;
    FtravelSheetRefCode : Integer; 
    FtravelSheetRefNumberGen : WideString;
    FtravelSheetRefDateStart : TXSDate;
    FtravelSheetRefDateFinal : TXSDate;
    FtravelSheetRefSpeedometerStart : TXSDecimal;
    FtravelSheetRefSpeedometerFinal : TXSDecimal;
    FtravelSheetRefTimeStart : TXSDateTime;	
    FtravelSheetRefTimeFinal : TXSDateTime;	
    FtravelSheetRefDateEdit : TXSDateTime;	
    FtravelSheetRefUserGen : WideString;
    FfuelTypeRefCode : Integer; 
    FfuelTypeRefName : WideString;
    FrealTransportCode : Integer;
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
    FtravelSheetFuelTypeRefCode : Integer;
    FtravelSheetFuelTypeRefName : WideString;
    FisThirdParty : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property countGenStart : TXSDecimal read FcountGenStart write FcountGenStart; 
    property priceGenStart : TXSDecimal read FpriceGenStart write FpriceGenStart; 
    property sumGenStart : TXSDecimal read FsumGenStart write FsumGenStart; 
    property countGenIn : TXSDecimal read FcountGenIn write FcountGenIn; 
    property priceGenIn : TXSDecimal read FpriceGenIn write FpriceGenIn; 
    property sumGenIn : TXSDecimal read FsumGenIn write FsumGenIn; 
    property countGenOut : TXSDecimal read FcountGenOut write FcountGenOut; 
    property priceGenOut : TXSDecimal read FpriceGenOut write FpriceGenOut; 
    property sumGenOut : TXSDecimal read FsumGenOut write FsumGenOut; 
    property countGenFinal : TXSDecimal read FcountGenFinal write FcountGenFinal; 
    property priceGenFinal : TXSDecimal read FpriceGenFinal write FpriceGenFinal; 
    property sumGenFinal : TXSDecimal read FsumGenFinal write FsumGenFinal; 

    property travelSheetRefCode : Integer read FtravelSheetRefCode write FtravelSheetRefCode; 
    property travelSheetRefNumberGen : WideString read FtravelSheetRefNumberGen write FtravelSheetRefNumberGen; 
    property travelSheetRefDateStart : TXSDate read FtravelSheetRefDateStart write FtravelSheetRefDateStart; 
    property travelSheetRefDateFinal : TXSDate read FtravelSheetRefDateFinal write FtravelSheetRefDateFinal; 
    property travelSheetRefSpeedometerStart : TXSDecimal read FtravelSheetRefSpeedometerStart write FtravelSheetRefSpeedometerStart; 
    property travelSheetRefSpeedometerFinal : TXSDecimal read FtravelSheetRefSpeedometerFinal write FtravelSheetRefSpeedometerFinal; 
    property travelSheetRefTimeStart : TXSDateTime read FtravelSheetRefTimeStart write FtravelSheetRefTimeStart; 
    property travelSheetRefTimeFinal : TXSDateTime read FtravelSheetRefTimeFinal write FtravelSheetRefTimeFinal; 
    property travelSheetRefDateEdit : TXSDateTime read FtravelSheetRefDateEdit write FtravelSheetRefDateEdit; 
    property travelSheetRefUserGen : WideString read FtravelSheetRefUserGen write FtravelSheetRefUserGen; 
    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode; 
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName; 
    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode; 
    property realTransportName : WideString read FrealTransportName write FrealTransportName; 
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber; 
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
    property travelSheetFuelTypeRefCode : Integer read FtravelSheetFuelTypeRefCode write FtravelSheetFuelTypeRefCode;
    property travelSheetFuelTypeRefName : WideString read FtravelSheetFuelTypeRefName write FtravelSheetFuelTypeRefName;
    property isThirdParty : TXSBoolean read FisThirdParty write FisThirdParty;
  end;

  ArrayOfENTravelSheetFuelRemainsShort = array of ENTravelSheetFuelRemainsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetFuelRemainsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetFuelRemainsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetFuelRemainsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetFuelRemainsController/message/
  // soapAction: http://ksoe.org/ENTravelSheetFuelRemainsController/action/ENTravelSheetFuelRemainsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetFuelRemainsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetFuelRemainsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetFuelRemainsControllerSoapPort = interface(IInvokable)
  ['{1c1e1c1e-1c1e-1c1e-1c1e-1c1e1c1e1c1e}']
    function  add(const aENTravelSheetFuelRemains: ENTravelSheetFuelRemains): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetFuelRemains: ENTravelSheetFuelRemains); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetFuelRemains; stdcall;
    function  getList: ENTravelSheetFuelRemainsShortList; stdcall;
    function  getFilteredList(const aENTravelSheetFuelRemainsFilter: ENTravelSheetFuelRemainsFilter): ENTravelSheetFuelRemainsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelRemainsShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetFuelRemainsFilter: ENTravelSheetFuelRemainsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelRemainsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetFuelRemainsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTravelSheetFuelRemainsFilter: ENTravelSheetFuelRemainsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTravelSheetFuelRemains.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGenStart) then
      countGenStart.Free;
    if Assigned(FpriceGenStart) then
      priceGenStart.Free;
    if Assigned(FsumGenStart) then
      sumGenStart.Free;
    if Assigned(FcountGenIn) then
      countGenIn.Free;
    if Assigned(FpriceGenIn) then
      priceGenIn.Free;
    if Assigned(FsumGenIn) then
      sumGenIn.Free;
    if Assigned(FcountGenOut) then
      countGenOut.Free;
    if Assigned(FpriceGenOut) then
      priceGenOut.Free;
    if Assigned(FsumGenOut) then
      sumGenOut.Free;
    if Assigned(FcountGenFinal) then
      countGenFinal.Free;
    if Assigned(FpriceGenFinal) then
      priceGenFinal.Free;
    if Assigned(FsumGenFinal) then
      sumGenFinal.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FtravelSheetFuelTypeRef) then
      travelSheetFuelTypeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTravelSheetFuelRemainsFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGenStart) then
      countGenStart.Free;
    if Assigned(FpriceGenStart) then
      priceGenStart.Free;
    if Assigned(FsumGenStart) then
      sumGenStart.Free;
    if Assigned(FcountGenIn) then
      countGenIn.Free;
    if Assigned(FpriceGenIn) then
      priceGenIn.Free;
    if Assigned(FsumGenIn) then
      sumGenIn.Free;
    if Assigned(FcountGenOut) then
      countGenOut.Free;
    if Assigned(FpriceGenOut) then
      priceGenOut.Free;
    if Assigned(FsumGenOut) then
      sumGenOut.Free;
    if Assigned(FcountGenFinal) then
      countGenFinal.Free;
    if Assigned(FpriceGenFinal) then
      priceGenFinal.Free;
    if Assigned(FsumGenFinal) then
      sumGenFinal.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end; 
}

  destructor ENTravelSheetFuelRemainsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTravelSheetFuelRemainsShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FcountGenStart) then
      countGenStart.Free;
    if Assigned(FpriceGenStart) then
      priceGenStart.Free;
    if Assigned(FsumGenStart) then
      sumGenStart.Free;
    if Assigned(FcountGenIn) then
      countGenIn.Free;
    if Assigned(FpriceGenIn) then
      priceGenIn.Free;
    if Assigned(FsumGenIn) then
      sumGenIn.Free;
    if Assigned(FcountGenOut) then
      countGenOut.Free;
    if Assigned(FpriceGenOut) then
      priceGenOut.Free;
    if Assigned(FsumGenOut) then
      sumGenOut.Free;
    if Assigned(FcountGenFinal) then
      countGenFinal.Free;
    if Assigned(FpriceGenFinal) then
      priceGenFinal.Free;
    if Assigned(FsumGenFinal) then
      sumGenFinal.Free;
    if Assigned(FtravelSheetRefDateStart) then
      travelSheetRefDateStart.Free;
    if Assigned(FtravelSheetRefDateFinal) then
      travelSheetRefDateFinal.Free;
    if Assigned(FtravelSheetRefSpeedometerStart) then
      travelSheetRefSpeedometerStart.Free;
    if Assigned(FtravelSheetRefSpeedometerFinal) then
      travelSheetRefSpeedometerFinal.Free;
    if Assigned(FtravelSheetRefTimeStart) then
      travelSheetRefTimeStart.Free;
    if Assigned(FtravelSheetRefTimeFinal) then
      travelSheetRefTimeFinal.Free;
    if Assigned(FtravelSheetRefDateEdit) then
      travelSheetRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTravelSheetFuelRemainsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRemains, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRemains');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRemainsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRemainsRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRemainsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRemainsFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRemainsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRemainsShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetFuelRemainsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetFuelRemainsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetFuelRemainsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetFuelRemainsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetFuelRemainsControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelRemainsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetFuelRemainsControllerSoapPort), 'http://ksoe.org/ENTravelSheetFuelRemainsController/action/ENTravelSheetFuelRemainsController.%operationName%');


end.
