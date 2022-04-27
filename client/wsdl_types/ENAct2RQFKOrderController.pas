unit ENAct2RQFKOrderController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENActController
   ,RQFKOrderController
   ,ENAct2RQFKOrderTypeController
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

  ENAct2RQFKOrder            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2RQFKOrderRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENAct2RQFKOrder = class(TRemotable)
  private
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FactRef : ENActRef;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FtypeRef : ENAct2RQFKOrderTypeRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property actRef : ENActRef read FactRef write FactRef;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property typeRef : ENAct2RQFKOrderTypeRef read FtypeRef write FtypeRef;
  end;

{
  ENAct2RQFKOrderFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FactRef : ENActRef;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FtypeRef : ENAct2RQFKOrderTypeRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property actRef : ENActRef read FactRef write FactRef;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
    property typeRef : ENAct2RQFKOrderTypeRef read FtypeRef write FtypeRef;
  end;
}

  ENAct2RQFKOrderFilter = class(ENAct2RQFKOrder)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENAct2RQFKOrderShort = class(TRemotable)
  private
    Fcode : Integer;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FactRefCode : Integer;
    FactRefNumberGen : WideString;
    FactRefDateGen : TXSDate;
    FactRefFinDocCode : Integer;
    FactRefFinDocMechanicCode : Integer;
    FactRefFinMolName : WideString;
    FactRefFinMechanicName : WideString;
    FactRefInvNumber : WideString;
    FactRefUserGen : WideString;
    FactRefDateEdit : TXSDate;
    FactRefDateAct : TXSDate;
    FfkOrderRefCode : Integer;
    FfkOrderRefNumberDoc : WideString;
    FfkOrderRefDateGen : TXSDate;
    FfkOrderRefDateShipment : TXSDate;
    FfkOrderRefMolOutCode : WideString;
    FfkOrderRefMolOutName : WideString;
    FfkOrderRefMolInCode : WideString;
    FfkOrderRefMolInName : WideString;
    FfkOrderRefExpeditorCode : WideString;
    FfkOrderRefExpeditorName : WideString;
    FfkOrderRefWarrantNumber : WideString;
    FfkOrderRefWarrantDate : TXSDate;
    FfkOrderRefWarrantFIO : WideString;
    FfkOrderRefSumWithoutNds : TXSDecimal;
    FfkOrderRefSumNds : TXSDecimal;
    FfkOrderRefNdsPercent : Integer;
    FfkOrderRefDateAdd : TXSDateTime;
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;
    FfkOrderRefUserGen : WideString;
    FtypeRefCode : Integer;
    FtypeRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property actRefCode : Integer read FactRefCode write FactRefCode;
    property actRefNumberGen : WideString read FactRefNumberGen write FactRefNumberGen;
    property actRefDateGen : TXSDate read FactRefDateGen write FactRefDateGen;
    property actRefFinDocCode : Integer read FactRefFinDocCode write FactRefFinDocCode;
    property actRefFinDocMechanicCode : Integer read FactRefFinDocMechanicCode write FactRefFinDocMechanicCode;
    property actRefFinMolName : WideString read FactRefFinMolName write FactRefFinMolName;
    property actRefFinMechanicName : WideString read FactRefFinMechanicName write FactRefFinMechanicName;
    property actRefInvNumber : WideString read FactRefInvNumber write FactRefInvNumber;
    property actRefUserGen : WideString read FactRefUserGen write FactRefUserGen;
    property actRefDateEdit : TXSDate read FactRefDateEdit write FactRefDateEdit;
    property actRefDateAct : TXSDate read FactRefDateAct write FactRefDateAct;
    property fkOrderRefCode : Integer read FfkOrderRefCode write FfkOrderRefCode;
    property fkOrderRefNumberDoc : WideString read FfkOrderRefNumberDoc write FfkOrderRefNumberDoc;
    property fkOrderRefDateGen : TXSDate read FfkOrderRefDateGen write FfkOrderRefDateGen;
    property fkOrderRefDateShipment : TXSDate read FfkOrderRefDateShipment write FfkOrderRefDateShipment;
    property fkOrderRefMolOutCode : WideString read FfkOrderRefMolOutCode write FfkOrderRefMolOutCode;
    property fkOrderRefMolOutName : WideString read FfkOrderRefMolOutName write FfkOrderRefMolOutName;
    property fkOrderRefMolInCode : WideString read FfkOrderRefMolInCode write FfkOrderRefMolInCode;
    property fkOrderRefMolInName : WideString read FfkOrderRefMolInName write FfkOrderRefMolInName;
    property fkOrderRefExpeditorCode : WideString read FfkOrderRefExpeditorCode write FfkOrderRefExpeditorCode;
    property fkOrderRefExpeditorName : WideString read FfkOrderRefExpeditorName write FfkOrderRefExpeditorName;
    property fkOrderRefWarrantNumber : WideString read FfkOrderRefWarrantNumber write FfkOrderRefWarrantNumber;
    property fkOrderRefWarrantDate : TXSDate read FfkOrderRefWarrantDate write FfkOrderRefWarrantDate;
    property fkOrderRefWarrantFIO : WideString read FfkOrderRefWarrantFIO write FfkOrderRefWarrantFIO;
    property fkOrderRefSumWithoutNds : TXSDecimal read FfkOrderRefSumWithoutNds write FfkOrderRefSumWithoutNds;
    property fkOrderRefSumNds : TXSDecimal read FfkOrderRefSumNds write FfkOrderRefSumNds;
    property fkOrderRefNdsPercent : Integer read FfkOrderRefNdsPercent write FfkOrderRefNdsPercent;
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd;
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd;
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit;
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen;
    property typeRefCode : Integer read FtypeRefCode write FtypeRefCode;
    property typeRefName : WideString read FtypeRefName write FtypeRefName;
  end;

  ArrayOfENAct2RQFKOrderShort = array of ENAct2RQFKOrderShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENAct2RQFKOrderShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENAct2RQFKOrderShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENAct2RQFKOrderShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENAct2RQFKOrderController/message/
  // soapAction: http://ksoe.org/ENAct2RQFKOrderController/action/ENAct2RQFKOrderController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENAct2RQFKOrderControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENAct2RQFKOrderController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENAct2RQFKOrderControllerSoapPort = interface(IInvokable)
  ['{D9D60CFE-1E47-4E70-902D-B293B46D4391}']
    function add(const aENAct2RQFKOrder: ENAct2RQFKOrder): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENAct2RQFKOrder: ENAct2RQFKOrder); stdcall;
    function getObject(const anObjectCode: Integer): ENAct2RQFKOrder; stdcall;
    function getList: ENAct2RQFKOrderShortList; stdcall;
    function getFilteredList(const aENAct2RQFKOrderFilter: ENAct2RQFKOrderFilter): ENAct2RQFKOrderShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderShortList; stdcall;
    function getScrollableFilteredList(const aENAct2RQFKOrderFilter: ENAct2RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENAct2RQFKOrderShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENAct2RQFKOrderFilter: ENAct2RQFKOrderFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENAct2RQFKOrderShort; stdcall;
  end;


implementation

  destructor ENAct2RQFKOrder.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;

{
  destructor ENAct2RQFKOrderFilter.Destroy;
  begin
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FactRef) then
      actRef.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FtypeRef) then
      typeRef.Free;
    inherited Destroy;
  end;
}

  destructor ENAct2RQFKOrderFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENAct2RQFKOrderShort.Destroy;
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
    if Assigned(FfkOrderRefDateGen) then
      fkOrderRefDateGen.Free;
    if Assigned(FfkOrderRefDateShipment) then
      fkOrderRefDateShipment.Free;
    if Assigned(FfkOrderRefWarrantDate) then
      fkOrderRefWarrantDate.Free;
    if Assigned(FfkOrderRefSumWithoutNds) then
      fkOrderRefSumWithoutNds.Free;
    if Assigned(FfkOrderRefSumNds) then
      fkOrderRefSumNds.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    inherited Destroy;
  end;

  destructor ENAct2RQFKOrderShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrder, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrder');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderRef');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderFilter');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderShort');
  RemClassRegistry.RegisterXSClass(ENAct2RQFKOrderShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENAct2RQFKOrderShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENAct2RQFKOrderShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENAct2RQFKOrderShort');

  InvRegistry.RegisterInterface(TypeInfo(ENAct2RQFKOrderControllerSoapPort), 'http://ksoe.org/ENAct2RQFKOrderController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENAct2RQFKOrderControllerSoapPort), 'http://ksoe.org/ENAct2RQFKOrderController/action/ENAct2RQFKOrderController.%operationName%');


end.
