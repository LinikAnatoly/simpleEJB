unit ENFuelCardHistoryController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKFuelTypeController
   ,FINWorkerController
   ,ENFuelCardController
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

  ENFuelCardHistory            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelCardHistoryRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENFuelCardHistory = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FfuelType : TKFuelTypeRef;
//???
    FfinWorker : FINWorker;
//???
    FfuelCard : ENFuelCard;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property fuelType : TKFuelTypeRef read FfuelType write FfuelType;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property fuelCard : ENFuelCard read FfuelCard write FfuelCard;
  end;

{
  ENFuelCardHistoryFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FfuelType : TKFuelTypeRef;
//???
    FfinWorker : FINWorker;
//???
    FfuelCard : ENFuelCard;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property fuelType : TKFuelTypeRef read FfuelType write FfuelType;
    property finWorker : FINWorker read FfinWorker write FfinWorker;
    property fuelCard : ENFuelCard read FfuelCard write FfuelCard;
  end;
}

  ENFuelCardHistoryFilter = class(ENFuelCardHistory)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENFuelCardHistoryShort = class(TRemotable)
  private
    Fcode : Integer;
    FdateStart : TXSDate;
    FdateFinal : TXSDate;
    Freg_id : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FfuelCardCode : Integer;
    FfuelCardReg_id : WideString;
    FfuelCardUserGen : WideString;
    FfuelCardDateEdit : TXSDateTime;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property dateStart : TXSDate read FdateStart write FdateStart;
    property dateFinal : TXSDate read FdateFinal write FdateFinal;
    property reg_id : WideString read Freg_id write Freg_id;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property fuelCardCode : Integer read FfuelCardCode write FfuelCardCode;
    property fuelCardReg_id : WideString read FfuelCardReg_id write FfuelCardReg_id;
    property fuelCardUserGen : WideString read FfuelCardUserGen write FfuelCardUserGen;
    property fuelCardDateEdit : TXSDateTime read FfuelCardDateEdit write FfuelCardDateEdit;
  end;

  ArrayOfENFuelCardHistoryShort = array of ENFuelCardHistoryShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENFuelCardHistoryShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENFuelCardHistoryShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENFuelCardHistoryShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENFuelCardHistoryController/message/
  // soapAction: http://ksoe.org/ENFuelCardHistoryController/action/ENFuelCardHistoryController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENFuelCardHistoryControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENFuelCardHistoryController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENFuelCardHistoryControllerSoapPort = interface(IInvokable)
  ['{3A7D2A67-8DD8-4583-A30B-6F35A11FE2C7}']
    function add(const aENFuelCardHistory: ENFuelCardHistory): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENFuelCardHistory: ENFuelCardHistory); stdcall;
    function getObject(const anObjectCode: Integer): ENFuelCardHistory; stdcall;
    function getList: ENFuelCardHistoryShortList; stdcall;
    function getFilteredList(const aENFuelCardHistoryFilter: ENFuelCardHistoryFilter): ENFuelCardHistoryShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardHistoryShortList; stdcall;
    function getScrollableFilteredList(const aENFuelCardHistoryFilter: ENFuelCardHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardHistoryShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENFuelCardHistoryShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENFuelCardHistoryFilter: ENFuelCardHistoryFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENFuelCardHistoryShort; stdcall;
  end;


implementation

  destructor ENFuelCardHistory.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FfuelCard) then
      fuelCard.Free;
    inherited Destroy;
  end;

{
  destructor ENFuelCardHistoryFilter.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfuelType) then
      fuelType.Free;
    if Assigned(FfinWorker) then
      finWorker.Free;
    if Assigned(FfuelCard) then
      fuelCard.Free;
    inherited Destroy;
  end;
}

  destructor ENFuelCardHistoryFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENFuelCardHistoryShort.Destroy;
  begin
    if Assigned(FdateStart) then
      dateStart.Free;
    if Assigned(FdateFinal) then
      dateFinal.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfinWorkerPriceGen) then
      finWorkerPriceGen.Free;
    if Assigned(FfinWorkerChargePercent) then
      finWorkerChargePercent.Free;
    if Assigned(FfuelCardDateEdit) then
      fuelCardDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENFuelCardHistoryShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENFuelCardHistory, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardHistory');
  RemClassRegistry.RegisterXSClass(ENFuelCardHistoryRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardHistoryRef');
  RemClassRegistry.RegisterXSClass(ENFuelCardHistoryFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardHistoryFilter');
  RemClassRegistry.RegisterXSClass(ENFuelCardHistoryShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardHistoryShort');
  RemClassRegistry.RegisterXSClass(ENFuelCardHistoryShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENFuelCardHistoryShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENFuelCardHistoryShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENFuelCardHistoryShort');

  InvRegistry.RegisterInterface(TypeInfo(ENFuelCardHistoryControllerSoapPort), 'http://ksoe.org/ENFuelCardHistoryController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENFuelCardHistoryControllerSoapPort), 'http://ksoe.org/ENFuelCardHistoryController/action/ENFuelCardHistoryController.%operationName%');


end.
