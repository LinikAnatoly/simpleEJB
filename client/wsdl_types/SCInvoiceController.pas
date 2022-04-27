unit SCInvoiceController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2 
   ,RQFKOrderController 
   ,RQFKOrderItemController 
   ,SCInvoiceKindController 
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

  SCInvoice            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCInvoiceRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  SCInvoice = class(TRemotable)
  private
    Fcode : Integer; 
    FsubAccountCode : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FsourceCode : WideString;
    FcostCode : WideString;
    FcounterType : WideString;
    Fcharacters : WideString;
    FnumberDoc : WideString;
    FdateDoc : TXSDate;
    FnumberTax : WideString;
    FdateBuh : TXSDate;
    FsupplierCode : WideString;
    FcontractCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcountGen : Integer; 
    FscCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FkindRef : SCInvoiceKindRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property subAccountCode : WideString read FsubAccountCode write FsubAccountCode;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property costCode : WideString read FcostCode write FcostCode;
    property counterType : WideString read FcounterType write FcounterType;
    property characters : WideString read Fcharacters write Fcharacters;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateDoc : TXSDate read FdateDoc write FdateDoc;
    property numberTax : WideString read FnumberTax write FnumberTax;
    property dateBuh : TXSDate read FdateBuh write FdateBuh;
    property supplierCode : WideString read FsupplierCode write FsupplierCode;
    property contractCode : WideString read FcontractCode write FcontractCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property kindRef : SCInvoiceKindRef read FkindRef write FkindRef; 
  end;
  
{
  SCInvoiceFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer; 
    FsubAccountCode : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FsourceCode : WideString;
    FcostCode : WideString;
    FcounterType : WideString;
    Fcharacters : WideString;
    FnumberDoc : WideString;
    FdateDoc : TXSDate;
    FnumberTax : WideString;
    FdateBuh : TXSDate;
    FsupplierCode : WideString;
    FcontractCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcountGen : Integer; 
    FscCode : Integer; 
    Fmodify_time : Int64;
//???
    FfkOrderRef : RQFKOrderRef;
//???
    FfkOrderItemRef : RQFKOrderItemRef;
//???
    FkindRef : SCInvoiceKindRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode; 
    property subAccountCode : WideString read FsubAccountCode write FsubAccountCode;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property costCode : WideString read FcostCode write FcostCode;
    property counterType : WideString read FcounterType write FcounterType;
    property characters : WideString read Fcharacters write Fcharacters;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateDoc : TXSDate read FdateDoc write FdateDoc;
    property numberTax : WideString read FnumberTax write FnumberTax;
    property dateBuh : TXSDate read FdateBuh write FdateBuh;
    property supplierCode : WideString read FsupplierCode write FsupplierCode;
    property contractCode : WideString read FcontractCode write FcontractCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 
    property modify_time : Int64 read Fmodify_time write Fmodify_time; 
    property fkOrderRef : RQFKOrderRef read FfkOrderRef write FfkOrderRef; 
    property fkOrderItemRef : RQFKOrderItemRef read FfkOrderItemRef write FfkOrderItemRef; 
    property kindRef : SCInvoiceKindRef read FkindRef write FkindRef; 
  end;
}

  SCInvoiceFilter = class(SCInvoice)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;
  
  SCInvoiceShort = class(TRemotable)
  private
    Fcode : Integer; 
    FsubAccountCode : WideString;
    FmolCode : WideString;
    FpodrCode : WideString;
    FsourceCode : WideString;
    FcostCode : WideString;
    FcounterType : WideString;
    Fcharacters : WideString;
    FnumberDoc : WideString;
    FdateDoc : TXSDate;	
    FnumberTax : WideString;
    FdateBuh : TXSDate;	
    FsupplierCode : WideString;
    FcontractCode : WideString;
    FsumWithNds : TXSDecimal;
    FsumNds : TXSDecimal;
    FsumGen : TXSDecimal;
    FcountGen : Integer; 
    FscCode : Integer; 
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
    FfkOrderItemRefCode : Integer; 
    FfkOrderItemRefFinCode : Integer; 
    FfkOrderItemRefNomenclatureCode : Integer; 
    FfkOrderItemRefNomenclatureNum : WideString;
    FfkOrderItemRefNomenclatureBalSch : WideString;
    FfkOrderItemRefNomenclatureName : WideString;
    FfkOrderItemRefNomenclatureUnitCode : Integer; 
    FfkOrderItemRefNomenclatureUnitName : WideString;
    FfkOrderItemRefContractNumber : WideString;
    FfkOrderItemRefContractDate : TXSDate;
    FfkOrderItemRefFinDocCode : WideString;
    FfkOrderItemRefFinDocID : Integer; 
    FfkOrderItemRefMaterialNameTxt : WideString;
    FfkOrderItemRefMeasurementNameTxt : WideString;
    FfkOrderItemRefCountGen : TXSDecimal;
    FfkOrderItemRefPriceWithoutNds : TXSDecimal;
    FfkOrderItemRefPriceWithNds : TXSDecimal;
    FfkOrderItemRefPriceNds : TXSDecimal;
    FfkOrderItemRefSumWithoutNds : TXSDecimal;
    FfkOrderItemRefSumNds : TXSDecimal;
    FfkOrderItemRefSumGen : TXSDecimal;
    FfkOrderItemRefUserGen : WideString;
    FkindRefCode : Integer; 
    FkindRefName : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode; 
    property subAccountCode : WideString read FsubAccountCode write FsubAccountCode;
    property molCode : WideString read FmolCode write FmolCode;
    property podrCode : WideString read FpodrCode write FpodrCode;
    property sourceCode : WideString read FsourceCode write FsourceCode;
    property costCode : WideString read FcostCode write FcostCode;
    property counterType : WideString read FcounterType write FcounterType;
    property characters : WideString read Fcharacters write Fcharacters;
    property numberDoc : WideString read FnumberDoc write FnumberDoc;
    property dateDoc : TXSDate read FdateDoc write FdateDoc;
    property numberTax : WideString read FnumberTax write FnumberTax;
    property dateBuh : TXSDate read FdateBuh write FdateBuh;
    property supplierCode : WideString read FsupplierCode write FsupplierCode;
    property contractCode : WideString read FcontractCode write FcontractCode;
    property sumWithNds : TXSDecimal read FsumWithNds write FsumWithNds; 
    property sumNds : TXSDecimal read FsumNds write FsumNds; 
    property sumGen : TXSDecimal read FsumGen write FsumGen; 
    property  countGen : Integer read FcountGen write FcountGen; 
    property  scCode : Integer read FscCode write FscCode; 

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
    property fkOrderItemRefCode : Integer read FfkOrderItemRefCode write FfkOrderItemRefCode; 
    property fkOrderItemRefFinCode : Integer read FfkOrderItemRefFinCode write FfkOrderItemRefFinCode; 
    property fkOrderItemRefNomenclatureCode : Integer read FfkOrderItemRefNomenclatureCode write FfkOrderItemRefNomenclatureCode; 
    property fkOrderItemRefNomenclatureNum : WideString read FfkOrderItemRefNomenclatureNum write FfkOrderItemRefNomenclatureNum; 
    property fkOrderItemRefNomenclatureBalSch : WideString read FfkOrderItemRefNomenclatureBalSch write FfkOrderItemRefNomenclatureBalSch; 
    property fkOrderItemRefNomenclatureName : WideString read FfkOrderItemRefNomenclatureName write FfkOrderItemRefNomenclatureName; 
    property fkOrderItemRefNomenclatureUnitCode : Integer read FfkOrderItemRefNomenclatureUnitCode write FfkOrderItemRefNomenclatureUnitCode; 
    property fkOrderItemRefNomenclatureUnitName : WideString read FfkOrderItemRefNomenclatureUnitName write FfkOrderItemRefNomenclatureUnitName; 
    property fkOrderItemRefContractNumber : WideString read FfkOrderItemRefContractNumber write FfkOrderItemRefContractNumber; 
    property fkOrderItemRefContractDate : TXSDate read FfkOrderItemRefContractDate write FfkOrderItemRefContractDate; 
    property fkOrderItemRefFinDocCode : WideString read FfkOrderItemRefFinDocCode write FfkOrderItemRefFinDocCode; 
    property fkOrderItemRefFinDocID : Integer read FfkOrderItemRefFinDocID write FfkOrderItemRefFinDocID; 
    property fkOrderItemRefMaterialNameTxt : WideString read FfkOrderItemRefMaterialNameTxt write FfkOrderItemRefMaterialNameTxt; 
    property fkOrderItemRefMeasurementNameTxt : WideString read FfkOrderItemRefMeasurementNameTxt write FfkOrderItemRefMeasurementNameTxt; 
    property fkOrderItemRefCountGen : TXSDecimal read FfkOrderItemRefCountGen write FfkOrderItemRefCountGen; 
    property fkOrderItemRefPriceWithoutNds : TXSDecimal read FfkOrderItemRefPriceWithoutNds write FfkOrderItemRefPriceWithoutNds; 
    property fkOrderItemRefPriceWithNds : TXSDecimal read FfkOrderItemRefPriceWithNds write FfkOrderItemRefPriceWithNds; 
    property fkOrderItemRefPriceNds : TXSDecimal read FfkOrderItemRefPriceNds write FfkOrderItemRefPriceNds; 
    property fkOrderItemRefSumWithoutNds : TXSDecimal read FfkOrderItemRefSumWithoutNds write FfkOrderItemRefSumWithoutNds; 
    property fkOrderItemRefSumNds : TXSDecimal read FfkOrderItemRefSumNds write FfkOrderItemRefSumNds; 
    property fkOrderItemRefSumGen : TXSDecimal read FfkOrderItemRefSumGen write FfkOrderItemRefSumGen; 
    property fkOrderItemRefUserGen : WideString read FfkOrderItemRefUserGen write FfkOrderItemRefUserGen; 
    property kindRefCode : Integer read FkindRefCode write FkindRefCode; 
    property kindRefName : WideString read FkindRefName write FkindRefName; 
  end;

  ArrayOfSCInvoiceShort = array of SCInvoiceShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  SCInvoiceShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfSCInvoiceShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfSCInvoiceShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/SCInvoiceController/message/
  // soapAction: http://ksoe.org/SCInvoiceController/action/SCInvoiceController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : SCInvoiceControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : SCInvoiceController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  SCInvoiceControllerSoapPort = interface(IInvokable)
  ['{4b124b12-4b12-4b12-4b12-4b124b124b12}']
    function  add(const aSCInvoice: SCInvoice): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aSCInvoice: SCInvoice); stdcall;
    function  getObject(const anObjectCode: Integer): SCInvoice; stdcall;
    function  getList: SCInvoiceShortList; stdcall;
    function  getFilteredList(const aSCInvoiceFilter: SCInvoiceFilter): SCInvoiceShortList; stdcall;
    function  getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceShortList; stdcall;
    function  getScrollableFilteredList(const aSCInvoiceFilter: SCInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceShortList; stdcall;
    function  getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): SCInvoiceShortList; stdcall;
    function  getScrollableFilteredCodeArray(const aSCInvoiceFilter: SCInvoiceFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;

  end; 


implementation

  destructor SCInvoice.Destroy;
  begin
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end;

{  
  destructor SCInvoiceFilter.Destroy;
  begin
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(FfkOrderRef) then
      fkOrderRef.Free;
    if Assigned(FfkOrderItemRef) then
      fkOrderItemRef.Free;
    if Assigned(FkindRef) then
      kindRef.Free;
    inherited Destroy;
  end; 
}

  destructor SCInvoiceFilter.Destroy;
  begin
    inherited Destroy;
  end; 

  destructor SCInvoiceShort.Destroy;
  begin
    if Assigned(FdateDoc) then
      dateDoc.Free;
    if Assigned(FdateBuh) then
      dateBuh.Free;
    if Assigned(FsumWithNds) then
      sumWithNds.Free;
    if Assigned(FsumNds) then
      sumNds.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
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
    if Assigned(FfkOrderItemRefContractDate) then
      fkOrderItemRefContractDate.Free;
    if Assigned(FfkOrderItemRefCountGen) then
      fkOrderItemRefCountGen.Free;
    if Assigned(FfkOrderItemRefPriceWithoutNds) then
      fkOrderItemRefPriceWithoutNds.Free;
    if Assigned(FfkOrderItemRefPriceWithNds) then
      fkOrderItemRefPriceWithNds.Free;
    if Assigned(FfkOrderItemRefPriceNds) then
      fkOrderItemRefPriceNds.Free;
    if Assigned(FfkOrderItemRefSumWithoutNds) then
      fkOrderItemRefSumWithoutNds.Free;
    if Assigned(FfkOrderItemRefSumNds) then
      fkOrderItemRefSumNds.Free;
    if Assigned(FfkOrderItemRefSumGen) then
      fkOrderItemRefSumGen.Free;
    inherited Destroy;
  end; 
  
  destructor SCInvoiceShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(SCInvoice, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoice');
  RemClassRegistry.RegisterXSClass(SCInvoiceRef, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceRef');
  RemClassRegistry.RegisterXSClass(SCInvoiceFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceFilter');
  RemClassRegistry.RegisterXSClass(SCInvoiceShort, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceShort');
  RemClassRegistry.RegisterXSClass(SCInvoiceShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'SCInvoiceShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfSCInvoiceShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfSCInvoiceShort');

  InvRegistry.RegisterInterface(TypeInfo(SCInvoiceControllerSoapPort), 'http://ksoe.org/SCInvoiceController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SCInvoiceControllerSoapPort), 'http://ksoe.org/SCInvoiceController/action/SCInvoiceController.%operationName%');


end.
