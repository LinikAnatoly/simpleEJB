unit ENAutoTiresDistanceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENAutoTiresController 
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

  ENAutoTiresDistance            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresDistanceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAutoTiresDistance = class(TRemotable)
  private
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;
//???
    FtiresRef : ENAutoTiresRef;
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
    property tiresRef : ENAutoTiresRef read FtiresRef write FtiresRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
  end;
  
{
  ENAutoTiresDistanceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;
//???
    FtiresRef : ENAutoTiresRef;
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
    property tiresRef : ENAutoTiresRef read FtiresRef write FtiresRef; 
    property transportRealRef : TKTransportRealRef read FtransportRealRef write FtransportRealRef; 
    property travelSheetRef : ENTravelSheetRef read FtravelSheetRef write FtravelSheetRef; 
  end;
}

  ENAutoTiresDistanceFilter = class(ENAutoTiresDistance)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAutoTiresDistanceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FrecordDistance : TXSDecimal;
    FrecordtDate : TXSDate;	
    FtiresRefCode : Integer; 
    FtiresRefTypeName : WideString;
    FtiresRefGarageNumber : WideString;
    FtiresRefSerialNumber : WideString;
    FtiresRefFactory : WideString;
    FtiresRefPotencial : TXSDecimal;
    FtiresRefDistanceAll : TXSDecimal;
    FtiresRefNominal : WideString;
    FtransportRealRefCode : Integer; 
    FtravelSheetRefCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property recordDistance : TXSDecimal read FrecordDistance write FrecordDistance; 
    property recordtDate : TXSDate read FrecordtDate write FrecordtDate;

    property tiresRefCode : Integer read FtiresRefCode write FtiresRefCode; 
    property tiresRefTypeName : WideString read FtiresRefTypeName write FtiresRefTypeName; 
    property tiresRefGarageNumber : WideString read FtiresRefGarageNumber write FtiresRefGarageNumber; 
    property tiresRefSerialNumber : WideString read FtiresRefSerialNumber write FtiresRefSerialNumber; 
    property tiresRefFactory : WideString read FtiresRefFactory write FtiresRefFactory; 
    property tiresRefPotencial : TXSDecimal read FtiresRefPotencial write FtiresRefPotencial; 
    property tiresRefDistanceAll : TXSDecimal read FtiresRefDistanceAll write FtiresRefDistanceAll; 
    property tiresRefNominal : WideString read FtiresRefNominal write FtiresRefNominal; 
    property transportRealRefCode : Integer read FtransportRealRefCode write FtransportRealRefCode; //TKTransportRealRef read FtransportRealRefCode write FtransportRealRefCode; 
    property travelSheetRefCode : Integer read FtravelSheetRefCode write FtravelSheetRefCode; //ENTravelSheetRef read FtravelSheetRefCode write FtravelSheetRefCode; 
  end;

  ArrayOfENAutoTiresDistanceShort = array of ENAutoTiresDistanceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAutoTiresDistanceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAutoTiresDistanceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAutoTiresDistanceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAutoTiresDistanceController/message/
  // soapAction: http://ksoe.org/ENAutoTiresDistanceController/action/ENAutoTiresDistanceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAutoTiresDistanceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAutoTiresDistanceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAutoTiresDistanceControllerSoapPort = interface(IInvokable)
  ['{e1cce1cc-e1cc-e1cc-e1cc-e1cce1cce1cc}']
    function  add(const aENAutoTiresDistance: ENAutoTiresDistance): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAutoTiresDistance: ENAutoTiresDistance); stdcall;
    function  getObject(const anObjectCode: Integer): ENAutoTiresDistance; stdcall;
    function  getList: ENAutoTiresDistanceShortList; stdcall;
    function  getFilteredList(const aENAutoTiresDistanceFilter: ENAutoTiresDistanceFilter): ENAutoTiresDistanceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresDistanceShortList; stdcall;
    function  getScrollableFilteredList(const aENAutoTiresDistanceFilter: ENAutoTiresDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresDistanceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAutoTiresDistanceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAutoTiresDistanceFilter: ENAutoTiresDistanceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAutoTiresDistance.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FtiresRef) then
      tiresRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAutoTiresDistanceFilter.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FtiresRef) then
      tiresRef.Free;
    if Assigned(FtransportRealRef) then
      transportRealRef.Free;
    if Assigned(FtravelSheetRef) then
      travelSheetRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAutoTiresDistanceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAutoTiresDistanceShort.Destroy;
  begin
    if Assigned(FrecordDistance) then
      recordDistance.Free;
    if Assigned(FrecordtDate) then
      recordtDate.Free;
    if Assigned(FtiresRefPotencial) then
      tiresRefPotencial.Free;
    if Assigned(FtiresRefDistanceAll) then
      tiresRefDistanceAll.Free;
    inherited Destroy;
  end; 
  
  destructor ENAutoTiresDistanceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAutoTiresDistance, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresDistance');
  RemClassRegistry.RegisterXSClass(ENAutoTiresDistanceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresDistanceRef');
  RemClassRegistry.RegisterXSClass(ENAutoTiresDistanceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresDistanceFilter');
  RemClassRegistry.RegisterXSClass(ENAutoTiresDistanceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresDistanceShort');
  RemClassRegistry.RegisterXSClass(ENAutoTiresDistanceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAutoTiresDistanceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAutoTiresDistanceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAutoTiresDistanceShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAutoTiresDistanceControllerSoapPort), 'http://ksoe.org/ENAutoTiresDistanceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAutoTiresDistanceControllerSoapPort), 'http://ksoe.org/ENAutoTiresDistanceController/action/ENAutoTiresDistanceController.%operationName%');


end.
