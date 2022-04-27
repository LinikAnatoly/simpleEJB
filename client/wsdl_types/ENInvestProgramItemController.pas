unit ENInvestProgramItemController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,ENInvestProgramController
   ,TKMaterialsController
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

  ENInvestProgramItem            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramItemRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramItem = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
//???
    FinvestProgramRef : ENInvestProgramRef;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;
    property investProgramRef : ENInvestProgramRef read FinvestProgramRef write FinvestProgramRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
  end;

{
  ENInvestProgramItemFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    Fmodify_time : Int64;
    FuserAdd : WideString;
    FdateAdd : DateTime;
    FuserGen : WideString;
    FdateEdit : DateTime;
//???
    FinvestProgramRef : ENInvestProgramRef;
//???
    FmaterialRef : TKMaterialsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property modify_time : Int64 read Fmodify_time write Fmodify_time;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : DateTime;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : DateTime;
    property investProgramRef : ENInvestProgramRef read FinvestProgramRef write FinvestProgramRef;
    property materialRef : TKMaterialsRef read FmaterialRef write FmaterialRef;
  end;
}

  ENInvestProgramItemFilter = class(ENInvestProgramItem)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInvestProgramItemShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FcommentGen : WideString;
    FcountGen : TXSDecimal;
    Fprice : TXSDecimal;
    FsumGen : TXSDecimal;
    Fquarter1count : TXSDecimal;
    Fquarter1sum : TXSDecimal;
    Fquarter2count : TXSDecimal;
    Fquarter2sum : TXSDecimal;
    Fquarter3count : TXSDecimal;
    Fquarter3sum : TXSDecimal;
    Fquarter4count : TXSDecimal;
    Fquarter4sum : TXSDecimal;
    FuserAdd : WideString;
    FdateAdd : TXSDateTime;
    FuserGen : WideString;
    FdateEdit : TXSDateTime;
    FinvestProgramRefCode : Integer;
    FinvestProgramRefName : WideString;
    FinvestProgramRefYearGen : Integer;
    FinvestProgramRefCommentGen : WideString;
    FinvestProgramRefCountGen : TXSDecimal;
    FinvestProgramRefPrice : TXSDecimal;
    FinvestProgramRefSumGen : TXSDecimal;
    FinvestProgramRefQuarter1count : TXSDecimal;
    FinvestProgramRefQuarter1sum : TXSDecimal;
    FinvestProgramRefQuarter2count : TXSDecimal;
    FinvestProgramRefQuarter2sum : TXSDecimal;
    FinvestProgramRefQuarter3count : TXSDecimal;
    FinvestProgramRefQuarter3sum : TXSDecimal;
    FinvestProgramRefQuarter4count : TXSDecimal;
    FinvestProgramRefQuarter4sum : TXSDecimal;
    FinvestProgramRefUserAdd : WideString;
    FinvestProgramRefDateAdd : TXSDateTime;
    FinvestProgramRefUserGen : WideString;
    FinvestProgramRefDateEdit : TXSDateTime;
    FmaterialRefCode : Integer;
    FmaterialRefName : WideString;
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FmaterialRefCost : TXSDecimal;
    FmaterialRefDeliveryDate : Integer;
    FmaterialRefNumkatalog : WideString;
    FmaterialRefIdentid : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property commentGen : WideString read FcommentGen write FcommentGen;
    property countGen : TXSDecimal read FcountGen write FcountGen;
    property price : TXSDecimal read Fprice write Fprice;
    property sumGen : TXSDecimal read FsumGen write FsumGen;
    property quarter1count : TXSDecimal read Fquarter1count write Fquarter1count;
    property quarter1sum : TXSDecimal read Fquarter1sum write Fquarter1sum;
    property quarter2count : TXSDecimal read Fquarter2count write Fquarter2count;
    property quarter2sum : TXSDecimal read Fquarter2sum write Fquarter2sum;
    property quarter3count : TXSDecimal read Fquarter3count write Fquarter3count;
    property quarter3sum : TXSDecimal read Fquarter3sum write Fquarter3sum;
    property quarter4count : TXSDecimal read Fquarter4count write Fquarter4count;
    property quarter4sum : TXSDecimal read Fquarter4sum write Fquarter4sum;
    property userAdd : WideString read FuserAdd write FuserAdd;
    property dateAdd : TXSDateTime read FdateAdd write FdateAdd;
    property userGen : WideString read FuserGen write FuserGen;
    property dateEdit : TXSDateTime read FdateEdit write FdateEdit;

    property investProgramRefCode : Integer read FinvestProgramRefCode write FinvestProgramRefCode;
    property investProgramRefName : WideString read FinvestProgramRefName write FinvestProgramRefName;
    property investProgramRefYearGen : Integer read FinvestProgramRefYearGen write FinvestProgramRefYearGen;
    property investProgramRefCommentGen : WideString read FinvestProgramRefCommentGen write FinvestProgramRefCommentGen;
    property investProgramRefCountGen : TXSDecimal read FinvestProgramRefCountGen write FinvestProgramRefCountGen;
    property investProgramRefPrice : TXSDecimal read FinvestProgramRefPrice write FinvestProgramRefPrice;
    property investProgramRefSumGen : TXSDecimal read FinvestProgramRefSumGen write FinvestProgramRefSumGen;
    property investProgramRefQuarter1count : TXSDecimal read FinvestProgramRefQuarter1count write FinvestProgramRefQuarter1count;
    property investProgramRefQuarter1sum : TXSDecimal read FinvestProgramRefQuarter1sum write FinvestProgramRefQuarter1sum;
    property investProgramRefQuarter2count : TXSDecimal read FinvestProgramRefQuarter2count write FinvestProgramRefQuarter2count;
    property investProgramRefQuarter2sum : TXSDecimal read FinvestProgramRefQuarter2sum write FinvestProgramRefQuarter2sum;
    property investProgramRefQuarter3count : TXSDecimal read FinvestProgramRefQuarter3count write FinvestProgramRefQuarter3count;
    property investProgramRefQuarter3sum : TXSDecimal read FinvestProgramRefQuarter3sum write FinvestProgramRefQuarter3sum;
    property investProgramRefQuarter4count : TXSDecimal read FinvestProgramRefQuarter4count write FinvestProgramRefQuarter4count;
    property investProgramRefQuarter4sum : TXSDecimal read FinvestProgramRefQuarter4sum write FinvestProgramRefQuarter4sum;
    property investProgramRefUserAdd : WideString read FinvestProgramRefUserAdd write FinvestProgramRefUserAdd;
    property investProgramRefDateAdd : TXSDateTime read FinvestProgramRefDateAdd write FinvestProgramRefDateAdd;
    property investProgramRefUserGen : WideString read FinvestProgramRefUserGen write FinvestProgramRefUserGen;
    property investProgramRefDateEdit : TXSDateTime read FinvestProgramRefDateEdit write FinvestProgramRefDateEdit;
    property materialRefCode : Integer read FmaterialRefCode write FmaterialRefCode;
    property materialRefName : WideString read FmaterialRefName write FmaterialRefName;
    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property materialRefCost : TXSDecimal read FmaterialRefCost write FmaterialRefCost;
    property materialRefDeliveryDate : Integer read FmaterialRefDeliveryDate write FmaterialRefDeliveryDate;
    property materialRefNumkatalog : WideString read FmaterialRefNumkatalog write FmaterialRefNumkatalog;
    property materialRefIdentid : WideString read FmaterialRefIdentid write FmaterialRefIdentid;
  end;

  ArrayOfENInvestProgramItemShort = array of ENInvestProgramItemShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestProgramItemShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestProgramItemShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestProgramItemShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestProgramItemController/message/
  // soapAction: http://ksoe.org/ENInvestProgramItemController/action/ENInvestProgramItemController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestProgramItemControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestProgramItemController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestProgramItemControllerSoapPort = interface(IInvokable)
  ['{775CCED3-9115-4C9A-B36E-0FEED5110336}']
    function add(const aENInvestProgramItem: ENInvestProgramItem): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestProgramItem: ENInvestProgramItem); stdcall;
    function getObject(const anObjectCode: Integer): ENInvestProgramItem; stdcall;
    function getList: ENInvestProgramItemShortList; stdcall;
    function getFilteredList(const aENInvestProgramItemFilter: ENInvestProgramItemFilter): ENInvestProgramItemShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramItemShortList; stdcall;
    function getScrollableFilteredList(const aENInvestProgramItemFilter: ENInvestProgramItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramItemShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramItemShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInvestProgramItemFilter: ENInvestProgramItemFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInvestProgramItemShort; stdcall;

    //function getMaterialsFromPlans(aInvestProgramCode: Integer): ENInvestProgramItemShortList; stdcall;
  end;


implementation

  destructor ENInvestProgramItem.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRef) then
      investProgramRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;

{
  destructor ENInvestProgramItemFilter.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRef) then
      investProgramRef.Free;
    if Assigned(FmaterialRef) then
      materialRef.Free;
    inherited Destroy;
  end;
}

  destructor ENInvestProgramItemFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENInvestProgramItemShort.Destroy;
  begin
    if Assigned(FcountGen) then
      countGen.Free;
    if Assigned(Fprice) then
      price.Free;
    if Assigned(FsumGen) then
      sumGen.Free;
    if Assigned(Fquarter1count) then
      quarter1count.Free;
    if Assigned(Fquarter1sum) then
      quarter1sum.Free;
    if Assigned(Fquarter2count) then
      quarter2count.Free;
    if Assigned(Fquarter2sum) then
      quarter2sum.Free;
    if Assigned(Fquarter3count) then
      quarter3count.Free;
    if Assigned(Fquarter3sum) then
      quarter3sum.Free;
    if Assigned(Fquarter4count) then
      quarter4count.Free;
    if Assigned(Fquarter4sum) then
      quarter4sum.Free;
    if Assigned(FdateAdd) then
      dateAdd.Free;
    if Assigned(FdateEdit) then
      dateEdit.Free;
    if Assigned(FinvestProgramRefCountGen) then
      investProgramRefCountGen.Free;
    if Assigned(FinvestProgramRefPrice) then
      investProgramRefPrice.Free;
    if Assigned(FinvestProgramRefSumGen) then
      investProgramRefSumGen.Free;
    if Assigned(FinvestProgramRefQuarter1count) then
      investProgramRefQuarter1count.Free;
    if Assigned(FinvestProgramRefQuarter1sum) then
      investProgramRefQuarter1sum.Free;
    if Assigned(FinvestProgramRefQuarter2count) then
      investProgramRefQuarter2count.Free;
    if Assigned(FinvestProgramRefQuarter2sum) then
      investProgramRefQuarter2sum.Free;
    if Assigned(FinvestProgramRefQuarter3count) then
      investProgramRefQuarter3count.Free;
    if Assigned(FinvestProgramRefQuarter3sum) then
      investProgramRefQuarter3sum.Free;
    if Assigned(FinvestProgramRefQuarter4count) then
      investProgramRefQuarter4count.Free;
    if Assigned(FinvestProgramRefQuarter4sum) then
      investProgramRefQuarter4sum.Free;
    if Assigned(FinvestProgramRefDateAdd) then
      investProgramRefDateAdd.Free;
    if Assigned(FinvestProgramRefDateEdit) then
      investProgramRefDateEdit.Free;
    if Assigned(FmaterialRefCost) then
      materialRefCost.Free;
    inherited Destroy;
  end;

  destructor ENInvestProgramItemShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestProgramItem, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramItem');
  RemClassRegistry.RegisterXSClass(ENInvestProgramItemRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramItemRef');
  RemClassRegistry.RegisterXSClass(ENInvestProgramItemFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramItemFilter');
  RemClassRegistry.RegisterXSClass(ENInvestProgramItemShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramItemShort');
  RemClassRegistry.RegisterXSClass(ENInvestProgramItemShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramItemShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestProgramItemShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestProgramItemShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestProgramItemControllerSoapPort), 'http://ksoe.org/ENInvestProgramItemController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestProgramItemControllerSoapPort), 'http://ksoe.org/ENInvestProgramItemController/action/ENInvestProgramItemController.%operationName%');


end.
