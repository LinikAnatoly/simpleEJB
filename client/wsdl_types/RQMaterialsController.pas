unit RQMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQMaterialsGroupController 
   ,RQMeasurementController 
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

  RQMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQMaterials = class(TRemotable)
  private
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    FdateCreate : TXSDate;
    FdateDelete : TXSDate;
    Fmodify_time : Int64;
//???
    FgroupRef : RQMaterialsGroupRef;
//???
    Fmeasurement : RQMeasurement;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property dateCreate : TXSDate read FdateCreate write FdateCreate;
    property dateDelete : TXSDate read FdateDelete write FdateDelete;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property groupRef : RQMaterialsGroupRef read FgroupRef write FgroupRef; 
    property measurement : RQMeasurement read Fmeasurement write Fmeasurement; 
  end;

  RQMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FshortName : WideString;
    FdateCreate : TXSDate;
    FdateDelete : TXSDate;
    Fmodify_time : Int64;
//???
    FgroupRef : RQMaterialsGroupRef;
//???
    Fmeasurement : RQMeasurement;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;
    property shortName : WideString read FshortName write FshortName;
    property dateCreate : TXSDate read FdateCreate write FdateCreate;
    property dateDelete : TXSDate read FdateDelete write FdateDelete;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property groupRef : RQMaterialsGroupRef read FgroupRef write FgroupRef; 
    property measurement : RQMeasurement read Fmeasurement write Fmeasurement; 
  end;


  RQMaterialsShort = class(TRemotable)
  private
    Fcode : Integer; 
    FoutCode : Integer; 
    Fname : WideString;
    FgroupRefCode : Integer; 
    FgroupRefOutCode : Integer; 
    FgroupRefName : WideString;
    FmeasurementCode : Integer; 
    FmeasurementName : WideString;
    FmeasurementShortName : WideString;
    FmeasurementOutCode : Integer; 
  published
    property  code : Integer read Fcode write Fcode; 
    property  outCode : Integer read FoutCode write FoutCode; 
    property name : WideString read Fname write Fname;

    property groupRefCode : Integer read FgroupRefCode write FgroupRefCode; 
    property groupRefOutCode : Integer read FgroupRefOutCode write FgroupRefOutCode; 
    property groupRefName : WideString read FgroupRefName write FgroupRefName; 
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode; 
    property measurementName : WideString read FmeasurementName write FmeasurementName; 
    property measurementShortName : WideString read FmeasurementShortName write FmeasurementShortName; 
    property measurementOutCode : Integer read FmeasurementOutCode write FmeasurementOutCode; 
  end;

  ArrayOfRQMaterialsShort = array of RQMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQMaterialsShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQMaterialsController/message/
  // soapAction: http://ksoe.org/RQMaterialsController/action/RQMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQMaterialsControllerSoapPort = interface(IInvokable)
  ['{12de12de-12de-12de-12de-12de12de12de}']
    function  add(const aRQMaterials: RQMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQMaterials: RQMaterials); stdcall;
    function  getObject(const anObjectCode: Integer): RQMaterials; stdcall;
    function  getList: RQMaterialsShortList; stdcall;
    function  getFilteredList(const aRQMaterialsFilter: RQMaterialsFilter): RQMaterialsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsShortList; stdcall;
    function  getScrollableFilteredList(const aRQMaterialsFilter: RQMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQMaterialsShortList; stdcall;
  end; 


implementation

  destructor RQMaterials.Destroy;
  begin
    if Assigned(FdateCreate) then
      dateCreate.Free;
    if Assigned(FdateDelete) then
      dateDelete.Free;
    if Assigned(FgroupRef) then
      groupRef.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    inherited Destroy;
  end;
  
  destructor RQMaterialsFilter.Destroy;
  begin
    if Assigned(FdateCreate) then
      dateCreate.Free;
    if Assigned(FdateDelete) then
      dateDelete.Free;
    if Assigned(FgroupRef) then
      groupRef.Free;
    if Assigned(Fmeasurement) then
      measurement.Free;
    inherited Destroy;
  end; 
  
  
  destructor RQMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterials');
  RemClassRegistry.RegisterXSClass(RQMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsRef');
  RemClassRegistry.RegisterXSClass(RQMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsFilter');
  RemClassRegistry.RegisterXSClass(RQMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsShort');
  RemClassRegistry.RegisterXSClass(RQMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(RQMaterialsControllerSoapPort), 'http://ksoe.org/RQMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQMaterialsControllerSoapPort), 'http://ksoe.org/RQMaterialsController/action/RQMaterialsController.%operationName%');


end.
