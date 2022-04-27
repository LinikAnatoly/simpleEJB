unit ENInvestProgramController;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns, EnergyProController, EnergyProController2
   ,TKMeasurementController
   ,ENElementController
   ,ENDepartmentController
   ,ENInvestProgramStatusController
   ,ENInvestObjectTypeController
   ,ENPlanWorkTypeController
   ,ENInvestProgramGroupsController
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

  ENInvestProgram            = class;                 { "http://ksoe.org/EnergyproControllerService/type/" }



  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgramRef = class(TRemotable)
  private
    Fcode: Integer;
  published
    property code: Integer read Fcode write Fcode;
  end;


  // ************************************************************************ //
  // Namespace : http://ksoe.org/EnergyproControllerService/type/
  // ************************************************************************ //
  ENInvestProgram = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FitemNumber : WideString;
    FyearGen : Integer;
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
    Fmeasurement : TKMeasurement;
//???
    FelementRef : ENElementRef;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FstatusRef : ENInvestProgramStatusRef;
//???
    FobjectTypeRef : ENInvestObjectTypeRef;
//???
    FplanTypeRef : ENPlanWorkTypeRef;
//???
    FinvGroupRef : ENInvestProgramGroupsRef;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property  yearGen : Integer read FyearGen write FyearGen;
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
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
    property statusRef : ENInvestProgramStatusRef read FstatusRef write FstatusRef;
    property objectTypeRef : ENInvestObjectTypeRef read FobjectTypeRef write FobjectTypeRef;
    property planTypeRef : ENPlanWorkTypeRef read FplanTypeRef write FplanTypeRef;
    property invGroupRef : ENInvestProgramGroupsRef read FinvGroupRef write FinvGroupRef;
  end;

{
  ENInvestProgramFilter = class(TRemotable)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
    Fcode : Integer;
    Fname : WideString;
    FitemNumber : WideString;
    FyearGen : Integer;
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
    Fmeasurement : TKMeasurement;
//???
    FelementRef : ENElementRef;
//???
    FbudgetRef : ENDepartmentRef;
//???
    FstatusRef : ENInvestProgramStatusRef;
//???
    FobjectTypeRef : ENInvestObjectTypeRef;
//???
    FplanTypeRef : ENPlanWorkTypeRef;
//???
    FinvGroupRef : ENInvestProgramGroupsRef;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property  yearGen : Integer read FyearGen write FyearGen;
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
    property measurement : TKMeasurement read Fmeasurement write Fmeasurement;
    property elementRef : ENElementRef read FelementRef write FelementRef;
    property budgetRef : ENDepartmentRef read FbudgetRef write FbudgetRef;
    property statusRef : ENInvestProgramStatusRef read FstatusRef write FstatusRef;
    property objectTypeRef : ENInvestObjectTypeRef read FobjectTypeRef write FobjectTypeRef;
    property planTypeRef : ENPlanWorkTypeRef read FplanTypeRef write FplanTypeRef;
    property invGroupRef : ENInvestProgramGroupsRef read FinvGroupRef write FinvGroupRef;
  end;
}

  ENInvestProgramFilter = class(ENInvestProgram)
  private
    FconditionSQL: WideString;
    ForderBySQL: WideString;
  public
    destructor Destroy; override;
  published
    property conditionSQL: WideString read FconditionSQL write FconditionSQL;
    property orderBySQL: WideString read ForderBySQL write ForderBySQL;
  end;

  ENInvestProgramShort = class(TRemotable)
  private
    Fcode : Integer;
    Fname : WideString;
    FitemNumber : WideString;
    FyearGen : Integer;
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
    FmeasurementCode : Integer;
    FmeasurementName : WideString;
    FelementRefCode : Integer;
    FelementRefName : WideString;
    FinvNumber : WideString;
    FbudgetRefCode : Integer;
    FbudgetRefShortName : WideString;
    FbudgetRefDateStart : TXSDate;
    FbudgetRefDateFinal : TXSDate;
    FbudgetRefRenCode : Integer;
    FbudgetRefShpzBalans : WideString;
    FbudgetRefKau_table_id_1884 : Integer;
    FbudgetRefKau_1884 : WideString;
    FbudgetRefName_1884 : WideString;
    FstatusRefCode : Integer;
    FstatusRefName : WideString;
    FobjectTypeRefCode : Integer;
    FobjectTypeRefName : WideString;
    FplanTypeRefCode : Integer;
    FplanTypeRefName : WideString;
    FplanTypeRefShortName : WideString;
    FinvGroupRefCode : Integer;
    FinvGroupRefName : WideString;
    FinvGroupRefCommentgen : WideString;
  public
    destructor Destroy; override;
  published
    property  code : Integer read Fcode write Fcode;
    property name : WideString read Fname write Fname;
    property itemNumber : WideString read FitemNumber write FitemNumber;
    property  yearGen : Integer read FyearGen write FyearGen;
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

    property measurementCode : Integer read FmeasurementCode write FmeasurementCode;
    property measurementName : WideString read FmeasurementName write FmeasurementName;
    property elementRefCode : Integer read FelementRefCode write FelementRefCode;
    property elementRefName : WideString read FelementRefName write FelementRefName;
    property invNumber : WideString read FinvNumber write FinvNumber;
    property budgetRefCode : Integer read FbudgetRefCode write FbudgetRefCode;
    property budgetRefShortName : WideString read FbudgetRefShortName write FbudgetRefShortName;
    property budgetRefDateStart : TXSDate read FbudgetRefDateStart write FbudgetRefDateStart;
    property budgetRefDateFinal : TXSDate read FbudgetRefDateFinal write FbudgetRefDateFinal;
    property budgetRefRenCode : Integer read FbudgetRefRenCode write FbudgetRefRenCode;
    property budgetRefShpzBalans : WideString read FbudgetRefShpzBalans write FbudgetRefShpzBalans;
    property budgetRefKau_table_id_1884 : Integer read FbudgetRefKau_table_id_1884 write FbudgetRefKau_table_id_1884;
    property budgetRefKau_1884 : WideString read FbudgetRefKau_1884 write FbudgetRefKau_1884;
    property budgetRefName_1884 : WideString read FbudgetRefName_1884 write FbudgetRefName_1884;
    property statusRefCode : Integer read FstatusRefCode write FstatusRefCode;
    property statusRefName : WideString read FstatusRefName write FstatusRefName;
    property objectTypeRefCode : Integer read FobjectTypeRefCode write FobjectTypeRefCode;
    property objectTypeRefName : WideString read FobjectTypeRefName write FobjectTypeRefName;
    property planTypeRefCode : Integer read FplanTypeRefCode write FplanTypeRefCode;
    property planTypeRefName : WideString read FplanTypeRefName write FplanTypeRefName;
    property planTypeRefShortName : WideString read FplanTypeRefShortName write FplanTypeRefShortName;
    property invGroupRefCode : Integer read FinvGroupRefCode write FinvGroupRefCode;
    property invGroupRefName : WideString read FinvGroupRefName write FinvGroupRefName;
    property invGroupRefCommentgen : WideString read FinvGroupRefCommentgen write FinvGroupRefCommentgen;
  end;

  ArrayOfENInvestProgramShort = array of ENInvestProgramShort;  // { "http://ksoe.org/EnergyproControllerService/type/" }

  ENInvestProgramShortList = class(TRemotable)
  private
    FtotalCount: Integer;
    Flist: ArrayOfENInvestProgramShort;
  public
  destructor Destroy; override;
  published
    property totalCount: Integer read FtotalCount write FtotalCount;
    property list: ArrayOfENInvestProgramShort read Flist write Flist;
  end;

  ArrayOfInteger = array of Integer;

  // ************************************************************************ //
  // Namespace : http://ksoe.org/ENInvestProgramController/message/
  // soapAction: http://ksoe.org/ENInvestProgramController/action/ENInvestProgramController.%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : ENInvestProgramControllerSoapBinding
  // service   : EnergyproControllerService
  // port      : ENInvestProgramController
  // URL       : http://soap.ksoe.com.ua/energypro
  // ************************************************************************ //


  ENInvestProgramControllerSoapPort = interface(IInvokable)
  ['{1ee91ee9-1ee9-1ee9-1ee9-1ee91ee91ee9}']
    function add(const aENInvestProgram: ENInvestProgram): Integer; stdcall;
    procedure remove(const anObjectCode: Integer); stdcall;
    procedure save(const aENInvestProgram: ENInvestProgram); stdcall;
    function getObject(const anObjectCode: Integer): ENInvestProgram; stdcall;
    function getList: ENInvestProgramShortList; stdcall;
    function getFilteredList(const aENInvestProgramFilter: ENInvestProgramFilter): ENInvestProgramShortList; stdcall;
    function getScrollableList(const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramShortList; stdcall;
    function getScrollableFilteredList(const aENInvestProgramFilter: ENInvestProgramFilter; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramShortList; stdcall;
    function getScrollableListByCondition(const aCondition: WideString; const aFromPosition: Integer; const aQuantity: Integer): ENInvestProgramShortList; stdcall;
    function getScrollableFilteredCodeArray(const aENInvestProgramFilter: ENInvestProgramFilter; const aFromPosition: Integer; const aQuantity: Integer): ArrayOfInteger; stdcall;
    function getShortObject(const anObjectCode: Integer): ENInvestProgramShort; stdcall;

    procedure setFinancingCompleted(const anObjectCode: Integer); stdcall;
    //procedure fillItems(const aInvestProgramCode: Integer); stdcall;
  end;


implementation

  destructor ENInvestProgram.Destroy;
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
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FobjectTypeRef) then
      objectTypeRef.Free;
    if Assigned(FplanTypeRef) then
      planTypeRef.Free;
    if Assigned(FinvGroupRef) then
      invGroupRef.Free;
    inherited Destroy;
  end;

{
  destructor ENInvestProgramFilter.Destroy;
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
    if Assigned(Fmeasurement) then
      measurement.Free;
    if Assigned(FelementRef) then
      elementRef.Free;
    if Assigned(FbudgetRef) then
      budgetRef.Free;
    if Assigned(FstatusRef) then
      statusRef.Free;
    if Assigned(FobjectTypeRef) then
      objectTypeRef.Free;
    if Assigned(FplanTypeRef) then
      planTypeRef.Free;
    if Assigned(FinvGroupRef) then
      invGroupRef.Free;
    inherited Destroy;
  end;
}

  destructor ENInvestProgramFilter.Destroy;
  begin
    inherited Destroy;
  end;

  destructor ENInvestProgramShort.Destroy;
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
    if Assigned(FbudgetRefDateStart) then
      budgetRefDateStart.Free;
    if Assigned(FbudgetRefDateFinal) then
      budgetRefDateFinal.Free;
    inherited Destroy;
  end;

  destructor ENInvestProgramShortList.Destroy;
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

  RemClassRegistry.RegisterXSClass(ENInvestProgram, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgram');
  RemClassRegistry.RegisterXSClass(ENInvestProgramRef, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramRef');
  RemClassRegistry.RegisterXSClass(ENInvestProgramFilter, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramFilter');
  RemClassRegistry.RegisterXSClass(ENInvestProgramShort, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramShort');
  RemClassRegistry.RegisterXSClass(ENInvestProgramShortList, 'http://ksoe.org/EnergyproControllerService/type/', 'ENInvestProgramShortList');
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfENInvestProgramShort), 'http://ksoe.org/EnergyproControllerService/type/', 'ArrayOfENInvestProgramShort');

  InvRegistry.RegisterInterface(TypeInfo(ENInvestProgramControllerSoapPort), 'http://ksoe.org/ENInvestProgramController/message/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ENInvestProgramControllerSoapPort), 'http://ksoe.org/ENInvestProgramController/action/ENInvestProgramController.%operationName%');


end.
