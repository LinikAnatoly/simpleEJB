unit ENAccumulatorsDistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENAccumulatorsController 
   ,TKTransportRealController 
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

  ENAccumulatorsDistance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorsDistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAccumulatorsDistance = class(TRemotable)
  private
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;
//???
    FaccumulatorsRef : ENAccumulatorsRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property recordDistance : TXSDecimal read FrecordDistance write FrecordDistance; 
    property recordtDate : TXSDate read FrecordtDate write FrecordtDate;
    property accumulatorsRef : ENAccumulatorsRef read FaccumulatorsRef write FaccumulatorsRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
  end;
  
{
  ENAccumulatorsDistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;
//???
    FaccumulatorsRef : ENAccumulatorsRef;
//???
    FtransportRealRef : TKTransportRealRef;
//???
    FtravelSheetRef : ENTravelSheetRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property recordDistance : TXSDecimal read FrecordDistance write FrecordDistance; 
    property recordtDate : TXSDate read FrecordtDate write FrecordtDate;
    property accumulatorsRef : ENAccumulatorsRef read FaccumulatorsRef write FaccumulatorsRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
  end;
}

  ENAccumulatorsDistanceFilter = class(ENAccumulatorsDistance)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAccumulatorsDistanceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;	
    FaccumulatorsRefCode : Integer; 
    FaccumulatorsRefName : WideString;
    FaccumulatorsRefTypeName : WideString;
    FaccumulatorsRefFactory : WideString;
    FaccumulatorsRefGarageNumber : WideString;
    FaccumulatorsRefYearProduction : WideString;
    FaccumulatorsRefSerialNumber : WideString;
    FaccumulatorsRefReceiptDate : TXSDate;
    FaccumulatorsRefMileage : TXSDecimal;
    FaccumulatorsRefMileageAll : TXSDecimal;
    FaccumulatorsRefPotencial : TXSDecimal;
    FtransportRealRefCode : Integer; 
    FtravelSheetRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property recordDistance : TXSDecimal read FrecordDistance write FrecordDistance; 
    property recordtDate : TXSDate read FrecordtDate write FrecordtDate;

    property accumulatorsRefCode : Integer read FaccumulatorsRefCode write FaccumulatorsRefCode; 
    property accumulatorsRefName : WideString read FaccumulatorsRefName write FaccumulatorsRefName; 
    property accumulatorsRefTypeName : WideString read FaccumulatorsRefTypeName write FaccumulatorsRefTypeName; 
    property accumulatorsRefFactory : WideString read FaccumulatorsRefFactory write FaccumulatorsRefFactory; 
    property accumulatorsRefGarageNumber : WideString read FaccumulatorsRefGarageNumber write FaccumulatorsRefGarageNumber; 
    property accumulatorsRefYearProduction : WideString read FaccumulatorsRefYearProduction write FaccumulatorsRefYearProduction; 
    property accumulatorsRefSerialNumber : WideString read FaccumulatorsRefSerialNumber write FaccumulatorsRefSerialNumber; 
    property accumulatorsRefReceiptDate : TXSDate read FaccumulatorsRefReceiptDate write FaccumulatorsRefReceiptDate; 
    property accumulatorsRefMileage : TXSDecimal read FaccumulatorsRefMileage write FaccumulatorsRefMileage; 
    property accumulatorsRefMileageAll : TXSDecimal read FaccumulatorsRefMileageAll write FaccumulatorsRefMileageAll; 
    property accumulatorsRefPotencial : TXSDecimal read FaccumulatorsRefPotencial write FaccumulatorsRefPotencial; 
    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode; //TKTransportRealRef read FtransportRealRefCode write FtransportRealRefCode; 
    property travelSheetRefCode : Integer read FtravelSheetRefCode write FtravelSheetRefCode; //ENTravelSheetRef read FtravelSheetRefCode write FtravelSheetRefCode; 
  end;

  ArrayOfENAccumulatorsDistanceShort = array of ENAccumulatorsDistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAccumulatorsDistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAccumulatorsDistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAccumulatorsDistanceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAccumulatorsDistanceController/message/
  // soapAction: http://ksoe.org/ENAccumulatorsDistanceController/action/ENAccumulatorsDistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAccumulatorsDistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAccumulatorsDistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAccumulatorsDistanceControllerSoapPort = interface(IInvokable)
  ['{110e110e-110e-110e-110e-110e110e110e}']
    function  add(const aENAccumulatorsDistance: ENAccumulatorsDistance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAccumulatorsDistance: ENAccumulatorsDistance); stdcall;
    function  getObject(const anObjectCode: Integer): ENAccumulatorsDistance; stdcall;
    function  getList: ENAccumulatorsDistanceShortList; stdcall;
    function  getFilteredList(const aENAccumulatorsDistanceFilter: ENAccumulatorsDistanceFilter): ENAccumulatorsDistanceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsDistanceShortList; stdcall;
    function  getScrollableFilteredList(const aENAccumulatorsDistanceFilter: ENAccumulatorsDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsDistanceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAccumulatorsDistanceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAccumulatorsDistanceFilter: ENAccumulatorsDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAccumulatorsDistance.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FaccumulatorsRef) then
      accumulatorsRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAccumulatorsDistanceFilter.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FaccumulatorsRef) then
      accumulatorsRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAccumulatorsDistanceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAccumulatorsDistanceShort.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FaccumulatorsRefReceiptDate) then
      accumulatorsRefReceiptDate.Free;
    if Assigned(FaccumulatorsRefMileage) then
      accumulatorsRefMileage.Free;
    if Assigned(FaccumulatorsRefMileageAll) then
      accumulatorsRefMileageAll.Free;
    if Assigned(FaccumulatorsRefPotencial) then
      accumulatorsRefPotencial.Free;
    inherited Destroy;
  end; 
  
  destructor ENAccumulatorsDistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAccumulatorsDistance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsDistance');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsDistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsDistanceRef');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsDistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsDistanceFilter');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsDistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsDistanceShort');
  RemClassRegistry.RegisterXSClass(ENAccumulatorsDistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAccumulatorsDistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAccumulatorsDistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAccumulatorsDistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAccumulatorsDistanceControllerSoapPort), 'http://ksoe.org/ENAccumulatorsDistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAccumulatorsDistanceControllerSoapPort), 'http://ksoe.org/ENAccumulatorsDistanceController/action/ENAccumulatorsDistanceController.%operationName%');


end.
