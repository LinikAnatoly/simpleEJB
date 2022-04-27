unit ENTravelSheetItemDistance2TKFuelKoefController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTravelSheetItemDistanceController 
   ,TKFuelKoefController 
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

  ENTravelSheetItemDistance2TKFuelKoef            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemDistance2TKFuelKoefRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItemDistance2TKFuelKoef = class(TRemotable)
  private
    Fcode : Integer; 
//???
    FtravelSheetItemDistanceRef : ENTravelSheetItemDistanceRef;
//???
    FtkFuelKoefRef : TKFuelKoefRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property travelSheetItemDistanceRef : ENTravelSheetItemDistanceRef read FtravelSheetItemDistanceRef write FtravelSheetItemDistanceRef; 
    property tkFuelKoefRef : TKFuelKoefRef read FtkFuelKoefRef write FtkFuelKoefRef; 
  end;
  
{
  ENTravelSheetItemDistance2TKFuelKoefFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
//???
    FtravelSheetItemDistanceRef : ENTravelSheetItemDistanceRef;
//???
    FtkFuelKoefRef : TKFuelKoefRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property travelSheetItemDistanceRef : ENTravelSheetItemDistanceRef read FtravelSheetItemDistanceRef write FtravelSheetItemDistanceRef; 
    property tkFuelKoefRef : TKFuelKoefRef read FtkFuelKoefRef write FtkFuelKoefRef; 
  end;
}

  ENTravelSheetItemDistance2TKFuelKoefFilter = class(ENTravelSheetItemDistance2TKFuelKoef)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetItemDistance2TKFuelKoefShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtravelSheetItemDistanceRefCode : Integer; 
    FtravelSheetItemDistanceRefDistance : TXSDecimal;
    FtravelSheetItemDistanceRefSumMachineHours : TXSDecimal;
    FtravelSheetItemDistanceRefKoef : TXSDecimal;
    FtkFuelKoefRefCode : Integer; 
    FtkFuelKoefRefKoef : TXSDecimal;
    FtkFuelKoefRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property travelSheetItemDistanceRefCode : Integer read FtravelSheetItemDistanceRefCode write FtravelSheetItemDistanceRefCode; 
    property travelSheetItemDistanceRefDistance : TXSDecimal read FtravelSheetItemDistanceRefDistance write FtravelSheetItemDistanceRefDistance; 
    property travelSheetItemDistanceRefSumMachineHours : TXSDecimal read FtravelSheetItemDistanceRefSumMachineHours write FtravelSheetItemDistanceRefSumMachineHours; 
    property travelSheetItemDistanceRefKoef : TXSDecimal read FtravelSheetItemDistanceRefKoef write FtravelSheetItemDistanceRefKoef; 
    property tkFuelKoefRefCode : Integer read FtkFuelKoefRefCode write FtkFuelKoefRefCode; 
    property tkFuelKoefRefKoef : TXSDecimal read FtkFuelKoefRefKoef write FtkFuelKoefRefKoef; 
    property tkFuelKoefRefName : WideString read FtkFuelKoefRefName write FtkFuelKoefRefName; 
  end;

  ArrayOfENTravelSheetItemDistance2TKFuelKoefShort = array of ENTravelSheetItemDistance2TKFuelKoefShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItemDistance2TKFuelKoefShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItemDistance2TKFuelKoefShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItemDistance2TKFuelKoefShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItemDistance2TKFuelKoefController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItemDistance2TKFuelKoefController/action/ENTravelSheetItemDistance2TKFuelKoefController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItemDistance2TKFuelKoefControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItemDistance2TKFuelKoefController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort = interface(IInvokable)
  ['{e391e391-e391-e391-e391-e391e391e391}']
    function  add(const aENTravelSheetItemDistance2TKFuelKoef: ENTravelSheetItemDistance2TKFuelKoef): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItemDistance2TKFuelKoef: ENTravelSheetItemDistance2TKFuelKoef); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetItemDistance2TKFuelKoef; stdcall;
    function  getList: ENTravelSheetItemDistance2TKFuelKoefShortList; stdcall;
    function  getFilteredList(const aENTravelSheetItemDistance2TKFuelKoefFilter: ENTravelSheetItemDistance2TKFuelKoefFilter): ENTravelSheetItemDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetItemDistance2TKFuelKoefFilter: ENTravelSheetItemDistance2TKFuelKoefFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItemDistance2TKFuelKoefShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENTravelSheetItemDistance2TKFuelKoefFilter: ENTravelSheetItemDistance2TKFuelKoefFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
  end; 


implementation

  destructor ENTravelSheetItemDistance2TKFuelKoef.Destroy;
  begin
    if Assigned(FtravelSheetItemDistanceRef) then
      travelSheetItemDistanceRef.Free;
    if Assigned(FtkFuelKoefRef) then
      tkFuelKoefRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTravelSheetItemDistance2TKFuelKoefFilter.Destroy;
  begin
    if Assigned(FtravelSheetItemDistanceRef) then
      travelSheetItemDistanceRef.Free;
    if Assigned(FtkFuelKoefRef) then
      tkFuelKoefRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTravelSheetItemDistance2TKFuelKoefFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTravelSheetItemDistance2TKFuelKoefShort.Destroy;
  begin
    if Assigned(FtravelSheetItemDistanceRefDistance) then
      travelSheetItemDistanceRefDistance.Free;
    if Assigned(FtravelSheetItemDistanceRefSumMachineHours) then
      travelSheetItemDistanceRefSumMachineHours.Free;
    if Assigned(FtravelSheetItemDistanceRefKoef) then
      travelSheetItemDistanceRefKoef.Free;
    if Assigned(FtkFuelKoefRefKoef) then
      tkFuelKoefRefKoef.Free;
    inherited Destroy;
  end; 
  
  destructor ENTravelSheetItemDistance2TKFuelKoefShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance2TKFuelKoef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance2TKFuelKoef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance2TKFuelKoefRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance2TKFuelKoefRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance2TKFuelKoefFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance2TKFuelKoefFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance2TKFuelKoefShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance2TKFuelKoefShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItemDistance2TKFuelKoefShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItemDistance2TKFuelKoefShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItemDistance2TKFuelKoefShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItemDistance2TKFuelKoefShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemDistance2TKFuelKoefController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItemDistance2TKFuelKoefControllerSoapPort), 'http://ksoe.org/ENTravelSheetItemDistance2TKFuelKoefController/action/ENTravelSheetItemDistance2TKFuelKoefController.%operationName%');


end.
