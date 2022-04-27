unit ENWorkOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,ENDepartmentController 
   ,ENWorkOrderStatusController 
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

  ENWorkOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENWorkOrder = class(TRemotable)
  private
    Fcode : Integer; 
    FworkOrderNumber : WideString;
    FnumberInt : Integer; 
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FdefectShortDesc : WideString;
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FfinMechanicCode : WideString;
    FfinMechanicName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    FstatusWorkOrder : ENWorkOrderStatus;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property  numberInt : Integer read FnumberInt write FnumberInt; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicCode : WideString read FfinMechanicCode write FfinMechanicCode;
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property statusWorkOrder : ENWorkOrderStatus read FstatusWorkOrder write FstatusWorkOrder;
    property defectShortDesc : WideString read FdefectShortDesc write FdefectShortDesc;
  end;

  ENWorkOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FworkOrderNumber : WideString;
    FnumberInt : Integer; 
    FdateGen : TXSDate;
    FcommentGen : WideString;
    FfinMolCode : WideString;
    FfinMolName : WideString;
    FfinMechanicCode : WideString;
    FfinMechanicName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;

    Fmodify_time : Int64;
//???
    Fdepartment : ENDepartment;
//???
    FstatusWorkOrder : ENWorkOrderStatus;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property  numberInt : Integer read FnumberInt write FnumberInt; 
    property dateGen : TXSDate read FdateGen write FdateGen;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicCode : WideString read FfinMechanicCode write FfinMechanicCode;
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property department : ENDepartment read Fdepartment write Fdepartment; 
    property statusWorkOrder : ENWorkOrderStatus read FstatusWorkOrder write FstatusWorkOrder; 
  end;


  ENWorkOrderShort = class(TRemotable)
  private
    Fcode : Integer; 
    FworkOrderNumber : WideString;
    FdateGen : TXSDate;
    FfinMolCode : WideString;    
    FfinMolName : WideString;
    FfinMechanicCode : WideString;
    FfinMechanicName : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    FdepartmentCode : Integer; 
    FdepartmentShortName : WideString;
    FdepartmentDateStart : TXSDate;
    FdepartmentDateFinal : TXSDate;
    FstatusWorkOrderCode : Integer; 
    FstatusWorkOrderName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property workOrderNumber : WideString read FworkOrderNumber write FworkOrderNumber;
    property dateGen : TXSDate read FdateGen write FdateGen;
    property finMolCode : WideString read FfinMolCode write FfinMolCode;    
    property finMolName : WideString read FfinMolName write FfinMolName;
    property finMechanicCode : WideString read FfinMechanicCode write FfinMechanicCode;    
    property finMechanicName : WideString read FfinMechanicName write FfinMechanicName;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;

    property departmentCode : Integer read FdepartmentCode write FdepartmentCode; 
    property departmentShortName : WideString read FdepartmentShortName write FdepartmentShortName; 
    property departmentDateStart : TXSDate read FdepartmentDateStart write FdepartmentDateStart; 
    property departmentDateFinal : TXSDate read FdepartmentDateFinal write FdepartmentDateFinal; 
    property statusWorkOrderCode : Integer read FstatusWorkOrderCode write FstatusWorkOrderCode; 
    property statusWorkOrderName : WideString read FstatusWorkOrderName write FstatusWorkOrderName; 
  end;

  ArrayOfENWorkOrderShort = array of ENWorkOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENWorkOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENWorkOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENWorkOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENWorkOrderController/message/
  // soapAction: http://ksoe.org/ENWorkOrderController/action/ENWorkOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENWorkOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENWorkOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENWorkOrderControllerSoapPort = interface(IInvokable)
  ['{1A2E07F0-0E62-4478-A6C0-382CBABDA054}']
    function  add(const aENWorkOrder: ENWorkOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENWorkOrder: ENWorkOrder); stdcall;
    function  getObject(const anObjectCode: Integer): ENWorkOrder; stdcall;
    function  getList: ENWorkOrderShortList; stdcall;
    function  getFilteredList(const aENWorkOrderFilter: ENWorkOrderFilter): ENWorkOrderShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderShortList; stdcall;
    function  getScrollableFilteredList(const aENWorkOrderFilter: ENWorkOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENWorkOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENWorkOrderFilter: ENWorkOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
  end; 


implementation

  destructor ENWorkOrder.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusWorkOrder) then
      statusWorkOrder.Free;
    inherited Destroy;
  end;
  
  destructor ENWorkOrderFilter.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fdepartment) then
      department.Free;
    if Assigned(FstatusWorkOrder) then
      statusWorkOrder.Free;
    inherited Destroy;
  end; 
  
  destructor ENWorkOrderShort.Destroy;
  begin
    if Assigned(FdateGen) then
      dateGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FdepartmentDateStart) then
      departmentDateStart.Free;
    if Assigned(FdepartmentDateFinal) then
      departmentDateFinal.Free;
    inherited Destroy;
  end; 
  
  destructor ENWorkOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENWorkOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrder');
  RemClassRegistry.RegisterXSClass(ENWorkOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderRef');
  RemClassRegistry.RegisterXSClass(ENWorkOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderFilter');
  RemClassRegistry.RegisterXSClass(ENWorkOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderShort');
  RemClassRegistry.RegisterXSClass(ENWorkOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENWorkOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENWorkOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENWorkOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENWorkOrderControllerSoapPort), 'http://ksoe.org/ENWorkOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENWorkOrderControllerSoapPort), 'http://ksoe.org/ENWorkOrderController/action/ENWorkOrderController.%operationName%');


end.
