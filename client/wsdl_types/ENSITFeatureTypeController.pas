unit ENSITFeatureTypeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSITEquipmentController 
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

  ENSITFeatureType            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeatureTypeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeatureType = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fsorter : Integer; 
    Fdesc : WideString;
    Fpo : Integer; 
//???
    Fequipment : ENSITEquipment;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  sorter : Integer read Fsorter write Fsorter; 
    property desc : WideString read Fdesc write Fdesc;
    property  po : Integer read Fpo write Fpo; 
    property equipment : ENSITEquipment read Fequipment write Fequipment; 
  end;

  ENSITFeatureTypeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fsorter : Integer; 
    Fdesc : WideString;
    Fpo : Integer; 
//???
    Fequipment : ENSITEquipment;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property  sorter : Integer read Fsorter write Fsorter; 
    property desc : WideString read Fdesc write Fdesc;
    property  po : Integer read Fpo write Fpo; 
    property equipment : ENSITEquipment read Fequipment write Fequipment; 
  end;


  ENSITFeatureTypeShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdesc : WideString;
    FequipmentCode : Integer; 
    FequipmentName : WideString;
    FequipmentSerialnumber : WideString;
    FequipmentSuppliername : WideString;
    FequipmentNum : WideString;
    FequipmentSupplierdate : TXSDate;
    FequipmentLisencepack : WideString;
    FequipmentDescr : WideString;
    FequipmentLocation : WideString;
    FequipmentInstalldate : TXSDate;
    FequipmentInputdate : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property desc : WideString read Fdesc write Fdesc;

    property equipmentCode : Integer read FequipmentCode write FequipmentCode; 
    property equipmentName : WideString read FequipmentName write FequipmentName; 
    property equipmentSerialnumber : WideString read FequipmentSerialnumber write FequipmentSerialnumber; 
    property equipmentSuppliername : WideString read FequipmentSuppliername write FequipmentSuppliername; 
    property equipmentNum : WideString read FequipmentNum write FequipmentNum; 
    property equipmentSupplierdate : TXSDate read FequipmentSupplierdate write FequipmentSupplierdate; 
    property equipmentLisencepack : WideString read FequipmentLisencepack write FequipmentLisencepack; 
    property equipmentDescr : WideString read FequipmentDescr write FequipmentDescr; 
    property equipmentLocation : WideString read FequipmentLocation write FequipmentLocation; 
    property equipmentInstalldate : TXSDate read FequipmentInstalldate write FequipmentInstalldate; 
    property equipmentInputdate : TXSDate read FequipmentInputdate write FequipmentInputdate; 
  end;

  ArrayOfENSITFeatureTypeShort = array of ENSITFeatureTypeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITFeatureTypeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITFeatureTypeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITFeatureTypeShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITFeatureTypeController/message/
  // soapAction: http://ksoe.org/ENSITFeatureTypeController/action/ENSITFeatureTypeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITFeatureTypeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITFeatureTypeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITFeatureTypeControllerSoapPort = interface(IInvokable)
  ['{536d536d-536d-536d-536d-536d536d536d}']
    function  add(const aENSITFeatureType: ENSITFeatureType): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITFeatureType: ENSITFeatureType); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITFeatureType; stdcall;
    function  getList: ENSITFeatureTypeShortList; stdcall;
    function  getFilteredList(const aENSITFeatureTypeFilter: ENSITFeatureTypeFilter): ENSITFeatureTypeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureTypeShortList; stdcall;
    function  getScrollableFilteredList(const aENSITFeatureTypeFilter: ENSITFeatureTypeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureTypeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureTypeShortList; stdcall;
  end; 


implementation

  destructor ENSITFeatureType.Destroy;
  begin
    if Assigned(Fequipment) then
      equipment.Free;
    inherited Destroy;
  end;
  
  destructor ENSITFeatureTypeFilter.Destroy;
  begin
    if Assigned(Fequipment) then
      equipment.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureTypeShort.Destroy;
  begin
    if Assigned(FequipmentSupplierdate) then
      equipmentSupplierdate.Free;
    if Assigned(FequipmentInstalldate) then
      equipmentInstalldate.Free;
    if Assigned(FequipmentInputdate) then
      equipmentInputdate.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureTypeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITFeatureType, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureType');
  RemClassRegistry.RegisterXSClass(ENSITFeatureTypeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureTypeRef');
  RemClassRegistry.RegisterXSClass(ENSITFeatureTypeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureTypeFilter');
  RemClassRegistry.RegisterXSClass(ENSITFeatureTypeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureTypeShort');
  RemClassRegistry.RegisterXSClass(ENSITFeatureTypeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureTypeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITFeatureTypeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITFeatureTypeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITFeatureTypeControllerSoapPort), 'http://ksoe.org/ENSITFeatureTypeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITFeatureTypeControllerSoapPort), 'http://ksoe.org/ENSITFeatureTypeController/action/ENSITFeatureTypeController.%operationName%');


end.
