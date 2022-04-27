unit ENFuelSheetVolItemDataController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENFuelSheetVolumesController
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

  ENFuelSheetVolItemData            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolItemDataRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelSheetVolItemData = class(TRemotable)
  private
    Fcode : Integer;
    Fplan_code : Integer;
    Fdatestart : TXSDate;
    Fcountfact : TXSDecimal;
    Fkindcode : Integer;
    Fstaterefcode : Integer;
    Ftyperefcode : Integer;
    Fbudgetrefcode : Integer;
    Fmaterialrefcode : Integer;
    Ftransport_department : Integer;
    Fdepartmentrefcode : Integer;
//???
    FsheetVolumesRef : ENFuelSheetVolumesRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  plan_code : Integer read Fplan_code write Fplan_code;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property  kindcode : Integer read Fkindcode write Fkindcode;
    property  staterefcode : Integer read Fstaterefcode write Fstaterefcode;
    property  typerefcode : Integer read Ftyperefcode write Ftyperefcode;
    property  budgetrefcode : Integer read Fbudgetrefcode write Fbudgetrefcode;
    property  materialrefcode : Integer read Fmaterialrefcode write Fmaterialrefcode;
    property  transport_department : Integer read Ftransport_department write Ftransport_department;
    property  departmentrefcode : Integer read Fdepartmentrefcode write Fdepartmentrefcode;
    property sheetVolumesRef : ENFuelSheetVolumesRef read FsheetVolumesRef write FsheetVolumesRef;
  end;

{
  ENFuelSheetVolItemDataFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fplan_code : Integer;
    Fdatestart : TXSDate;
    Fcountfact : TXSDecimal;
    Fkindcode : Integer;
    Fstaterefcode : Integer;
    Ftyperefcode : Integer;
    Fbudgetrefcode : Integer;
    Fmaterialrefcode : Integer;
    Ftransport_department : Integer;
    Fdepartmentrefcode : Integer;
//???
    FsheetVolumesRef : ENFuelSheetVolumesRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property  plan_code : Integer read Fplan_code write Fplan_code;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property  kindcode : Integer read Fkindcode write Fkindcode;
    property  staterefcode : Integer read Fstaterefcode write Fstaterefcode;
    property  typerefcode : Integer read Ftyperefcode write Ftyperefcode;
    property  budgetrefcode : Integer read Fbudgetrefcode write Fbudgetrefcode;
    property  materialrefcode : Integer read Fmaterialrefcode write Fmaterialrefcode;
    property  transport_department : Integer read Ftransport_department write Ftransport_department;
    property  departmentrefcode : Integer read Fdepartmentrefcode write Fdepartmentrefcode;
    property sheetVolumesRef : ENFuelSheetVolumesRef read FsheetVolumesRef write FsheetVolumesRef;
  end;
}

  ENFuelSheetVolItemDataFilter = class(ENFuelSheetVolItemData)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelSheetVolItemDataShort = class(TRemotable)
  private
    Fcode : Integer;
    Fplan_code : Integer;
    Fdatestart : TXSDate;
    Fcountfact : TXSDecimal;
    Fkindcode : Integer;
    Fstaterefcode : Integer;
    Ftyperefcode : Integer;
    Fbudgetrefcode : Integer;
    Fmaterialrefcode : Integer;
    Ftransport_department : Integer;
    Fdepartmentrefcode : Integer;

    FsheetVolumesRefCode : Integer;
    FsheetVolumesRefName : WideString;
    FsheetVolumesRefDateGen : TXSDate;
    FsheetVolumesRefStartDate : TXSDate;
    FsheetVolumesRefEndDate : TXSDate;
    FsheetVolumesRefUserGen : WideString;
    FsheetVolumesRefDateEdit : TXSDateTime;

    /////
    FobjectName : WideString;
    FinvNumber : WideString;
    FkindName : WideString;
    FstateRefShortName : WideString;
    FtypeRefName : WideString;
    FbudgetRefShortName : WideString;
    FmaterialName : WideString;
    FdepartmentRefShortName : WideString;
    FstatusName : WideString;
    FrenRefName : WideString;
    /////
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  plan_code : Integer read Fplan_code write Fplan_code;
    property datestart : TXSDate read Fdatestart write Fdatestart;
    property countfact : TXSDecimal read Fcountfact write Fcountfact;
    property  kindcode : Integer read Fkindcode write Fkindcode;
    property  staterefcode : Integer read Fstaterefcode write Fstaterefcode;
    property  typerefcode : Integer read Ftyperefcode write Ftyperefcode;
    property  budgetrefcode : Integer read Fbudgetrefcode write Fbudgetrefcode;
    property  materialrefcode : Integer read Fmaterialrefcode write Fmaterialrefcode;
    property  transport_department : Integer read Ftransport_department write Ftransport_department;
    property  departmentrefcode : Integer read Fdepartmentrefcode write Fdepartmentrefcode;

    property sheetVolumesRefCode : Integer read FsheetVolumesRefCode write FsheetVolumesRefCode;
    property sheetVolumesRefName : WideString read FsheetVolumesRefName write FsheetVolumesRefName;
    property sheetVolumesRefDateGen : TXSDate read FsheetVolumesRefDateGen write FsheetVolumesRefDateGen;
    property sheetVolumesRefStartDate : TXSDate read FsheetVolumesRefStartDate write FsheetVolumesRefStartDate;
    property sheetVolumesRefEndDate : TXSDate read FsheetVolumesRefEndDate write FsheetVolumesRefEndDate;
    property sheetVolumesRefUserGen : WideString read FsheetVolumesRefUserGen write FsheetVolumesRefUserGen;
    property sheetVolumesRefDateEdit : TXSDateTime read FsheetVolumesRefDateEdit write FsheetVolumesRefDateEdit;

    /////
    property objectName : WideString read FobjectName write FobjectName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property kindName : WideString read FkindName write FkindName;
    property stateRefShortName : WideString read FstateRefShortName write FstateRefShortName;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property materialName : WideString read FmaterialName write FmaterialName;
    property departmentRefShortName : WideString read FdepartmentRefShortName write FdepartmentRefShortName;
    property statusName : WideString read FstatusName write FstatusName;
    property renRefName : WideString read FrenRefName write FrenRefName;
    /////
  end;

  ArrayOfENFuelSheetVolItemDataShort = array of ENFuelSheetVolItemDataShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelSheetVolItemDataShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelSheetVolItemDataShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelSheetVolItemDataShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelSheetVolItemDataController/message/
  // soapAction: http://ksoe.org/ENFuelSheetVolItemDataController/action/ENFuelSheetVolItemDataController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelSheetVolItemDataControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelSheetVolItemDataController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelSheetVolItemDataControllerSoapPort = interface(IInvokable)
  ['{7F5EAFB5-C621-4DEC-B32B-C0D18799A0D3}']
    function add(const aENFuelSheetVolItemData: ENFuelSheetVolItemData): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelSheetVolItemData: ENFuelSheetVolItemData); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelSheetVolItemData; stdcall;
    function getList: ENFuelSheetVolItemDataShortList; stdcall;
    function getFilteredList(const aENFuelSheetVolItemDataFilter: ENFuelSheetVolItemDataFilter): ENFuelSheetVolItemDataShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolItemDataShortList; stdcall;
    function getScrollableFilteredList(const aENFuelSheetVolItemDataFilter: ENFuelSheetVolItemDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolItemDataShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelSheetVolItemDataShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelSheetVolItemDataFilter: ENFuelSheetVolItemDataFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelSheetVolItemDataShort; stdcall;
  end;


implementation

  destructor ENFuelSheetVolItemData.Destroy;
  begin
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(FsheetVolumesRef) then
      sheetVolumesRef.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelSheetVolItemDataFilter.Destroy;
  begin
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(FsheetVolumesRef) then
      sheetVolumesRef.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelSheetVolItemDataFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelSheetVolItemDataShort.Destroy;
  begin
    if Assigned(Fdatestart) then
      datestart.Free;
    if Assigned(Fcountfact) then
      countfact.Free;
    if Assigned(FsheetVolumesRefDateGen) then
      sheetVolumesRefDateGen.Free;
    if Assigned(FsheetVolumesRefStartDate) then
      sheetVolumesRefStartDate.Free;
    if Assigned(FsheetVolumesRefEndDate) then
      sheetVolumesRefEndDate.Free;
    if Assigned(FsheetVolumesRefDateEdit) then
      sheetVolumesRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelSheetVolItemDataShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelSheetVolItemData, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolItemData');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolItemDataRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolItemDataRef');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolItemDataFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolItemDataFilter');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolItemDataShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolItemDataShort');
  RemClassRegistry.RegisterXSClass(ENFuelSheetVolItemDataShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelSheetVolItemDataShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelSheetVolItemDataShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelSheetVolItemDataShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelSheetVolItemDataControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolItemDataController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelSheetVolItemDataControllerSoapPort), 'http://ksoe.org/ENFuelSheetVolItemDataController/action/ENFuelSheetVolItemDataController.%operationName%');


end.
