unit ENFuelSheetVolumesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelSheetVolumesStatusController
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

  ENFuelSheetVolumes            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolumes = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FdateGen : TXSDate;
    FstartDate : TXSDate;
    FendDate : TXSDate;
    FfuelType : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FstatusRef : ENFuelSheetVolumesStatusRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property  fuelType : Integer read FfuelType write FfuelType;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENFuelSheetVolumesStatusRef read FstatusRef write FstatusRef;
  end;

{
  ENFuelSheetVolumesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FdateGen : TXSDate;
    FstartDate : TXSDate;
    FendDate : TXSDate;
    FfuelType : Integer;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
    Fmodify_time : Int64;
//???
    FstatusRef : ENFuelSheetVolumesStatusRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property  fuelType : Integer read FfuelType write FfuelType;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property statusRef : ENFuelSheetVolumesStatusRef read FstatusRef write FstatusRef;
  end;
}

  ENFuelSheetVolumesFilter = class(ENFuelSheetVolumes)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelSheetVolumesShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FdateGen : TXSDate;
    FstartDate : TXSDate;
    FendDate : TXSDate;
    FfuelType : Integer;
    /////
    FfuelTypeName : WideString;
    /////
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property startDate : TXSDate read FstartDate write FstartDate;
    property endDate : TXSDate read FendDate write FendDate;
    property  fuelType : Integer read FfuelType write FfuelType;
    /////
    property fuelTypeName : WideString read FfuelTypeName write FfuelTypeName;
    /////
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
  end;

  ArrayOfENFuelSheetVolumesShort = array of ENFuelSheetVolumesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelSheetVolumesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelSheetVolumesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelSheetVolumesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelSheetVolumesController/message/
  // soapAction: http://ksoe.org/ENFuelSheetVolumesController/action/ENFuelSheetVolumesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelSheetVolumesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelSheetVolumesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelSheetVolumesControllerSoapPort = interface(IInvokable)
  ['{8B206953-E531-4BDE-896E-79788BFFFF1A}']
    //function add(const aENFuelSheetVolumes: ENFuelSheetVolumes): Integer; stdcall;
    function add(const aENFuelSheetVolumes: ENFuelSheetVolumes; const aYear: Integer; const aMonth: Integer; const aDecadeNumber: Integer): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelSheetVolumes: ENFuelSheetVolumes); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelSheetVolumes; stdcall;
    function getList: ENFuelSheetVolumesShortList; stdcall;
    function getFilteredList(const aENFuelSheetVolumesFilter: ENFuelSheetVolumesFilter): ENFuelSheetVolumesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesShortList; stdcall;
    function getScrollableFilteredList(const aENFuelSheetVolumesFilter: ENFuelSheetVolumesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolumesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelSheetVolumesFilter: ENFuelSheetVolumesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelSheetVolumesShort; stdcall;

    procedure approve(const anObjectCode: Integer); stdcall;
    procedure undoApprove(const anObjectCode: Integer); stdcall;
  end;


implementation

  destructor ENFuelSheetVolumes.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelSheetVolumesFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelSheetVolumesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelSheetVolumesShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FstartDate) then
      startDate.Free;
    if Assigned(FendDate) then
      endDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelSheetVolumesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumes, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumes');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesRef');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesFilter');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesShort');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolumesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolumesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelSheetVolumesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelSheetVolumesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelSheetVolumesControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelSheetVolumesControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolumesController/action/ENFuelSheetVolumesController.%operationName%');


end.
