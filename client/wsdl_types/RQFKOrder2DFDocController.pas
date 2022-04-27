unit RQFKOrder2DFDocController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,RQFKOrderController
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

  RQFKOrder2DFDoc            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }

  ArrayOfInteger = array of Integer;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2DFDocRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQFKOrder2DFDoc = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
  end;

{
  RQFKOrder2DFDocFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property code : Integer read Fcode write Fcode;
    property dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef;
  end;
}

  RQFKOrder2DFDocFilter = class(RQFKOrder2DFDoc)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  RQFKOrder2DFDocShort = class(TRemotable)
  private
    Fcode : Integer;
    FdfDocCode : Integer;
    FdfDocTypeCode : Integer;
    FdfDocSubtypeCode : Integer;
    FdfDocNumber : WideString;
    FdfDocDate : TXSDate;
    FdfDocDescription : WideString;
    Fcommentgen : WideString;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
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
    FfkOrderRefPercentProfits : TXSDecimal;
    FfkOrderRefAccount : WideString;
    FfkOrderRefKod_podr : WideString;
    FfkOrderRefName_podr : WideString;
    FfkOrderRefIsMaterialsSent : Integer;
    FfkOrderRefCheckedByAccountant : TXSBoolean;
    FfkOrderRefDateAdd : TXSDateTime;
    FfkOrderRefUserAdd : WideString;
    FfkOrderRefDateEdit : TXSDateTime;
    FfkOrderRefDatePosting : TXSDate;
    FfkOrderRefUserGen : WideString;
    FfkOrderRefPalletNumber : WideString;
    FfkOrderRefIsByOrder : Integer;
    FfkOrderRefOrderInfo : WideString;
    FfkOrderRefDateDelivery : TXSDate;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property  dfDocCode : Integer read FdfDocCode write FdfDocCode;
    property  dfDocTypeCode : Integer read FdfDocTypeCode write FdfDocTypeCode;
    property  dfDocSubtypeCode : Integer read FdfDocSubtypeCode write FdfDocSubtypeCode;
    property dfDocNumber : WideString read FdfDocNumber write FdfDocNumber;
    property dfDocDate : TXSDate read FdfDocDate write FdfDocDate;
    property dfDocDescription : WideString read FdfDocDescription write FdfDocDescription;
    property commentgen : WideString read Fcommentgen write Fcommentgen;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

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
    property fkOrderRefPercentProfits : TXSDecimal read FfkOrderRefPercentProfits write FfkOrderRefPercentProfits;
    property fkOrderRefAccount : WideString read FfkOrderRefAccount write FfkOrderRefAccount;
    property fkOrderRefKod_podr : WideString read FfkOrderRefKod_podr write FfkOrderRefKod_podr;
    property fkOrderRefName_podr : WideString read FfkOrderRefName_podr write FfkOrderRefName_podr;
    property fkOrderRefIsMaterialsSent : Integer read FfkOrderRefIsMaterialsSent write FfkOrderRefIsMaterialsSent;
    property fkOrderRefCheckedByAccountant : TXSBoolean read FfkOrderRefCheckedByAccountant write FfkOrderRefCheckedByAccountant;
    property fkOrderRefDateAdd : TXSDateTime read FfkOrderRefDateAdd write FfkOrderRefDateAdd;
    property fkOrderRefUserAdd : WideString read FfkOrderRefUserAdd write FfkOrderRefUserAdd;
    property fkOrderRefDateEdit : TXSDateTime read FfkOrderRefDateEdit write FfkOrderRefDateEdit;
    property fkOrderRefDatePosting : TXSDate read FfkOrderRefDatePosting write FfkOrderRefDatePosting;
    property fkOrderRefUserGen : WideString read FfkOrderRefUserGen write FfkOrderRefUserGen;
    property fkOrderRefPalletNumber : WideString read FfkOrderRefPalletNumber write FfkOrderRefPalletNumber;
    property fkOrderRefIsByOrder : Integer read FfkOrderRefIsByOrder write FfkOrderRefIsByOrder;
    property fkOrderRefOrderInfo : WideString read FfkOrderRefOrderInfo write FfkOrderRefOrderInfo;
    property fkOrderRefDateDelivery : TXSDate read FfkOrderRefDateDelivery write FfkOrderRefDateDelivery;
  end;

  ArrayOfRQFKOrder2DFDocShort = array of RQFKOrder2DFDocShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQFKOrder2DFDocShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQFKOrder2DFDocShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQFKOrder2DFDocShort read Flist write Flist;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQFKOrder2DFDocController/message/
  // soapAction: http://ksoe.org/RQFKOrder2DFDocController/action/RQFKOrder2DFDocController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQFKOrder2DFDocControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQFKOrder2DFDocController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQFKOrder2DFDocControllerSoapPort = interface(IInvokable)
  ['{F1F67DA8-5BBC-4A9F-93E8-26FD16D48AB0}']
    function add(const aRQFKOrder2DFDoc: RQFKOrder2DFDoc): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQFKOrder2DFDoc: RQFKOrder2DFDoc); stdcall;
    function getObject(const anObjectCode: Integer): RQFKOrder2DFDoc; stdcall;
    function getList: RQFKOrder2DFDocShortList; stdcall;
    function getFilteredList(const aRQFKOrder2DFDocFilter: RQFKOrder2DFDocFilter): RQFKOrder2DFDocShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2DFDocShortList; stdcall;
    function getScrollableFilteredList(const aRQFKOrder2DFDocFilter: RQFKOrder2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2DFDocShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQFKOrder2DFDocShortList; stdcall;
    function getScrollableFilteredCodeArray(const aRQFKOrder2DFDocFilter: RQFKOrder2DFDocFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): RQFKOrder2DFDocShort; stdcall;
  end;


implementation

  destructor RQFKOrder2DFDoc.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;

{
  destructor RQFKOrder2DFDocFilter.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    inherited Destroy;
  end;
}

  destructor RQFKOrder2DFDocFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor RQFKOrder2DFDocShort.Destroy;
  begin
    if Assigned(FdfDocDate) then
      dfDocDate.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
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
    if Assigned(FfkOrderRefPercentProfits) then
      fkOrderRefPercentProfits.Free;
    if Assigned(FfkOrderRefDateAdd) then
      fkOrderRefDateAdd.Free;
    if Assigned(FfkOrderRefDateEdit) then
      fkOrderRefDateEdit.Free;
    if Assigned(FfkOrderRefDatePosting) then
      fkOrderRefDatePosting.Free;
    if Assigned(FfkOrderRefDateDelivery) then
      fkOrderRefDateDelivery.Free;
    inherited Destroy;
  end;

  destructor RQFKOrder2DFDocShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQFKOrder2DFDoc, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2DFDoc');
  RemClassRegistry.RegisterXSClass(RQFKOrder2DFDocRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2DFDocRef');
  RemClassRegistry.RegisterXSClass(RQFKOrder2DFDocFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2DFDocFilter');
  RemClassRegistry.RegisterXSClass(RQFKOrder2DFDocShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2DFDocShort');
  RemClassRegistry.RegisterXSClass(RQFKOrder2DFDocShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQFKOrder2DFDocShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQFKOrder2DFDocShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQFKOrder2DFDocShort');

  InvRegistry.RegisterInterface(TypeInfo(RQFKOrder2DFDocControllerSoapPort), 'http://ksoe.org/RQFKOrder2DFDocController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQFKOrder2DFDocControllerSoapPort), 'http://ksoe.org/RQFKOrder2DFDocController/action/RQFKOrder2DFDocController.%operationName%');


end.
