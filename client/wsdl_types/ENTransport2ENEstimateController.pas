unit ENTransport2ENEstimateController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENTransportItemController 
   ,ENEstimateItemController 
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

  ENTransport2ENEstimate            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransport2ENEstimateRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENTransport2ENEstimate = class(TRemotable)
  private
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtransportRef : ENTransportItemRef;
//???
    FestimateRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportRef : ENTransportItemRef read FtransportRef write FtransportRef; 
    property estimateRef : ENEstimateItemRef read FestimateRef write FestimateRef; 
  end;

  ENTransport2ENEstimateFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fmodify_time : Int64;
//???
    FtransportRef : ENTransportItemRef;
//???
    FestimateRef : ENEstimateItemRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property transportRef : ENTransportItemRef read FtransportRef write FtransportRef; 
    property estimateRef : ENEstimateItemRef read FestimateRef write FestimateRef; 
  end;


  ENTransport2ENEstimateShort = class(TRemotable)
  private
    Fcode : Integer; 
    FtransportRefCode : Integer; 
    FestimateRefCode : Integer; 
    FestimateRefCountGen : TXSDecimal;
    FestimateRefCountFact : TXSDecimal;
    FestimateRefPrice : TXSDecimal;
    FestimateRefCost : TXSDecimal;
    FestimateRefUserGen : WideString;
    FestimateRefDateEdit : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 

    property transportRefCode : Integer read FtransportRefCode write FtransportRefCode; //ENTransportItemRef read FtransportRefCode write FtransportRefCode; 
    property estimateRefCode : Integer read FestimateRefCode write FestimateRefCode; 
    property estimateRefCountGen : TXSDecimal read FestimateRefCountGen write FestimateRefCountGen; 
    property estimateRefCountFact : TXSDecimal read FestimateRefCountFact write FestimateRefCountFact; 
    property estimateRefPrice : TXSDecimal read FestimateRefPrice write FestimateRefPrice; 
    property estimateRefCost : TXSDecimal read FestimateRefCost write FestimateRefCost; 
    property estimateRefUserGen : WideString read FestimateRefUserGen write FestimateRefUserGen; 
    property estimateRefDateEdit : TXSDate read FestimateRefDateEdit write FestimateRefDateEdit; 
  end;

  ArrayOfENTransport2ENEstimateShort = array of ENTransport2ENEstimateShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENTransport2ENEstimateShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENTransport2ENEstimateShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENTransport2ENEstimateShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENTransport2ENEstimateController/message/
  // soapAction: http://ksoe.org/ENTransport2ENEstimateController/action/ENTransport2ENEstimateController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENTransport2ENEstimateControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENTransport2ENEstimateController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENTransport2ENEstimateControllerSoapPort = interface(IInvokable)
  ['{42401403-791A-4CDC-B451-AF7A56F60EAB}']
    function  add(const aENTransport2ENEstimate: ENTransport2ENEstimate): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENTransport2ENEstimate: ENTransport2ENEstimate); stdcall;
    function  getObject(const anObjectCode: Integer): ENTransport2ENEstimate; stdcall;
    function  getList: ENTransport2ENEstimateShortList; stdcall;
    function  getFilteredList(const aENTransport2ENEstimateFilter: ENTransport2ENEstimateFilter): ENTransport2ENEstimateShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENTransport2ENEstimateShortList; stdcall;
    function  getScrollableFilteredList(const aENTransport2ENEstimateFilter: ENTransport2ENEstimateFilter; const aFromPosition: Integer; const aQuantity: Integer): ENTransport2ENEstimateShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENTransport2ENEstimateShortList; stdcall;
  end; 


implementation

  destructor ENTransport2ENEstimate.Destroy;
  begin
    if Assigned(FtransportRef) then
      transportRef.Free;
    if Assigned(FestimateRef) then
      estimateRef.Free;
    inherited Destroy;
  end;
  
  destructor ENTransport2ENEstimateFilter.Destroy;
  begin
    if Assigned(FtransportRef) then
      transportRef.Free;
    if Assigned(FestimateRef) then
      estimateRef.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransport2ENEstimateShort.Destroy;
  begin
    if Assigned(FestimateRefCountGen) then
      estimateRefCountGen.Free;
    if Assigned(FestimateRefCountFact) then
      estimateRefCountFact.Free;
    if Assigned(FestimateRefPrice) then
      estimateRefPrice.Free;
    if Assigned(FestimateRefCost) then
      estimateRefCost.Free;
    if Assigned(FestimateRefDateEdit) then
      estimateRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor ENTransport2ENEstimateShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENTransport2ENEstimate, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransport2ENEstimate');
  RemClassRegistry.RegisterXSClass(ENTransport2ENEstimateRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransport2ENEstimateRef');
  RemClassRegistry.RegisterXSClass(ENTransport2ENEstimateFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransport2ENEstimateFilter');
  RemClassRegistry.RegisterXSClass(ENTransport2ENEstimateShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransport2ENEstimateShort');
  RemClassRegistry.RegisterXSClass(ENTransport2ENEstimateShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENTransport2ENEstimateShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENTransport2ENEstimateShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENTransport2ENEstimateShort');

  InvRegistry.RegisterInterface(TypeInfo(ENTransport2ENEstimateControllerSoapPort), 'http://ksoe.org/ENTransport2ENEstimateController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENTransport2ENEstimateControllerSoapPort), 'http://ksoe.org/ENTransport2ENEstimateController/action/ENTransport2ENEstimateController.%operationName%');


end.
