unit ENAct2DFDocDecreeController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
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

  ENAct2DFDocDecree            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2DFDocDecreeRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2DFDocDecree = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
    Fspecifications : WideString;
    FnumberHours : Integer;
    FDFDocDecreeCode : Integer;
    FdfDocCode : Integer;
    FresponsFIO : WideString;
    FresponsPosition : WideString;
    FresponsGenitiveFIO : WideString;
    FresponsGenitivePosition : WideString;
    FresponsSurname : WideString;
    FresponsSurnameGenitive : WideString;
    FresponsName : WideString;
    FresponsNameGenitive : WideString;
    FresponsPatronimic : WideString;
    FresponsPatronimicGenitive : WideString;
    FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
    FsettingDecreeCode : Integer;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
property specifications : WideString read Fspecifications write Fspecifications;
    property numberHours : Integer read FnumberHours write FnumberHours;
    property DFDocDecreeCode : Integer read FDFDocDecreeCode write FDFDocDecreeCode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property responsFIO : WideString read FresponsFIO write FresponsFIO;
    property responsPosition : WideString read FresponsPosition write FresponsPosition;
    property responsGenitiveFIO : WideString read FresponsGenitiveFIO write FresponsGenitiveFIO;
    property responsGenitivePosition : WideString read FresponsGenitivePosition write FresponsGenitivePosition;
    property responsSurname : WideString read FresponsSurname write FresponsSurname;
    property responsSurnameGenitive : WideString read FresponsSurnameGenitive write FresponsSurnameGenitive;
    property responsName : WideString read FresponsName write FresponsName;
    property responsNameGenitive : WideString read FresponsNameGenitive write FresponsNameGenitive;
    property responsPatronimic : WideString read FresponsPatronimic write FresponsPatronimic;
    property responsPatronimicGenitive : WideString read FresponsPatronimicGenitive write FresponsPatronimicGenitive;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;
    property actRef : ENActRef read FactRef write FactRef;
    property settingDecreeCode : Integer read FsettingDecreeCode write FsettingDecreeCode;
  end;

{
  ENAct2DFDocDecreeFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
 Fspecifications : WideString;
    FnumberHours : Integer;
    FDFDocDecreeCode : Integer;
    FdfDocCode : Integer;
 FresponsFIO : WideString;
    FresponsPosition : WideString;
    FresponsGenitiveFIO : WideString;
    FresponsGenitivePosition : WideString;
    FresponsSurname : WideString;
    FresponsSurnameGenitive : WideString;
    FresponsName : WideString;
    FresponsNameGenitive : WideString;
    FresponsPatronimic : WideString;
    FresponsPatronimicGenitive : WideString;
    FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
//???
    FactRef : ENActRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
 property specifications : WideString read Fspecifications write Fspecifications;
    property numberHours : Integer read FnumberHours write FnumberHours;
    property DFDocDecreeCode : Integer read FDFDocDecreeCode write FDFDocDecreeCode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
property responsFIO : WideString read FresponsFIO write FresponsFIO;
    property responsPosition : WideString read FresponsPosition write FresponsPosition;
    property responsGenitiveFIO : WideString read FresponsGenitiveFIO write FresponsGenitiveFIO;
    property responsGenitivePosition : WideString read FresponsGenitivePosition write FresponsGenitivePosition;
    property responsSurname : WideString read FresponsSurname write FresponsSurname;
    property responsSurnameGenitive : WideString read FresponsSurnameGenitive write FresponsSurnameGenitive;
    property responsName : WideString read FresponsName write FresponsName;
    property responsNameGenitive : WideString read FresponsNameGenitive write FresponsNameGenitive;
    property responsPatronimic : WideString read FresponsPatronimic write FresponsPatronimic;
    property responsPatronimicGenitive : WideString read FresponsPatronimicGenitive write FresponsPatronimicGenitive;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;
    property actRef : ENActRef read FactRef write FactRef;
  end;
}

  ENAct2DFDocDecreeFilter = class(ENAct2DFDocDecree)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2DFDocDecreeShort = class(TRemotable)
  private
    Fcode : Integer;
    FcommentGen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
 Fspecifications : WideString;
    FnumberHours : Integer;
    FDFDocDecreeCode : Integer;
    FdfDocCode : Integer;
 FresponsFIO : WideString;
    FresponsPosition : WideString;
    FresponsGenitiveFIO : WideString;
    FresponsGenitivePosition : WideString;
    FresponsSurname : WideString;
    FresponsSurnameGenitive : WideString;
    FresponsName : WideString;
    FresponsNameGenitive : WideString;
    FresponsPatronimic : WideString;
    FresponsPatronimicGenitive : WideString;
    FdepartmentName : WideString;
    FdepartmentNameGenitive : WideString;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinMolCode : WideString;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FactRefMolCodeObject : WideString;
    FactRefCheckedByAccountant : TXSBoolean;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
 property specifications : WideString read Fspecifications write Fspecifications;
    property  numberHours : Integer read FnumberHours write FnumberHours;
    property  DFDocDecreeCode : Integer read FDFDocDecreeCode write FDFDocDecreeCode;
    property  dfDocCode : Integer read FdfDocCode write FdfDocCode;
property responsFIO : WideString read FresponsFIO write FresponsFIO;
    property responsPosition : WideString read FresponsPosition write FresponsPosition;
    property responsGenitiveFIO : WideString read FresponsGenitiveFIO write FresponsGenitiveFIO;
    property responsGenitivePosition : WideString read FresponsGenitivePosition write FresponsGenitivePosition;
    property responsSurname : WideString read FresponsSurname write FresponsSurname;
    property responsSurnameGenitive : WideString read FresponsSurnameGenitive write FresponsSurnameGenitive;
    property responsName : WideString read FresponsName write FresponsName;
    property responsNameGenitive : WideString read FresponsNameGenitive write FresponsNameGenitive;
    property responsPatronimic : WideString read FresponsPatronimic write FresponsPatronimic;
    property responsPatronimicGenitive : WideString read FresponsPatronimicGenitive write FresponsPatronimicGenitive;
    property departmentName : WideString read FdepartmentName write FdepartmentName;
    property departmentNameGenitive : WideString read FdepartmentNameGenitive write FdepartmentNameGenitive;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinMolCode : WideString read FactRefFinMolCode write FactRefFinMolCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property actRefMolCodeObject : WideString read FactRefMolCodeObject write FactRefMolCodeObject;
    property actRefCheckedByAccountant : TXSBoolean read FactRefCheckedByAccountant write FactRefCheckedByAccountant;
  end;

  ArrayOfENAct2DFDocDecreeShort = array of ENAct2DFDocDecreeShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2DFDocDecreeShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2DFDocDecreeShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2DFDocDecreeShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2DFDocDecreeController/message/
  // soapAction: http://ksoe.org/ENAct2DFDocDecreeController/action/ENAct2DFDocDecreeController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2DFDocDecreeControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2DFDocDecreeController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2DFDocDecreeControllerSoapPort = interface(IInvokable)
  ['{DA6A78AB-29A3-4C5F-91C0-20C7A30CA1DB}']
    function add(const aENAct2DFDocDecree: ENAct2DFDocDecree): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2DFDocDecree: ENAct2DFDocDecree); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2DFDocDecree; stdcall;
    function getList: ENAct2DFDocDecreeShortList; stdcall;
    function getFilteredList(const aENAct2DFDocDecreeFilter: ENAct2DFDocDecreeFilter): ENAct2DFDocDecreeShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocDecreeShortList; stdcall;
    function getScrollableFilteredList(const aENAct2DFDocDecreeFilter: ENAct2DFDocDecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocDecreeShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2DFDocDecreeShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2DFDocDecreeFilter: ENAct2DFDocDecreeFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2DFDocDecreeShort; stdcall;

    function  addWithSetting(const aENAct2DFDocDecree: ENAct2DFDocDecree): Integer; stdcall;
    procedure removeByObj(const aENAct2DFDocDecree: ENAct2DFDocDecree); stdcall;
  end;


implementation

  destructor ENAct2DFDocDecree.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2DFDocDecreeFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2DFDocDecreeFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2DFDocDecreeShort.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRefDateGen) then
      actRefDateGen.Free;
    if Assigned(FactRefDateEdit) then
      actRefDateEdit.Free;
    if Assigned(FactRefDateAct) then
      actRefDateAct.Free;
    inherited Destroy;
  end;

  destructor ENAct2DFDocDecreeShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2DFDocDecree, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocDecree');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocDecreeRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocDecreeRef');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocDecreeFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocDecreeFilter');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocDecreeShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocDecreeShort');
  RemClassRegistry.RegisterXSClass(ENAct2DFDocDecreeShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2DFDocDecreeShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2DFDocDecreeShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2DFDocDecreeShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2DFDocDecreeControllerSoapPort), 'http://ksoe.org/ENAct2DFDocDecreeController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2DFDocDecreeControllerSoapPort), 'http://ksoe.org/ENAct2DFDocDecreeController/action/ENAct2DFDocDecreeController.%operationName%');


end.
