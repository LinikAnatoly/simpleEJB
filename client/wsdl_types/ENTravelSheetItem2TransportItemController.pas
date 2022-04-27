unit ENTravelSheetItem2TransportItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTravelSheetItemController 
   ,ENTransportItemController 
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

  ENTravelSheetItem2TransportItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItem2TransportItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTravelSheetItem2TransportItem = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtravelSheetItemRef : ENTravelSheetItemRef;
//???
    FtransportItemRef : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property travelSheetItemRef : ENTravelSheetItemRef read FtravelSheetItemRef write FtravelSheetItemRef; 
    property transportItemRef : ENTransportItemRef read FtransportItemRef write FtransportItemRef; 
  end;
  
{
  ENTravelSheetItem2TransportItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtravelSheetItemRef : ENTravelSheetItemRef;
//???
    FtransportItemRef : ENTransportItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property travelSheetItemRef : ENTravelSheetItemRef read FtravelSheetItemRef write FtravelSheetItemRef; 
    property transportItemRef : ENTransportItemRef read FtransportItemRef write FtransportItemRef; 
  end;
}

  ENTravelSheetItem2TransportItemFilter = class(ENTravelSheetItem2TransportItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENTravelSheetItem2TransportItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtravelSheetItemRefCode : Integer; 
    FtravelSheetItemRefTravelFrom : WideString;
    FtravelSheetItemRefTravelTo : WideString;
    FtravelSheetItemRefTimeStart : TXSDateTime;	
    FtravelSheetItemRefTimeFinal : TXSDateTime;	
    FtravelSheetItemRefSpeedometerStart : TXSDecimal;
    FtravelSheetItemRefSpeedometerFinal : TXSDecimal;
    FtravelSheetItemRefSumDistances : TXSDecimal;
    FtravelSheetItemRefSumMachineHours : TXSDecimal;
    FtravelSheetItemRefDateEdit : TXSDateTime;	
    FtravelSheetItemRefUserGen : WideString;
    FtransportItemRefCode : Integer; 
    FtransportItemRefCountWorkGen : TXSDecimal;
    FtransportItemRefCountWorkFact : TXSDecimal;
    FtransportItemRefPrice : TXSDecimal;
    FtransportItemRefCost : TXSDecimal;
    FtransportItemRefUserGen : WideString;
    FtransportItemRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property travelSheetItemRefCode : Integer read FtravelSheetItemRefCode write FtravelSheetItemRefCode; 
    property travelSheetItemRefTravelFrom : WideString read FtravelSheetItemRefTravelFrom write FtravelSheetItemRefTravelFrom; 
    property travelSheetItemRefTravelTo : WideString read FtravelSheetItemRefTravelTo write FtravelSheetItemRefTravelTo; 
    property travelSheetItemRefTimeStart : TXSDateTime read FtravelSheetItemRefTimeStart write FtravelSheetItemRefTimeStart; 
    property travelSheetItemRefTimeFinal : TXSDateTime read FtravelSheetItemRefTimeFinal write FtravelSheetItemRefTimeFinal; 
    property travelSheetItemRefSpeedometerStart : TXSDecimal read FtravelSheetItemRefSpeedometerStart write FtravelSheetItemRefSpeedometerStart; 
    property travelSheetItemRefSpeedometerFinal : TXSDecimal read FtravelSheetItemRefSpeedometerFinal write FtravelSheetItemRefSpeedometerFinal; 
    property travelSheetItemRefSumDistances : TXSDecimal read FtravelSheetItemRefSumDistances write FtravelSheetItemRefSumDistances; 
    property travelSheetItemRefSumMachineHours : TXSDecimal read FtravelSheetItemRefSumMachineHours write FtravelSheetItemRefSumMachineHours; 
    property travelSheetItemRefDateEdit : TXSDateTime read FtravelSheetItemRefDateEdit write FtravelSheetItemRefDateEdit; 
    property travelSheetItemRefUserGen : WideString read FtravelSheetItemRefUserGen write FtravelSheetItemRefUserGen; 
    property transportItemRefCode : Integer read FtransportItemRefCode write FtransportItemRefCode; 
    property transportItemRefCountWorkGen : TXSDecimal read FtransportItemRefCountWorkGen write FtransportItemRefCountWorkGen; 
    property transportItemRefCountWorkFact : TXSDecimal read FtransportItemRefCountWorkFact write FtransportItemRefCountWorkFact; 
    property transportItemRefPrice : TXSDecimal read FtransportItemRefPrice write FtransportItemRefPrice; 
    property transportItemRefCost : TXSDecimal read FtransportItemRefCost write FtransportItemRefCost; 
    property transportItemRefUserGen : WideString read FtransportItemRefUserGen write FtransportItemRefUserGen; 
    property transportItemRefDateEdit : TXSDate read FtransportItemRefDateEdit write FtransportItemRefDateEdit; 
  end;

  ArrayOfENTravelSheetItem2TransportItemShort = array of ENTravelSheetItem2TransportItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTravelSheetItem2TransportItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTravelSheetItem2TransportItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTravelSheetItem2TransportItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTravelSheetItem2TransportItemController/message/
  // soapAction: http://ksoe.org/ENTravelSheetItem2TransportItemController/action/ENTravelSheetItem2TransportItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTravelSheetItem2TransportItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTravelSheetItem2TransportItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTravelSheetItem2TransportItemControllerSoapPort = interface(IInvokable)
  ['{170b170b-170b-170b-170b-170b170b170b}']
    function  add(const aENTravelSheetItem2TransportItem: ENTravelSheetItem2TransportItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTravelSheetItem2TransportItem: ENTravelSheetItem2TransportItem); stdcall;
    function  getObject(const anObjectCode: Integer): ENTravelSheetItem2TransportItem; stdcall;
    function  getList: ENTravelSheetItem2TransportItemShortList; stdcall;
    function  getFilteredList(const aENTravelSheetItem2TransportItemFilter: ENTravelSheetItem2TransportItemFilter): ENTravelSheetItem2TransportItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItem2TransportItemShortList; stdcall;
    function  getScrollableFilteredList(const aENTravelSheetItem2TransportItemFilter: ENTravelSheetItem2TransportItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItem2TransportItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTravelSheetItem2TransportItemShortList; stdcall;
  end; 


implementation

  destructor ENTravelSheetItem2TransportItem.Destroy;
  begin
    if Assigned(FtravelSheetItemRef) then
      travelSheetItemRef.Free;
    if Assigned(FtransportItemRef) then
      transportItemRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENTravelSheetItem2TransportItemFilter.Destroy;
  begin
    if Assigned(FtravelSheetItemRef) then
      travelSheetItemRef.Free;
    if Assigned(FtransportItemRef) then
      transportItemRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENTravelSheetItem2TransportItemFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENTravelSheetItem2TransportItemShort.Destroy;
  begin
    if Assigned(FtravelSheetItemRefTimeStart) then
      travelSheetItemRefTimeStart.Free;
    if Assigned(FtravelSheetItemRefTimeFinal) then
      travelSheetItemRefTimeFinal.Free;
    if Assigned(FtravelSheetItemRefSpeedometerStart) then
      travelSheetItemRefSpeedometerStart.Free;
    if Assigned(FtravelSheetItemRefSpeedometerFinal) then
      travelSheetItemRefSpeedometerFinal.Free;
    if Assigned(FtravelSheetItemRefSumDistances) then
      travelSheetItemRefSumDistances.Free;
    if Assigned(FtravelSheetItemRefSumMachineHours) then
      travelSheetItemRefSumMachineHours.Free;
    if Assigned(FtravelSheetItemRefDateEdit) then
      travelSheetItemRefDateEdit.Free;
    if Assigned(FtransportItemRefCountWorkGen) then
      transportItemRefCountWorkGen.Free;
    if Assigned(FtransportItemRefCountWorkFact) then
      transportItemRefCountWorkFact.Free;
    if Assigned(FtransportItemRefPrice) then
      transportItemRefPrice.Free;
    if Assigned(FtransportItemRefCost) then
      transportItemRefCost.Free;
    if Assigned(FtransportItemRefDateEdit) then
      transportItemRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTravelSheetItem2TransportItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTravelSheetItem2TransportItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem2TransportItem');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItem2TransportItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem2TransportItemRef');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItem2TransportItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem2TransportItemFilter');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItem2TransportItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem2TransportItemShort');
  RemClassRegistry.RegisterXSClass(ENTravelSheetItem2TransportItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTravelSheetItem2TransportItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTravelSheetItem2TransportItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTravelSheetItem2TransportItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTravelSheetItem2TransportItemControllerSoapPort), 'http://ksoe.org/ENTravelSheetItem2TransportItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTravelSheetItem2TransportItemControllerSoapPort), 'http://ksoe.org/ENTravelSheetItem2TransportItemController/action/ENTravelSheetItem2TransportItemController.%operationName%');


end.
