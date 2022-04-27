unit RQStorageZone2TKMaterialsController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQStorageZoneController 
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

  RQStorageZone2TKMaterials            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZone2TKMaterialsRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZone2TKMaterials = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
  end;
  
{
  RQStorageZone2TKMaterialsFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef; 
  end;
}

  RQStorageZone2TKMaterialsFilter = class(RQStorageZone2TKMaterials)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorageZone2TKMaterialsShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FzoneRefCode : Integer; 
    FzoneRefName : WideString;
    FzoneRefDescription : WideString;
    FzoneRefUserGen : WideString;
    FzoneRefDateEdit : TXSDateTime;	
    FmaterialRefCode : Integer; 
    FmaterialRefName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer; 
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
    FmaterialRefCostnkre : TXSDecimal;
    FmaterialRefWeight : TXSDecimal;
    FmaterialRefCostAlternative : TXSDecimal;
    FstorageName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode; 
    property zoneRefName : WideString read FzoneRefName write FzoneRefName; 
    property zoneRefDescription : WideString read FzoneRefDescription write FzoneRefDescription; 
    property zoneRefUserGen : WideString read FzoneRefUserGen write FzoneRefUserGen; 
    property zoneRefDateEdit : TXSDateTime read FzoneRefDateEdit write FzoneRefDateEdit; 
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode; 
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName; 
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost; 
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate; 
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog; 
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid; 
    property materialRefCostnkre : TXSDecimal read FmaterialRefCostnkre write FmaterialRefCostnkre; 
    property materialRefWeight : TXSDecimal read FmaterialRefWeight write FmaterialRefWeight; 
    property materialRefCostAlternative : TXSDecimal read FmaterialRefCostAlternative write FmaterialRefCostAlternative;
    property storageName : WideString read FstorageName write FstorageName;
  end;

  ArrayOfRQStorageZone2TKMaterialsShort = array of RQStorageZone2TKMaterialsShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorageZone2TKMaterialsShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorageZone2TKMaterialsShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorageZone2TKMaterialsShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorageZone2TKMaterialsController/message/
  // soapAction: http://ksoe.org/RQStorageZone2TKMaterialsController/action/RQStorageZone2TKMaterialsController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorageZone2TKMaterialsControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorageZone2TKMaterialsController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorageZone2TKMaterialsControllerSoapPort = interface(IInvokable)
  ['{1a4d1a4d-1a4d-1a4d-1a4d-1a4d1a4d1a4d}']
    function  add(const aRQStorageZone2TKMaterials: RQStorageZone2TKMaterials): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorageZone2TKMaterials: RQStorageZone2TKMaterials); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorageZone2TKMaterials; stdcall;
    function  getList: RQStorageZone2TKMaterialsShortList; stdcall;
    function  getFilteredList(const aRQStorageZone2TKMaterialsFilter: RQStorageZone2TKMaterialsFilter): RQStorageZone2TKMaterialsShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2TKMaterialsShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorageZone2TKMaterialsFilter: RQStorageZone2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2TKMaterialsShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2TKMaterialsShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorageZone2TKMaterialsFilter: RQStorageZone2TKMaterialsFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

    function addRecursive(const aRQStorageZone2TKMaterials : RQStorageZone2TKMaterials): Integer; stdcall;
    
  end; 


implementation

  destructor RQStorageZone2TKMaterials.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorageZone2TKMaterialsFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorageZone2TKMaterialsFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorageZone2TKMaterialsShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRefDateEdit) then
      zoneRefDateEdit.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    if Assigned(FmaterialRefCostnkre) then
      materialRefCostnkre.Free;
    if Assigned(FmaterialRefWeight) then
      materialRefWeight.Free;
    if Assigned(FmaterialRefCostAlternative) then
      materialRefCostAlternative.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorageZone2TKMaterialsShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorageZone2TKMaterials, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2TKMaterials');
  RemClassRegistry.RegisterXSClass(RQStorageZone2TKMaterialsRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2TKMaterialsRef');
  RemClassRegistry.RegisterXSClass(RQStorageZone2TKMaterialsFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2TKMaterialsFilter');
  RemClassRegistry.RegisterXSClass(RQStorageZone2TKMaterialsShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2TKMaterialsShort');
  RemClassRegistry.RegisterXSClass(RQStorageZone2TKMaterialsShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2TKMaterialsShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorageZone2TKMaterialsShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorageZone2TKMaterialsShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorageZone2TKMaterialsControllerSoapPort), 'http://ksoe.org/RQStorageZone2TKMaterialsController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorageZone2TKMaterialsControllerSoapPort), 'http://ksoe.org/RQStorageZone2TKMaterialsController/action/RQStorageZone2TKMaterialsController.%operationName%');


end.
