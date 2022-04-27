unit ENFuelCardController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKFuelTypeController
   ,FINWorkerController
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

  ENFuelCard            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelCardRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelCard = class(TRemotable)
  private
    Fcode : Integer;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdateApply : TXSDate;
//???
    FfuelType : TKFuelTypeRef;
//???
    FfinWorker : FINWorker;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property dateApply : TXSDate read FdateApply write FdateApply;
    property fuelType : TKFuelTypeRef read FfuelType write FfuelType;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
  end;

{
  ENFuelCardFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdateApply : TXSDate;
//???
    FfuelType : TKFuelTypeRef;
//???
    FfinWorker : FINWorker;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property dateApply : TXSDate read FdateApply write FdateApply;
    property fuelType : TKFuelTypeRef read FfuelType write FfuelType;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
  end;
}

  ENFuelCardFilter = class(ENFuelCard)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelCardShort = class(TRemotable)
  private
    Fcode : Integer;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FdateApply : TXSDate;
    FfuelTypeCode : Integer;
    FfuelTypeName : WideString;
    FfinWorkerCode : Integer;
    FfinWorkerName : WideString;
    FfinWorkerTabNumber : WideString;
    FfinWorkerPositionName : WideString;
    FfinWorkerPositionCode : Integer;
    FfinWorkerDepartmentName : WideString;
    FfinWorkerDepartmentCode : WideString;
    FfinWorkerPriceGen : TXSDecimal;
    FfinWorkerCategor : Integer;
    FfinWorkerFinCode : Integer;
    FfinWorkerIsSentAssignment : Integer;
    FfinWorkerChargePercent : TXSDecimal;
    FfinWorkerCategorId : Integer;
    FfinWorkerCategorName : WideString;
    FfinWorkerWorkTimeId : WideString;
    FfinWorkerPositionId : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property dateApply : TXSDate read FdateApply write FdateApply;

    property fuelTypeCode : Integer read FfuelTypeCode write FfuelTypeCode;
    property fuelTypeName : WideString read FfuelTypeName write FfuelTypeName;
    property finWorkerCode : Integer read FfinWorkerCode write FfinWorkerCode;
    property finWorkerName : WideString read FfinWorkerName write FfinWorkerName;
    property finWorkerTabNumber : WideString read FfinWorkerTabNumber write FfinWorkerTabNumber;
    property finWorkerPositionName : WideString read FfinWorkerPositionName write FfinWorkerPositionName;
    property finWorkerPositionCode : Integer read FfinWorkerPositionCode write FfinWorkerPositionCode;
    property finWorkerDepartmentName : WideString read FfinWorkerDepartmentName write FfinWorkerDepartmentName;
    property finWorkerDepartmentCode : WideString read FfinWorkerDepartmentCode write FfinWorkerDepartmentCode;
    property finWorkerPriceGen : TXSDecimal read FfinWorkerPriceGen write FfinWorkerPriceGen;
    property finWorkerCategor : Integer read FfinWorkerCategor write FfinWorkerCategor;
    property finWorkerFinCode : Integer read FfinWorkerFinCode write FfinWorkerFinCode;
    property finWorkerIsSentAssignment : Integer read FfinWorkerIsSentAssignment write FfinWorkerIsSentAssignment;
    property finWorkerChargePercent : TXSDecimal read FfinWorkerChargePercent write FfinWorkerChargePercent;
    property finWorkerCategorId : Integer read FfinWorkerCategorId write FfinWorkerCategorId;
    property finWorkerCategorName : WideString read FfinWorkerCategorName write FfinWorkerCategorName;
    property finWorkerWorkTimeId : WideString read FfinWorkerWorkTimeId write FfinWorkerWorkTimeId;
    property finWorkerPositionId : WideString read FfinWorkerPositionId write FfinWorkerPositionId;
  end;

  ArrayOfENFuelCardShort = array of ENFuelCardShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelCardShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelCardShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelCardShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelCardController/message/
  // soapAction: http://ksoe.org/ENFuelCardController/action/ENFuelCardController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelCardControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelCardController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelCardControllerSoapPort = interface(IInvokable)
  ['{3B716FC9-3524-4D02-991D-0A68E63058A7}']
    function add(const aENFuelCard: ENFuelCard): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelCard: ENFuelCard); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelCard; stdcall;
    function getList: ENFuelCardShortList; stdcall;
    function getFilteredList(const aENFuelCardFilter: ENFuelCardFilter): ENFuelCardShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardShortList; stdcall;
    function getScrollableFilteredList(const aENFuelCardFilter: ENFuelCardFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelCardFilter: ENFuelCardFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelCardShort; stdcall;
  end;


implementation

  destructor ENFuelCard.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateApply) then
      dateApply.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelCardFilter.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateApply) then
      dateApply.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelCardFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelCardShort.Destroy;
  begin
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdateApply) then
      dateApply.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    if Assigned(FfinWorkerChargePercent) then
      finWorkerChargePercent.Free;
    inherited Destroy;
  end;

  destructor ENFuelCardShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelCard, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCard');
  RemClassRegistry.RegisterXSClass(ENFuelCardRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardRef');
  RemClassRegistry.RegisterXSClass(ENFuelCardFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardFilter');
  RemClassRegistry.RegisterXSClass(ENFuelCardShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardShort');
  RemClassRegistry.RegisterXSClass(ENFuelCardShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelCardShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelCardShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelCardControllerSoapPort), 'http://ksoe.org/ENFuelCardController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelCardControllerSoapPort), 'http://ksoe.org/ENFuelCardController/action/ENFuelCardController.%operationName%');


end.
