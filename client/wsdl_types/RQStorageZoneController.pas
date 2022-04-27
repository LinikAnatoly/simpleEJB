unit RQStorageZoneController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQStorageController 
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

  RQStorageZone            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZoneRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZone = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    Fstorage : RQStorage;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storage : RQStorage read Fstorage write Fstorage; 
  end;
  
{
  RQStorageZoneFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    Fstorage : RQStorage;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storage : RQStorage read Fstorage write Fstorage; 
  end;
}

  RQStorageZoneFilter = class(RQStorageZone)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorageZoneShort = class(TRemotable)
  private
    Fcode : Integer; 
    Fname : WideString;
    Fdescription : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstorageCode : Integer; 
    FstorageName : WideString;
    FstorageShortName : WideString;
    FstorageDescription : WideString;
    FstorageUserGen : WideString;
    FstorageDateEdit : TXSDateTime;	
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property name : WideString read Fname write Fname;
    property description : WideString read Fdescription write Fdescription;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property storageCode : Integer read FstorageCode write FstorageCode; 
    property storageName : WideString read FstorageName write FstorageName; 
    property storageShortName : WideString read FstorageShortName write FstorageShortName; 
    property storageDescription : WideString read FstorageDescription write FstorageDescription; 
    property storageUserGen : WideString read FstorageUserGen write FstorageUserGen; 
    property storageDateEdit : TXSDateTime read FstorageDateEdit write FstorageDateEdit; 
  end;

  ArrayOfRQStorageZoneShort = array of RQStorageZoneShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorageZoneShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorageZoneShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorageZoneShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorageZoneController/message/
  // soapAction: http://ksoe.org/RQStorageZoneController/action/RQStorageZoneController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorageZoneControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorageZoneController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorageZoneControllerSoapPort = interface(IInvokable)
  ['{1bdc1bdc-1bdc-1bdc-1bdc-1bdc1bdc1bdc}']
    function  add(const aRQStorageZone: RQStorageZone): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorageZone: RQStorageZone); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorageZone; stdcall;
    function  getList: RQStorageZoneShortList; stdcall;
    function  getFilteredList(const aRQStorageZoneFilter: RQStorageZoneFilter): RQStorageZoneShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorageZoneShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorageZoneFilter: RQStorageZoneFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZoneShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZoneShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorageZoneFilter: RQStorageZoneFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function  getStrRestPurposesByZone(const zoneCode: Integer): WideString; stdcall;
    function  getRestPurposeIdByZone(const zoneCode: Integer; const rest_purpose_base_id : Integer): Integer; stdcall;
    function  getRestPurposeNameByZone(const zoneCode: Integer; const rest_purpose_base_id : Integer): WideString; stdcall;
  end;


implementation

  destructor RQStorageZone.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fstorage) then
      storage.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorageZoneFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fstorage) then
      storage.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorageZoneFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorageZoneShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageDateEdit) then
      storageDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorageZoneShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorageZone, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone');
  RemClassRegistry.RegisterXSClass(RQStorageZoneRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZoneRef');
  RemClassRegistry.RegisterXSClass(RQStorageZoneFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZoneFilter');
  RemClassRegistry.RegisterXSClass(RQStorageZoneShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZoneShort');
  RemClassRegistry.RegisterXSClass(RQStorageZoneShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZoneShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorageZoneShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorageZoneShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorageZoneControllerSoapPort), 'http://ksoe.org/RQStorageZoneController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorageZoneControllerSoapPort), 'http://ksoe.org/RQStorageZoneController/action/RQStorageZoneController.%operationName%');


end.
