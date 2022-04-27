unit RQStorageZone2RestPurposeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQStorageZoneController 
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

  RQStorageZone2RestPurpose            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZone2RestPurposeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQStorageZone2RestPurpose = class(TRemotable)
  private
    Fcode : Integer; 
    Frest_purpose_base_id : Integer; 
    Frest_purpose_id : Integer; 
    Frest_purpose_type_id : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;	
    Fmodify_time : Int64;
//???
    FzoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property  rest_purpose_base_id : Integer read Frest_purpose_base_id write Frest_purpose_base_id; 
    property  rest_purpose_id : Integer read Frest_purpose_id write Frest_purpose_id; 
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;	
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
  end;
  
{
  RQStorageZone2RestPurposeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    Frest_purpose_base_id : Integer; 
    Frest_purpose_id : Integer; 
    Frest_purpose_type_id : Integer; 
    FuserGen : WideString;
    FdateEdit : DateTime; 
    Fmodify_time : Int64;
//???
    FzoneRef : RQStorageZoneRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property  rest_purpose_base_id : Integer read Frest_purpose_base_id write Frest_purpose_base_id; 
    property  rest_purpose_id : Integer read Frest_purpose_id write Frest_purpose_id; 
    property  rest_purpose_type_id : Integer read Frest_purpose_type_id write Frest_purpose_type_id; 
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property zoneRef : RQStorageZoneRef read FzoneRef write FzoneRef; 
  end;
}

  RQStorageZone2RestPurposeFilter = class(RQStorageZone2RestPurpose)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  RQStorageZone2RestPurposeShort = class(TRemotable)
  private
    Fcode : Integer; 
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FzoneRefCode : Integer; 
    FzoneRefName : WideString;
    FzoneRefDescription : WideString;
    FzoneRefUserGen : WideString;
    FzoneRefDateEdit : TXSDateTime;	
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
  end;

  ArrayOfRQStorageZone2RestPurposeShort = array of RQStorageZone2RestPurposeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQStorageZone2RestPurposeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQStorageZone2RestPurposeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQStorageZone2RestPurposeShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQStorageZone2RestPurposeController/message/
  // soapAction: http://ksoe.org/RQStorageZone2RestPurposeController/action/RQStorageZone2RestPurposeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQStorageZone2RestPurposeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQStorageZone2RestPurposeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQStorageZone2RestPurposeControllerSoapPort = interface(IInvokable)
  ['{19971997-1997-1997-1997-199719971997}']
    function  add(const aRQStorageZone2RestPurpose: RQStorageZone2RestPurpose): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQStorageZone2RestPurpose: RQStorageZone2RestPurpose); stdcall;
    function  getObject(const anObjectCode: Integer): RQStorageZone2RestPurpose; stdcall;
    function  getList: RQStorageZone2RestPurposeShortList; stdcall;
    function  getFilteredList(const aRQStorageZone2RestPurposeFilter: RQStorageZone2RestPurposeFilter): RQStorageZone2RestPurposeShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2RestPurposeShortList; stdcall;
    function  getScrollableFilteredList(const aRQStorageZone2RestPurposeFilter: RQStorageZone2RestPurposeFilter; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2RestPurposeShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQStorageZone2RestPurposeShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aRQStorageZone2RestPurposeFilter: RQStorageZone2RestPurposeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor RQStorageZone2RestPurpose.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    inherited Destroy;
  end;

{  
  destructor RQStorageZone2RestPurposeFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRef) then
      zoneRef.Free;
    inherited Destroy;
  end; 
}

  destructor RQStorageZone2RestPurposeFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor RQStorageZone2RestPurposeShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FzoneRefDateEdit) then
      zoneRefDateEdit.Free;
    inherited Destroy;
  end; 
  
  destructor RQStorageZone2RestPurposeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQStorageZone2RestPurpose, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2RestPurpose');
  RemClassRegistry.RegisterXSClass(RQStorageZone2RestPurposeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2RestPurposeRef');
  RemClassRegistry.RegisterXSClass(RQStorageZone2RestPurposeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2RestPurposeFilter');
  RemClassRegistry.RegisterXSClass(RQStorageZone2RestPurposeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2RestPurposeShort');
  RemClassRegistry.RegisterXSClass(RQStorageZone2RestPurposeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQStorageZone2RestPurposeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQStorageZone2RestPurposeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQStorageZone2RestPurposeShort');

  InvRegistry.RegisterInterface(TypeInfo(RQStorageZone2RestPurposeControllerSoapPort), 'http://ksoe.org/RQStorageZone2RestPurposeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQStorageZone2RestPurposeControllerSoapPort), 'http://ksoe.org/RQStorageZone2RestPurposeController/action/RQStorageZone2RestPurposeController.%operationName%');


end.
