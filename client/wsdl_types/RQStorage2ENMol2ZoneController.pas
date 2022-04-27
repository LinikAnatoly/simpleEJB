unit RQStorage2ENMol2ZoneController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQStorageController 
   ,RQStorageZoneController 
   ,ENMolController 
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

  RQStorage2ENMol2Zone            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorage2ENMol2ZoneRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorage2ENMol2Zone = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FstorageRef : RQStorageRef;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FmolRef : ENMolRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storageRef : RQStorageRef read FstorageRef write FstorageRef; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
    property molRef : ENMolRef read FmolRef write FmolRef; 
  end;
  
{
  RQStorage2ENMol2ZoneFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FstorageRef : RQStorageRef;
//???
    FzoneRef : RQStorageZoneRef;
//???
    FmolRef : ENMolRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property storageRef : RQStorageRef read FstorageRef write FstorageRef; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
    property molRef : ENMolRef read FmolRef write FmolRef; 
  end;
}

  RQStorage2ENMol2ZoneFilter = class(RQStorage2ENMol2Zone)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorage2ENMol2ZoneShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstorageRefCode : Integer; 
    FstorageRefName : WideString;
    FstorageRefShortName : WideString;
    FstorageRefDescription : WideString;
    FstorageRefUserGen : WideString;
    FstorageRefDateEdit : TXSDateTime;	
    FzoneRefCode : Integer; 
    FzoneRefName : WideString;
    FzoneRefDescription : WideString;
    FzoneRefUserGen : WideString;
    FzoneRefDateEdit : TXSDateTime;	
    FmolRefCode : Integer; 
    FmolRefFinCode : WideString;
    FmolRefName : WideString;
    FisFree : Integer;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	

    property storageRefCode : Integer read FstorageRefCode write FstorageRefCode; 
    property storageRefName : WideString read FstorageRefName write FstorageRefName; 
    property storageRefShortName : WideString read FstorageRefShortName write FstorageRefShortName; 
    property storageRefDescription : WideString read FstorageRefDescription write FstorageRefDescription; 
    property storageRefUserGen : WideString read FstorageRefUserGen write FstorageRefUserGen; 
    property storageRefDateEdit : TXSDateTime read FstorageRefDateEdit write FstorageRefDateEdit; 
    property zoneRefCode : Integer read FzoneRefCode write FzoneRefCode; 
    property zoneRefName : WideString read FzoneRefName write FzoneRefName; 
    property zoneRefDescription : WideString read FzoneRefDescription write FzoneRefDescription; 
    property zoneRefUserGen : WideString read FzoneRefUserGen write FzoneRefUserGen; 
    property zoneRefDateEdit : TXSDateTime read FzoneRefDateEdit write FzoneRefDateEdit; 
    property molRefCode : Integer read FmolRefCode write FmolRefCode; 
    property molRefFinCode : WideString read FmolRefFinCode write FmolRefFinCode; 
    property molRefName : WideString read FmolRefName write FmolRefName;
    property isFree : Integer read FisFree write FisFree; 
  end;

  ArrayOfRQStorage2ENMol2ZoneShort = array of RQStorage2ENMol2ZoneShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorage2ENMol2ZoneShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorage2ENMol2ZoneShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorage2ENMol2ZoneShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorage2ENMol2ZoneController/message/
  // soapAction: http://ksoe.org/RQStorage2ENMol2ZoneController/action/RQStorage2ENMol2ZoneController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorage2ENMol2ZoneControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorage2ENMol2ZoneController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorage2ENMol2ZoneControllerSoapPort = interface(IInvokable)
  ['{1f311f31-1f31-1f31-1f31-1f311f311f31}']
    function  add(const aRQStorage2ENMol2Zone: RQStorage2ENMol2Zone): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorage2ENMol2Zone: RQStorage2ENMol2Zone); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorage2ENMol2Zone; stdcall;
    function  getList: RQStorage2ENMol2ZoneShortList; stdcall;
    function  getFilteredList(const aRQStorage2ENMol2ZoneFilter: RQStorage2ENMol2ZoneFilter): RQStorage2ENMol2ZoneShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMol2ZoneShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorage2ENMol2ZoneFilter: RQStorage2ENMol2ZoneFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMol2ZoneShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorage2ENMol2ZoneShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorage2ENMol2ZoneFilter: RQStorage2ENMol2ZoneFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQStorage2ENMol2Zone.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    if Assigned(FmolRef) then
      molRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorage2ENMol2ZoneFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRef) then
      storageRef.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    if Assigned(FmolRef) then
      molRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorage2ENMol2ZoneFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorage2ENMol2ZoneShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstorageRefDateEdit) then
      storageRefDateEdit.Free;
    if Assigned(FzoneRefDateEdit) then
      zoneRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorage2ENMol2ZoneShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorage2ENMol2Zone, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol2Zone');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMol2ZoneRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol2ZoneRef');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMol2ZoneFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol2ZoneFilter');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMol2ZoneShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol2ZoneShort');
  RemClassRegistry.RegisterXSClass(RQStorage2ENMol2ZoneShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorage2ENMol2ZoneShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorage2ENMol2ZoneShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorage2ENMol2ZoneShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorage2ENMol2ZoneControllerSoapPort), 'http://ksoe.org/RQStorage2ENMol2ZoneController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorage2ENMol2ZoneControllerSoapPort), 'http://ksoe.org/RQStorage2ENMol2ZoneController/action/RQStorage2ENMol2ZoneController.%operationName%');


end.
