unit RQMaterials2MeasurementController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQMeasurementController 
   ,RQMaterialsController 
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

  RQMaterials2Measurement            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterials2MeasurementRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterials2Measurement = class(TRemotable)
  private
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    Fmodify_time : Int64;
//???
    FmeasurementUnit : RQMeasurement;
//???
    FrqMaterialsRef : RQMaterialsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property measurementUnit : RQMeasurement read FmeasurementUnit write FmeasurementUnit; 
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef; 
  end;

  RQMaterials2MeasurementFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    Fmodify_time : Int64;
//???
    FmeasurementUnit : RQMeasurement;
//???
    FrqMaterialsRef : RQMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property measurementUnit : RQMeasurement read FmeasurementUnit write FmeasurementUnit; 
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef; 
  end;


  RQMaterials2MeasurementShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fcoef : TXSDecimal;
    FmeasurementUnitCode : Integer; 
    FmeasurementUnitName : WideString;
    FmeasurementUnitShortName : WideString;
    FmeasurementUnitOutCode : Integer; 
    FrqMaterialsRefCode : Integer; 
    FrqMaterialsRefOutCode : Integer; 
    FrqMaterialsRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property coef : TXSDecimal read Fcoef write Fcoef; 

    property measurementUnitCode : Integer read FmeasurementUnitCode write FmeasurementUnitCode; 
    property measurementUnitName : WideString read FmeasurementUnitName write FmeasurementUnitName; 
    property measurementUnitShortName : WideString read FmeasurementUnitShortName write FmeasurementUnitShortName; 
    property measurementUnitOutCode : Integer read FmeasurementUnitOutCode write FmeasurementUnitOutCode; 
    property rqMaterialsRefCode : Integer read FrqMaterialsRefCode write FrqMaterialsRefCode; 
    property rqMaterialsRefOutCode : Integer read FrqMaterialsRefOutCode write FrqMaterialsRefOutCode; 
    property rqMaterialsRefName : WideString read FrqMaterialsRefName write FrqMaterialsRefName; 
  end;

  ArrayOfRQMaterials2MeasurementShort = array of RQMaterials2MeasurementShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQMaterials2MeasurementShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQMaterials2MeasurementShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQMaterials2MeasurementShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQMaterials2MeasurementController/message/
  // soapAction: http://ksoe.org/RQMaterials2MeasurementController/action/RQMaterials2MeasurementController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQMaterials2MeasurementControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQMaterials2MeasurementController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQMaterials2MeasurementControllerSoapPort = interface(IInvokable)
  ['{1eba1eba-1eba-1eba-1eba-1eba1eba1eba}']
    function  add(const aRQMaterials2Measurement: RQMaterials2Measurement): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQMaterials2Measurement: RQMaterials2Measurement); stdcall;
    function  getObject(const anObjectCode: Integer): RQMaterials2Measurement; stdcall;
    function  getList: RQMaterials2MeasurementShortList; stdcall;
    function  getFilteredList(const aRQMaterials2MeasurementFilter: RQMaterials2MeasurementFilter): RQMaterials2MeasurementShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2MeasurementShortList; stdcall;
    function  getScrollableFilteredList(const aRQMaterials2MeasurementFilter: RQMaterials2MeasurementFilter; const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2MeasurementShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQMaterials2MeasurementShortList; stdcall;
  end; 


implementation

  destructor RQMaterials2Measurement.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FmeasurementUnit) then
      measurementUnit.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    inherited Destroy;
  end;
  
  destructor RQMaterials2MeasurementFilter.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    if Assigned(FmeasurementUnit) then
      measurementUnit.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQMaterials2MeasurementShort.Destroy;
  begin
    if Assigned(Fcoef) then
      coef.Free;
    inherited Destroy;
  end; 
  
  destructor RQMaterials2MeasurementShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQMaterials2Measurement, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2Measurement');
  RemClassRegistry.RegisterXSClass(RQMaterials2MeasurementRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2MeasurementRef');
  RemClassRegistry.RegisterXSClass(RQMaterials2MeasurementFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2MeasurementFilter');
  RemClassRegistry.RegisterXSClass(RQMaterials2MeasurementShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2MeasurementShort');
  RemClassRegistry.RegisterXSClass(RQMaterials2MeasurementShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials2MeasurementShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQMaterials2MeasurementShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQMaterials2MeasurementShort');

  InvRegistry.RegisterInterface(TypeInfo(RQMaterials2MeasurementControllerSoapPort), 'http://ksoe.org/RQMaterials2MeasurementController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQMaterials2MeasurementControllerSoapPort), 'http://ksoe.org/RQMaterials2MeasurementController/action/RQMaterials2MeasurementController.%operationName%');


end.
