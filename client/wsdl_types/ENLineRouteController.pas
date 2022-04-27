unit ENLineRouteController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENLandscapeController 
   ,ENLine10Controller 
   ,ENPostController
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

  ENLineRoute            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLineRouteRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENLineRoute = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FdistancePost : TXSDecimal;
//???
    FlandscapeRef : ENLandscapeRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
//???
    FpreviousPostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property distancePost : TXSDecimal read FdistancePost write FdistancePost; 
    property landscapeRef : ENLandscapeRef read FlandscapeRef write FlandscapeRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property previousPostRef : ENPostRef read FpreviousPostRef write FpreviousPostRef; 
  end;
  
{
  ENLineRouteFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    FdistancePost : TXSDecimal;
//???
    FlandscapeRef : ENLandscapeRef;
//???
    Fline10Ref : ENLine10Ref;
//???
    FpostRef : ENPostRef;
//???
    FpreviousPostRef : ENPostRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property distancePost : TXSDecimal read FdistancePost write FdistancePost; 
    property landscapeRef : ENLandscapeRef read FlandscapeRef write FlandscapeRef; 
    property line10Ref : ENLine10Ref read Fline10Ref write Fline10Ref; 
    property postRef : ENPostRef read FpostRef write FpostRef; 
    property previousPostRef : ENPostRef read FpreviousPostRef write FpreviousPostRef; 
  end;
}

  ENLineRouteFilter = class(ENLineRoute)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  ENLineRouteShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    FdistancePost : TXSDecimal;
    FlandscapeRefCode : Integer; 
    FlandscapeRefName : WideString;
    Fline10RefCode : Integer; 
    Fline10RefInvNumber : WideString;
    Fline10RefName : WideString;
    Fline10RefBuhName : WideString;
    Fline10RefLineLength : TXSDecimal;
    Fline10RefYearBuild : Integer; 
    Fline10RefYearWorkingStart : Integer; 
    Fline10RefLastRepairDate : TXSDate;
    FpostRefCode : Integer; 
    FpostRefName : WideString;
    FpostRefPostNumberGen : WideString;
    FpostRefLastRepairDate : TXSDate;
    FpreviousPostRefCode : Integer; 
    FpreviousPostRefName : WideString;
    FpreviousPostRefPostNumberGen : WideString;
    FpreviousPostRefLastRepairDate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property distancePost : TXSDecimal read FdistancePost write FdistancePost; 

    property landscapeRefCode : Integer read FlandscapeRefCode write FlandscapeRefCode; 
    property landscapeRefName : WideString read FlandscapeRefName write FlandscapeRefName; 
    property line10RefCode : Integer read Fline10RefCode write Fline10RefCode; 
    property line10RefInvNumber : WideString read Fline10RefInvNumber write Fline10RefInvNumber; 
    property line10RefName : WideString read Fline10RefName write Fline10RefName; 
    property line10RefBuhName : WideString read Fline10RefBuhName write Fline10RefBuhName; 
    property line10RefLineLength : TXSDecimal read Fline10RefLineLength write Fline10RefLineLength; 
    property line10RefYearBuild : Integer read Fline10RefYearBuild write Fline10RefYearBuild; 
    property line10RefYearWorkingStart : Integer read Fline10RefYearWorkingStart write Fline10RefYearWorkingStart; 
    property line10RefLastRepairDate : TXSDate read Fline10RefLastRepairDate write Fline10RefLastRepairDate; 
    property postRefCode : Integer read FpostRefCode write FpostRefCode; 
    property postRefName : WideString read FpostRefName write FpostRefName; 
    property postRefPostNumberGen : WideString read FpostRefPostNumberGen write FpostRefPostNumberGen; 
    property postRefLastRepairDate : TXSDate read FpostRefLastRepairDate write FpostRefLastRepairDate; 
    property previousPostRefCode : Integer read FpreviousPostRefCode write FpreviousPostRefCode; 
    property previousPostRefName : WideString read FpreviousPostRefName write FpreviousPostRefName; 
    property previousPostRefPostNumberGen : WideString read FpreviousPostRefPostNumberGen write FpreviousPostRefPostNumberGen; 
    property previousPostRefLastRepairDate : TXSDate read FpreviousPostRefLastRepairDate write FpreviousPostRefLastRepairDate; 
  end;

  ArrayOfENLineRouteShort = array of ENLineRouteShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENLineRouteShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENLineRouteShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENLineRouteShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENLineRouteController/message/
  // soapAction: http://ksoe.org/ENLineRouteController/action/ENLineRouteController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENLineRouteControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENLineRouteController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENLineRouteControllerSoapPort = interface(IInvokable)
  ['{9d9e9d9e-9d9e-9d9e-9d9e-9d9e9d9e9d9e}']
    function  add(const aENLineRoute: ENLineRoute): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENLineRoute: ENLineRoute); stdcall;
    function  getObject(const anObjectCode: Integer): ENLineRoute; stdcall;
    function  getList: ENLineRouteShortList; stdcall;
    function  getFilteredList(const aENLineRouteFilter: ENLineRouteFilter): ENLineRouteShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENLineRouteShortList; stdcall;
    function  getScrollableFilteredList(const aENLineRouteFilter: ENLineRouteFilter; const aFromPosition: Integer; const aQuantity: Integer): ENLineRouteShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENLineRouteShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aENLineRouteFilter: ENLineRouteFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor ENLineRoute.Destroy;
  begin
    if Assigned(FdistancePost) then
      distancePost.Free;
    if Assigned(FlandscapeRef) then
      landscapeRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FpreviousPostRef) then
      previousPostRef.Free;
    inherited Destroy;
  end;

{  
  destructor ENLineRouteFilter.Destroy;
  begin
    if Assigned(FdistancePost) then
      distancePost.Free;
    if Assigned(FlandscapeRef) then
      landscapeRef.Free;
    if Assigned(Fline10Ref) then
      line10Ref.Free;
    if Assigned(FpostRef) then
      postRef.Free;
    if Assigned(FpreviousPostRef) then
      previousPostRef.Free;
    inherited Destroy;
  end; 
}

  destructor ENLineRouteFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor ENLineRouteShort.Destroy;
  begin
    if Assigned(FdistancePost) then
      distancePost.Free;
    if Assigned(Fline10RefLineLength) then
      line10RefLineLength.Free;
    if Assigned(Fline10RefLastRepairDate) then
      line10RefLastRepairDate.Free;
    if Assigned(FpostRefLastRepairDate) then
      postRefLastRepairDate.Free;
    if Assigned(FpreviousPostRefLastRepairDate) then
      previousPostRefLastRepairDate.Free;
    inherited Destroy;
  end; 
  
  destructor ENLineRouteShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENLineRoute, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineRoute');
  RemClassRegistry.RegisterXSClass(ENLineRouteRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineRouteRef');
  RemClassRegistry.RegisterXSClass(ENLineRouteFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineRouteFilter');
  RemClassRegistry.RegisterXSClass(ENLineRouteShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineRouteShort');
  RemClassRegistry.RegisterXSClass(ENLineRouteShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENLineRouteShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENLineRouteShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENLineRouteShort');

  InvRegistry.RegisterInterface(TypeInfo(ENLineRouteControllerSoapPort), 'http://ksoe.org/ENLineRouteController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENLineRouteControllerSoapPort), 'http://ksoe.org/ENLineRouteController/action/ENLineRouteController.%operationName%');


end.
