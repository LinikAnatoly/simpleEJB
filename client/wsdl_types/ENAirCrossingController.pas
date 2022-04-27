unit ENAirCrossingController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLineCableController 
   ,ENLine04Controller 
   ,ENLine10Controller 
   ,ENLine150Controller 
   ,ENObjCrossDownController 
   ,ENObjCrossUpController 
   ,ENWiresFasteningController 
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

  ENAirCrossing            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAirCrossingRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAirCrossing = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FsizeBottomLength : TXSDecimal;
    FflightLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FlineCableRef : ENLineCableRef;
//???
    Fline04Ref : ENLine04Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    FobjCrossDownRef : ENObjCrossDownRef;
//???
    FobjCrossUpRef : ENObjCrossUpRef;
//???
    FwireFastenRef : ENWiresFasteningRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property sizeBottomLength : TXSDecimal read FsizeBottomLength write FsizeBottomLength; 
    property flightLength : TXSDecimal read FflightLength write FflightLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref; 
    property objCrossDownRef : ENObjCrossDownRef read FobjCrossDownRef write FobjCrossDownRef; 
    property objCrossUpRef : ENObjCrossUpRef read FobjCrossUpRef write FobjCrossUpRef; 
    property wireFastenRef : ENWiresFasteningRef read FwireFastenRef write FwireFastenRef; 
  end;
  
{
  ENAirCrossingFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FsizeBottomLength : TXSDecimal;
    FflightLength : TXSDecimal;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FlineCableRef : ENLineCableRef;
//???
    Fline04Ref : ENLine04Ref;
//???
    Fline10Ref : ENLine10Ref;
//???
    Fline150Ref : ENLine150Ref;
//???
    FobjCrossDownRef : ENObjCrossDownRef;
//???
    FobjCrossUpRef : ENObjCrossUpRef;
//???
    FwireFastenRef : ENWiresFasteningRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property sizeBottomLength : TXSDecimal read FsizeBottomLength write FsizeBottomLength; 
    property flightLength : TXSDecimal read FflightLength write FflightLength; 
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property lineCableRef : ENLineCableRef read FlineCableRef write FlineCableRef; 
    property line04Ref : ENLine04Ref read Fline04Ref write Fline04Ref; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property line150Ref : ENLine150Ref read Fline150Ref write Fline150Ref; 
    property objCrossDownRef : ENObjCrossDownRef read FobjCrossDownRef write FobjCrossDownRef; 
    property objCrossUpRef : ENObjCrossUpRef read FobjCrossUpRef write FobjCrossUpRef; 
    property wireFastenRef : ENWiresFasteningRef read FwireFastenRef write FwireFastenRef; 
  end;
}

  ENAirCrossingFilter = class(ENAirCrossing)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENAirCrossingShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FsizeBottomLength : TXSDecimal;
    FflightLength : TXSDecimal;
    FlineCableRefCode : Integer; 
    FlineCableRefInvNumber : WideString;
    FlineCableRefName : WideString;
    FlineCableRefBuhName : WideString;
    FlineCableRefLineLength : TXSDecimal;
    FlineCableRefYearBuild : Integer; 
    FlineCableRefYearWorkingStart : Integer; 
    FlineCableRefLastRepairDate : TXSDate;
    Fline04RefCode : Integer; 
    Fline04RefInvNumber : WideString;
    Fline04RefName : WideString;
    Fline04RefBuhName : WideString;
    Fline04RefLineLength : TXSDecimal;
    Fline04RefYearBuild : Integer; 
    Fline04RefYearWorkingStart : Integer; 
    Fline04RefLastRepairDate : TXSDate;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    Fline150RefCode : Integer; 
    Fline150RefInvNumber : WideString;
    Fline150RefName : WideString;
    Fline150RefBuhName : WideString;
    Fline150RefLineLength : TXSDecimal;
    Fline150RefYearBuild : Integer; 
    Fline150RefYearWorkingStart : Integer; 
    Fline150RefChainsLength : TXSDecimal;
    Fline150RefChains2Length : TXSDecimal;
    Fline150RefLastRepairDate : TXSDate;
    FobjCrossDownRefCode : Integer;
    FobjCrossDownRefName : WideString;
    FobjCrossUpRefCode : Integer;
    FobjCrossUpRefName : WideString;
    FwireFastenRefCode : Integer; 
    FwireFastenRefName : WideString;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property sizeBottomLength: TXSDecimal read FsizeBottomLength write FsizeBottomLength;
    property flightLength : TXSDecimal read FflightLength write FflightLength;
    property lineCableRefCode : Integer read FlineCableRefCode write FlineCableRefCode;
    property lineCableRefInvNumber : WideString read FlineCableRefInvNumber write FlineCableRefInvNumber;
    property lineCableRefName : WideString read FlineCableRefName write FlineCableRefName;
    property lineCableRefBuhName : WideString read FlineCableRefBuhName write FlineCableRefBuhName;
    property lineCableRefLineLength : TXSDecimal read FlineCableRefLineLength write FlineCableRefLineLength; 
    property lineCableRefYearBuild : Integer read FlineCableRefYearBuild write FlineCableRefYearBuild; 
    property lineCableRefYearWorkingStart : Integer read FlineCableRefYearWorkingStart write FlineCableRefYearWorkingStart; 
    property lineCableRefLastRepairDate : TXSDate read FlineCableRefLastRepairDate write FlineCableRefLastRepairDate; 
    property line04RefCode : Integer read Fline04RefCode write Fline04RefCode;
    property line04RefInvNumber : WideString read Fline04RefInvNumber write Fline04RefInvNumber; 
    property line04RefName : WideString read Fline04RefName write Fline04RefName; 
    property line04RefBuhName : WideString read Fline04RefBuhName write Fline04RefBuhName; 
    property line04RefLineLength : TXSDecimal read Fline04RefLineLength write Fline04RefLineLength; 
    property line04RefYearBuild : Integer read Fline04RefYearBuild write Fline04RefYearBuild; 
    property line04RefYearWorkingStart : Integer read Fline04RefYearWorkingStart write Fline04RefYearWorkingStart; 
    property line04RefLastRepairDate : TXSDate read Fline04RefLastRepairDate write Fline04RefLastRepairDate; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property line150RefCode : Integer read Fline150RefCode write Fline150RefCode; 
    property line150RefInvNumber : WideString read Fline150RefInvNumber write Fline150RefInvNumber; 
    property line150RefName : WideString read Fline150RefName write Fline150RefName; 
    property line150RefBuhName : WideString read Fline150RefBuhName write Fline150RefBuhName; 
    property line150RefLineLength : TXSDecimal read Fline150RefLineLength write Fline150RefLineLength; 
    property line150RefYearBuild : Integer read Fline150RefYearBuild write Fline150RefYearBuild; 
    property line150RefYearWorkingStart : Integer read Fline150RefYearWorkingStart write Fline150RefYearWorkingStart; 
    property line150RefChainsLength : TXSDecimal read Fline150RefChainsLength write Fline150RefChainsLength; 
    property line150RefChains2Length : TXSDecimal read Fline150RefChains2Length write Fline150RefChains2Length; 
    property line150RefLastRepairDate : TXSDate read Fline150RefLastRepairDate write Fline150RefLastRepairDate; 
    property objCrossDownRefCode : Integer read FobjCrossDownRefCode write FobjCrossDownRefCode; 
    property objCrossDownRefName : WideString read FobjCrossDownRefName write FobjCrossDownRefName; 
    property objCrossUpRefCode : Integer read FobjCrossUpRefCode write FobjCrossUpRefCode; 
    property objCrossUpRefName : WideString read FobjCrossUpRefName write FobjCrossUpRefName; 
    property wireFastenRefCode : Integer read FwireFastenRefCode write FwireFastenRefCode; 
    property wireFastenRefName : WideString read FwireFastenRefName write FwireFastenRefName; 
  end;

  ArrayOfENAirCrossingShort = array of ENAirCrossingShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAirCrossingShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAirCrossingShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAirCrossingShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAirCrossingController/message/
  // soapAction: http://ksoe.org/ENAirCrossingController/action/ENAirCrossingController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAirCrossingControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAirCrossingController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAirCrossingControllerSoapPort = interface(IInvokable)
  ['{1eb11eb1-1eb1-1eb1-1eb1-1eb11eb11eb1}']
    function  add(const aENAirCrossing: ENAirCrossing): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAirCrossing: ENAirCrossing); stdcall;
    function  getObject(const anObjectCode: Integer): ENAirCrossing; stdcall;
    function  getList: ENAirCrossingShortList; stdcall;
    function  getFilteredList(const aENAirCrossingFilter: ENAirCrossingFilter): ENAirCrossingShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingShortList; stdcall;
    function  getScrollableFilteredList(const aENAirCrossingFilter: ENAirCrossingFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAirCrossingShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENAirCrossingFilter: ENAirCrossingFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENAirCrossing.Destroy;
  begin
    if Assigned(FsizeBottomLength) then
      sizeBottomLength.Free;
    if Assigned(FflightLength) then
      flightLength.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(FobjCrossDownRef) then
      objCrossDownRef.Free;
    if Assigned(FobjCrossUpRef) then
      objCrossUpRef.Free;
    if Assigned(FwireFastenRef) then
      wireFastenRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENAirCrossingFilter.Destroy;
  begin
    if Assigned(FsizeBottomLength) then
      sizeBottomLength.Free;
    if Assigned(FflightLength) then
      flightLength.Free;
    if Assigned(FlineCableRef) then
      lineCableRef.Free;
    if Assigned(Fline04Ref) then
      line04Ref.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(Fline150Ref) then
      line150Ref.Free;
    if Assigned(FobjCrossDownRef) then
      objCrossDownRef.Free;
    if Assigned(FobjCrossUpRef) then
      objCrossUpRef.Free;
    if Assigned(FwireFastenRef) then
      wireFastenRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENAirCrossingFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENAirCrossingShort.Destroy;
  begin
    if Assigned(FflightLength) then
      flightLength.Free;
    if Assigned(FlineCableRefLineLength) then
      lineCableRefLineLength.Free;
    if Assigned(FlineCableRefLastRepairDate) then
      lineCableRefLastRepairDate.Free;
    if Assigned(Fline04RefLineLength) then
      line04RefLineLength.Free;
    if Assigned(Fline04RefLastRepairDate) then
      line04RefLastRepairDate.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(Fline150RefLineLength) then
      line150RefLineLength.Free;
    if Assigned(Fline150RefChainsLength) then
      line150RefChainsLength.Free;
    if Assigned(Fline150RefChains2Length) then
      line150RefChains2Length.Free;
    if Assigned(Fline150RefLastRepairDate) then
      line150RefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENAirCrossingShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAirCrossing, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossing');
  RemClassRegistry.RegisterXSClass(ENAirCrossingRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingRef');
  RemClassRegistry.RegisterXSClass(ENAirCrossingFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingFilter');
  RemClassRegistry.RegisterXSClass(ENAirCrossingShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingShort');
  RemClassRegistry.RegisterXSClass(ENAirCrossingShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAirCrossingShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAirCrossingShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAirCrossingShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAirCrossingControllerSoapPort), 'http://ksoe.org/ENAirCrossingController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAirCrossingControllerSoapPort), 'http://ksoe.org/ENAirCrossingController/action/ENAirCrossingController.%operationName%');


end.
