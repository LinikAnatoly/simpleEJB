unit RQMaterials2TKMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQMeasurementController 
   ,RQMaterialsController 
   ,TKMeasurementController 
   ,TKMaterialsController 
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

  RQMaterials2TKMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterials2TKMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterials2TKMaterials = class(TRemotable)
  private
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    Fmodify_time : Int64;
//???
    FrqMeasurement : RQMeasurement;
//???
    FrqMaterials : RQMaterials;
//???
    FtkMeasurement : TKMeasurement;
//???
    FtkMaterials : TKMaterials;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property rqMeasurement : RQMeasurement read FrqMeasurement write FrqMeasurement; 
    property rqMaterials : RQMaterials read FrqMaterials write FrqMaterials; 
    property tkMeasurement : TKMeasurement read FtkMeasurement write FtkMeasurement; 
    property tkMaterials : TKMaterials read FtkMaterials write FtkMaterials; 
  end;

  RQMaterials2TKMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    Fmodify_time : Int64;
//???
    FrqMeasurement : RQMeasurement;
//???
    FrqMaterials : RQMaterials;
//???
    FtkMeasurement : TKMeasurement;
//???
    FtkMaterials : TKMaterials;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property rqMeasurement : RQMeasurement read FrqMeasurement write FrqMeasurement; 
    property rqMaterials : RQMaterials read FrqMaterials write FrqMaterials; 
    property tkMeasurement : TKMeasurement read FtkMeasurement write FtkMeasurement; 
    property tkMaterials : TKMaterials read FtkMaterials write FtkMaterials; 
  end;


  RQMaterials2TKMaterialsShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    FrqMeasurementCode : Integer; 
    FrqMeasurementName : WideString;
    FrqMeasurementShortName : WideString;
    FrqMeasurementOutCode : Integer; 
    FrqMaterialsCode : Integer; 
    FrqMaterialsOutCode : Integer; 
    FrqMaterialsName : WideString;
    FtkMeasurementCode : Integer; 
    FtkMeasurementName : WideString;
    FtkMaterialsCode : Integer; 
    FtkMaterialsName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 

    property rqMeasurementCode : Integer read FrqMeasurementCode write FrqMeasurementCode; 
    property rqMeasurementName : WideString read FrqMeasurementName write FrqMeasurementName; 
    property rqMeasurementShortName : WideString read FrqMeasurementShortName write FrqMeasurementShortName; 
    property rqMeasurementOutCode : Integer read FrqMeasurementOutCode write FrqMeasurementOutCode; 
    property rqMaterialsCode : Integer read FrqMaterialsCode write FrqMaterialsCode; 
    property rqMaterialsOutCode : Integer read FrqMaterialsOutCode write FrqMaterialsOutCode; 
    property rqMaterialsName : WideString read FrqMaterialsName write FrqMaterialsName; 
    property tkMeasurementCode : Integer read FtkMeasurementCode write FtkMeasurementCode; 
    property tkMeasurementName : WideString read FtkMeasurementName write FtkMeasurementName; 
    property tkMaterialsCode : Integer read FtkMaterialsCode write FtkMaterialsCode; 
    property tkMaterialsName : WideString read FtkMaterialsName write FtkMaterialsName; 
  end;

  ArrayOfRQMaterials2TKMaterialsShort = array of RQMaterials2TKMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQMaterials2TKMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQMaterials2TKMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQMaterials2TKMaterialsShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQMaterials2TKMaterialsController/message/
  // soapAction: http://ksoe.org/RQMaterials2TKMaterialsController/action/RQMaterials2TKMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQMaterials2TKMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQMaterials2TKMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQMaterials2TKMaterialsControllerSoapPort = interface(IInvokable)
  ['{16921692-1692-1692-1692-169216921692}']
    function  add(const aRQMaterials2TKMaterials: RQMaterials2TKMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQMaterials2TKMaterials: RQMaterials2TKMaterials); stdcall;
    function  getObject(const anObjectCode: Integer): RQMaterials2TKMaterials; stdcall;
    function  getList: RQMaterials2TKMaterialsShortList; stdcall;
    function  getFilteredList(const aRQMaterials2TKMaterialsFilter: RQMaterials2TKMaterialsFilter): RQMaterials2TKMaterialsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2TKMaterialsShortList; stdcall;
    function  getScrollableFilteredList(const aRQMaterials2TKMaterialsFilter: RQMaterials2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2TKMaterialsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2TKMaterialsShortList; stdcall;
  end; 


implementation

  destructor RQMaterials2TKMaterials.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FrqMeasurement) then
      rqMeasurement.Free;
    if Assigned(FrqMaterials) then
      rqMaterials.Free;
    if Assigned(FtkMeasurement) then
      tkMeasurement.Free;
    if Assigned(FtkMaterials) then
      tkMaterials.Free;
    inherited Destroy;
  end;
  
  destructor RQMaterials2TKMaterialsFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FrqMeasurement) then
      rqMeasurement.Free;
    if Assigned(FrqMaterials) then
      rqMaterials.Free;
    if Assigned(FtkMeasurement) then
      tkMeasurement.Free;
    if Assigned(FtkMaterials) then
      tkMaterials.Free;
    inherited Destroy;
  end; 
  
  destructor RQMaterials2TKMaterialsShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end; 
  
  destructor RQMaterials2TKMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQMaterials2TKMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2TKMaterials');
  RemClassRegistry.RegisterXSClass(RQMaterials2TKMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2TKMaterialsRef');
  RemClassRegistry.RegisterXSClass(RQMaterials2TKMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2TKMaterialsFilter');
  RemClassRegistry.RegisterXSClass(RQMaterials2TKMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2TKMaterialsShort');
  RemClassRegistry.RegisterXSClass(RQMaterials2TKMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2TKMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQMaterials2TKMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQMaterials2TKMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(RQMaterials2TKMaterialsControllerSoapPort), 'http://ksoe.org/RQMaterials2TKMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQMaterials2TKMaterialsControllerSoapPort), 'http://ksoe.org/RQMaterials2TKMaterialsController/action/RQMaterials2TKMaterialsController.%operationName%');


end.
