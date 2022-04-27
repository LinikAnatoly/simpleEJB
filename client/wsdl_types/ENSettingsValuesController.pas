unit ENSettingsValuesController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENSettingsController
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

  ENSettingsValues            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettingsValuesRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENSettingsValues = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Fvalue : WideString;
    FuserAdd : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FsettingsRef : ENSettingsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property value : WideString read Fvalue write Fvalue;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property settingsRef : ENSettingsRef read FsettingsRef write FsettingsRef;
  end;

{
  ENSettingsValuesFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Fvalue : WideString;
    FuserAdd : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    FsettingsRef : ENSettingsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property value : WideString read Fvalue write Fvalue;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property settingsRef : ENSettingsRef read FsettingsRef write FsettingsRef;
  end;
}

  ENSettingsValuesFilter = class(ENSettingsValues)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENSettingsValuesShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Fvalue : WideString;
    FuserAdd : WideString;
    FcommentGen : WideString;
    FuserGen : WideString;
    FsettingsRefCode : Integer;
    FsettingsRefKey : WideString;
    FsettingsRefComment : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property value : WideString read Fvalue write Fvalue;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;

    property settingsRefCode : Integer read FsettingsRefCode write FsettingsRefCode;
    property settingsRefKey : WideString read FsettingsRefKey write FsettingsRefKey;
    property settingsRefComment : WideString read FsettingsRefComment write FsettingsRefComment;
  end;

  ArrayOfENSettingsValuesShort = array of ENSettingsValuesShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENSettingsValuesShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENSettingsValuesShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENSettingsValuesShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENSettingsValuesController/message/
  // soapAction: http://ksoe.org/ENSettingsValuesController/action/ENSettingsValuesController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENSettingsValuesControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENSettingsValuesController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENSettingsValuesControllerSoapPort = interface(IInvokable)
  ['{954AEB06-6C32-437E-B92F-B7208EB03E55}']
    function add(const aENSettingsValues: ENSettingsValues): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENSettingsValues: ENSettingsValues); stdcall;
    function getObject(const anObjectCode: Integer): ENSettingsValues; stdcall;
    function getList: ENSettingsValuesShortList; stdcall;
    function getFilteredList(const aENSettingsValuesFilter: ENSettingsValuesFilter): ENSettingsValuesShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENSettingsValuesShortList; stdcall;
    function getScrollableFilteredList(const aENSettingsValuesFilter: ENSettingsValuesFilter; const aFromPosition: Integer; const aQuantity: Integer): ENSettingsValuesShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENSettingsValuesShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENSettingsValuesFilter: ENSettingsValuesFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENSettingsValuesShort; stdcall;
	function getValue(const anKey: WideString): WideString; stdcall; overload;
	function getValue(const anKey: WideString; const date: TXSDate): WideString; stdcall; overload;
  end;


implementation

  destructor ENSettingsValues.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsettingsRef) then
      settingsRef.Free;
    inherited Destroy;
  end;

{
  destructor ENSettingsValuesFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FsettingsRef) then
      settingsRef.Free;
    inherited Destroy;
  end;
}

  destructor ENSettingsValuesFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENSettingsValuesShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    inherited Destroy;
  end;

  destructor ENSettingsValuesShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENSettingsValues, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsValues');
  RemClassRegistry.RegisterXSClass(ENSettingsValuesRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsValuesRef');
  RemClassRegistry.RegisterXSClass(ENSettingsValuesFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsValuesFilter');
  RemClassRegistry.RegisterXSClass(ENSettingsValuesShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsValuesShort');
  RemClassRegistry.RegisterXSClass(ENSettingsValuesShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENSettingsValuesShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENSettingsValuesShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENSettingsValuesShort');

  InvRegistry.RegisterInterface(TypeInfo(ENSettingsValuesControllerSoapPort), 'http://ksoe.org/ENSettingsValuesController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENSettingsValuesControllerSoapPort), 'http://ksoe.org/ENSettingsValuesController/action/ENSettingsValuesController.%operationName%');


end.
