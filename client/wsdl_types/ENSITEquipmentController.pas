unit ENSITEquipmentController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSITEquipTypeController 
   ,ENElementController 
   ,FINWorkerController 
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

  ENSITEquipment            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipmentRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITEquipment = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fserialnumber : WideString;
    Fsuppliername : WideString;
    Fisserver : Integer; 
    Fnum : WideString;
    Fsupplierdate : TXSDate;
    Fwarranty : Integer; 
    Fisliquidation : Integer; 
    Ftechnum1 : Integer; 
    Flisencepack : WideString;
    Ftechnum2 : Integer; 
    Fbatch : Integer; 
    Fdescr : WideString;
    Flocation : WideString;
    Finstalldate : TXSDate;
    Finputdate : TXSDate;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENSITEquipType;
//???
    Felement : ENElement;
//???
    Ffinworker : FINWorker;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property suppliername : WideString read Fsuppliername write Fsuppliername;
    property  isserver : Integer read Fisserver write Fisserver; 
    property num : WideString read Fnum write Fnum;
    property supplierdate : TXSDate read Fsupplierdate write Fsupplierdate;
    property  warranty : Integer read Fwarranty write Fwarranty; 
    property  isliquidation : Integer read Fisliquidation write Fisliquidation; 
    property  technum1 : Integer read Ftechnum1 write Ftechnum1; 
    property lisencepack : WideString read Flisencepack write Flisencepack;
    property  technum2 : Integer read Ftechnum2 write Ftechnum2; 
    property  batch : Integer read Fbatch write Fbatch; 
    property descr : WideString read Fdescr write Fdescr;
    property location : WideString read Flocation write Flocation;
    property installdate : TXSDate read Finstalldate write Finstalldate;
    property inputdate : TXSDate read Finputdate write Finputdate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENSITEquipType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
    property finworker : FINWorker read Ffinworker write Ffinworker; 
  end;

  ENSITEquipmentFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fserialnumber : WideString;
    Fsuppliername : WideString;
    Fisserver : Integer; 
    Fnum : WideString;
    Fsupplierdate : TXSDate;
    Fwarranty : Integer; 
    Fisliquidation : Integer; 
    Ftechnum1 : Integer; 
    Flisencepack : WideString;
    Ftechnum2 : Integer; 
    Fbatch : Integer; 
    Fdescr : WideString;
    Flocation : WideString;
    Finstalldate : TXSDate;
    Finputdate : TXSDate;
    FcommentGen : WideString;
    Fdomain_info : WideString;
    Fmodify_time : Int64;
//???
    FobjectType : ENSITEquipType;
//???
    Felement : ENElement;
//???
    Ffinworker : FINWorker;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property suppliername : WideString read Fsuppliername write Fsuppliername;
    property  isserver : Integer read Fisserver write Fisserver; 
    property num : WideString read Fnum write Fnum;
    property supplierdate : TXSDate read Fsupplierdate write Fsupplierdate;
    property  warranty : Integer read Fwarranty write Fwarranty; 
    property  isliquidation : Integer read Fisliquidation write Fisliquidation; 
    property  technum1 : Integer read Ftechnum1 write Ftechnum1; 
    property lisencepack : WideString read Flisencepack write Flisencepack;
    property  technum2 : Integer read Ftechnum2 write Ftechnum2; 
    property  batch : Integer read Fbatch write Fbatch; 
    property descr : WideString read Fdescr write Fdescr;
    property location : WideString read Flocation write Flocation;
    property installdate : TXSDate read Finstalldate write Finstalldate;
    property inputdate : TXSDate read Finputdate write Finputdate;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property domain_info : WideString read Fdomain_info write Fdomain_info;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property objectType : ENSITEquipType read FobjectType write FobjectType; 
    property element : ENElement read Felement write Felement; 
    property finworker : FINWorker read Ffinworker write Ffinworker; 
  end;


  ENSITEquipmentShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fserialnumber : WideString;
    Fsuppliername : WideString;
    Fnum : WideString;
    Fsupplierdate : TXSDate;
    Flisencepack : WideString;
    Fdescr : WideString;
    Flocation : WideString;
    Finstalldate : TXSDate;
    Finputdate : TXSDate;
    FobjectTypeCode : Integer; 
    FobjectTypeName : WideString;
    FobjectTypeDescription : WideString;
    FelementCode : Integer; 
    FfinworkerCode : Integer;
    Fren : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property serialnumber : WideString read Fserialnumber write Fserialnumber;
    property suppliername : WideString read Fsuppliername write Fsuppliername;
    property num : WideString read Fnum write Fnum;
    property supplierdate : TXSDate read Fsupplierdate write Fsupplierdate;
    property lisencepack : WideString read Flisencepack write Flisencepack;
    property descr : WideString read Fdescr write Fdescr;
    property location : WideString read Flocation write Flocation;
    property installdate : TXSDate read Finstalldate write Finstalldate;
    property inputdate : TXSDate read Finputdate write Finputdate;

    property objectTypeCode : Integer read FobjectTypeCode write FobjectTypeCode; 
    property objectTypeName : WideString read FobjectTypeName write FobjectTypeName; 
    property objectTypeDescription : WideString read FobjectTypeDescription write FobjectTypeDescription;
    property elementCode : Integer read FelementCode write FelementCode; //ENElementRef read FelementCode write FelementCode; 
    property finworkerCode : Integer read FfinworkerCode write FfinworkerCode; //FINWorkerRef read FfinworkerCode write FfinworkerCode;
    property ren : WideString read Fren write Fren; 
  end;

  ArrayOfENSITEquipmentShort = array of ENSITEquipmentShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITEquipmentShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITEquipmentShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITEquipmentShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITEquipmentController/message/
  // soapAction: http://ksoe.org/ENSITEquipmentController/action/ENSITEquipmentController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITEquipmentControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITEquipmentController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITEquipmentControllerSoapPort = interface(IInvokable)
  ['{d16dd16d-d16d-d16d-d16d-d16dd16dd16d}']
    function  add(const aENSITEquipment: ENSITEquipment): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITEquipment: ENSITEquipment); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITEquipment; stdcall;
    function  getList: ENSITEquipmentShortList; stdcall;
    function  getFilteredList(const aENSITEquipmentFilter: ENSITEquipmentFilter): ENSITEquipmentShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipmentShortList; stdcall;
    function  getScrollableFilteredList(const aENSITEquipmentFilter: ENSITEquipmentFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipmentShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITEquipmentShortList; stdcall;
  end; 


implementation

  destructor ENSITEquipment.Destroy;
  begin
    if Assigned(Fsupplierdate) then
      supplierdate.Free;
    if Assigned(Finstalldate) then
      installdate.Free;
    if Assigned(Finputdate) then
      inputdate.Free;
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Ffinworker) then
      finworker.Free;
    inherited Destroy;
  end;
  
  destructor ENSITEquipmentFilter.Destroy;
  begin
    if Assigned(Fsupplierdate) then
      supplierdate.Free;
    if Assigned(Finstalldate) then
      installdate.Free;
    if Assigned(Finputdate) then
      inputdate.Free;
    if Assigned(FobjectType) then
      objectType.Free;
    if Assigned(Felement) then
      element.Free;
    if Assigned(Ffinworker) then
      finworker.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITEquipmentShort.Destroy;
  begin
    if Assigned(Fsupplierdate) then
      supplierdate.Free;
    if Assigned(Finstalldate) then
      installdate.Free;
    if Assigned(Finputdate) then
      inputdate.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITEquipmentShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITEquipment, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipment');
  RemClassRegistry.RegisterXSClass(ENSITEquipmentRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipmentRef');
  RemClassRegistry.RegisterXSClass(ENSITEquipmentFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipmentFilter');
  RemClassRegistry.RegisterXSClass(ENSITEquipmentShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipmentShort');
  RemClassRegistry.RegisterXSClass(ENSITEquipmentShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITEquipmentShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITEquipmentShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITEquipmentShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITEquipmentControllerSoapPort), 'http://ksoe.org/ENSITEquipmentController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITEquipmentControllerSoapPort), 'http://ksoe.org/ENSITEquipmentController/action/ENSITEquipmentController.%operationName%');


end.
