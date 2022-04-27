unit ENSITFeatureController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENSITEquipmentController 
   ,ENSITFeatureTypeController 

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

  ENSITFeature            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeatureRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSITFeature = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fvalue : WideString;
//???
    Fequipment : ENSITEquipment;
//???
    FfeatureType : ENSITFeatureType;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property value : WideString read Fvalue write Fvalue;
    property equipment : ENSITEquipment read Fequipment write Fequipment; 
    property featureType : ENSITFeatureType read FfeatureType write FfeatureType; 

  end;

  ENSITFeatureFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fvalue : WideString;
//???
    Fequipment : ENSITEquipment;
//???
    FfeatureType : ENSITFeatureType;

  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property value : WideString read Fvalue write Fvalue;
    property equipment : ENSITEquipment read Fequipment write Fequipment;
    property featureType : ENSITFeatureType read FfeatureType write FfeatureType;

  end;


  ENSITFeatureShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fvalue : WideString;
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
    FfeatureTypeCode : Integer; 
    FfeatureTypeName : WideString;
    FfeatureTypeDesc : WideString;

  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property value : WideString read Fvalue write Fvalue;

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
    property featureTypeCode : Integer read FfeatureTypeCode write FfeatureTypeCode; 
    property featureTypeName : WideString read FfeatureTypeName write FfeatureTypeName; 
    property featureTypeDesc : WideString read FfeatureTypeDesc write FfeatureTypeDesc; 
   
  end;

  ArrayOfENSITFeatureShort = array of ENSITFeatureShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSITFeatureShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSITFeatureShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSITFeatureShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSITFeatureController/message/
  // soapAction: http://ksoe.org/ENSITFeatureController/action/ENSITFeatureController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSITFeatureControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSITFeatureController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSITFeatureControllerSoapPort = interface(IInvokable)
  ['{15621562-1562-1562-1562-156215621562}']
    function  add(const aENSITFeature: ENSITFeature): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSITFeature: ENSITFeature); stdcall;
    function  getObject(const anObjectCode: Integer): ENSITFeature; stdcall;
    function  getList: ENSITFeatureShortList; stdcall;
    function  getFilteredList(const aENSITFeatureFilter: ENSITFeatureFilter): ENSITFeatureShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureShortList; stdcall;
    function  getScrollableFilteredList(const aENSITFeatureFilter: ENSITFeatureFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSITFeatureShortList; stdcall;
  end; 


implementation

  destructor ENSITFeature.Destroy;
  begin
    if Assigned(Fequipment) then
      equipment.Free;
    if Assigned(FfeatureType) then
      featureType.Free;
    if Assigned(Fequipment) then
      equipment.Free;
    if Assigned(FfeatureType) then
      featureType.Free;
    inherited Destroy;
  end;
  
  destructor ENSITFeatureFilter.Destroy;
  begin
    if Assigned(Fequipment) then
      equipment.Free;
    if Assigned(FfeatureType) then
      featureType.Free;
    if Assigned(Fequipment) then
      equipment.Free;
    if Assigned(FfeatureType) then
      featureType.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureShort.Destroy;
  begin
    if Assigned(FequipmentSupplierdate) then
      equipmentSupplierdate.Free;
    if Assigned(FequipmentInstalldate) then
      equipmentInstalldate.Free;
    if Assigned(FequipmentInputdate) then
      equipmentInputdate.Free;
    if Assigned(FequipmentSupplierdate) then
      equipmentSupplierdate.Free;
    if Assigned(FequipmentInstalldate) then
      equipmentInstalldate.Free;
    if Assigned(FequipmentInputdate) then
      equipmentInputdate.Free;
    inherited Destroy;
  end; 
  
  destructor ENSITFeatureShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSITFeature, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeature');
  RemClassRegistry.RegisterXSClass(ENSITFeatureRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureRef');
  RemClassRegistry.RegisterXSClass(ENSITFeatureFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureFilter');
  RemClassRegistry.RegisterXSClass(ENSITFeatureShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureShort');
  RemClassRegistry.RegisterXSClass(ENSITFeatureShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSITFeatureShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSITFeatureShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSITFeatureShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSITFeatureControllerSoapPort), 'http://ksoe.org/ENSITFeatureController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSITFeatureControllerSoapPort), 'http://ksoe.org/ENSITFeatureController/action/ENSITFeatureController.%operationName%');


end.
