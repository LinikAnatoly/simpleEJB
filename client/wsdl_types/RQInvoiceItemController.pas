unit RQInvoiceItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,TKMaterialsController 
   ,RQMaterialsController 
   ,RQInvoiceController 
   ,RQOrderItemController
   ,AGAgreeController 
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

  RQInvoiceItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  RQInvoiceItem = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FddsCodesTxt : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    FrqMaterialsRef : RQMaterialsRef;
//???
    FinvoiceRef : RQInvoiceRef;
//???
    Fagree : AGAgree;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property nds : TXSDecimal read Fnds write Fnds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property ddsCodesTxt : WideString read FddsCodesTxt write FddsCodesTxt;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
    property agree : AGAgree read Fagree write Fagree; 
  end;

  RQInvoiceItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FdateEdit : TXSDate;
    Fmodify_time : Int64;
//???
    Fmaterial : TKMaterials;
//???
    FrqMaterialsRef : RQMaterialsRef;
//???
    FinvoiceRef : RQInvoiceRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property nds : TXSDecimal read Fnds write Fnds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDate read FdateEdit write FdateEdit;
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property material : TKMaterials read Fmaterial write Fmaterial; 
    property rqMaterialsRef : RQMaterialsRef read FrqMaterialsRef write FrqMaterialsRef; 
    property invoiceRef : RQInvoiceRef read FinvoiceRef write FinvoiceRef; 
  end;


  RQInvoiceItemShort = class(TRemotable)
  private
    Fcode : Integer; 
    FcountGen : TXSDecimal;
    FmaterialNameTxt : WideString;
    FmeasurementNameTxt : WideString;
    FcountFact : TXSDecimal;
    FpriceWithoutNds : TXSDecimal;
    FpriceWithNds : TXSDecimal;
    Fnds : TXSDecimal;
    FsumWithoutNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcommentGen : WideString;
    FuserGen : WideString;
    FddsCodesTxt : WideString;
    FmaterialCode : Integer; 
    FmaterialName : WideString;
    FrqMaterialsRefCode : Integer; 
    FrqMaterialsRefOutCode : Integer; 
    FrqMaterialsRefName : WideString;
    FinvoiceRefCode : Integer; 
    FinvoiceRefNumberDoc : WideString;
    FinvoiceRefNumberProject : WideString;
    FinvoiceRefDateGen : TXSDate;
    FinvoiceRefUserGen : WideString;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FagreeCode : Integer; 
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property countGen : TXSDecimal read FcountGen write FcountGen; 
    property materialNameTxt : WideString read FmaterialNameTxt write FmaterialNameTxt;
    property measurementNameTxt : WideString read FmeasurementNameTxt write FmeasurementNameTxt;
    property countFact : TXSDecimal read FcountFact write FcountFact; 
    property priceWithoutNds : TXSDecimal read FpriceWithoutNds write FpriceWithoutNds; 
    property priceWithNds : TXSDecimal read FpriceWithNds write FpriceWithNds; 
    property nds : TXSDecimal read Fnds write Fnds; 
    property sumWithoutNds : TXSDecimal read FsumWithoutNds write FsumWithoutNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property commentGen : WideString read FcommentGen write FcommentGen;
    property userGen : WideString read FuserGen write FuserGen;
    property ddsCodesTxt : WideString read FddsCodesTxt write FddsCodesTxt;
    property materialCode : Integer read FmaterialCode write FmaterialCode; 
    property materialName : WideString read FmaterialName write FmaterialName; 
    property rqMaterialsRefCode : Integer read FrqMaterialsRefCode write FrqMaterialsRefCode; 
    property rqMaterialsRefOutCode : Integer read FrqMaterialsRefOutCode write FrqMaterialsRefOutCode; 
    property rqMaterialsRefName : WideString read FrqMaterialsRefName write FrqMaterialsRefName; 
    property invoiceRefCode : Integer read FinvoiceRefCode write FinvoiceRefCode; 
    property invoiceRefNumberDoc : WideString read FinvoiceRefNumberDoc write FinvoiceRefNumberDoc; 
    property invoiceRefNumberProject : WideString read FinvoiceRefNumberProject write FinvoiceRefNumberProject; 
    property invoiceRefDateGen : TXSDate read FinvoiceRefDateGen write FinvoiceRefDateGen; 
    property invoiceRefUserGen : WideString read FinvoiceRefUserGen write FinvoiceRefUserGen; 
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property agreeCode : Integer read FagreeCode write FagreeCode; 
  end;

  ArrayOfRQInvoiceItemShort = array of RQInvoiceItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  RQInvoiceItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfRQInvoiceItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfRQInvoiceItemShort read Flist write Flist;
  end;



  // ************************************************************************ //
  // Namespace : http://ksoe.org/RQInvoiceItemController/message/
  // soapAction: http://ksoe.org/RQInvoiceItemController/action/RQInvoiceItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : RQInvoiceItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : RQInvoiceItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  RQInvoiceItemControllerSoapPort = interface(IInvokable)
  ['{101f101f-101f-101f-101f-101f101f101f}']
    function  add(const aRQInvoiceItem: RQInvoiceItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aRQInvoiceItem: RQInvoiceItem); stdcall;
    function  getObject(const anObjectCode: Integer): RQInvoiceItem; stdcall;
    function  getList: RQInvoiceItemShortList; stdcall;
    function  getFilteredList(const aRQInvoiceItemFilter: RQInvoiceItemFilter): RQInvoiceItemShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItemShortList; stdcall;
    function  getScrollableFilteredList(const aRQInvoiceItemFilter: RQInvoiceItemFilter; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItemShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): RQInvoiceItemShortList; stdcall;
    function  addInvoiceItemList(const corrCount : TXSDecimal; const invoiceCode : Integer; const aRQOrderItem : RQOrderItem; orderItemList : ArrayOfRQOrderItemShort) : Integer; stdcall;
  end;


implementation

  destructor RQInvoiceItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    if Assigned(Fagree) then
      agree.Free;
    inherited Destroy;
  end;
  
  destructor RQInvoiceItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(Fmaterial) then
      material.Free;
    if Assigned(FrqMaterialsRef) then
      rqMaterialsRef.Free;
    if Assigned(FinvoiceRef) then
      invoiceRef.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(FcountFact) then
      countFact.Free;
    if Assigned(FpriceWithoutNds) then
      priceWithoutNds.Free;
    if Assigned(FpriceWithNds) then
      priceWithNds.Free;
    if Assigned(Fnds) then
      nds.Free;
    if Assigned(FsumWithoutNds) then
      sumWithoutNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FinvoiceRefDateGen) then
      invoiceRefDateGen.Free;
    inherited Destroy;
  end; 
  
  destructor RQInvoiceItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(RQInvoiceItem, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItem');
  RemClassRegistry.RegisterXSClass(RQInvoiceItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItemRef');
  RemClassRegistry.RegisterXSClass(RQInvoiceItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItemFilter');
  RemClassRegistry.RegisterXSClass(RQInvoiceItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItemShort');
  RemClassRegistry.RegisterXSClass(RQInvoiceItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'RQInvoiceItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfRQInvoiceItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfRQInvoiceItemShort');

  InvRegistry.RegisterInterface(TypeInfo(RQInvoiceItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(RQInvoiceItemControllerSoapPort), 'http://ksoe.org/RQInvoiceItemController/action/RQInvoiceItemController.%operationName%');


end.
