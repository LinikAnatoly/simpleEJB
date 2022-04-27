unit ENRoadTypeDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENRoadTypeController 
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

  ENRoadTypeData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRoadTypeDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENRoadTypeData = class(TRemotable)
  private
    Fcode : Integer; 
    Fspeed : TXSDecimal;
    Fdistance : TXSDecimal;
    FisWinter : Integer; 
    Fcoeff : TXSDecimal;
//???
    FtypeRef : ENRoadTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property speed : TXSDecimal read Fspeed write Fspeed; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property  isWinter : Integer read FisWinter write FisWinter; 
    property coeff : TXSDecimal read Fcoeff write Fcoeff; 
    property typeRef : ENRoadTypeRef read FtypeRef write FtypeRef; 
  end;

  ENRoadTypeDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fspeed : TXSDecimal;
    Fdistance : TXSDecimal;
    FisWinter : Integer; 
    Fcoeff : TXSDecimal;
//???
    FtypeRef : ENRoadTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property speed : TXSDecimal read Fspeed write Fspeed; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property  isWinter : Integer read FisWinter write FisWinter; 
    property coeff : TXSDecimal read Fcoeff write Fcoeff; 
    property typeRef : ENRoadTypeRef read FtypeRef write FtypeRef; 
  end;


  ENRoadTypeDataShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fspeed : TXSDecimal;
    Fdistance : TXSDecimal;
    FisWinter : Integer; 
    Fcoeff : TXSDecimal;
    FtypeRefCode : Integer; 
    FtypeRefName : WideString;
  published
    property  code : Integer read Fcode write Fcode; 
    property speed : TXSDecimal read Fspeed write Fspeed; 
    property distance : TXSDecimal read Fdistance write Fdistance; 
    property  isWinter : Integer read FisWinter write FisWinter; 
    property coeff : TXSDecimal read Fcoeff write Fcoeff; 

    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode; 
    property typeRefName : WideString read FtypeRefName write FtypeRefName; 
  end;

  ArrayOfENRoadTypeDataShort = array of ENRoadTypeDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENRoadTypeDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENRoadTypeDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENRoadTypeDataShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENRoadTypeDataController/message/
  // soapAction: http://ksoe.org/ENRoadTypeDataController/action/ENRoadTypeDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENRoadTypeDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENRoadTypeDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENRoadTypeDataControllerSoapPort = interface(IInvokable)
  ['{98d798d7-98d7-98d7-98d7-98d798d798d7}']
    function  add(const aENRoadTypeData: ENRoadTypeData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENRoadTypeData: ENRoadTypeData); stdcall;
    function  getObject(const anObjectCode: Integer): ENRoadTypeData; stdcall;
    function  getList: ENRoadTypeDataShortList; stdcall;
    function  getFilteredList(const aENRoadTypeDataFilter: ENRoadTypeDataFilter): ENRoadTypeDataShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeDataShortList; stdcall;
    function  getScrollableFilteredList(const aENRoadTypeDataFilter: ENRoadTypeDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeDataShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENRoadTypeDataShortList; stdcall;
  end; 


implementation

  destructor ENRoadTypeData.Destroy;
  begin
    if Assigned(Fspeed) then
      speed.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fcoeff) then
      coeff.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
  
  destructor ENRoadTypeDataFilter.Destroy;
  begin
    if Assigned(Fspeed) then
      speed.Free;
    if Assigned(Fdistance) then
      distance.Free;
    if Assigned(Fcoeff) then
      coeff.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end; 
  
  
  destructor ENRoadTypeDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENRoadTypeData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeData');
  RemClassRegistry.RegisterXSClass(ENRoadTypeDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeDataRef');
  RemClassRegistry.RegisterXSClass(ENRoadTypeDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeDataFilter');
  RemClassRegistry.RegisterXSClass(ENRoadTypeDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeDataShort');
  RemClassRegistry.RegisterXSClass(ENRoadTypeDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENRoadTypeDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENRoadTypeDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENRoadTypeDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENRoadTypeDataControllerSoapPort), 'http://ksoe.org/ENRoadTypeDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENRoadTypeDataControllerSoapPort), 'http://ksoe.org/ENRoadTypeDataController/action/ENRoadTypeDataController.%operationName%');


end.
