unit ENTransportRealFuelRemainsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKFuelTypeController 
   ,TKTransportRealController
   , ENTravelSheetFuelTypeController 
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

  ENTransportRealFuelRemains            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRealFuelRemainsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransportRealFuelRemains = class(TRemotable)
  private
    Fcode : Integer; 
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
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
    FfuelTypeRef : TKFuelTypeRef;
//???
    FrealTransport : TKTransportReal;
///???
    FtravelSheetFuelTypeRef : ENTravelSheetFuelTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
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
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport;
    property travelSheetFuelTypeRef : ENTravelSheetFuelTypeRef read FtravelSheetFuelTypeRef write FtravelSheetFuelTypeRef;
  end;
  
{
  ENTransportRealFuelRemainsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
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
    FfuelTypeRef : TKFuelTypeRef;
//???
    FrealTransport : TKTransportReal;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
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
    property fuelTypeRef : TKFuelTypeRef read FfuelTypeRef write FfuelTypeRef; 
    property realTransport : TKTransportReal read FrealTransport write FrealTransport; 
  end;
}

  ENTransportRealFuelRemainsFilter = class(ENTransportRealFuelRemains)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTransportRealFuelRemainsShort = class(TRemotable)
  private
    Fcode : Integer; 
    FdateStart : TXSDate;	
    FdateFinal : TXSDate;	
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
    FfuelTypeRefCode : Integer; 
    FfuelTypeRefName : WideString;
    FrealTransportCode : Integer; 
    FrealTransportName : WideString;
    FrealTransportInvNumber : WideString;
    FrealTransportGosNumber : WideString;
    FtravelSheetFuelTypeRefCode : Integer;
    FtravelSheetFuelTypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
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

    property fuelTypeRefCode : Integer read FfuelTypeRefCode write FfuelTypeRefCode; 
    property fuelTypeRefName : WideString read FfuelTypeRefName write FfuelTypeRefName; 
    property realTransportCode : Integer read FrealTransportCode write FrealTransportCode; 
    property realTransportName : WideString read FrealTransportName write FrealTransportName; 
    property realTransportInvNumber : WideString read FrealTransportInvNumber write FrealTransportInvNumber; 
    property realTransportGosNumber : WideString read FrealTransportGosNumber write FrealTransportGosNumber;
    property travelSheetFuelTypeRefCode : Integer read FtravelSheetFuelTypeRefCode write FtravelSheetFuelTypeRefCode;
    property travelSheetFuelTypeRefName : WideString read FtravelSheetFuelTypeRefName write FtravelSheetFuelTypeRefName; 
  end;

  ArrayOfENTransportRealFuelRemainsShort = array of ENTransportRealFuelRemainsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransportRealFuelRemainsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransportRealFuelRemainsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransportRealFuelRemainsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransportRealFuelRemainsController/message/
  // soapAction: http://ksoe.org/ENTransportRealFuelRemainsController/action/ENTransportRealFuelRemainsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransportRealFuelRemainsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransportRealFuelRemainsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransportRealFuelRemainsControllerSoapPort = interface(IInvokable)
  ['{dfbbdfbb-dfbb-dfbb-dfbb-dfbbdfbbdfbb}']
    function  add(const aENTransportRealFuelRemains: ENTransportRealFuelRemains): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransportRealFuelRemains: ENTransportRealFuelRemains); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransportRealFuelRemains; stdcall;
    function  getList: ENTransportRealFuelRemainsShortList; stdcall;
    function  getFilteredList(const aENTransportRealFuelRemainsFilter: ENTransportRealFuelRemainsFilter): ENTransportRealFuelRemainsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealFuelRemainsShortList; stdcall;
    function  getScrollableFilteredList(const aENTransportRealFuelRemainsFilter: ENTransportRealFuelRemainsFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealFuelRemainsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransportRealFuelRemainsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTransportRealFuelRemainsFilter: ENTransportRealFuelRemainsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENTransportRealFuelRemains.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
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
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    if Assigned(FtravelSheetFuelTypeRef) then
      travelSheetFuelTypeRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTransportRealFuelRemainsFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
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
    if Assigned(FfuelTypeRef) then
      fuelTypeRef.Free;
    if Assigned(FrealTransport) then
      realTransport.Free;
    inherited Destroy;
  end; 
}

  destructor ENTransportRealFuelRemainsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTransportRealFuelRemainsShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
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
    inherited Destroy;
  end; 
  
  destructor ENTransportRealFuelRemainsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransportRealFuelRemains, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealFuelRemains');
  RemClassRegistry.RegisterXSClass(ENTransportRealFuelRemainsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealFuelRemainsRef');
  RemClassRegistry.RegisterXSClass(ENTransportRealFuelRemainsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealFuelRemainsFilter');
  RemClassRegistry.RegisterXSClass(ENTransportRealFuelRemainsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealFuelRemainsShort');
  RemClassRegistry.RegisterXSClass(ENTransportRealFuelRemainsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransportRealFuelRemainsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransportRealFuelRemainsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransportRealFuelRemainsShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransportRealFuelRemainsControllerSoapPort), 'http://ksoe.org/ENTransportRealFuelRemainsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransportRealFuelRemainsControllerSoapPort), 'http://ksoe.org/ENTransportRealFuelRemainsController/action/ENTransportRealFuelRemainsController.%operationName%');


end.
